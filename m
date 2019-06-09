Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A00483AB77
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730944AbfFITJP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:09:15 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54548 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730883AbfFITJP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:09:15 -0400
Received: by mail-wm1-f68.google.com with SMTP id g135so6488727wme.4;
        Sun, 09 Jun 2019 12:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0j3GNwLEKjidPPM+BOUfFd0nez6NDh9+FVvWkEWVf/o=;
        b=glQaEpT300nLlHbbw3csPutgxZcPBGfJepX5/VNCYhmObweGI78GGRX7y0igfs0JmJ
         vhtyIapF9qDB1v372lQwv55+ptCHk7uS7ipUMF41CsLnz/arTbxmcJ2+luZUX5cJOd7S
         ziIZFhMYA2ytpnisvbJGlB2j2pLt279AdNTI3li/2hgBHK/6yfYMmpGLRXIiln1sfW7o
         6RwM65pVx1TYntUSI25DC+PKM9nArvYpV0vc+5awUyv4wPglqWcqHkXPhwapbDsSu5us
         kNAKAnqSWCwucW2u7zi/xP7fnVjtmrviPi3BIphHsxO9P7KJMOn5n88whTdXiosqJjoh
         QRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0j3GNwLEKjidPPM+BOUfFd0nez6NDh9+FVvWkEWVf/o=;
        b=fzT9M56Mp75TgmqU1kLLfHw4JxCCSb1XTVGLqgpTlxeV4Yan3zCHaUDyBJ1DTLKYHU
         dZYd50q4eC8uiq6YYqfN+gNmlUWdO8gD0LWbQ49W1y/RcqRvRz1njMPJlxlVXHVLFH2H
         s9wNzehEKfINFhZqm86BLAvfoCqUw7jlIOEAiDTJuxt4yDLBTFyRNiNnEz0H2Tlo1Obp
         896AxcLbTCNRRg2g43TcuNLgZYKP1UhQYpdxeG9j63PuUOPgjDjzj7lzbV3qNBE4NdAK
         a7j3M3NPOqPLW/pKbGRnJEfnzFNAB1hwbYHo5AsX8xM860X8whUBtOMcNFqU2xuMpnDX
         MELA==
X-Gm-Message-State: APjAAAVxBJRsQLlLzaSnlgQ0CjaHykG1xycae8q2AXg+UKJEFbpreRuH
        ilM9xe+5Xkkn+SYmSKP8NC6LD9KA
X-Google-Smtp-Source: APXvYqytoX6daNdqiy8RQrRIyNKEkvIoHKecT6VZfrkw/F3EStq0PN8573SYT+8p1jE4Bqv0ZChIFg==
X-Received: by 2002:a05:600c:291:: with SMTP id 17mr10596516wmk.32.1560107352702;
        Sun, 09 Jun 2019 12:09:12 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.09.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:09:12 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Simon Shields <simon@lineageos.org>
Subject: [PATCH v5 25/26] leds: an30259a: Use generic support for composing LED names
Date:   Sun,  9 Jun 2019 21:08:02 +0200
Message-Id: <20190609190803.14815-26-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Simon Shields <simon@lineageos.org>
---
 drivers/leds/leds-an30259a.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
index 1c1f0c8c56f4..fa722d45269e 100644
--- a/drivers/leds/leds-an30259a.c
+++ b/drivers/leds/leds-an30259a.c
@@ -13,7 +13,6 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
-#include <uapi/linux/uleds.h>
 
 #define AN30259A_MAX_LEDS 3
 
@@ -54,6 +53,8 @@
 #define AN30259A_BLINK_MAX_TIME 7500 /* ms */
 #define AN30259A_SLOPE_RESOLUTION 500 /* ms */
 
+#define AN30259A_NAME "an30259a"
+
 #define STATE_OFF 0
 #define STATE_KEEP 1
 #define STATE_ON 2
@@ -62,11 +63,11 @@ struct an30259a;
 
 struct an30259a_led {
 	struct an30259a *chip;
+	struct fwnode_handle *fwnode;
 	struct led_classdev cdev;
 	u32 num;
 	u32 default_state;
 	bool sloping;
-	char label[LED_MAX_NAME_SIZE];
 };
 
 struct an30259a {
@@ -226,14 +227,7 @@ static int an30259a_dt_init(struct i2c_client *client,
 
 		led->num = source;
 		led->chip = chip;
-
-		if (of_property_read_string(child, "label", &str))
-			snprintf(led->label, sizeof(led->label), "an30259a::");
-		else
-			snprintf(led->label, sizeof(led->label), "an30259a:%s",
-				 str);
-
-		led->cdev.name = led->label;
+		led->fwnode = of_fwnode_handle(child);
 
 		if (!of_property_read_string(child, "default-state", &str)) {
 			if (!strcmp(str, "on"))
@@ -312,13 +306,20 @@ static int an30259a_probe(struct i2c_client *client)
 	chip->regmap = devm_regmap_init_i2c(client, &an30259a_regmap_config);
 
 	for (i = 0; i < chip->num_leds; i++) {
+		struct led_init_data init_data = {};
+
 		an30259a_init_default_state(&chip->leds[i]);
 		chip->leds[i].cdev.brightness_set_blocking =
 			an30259a_brightness_set;
 		chip->leds[i].cdev.blink_set = an30259a_blink_set;
 
-		err = devm_led_classdev_register(&client->dev,
-						 &chip->leds[i].cdev);
+		init_data.fwnode = chip->leds[i].fwnode;
+		init_data.devicename = AN30259A_NAME;
+		init_data.default_label = ":";
+
+		err = devm_led_classdev_register_ext(&client->dev,
+						 &chip->leds[i].cdev,
+						 &init_data);
 		if (err < 0)
 			goto exit;
 	}
-- 
2.11.0

