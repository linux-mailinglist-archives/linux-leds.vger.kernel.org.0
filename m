Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22686878B6
	for <lists+linux-leds@lfdr.de>; Thu,  2 Feb 2023 10:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbjBBJYB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 Feb 2023 04:24:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbjBBJX7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 Feb 2023 04:23:59 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C626F708
        for <linux-leds@vger.kernel.org>; Thu,  2 Feb 2023 01:23:57 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id qw12so4200188ejc.2
        for <linux-leds@vger.kernel.org>; Thu, 02 Feb 2023 01:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJR3j7UgcHI8drkrJokvDJuY/mtil1DqdGHf4t4Su9s=;
        b=HFf1Yg0hiyf7Ud6/Vt8BibDYkQo2daDFPEzRUHOyb+CttMOo56Ev8Nw0q1kBnA3tly
         5fKuFv3zk5LcnqlGRNae5lfl+iE+GKVrR92DTUpj1bTcj6OnZVbxXRYfRlxP6bsFBWli
         hHcAmvRRw9hjAG64KlevLHERnv3rn1OcuV68ak7avmw4DN7QQWIJBlr/6xpwQTYstimw
         tdRDqek2jERGQrZS6/hEUt2mSmUu9ugJInRStSh43SRza+qnsyPXNMApfDJzcJml6DKy
         /XQ5IzagkYFix8fFKXDE+2lpgr3zqzmauGMhL83Oi0IolTGUZi/aV7Fiu1tqKGwcVPa2
         M1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJR3j7UgcHI8drkrJokvDJuY/mtil1DqdGHf4t4Su9s=;
        b=JMovuwX4DYCHJ0OYI+rl8bXob81pXxyssvZAu8IYFvB7/RbpskE92SJqDA9nSXl+EI
         G1xWBGTTPKrj8dL4E/sQdHaJQT+MGPUwa1NRCxPgGYCf2eRLsM9zDLh0FKClzUbfWUgm
         PgdWbj9h8qJw7a04U7l8OayC4LRwPzZOfPv3lHuLJRTOHUmpMoqjhMzP1NU8ZdwEIyX6
         DcCoeQDpQymmLsxSUqajc8xAZJ3hUYsiQTWIcLK8i32n7Rhz+vllTZzweI+pAQ466+MK
         ZR9OZHyrctx8lUQ9t+zBilgJISGsK7jZfXhr4Bx8V9bZlQi3UQ6e866rAN5w55ozxU4I
         CxYQ==
X-Gm-Message-State: AO0yUKVE5FEkRyJnD8byO1iOqoM7ZHz3+ye9Qd3v/aEjhKs7p7uAjQqo
        lDcJ5e30lCkptp4ew+BIMfo3Rw==
X-Google-Smtp-Source: AK7set9CScJwmTYyFXHqel3Ljr+cMRX1jUgPHSMB/jaHklWgbW3tH5Z2mQ3Py6HbKbj9Fz1+QzyBzw==
X-Received: by 2002:a17:906:2a50:b0:888:c0b4:7f08 with SMTP id k16-20020a1709062a5000b00888c0b47f08mr5537360eje.29.1675329835902;
        Thu, 02 Feb 2023 01:23:55 -0800 (PST)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be. [78.22.137.109])
        by smtp.gmail.com with ESMTPSA id j4-20020a170906474400b00856ad9108e7sm11372658ejs.70.2023.02.02.01.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 01:23:55 -0800 (PST)
From:   Maarten Zanders <maarten.zanders@mind.be>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Maarten Zanders <maarten.zanders@mind.be>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] leds: lp55xx: configure internal charge pump
Date:   Thu,  2 Feb 2023 10:23:25 +0100
Message-Id: <20230202092325.21241-3-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230202092325.21241-1-maarten.zanders@mind.be>
References: <20230202092325.21241-1-maarten.zanders@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The LP55xx range of devices have an internal charge pump which
can (automatically) increase the output voltage towards the
LED's, boosting the output voltage to 4.5V.

Implement this option from the devicetree. When the setting
is not present it will operate in automatic mode as before.

Tested on LP55231. Datasheet analysis shows that LP5521, LP5523
and LP8501 are identical in topology and are modified in the
same way.

Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>
---
 drivers/leds/leds-lp5521.c                | 12 ++++++------
 drivers/leds/leds-lp5523.c                | 18 +++++++++++++-----
 drivers/leds/leds-lp55xx-common.c         | 14 ++++++++++++++
 drivers/leds/leds-lp8501.c                |  8 ++++++--
 include/linux/platform_data/leds-lp55xx.h |  3 +++
 5 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 19478d9c19a7..76c6b81afb38 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -58,14 +58,11 @@
 /* CONFIG register */
 #define LP5521_PWM_HF			0x40	/* PWM: 0 = 256Hz, 1 = 558Hz */
 #define LP5521_PWRSAVE_EN		0x20	/* 1 = Power save mode */
-#define LP5521_CP_MODE_OFF		0	/* Charge pump (CP) off */
-#define LP5521_CP_MODE_BYPASS		8	/* CP forced to bypass mode */
-#define LP5521_CP_MODE_1X5		0x10	/* CP forced to 1.5x mode */
-#define LP5521_CP_MODE_AUTO		0x18	/* Automatic mode selection */
+#define LP5521_CP_MODE_MASK		0x18	/* Charge pump mode */
+#define LP5521_CP_MODE_SHIFT		3
 #define LP5521_R_TO_BATT		0x04	/* R out: 0 = CP, 1 = Vbat */
 #define LP5521_CLK_INT			0x01	/* Internal clock */
