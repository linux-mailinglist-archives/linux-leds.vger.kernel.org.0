Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 481DA16607B
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2020 16:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgBTPIw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Feb 2020 10:08:52 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36805 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728176AbgBTPIw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Feb 2020 10:08:52 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so4606404ljg.3
        for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2020 07:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dx9rTLCQ4iaM3Bi/M/OacRss3YIkZ4j//sttJk4Oyqg=;
        b=Jiw8A6IlqJivm9Q3EaUriaVq/uztkxOYpDHG8oug1ohPSIeOioXA4/O/JRyWpnmPB8
         Z4ZyjF9p77mHupmA5EuVWqfSguJx6TUAP+TI3wUThuWQxbCvnICR1wFuG+opIRXeNzkO
         y3GKnQDu+54G+Tjf4xlc1vH89FFA9QWhHfEd/z0h9nT1b5/uFIETJT7q0Y7AmKcCgh8p
         c9N7gRcrELqU0flsLZTrjLfbM+q4YIOoGV0wlioKNG7gpj//eMOjj9nbN41cusNPWuYg
         hx86jo+oJTVi2OADJC4r7Og9rTPYnTEZX/XXFBWrEF0itCQ1PmmRh4ns27kS+DYWDWnI
         2TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dx9rTLCQ4iaM3Bi/M/OacRss3YIkZ4j//sttJk4Oyqg=;
        b=CfZO5TN3sXpCTU8t/8//PJesENbPveCMlrdpNYqNrNN4iML04JrJ81vde0Qf90JLV/
         3YPsrqM3l8AqsmcGLxS6TAbw/ics9dYoO26V4SHXpcnwVlo5QAEYTWJQpbRweqKpbw0r
         9Caj0V2Gde1H1ym0g4bRBsZ/dvS4LfQ7UOQM5N3HoEJpDtGhm61wdMRo3+dh0iJ9ZTDP
         eaj6OcCllCRUakX9tIzuKPL1nvWZTlzidjLcS8Iga1NaPeCbv3hC+y4js/Xe21YOaVaD
         aDbWcgtfApGiULLQ7e6pEjmQNbcBz3ydf5/wugVIDZMx3ppgFJdxXdOvoK71hllWUIWY
         SQTQ==
X-Gm-Message-State: APjAAAUFRjZCQ/H/al8/FSewoAC1fvKoWU08qrtb9+MLBELCDurVSBI8
        6QzwJ96MQNmwdAZo9RQpHrr0yA==
X-Google-Smtp-Source: APXvYqx/xWZfnZjtHpj1htSOPcKgOSygY6L9R6MpZbt9Yodm3MpRn3Tcw2keyYomFcFy4CQrrXZl8g==
X-Received: by 2002:a2e:8016:: with SMTP id j22mr18125570ljg.24.1582211330519;
        Thu, 20 Feb 2020 07:08:50 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id q10sm1960004ljm.87.2020.02.20.07.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 07:08:49 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Simon Guinot <simon.guinot@sequanux.org>
Subject: [PATCH 1/2 v3] leds: ns2: Absorb platform data
Date:   Thu, 20 Feb 2020 16:08:32 +0100
Message-Id: <20200220150833.56542-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Nothing in the kernel includes the external header
<linux/platform_data/leds-kirkwood-ns2.h> so just push the
contents into the ns2 leds driver. If someone wants to use
platform data or board files to describe this device they
should be able to do so using GPIO machine descriptors but
in any case device tree should be the way forward for these
systems in all cases I can think of, and the driver already
supports that.

Cc: Vincent Donnefort <vdonnefort@gmail.com>
Tested-by: Simon Guinot <simon.guinot@sequanux.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Move header inclusion changes over to patch 2/2
ChangeLog v1->v2:
- Collect Simon's Tested-by tag
---
 drivers/leds/leds-ns2.c                       | 27 ++++++++++++-
 .../linux/platform_data/leds-kirkwood-ns2.h   | 38 -------------------
 2 files changed, 26 insertions(+), 39 deletions(-)
 delete mode 100644 include/linux/platform_data/leds-kirkwood-ns2.h

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 7c500dfdcfa3..aefac3461138 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -15,11 +15,36 @@
 #include <linux/gpio.h>
 #include <linux/leds.h>
 #include <linux/module.h>
-#include <linux/platform_data/leds-kirkwood-ns2.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include "leds.h"
 
+enum ns2_led_modes {
+	NS_V2_LED_OFF,
+	NS_V2_LED_ON,
+	NS_V2_LED_SATA,
+};
+
+struct ns2_led_modval {
+	enum ns2_led_modes	mode;
+	int			cmd_level;
+	int			slow_level;
+};
+
+struct ns2_led {
+	const char	*name;
+	const char	*default_trigger;
+	unsigned	cmd;
+	unsigned	slow;
+	int		num_modes;
+	struct ns2_led_modval *modval;
+};
+
+struct ns2_led_platform_data {
+	int		num_leds;
+	struct ns2_led	*leds;
+};
+
 /*
  * The Network Space v2 dual-GPIO LED is wired to a CPLD. Three different LED
  * modes are available: off, on and SATA activity blinking. The LED modes are
diff --git a/include/linux/platform_data/leds-kirkwood-ns2.h b/include/linux/platform_data/leds-kirkwood-ns2.h
deleted file mode 100644
index eb8a6860e816..000000000000
--- a/include/linux/platform_data/leds-kirkwood-ns2.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/*
- * Platform data structure for Network Space v2 LED driver
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
- */
-
-#ifndef __LEDS_KIRKWOOD_NS2_H
-#define __LEDS_KIRKWOOD_NS2_H
-
-enum ns2_led_modes {
-	NS_V2_LED_OFF,
-	NS_V2_LED_ON,
-	NS_V2_LED_SATA,
-};
-
-struct ns2_led_modval {
-	enum ns2_led_modes	mode;
-	int			cmd_level;
-	int			slow_level;
-};
-
-struct ns2_led {
-	const char	*name;
-	const char	*default_trigger;
-	unsigned	cmd;
-	unsigned	slow;
-	int		num_modes;
-	struct ns2_led_modval *modval;
-};
-
-struct ns2_led_platform_data {
-	int		num_leds;
-	struct ns2_led	*leds;
-};
-
-#endif /* __LEDS_KIRKWOOD_NS2_H */
-- 
2.24.1

