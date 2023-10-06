Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2847BBA27
	for <lists+linux-leds@lfdr.de>; Fri,  6 Oct 2023 16:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbjJFOYQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 6 Oct 2023 10:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbjJFOYQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 6 Oct 2023 10:24:16 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E1845C6
        for <linux-leds@vger.kernel.org>; Fri,  6 Oct 2023 07:24:14 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A1B7C15;
        Fri,  6 Oct 2023 07:24:53 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.37.158])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 893F93F641;
        Fri,  6 Oct 2023 07:24:13 -0700 (PDT)
Date:   Fri, 6 Oct 2023 15:24:04 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Marek Beh'un <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernen.org
Subject: Re: [PATCH] leds: Fix BUG_ON check for LED_COLOR_ID_MULTI that is
 always false
Message-ID: <ZSAYejE_cBw1kd_G@FVFF77S0Q05N.cambridge.arm.com>
References: <20230801151623.30387-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801151623.30387-1-kabel@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Aug 01, 2023 at 05:16:23PM +0200, Marek Beh'un wrote:
> At the time we call
>     BUG_ON(props.color == LED_COLOR_ID_MULTI);
> the props variable is still initialized to zero.
> 
> Call the BUG_ON only after we parse fwnode into props.
> 
> Fixes: 77dce3a22e89 ("leds: disallow /sys/class/leds/*:multi:* for now")
> Signed-off-by: Marek Beh'un <kabel@kernel.org>

I've just discovered this has broken boot on my Libre Computer
AML-A311D-CC-V0.2, which was working just fine with Debian 12's stock kernel:

  mark@stor-flodeboller:~$ uname -a
  Linux stor-flodeboller 6.1.0-12-arm64 #1 SMP Debian 6.1.52-1 (2023-09-07) aarch64 GNU/Linux

When upgrading to v6.6-rc3 for testing, the board dies at boot time due to the
BUG_ON() moved by this commit. That BUG_ON() provides no useful context for
solving the issue, and it's *distinctly* unhelpful.

I decompiled the DTB provided by the firmware, and it has:

| leds {  
|         compatible = "gpio-leds";
| 
|         led-yellow-green {
|                 color = <0x08>;
|                 function = "status";
|                 gpios = <0x16 0x44 0x01>;
|                 linux,default-trigger = "default-on";
|                 panic-indicator;
|         };
| 
|         led-blue {
|                 color = <0x03>;
|                 function = "activity";
|                 gpios = <0x16 0x48 0x01>;
|                 linux,default-trigger = "activity";
|         };
| };

... and IIUC LED_COLOR_ID_MULTI is 8, so the problem is the led-yellow-green
subnode. I presume that could use LED_COLOR_ID_RGB.

Can we please do something so that this doesn't prevent the board from booting?

Is there some reason we don't transparently convert LED_COLOR_ID_MULTI to
LED_COLOR_ID_RGB?

If that's not viable, could we skip the LED *without* crashing the kernel, so
that the board remains usable?

Thanks,
Mark.

> ---
>  drivers/leds/led-core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index b9b1295833c9..04f9ea675f2c 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -474,15 +474,15 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
>  	struct fwnode_handle *fwnode = init_data->fwnode;
>  	const char *devicename = init_data->devicename;
>  
> -	/* We want to label LEDs that can produce full range of colors
> -	 * as RGB, not multicolor */
> -	BUG_ON(props.color == LED_COLOR_ID_MULTI);
> -
>  	if (!led_classdev_name)
>  		return -EINVAL;
>  
>  	led_parse_fwnode_props(dev, fwnode, &props);
>  
> +	/* We want to label LEDs that can produce full range of colors
> +	 * as RGB, not multicolor */
> +	BUG_ON(props.color == LED_COLOR_ID_MULTI);
> +
>  	if (props.label) {
>  		/*
>  		 * If init_data.devicename is NULL, then it indicates that
> -- 
> 2.41.0
> 
> 
