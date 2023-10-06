Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE2B7BBB61
	for <lists+linux-leds@lfdr.de>; Fri,  6 Oct 2023 17:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbjJFPLn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 6 Oct 2023 11:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbjJFPLm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 6 Oct 2023 11:11:42 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 18EA8DB
        for <linux-leds@vger.kernel.org>; Fri,  6 Oct 2023 08:11:41 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13AA211FB;
        Fri,  6 Oct 2023 08:12:20 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.37.158])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F2553F5A1;
        Fri,  6 Oct 2023 08:11:40 -0700 (PDT)
Date:   Fri, 6 Oct 2023 16:11:33 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Lee Jones <lee@kernel.org>
Cc:     Marek Beh'un <kabel@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: Fix BUG_ON check for LED_COLOR_ID_MULTI that is
 always false
Message-ID: <ZSAjpeHy0Sbvdctv@FVFF77S0Q05N.cambridge.arm.com>
References: <20230801151623.30387-1-kabel@kernel.org>
 <ZSAYejE_cBw1kd_G@FVFF77S0Q05N.cambridge.arm.com>
 <ZSAcKoRFop-NCsFG@FVFF77S0Q05N.cambridge.arm.com>
 <20231006144518.GD808963@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006144518.GD808963@google.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Oct 06, 2023 at 03:45:18PM +0100, Lee Jones wrote:
> On Fri, 06 Oct 2023, Mark Rutland wrote:
> > On Fri, Oct 06, 2023 at 03:24:04PM +0100, Mark Rutland wrote:
> > > On Tue, Aug 01, 2023 at 05:16:23PM +0200, Marek Beh'un wrote:
> > > > At the time we call
> > > >     BUG_ON(props.color == LED_COLOR_ID_MULTI);
> > > > the props variable is still initialized to zero.
> > > > 
> > > > Call the BUG_ON only after we parse fwnode into props.
> > > > 
> > > > Fixes: 77dce3a22e89 ("leds: disallow /sys/class/leds/*:multi:* for now")
> > > > Signed-off-by: Marek Beh'un <kabel@kernel.org>
> > > 
> > > I've just discovered this has broken boot on my Libre Computer
> > > AML-A311D-CC-V0.2, which was working just fine with Debian 12's stock kernel:
> > 
> > Sorry the the noise; I've just spotted this is fixed by:
> > 
> >   https://lore.kernel.org/linux-leds/20230918140724.18634-1-kabel@kernel.org/
> > 
> > ... and I look forward to that hitting mainline :)
> 
> Your long agonising wait is over:
> 
> commit 9dc1664fab2246bc2c3e9bf2cf21518a857f9b5b
> Author: Marek Beh'un <kabel@kernel.org>
> Date:   Mon Sep 18 16:07:24 2023 +0200
> 
>     leds: Drop BUG_ON check for LED_COLOR_ID_MULTI
>     
>     Commit c3f853184bed ("leds: Fix BUG_ON check for LED_COLOR_ID_MULTI that
>     is always false") fixed a no-op BUG_ON. This turned out to cause a
>     regression, since some in-tree device-tree files already use
>     LED_COLOR_ID_MULTI.
>     
>     Drop the BUG_ON altogether.
>     
>     Fixes: c3f853184bed ("leds: Fix BUG_ON check for LED_COLOR_ID_MULTI that is always false")
>     Reported-by: Da Xue <da@libre.computer>
>     Closes: https://lore.kernel.org/linux-leds/ZQLelWcNjjp2xndY@duo.ucw.cz/T/
>     Signed-off-by: Marek Beh'un <kabel@kernel.org>
>     Link: https://lore.kernel.org/r/20230918140724.18634-1-kabel@kernel.org
>     Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/leds/led-core.c | 4 ----
>  1 file changed, 4 deletions(-)

Ah, doubly sorry then! I must've messed up when checking the logs for
drivers/leds/...

Thanks, regardless!

Mark.
