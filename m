Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAA1F652AB
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2019 09:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbfGKHym (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 11 Jul 2019 03:54:42 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33702 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727680AbfGKHym (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 11 Jul 2019 03:54:42 -0400
Received: by mail-pl1-f195.google.com with SMTP id c14so2595274plo.0
        for <linux-leds@vger.kernel.org>; Thu, 11 Jul 2019 00:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hYtfM2/RqLpM2hXEpX7FtWSD8l6/1iktEw80gp1fK84=;
        b=Z45sdqgC7Kkk8TdXFHZ0WilnDg+eQNTJXAlhj2PtkVDAuAN6f0zMUXCckwn2w52d80
         pp1Qj6mmzI5bJrxXnoKhlRSPbtP43T+ILx18iktYKdL1Dl99NTYuCWP+xMDaux1wac9I
         gxMB9+vOs3b8ULrvJM8DGsXTEtppRlbereMDRDdGM3k8XP+6hMuGd67IDjPcnAzGp6v2
         PrVM8m+q1+n8OrzuEu/O2bKJA7ySrDnJATPnOO/cGJtlivOtjk1LMmWs37CnUixp32cX
         L57LvB0intCbFOV7QKrq6mC4Yvu3oSX1ftJKgM1ECdDzs10c/e35d/AkUdgZJx9zxQ62
         0wtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hYtfM2/RqLpM2hXEpX7FtWSD8l6/1iktEw80gp1fK84=;
        b=i+30e/RTY7s74qEIC0MmdabjWymw9akvdyRqkJfmunSK0eXNSInMvAHKueCENiRUA9
         TiyMG/TkoLnTFF28P8/uRuPqoZupJHADUlPsexX8rOnt7nile75S8ZYFHgwASbnbQuOo
         P9ZzYNo+jlMYF8gCbF5mifZMulx6sD5HW7JSo/6DV6WTA5A4iLCJZpmTafIS3i9VCZss
         uU6TIz2ormnMsPEI5B/HimKy2btV6MK5StB4tOzm/wZfB7qwIwCywpQX1iu+G1w/SxYG
         osdtL6+7zMI+Tkm3I5niGEagabU0LeiY8T0LfAFmKmjkkgVl8HYn4AufKSEMkQJDGUsv
         i3DQ==
X-Gm-Message-State: APjAAAWG9HxfoLY4G8qlNNpcvlqer671uptbGn4LBHVH99Vnfd2u6mWd
        6+tNFdmqxoU6967O2LCSFjM=
X-Google-Smtp-Source: APXvYqwRLt34P99IlO9yM/LXdEKK6Xa0y5b4fdzZjLaYPX5291yKF7jZ32Ft/CqCD3WrdSPfk3Qa3A==
X-Received: by 2002:a17:902:2926:: with SMTP id g35mr3045013plb.269.1562831681399;
        Thu, 11 Jul 2019 00:54:41 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
        by smtp.gmail.com with ESMTPSA id p2sm8424448pfb.118.2019.07.11.00.54.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 00:54:41 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     bgolaszewski@baylibre.com, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH v3] leds: max77650: Add of_node_put() before return
Date:   Thu, 11 Jul 2019 13:24:05 +0530
Message-Id: <20190711075405.12634-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190711074402.12257-1-nishkadg.linux@gmail.com>
References: <20190711074402.12257-1-nishkadg.linux@gmail.com>
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
Changes in v3:
- Add change log.
Changes in v2:
- Change subject line to match previous patches on the same file.
- Merge the of_node_put calls into a single call in a label at the end
  of the function instead of calling it separately for each return
  statement.

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

