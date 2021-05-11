Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B40237B049
	for <lists+linux-leds@lfdr.de>; Tue, 11 May 2021 22:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhEKUuj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 May 2021 16:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbhEKUue (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 May 2021 16:50:34 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED135C061574;
        Tue, 11 May 2021 13:49:25 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id e14so18313226ils.12;
        Tue, 11 May 2021 13:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3HqIlinSBmKWORWVPKBQwaJTQc85TrLgV2irVLVTqM4=;
        b=Y8DOD9Kr9tnuBF+d2iiRwITi5Jz1AtvPA8BMmuC3szjjEjYnip5uzSp54UK9drdSWB
         FIu6Sd/rip9QheDfW9CNKYptLTzFFE+vhb4TKLBNo0bGdBywb9JvF2h3wcm0boNXh6dP
         MXNXR9u9TI97/rF/5TAt9VjYIJvwhWNAhA9fiw1+X9V4ba8tNSv3yn2xsOkQbDlDa0hQ
         a6sej79ja2GxgkGDiiMugWwd3ynZyeFET5LGCWHV7GQphFHKhatOBIF9wD3ig/5KwJFI
         cMWkoAiNLTlukOk6Q55d8GwXcjgHCt+I/Glvf7P0SxDgmJjxgz/Z3l5RKKKfzWNArISG
         WtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3HqIlinSBmKWORWVPKBQwaJTQc85TrLgV2irVLVTqM4=;
        b=gUPU8yCshRHT3NhmhImaazZceCM/3COHHoDi4JVqz8bfiHNiOnnPwjJEVdeShMifMy
         xxSpfV4n/Xw8ktYbibBjlXtTjZIoj2fzJkstC0sLTiGc1aM9o41oIoFxxlnlmat/PFBu
         TYChTXGw+e0yPIo5zfML9gdRa9XrGfLPFG4qxNCiqvHm2xIAZa4Z9ts+Bdp9PcbQ0xvH
         FC8N9jOyV8jnlWV8CliSQ3nVQhCE4zjPxgc5d4w71TqvUniZnPGYCKZxw1ulKKvbG563
         32tAF2odu2KeGmR+ZcCeupW+dsIX01yFoOLKoL7AV2fymPg1J9AAyKEQX11ew7Q3//US
         Hdxw==
X-Gm-Message-State: AOAM5309u3kQS2+3wB1CJfiDzErjQ47kksNenezazxLryTsaU8FLqzvi
        9dFDmoq5NzAqlU+4pb7PVqg=
X-Google-Smtp-Source: ABdhPJzpleFHVP6+GZfHKoAc52TrUa1DmNHsOhwduNHbiYcNx/BC1VdkwcPs7b9SDBy31m0Ca5L83A==
X-Received: by 2002:a05:6e02:2189:: with SMTP id j9mr7906125ila.3.1620766165471;
        Tue, 11 May 2021 13:49:25 -0700 (PDT)
Received: from zobel.corp.climate.com ([76.232.4.204])
        by smtp.gmail.com with ESMTPSA id p25sm4535851ioh.39.2021.05.11.13.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 13:49:25 -0700 (PDT)
From:   Doug Zobel <dougdev334@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Doug Zobel <dougdev334@gmail.com>
Subject: [PATCH 1/2] leds: lp55xx: support predefined pattern in Device Tree
Date:   Tue, 11 May 2021 15:48:33 -0500
Message-Id: <20210511204834.2675271-2-dougdev334@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210511204834.2675271-1-dougdev334@gmail.com>
References: <20210511204834.2675271-1-dougdev334@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The predefined LED pattern supported by the lp5562 can only
be passed via the antiquated platform data structure.  This
patch allows the patterns to be defined in the Device Tree.

Signed-off-by: Doug Zobel <dougdev334@gmail.com>
---
 drivers/leds/leds-lp55xx-common.c | 94 +++++++++++++++++++++++++++----
 1 file changed, 84 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 81de1346bf5d..227577ab4a16 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -659,15 +659,25 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	struct device_node *child;
 	struct lp55xx_platform_data *pdata;
 	struct lp55xx_led_config *cfg;
-	int num_channels;
-	int i = 0;
+	struct lp55xx_predef_pattern *pat = NULL;
+	int num_channels = 0;
+	int cfg_num = 0;
+	int num_patterns = 0;
+	int pat_num = 0;
+	int pat_size;
 	int ret;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	num_channels = of_get_available_child_count(np);
+	for_each_available_child_of_node(np, child) {
+		if (of_property_read_bool(child, "chan-name"))
+			num_channels++;
+		else if (of_property_read_bool(child, "pat-name"))
+			num_patterns++;
+	}
+
 	if (num_channels == 0) {
 		dev_err(dev, "no LED channels\n");
 		return ERR_PTR(-EINVAL);
@@ -677,19 +687,83 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	if (!cfg)
 		return ERR_PTR(-ENOMEM);
 
-	pdata->led_config = &cfg[0];
-	pdata->num_channels = num_channels;
+	if (num_patterns) {
+		pat = devm_kcalloc(dev, num_patterns, sizeof(*pat), GFP_KERNEL);
+		if (!pat)
+			return ERR_PTR(-ENOMEM);
+	}
+
 	cfg->max_channel = chip->cfg->max_channel;
 
 	for_each_available_child_of_node(np, child) {
-		ret = lp55xx_parse_logical_led(child, cfg, i);
-		if (ret) {
-			of_node_put(child);
-			return ERR_PTR(-EINVAL);
+		if (of_property_read_bool(child, "chan-name")) {
+			ret = lp55xx_parse_logical_led(child, cfg, cfg_num);
+			if (ret) {
+				of_node_put(child);
+				return ERR_PTR(-EINVAL);
+			}
+			cfg_num++;
+		} else if (of_property_read_bool(child, "pat-name")) {
+			pat_size = of_property_count_elems_of_size(child,
+								   "pat-r",
+						sizeof((*pat[pat_num].r)));
+			if (pat_size <= 0) {
+				pat[pat_num].size_r = 0;
+			} else {
+				char *program = devm_kcalloc(dev, pat_size,
+					sizeof(*(pat[pat_num].r)), GFP_KERNEL);
+				if (!program)
+					return ERR_PTR(-ENOMEM);
+				of_property_read_u8_array(child, "pat-r",
+							  program,
+							  pat_size);
+				pat[pat_num].r = program;
+				pat[pat_num].size_r = pat_size;
+			}
+
+			pat_size = of_property_count_elems_of_size(child,
+								   "pat-g",
+						sizeof((*pat[pat_num].g)));
+			if (pat_size <= 0) {
+				pat[pat_num].size_g = 0;
+			} else {
+				char *program = devm_kcalloc(dev, pat_size,
+					sizeof(*(pat[pat_num].g)), GFP_KERNEL);
+				if (!program)
+					return ERR_PTR(-ENOMEM);
+				of_property_read_u8_array(child, "pat-g",
+							  program,
+							  pat_size);
+				pat[pat_num].g = program;
+				pat[pat_num].size_g = pat_size;
+			}
+
+			pat_size = of_property_count_elems_of_size(child,
+								   "pat-b",
+						sizeof((*pat[pat_num].b)));
+			if (pat_size <= 0) {
+				pat[pat_num].size_b = 0;
+			} else {
+				char *program = devm_kcalloc(dev, pat_size,
+					sizeof(*(pat[pat_num].b)), GFP_KERNEL);
+				if (!program)
+					return ERR_PTR(-ENOMEM);
+				of_property_read_u8_array(child, "pat-b",
+							  program,
+							  pat_size);
+				pat[pat_num].b = program;
+				pat[pat_num].size_b = pat_size;
+			}
+
+			pat_num++;
 		}
-		i++;
 	}
 
+	pdata->led_config = &cfg[0];
+	pdata->num_channels = num_channels;
+	pdata->patterns = &pat[0];
+	pdata->num_patterns = num_patterns;
+
 	of_property_read_string(np, "label", &pdata->label);
 	of_property_read_u8(np, "clock-mode", &pdata->clock_mode);
 
-- 
2.20.1

