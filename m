Return-Path: <linux-leds+bounces-2449-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E95E954DB5
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F1E81F2385C
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 15:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165F01BD502;
	Fri, 16 Aug 2024 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDuPN+5R"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454801BE84B
	for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 15:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723822324; cv=none; b=D2FFrC+O9werw/ZvJdvSDHHtYEViAclOWiELpL++0sAUTT3qdGhIQoyHQcy5xSPXiODvJB7ub6kVAAXelefLFfU7N9YnahgQiDa2KFvY+jN7lrvaooJAdhZvr/uaw8l3pg6+yvcKfqwu1crXVgYeqOVUxHZq+1VoWfGovgoJrko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723822324; c=relaxed/simple;
	bh=haphcDVabNY+m5Vrc9+jwTzdz2gW4B9j++QCcBv7uus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sBZIJuYFebQBTV6WKvROKZShNq6HuwJKBJgkE9kiBXvcUoc/x9LUI/o4BDqceFCqHyXBJgieH7MF8rXHu1mIia+v8FN6uMyXOf3TZeDJC4opr/GJucvelFHHhy4dpalL2jVNv+mlvexAxDUDKdN4WYvolCkvHPdREx9o7uPslfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDuPN+5R; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-367963ea053so1486226f8f.2
        for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 08:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822320; x=1724427120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmSp/tI6/cAsvRbhfMHRpQD46ohRd+mOrBdZEg+M/0c=;
        b=DDuPN+5RUhLuKELNtFzqxEBL9OAmgy7IyE9eanUVDFCWRTuw/BWFzniyJOlEdMR+0u
         /jFYIGgqzIGQoGzPX/0RYbyEH2lL4pcM8eB8f1uoEtEVZ0MB2UBNCWHtYuH9HFfiu0me
         AXbP779P6I1A3gF333nvC8wGwDLwbIB9F8MA7uFPrZTzsgxd3HMYlL1vFBoZJDO1stP3
         b8WqkUuq+Xg5p63c/2C2nG1e2sp85AlBrZAMKMwGGzbsTqSAYTqlZCfXVktcbbwiRPrc
         OM9H1gyInE8TqW1PfChABXeDppBE0Nhe7bgTGS9gIxHc2j7AClnSTbn0cm//kLDQ816S
         p+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822320; x=1724427120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmSp/tI6/cAsvRbhfMHRpQD46ohRd+mOrBdZEg+M/0c=;
        b=U7wVzzhrtifV0CqJEy9rFD0nmRy/HzvQfLI8wHnNKb1fjSmqGDyAN4//A/blN01P94
         MPxECZB+TqIwBDTQMpMr8rg9UbRb6s9C3ZAfaJmo7O8RkTgyxwH4P0zYy6X9wpjWYRwb
         OeVMOiy07K/umvMqZvJYhAKHWeyfgCuPXICGexb5xwYz9u4DzKO1TEYE4YYZ0KmrrPr0
         yVM2Hz0BK4qFyhv2csbF05WDnHglD/pk9D2NP6UDRwOB4ldfCs9AHTaeWn92SFxbm425
         1N5Z/KbW8wJXuahHsR1aGthUBple0asg6i+pYrSzmr2JqhyroyqLXeaQXBmsFujgl7fR
         1c0w==
X-Gm-Message-State: AOJu0Yymbt/T9YSXSm3Nzto4j+iI3It1YrZHGxFwgfSM1klqeozN4ZYt
	n/Q22dvFkEc7a7FRU+9Waon2G55OiCWYcdurDi3b0+cUc2zyh73lx+03nu6uNB0=
X-Google-Smtp-Source: AGHT+IENvgflPrCRLHnfFtaGxKPmZxIFqASabhejGrvVmiQr8wKujrxn8UdnFq1rYdKsHedXwj+CoA==
X-Received: by 2002:adf:a443:0:b0:368:7f8f:ca68 with SMTP id ffacd0b85a97d-3719464e70fmr2963005f8f.30.1723822320474;
        Fri, 16 Aug 2024 08:32:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:36 +0200
