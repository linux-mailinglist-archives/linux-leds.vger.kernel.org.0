Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF47163A38
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jul 2019 19:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbfGIRfW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 9 Jul 2019 13:35:22 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43298 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfGIRfW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 9 Jul 2019 13:35:22 -0400
Received: by mail-pl1-f193.google.com with SMTP id cl9so10422616plb.10
        for <linux-leds@vger.kernel.org>; Tue, 09 Jul 2019 10:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sf+sLHKo6vQ8tlNQ5YrV+hSokUd1a5xTqG/ihiMQQyk=;
        b=IGRnz7NJlslMoB/rItMfli6SWhvLwrdk6aJia0xeM53hIJDnyOt9bfE56kPS5xI/7j
         6+R8m7iNS/DR6fnQAy37gQexIRmjQONFyNKTQY/JUp5x8l2ZP6SdfHvBu8RSgLt1A0Aw
         97p1oTtPjGtOncd5Z3UWTXPkZtdxn0zxgz9JEpQzNc7qeipdhnLxxHn82N3EAWmLWTRR
         mawEHLSiwItmlac0zGL2as5f4MU4mcc7I79fMIx/GBOI4zKW+bHeC0vOS0L288GmY6yk
         ZwrokXLahnu+nNgyVos1iZNLqiDXT8lUFc5qLDjTk8Xb4G1v9/dyzCKjdsgCvGI/V3Tv
         31Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sf+sLHKo6vQ8tlNQ5YrV+hSokUd1a5xTqG/ihiMQQyk=;
        b=a2FDHfKLuxZSNh+BVFbNOzYRW8cH+Lei/t8J1bq7C5CgUAyUhZpvt9rzo2yyG+rnNN
         ErGzYC6Z3fUht5y8Qhp2FLpxKmXmX5aCVXGIi+5VYYb9QMiGreoMjdB5XeQLRgE0Uhpy
         Ipjg9dVIJ9NqkaZTpwJyLwiIvfqgjR4Q9UVZYNzGI3oqSddcveZwPadlraV+y6pL0V/R
         DEl1cCNdxgUX+i/iGkw/Nvdobx5VTDX0ALw2DXfag0GRPQFJZeIRc0rlnCZRtf22clQR
         p8FKYq7Lln/3g9Cigg2Cs+1MHOtluatpvxMwK0Jsgu0PwPrYMtD3fsOlN+fvnk3AO+8m
         nhLA==
X-Gm-Message-State: APjAAAWLnLkZ7SFwKzgjGpEktfjnFDPrAZZjBfGaznN8nUCSAWp5+5AJ
        yH5P/jEf6tTK3QfVdMJxOk8=
X-Google-Smtp-Source: APXvYqzu+UkgqhBlJ35BvwgGMHutEfrGqfFapTAJtyhqzfgVSVhSdoKy681uMwElzAKTOSO6GWYIfA==
X-Received: by 2002:a17:902:e582:: with SMTP id cl2mr33774437plb.60.1562693721700;
        Tue, 09 Jul 2019 10:35:21 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
        by smtp.gmail.com with ESMTPSA id v13sm23922292pfe.105.2019.07.09.10.35.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 10:35:21 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     bgolaszewski@baylibre.com, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] leds: leds-max77650: Add of_node_put() before return
Date:   Tue,  9 Jul 2019 23:05:09 +0530
Message-Id: <20190709173509.14016-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous
node, but in the case of a return from the middle of the loop, there is
no put, thus causing a memory leak. Hence add an of_node_put before the
return in five places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/leds/leds-max77650.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index 6b74ce9cac12..417820f77c32 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -93,8 +93,10 @@ static int max77650_led_probe(struct platform_device *pdev)
 
 	for_each_child_of_node(of_node, child) {
 		rv = of_property_read_u32(child, "reg", &reg);
-		if (rv || reg >= MAX77650_LED_NUM_LEDS)
+		if (rv || reg >= MAX77650_LED_NUM_LEDS) {
+			of_node_put(child);
 			return -EINVAL;
+		}
 
 		led = &leds[reg];
 		led->map = map;
@@ -109,24 +111,32 @@ static int max77650_led_probe(struct platform_device *pdev)
 		} else {
 			led->cdev.name = devm_kasprintf(dev, GFP_KERNEL,
 							"max77650:%s", label);
-			if (!led->cdev.name)
+			if (!led->cdev.name) {
+				of_node_put(child);
 				return -ENOMEM;
+			}
 		}
 
 		of_property_read_string(child, "linux,default-trigger",
 					&led->cdev.default_trigger);
 
 		rv = devm_of_led_classdev_register(dev, child, &led->cdev);
-		if (rv)
+		if (rv) {
+			of_node_put(child);
 			return rv;
+		}
 
 		rv = regmap_write(map, led->regA, MAX77650_LED_A_DEFAULT);
-		if (rv)
+		if (rv) {
+			of_node_put(child);
 			return rv;
+		}
 
 		rv = regmap_write(map, led->regB, MAX77650_LED_B_DEFAULT);
-		if (rv)
+		if (rv) {
+			of_node_put(child);
 			return rv;
+		}
 	}
 
 	return regmap_write(map,
-- 
2.19.1

