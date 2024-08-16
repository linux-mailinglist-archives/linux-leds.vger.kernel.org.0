Return-Path: <linux-leds+bounces-2457-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB94954DC5
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01D80B22F50
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 15:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68B11C3F17;
	Fri, 16 Aug 2024 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hMZTPDJc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91D51C37B2
	for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 15:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723822335; cv=none; b=VRL2GI9hIc2Pt/PK4S59UusLs6dN01+4Ft7+ILap2vjX8hP+44W9SgsgvSB4Ie7+gPfsTAx/359QeOzjYhULJo+6IYxvV+dzUX4z8sCkWZJboWajyBAns5BHJ3MA/UqwbyhMgxxN5kye4H1+DBJ2DSl3s74/DbJSvJdqo8OVD0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723822335; c=relaxed/simple;
	bh=dbGzjAZfh7gVxRz/TIXrMdBv0rDvyB2K7+HnKJ4gJaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ooylpq4mEYlOj0MspfZadq774yNxBrSnxFHB2PgyuRZV89+pnG3LSbW0NC8cuPaPCMv82IAsrcJS5WkfXOMweTtfFFcysSDwlnaOSpRah+QKeAIgnvtmhGgDVQp0lX/yyBYV7pi1U87LvLDzIbCjeAcSG2JZr2LbMoXBmUobsNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hMZTPDJc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3718eaf4046so957632f8f.3
        for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822332; x=1724427132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqtNBWOnQ3Xg+u5frXQomaMjbI/CKyIXNSmcFe+MZzY=;
        b=hMZTPDJcK8kcTMmYxXBesHldyBQEnCLrt8mnvPhqcjnQ+tyErspfNMW7oSDChh89XI
         ZVal1dnvbPorPzD2TMoi/2f/TXRDapTY0JDlkHajoeK7b3mhTHrqPQTOSbpB36u1AptO
         DL9DVoNp5NfqNSAra6AoZ/h1SYNwYlBb7LuJ/d1HYnm0whgYgNAqoUcvyBjXR9qIsjNS
         6Y4zcwuZsDlQRlgmDhW5e7tAhjHDkLvptmYC2s17Vi1AzmxgkLRMWy1tZiS5NvE4tnoz
         BU6c57GZxJrYWQZClXRVX33NYmqC163AHm6/pxqBxulcyiOGH7SzIs/9UopLz6+lcL6O
         b5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822332; x=1724427132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqtNBWOnQ3Xg+u5frXQomaMjbI/CKyIXNSmcFe+MZzY=;
        b=X4QQSH3azb88V8MmYPUfdpj8JQez6fc36LUFHYh7nagv5TNRf2XwEpn9ynaKlroELo
         /YEQ8GCWij5qaHRwtSzGauXouzS467nbZnwy4Dg5ydmCUZTMrntGbLlljU37S9Q96yoa
         qZoWB031dzGEU1gZccxbVsXsJej6H/fDJ0siwC4iIsBwJ9oKoxzySQ+JMSBULuI4tr6V
         Wfwrb/69Tq8NQxuCN+qPexId0tN898Ns5Gu0vUt2tTgHFJLHAOvit0prgW6omhm0vRrg
         b2WImovv79vy+w8RY/+Hgy5Nx4w4bHTrKhPH3Jj7bhZC1TWGdg0FLCGLUgQxgQ1XWxnJ
         p5Ow==
X-Gm-Message-State: AOJu0Yz0CyVvJKWOguR3lAhpi9AftWUSAndFbnmZ0qBNxMSzSNwszjV8
	yE5Ver8cZFbkoii7RRunMbyWs0or8kYZL8+/nd8uexknE9zydkO0k1NtXFNMPTk=
X-Google-Smtp-Source: AGHT+IGnK3961YuWU4oZFJTYCKl0K2mdOewbI1FmFnvK2B2BUfG+eWPO7zTzTcEARCDrYvRBocT5SA==
X-Received: by 2002:adf:fe03:0:b0:368:4def:921a with SMTP id ffacd0b85a97d-3719469f891mr2605779f8f.48.1723822332005;
        Fri, 16 Aug 2024 08:32:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:44 +0200
