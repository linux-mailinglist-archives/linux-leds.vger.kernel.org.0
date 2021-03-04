Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68DBB32D28D
	for <lists+linux-leds@lfdr.de>; Thu,  4 Mar 2021 13:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240102AbhCDMHW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Mar 2021 07:07:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240115AbhCDMHH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Mar 2021 07:07:07 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2AA9C061574;
        Thu,  4 Mar 2021 04:06:21 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id a188so1354134pfb.4;
        Thu, 04 Mar 2021 04:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EswTFml0EovRZwvm7N+4Am/tWxHry/QaP9co8emx5Hk=;
        b=a0HrgnIAEDY/HQ8da6220TFE87D1clxuZAAav1yXnUxnd6wYjuWpKakktdDaNYZ4sD
         t3AC67kg4N7+tBHJ00LN1x0sbN17PILZqRwzjflRzC9Nh6tGyTCYNDgy4RRksZHAbgLH
         1ATI2C1B989SHO2v2xbklkuATe4YFg/g/JNcNk3ElG8oajobYuzsX9k8MTFsxDoOcTmV
         mnIYy4Vpm0qfGJ3Axu0ouhmCQZc68YsAep+YYfVFKCKHHBzHizk9pTaglrqgNZ1mXlbW
         6bAmIW5PVYWP65BsOocs+FaIO12FC6vKuNMTGv+Zh/Iqs4X5tobSSu7P/dcX/SQJzpz8
         tmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EswTFml0EovRZwvm7N+4Am/tWxHry/QaP9co8emx5Hk=;
        b=olqinUmF2FR6yqRYJL4H9NIjGZzPr6IjZCHpIpD5NvwHR2EuFz2lf8Te0dkT3Vbixh
         Ik0I/bou9R650XPl95n6aIWB6zoiJHmuPveAKQfoJfuzfqmXX52wM5FLnllNvlUF/gcB
         6TkErRZKpqbM2CRZJQnotw3ek2SRCsLrchhVwq1A9bNYYlVitfLhSZi8GBfhWrqhZ4hQ
         1SCj/46BLxtrOwBQZTpJhl0XQKQeH6y8QpcgM1jB8mVjt8mXLwkuEmcfWg1zDOdQYxvv
         xEIUPbSs5SM9LKjXlXcOdi9cZA58nEmpasamrXG9QukqqchxUJan5fLluGG7kp7vrapl
         qsKg==
X-Gm-Message-State: AOAM533pDN3z5dnYlOhK0cPbMY1BoiYHKqi57xzeMPJLbOURLP+WYniW
        vFzL+kRsMNT7Bi8DyuvL4JDl1pDhBgta1Q==
X-Google-Smtp-Source: ABdhPJyB5OMTWYjVcHiJk1EjQDyf+fDP7suWATkGBTtwT30EHbJ1Uf93hTaQKuLVG01M3MUAczs+SA==
X-Received: by 2002:a63:ee4b:: with SMTP id n11mr3497058pgk.265.1614859581174;
        Thu, 04 Mar 2021 04:06:21 -0800 (PST)
Received: from localhost.localdomain ([203.90.233.36])
        by smtp.gmail.com with ESMTPSA id y72sm28082394pfg.126.2021.03.04.04.06.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 04:06:20 -0800 (PST)
From:   qiuxiaojin <qxj511mail@gmail.com>
X-Google-Original-From: qiuxiaojin <qiuxiaojin@cvte.com>
To:     pavel@ucw.cz, dmurphy@ti.com, qiuxiaojin@cvte.com
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH] leds: add touch screen LED triggers
Date:   Thu,  4 Mar 2021 20:04:49 +0800
Message-Id: <20210304120449.10441-1-qiuxiaojin@cvte.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Some LED devices support touch screen.
This patch enables direct LED trigger controls by the driver.
touch screen or pressure can be done simply by other driver space.
Two trigger APIs are added, ledtrig_touch_panel_ctrl()
and ledtrig_touch_pressure_ctrl().

