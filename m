Return-Path: <linux-leds+bounces-2456-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8B6954DC3
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 928E8B22C4F
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 15:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D1D1C37BE;
	Fri, 16 Aug 2024 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cssStGTM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9281C379D
	for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723822334; cv=none; b=jHF7mtzpixZ3Q6CEtKhsMJeC5+Gi/Q5A2XmFafxZm3WF798nr3+KIR30brt0pxoUdoBWDVcWCW3nrAQnU8pegmNSRcJ2J9FNlQF0jtFRa5fI0gxe4zuucRZ0Dbsg638vJYEHSZEIhSRFru/e3VVX/gtwc2Lpj7luF/QkeWDPUzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723822334; c=relaxed/simple;
	bh=lKaguPS9XCpAsm5c5uDkmtZO7d+eB+Wkab1pNRXTP9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VfyYB0M3pp1vR9DxIBZH9+rgAAOiRJVLRojlArr3/V9Ju7qCzlEabOookDy9qIGH6+sfy2CKIRAaRfuqDtIAtkFkRJpVYT11frY7IRiV9Ma12sVjNld73i/PaWymLRZlJAaGJgzMjAP4EkcvL+Js4TrqFD/lTYIV3YHnOIZzgXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cssStGTM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42808071810so15443865e9.1
        for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 08:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822331; x=1724427131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExS3Adk0ysbxVxPe6mSqv52zzn6f2EvdipX95Ynjg4g=;
        b=cssStGTMRpZAFnXSUzg2HJwc3Q+Q8CbIZyNKVxBku0/BRRVDdEp7hkzIeDL4i/xzsU
         cxiTf+u4kK9ds13ivqEQf89eCoihJSS4Gic6NEtDCMHH5USw96gmcjSmf/eJs3L9AW1W
         eg2VUdEcTc/wGotWhoAdOFA3nAGYqTxVfeFpEprg77/e/uUX1BqdvP5MyIwNqkteI4Ev
         Dgu/4DKRnRiNrdMVhHE4j7QSAoLiiQeyuUUIEw4vYW1RrgFaXuZ6SQ5uZxEOKQXTIdM4
         4clym8EBjBxoHOr1xI3rnU57lAOnNa5+HUdehzRBrq0zczfEt2gg3UzbeaCDp4bPwC4i
         X6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822331; x=1724427131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExS3Adk0ysbxVxPe6mSqv52zzn6f2EvdipX95Ynjg4g=;
        b=TSSkJ1Co7jWDdL+M0fx3aFpscHk/m6yrb2UqPGkjVkWeEviD3CRMKnA2QsvJzeoF3j
         kJUnS42qOlMFvKqb0aqMg7QWPyJWusddILfA1r+R9UQphBbH4xCqLeq/05i08C48fhKY
         tM+duYzDZEYhD5uL1b51rhfb3c5tWB8yAJsYiTiEVkEU0a1AvTg7nb9LuMqoQBGpPp5s
         EDUKoIq4xmJ+DT5a9dB8gUJKyVbZ9g0Hb/BkkFXsjflamv4ulEUSCpGrFfXsMG7wegAR
         xCYkf4YLFl/voqMfJE0fLN2SQcvHScI7iQL6iJelqerBHvBpN7ph/CfX0o4StxyVjUuA
         aRTg==
X-Gm-Message-State: AOJu0YyWF6HnSKAcTi8biNxzHjfy0459pPPFKklBYblhsdj/0dgeDP9L
	5sme7IPPgvwuO4l03/BZCQO2AcPPwb9NZD4yEb0h2D4c97JCiD1A7cBDBq29g1Q=
X-Google-Smtp-Source: AGHT+IGY3LRWMur+RIX2EsOyWFfYB56XC96QTNt2jgmYdeU0Jid4hrYTxjzYfgcQsMTsb6CsL+XrrA==
X-Received: by 2002:a05:600c:358b:b0:426:68f2:4d7b with SMTP id 5b1f17b1804b1-429ed78562fmr22527545e9.3.1723822330645;
        Fri, 16 Aug 2024 08:32:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:43 +0200
