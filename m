Return-Path: <linux-leds+bounces-2447-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2A9954DB1
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7761F2321A
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 15:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A100D1BDAB8;
	Fri, 16 Aug 2024 15:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s0SMxiw6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85D61BDA94
	for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 15:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723822320; cv=none; b=R3OqtA3vbt7/7eAr3mdkDGcrwgd+Dr7TG7UJoeb+lG1Znaq6SJdNx7wTXqjIGN+ORRH5hgSaOLNr6lqEvxboD8JEEaqd1UH8wkJluQe+dxatgTVRNm6csljY6WWj9k2Qzouu2F0/bjVUZPpt9u+XZi0yk7wiYVsJmIkQnJqtdZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723822320; c=relaxed/simple;
	bh=9Die7rsR0B6JZR+OB5IykGhnUTGNXFPzBPfH+JonqpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V4DnbS4tuKMl1ZSiI1tAk8JCSTgnQFIm6/4oJV9ZRoz8ow/WN7KjQ2E/dzR/tMla84eH75jrfqkpGNYtqXwUZSDUrCZERfO7+vrpQQ6bUivKfwVBA1x/IdLJAx5GkSI6P95hpxX+gfGD/WSBIGKrEvxJAjH8ebTbLEYXICGtcfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s0SMxiw6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428fb103724so16743295e9.1
        for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822317; x=1724427117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4sCEiKf2B9DqzQ8Bb94EFqGzHc8DX0w0QdFuF8Rhqn4=;
        b=s0SMxiw6ZNsHicOqw0Yc2tD7qb7FyeCB2DQXtyvz27vDjz18c2K8DWeIcRXtk6iimg
         AC+oWXxpX4wKbjlgkgGFYcIBA0yRm2sRhIIDQIuaJW4Kldi70Q2AsW4h7GYJ3CvxGUX0
         YwsLxhkFfMx6Dsz3oqjP6SGX/tJoEYbNeogqLz0+vXshqS4pFUDy7EYUGPUI0fg1z2xb
         9Tru6JUc9L+j5wX1aqaDfmOJx/3ycxk1o99881hmtN/0hVWO+7sT0BbNEZmoZA/f0xCi
         KcDy4jdQfGNFYIpUQSBMFX3krHR1QAg7zWWTd9TTWIsdbuLkGShKO0J1GRm+ku0Y7Y/Z
         /1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822317; x=1724427117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sCEiKf2B9DqzQ8Bb94EFqGzHc8DX0w0QdFuF8Rhqn4=;
        b=SuZZUy2gLVQX9HVFn3r1lefqE6iYgPAVwfJwyj/s67b7YbpusV1bwYuPxW5jc0YFpn
         Wycnz5q+M0OE6/mq+1OL/8k4/frTGFMTwNOLwx8MhEqvDzGP3LnfHJhVNq7hQ2SdISVE
         rP4CKCnkx+ooGkrXk2qadzDq5AFucqTwd23nEKUfnkhViNMeRsMQkNljTHGjqStdolHH
         CWjgSqqU3cj+cBaUtQpPYqGtMCu3nMq8xE6qqbY2DpxZzPwEYy9TTOLKl/oQjuFK1rf0
         W+MVCLn6k5GgJft2PE3um50xYfnO0Eq/XcLFjlxLd09lY6IBXnw6mx/IOLDeoTargOeP
         qIYg==
X-Gm-Message-State: AOJu0Yy3pzxAkijQ+QZo51xaJccFeF1pTh7eAv5PW7dfs0SDoEftDAse
	EO900AIcrtAhCZi8FFri0pu1TNnY9qMx729GSBMwQmCukTC9YLDY4t6YEB0RarM=
X-Google-Smtp-Source: AGHT+IHyXrDHQQ8xvlWiTDWTVoEhaAwJIa4Z1GZboPifzHF1ML55V2Wee10MVI+0W3m/5b6OJzB4SQ==
X-Received: by 2002:a05:600c:1909:b0:427:ee01:ebf0 with SMTP id 5b1f17b1804b1-429e232c0e2mr51862515e9.8.1723822317254;
        Fri, 16 Aug 2024 08:31:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:31:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:34 +0200
