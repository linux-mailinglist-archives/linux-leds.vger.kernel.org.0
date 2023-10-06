Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBB347BBA76
	for <lists+linux-leds@lfdr.de>; Fri,  6 Oct 2023 16:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbjJFOjq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 6 Oct 2023 10:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjJFOjq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 6 Oct 2023 10:39:46 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E96288F
        for <linux-leds@vger.kernel.org>; Fri,  6 Oct 2023 07:39:44 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E19C5C15;
        Fri,  6 Oct 2023 07:40:23 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.37.158])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F3A33F641;
        Fri,  6 Oct 2023 07:39:44 -0700 (PDT)
Date:   Fri, 6 Oct 2023 15:39:38 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Marek Beh'un <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: Fix BUG_ON check for LED_COLOR_ID_MULTI that is
 always false
Message-ID: <ZSAcKoRFop-NCsFG@FVFF77S0Q05N.cambridge.arm.com>
References: <20230801151623.30387-1-kabel@kernel.org>
 <ZSAYejE_cBw1kd_G@FVFF77S0Q05N.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSAYejE_cBw1kd_G@FVFF77S0Q05N.cambridge.arm.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Oct 06, 2023 at 03:24:04PM +0100, Mark Rutland wrote:
> On Tue, Aug 01, 2023 at 05:16:23PM +0200, Marek Beh'un wrote:
> > At the time we call
> >     BUG_ON(props.color == LED_COLOR_ID_MULTI);
> > the props variable is still initialized to zero.
> > 
> > Call the BUG_ON only after we parse fwnode into props.
> > 
> > Fixes: 77dce3a22e89 ("leds: disallow /sys/class/leds/*:multi:* for now")
> > Signed-off-by: Marek Beh'un <kabel@kernel.org>
> 
> I've just discovered this has broken boot on my Libre Computer
> AML-A311D-CC-V0.2, which was working just fine with Debian 12's stock kernel:

Sorry the the noise; I've just spotted this is fixed by:

  https://lore.kernel.org/linux-leds/20230918140724.18634-1-kabel@kernel.org/

... and I look forward to that hitting mainline :)

Mark.
