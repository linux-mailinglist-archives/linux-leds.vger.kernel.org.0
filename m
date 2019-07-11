Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A03D26529A
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2019 09:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727743AbfGKHoR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 11 Jul 2019 03:44:17 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41045 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfGKHoQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 11 Jul 2019 03:44:16 -0400
Received: by mail-pg1-f193.google.com with SMTP id q4so2513544pgj.8
        for <linux-leds@vger.kernel.org>; Thu, 11 Jul 2019 00:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ri9bHj5HCMC+Wo/9G5FYaH6I/ZuEgsaw454KTs1aDJI=;
        b=pJczOSTcUNYZuvPPeK+Hy5RL5jO0oSlBdxDn+QkU8q2e32LbOe+x3Ce95t1VyaKBg0
         u3Xg7O8jzPdDzbToWmWLj4k5s5j2+g1r6OTYZTaJVH65KgSfHMcpPs9cxHSN7OIkcBGK
         Pnd8FNyldCte1G4+C/Z+MLVOYT1gBWzTaMTcKgrpvi3A0395fKmFlZzUaLzi0dXHFIsp
         IQF/8KU5W+LYH6CqtYRZH5OpFmBaocdnLugnoC4JF6d+Rj4eJmYB2D7LsuwdYZ4y70RT
         CcOqDzcPHF9tsV3FseZ5NlOBi/4BTEhqgkhMr5wPPnIO4TRFSRyKeoMRXB1pk/XZ5H7m
         69vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ri9bHj5HCMC+Wo/9G5FYaH6I/ZuEgsaw454KTs1aDJI=;
        b=dR18RmJwVnTkmEcmXWlCebHh4PIaXSfqUt4kQBDrEaydVUtdluEICuWoZo4Y5wet3A
         fsi/O353tbZ6+fsG7WpUcpRCmp+3g4nmjnlXHlwjeYVrOhOAmgkSbhYvoWEFc5iPtgPJ
         8pRbetn6F1kiMIBOqgvQprMY5sytz9C4lMWnT4tl2HJxvJhsACPi6O0iGIYDqXPosgH3
         /an4Pv9vq3tr+xN0lSoXhjux5bNokYSLYXN2YG0iu9v/0NyLvhG4934pUIoUvLUfWlE/
         HAJPkLxlgsqfx3CUZJ8DVVO7FepVNK5z62NmIs8R8LGMjQmIHIWk9kp94n4fXSj7gyGy
         6xIg==
X-Gm-Message-State: APjAAAUoHBFsc6rFLOzQlb1jr6hBTC0XPw0aitU3hIbR9oxK1dNRomB+
        euuDfm9RSICALQ2CJkZv714=
X-Google-Smtp-Source: APXvYqz2it+hOibP1gaBh2YNGnA3hkU8tVnImZHiWNC+0u0hpCsKRR7qFxSWHwF3/d5hbZ4HvK8juQ==
X-Received: by 2002:a63:e62:: with SMTP id 34mr2853985pgo.331.1562831056014;
        Thu, 11 Jul 2019 00:44:16 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
        by smtp.gmail.com with ESMTPSA id e63sm4125625pgc.62.2019.07.11.00.44.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 00:44:15 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     bgolaszewski@baylibre.com, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH v2] leds: max77650: Add of_node_put() before return
Date:   Thu, 11 Jul 2019 13:14:02 +0530
Message-Id: <20190711074402.12257-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a return from the middle of the loop, there is no put, thus
causing a memory leak.
Hence create a new label, err_node_put, which puts the previous node and
returns variable rv. Modify the mid-loop return statements to instead
store the return value in rv and jump to err_node_put.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/leds/leds-max77650.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index 6b74ce9cac12..1eb9998899e4 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -93,8 +93,10 @@ static int max77650_led_probe(struct platform_device *pdev)
 
 	for_each_child_of_node(of_node, child) {
 		rv = of_property_read_u32(child, "reg", &reg);
-		if (rv || reg >= MAX77650_LED_NUM_LEDS)
-			return -EINVAL;
+		if (rv || reg >= MAX77650_LED_NUM_LEDS) {
+			rv = -EINVAL;
+			goto err_node_put;
+		}
 
 		led = &leds[reg];
 		led->map = map;
@@ -109,8 +111,10 @@ static int max77650_led_probe(struct platform_device *pdev)
 		} else {
 			led->cdev.name = devm_kasprintf(dev, GFP_KERNEL,
 							"max77650:%s", label);
-			if (!led->cdev.name)
-				return -ENOMEM;
+			if (!led->cdev.name) {
+				rv = -ENOMEM;
+				goto err_node_put;
+			}
 		}
 
 		of_property_read_string(child, "linux,default-trigger",
@@ -118,20 +122,23 @@ static int max77650_led_probe(struct platform_device *pdev)
 
 		rv = devm_of_led_classdev_register(dev, child, &led->cdev);
 		if (rv)
-			return rv;
+			goto err_node_put;
 
 		rv = regmap_write(map, led->regA, MAX77650_LED_A_DEFAULT);
 		if (rv)
-			return rv;
+			goto err_node_put;
 
 		rv = regmap_write(map, led->regB, MAX77650_LED_B_DEFAULT);
 		if (rv)
-			return rv;
+			goto err_node_put;
 	}
 
 	return regmap_write(map,
 			    MAX77650_REG_CNFG_LED_TOP,
 			    MAX77650_LED_TOP_DEFAULT);
+err_node_put:
+	of_node_put(child);
+	return rv;
 }
 
 static struct platform_driver max77650_led_driver = {
-- 
2.19.1