-#define LP5521_DEFAULT_CFG		\
-	(LP5521_PWM_HF | LP5521_PWRSAVE_EN | LP5521_CP_MODE_AUTO)
+#define LP5521_DEFAULT_CFG		(LP5521_PWM_HF | LP5521_PWRSAVE_EN)
 
 /* Status */
 #define LP5521_EXT_CLK_USED		0x08
@@ -310,6 +307,9 @@ static int lp5521_post_init_device(struct lp55xx_chip *chip)
 	if (!lp55xx_is_extclk_used(chip))
 		val |= LP5521_CLK_INT;
 
+	val |= (chip->pdata->charge_pump_mode << LP5521_CP_MODE_SHIFT) &
+		LP5521_CP_MODE_MASK;
+
 	ret = lp55xx_write(chip, LP5521_REG_CONFIG, val);
 	if (ret)
 		return ret;
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index e08e3de1428d..b5d10d4252e6 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -57,8 +57,12 @@
 #define LP5523_AUTO_INC			0x40
 #define LP5523_PWR_SAVE			0x20
 #define LP5523_PWM_PWR_SAVE		0x04
-#define LP5523_CP_AUTO			0x18
+#define LP5523_CP_MODE_MASK		0x18
+#define LP5523_CP_MODE_SHIFT		3
 #define LP5523_AUTO_CLK			0x02
+#define LP5523_DEFAULT_CONFIG	\
+	(LP5523_AUTO_INC | LP5523_PWR_SAVE |\
+	 LP5523_AUTO_CLK | LP5523_PWM_PWR_SAVE)
 
 #define LP5523_EN_LEDTEST		0x80
 #define LP5523_LEDTEST_DONE		0x80
@@ -125,6 +129,7 @@ static void lp5523_set_led_current(struct lp55xx_led *led, u8 led_current)
 static int lp5523_post_init_device(struct lp55xx_chip *chip)
 {
 	int ret;
+	int val;
 
 	ret = lp55xx_write(chip, LP5523_REG_ENABLE, LP5523_ENABLE);
 	if (ret)
@@ -133,10 +138,13 @@ static int lp5523_post_init_device(struct lp55xx_chip *chip)
 	/* Chip startup time is 500 us, 1 - 2 ms gives some margin */
 	usleep_range(1000, 2000);
 
-	ret = lp55xx_write(chip, LP5523_REG_CONFIG,
-			    LP5523_AUTO_INC | LP5523_PWR_SAVE |
-			    LP5523_CP_AUTO | LP5523_AUTO_CLK |
-			    LP5523_PWM_PWR_SAVE);
+	val = LP5523_DEFAULT_CONFIG;
+
+	val |= (chip->pdata->charge_pump_mode << LP5523_CP_MODE_SHIFT) &
+	       LP5523_CP_MODE_MASK;
+
+	ret = lp55xx_write(chip, LP5523_REG_CONFIG, val);
+
 	if (ret)
 		return ret;
 
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index c1940964067a..086033860a6f 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -19,6 +19,8 @@
 #include <linux/slab.h>
 #include <linux/gpio/consumer.h>
 
+#include <dt-bindings/leds/leds-lp55xx.h>
+
 #include "leds-lp55xx-common.h"
 
 /* External clock rate */
@@ -691,6 +693,18 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 		i++;
 	}
 
+	ret = of_property_read_u8(np, "ti,charge-pump-mode",
+				  &pdata->charge_pump_mode);
+	if (ret) {
+		pdata->charge_pump_mode = LP55XX_CP_AUTO;
+	} else {
+		if (pdata->charge_pump_mode > LP55XX_CP_AUTO) {
+			dev_err(dev, "invalid charge pump mode %d\n",
+				pdata->charge_pump_mode);
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
 	of_property_read_string(np, "label", &pdata->label);
 	of_property_read_u8(np, "clock-mode", &pdata->clock_mode);
 
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index ae11a02c0ab2..f0e70e116919 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -53,10 +53,11 @@
 #define LP8501_PWM_PSAVE		BIT(7)
 #define LP8501_AUTO_INC			BIT(6)
 #define LP8501_PWR_SAVE			BIT(5)
-#define LP8501_CP_AUTO			0x18
+#define LP8501_CP_MODE_MASK		0x18
+#define LP8501_CP_MODE_SHIFT		3
 #define LP8501_INT_CLK			BIT(0)
 #define LP8501_DEFAULT_CFG	\
-	(LP8501_PWM_PSAVE | LP8501_AUTO_INC | LP8501_PWR_SAVE | LP8501_CP_AUTO)
+	(LP8501_PWM_PSAVE | LP8501_AUTO_INC | LP8501_PWR_SAVE)
 
 #define LP8501_REG_RESET		0x3D
 #define LP8501_RESET			0xFF
@@ -102,6 +103,9 @@ static int lp8501_post_init_device(struct lp55xx_chip *chip)
 	if (chip->pdata->clock_mode != LP55XX_CLOCK_EXT)
 		val |= LP8501_INT_CLK;
 
+	val |= (chip->pdata->charge_pump_mode << LP8501_CP_MODE_SHIFT) &
+	       LP8501_CP_MODE_MASK;
+
 	ret = lp55xx_write(chip, LP8501_REG_CONFIG, val);
 	if (ret)
 		return ret;
diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
index 3441064713a3..9a738979e1ce 100644
--- a/include/linux/platform_data/leds-lp55xx.h
+++ b/include/linux/platform_data/leds-lp55xx.h
@@ -73,6 +73,9 @@ struct lp55xx_platform_data {
 	/* Clock configuration */
 	u8 clock_mode;
 
+	/* Charge pump mode */
+	u8 charge_pump_mode;
+
 	/* optional enable GPIO */
 	struct gpio_desc *enable_gpiod;
 
-- 
2.37.3

