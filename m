Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 178CF5B276
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2019 02:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbfGAA2i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 30 Jun 2019 20:28:38 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41273 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfGAA2i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 30 Jun 2019 20:28:38 -0400
Received: by mail-qt1-f195.google.com with SMTP id d17so12850634qtj.8;
        Sun, 30 Jun 2019 17:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LTa25+d0njWUmAltwzymqUqY1+5otNovI8ilulHlfnw=;
        b=RxoT1Oxlv64X7OiTFRCqKuT7M06pglWMNgWESI4LQJJak/djlqsaG4IWHvNLm7Rs7C
         y++zzaUlJZaF8wP+Qvp8XL8XVMSMOnd8cUIwV6Kd1SELwrfVvI59uOa0Rn0GRKofA43i
         KYUuGZFW1KQZT1UoO5nuyZBHQSzxT5FgsCtaupuSuquiLTqyWxn/qBJOoyVOE27kd4Oa
         zlrtns76B3noPts5Eqr9ft/7tI+Pm3BFW2O7X1rNnTSbyhXmN9j+3loCFwSRyFq6VM88
         FqS0N2Jkr5A0wzUxmXWxCVKY9GwN5x6diyQOoK1fWo9Gn8Cre5j2lyYOEwJ+qbQJH2sh
         U4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LTa25+d0njWUmAltwzymqUqY1+5otNovI8ilulHlfnw=;
        b=XofFKRUIBF2C+MYiE9PtxXk6Xyu+9cofeQ+DIUHqBu0EOi8tNEcLXbvrH5v+i5ATFH
         7293c5SzK1fitK8Fy15UXAj5jaKGiHGEH8Re39Uie/dZkiapr8x1C7+ASbXgqo2nHUcP
         v3nS1n4sbfvRICz7+pN7p/xe+69X/d0TAHYmSkmM2PZCDqrKflRHmwkMexSwi+Aa2OBD
         d6ZGpc5MmmqmiDcHRTvmxIuupBRyqO9Ku5SHVHocnigf+Ym8qzxAUoPj+/hJhga4S5oy
         xmNyC6czH51vu8pSHdB/ana89khHLcbz/AL6wvAhXwk1L350h66EbnAwTPBY6SQ20546
         y93w==
X-Gm-Message-State: APjAAAUwpCi5q01sy8Pyj+Peyw+281XkaNn14NoF+r0aNimPQU/thYEb
        6Wy2URID3a5o8x1nc7Cnz/U=
X-Google-Smtp-Source: APXvYqy8fKK992eI6ibVqrAQA0pBkm4KMdKMg6YC7l4TmOCEewtuWO2ycHs7EH0zMBrY5wo/sXG81Q==
X-Received: by 2002:ac8:29a4:: with SMTP id 33mr17614598qts.1.1561940917598;
        Sun, 30 Jun 2019 17:28:37 -0700 (PDT)
Received: from bdodge-linux-ub.fios-router.home (pool-100-0-123-202.bstnma.fios.verizon.net. [100.0.123.202])
        by smtp.gmail.com with ESMTPSA id 70sm3971404qkj.118.2019.06.30.17.28.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 30 Jun 2019 17:28:37 -0700 (PDT)
From:   Brian Dodge <bdodge09@gmail.com>
To:     pavel@ucw.cz
Cc:     daniel.thompson@linaro.org, lee.jones@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        pbacon@psemi.com, Brian Dodge <bdodge09@gmail.com>
Subject: [PATCH 2/2] backlight: arcxcnn: add "arctic" vendor prefix
Date:   Sun, 30 Jun 2019 20:28:15 -0400
Message-Id: <1561940895-15837-3-git-send-email-bdodge09@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
References: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
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
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/arcxcnn_bl.c | 41 +++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/video/backlight/arcxcnn_bl.c b/drivers/video/backlight/arcxcnn_bl.c
index 7b1c0a0..a419554 100644
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
@@ -191,27 +191,46 @@ static void arcxcnn_parse_dt(struct arcxcnn *lp)
 	if (ret == 0)
 		lp->pdata->initial_brightness = prog_val;
 
-	ret = of_property_read_u32(node, "arc,led-config-0", &prog_val);
+	ret = of_property_read_u32(node, "arctic,led-config-0", &prog_val);
+	if (ret)
+		ret = of_property_read_u32(node, "arc,led-config-0", &prog_val);
+
 	if (ret == 0)
 		lp->pdata->led_config_0 = (u8)prog_val;
 
-	ret = of_property_read_u32(node, "arc,led-config-1", &prog_val);
+	ret = of_property_read_u32(node, "arctic,led-config-1", &prog_val);
+	if (ret)
+		ret = of_property_read_u32(node, "arc,led-config-1", &prog_val);
+
 	if (ret == 0)
 		lp->pdata->led_config_1 = (u8)prog_val;
 
-	ret = of_property_read_u32(node, "arc,dim-freq", &prog_val);
+	ret = of_property_read_u32(node, "arctic,dim-freq", &prog_val);
+	if (ret)
+		ret = of_property_read_u32(node, "arc,dim-freq", &prog_val);
+
 	if (ret == 0)
 		lp->pdata->dim_freq = (u8)prog_val;
 
-	ret = of_property_read_u32(node, "arc,comp-config", &prog_val);
+	ret = of_property_read_u32(node, "arctic,comp-config", &prog_val);
+	if (ret)
+		ret = of_property_read_u32(node, "arc,comp-config", &prog_val);
+
 	if (ret == 0)
 		lp->pdata->comp_config = (u8)prog_val;
 
-	ret = of_property_read_u32(node, "arc,filter-config", &prog_val);
+	ret = of_property_read_u32(node, "arctic,filter-config", &prog_val);
+	if (ret)
+		ret = of_property_read_u32(node,
+				"arc,filter-config", &prog_val);
+
 	if (ret == 0)
 		lp->pdata->filter_config = (u8)prog_val;
 
-	ret = of_property_read_u32(node, "arc,trim-config", &prog_val);
+	ret = of_property_read_u32(node, "arctic,trim-config", &prog_val);
+	if (ret)
+		ret = of_property_read_u32(node, "arc,trim-config", &prog_val);
+
 	if (ret == 0)
 		lp->pdata->trim_config = (u8)prog_val;
 
@@ -381,6 +400,8 @@ static int arcxcnn_remove(struct i2c_client *cl)
 }
 
 static const struct of_device_id arcxcnn_dt_ids[] = {
+	{ .compatible = "arctic,arc2c0608" },
+	/* here to remain compatible with an older binding, do not use */
 	{ .compatible = "arc,arc2c0608" },
 	{ }
 };
@@ -404,5 +425,5 @@ static struct i2c_driver arcxcnn_driver = {
 module_i2c_driver(arcxcnn_driver);
 
 MODULE_LICENSE("GPL v2");
-MODULE_AUTHOR("Brian Dodge <bdodge@arcticsand.com>");
+MODULE_AUTHOR("Brian Dodge <bdodge@psemi.com>");
 MODULE_DESCRIPTION("ARCXCNN Backlight driver");
-- 
2.7.4

