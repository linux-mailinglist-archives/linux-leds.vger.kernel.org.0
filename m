Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9025521AD
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jun 2019 06:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbfFYEFz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Jun 2019 00:05:55 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39332 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728214AbfFYEFz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Jun 2019 00:05:55 -0400
Received: by mail-qt1-f195.google.com with SMTP id i34so16936841qta.6;
        Mon, 24 Jun 2019 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YXKj+IPUyIdf9CK0v5ukJZ+u/bRKPv2xw3vKk/om7oI=;
        b=LChh0/FCvKa/98upK9LB6jvE9HzgZFrHPe76Ce49aYorrRjoequN81oTM3FMzb3jd5
         8nggr3btnYII+db1QPjWhq+kqelC3o5xK5A6KvC6lnIxXyT4Q85Np6cZ+t0gXj6qE8nT
         xu6Oi6BLwVbu/exKZwJrvuCSGiAKZFAeFOT4c52CrsDrmpRa7z5HamrGTz7blynTDhzq
         +GfjVEVvywI6U7Tc/qGnjxUiRMe4NB2WAyCm9AOoiyG7/FmADbd8dwEFx+fEDA83P1Xr
         Orm2OVODkxYyl8IfkP1WJXZOVfS6AAHYmYl4RrED2NXfH7BlIyfruHgQNRuCOrmUcL2E
         ZG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YXKj+IPUyIdf9CK0v5ukJZ+u/bRKPv2xw3vKk/om7oI=;
        b=et5E3s+3Yv5sOZnhL5xi+zn2jKgPpJHGyWO25itpaBTgZCz/aTysC9vd21tpDfw8uz
         w4BN4mYKGYWRSV3E8gev/M01QJgn1+OImwvUds5ZxNiLNWfS9Q/P64RVOSZ03dbi6GJM
         ortjRX7r2ge7p4jvPMqqOwy/UwAUNEM+LbbTjCuTHPR1q0Rea3uzc2hGuJZH6eW+VB0T
         BOlKrUAG+QZWijnyUI9uUjU+xpEQ3RxMfguVIjSqlgdL6FVHlARN6u4veUxVvFfd28WN
         N/8Blh4+E7+orE4Qd8/aOnHyGb3W3z41x4euV181q5Fi/X/Y3fCrrHYVFKayAlKV95r/
         Mrvg==
X-Gm-Message-State: APjAAAViZ5wxTxZdHfgpCOu0kFkfoSnZMyeFu7Z2nSV31YfZBc2SVsiA
        emuBzhb/1hq4kfezQj66iIY=
X-Google-Smtp-Source: APXvYqy9WBYFmgKGSjQ3wQM1yf0IDmribmspEKiDwjqHsbJCHIWK+I1T8tXyiEAeJdYRRz3qKtD8gw==
X-Received: by 2002:aed:3b1c:: with SMTP id p28mr127461530qte.312.1561435553984;
        Mon, 24 Jun 2019 21:05:53 -0700 (PDT)
Received: from bdodge-linux-ub.fios-router.home (pool-100-0-123-202.bstnma.fios.verizon.net. [100.0.123.202])
        by smtp.gmail.com with ESMTPSA id e8sm6741029qkn.95.2019.06.24.21.05.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 24 Jun 2019 21:05:53 -0700 (PDT)
From:   Brian Dodge <bdodge09@gmail.com>
To:     pavel@ucw.cz
Cc:     daniel.thompson@linaro.org, lee.jones@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        pbacon@psemi.com, Brian Dodge <bdodge09@gmail.com>
Subject: [PATCH 2/2] backlight: arcxcnn: add "arctic" vendor prefix
Date:   Tue, 25 Jun 2019 00:05:29 -0400
Message-Id: <1561435529-7835-3-git-send-email-bdodge09@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The original patch adding this driver and DT bindings improperly
used "arc" as the vendor-prefix. This adds "arctic" which is the
proper prefix and retains "arc" to allow existing users of the
"arc" prefix to update to new kernels. There is at least one
(Samsung Chromebook Plus)

