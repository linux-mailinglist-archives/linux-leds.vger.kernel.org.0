Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6543AB6F
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730770AbfFITJK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:09:10 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53602 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730659AbfFITJI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:09:08 -0400
Received: by mail-wm1-f68.google.com with SMTP id x15so6495904wmj.3;
        Sun, 09 Jun 2019 12:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=H5XnYMhzFtyFFN1fSCd9PIubqiCUTeCLqoHFgWTMKHU=;
        b=bW2i65Er5/E2yGstFsRcoXJrxgAvVSQ6pM01+Ujpv646zr/bvOT/VcrfpEZGeoYHe4
         NBHuwkq44T4XQf9syS1eWXhrq7f0RfhaZC80gxta+5ugWNq55gcywWdarbcm+/MmdD6b
         YNwUx6+cfFvf0O02tuYiJXgD/7tyOcGmyiNaBGrPe/EBcf2Nf4+THtVvkLAdeYhjVT6C
         aL1eD40k4sCRTNCAqZVDRE5BgtyHjLXqr/NBi0l3MuSmMsp96Nrqh7UWcI9pDenD3BaG
         6CA+zTVSFQr64LRcTUSpgqdw1QOt3muTlEtFZxaXjdpE/0egJGOgIoBpef/G4UNtV8gc
         xctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=H5XnYMhzFtyFFN1fSCd9PIubqiCUTeCLqoHFgWTMKHU=;
        b=qZbfZ5SZ5JCRTcGR2SvpPGu+jQSPDdHCTfg9ojL3FZ8XjnurW1OQOpIgKmXrGFqMMG
         SZtvQfwIhNOMcVATfFQBpDwO4V/WakrReyHhvigzdKHXjZDDa4mOPEt0pYpv656zef95
         CbqyPYqQFNivZ4MV52li9ifuEAT/RAzie3jUGi/MjbXZB4vPP7vVa1z9UEJ0tXw/fff4
         lfaMVHQXgWxIdm66XjV7gJ5AOLt2B4LSAm78t7idYWzciwaeSp4LzTMPlVifonygyjBf
         D6EC9MxN2f4D+tfWOMIl8XYk3h+xwSw7GtuZb9NyrSkm2nrIWn7Ww7Tp+0DH0YqzqFwf
         cCnA==
X-Gm-Message-State: APjAAAXiKJ6Daa2QAfp/VUZadC4EEMgn1799x3hbs7wOJqTG7WbdCZZF
        PDm6xVSvJCLs82Z1I+WbyeIuF+XC
X-Google-Smtp-Source: APXvYqwDp5oJCsLknDNh5UePh0gfBxTChYuSuJ+pnvb7mU0MZqiiPVtRuiI3s/A0txnounDYndx59A==
X-Received: by 2002:a1c:a002:: with SMTP id j2mr10768842wme.131.1560107345275;
        Sun, 09 Jun 2019 12:09:05 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.09.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:09:04 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v5 21/26] leds: as3645a: Use generic support for composing LED names
Date:   Sun,  9 Jun 2019 21:07:58 +0200
Message-Id: <20190609190803.14815-22-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

After switching to new led_classdev_register_ext() the validity
of struct led_classdev's name property is no longer guaranteed,
and therefore rely on struct device's kobj.name instead.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/leds/leds-as3645a.c | 74 +++++++++++++++++----------------------------
 1 file changed, 28 insertions(+), 46 deletions(-)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index 14ab6b0e4de9..a7126f45064e 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -124,11 +124,6 @@ struct as3645a_config {
 	u32 peak;
 };
 
