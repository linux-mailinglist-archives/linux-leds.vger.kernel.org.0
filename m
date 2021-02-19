Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDDB31F9F1
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 14:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhBSNdw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 08:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbhBSNdv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 08:33:51 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698CCC061574
        for <linux-leds@vger.kernel.org>; Fri, 19 Feb 2021 05:33:11 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lD5u9-0007P5-88; Fri, 19 Feb 2021 14:33:09 +0100
Received: from ukl by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lD5u8-0001aI-P2; Fri, 19 Feb 2021 14:33:08 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kernel@pengutronix.de, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH v2 0/2] Fixes for the tty ledtrigger
Date:   Fri, 19 Feb 2021 14:33:05 +0100
Message-Id: <20210219133307.4840-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

this drops the unused label that the kernel test robot found. Thanks for
catching that.

I also added Pavel's Ack.

Best regards
Uwe

Uwe Kleine-König (2):
  leds: trigger: Fix error path to not unlock the unlocked mutex
  leds: trigger/tty: Use led_set_brightness_sync() from workqueue

 drivers/leds/trigger/ledtrig-tty.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

Range-diff against v1:
1:  7fc10ce8eb8b ! 1:  ed39ad41cd91 leds: trigger: Fix error path to not unlock the unlocked mutex
    @@ Commit message
     
         Reported-by: Pavel Machek <pavel@ucw.cz>
         Fixes: fd4a641ac88f ("leds: trigger: implement a tty trigger")
    +    Acked-by: Pavel Machek <pavel@ucw.cz>
         Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
     
      ## drivers/leds/trigger/ledtrig-tty.c ##
    @@ drivers/leds/trigger/ledtrig-tty.c: static ssize_t ttyname_store(struct device *
      	} else {
      		ttyname = NULL;
      	}
    +@@ drivers/leds/trigger/ledtrig-tty.c: static ssize_t ttyname_store(struct device *dev,
    + 
    + 	trigger_data->ttyname = ttyname;
    + 
    +-out_unlock:
    + 	mutex_unlock(&trigger_data->mutex);
    + 
    + 	if (ttyname && !running)
2:  fe3d28f4a786 ! 2:  a812318f4cfc leds: trigger/tty: Use led_set_brightness_sync() from workqueue
    @@ Commit message
     
         Reported-by: Pavel Machek <pavel@ucw.cz>
         Fixes: fd4a641ac88f ("leds: trigger: implement a tty trigger")
    +    Acked-by: Pavel Machek <pavel@ucw.cz>
         Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
     
      ## drivers/leds/trigger/ledtrig-tty.c ##
-- 
2.29.2

