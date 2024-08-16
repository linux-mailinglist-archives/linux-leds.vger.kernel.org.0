Return-Path: <linux-leds+bounces-2448-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD28954DB4
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFB6F1C2118D
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 15:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38EC1BD4F9;
	Fri, 16 Aug 2024 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zt64dWwG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F801BE226
	for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 15:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723822323; cv=none; b=nyvTCrDRsWacmRYYD+1ewgKm0l7uddgiHkcFAPKfAnv3ixXgKGgmQxZtOJ84bWg4zhuQDtnv5d+QlG8Ut0C1ShNecbBgjebPtXJz8TWOj+vFKRxXqx7Ox0MAU2E6VG/nsiqplhjhV9KOlGdvDg2hATtDvpljL0FAflGgJMyAYMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723822323; c=relaxed/simple;
	bh=5KMyb/0ghZiWoNxxGIN0+j8uXXpKKlWx7oozmJ4CEcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sMGntK6PZMVuhpOVGgZKT9Sfmys5LW4VnFolUaokDN3j+hO56AYItC9XKQRWgkelk/r+6P/xo9utIH0V4jeLH8JSA33nBKXEIpeeFmM3AGpID9MMtc1LKrlwJieTHyL+SlpqjatpS2UvAEdGGiYM0pgtbA2tqnOSIh0xkc86FA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zt64dWwG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-428163f7635so16675865e9.2
        for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 08:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822319; x=1724427119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMXjCi1nWSGJw2HEGXaKpvGQBWqmSFyvM6Rv3lJzOnk=;
        b=zt64dWwG53OErxxJWStMAjFLyyARIxX/Jv6p7wzrz1N2ilL3sWJNDPWifXZZZ3Ep6m
         tjlxXpi3DgmGcJcS5z2vOU1ywAmObQZnY5WNa2urETMWGTW76fv7fRw2523NrOOoug1w
         935xV94efRPZEPh91ba5Ed3bzQL1B2OjGNioiuvAZo0wcIPhiddfLqrGIX/CJQY1zT/0
         NvX4gAfeIVn+8qaeer0sfG7b9oypNhPOAhfvYQFRU8x5dunuHEGu4yZGYOhEsLDjNsaY
         p7EQU8EO7krBUw1QdfX383jfS5zIyCuYjc/MVRZcCsTY3bj7jOVY52V1ZAZjEGlSUwai
         K9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822319; x=1724427119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMXjCi1nWSGJw2HEGXaKpvGQBWqmSFyvM6Rv3lJzOnk=;
        b=JwUHLftVsw54cSoe42PzgqsjqgzWGEFwDFRQtjBKCK/qxHdPX7n1UhOOyiro7FFpOn
         p6KFOdW6bgi+hFmyOCZGbuvyKCXQALBWxKb5o+vIoydCq+SihIPsGkcPoNGzjdg7wgUi
         YKe477A3NEAoKZj6rrbRPjo8VHDMlvJ59hc7eXfAh7CvYW20iVP/d3hhUeBmgXLWVy+H
         WjDNVEkfVFC5zEL16bQrqe5qN3j6dowPvnybWMvc1Lu3NgqYqIOiR7scUk2LpRal6UWx
         46HddoUC4CknwHSes11qkfk0IZ7nVT0sgA9bi31FpfaADug++uXLvwXWg0Jlo2HS0QnM
         5ONg==
X-Gm-Message-State: AOJu0YxJzKiuHa4WB0+wLU/ZtDIK4P18lWhS7gPO/lWqs5T9/o99ojvi
	GJcgUHyp1usI6y0PDEbZaBxTEbAd18kdNiq9molUgDnkRetDj2IIELghUKSDZ44=
X-Google-Smtp-Source: AGHT+IHQVp9RMVKnFXRmolzPy8dcbt7NmXN/jroL6chg+fDJWYg7uMIzfeBfP3NPtNgAOQVI5RxN+w==
X-Received: by 2002:a05:600c:1987:b0:428:9ba:39f with SMTP id 5b1f17b1804b1-429ed79e212mr21385555e9.11.1723822318959;
        Fri, 16 Aug 2024 08:31:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:31:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:35 +0200
