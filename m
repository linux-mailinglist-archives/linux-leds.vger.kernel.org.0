Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73BF217498
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jul 2020 19:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbgGGRAO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Jul 2020 13:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728326AbgGGRAN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jul 2020 13:00:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C91DC061755
        for <linux-leds@vger.kernel.org>; Tue,  7 Jul 2020 10:00:12 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jsqwt-0004FR-U5; Tue, 07 Jul 2020 19:00:03 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jsqws-00038s-Rt; Tue, 07 Jul 2020 19:00:02 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     kernel@pengutronix.de, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v7 2/3] tty: new helper function tty_get_icount()
Date:   Tue,  7 Jul 2020 18:59:57 +0200
Message-Id: <20200707165958.16522-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707165958.16522-1-u.kleine-koenig@pengutronix.de>
References: <20200707165958.16522-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

For a given struct tty_struct this yields the corresponding statistics
about sent and received characters (and some more) which is needed to
implement an LED trigger for tty devices.

The new function is then used to simplify tty_tiocgicount().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/tty/tty_io.c | 29 +++++++++++++++++++++++++----
 include/linux/tty.h  |  2 ++
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 05d42f226304..6decc3ae1fb1 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -2488,15 +2488,36 @@ static int tty_tiocmset(struct tty_struct *tty, unsigned int cmd,
 	return tty->ops->tiocmset(tty, set, clear);
 }
 
+/**
+ *	tty_get_icount		-	get tty statistics
+ *	@tty: tty device
+ *	@icount: output parameter
+ *
+ *	Gets a copy of the tty's icount statistics.
+ *
+ *	Locking: none (up to the driver)
+ */
+int tty_get_icount(struct tty_struct *tty,
+		   struct serial_icounter_struct *icount)
+{
+	memset(icount, 0, sizeof(*icount));
+
+	if (tty->ops->get_icount)
+		return tty->ops->get_icount(tty, icount);
+	else
+		return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(tty_get_icount);
+
 static int tty_tiocgicount(struct tty_struct *tty, void __user *arg)
 {
-	int retval = -EINVAL;
 	struct serial_icounter_struct icount;
-	memset(&icount, 0, sizeof(icount));
-	if (tty->ops->get_icount)
-		retval = tty->ops->get_icount(tty, &icount);
+	int retval;
+
+	retval = tty_get_icount(tty, &icount);
 	if (retval != 0)
 		return retval;
+
 	if (copy_to_user(arg, &icount, sizeof(icount)))
 		return -EFAULT;
 	return 0;
diff --git a/include/linux/tty.h b/include/linux/tty.h
index c867d6fe67c4..3ac812b347de 100644
--- a/include/linux/tty.h
+++ b/include/linux/tty.h
@@ -497,6 +497,8 @@ extern void tty_unthrottle(struct tty_struct *tty);
 extern int tty_throttle_safe(struct tty_struct *tty);
 extern int tty_unthrottle_safe(struct tty_struct *tty);
 extern int tty_do_resize(struct tty_struct *tty, struct winsize *ws);
+extern int tty_get_icount(struct tty_struct *tty,
+			  struct serial_icounter_struct *icount);
 extern int is_current_pgrp_orphaned(void);
 extern void tty_hangup(struct tty_struct *tty);
 extern void tty_vhangup(struct tty_struct *tty);
-- 
2.27.0