Signed-off-by: Brian Dodge <bdodge09@gmail.com>
---
 drivers/video/backlight/arcxcnn_bl.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/video/backlight/arcxcnn_bl.c b/drivers/video/backlight/arcxcnn_bl.c
index 7b1c0a0..14c67f2 100644
--- a/drivers/video/backlight/arcxcnn_bl.c
+++ b/drivers/video/backlight/arcxcnn_bl.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Backlight driver for ArcticSand ARC_X_C_0N_0N Devices
+ * Backlight driver for pSemi (formerly ArcticSand) ARC_X_C_0N_0N Devices
  *
- * Copyright 2016 ArcticSand, Inc.
- * Author : Brian Dodge <bdodge@arcticsand.com>
+ * Copyright 2016-2019  pSemi, Inc.
+ * Author : Brian Dodge <bdodge@psemi.com>
  */
 
 #include <linux/backlight.h>
@@ -191,27 +191,40 @@ static void arcxcnn_parse_dt(struct arcxcnn *lp)
 	if (ret == 0)
 		lp->pdata->initial_brightness = prog_val;
 
-	ret = of_property_read_u32(node, "arc,led-config-0", &prog_val);
+	ret = of_property_read_u32(node, "arctic,led-config-0", &prog_val);
+	if (ret)
+		ret = of_property_read_u32(node, "arc,led-config-0", &prog_val);
 	if (ret == 0)
 		lp->pdata->led_config_0 = (u8)prog_val;
 
-	ret = of_property_read_u32(node, "arc,led-config-1", &prog_val);
+	ret = of_property_read_u32(node, "arctic,led-config-1", &prog_val);
+	if (ret)
+		ret = of_property_read_u32(node, "arc,led-config-1", &prog_val);
 	if (ret == 0)
 		lp->pdata->led_config_1 = (u8)prog_val;
 
-	ret = of_property_read_u32(node, "arc,dim-freq", &prog_val);
+	ret = of_property_read_u32(node, "arctic,dim-freq", &prog_val);
+	if (ret)
+		ret = of_property_read_u32(node, "arc,dim-freq", &prog_val);
 	if (ret == 0)
 		lp->pdata->dim_freq = (u8)prog_val;
 
-	ret = of_property_read_u32(node, "arc,comp-config", &prog_val);
+	ret = of_property_read_u32(node, "arctic,comp-config", &prog_val);
+	if (ret)
+		ret = of_property_read_u32(node, "arc,comp-config", &prog_val);
 	if (ret == 0)
 		lp->pdata->comp_config = (u8)prog_val;
 
-	ret = of_property_read_u32(node, "arc,filter-config", &prog_val);
+	ret = of_property_read_u32(node, "arctic,filter-config", &prog_val);
+	if (ret)
+		ret = of_property_read_u32(node,
+				"arc,filter-config", &prog_val);
 	if (ret == 0)
 		lp->pdata->filter_config = (u8)prog_val;
 
-	ret = of_property_read_u32(node, "arc,trim-config", &prog_val);
+	ret = of_property_read_u32(node, "arctic,trim-config", &prog_val);
+	if (ret)
+		ret = of_property_read_u32(node, "arc,trim-config", &prog_val);
 	if (ret == 0)
 		lp->pdata->trim_config = (u8)prog_val;
 
@@ -381,6 +394,8 @@ static int arcxcnn_remove(struct i2c_client *cl)
 }
 
 static const struct of_device_id arcxcnn_dt_ids[] = {
+	{ .compatible = "arctic,arc2c0608" },
+	/* here to remaim compatible with an older binding, do not use */
 	{ .compatible = "arc,arc2c0608" },
 	{ }
 };
@@ -404,5 +419,5 @@ static struct i2c_driver arcxcnn_driver = {
 module_i2c_driver(arcxcnn_driver);
 
 MODULE_LICENSE("GPL v2");
-MODULE_AUTHOR("Brian Dodge <bdodge@arcticsand.com>");
+MODULE_AUTHOR("Brian Dodge <bdodge@psemi.com>");
 MODULE_DESCRIPTION("ARCXCNN Backlight driver");
-- 
2.7.4