Subject: [PATCH 03/17] leds: max77693: add missing of_node_get for probe
 duration
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-3-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5KMyb/0ghZiWoNxxGIN0+j8uXXpKKlWx7oozmJ4CEcs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DbVDkrgpNCWbqNPXUp9YCFjKcR3EI+TV8pk
 PJEmPek6O2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w2wAKCRDBN2bmhouD
 16uRD/9jJHb7kLUKzwpJD2ZWds7O67ALfXb3ZP6DUa7effzfaE+ihgB7WVZpKDFSz4Ynnq+GhzC
 SD7hYFMiD1dlIU45EiowQ6w17hk6OGGckkc4oS5UDLJHqO38ddcLxZMtxjHDGR8DPAIRHYRRSCV
 aeJF3qb6rx4DHfiGx+7HuYGQahBxc5wQO7aUmpD+tKb30AdRIIpxWoRL34DC3QyNlAkpBwXC34u
 S8wYpbf1rQQxBswNLYYVojtvNJmVa+/7G4urNcX3L2t5N9Ocz78wJ2KXKaJ6PmByMd996E0Wi2c
 zM3+rJPt//QRSatrCP+YBcu9vxG86z9Ssu+7kV3vDNkYop/8zteJ8ZUPHPgVNxvBuFt0JLzL8QR
 39T+Se5p7DgKy2U7tH/cp8FZ8cwH87/8uXrGiwhgi5r6tn9THegbdFj1ZwKt6Q4phJpPKJxglY6
 bWKZfin1lyWgHMxA++9MV8mY7GtZ+lh8kRrvMJWq+Y9eva4qZJlXBk9O+Fu6OLzi+fHGL65R2LX
 JTUkAzxdPa/proprkZCnXopEdTizjxhet3j0QeFnBB5lAtMSuUttFIZKMxZg0OE96gq4JtVmGMy
 56lHesBi9ptFlDGB2uRlD2OAXJ0+NmuyD0GOY548/WByuED2YjR12ECGeD4jD7KlanlFHSgqIAE
 FqnXEfx8WMfK5ig==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

At beginning of probe() function, the driver iterates over OF children
and assigns found device node for later.  The code uses
for_each_available_child_of_node() which drops the references on
children on each successful pass, thus the probe function operates later
on the device node without holding the reference.

Fix this by increasing the reference count for found child node and
drop it at the end of the probe, because it is not needed further (the
V4L init code takes its own references).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/flash/leds-max77693.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/flash/leds-max77693.c b/drivers/leds/flash/leds-max77693.c
index 9f016b851193..16b169e658de 100644
--- a/drivers/leds/flash/leds-max77693.c
+++ b/drivers/leds/flash/leds-max77693.c
@@ -649,7 +649,7 @@ static int max77693_led_parse_dt(struct max77693_led_device *led,
 			return -EINVAL;
 		}
 
-		sub_nodes[fled_id] = child_node;
+		sub_nodes[fled_id] = of_node_get(child_node);
 		sub_leds[fled_id].fled_id = fled_id;
 
 		cfg->label[fled_id] =
@@ -968,7 +968,7 @@ static int max77693_led_probe(struct platform_device *pdev)
 
 	ret = max77693_setup(led, &led_cfg);
 	if (ret < 0)
-		return ret;
+		goto err_setup;
 
 	mutex_init(&led->lock);
 
@@ -1000,6 +1000,8 @@ static int max77693_led_probe(struct platform_device *pdev)
 			else
 				goto err_register_led1;
 		}
+		of_node_put(sub_nodes[i]);
+		sub_nodes[i] = NULL;
 	}
 
 	return 0;
@@ -1013,6 +1015,9 @@ static int max77693_led_probe(struct platform_device *pdev)
 err_register_led1:
 	mutex_destroy(&led->lock);
 
+err_setup:
+	for (i = FLED1; i <= FLED2; i++)
+		of_node_put(sub_nodes[i]);
 	return ret;
 }
 

-- 
2.43.0