Subject: [PATCH 11/17] leds: mc13783: Use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-11-1d0292802470@linaro.org>
References: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Riku Voipio <riku.voipio@iki.fi>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lKaguPS9XCpAsm5c5uDkmtZO7d+eB+Wkab1pNRXTP9U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3Di/6NaLLFot+D5dfegT8i/v6A5joRiEW89N
 jDAhq5CjM2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w4gAKCRDBN2bmhouD
 1+8tEACVczd8uQcgqQnn1chR1D9ZHwx5vpecvoE+zaIxLcF5I+90rwhxxDn8jJIGBDIEB4D9lEY
 8VArDs5hWgYidus4DO8QPVMc724Na7iEO7XzHXA0vlYqglosEqKSCnk4YhLj9qeh3+5O3s9AvHO
 R33hSdaUSKRYUo3TbrUsZEGXIeFOzwtCuHLsZ7q5n1zPLKNnM3zoWIwsYsAhBbyKKJG2C0DiGSQ
 2C2cIy6FWj+wnvnOugue2gimQjVJfyuQN9DzLZ8XGwrti2/8VvZRNUjkfCI2rAJxr9kwhYzVzr/
 MpKyOM/P4/YzNG8obVj+CwBkV+W8vCB0nXinpOgz7ZP9U7h5exRrnzfkT8OYQkEMN2K1KF5XpST
 DCGPitYNCxFLKDO3lSHmtS/5Uinxi5W9s9bcES7OcytdUjcqNr4rFP8F6AXsJZZEnBu9LTX2vnJ
 CyxeqAjuuhSzLaQqA75FgTeeQ1Q7SpHfyvewqraZVxTQRKdeuJJvXZo/aKCdvfZtzuo5bYGaBeC
 OiRKTvWBCZtlOIob7/WKFTNmtZyltasnmpOPnHBdyojcJynwE1/+XZ/AzSPpVBnvmulZACpMAT0
 3YFovAp4Rms2RRR8qDQXBvLFJMeuUkgoSK2KBHBiUy0eo/yRQDOxKD6WC52EALjbTb/BLwiLhox
 wdc6cj6rorb2j6Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-mc13783.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index bbd1d359bba4..da99d114bfb2 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -12,6 +12,7 @@
  *      Eric Miao <eric.miao@marvell.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
@@ -113,7 +114,7 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 {
 	struct mc13xxx_leds *leds = platform_get_drvdata(pdev);
 	struct mc13xxx_leds_platform_data *pdata;
-	struct device_node *parent, *child;
+	struct device_node *child;
 	struct device *dev = &pdev->dev;
 	int i = 0, ret = -ENODATA;
 
@@ -121,24 +122,23 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	parent = of_get_child_by_name(dev_of_node(dev->parent), "leds");
+	struct device_node *parent __free(device_node) =
+		of_get_child_by_name(dev_of_node(dev->parent), "leds");
 	if (!parent)
-		goto out_node_put;
+		return ERR_PTR(-ENODATA);
 
 	ret = of_property_read_u32_array(parent, "led-control",
 					 pdata->led_control,
 					 leds->devtype->num_regs);
 	if (ret)
-		goto out_node_put;
+		return ERR_PTR(ret);
 
 	pdata->num_leds = of_get_available_child_count(parent);
 
 	pdata->led = devm_kcalloc(dev, pdata->num_leds, sizeof(*pdata->led),
 				  GFP_KERNEL);
-	if (!pdata->led) {
-		ret = -ENOMEM;
-		goto out_node_put;
-	}
+	if (!pdata->led)
+		return ERR_PTR(-ENOMEM);
 
 	for_each_available_child_of_node(parent, child) {
 		const char *str;
@@ -158,12 +158,10 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 	}
 
 	pdata->num_leds = i;
-	ret = i > 0 ? 0 : -ENODATA;
+	if (i <= 0)
+		return ERR_PTR(-ENODATA);
 
-out_node_put:
-	of_node_put(parent);
-
-	return ret ? ERR_PTR(ret) : pdata;
+	return pdata;
 }
 #else
 static inline struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(

-- 
2.43.0