-struct as3645a_names {
-	char flash[32];
-	char indicator[32];
-};
-
 struct as3645a {
 	struct i2c_client *client;
 
@@ -484,12 +479,10 @@ static int as3645a_detect(struct as3645a *flash)
 }
 
 static int as3645a_parse_node(struct as3645a *flash,
-			      struct as3645a_names *names,
 			      struct fwnode_handle *fwnode)
 {
 	struct as3645a_config *cfg = &flash->cfg;
 	struct fwnode_handle *child;
-	const char *name;
 	int rval;
 
 	fwnode_for_each_child_node(fwnode, child) {
@@ -517,17 +510,6 @@ static int as3645a_parse_node(struct as3645a *flash,
 		return -ENODEV;
 	}
 
-	rval = fwnode_property_read_string(flash->flash_node, "label", &name);
-	if (!rval) {
-		strlcpy(names->flash, name, sizeof(names->flash));
-	} else if (is_of_node(fwnode)) {
-		snprintf(names->flash, sizeof(names->flash),
-			 "%pOFn:flash", to_of_node(fwnode));
-	} else {
-		dev_err(&flash->client->dev, "flash node has no label!\n");
-		return -EINVAL;
-	}
-
 	rval = fwnode_property_read_u32(flash->flash_node, "flash-timeout-us",
 					&cfg->flash_timeout_us);
 	if (rval < 0) {
@@ -565,17 +547,6 @@ static int as3645a_parse_node(struct as3645a *flash,
 		goto out_err;
 	}
 
-	rval = fwnode_property_read_string(flash->indicator_node, "label",
-					   &name);
-	if (!rval) {
-		strlcpy(names->indicator, name, sizeof(names->indicator));
-	} else if (is_of_node(fwnode)) {
-		snprintf(names->indicator, sizeof(names->indicator),
-			 "%pOFn:indicator", to_of_node(fwnode));
-	} else {
-		dev_err(&flash->client->dev, "indicator node has no label!\n");
-		return -EINVAL;
-	}
 
 	rval = fwnode_property_read_u32(flash->indicator_node,
 					"led-max-microamp",
@@ -595,21 +566,25 @@ static int as3645a_parse_node(struct as3645a *flash,
 	return rval;
 }
 
-static int as3645a_led_class_setup(struct as3645a *flash,
-				   struct as3645a_names *names)
+static int as3645a_led_class_setup(struct as3645a *flash)
 {
 	struct led_classdev *fled_cdev = &flash->fled.led_cdev;
 	struct led_classdev *iled_cdev = &flash->iled_cdev;
+	struct led_init_data init_data = {};
 	struct led_flash_setting *cfg;
 	int rval;
 
-	iled_cdev->name = names->indicator;
 	iled_cdev->brightness_set_blocking = as3645a_set_indicator_brightness;
 	iled_cdev->max_brightness =
 		flash->cfg.indicator_max_ua / AS_INDICATOR_INTENSITY_STEP;
 	iled_cdev->flags = LED_CORE_SUSPENDRESUME;
 
-	rval = led_classdev_register(&flash->client->dev, iled_cdev);
+	init_data.fwnode = flash->indicator_node;
+	init_data.devicename = AS_NAME;
+	init_data.default_label = "indicator";
+
+	rval = led_classdev_register_ext(&flash->client->dev, iled_cdev,
+					 &init_data);
 	if (rval < 0)
 		return rval;
 
@@ -627,7 +602,6 @@ static int as3645a_led_class_setup(struct as3645a *flash,
 
 	flash->fled.ops = &as3645a_led_flash_ops;
 
-	fled_cdev->name = names->flash;
 	fled_cdev->brightness_set_blocking = as3645a_set_assist_brightness;
 	/* Value 0 is off in LED class. */
 	fled_cdev->max_brightness =
@@ -635,15 +609,23 @@ static int as3645a_led_class_setup(struct as3645a *flash,
 				       flash->cfg.assist_max_ua) + 1;
 	fled_cdev->flags = LED_DEV_CAP_FLASH | LED_CORE_SUSPENDRESUME;
 
-	rval = led_classdev_flash_register(&flash->client->dev, &flash->fled);
-	if (rval) {
-		led_classdev_unregister(iled_cdev);
-		dev_err(&flash->client->dev,
-			"led_classdev_flash_register() failed, error %d\n",
-			rval);
-	}
+	init_data.fwnode = flash->flash_node;
+	init_data.devicename = AS_NAME;
+	init_data.default_label = "flash";
+
+	rval = led_classdev_flash_register_ext(&flash->client->dev,
+					       &flash->fled, &init_data);
+	if (rval)
+		goto out_err;
 
 	return rval;
+
+out_err:
+	led_classdev_unregister(iled_cdev);
+	dev_err(&flash->client->dev,
+		"led_classdev_flash_register() failed, error %d\n",
+		rval);
+	return rval;
 }
 
 static int as3645a_v4l2_setup(struct as3645a *flash)
@@ -667,8 +649,9 @@ static int as3645a_v4l2_setup(struct as3645a *flash)
 		},
 	};
 
-	strlcpy(cfg.dev_name, led->name, sizeof(cfg.dev_name));
-	strlcpy(cfgind.dev_name, flash->iled_cdev.name, sizeof(cfg.dev_name));
+	strlcpy(cfg.dev_name, led->dev->kobj.name, sizeof(cfg.dev_name));
+	strlcpy(cfgind.dev_name, flash->iled_cdev.dev->kobj.name,
+		sizeof(cfg.dev_name));
 
 	flash->vf = v4l2_flash_init(
 		&flash->client->dev, flash->flash_node, &flash->fled, NULL,
@@ -689,7 +672,6 @@ static int as3645a_v4l2_setup(struct as3645a *flash)
 
 static int as3645a_probe(struct i2c_client *client)
 {
-	struct as3645a_names names;
 	struct as3645a *flash;
 	int rval;
 
@@ -702,7 +684,7 @@ static int as3645a_probe(struct i2c_client *client)
 
 	flash->client = client;
 
-	rval = as3645a_parse_node(flash, &names, dev_fwnode(&client->dev));
+	rval = as3645a_parse_node(flash, dev_fwnode(&client->dev));
 	if (rval < 0)
 		return rval;
 
@@ -717,7 +699,7 @@ static int as3645a_probe(struct i2c_client *client)
 	if (rval)
 		goto out_mutex_destroy;
 
-	rval = as3645a_led_class_setup(flash, &names);
+	rval = as3645a_led_class_setup(flash);
 	if (rval)
 		goto out_mutex_destroy;
 
-- 
2.11.0

