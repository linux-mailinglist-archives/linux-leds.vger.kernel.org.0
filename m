Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B828AA377
	for <lists+linux-leds@lfdr.de>; Thu,  5 Sep 2019 14:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733120AbfIEMqt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Sep 2019 08:46:49 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40239 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732968AbfIEMqt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 Sep 2019 08:46:49 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1i5r9u-0004ai-Ij; Thu, 05 Sep 2019 14:46:42 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1i5r9t-0005ZA-Ls; Thu, 05 Sep 2019 14:46:41 +0200
Date:   Thu, 5 Sep 2019 14:46:41 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] led: triggers: Fix NULL dereference in led_trigger_set()
 error handling
Message-ID: <20190905124641.eo4a6ld77q2f2prl@pengutronix.de>
References: <20190905095728.GA26005@mwanda>
 <20190905120626.hyegecmy6hf5lvhj@pengutronix.de>
 <BC1CA967-2B9F-44A4-A1A9-FD9C6E874991@kaa.org.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BC1CA967-2B9F-44A4-A1A9-FD9C6E874991@kaa.org.ua>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Sep 05, 2019 at 03:23:21PM +0300, Oleh Kravchenko wrote:
> Hello Jacek,
> 
> > 5 вер. 2019 р. о 3:06 пп Uwe Kleine-König <u.kleine-koenig@pengutronix.de> написав(ла):
> > 
> > Hello,
> > 
> > On Thu, Sep 05, 2019 at 12:57:28PM +0300, Dan Carpenter wrote:
> >> The problem is we set "led_cdev->trigger = NULL;" and then dereference
> >> it when we call write_lock_irqsave():
> >> 
> >> 	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
> >>                            ^^^^^^^^^^^^^^^^^
> >> 
> >> Fixes: 2282e125a406 ("leds: triggers: let struct led_trigger::activate() return an error code")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > Obviously right. Thanks for catching.
> > 
> > Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > Did you find this at runtime or by using some static checker?
> 
> Let me summarize the chronology of the last activities below:
> 1. I have sent the patch for the bugs that I have found by static analyzer at PVS-Studio
>     Date: Wed, 4 Sep 2019 00:18:19 +0300
>     https://www.spinics.net/lists/linux-leds/msg13181.html
> 
> 2. At 5 Sep 2019 12:57:19 +0300 Time Dan Cartpen has sent the patch with the same proposal
> 3. Uwe Kleine-König started to discuss his results of review by asking Dan on how he was found it.
> 
> Would you mine if you will keep me as a Original author of this patch based on fact 1?

I don't care much personally but it seems fair to take Oleh's version. I
didn't see Oleh's patch before as only Dan's was Cc:d to me.

Feel free to add my Reviewed-by also to Oleh's patch of course.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
