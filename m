Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07C8C782940
	for <lists+linux-leds@lfdr.de>; Mon, 21 Aug 2023 14:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233451AbjHUMgb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Aug 2023 08:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233109AbjHUMga (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Aug 2023 08:36:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2BDCBE
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 05:36:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3BBAE60DDE
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 12:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D30FC433C8;
        Mon, 21 Aug 2023 12:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692621388;
        bh=NsFBidOr4jaeoaMol+QQ1LaIWQphjG12JPUbN9WwROg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D2cngKnoS22mKF7wyDbuFXhh2XSGxL8V2w5Y7IjWtHCsxguJYKTRRYFksTh1WVZFq
         E3UMMzTH+4Tx7XMslIPzF3VNmZ/lja6+h96UYtpA4cqzWgpQzcgkOBseKvSx1p2yGZ
         nhC9JB/wLbLvyK5qIbG/NhrGevTxp1H8537w2n2kLVGE8wDV6I2TnBZoFCu6TuBdOU
         fqm5UHLHNarNeUAieCslrvDzE7dqtEIk9Fo0bdbhbMN938ubaaJl2UBSTdsRGia6k6
         c7mRT4Agfz4fbMln67BU6nPDS0tLjFFSRKSgkMx2sioRgw9UkJs3KCCJcJdhY41zSN
         /lFu1BFC+pLag==
Date:   Mon, 21 Aug 2023 13:36:24 +0100
From:   Lee Jones <lee@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 5/6] leds: turris-omnia: support HW controlled mode
 via private trigger
Message-ID: <20230821123624.GK1380343@google.com>
References: <20230802160748.11208-1-kabel@kernel.org>
 <20230802160748.11208-6-kabel@kernel.org>
 <20230818090921.GQ986605@google.com>
 <20230821123411.6ea98dac@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230821123411.6ea98dac@dellmb>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 21 Aug 2023, Marek Behún wrote:

> On Fri, 18 Aug 2023 10:09:21 +0100
> Lee Jones <lee@kernel.org> wrote:
> 
> > > +	if (!err) {
> > > +		/* put the LED into MCU controlled mode */  
> > 
> > Nit: You improved the comment above to be more grammatically correct by
> > starting with an uppercase character.  Please continue with this
> > improvement for all comments there in.
> 
> OK.
> 
> > > +static struct led_trigger omnia_hw_trigger = {
> > > +	.name		= "omnia-mcu",
> > > +	.activate	= omnia_hwtrig_activate,
> > > +	.deactivate	= omnia_hwtrig_deactivate,
> > > +	.trigger_type	= &omnia_hw_trigger_type,  
> > 
> > Not sure I understand this interface.
> > 
> > Why not just set a bool instead of carrying around an empty struct?
> 
> Let me explain:
> 
> So, if a LED class device has the same trigger type as a LED trigger,
> the trigger will be available for that LED (it is listed in the sysfs
> trigger file and can be chosen).
> 
> So we have a mechanism to "pair" a LED with a given trigger, to make it
> possible for the LED core to distinguish whether a given trigger is
> available for the LED.
> 
> A boolean information would not be enough: if we used a bool, we would
> know that the trigger is private. But the LED core would not know for
> which LEDs the trigger should be avaiable.
> 
> In pseudocode:
> 
> list_triggers_for_led(led) {
>   for (trigger in trigger_list) {
>     if (!trigger.trigger_type || trigger.trigger_type ==
>                                  led.trigger_type)
>       trigger is available for led
>     else 
>       trigger is not available for led
>   }
> }
> 
> Is this explaination good enough?

Yes, thank you.

-- 
Lee Jones [李琼斯]
