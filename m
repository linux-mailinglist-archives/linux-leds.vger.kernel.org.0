Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 175E82710ED
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 00:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgISWPw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 18:15:52 -0400
Received: from lists.nic.cz ([217.31.204.67]:49934 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726582AbgISWPw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 18:15:52 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 97A701409ED;
        Sun, 20 Sep 2020 00:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600553749; bh=7ITrmLZWO/ZI6xM5DenDYi9HJmtvgnVeQGlMWurqThM=;
        h=From:To:Date;
        b=I6XbyMubl2uTIiIdvdGNLMNk1mdqldBzoqzGz4BiDdE6rEtGzBAecOdd/R/pC6g8l
         hGJxqU7Je7Xv/ZkJKdAQ1MrLl6DplSX9fsLHUyyTnQ/3GNwl3dx3D53PczbA2gYSpx
         dMpvmPevaCWDu4p1HPrtx4J0kma/D4qAReTNXPZU=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH leds + devicetree 01/13] leds: tca6507: Absorb platform data
Date:   Sun, 20 Sep 2020 00:15:36 +0200
Message-Id: <20200919221548.29984-2-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919221548.29984-1-marek.behun@nic.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The only in-tree usage of this driver is via device-tree. No on else
includes linux/leds-tca6507.h, so absorb the definition of platdata
structure.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: NeilBrown <neilb@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/leds/leds-tca6507.c  | 11 ++++++++++-
 include/linux/leds-tca6507.h | 21 ---------------------
 2 files changed, 10 insertions(+), 22 deletions(-)
 delete mode 100644 include/linux/leds-tca6507.h

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index a7e9fd85b6dd5..b5b5bafe2176e 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -95,7 +95,6 @@
 #include <linux/i2c.h>
 #include <linux/gpio/driver.h>
 #include <linux/workqueue.h>
-#include <linux/leds-tca6507.h>
 #include <linux/of.h>
 
 /* LED select registers determine the source that drives LED outputs */
@@ -108,6 +107,16 @@
 #define TCA6507_LS_BLINK0	0x6	/* Blink at Bank0 rate */
 #define TCA6507_LS_BLINK1	0x7	/* Blink at Bank1 rate */
 
+struct tca6507_platform_data {
+	struct led_platform_data leds;
+#ifdef CONFIG_GPIOLIB
+	int gpio_base;
+	void (*setup)(unsigned gpio_base, unsigned ngpio);
+#endif
+};
+
+#define	TCA6507_MAKE_GPIO 1
+
 enum {
 	BANK0,
 	BANK1,
diff --git a/include/linux/leds-tca6507.h b/include/linux/leds-tca6507.h
deleted file mode 100644
index 50d330ed11005..0000000000000
--- a/include/linux/leds-tca6507.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * TCA6507 LED chip driver.
- *
- * Copyright (C) 2011 Neil Brown <neil@brown.name>
- */
-
-#ifndef __LINUX_TCA6507_H
-#define __LINUX_TCA6507_H
-#include <linux/leds.h>
-
-struct tca6507_platform_data {
-	struct led_platform_data leds;
-#ifdef CONFIG_GPIOLIB
-	int gpio_base;
-	void (*setup)(unsigned gpio_base, unsigned ngpio);
-#endif
-};
-
-#define	TCA6507_MAKE_GPIO 1
-#endif /* __LINUX_TCA6507_H*/
-- 
2.26.2

