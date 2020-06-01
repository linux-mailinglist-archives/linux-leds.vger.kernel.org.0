Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE8341EA52B
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2020 15:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgFANkh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jun 2020 09:40:37 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37226 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727000AbgFANka (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jun 2020 09:40:30 -0400
Received: by mail-lf1-f68.google.com with SMTP id x22so3948401lfd.4;
        Mon, 01 Jun 2020 06:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XXr2KRE+Dnzze8XZks0Gj4qAjbaI/MHBmKKUHBBJn5M=;
        b=OwWqE9i0Xg0Nn5+PKXk+i/MW49F7ruVdUbsA5y+nBJrspVe4JDOliM8WxoMryOY43n
         Ow/1yddRqr3GiEZ3D2uGQYyT09qGKiYjPJrzAnm/ok+CpsDQGTYQ50sCWm3zMGroMGVo
         Mim2oGQH5qGIiGmO0vhZHzohNNcSDoZQy4+QBt6JBnK3oalT3VG2XHqZDr4ypCOVx0Y0
         s3P8W/Xz+U4fdghvDqVRtBfFbsLtwWZzEA0dcboPXEu0emtOs+TBPpQoJOgOTx29KQ4S
         6bv11PuQ3X6jjLxDt+yqaTzGlDbwhoLFbILJvHXja7W9FJjs0it4NGUM9dmi+FXpBQGX
         ctMQ==
X-Gm-Message-State: AOAM5315ny7arMkTiPtV0yqjuDA5dnrfE8SOJaFy0KXLk3C5+6r9LKHG
        axtgrPW673GJAGtxkilBGek=
X-Google-Smtp-Source: ABdhPJwDPr96Ap3HzoIE25YN2bfCtabka+qXKDmUD01Vx75YFQ8IFMIwXwFdpcfVgcZioQhkK8v1+g==
X-Received: by 2002:a19:500e:: with SMTP id e14mr11199694lfb.88.1591018827510;
        Mon, 01 Jun 2020 06:40:27 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id v2sm4079883ljj.96.2020.06.01.06.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 06:40:25 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jfkfp-0003G3-HS; Mon, 01 Jun 2020 15:40:17 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Amitoj Kaur Chawla <amitoj1606@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 6/6] leds: drop redundant struct-device pointer casts
Date:   Mon,  1 Jun 2020 15:39:50 +0200
Message-Id: <20200601133950.12420-7-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200601133950.12420-1-johan@kernel.org>
References: <20200601133950.12420-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Drop the pointless and needlessly confusing casts of struct-device
pointers.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/leds/leds-lm355x.c | 9 +++------
 drivers/leds/leds-lm3642.c | 9 +++------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
index a5abb499574b..c690eafe2746 100644
--- a/drivers/leds/leds-lm355x.c
+++ b/drivers/leds/leds-lm355x.c
@@ -453,8 +453,7 @@ static int lm355x_probe(struct i2c_client *client,
 	chip->cdev_flash.max_brightness = 16;
 	chip->cdev_flash.brightness_set_blocking = lm355x_strobe_brightness_set;
 	chip->cdev_flash.default_trigger = "flash";
-	err = led_classdev_register((struct device *)
-				    &client->dev, &chip->cdev_flash);
+	err = led_classdev_register(&client->dev, &chip->cdev_flash);
 	if (err < 0)
 		goto err_out;
 	/* torch */
@@ -462,8 +461,7 @@ static int lm355x_probe(struct i2c_client *client,
 	chip->cdev_torch.max_brightness = 8;
 	chip->cdev_torch.brightness_set_blocking = lm355x_torch_brightness_set;
 	chip->cdev_torch.default_trigger = "torch";
-	err = led_classdev_register((struct device *)
-				    &client->dev, &chip->cdev_torch);
+	err = led_classdev_register(&client->dev, &chip->cdev_torch);
 	if (err < 0)
 		goto err_create_torch_file;
 	/* indicator */
@@ -477,8 +475,7 @@ static int lm355x_probe(struct i2c_client *client,
 	/* indicator pattern control only for LM3556 */
 	if (id->driver_data == CHIP_LM3556)
 		chip->cdev_indicator.groups = lm355x_indicator_groups;
-	err = led_classdev_register((struct device *)
-				    &client->dev, &chip->cdev_indicator);
+	err = led_classdev_register(&client->dev, &chip->cdev_indicator);
 	if (err < 0)
 		goto err_create_indicator_file;
 
diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index 4232906fcb75..62c14872caf7 100644
--- a/drivers/leds/leds-lm3642.c
+++ b/drivers/leds/leds-lm3642.c
@@ -340,8 +340,7 @@ static int lm3642_probe(struct i2c_client *client,
 	chip->cdev_flash.brightness_set_blocking = lm3642_strobe_brightness_set;
 	chip->cdev_flash.default_trigger = "flash";
 	chip->cdev_flash.groups = lm3642_flash_groups,
-	err = led_classdev_register((struct device *)
-				    &client->dev, &chip->cdev_flash);
+	err = led_classdev_register(&client->dev, &chip->cdev_flash);
 	if (err < 0) {
 		dev_err(chip->dev, "failed to register flash\n");
 		goto err_out;
@@ -353,8 +352,7 @@ static int lm3642_probe(struct i2c_client *client,
 	chip->cdev_torch.brightness_set_blocking = lm3642_torch_brightness_set;
 	chip->cdev_torch.default_trigger = "torch";
 	chip->cdev_torch.groups = lm3642_torch_groups,
-	err = led_classdev_register((struct device *)
-				    &client->dev, &chip->cdev_torch);
+	err = led_classdev_register(&client->dev, &chip->cdev_torch);
 	if (err < 0) {
 		dev_err(chip->dev, "failed to register torch\n");
 		goto err_create_torch_file;
@@ -365,8 +363,7 @@ static int lm3642_probe(struct i2c_client *client,
 	chip->cdev_indicator.max_brightness = 8;
 	chip->cdev_indicator.brightness_set_blocking =
 						lm3642_indicator_brightness_set;
-	err = led_classdev_register((struct device *)
-				    &client->dev, &chip->cdev_indicator);
+	err = led_classdev_register(&client->dev, &chip->cdev_indicator);
 	if (err < 0) {
 		dev_err(chip->dev, "failed to register indicator\n");
 		goto err_create_indicator_file;
-- 
2.26.2