Subject: [PATCH 04/17] leds: max77693: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-4-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=haphcDVabNY+m5Vrc9+jwTzdz2gW4B9j++QCcBv7uus=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DcFsjEVoUNxcpg4fNpAtVDyd+JTLcgwo8Hw
 k/LlBeAdrSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w3AAKCRDBN2bmhouD
 17zkD/0b5uHnjnzjPvy7kRfLttY9Q5sWPLsfyEq6CLUzPTCBewXF8K27CAlQIluNVr9MosDCghO
 U7QGtLk8uSvJj9KQ02Yig2QWAcy/s5wRX+ONqPYRue6VOXglHUB0PaP/hurfyKbriRaOUyg3bm3
 Ffad+VfZ46D5xsiEVre/lHkn2amNZE4K2cYDi73IjaGDH4+rdGn/xY4GWlBlA0sDiFaaZbq9mE9
 1bHtk3cykDUdm2ykX4X+1ycApN5D9e0drHjadREgiSLjd8NQmMWPwb9yroUwjZSfEPsFZzXEiGH
 ESatJmodVxi+VpuKSU6tN+pn36jp7Uvo8oJLg2ciIqkhH7l/8f26PToam8oq0III9BmKa7K+WE2
 SA2i561NmARvZKIb7ov2/YXtvUFPzgn/7ENHvP3gnz3QrvNmc6UPPaGIWeENQnPPlEqh9VDOciQ
 GtOI3WZtohFdCug3984yJMuJtGZ2lScEuevzxO0cF2t1KI8+qhrQ4yog1t0e/OS5HQT8Iz4fa8g
 XzXe3ZIxRQQ4cV9Dazp74uPSEkMMyN8EKzdftcVEuL48b9NbqZBencwcIcjhkt6pPpRXBMgLvu4
 weZ7WS3MKriAVqcl2tPp4IjWatK/agobg3xKELYxOlZDdKiHQJc6uUI665Mi9MamHNKIXUMmcyo
 ejGSHUPPEivrccw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/flash/leds-max77693.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/flash/leds-max77693.c b/drivers/leds/flash/leds-max77693.c
index 16b169e658de..90d78b3d22f8 100644
--- a/drivers/leds/flash/leds-max77693.c
+++ b/drivers/leds/flash/leds-max77693.c
@@ -599,7 +599,7 @@ static int max77693_led_parse_dt(struct max77693_led_device *led,
 {
 	struct device *dev = &led->pdev->dev;
 	struct max77693_sub_led *sub_leds = led->sub_leds;
-	struct device_node *node = dev_of_node(dev), *child_node;
+	struct device_node *node = dev_of_node(dev);
 	struct property *prop;
 	u32 led_sources[2];
 	int i, ret, fled_id;
@@ -608,7 +608,7 @@ static int max77693_led_parse_dt(struct max77693_led_device *led,
 	of_property_read_u32(node, "maxim,boost-mvout", &cfg->boost_vout);
 	of_property_read_u32(node, "maxim,mvsys-min", &cfg->low_vsys);
 
-	for_each_available_child_of_node(node, child_node) {
+	for_each_available_child_of_node_scoped(node, child_node) {
 		prop = of_find_property(child_node, "led-sources", NULL);
 		if (prop) {
 			const __be32 *srcs = NULL;
@@ -622,7 +622,6 @@ static int max77693_led_parse_dt(struct max77693_led_device *led,
 		} else {
 			dev_err(dev,
 				"led-sources DT property missing\n");
-			of_node_put(child_node);
 			return -EINVAL;
 		}
 
@@ -638,14 +637,12 @@ static int max77693_led_parse_dt(struct max77693_led_device *led,
 		} else {
 			dev_err(dev,
 				"Wrong led-sources DT property value.\n");
-			of_node_put(child_node);
 			return -EINVAL;
 		}
 
 		if (sub_nodes[fled_id]) {
 			dev_err(dev,
 				"Conflicting \"led-sources\" DT properties\n");
-			of_node_put(child_node);
 			return -EINVAL;
 		}
 
@@ -681,10 +678,8 @@ static int max77693_led_parse_dt(struct max77693_led_device *led,
 
 		if (++cfg->num_leds == 2 ||
 		    (max77693_fled_used(led, FLED1) &&
-		     max77693_fled_used(led, FLED2))) {
-			of_node_put(child_node);
+		     max77693_fled_used(led, FLED2)))
 			break;
-		}
 	}
 
 	if (cfg->num_leds == 0) {

-- 
2.43.0


