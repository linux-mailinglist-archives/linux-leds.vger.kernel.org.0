Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46EEF28B4A6
	for <lists+linux-leds@lfdr.de>; Mon, 12 Oct 2020 14:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388499AbgJLMeJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 12 Oct 2020 08:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388334AbgJLMeJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 12 Oct 2020 08:34:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04587C0613D0
        for <linux-leds@vger.kernel.org>; Mon, 12 Oct 2020 05:34:09 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kRx1f-0001Ex-N7; Mon, 12 Oct 2020 14:34:03 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kRx1c-0007So-Tr; Mon, 12 Oct 2020 14:34:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-leds@vger.kernel.org,
        linux-serial@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/3] tty: rename tty_kopen() and add new function tty_kopen_shared()
Date:   Mon, 12 Oct 2020 14:33:56 +0200
Message-Id: <20201012123358.1475928-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012123358.1475928-1-u.kleine-koenig@pengutronix.de>
References: <20201012123358.1475928-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Introduce a new function tty_kopen_shared() that yields a struct
tty_struct. The semantic difference to tty_kopen() is that the tty is
expected to be used already. So rename tty_kopen() to
tty_kopen_exclusive() for clearness, adapt the single user and put the
common code in a new static helper function.

tty_kopen_shared is to be used to implement an LED trigger for tty
devices in one of the next patches.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/accessibility/speakup/spk_ttyio.c |  2 +-
 drivers/tty/tty_io.c                      | 56 +++++++++++++++--------
 include/linux/tty.h                       |  5 +-
 3 files changed, 42 insertions(+), 21 deletions(-)

diff --git a/drivers/accessibility/speakup/spk_ttyio.c b/drivers/accessibility/speakup/spk_ttyio.c
index a831ff64f8ba..991b21017a01 100644
--- a/drivers/accessibility/speakup/spk_ttyio.c
+++ b/drivers/accessibility/speakup/spk_ttyio.c
@@ -149,7 +149,7 @@ static int spk_ttyio_initialise_ldisc(struct spk_synth *synth)
 	if (ret)
 		return ret;
 
-	tty = tty_kopen(dev);
+	tty = tty_kopen_exclusive(dev);
 	if (IS_ERR(tty))
 		return PTR_ERR(tty);
 
diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index ceed72c9a88f..8aede3d2c1e0 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -1871,22 +1871,7 @@ static struct tty_driver *tty_lookup_driver(dev_t device, struct file *filp,
 	return driver;
 }
 
-/**
- *	tty_kopen	-	open a tty device for kernel
- *	@device: dev_t of device to open
- *
- *	Opens tty exclusively for kernel. Performs the driver lookup,
- *	makes sure it's not already opened and performs the first-time
- *	tty initialization.
- *
- *	Returns the locked initialized &tty_struct
- *
- *	Claims the global tty_mutex to serialize:
- *	  - concurrent first-time tty initialization
- *	  - concurrent tty driver removal w/ lookup
- *	  - concurrent tty removal from driver table
- */
-struct tty_struct *tty_kopen(dev_t device)
+static struct tty_struct *tty_kopen(dev_t device, int shared)
 {
 	struct tty_struct *tty;
 	struct tty_driver *driver;
@@ -1901,7 +1886,7 @@ struct tty_struct *tty_kopen(dev_t device)
 
 	/* check whether we're reopening an existing tty */
 	tty = tty_driver_lookup_tty(driver, NULL, index);
-	if (IS_ERR(tty))
+	if (IS_ERR(tty) || shared)
 		goto out;
 
 	if (tty) {
@@ -1919,7 +1904,42 @@ struct tty_struct *tty_kopen(dev_t device)
 	tty_driver_kref_put(driver);
 	return tty;
 }
-EXPORT_SYMBOL_GPL(tty_kopen);
+
+/**
+ *	tty_kopen_exclusive	-	open a tty device for kernel
+ *	@device: dev_t of device to open
+ *
+ *	Opens tty exclusively for kernel. Performs the driver lookup,
+ *	makes sure it's not already opened and performs the first-time
+ *	tty initialization.
+ *
+ *	Returns the locked initialized &tty_struct
+ *
+ *	Claims the global tty_mutex to serialize:
+ *	  - concurrent first-time tty initialization
+ *	  - concurrent tty driver removal w/ lookup
+ *	  - concurrent tty removal from driver table
+ */
+struct tty_struct *tty_kopen_exclusive(dev_t device)
+{
+	return tty_kopen(device, 0);
+}
+EXPORT_SYMBOL_GPL(tty_kopen_exclusive);
+
+/**
+ *	tty_kopen_shared	-	open a tty device for shared in-kernel use
+ *	@device: dev_t of device to open
+ *
+ *	Opens an already existing tty for in-kernel use. Compared to
+ *	tty_kopen_exclusive() above it doesn't ensure to be the only user.
+ *
+ *	Locking is identical to tty_kopen() above.
+ */
+struct tty_struct *tty_kopen_shared(dev_t device)
+{
+	return tty_kopen(device, 1);
+}
+EXPORT_SYMBOL_GPL(tty_kopen_shared);
 
 /**
  *	tty_open_by_driver	-	open a tty device
diff --git a/include/linux/tty.h b/include/linux/tty.h
index a99e9b8e4e31..c867d6fe67c4 100644
--- a/include/linux/tty.h
+++ b/include/linux/tty.h
@@ -413,7 +413,8 @@ extern struct tty_struct *get_current_tty(void);
 /* tty_io.c */
 extern int __init tty_init(void);
 extern const char *tty_name(const struct tty_struct *tty);
-extern struct tty_struct *tty_kopen(dev_t device);
+extern struct tty_struct *tty_kopen_exclusive(dev_t device);
+extern struct tty_struct *tty_kopen_shared(dev_t device);
 extern void tty_kclose(struct tty_struct *tty);
 extern int tty_dev_name_to_number(const char *name, dev_t *number);
 extern int tty_ldisc_lock(struct tty_struct *tty, unsigned long timeout);
@@ -438,7 +439,7 @@ static inline int __init tty_init(void)
 { return 0; }
 static inline const char *tty_name(const struct tty_struct *tty)
 { return "(none)"; }
-static inline struct tty_struct *tty_kopen(dev_t device)
+static inline struct tty_struct *tty_kopen_exclusive(dev_t device)
 { return ERR_PTR(-ENODEV); }
 static inline void tty_kclose(struct tty_struct *tty)
 { }
-- 
2.28.0

