Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8BE2122FB4
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 16:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727704AbfLQPHt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 10:07:49 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38277 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbfLQPHs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Dec 2019 10:07:48 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihERp-0008EC-JR; Tue, 17 Dec 2019 16:07:41 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihERp-0000VP-3j; Tue, 17 Dec 2019 16:07:41 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH v3 1/3] tty: rename tty_kopen() and add new function tty_kopen_shared()
Date:   Tue, 17 Dec 2019 16:07:34 +0100
Message-Id: <20191217150736.1479-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191217150736.1479-1-u.kleine-koenig@pengutronix.de>
References: <20191217150736.1479-1-u.kleine-koenig@pengutronix.de>
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

Introduce a new function tty_kopen_shared() that yields a struct
tty_struct. The semantic difference to tty_kopen() is that the tty is
expected to be used already. So rename tty_kopen() to
tty_kopen_exclusive() for clearness, adapt the single user and put the
common code in a new static helper function.

tty_kopen_shared is to be used to implement an LED trigger for tty
devices in one of the next patches.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/speakup/spk_ttyio.c |  2 +-
 drivers/tty/tty_io.c                | 58 ++++++++++++++++++++---------
 include/linux/tty.h                 |  5 ++-
 3 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/speakup/spk_ttyio.c b/drivers/staging/speakup/spk_ttyio.c
index 5a9eff08cb96..e9db06eae875 100644
--- a/drivers/staging/speakup/spk_ttyio.c
+++ b/drivers/staging/speakup/spk_ttyio.c
@@ -147,7 +147,7 @@ static int spk_ttyio_initialise_ldisc(struct spk_synth *synth)
 	if (ret)
 		return ret;
 
-	tty = tty_kopen(dev);
+	tty = tty_kopen_exclusive(dev);
 	if (IS_ERR(tty))
 		return PTR_ERR(tty);
 
diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index a1453fe10862..b718666ce73c 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -1875,22 +1875,7 @@ static struct tty_driver *tty_lookup_driver(dev_t device, struct file *filp,
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
@@ -1905,7 +1890,7 @@ struct tty_struct *tty_kopen(dev_t device)
 
 	/* check whether we're reopening an existing tty */
 	tty = tty_driver_lookup_tty(driver, NULL, index);
-	if (IS_ERR(tty))
+	if (IS_ERR(tty) || shared)
 		goto out;
 
 	if (tty) {
@@ -1923,7 +1908,44 @@ struct tty_struct *tty_kopen(dev_t device)
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
+ *	Opens an already existing tty
+ *	rnel. Performs the driver lookup,
+ *	makes sure it's not already opened and performs the first-time
+ *	tty initialization.
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
index bfa4e2ee94a9..d0bcf3226fb2 100644
--- a/include/linux/tty.h
+++ b/include/linux/tty.h
@@ -411,7 +411,8 @@ extern struct tty_struct *get_current_tty(void);
 /* tty_io.c */
 extern int __init tty_init(void);
 extern const char *tty_name(const struct tty_struct *tty);
-extern struct tty_struct *tty_kopen(dev_t device);
+extern struct tty_struct *tty_kopen_exclusive(dev_t device);
+extern struct tty_struct *tty_kopen_shared(dev_t device);
 extern void tty_kclose(struct tty_struct *tty);
 extern int tty_dev_name_to_number(const char *name, dev_t *number);
 extern int tty_ldisc_lock(struct tty_struct *tty, unsigned long timeout);
@@ -436,7 +437,7 @@ static inline int __init tty_init(void)
 { return 0; }
 static inline const char *tty_name(const struct tty_struct *tty)
 { return "(none)"; }
-static inline struct tty_struct *tty_kopen(dev_t device)
+static inline struct tty_struct *tty_kopen_exclusive(dev_t device)
 { return ERR_PTR(-ENODEV); }
 static inline void tty_kclose(struct tty_struct *tty)
 { }
-- 
2.24.0