Signed-off-by: qiuxiaojin <qiuxiaojin@cvte.com>
---
 drivers/leds/trigger/Kconfig                |  6 +++
 drivers/leds/trigger/Makefile               |  1 +
 drivers/leds/trigger/ledtrig-touch-screen.c | 56 +++++++++++++++++++++
 include/linux/leds.h                        |  8 +++
 4 files changed, 71 insertions(+)
 create mode 100644 drivers/leds/trigger/ledtrig-touch-screen.c

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index ce9429ca6dde..e0802a71c4c2 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -144,4 +144,10 @@ config LEDS_TRIGGER_AUDIO
 	  the audio mute and mic-mute changes.
 	  If unsure, say N
 
+config LEDS_TRIGGER_TOUCH_SCREEN
+	tristate "LED Touch Screen Trigger"
+	help
+	  This allows LEDs to be controlled as a touch screen device.
+	  This enables direct touch on/off by the driver, kernel space.
+	  If unsure, say Y
 endif # LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
index 733a83e2a718..ff659f56f9ad 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+= ledtrig-panic.o
 obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
 obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
 obj-$(CONFIG_LEDS_TRIGGER_AUDIO)	+= ledtrig-audio.o
+obj-$(CONFIG_LEDS_TRIGGER_TOUCH_SCREEN)	+= ledtrig-touch-screen.o
diff --git a/drivers/leds/trigger/ledtrig-touch-screen.c b/drivers/leds/trigger/ledtrig-touch-screen.c
new file mode 100644
index 000000000000..9a80e9991f45
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-touch-screen.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Touch Screen Control Trigger
+ *
+ * based on ledtrig-camera.c
+ *
+ * Copyright 2013 Texas Instruments
+ *
+ * Author: Milo(Woogyom) Kim <milo.kim@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/leds.h>
+
+DEFINE_LED_TRIGGER(ledtrig_touch_panel);
+DEFINE_LED_TRIGGER(ledtrig_touch_pressure);
+
+void ledtrig_touch_panel_ctrl(bool on)
+{
+	enum led_brightness brt = on ? LED_FULL : LED_OFF;
+
+	led_trigger_event(ledtrig_touch_panel, brt);
+}
+EXPORT_SYMBOL_GPL(ledtrig_touch_panel_ctrl);
+
+void ledtrig_touch_pressure_ctrl(enum led_brightness brt)
+{
+	led_trigger_event(ledtrig_touch_pressure, brt);
+}
+EXPORT_SYMBOL_GPL(ledtrig_touch_pressure_ctrl);
+
+static int __init ledtrig_touch_screen_init(void)
+{
+	led_trigger_register_simple("ts_touch", &ledtrig_touch_panel);
+	led_trigger_register_simple("ts_pressure", &ledtrig_touch_pressure);
+	return 0;
+}
+module_init(ledtrig_touch_screen_init);
+
+static void __exit ledtrig_touch_screen_exit(void)
+{
+	led_trigger_unregister_simple(ledtrig_touch_pressure);
+	led_trigger_unregister_simple(ledtrig_touch_panel);
+}
+module_exit(ledtrig_touch_screen_exit);
+
+MODULE_DESCRIPTION("LED Trigger for Touch Screen Control");
+MODULE_AUTHOR("qiuxiaojin");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6a8d6409c993..cd1a4bd73185 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -481,6 +481,14 @@ static inline void ledtrig_flash_ctrl(bool on) {}
 static inline void ledtrig_torch_ctrl(bool on) {}
 #endif
 
+#if defined(CONFIG_LEDS_TRIGGER_TOUCH_SCREEN)
+extern void ledtrig_touch_panel_ctrl(bool on);
+extern void ledtrig_touch_pressure_ctrl(enum led_brightness brt);
+#else
+static inline void ledtrig_touch_panel_ctrl(bool on) {}
+static inline void ledtrig_touch_pressure_ctrl(enum led_brightness brt)
+#endif
+
 /*
  * Generic LED platform data for describing LED names and default triggers.
  */
-- 
2.21.0

