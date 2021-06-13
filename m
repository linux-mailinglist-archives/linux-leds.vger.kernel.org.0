Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21CF83A516C
	for <lists+linux-leds@lfdr.de>; Sun, 13 Jun 2021 02:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhFMAIK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 12 Jun 2021 20:08:10 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:42717 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFMAIK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Jun 2021 20:08:10 -0400
Received: by mail-lj1-f178.google.com with SMTP id r16so14728085ljk.9
        for <linux-leds@vger.kernel.org>; Sat, 12 Jun 2021 17:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g/mSZoqPlWK6T+TfBIdgoZ0pB815FYg1CJaot/oFpRU=;
        b=gt/BexTNBowuvEBy9eSTww3uDf31/AEcH0FrTLIYwKuZlEGRUSgAHYRbehCbiJd0Ow
         7gelQwEwXAWlqLqOvQzzEMj4AOpvqvsyLswFb9Ed3en4+5yFMNyQjS69WmUz5O0oYgYZ
         sCU2P/p6dxpBteDu+qd2+w9kdh/xDtbklh2bZe3ORvbxjaFOPZTA9wlKoFB/mGhD0ZZO
         fwh/MU0Ply0693NRXgn/Tv9LJ7gm1HHf8Mg5BNOTpLonxIdW84pWlPl2FY/I7/lfvDM6
         UyJnUoI6qrLJmMoqJ144R+GHEKKbZ94yMVcjrsF9Xdd9lRbaQtu2h0hrMZTGRhluem+8
         GM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g/mSZoqPlWK6T+TfBIdgoZ0pB815FYg1CJaot/oFpRU=;
        b=fwNlqGzwkKc28hQPhgLhUfNoZ9SAfReefzzRRVgGn6wNIgpig12bVgvBdttGq5exfG
         BdkmI3kfTUZD/uFnTHYVreP4HTPUmfciCp66A/hFWkmeJy3vHwpqeBJo962RPPVwL62r
         veLXH5eTtCLGW8+ytwScaGgkd2WTaAzO1M4wQmwGTQA9WF0+Q0VDSMu9al6wWKbVVf0A
         qDoA9T0ZiJkH2sOQqDi8XDKp6LIFZYOuU/lnruKZj3k82KV0BP5l2SVqb8gNsYsThhNP
         jowgbHI/288sidYpfEqAyKQLYAHZtDLVwWFUJA13lPQXc3eI4f0kOFcdUNsO2mwSFXOO
         2M/Q==
X-Gm-Message-State: AOAM530SO4c5ZY0rSDGNF9cW2oXoB7htlSfX6+mNM0N63TPTIRnVPQNx
        S44Sob6lGW4dDTnIDoWK+M5BnQ==
X-Google-Smtp-Source: ABdhPJyZMxrL50IzSAsxzwXgymzE6Oa5v+XHpEVQLOvCACy5SKG5HrRkrOapqr9y3uJzF1VFm8xOTQ==
X-Received: by 2002:a05:651c:96:: with SMTP id 22mr8242236ljq.254.1623542708919;
        Sat, 12 Jun 2021 17:05:08 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id n10sm1022702lfl.104.2021.06.12.17.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 17:05:08 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/2] ARM: davinci: dm644x: Convert LEDs to GPIO descriptor table
Date:   Sun, 13 Jun 2021 02:03:01 +0200
Message-Id: <20210613000302.421268-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This converts the DaVinci DM644x LEDs to use GPIO
descriptor look-ups.

Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Rebase on v5.13-rc1
- Resend
- LED maintainers: please apply this patch, it is ACKed by a DaVinci
  maintainer
ChangeLog v2->v3:
- Rebase on v5.10-rc1
- Resend
ChangeLog v1->v2:
- Collect Bartosz' review tag
- Rebase on v5.9-rc1
- Resend
---
 arch/arm/mach-davinci/board-dm644x-evm.c | 46 +++++++++++++++---------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-davinci/board-dm644x-evm.c
index cce3a621eb20..d875c0e5d53d 100644
--- a/arch/arm/mach-davinci/board-dm644x-evm.c
+++ b/arch/arm/mach-davinci/board-dm644x-evm.c
@@ -319,17 +319,14 @@ static struct platform_device rtc_dev = {
 /* U2 -- LEDs */
 
 static struct gpio_led evm_leds[] = {
-	{ .name = "DS8", .active_low = 1,
-		.default_trigger = "heartbeat", },
-	{ .name = "DS7", .active_low = 1, },
-	{ .name = "DS6", .active_low = 1, },
-	{ .name = "DS5", .active_low = 1, },
-	{ .name = "DS4", .active_low = 1, },
-	{ .name = "DS3", .active_low = 1, },
-	{ .name = "DS2", .active_low = 1,
-		.default_trigger = "mmc0", },
-	{ .name = "DS1", .active_low = 1,
-		.default_trigger = "disk-activity", },
+	{ .name = "DS8", .default_trigger = "heartbeat", },
+	{ .name = "DS7", },
+	{ .name = "DS6", },
+	{ .name = "DS5", },
+	{ .name = "DS4", },
+	{ .name = "DS3", },
+	{ .name = "DS2", .default_trigger = "mmc0", },
+	{ .name = "DS1", .default_trigger = "disk-activity", },
 };
 
 static const struct gpio_led_platform_data evm_led_data = {
@@ -337,18 +334,35 @@ static const struct gpio_led_platform_data evm_led_data = {
 	.leds		= evm_leds,
 };
 
+static struct gpiod_lookup_table evm_leds_gpio_table = {
+	.dev_id = "leds-gpio.0",
+	.table = {
+		/*
+		 * These GPIOs are on a PCF8574 GPIO expander, which
+		 * is in turn named after the I2C device name. This is
+		 * device "u2" on I2C bus 1 with address 0x38.
+		 */
+		GPIO_LOOKUP_IDX("1-0038", 0, NULL, 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("1-0038", 1, NULL, 1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("1-0038", 2, NULL, 2, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("1-0038", 3, NULL, 3, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("1-0038", 4, NULL, 4, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("1-0038", 5, NULL, 5, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("1-0038", 6, NULL, 6, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("1-0038", 7, NULL, 7, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static struct platform_device *evm_led_dev;
 
 static int
 evm_led_setup(struct i2c_client *client, int gpio, unsigned ngpio, void *c)
 {
-	struct gpio_led *leds = evm_leds;
 	int status;
 
-	while (ngpio--) {
-		leds->gpio = gpio++;
-		leds++;
-	}
+	/* Add the lookup table */
+	gpiod_add_lookup_table(&evm_leds_gpio_table);
 
 	/* what an extremely annoying way to be forced to handle
 	 * device unregistration ...
-- 
2.31.1

