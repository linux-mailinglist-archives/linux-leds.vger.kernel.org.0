Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D729A2DE165
	for <lists+linux-leds@lfdr.de>; Fri, 18 Dec 2020 11:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389188AbgLRKoR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Dec 2020 05:44:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389176AbgLRKoR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Dec 2020 05:44:17 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC61C0611C5
        for <linux-leds@vger.kernel.org>; Fri, 18 Dec 2020 02:42:55 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kqDDk-00006x-RO; Fri, 18 Dec 2020 11:42:48 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kqDDk-0004hT-21; Fri, 18 Dec 2020 11:42:48 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     linux-serial@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v10 2/3] tty: new helper function tty_get_icount()
Date:   Fri, 18 Dec 2020 11:42:45 +0100
Message-Id: <20201218104246.591315-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218104246.591315-1-u.kleine-koenig@pengutronix.de>
References: <20201218104246.591315-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

For a given struct tty_struct this yields the corresponding statistics
about sent and received characters (and some more) which is needed to
implement an LED trigger for tty devices.

The new function is then used to simplify tty_tiocgicount().

Reviewed-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/tty/tty_io.c | 29 +++++++++++++++++++++++++----
 include/linux/tty.h  |  2 ++
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index d0c1f97adc17..61b179f2ae42 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -2486,15 +2486,36 @@ static int tty_tiocmset(struct tty_struct *tty, unsigned int cmd,
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
index 7c3b5f156f03..3c689e9cd494 100644
--- a/include/linux/tty.h
+++ b/include/linux/tty.h
@@ -501,6 +501,8 @@ extern void tty_unthrottle(struct tty_struct *tty);
 extern int tty_throttle_safe(struct tty_struct *tty);
 extern int tty_unthrottle_safe(struct tty_struct *tty);
 extern int tty_do_resize(struct tty_struct *tty, struct winsize *ws);
+extern int tty_get_icount(struct tty_struct *tty,
+			  struct serial_icounter_struct *icount);
 extern int is_current_pgrp_orphaned(void);
 extern void tty_hangup(struct tty_struct *tty);
 extern void tty_vhangup(struct tty_struct *tty);
-- 
2.29.2