Subject: [PATCH 02/17] leds: ktd2692: Use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-2-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2165;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9Die7rsR0B6JZR+OB5IykGhnUTGNXFPzBPfH+JonqpE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DaAzLdZslDk0FQE8r1wjsl32N1ooly3he/+
 EvtSvhfqEaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w2gAKCRDBN2bmhouD
 17GeEACO5DbF3CFK0Jm/yLGicXuoliag3DYz7K6gsIaFii1FHbBFpZHVfrfgWYFVJ8CYd37v68w
 soy0nF1zPooHW/VDuHGHdPQM+JHUmVqvUunZEIc6hxiP2ega264eB3t/cyXxpJyTy8EvxTvH2S8
 RLZm6GSGQmTFb9b8tFr9kTeC0FPg7i9FJRzkCCEnlXJsRplK/CW/sk/c0+7xsTXgWn1+cHnB/z4
 1nWHl/IamnG7It/5//a4DlRR+8XeAL4iQLc5liQIgR8ab1IjKSuVly/W2f3FPjckkMMVIAiP0NY
 lXZuuMD4Xg/spf/HqwoTG9qlMAo2UDELs19WB5qozuKnq/OLe9OJzUV/t5gEjEOKr7Kf6HnP4NP
 pPGUQwe9j9k1bsE36op0VjHzY6nDR1vZDxTvmO6sJeGeptqHCWQtkQoXncP0hdgHEy+YiO9j7Sf
 MyH6enXPvNslJ+WiY6GLycxqvWbCVG/y7jOtjlzW9Nl3UNHbPuh7ZVt+C8GZ5DfJxPZVUHZ4yxU
 JI6xexzf69WgGGMsrLOmRbNZeopiDlAirPTz/tKiocePbzX73jydUexldAE2IPUgDYT0hjPcWpk
 yk5iGPgYLagzljdrUiIib+oUnd6ApXqoYlXT8TLGe1VdfmbbssaXp6dH/f3iRB+T0u79f23A33U
 ex5HyA/XSxDiKpw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/flash/leds-ktd2692.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/flash/leds-ktd2692.c b/drivers/leds/flash/leds-ktd2692.c
index 7bb0aa2753e3..16a01a200c0b 100644
--- a/drivers/leds/flash/leds-ktd2692.c
+++ b/drivers/leds/flash/leds-ktd2692.c
@@ -6,6 +6,7 @@
  * Ingi Kim <ingi2.kim@samsung.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/leds-expresswire.h>
@@ -208,7 +209,6 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
 			    struct ktd2692_led_config_data *cfg)
 {
 	struct device_node *np = dev_of_node(dev);
-	struct device_node *child_node;
 	int ret;
 
 	if (!np)
@@ -239,7 +239,8 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
 		}
 	}
 
-	child_node = of_get_next_available_child(np, NULL);
+	struct device_node *child_node __free(device_node) =
+		of_get_next_available_child(np, NULL);
 	if (!child_node) {
 		dev_err(dev, "No DT child node found for connected LED.\n");
 		return -EINVAL;
@@ -252,26 +253,24 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
 				   &cfg->movie_max_microamp);
 	if (ret) {
 		dev_err(dev, "failed to parse led-max-microamp\n");
-		goto err_parse_dt;
+		return ret;
 	}
 
 	ret = of_property_read_u32(child_node, "flash-max-microamp",
 				   &cfg->flash_max_microamp);
 	if (ret) {
 		dev_err(dev, "failed to parse flash-max-microamp\n");
-		goto err_parse_dt;
+		return ret;
 	}
 
 	ret = of_property_read_u32(child_node, "flash-max-timeout-us",
 				   &cfg->flash_max_timeout);
 	if (ret) {
 		dev_err(dev, "failed to parse flash-max-timeout-us\n");
-		goto err_parse_dt;
+		return ret;
 	}
 
-err_parse_dt:
-	of_node_put(child_node);
-	return ret;
+	return 0;
 }
 
 static const struct led_flash_ops flash_ops = {

-- 
2.43.0