Subject: [PATCH 12/17] leds: mt6323: Simplify with scoped for each OF child
 loop
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-12-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2340;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dbGzjAZfh7gVxRz/TIXrMdBv0rDvyB2K7+HnKJ4gJaE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3Djss2TXuF8dbygBzG44V3L56XAVS0ojN1I5
 q5iB2VHMQSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w4wAKCRDBN2bmhouD
 1yUUD/92B+FeoNj59qOoLdJpY0L0jdj1oyZClGW92U7HP3VT2O9z9IFmIMEsFaaI70ggtfNrrGo
 n3LOrAyB3l1wKms4gb+ZQSmDRYF5Aa0oupBSWPo4/aDejYD6KmRMAG6N1jQlZSmmmbDOYITeoJd
 pHY3KY4kK5eIJy1/HBfZ4YmW0yQp1zlOJYB+JlaPWYtOU4whCpzmVuXybd33sRRgAKutoEzPJSK
 QfRT7WC9b+BMO5Z5XYutvBjQszr0jXXfkJuznDkY2yYLDhZJ1aBxdW+aY/BX1re1l0S3/dD48xH
 xkhARVtXmtZHfioc97M9oW1CJJmzNdsK5JaE/6/hFEghYexU2cN5K8VdAx7ydXoRFJTZGwguwZq
 SEcdGBMuI272hkbmFHQQsXr3mScckzIePahhWqnSh+hG49AcsO6DZ4J44sD230+IsaXQYmqlmxF
 RJrtUXpKSFLuN9+xRUPtEkKwnxLGIzOZC2Fa571U5F71wPuGmfVZ8FMNuw430ewjLkDcmyh4Tpl
 knNeNMNGypnIQTo3/FXuuXkjkgg6zZdomcMYrOTE9PfDpVsGWt8O/bJeetz5k6c5H6Qc/3zFYgD
 MpW3r9d2aTq7KnrbfguCP3P+CA84Qd+xusPgfqTB2WQ13DGwInvp81b0AQbKe/WXO67p8qpCloV
 XifrHJi3R9eQxcg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-mt6323.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index 40d508510823..a19e8e0b6d1b 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -527,7 +527,6 @@ static int mt6323_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(dev);
-	struct device_node *child;
 	struct mt6397_chip *hw = dev_get_drvdata(dev->parent);
 	struct mt6323_leds *leds;
 	struct mt6323_led *led;
@@ -565,28 +564,25 @@ static int mt6323_led_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		struct led_init_data init_data = {};
 		bool is_wled;
 
 		ret = of_property_read_u32(child, "reg", &reg);
 		if (ret) {
 			dev_err(dev, "Failed to read led 'reg' property\n");
-			goto put_child_node;
+			return ret;
 		}
 
 		if (reg >= max_leds || reg >= MAX_SUPPORTED_LEDS ||
 		    leds->led[reg]) {
 			dev_err(dev, "Invalid led reg %u\n", reg);
-			ret = -EINVAL;
-			goto put_child_node;
+			return -EINVAL;
 		}
 
 		led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
-		if (!led) {
-			ret = -ENOMEM;
-			goto put_child_node;
-		}
+		if (!led)
+			return -ENOMEM;
 
 		is_wled = of_property_read_bool(child, "mediatek,is-wled");
 
@@ -612,7 +608,7 @@ static int mt6323_led_probe(struct platform_device *pdev)
 		if (ret < 0) {
 			dev_err(leds->dev,
 				"Failed to LED set default from devicetree\n");
-			goto put_child_node;
+			return ret;
 		}
 
 		init_data.fwnode = of_fwnode_handle(child);
@@ -621,15 +617,11 @@ static int mt6323_led_probe(struct platform_device *pdev)
 						     &init_data);
 		if (ret) {
 			dev_err(dev, "Failed to register LED: %d\n", ret);
-			goto put_child_node;
+			return ret;
 		}
 	}
 
 	return 0;
-
-put_child_node:
-	of_node_put(child);
-	return ret;
 }
 
 static void mt6323_led_remove(struct platform_device *pdev)

-- 
2.43.0


