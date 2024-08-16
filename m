Return-Path: <linux-leds+bounces-2446-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F1F954DAF
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 244FD2835B3
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 15:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719341BDA9D;
	Fri, 16 Aug 2024 15:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jL62j729"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F3B1BCA14
	for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 15:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723822319; cv=none; b=rtzcZwtE5vdSVv4pZan4G/Sl8K7pxJJjg0C0RYbVTknJDW4zK6j/kmzLNagECZxQ+W1gLNb0iYcNnHDecVzdfKH4P3+vjI/aL8TPQz2UCQZKui33XvXSEeVN/aNIDC//3wIrElqXGlvTYIA7a5yBihcMCdT67aZJ0VyfOkAhy2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723822319; c=relaxed/simple;
	bh=a1YGQS8jzBzLcYjwPx4kf8irSYV8QsT8hVGiKzaSR0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUDNmDg4ZR8CJO36gSiE+l+kzbB/4puMbPKOynw2k+Z+nQR2+RbkVmeZpyckxK8fddxtyNguNEweK/3xA/5bGr4zDbIzIM6wAAMr22nO6SSoACtlEongRlxvOtf6Lm/YyOXcNOMhhWnmgQKApGLRyu7IyImAXcqq4sYK65lUyug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jL62j729; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-428163f7635so16675495e9.2
        for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 08:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822316; x=1724427116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bs19CWciVe69z8rsWTOPtucmozrfgqJROhrJ589EkVY=;
        b=jL62j72902DrAg0sWroJIIgWBMR3G7Ln6CNvTs0L4cvUW9XuarstT+vGKPIUWfwXo2
         AnGclMa+iWyBPY7WNur6GrfXzv7UdJK7ly9guXgwpBX9bgfh4Q/iJpfzcBvcKUX0DhvV
         CHPw3wT2UlwSfqNz5vXHii+ebWUh3fImKEjKzldneR+Ci5J91i6PGCTc+N8qoQY2rXEN
         5PPly6x6ejh5VK+lXU822filgCl1BsCxjUFlNCFx3qJcqdRl+d3qj4cjrWrEIB5YdKrc
         m7ZG/eytovp43dsV4hNXnh/byvk7oafE/6mmknC9RR/eOE7NNze4Bsha1cmuSlqGjW60
         l7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822316; x=1724427116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bs19CWciVe69z8rsWTOPtucmozrfgqJROhrJ589EkVY=;
        b=vorDkqLnFBV2EAnmCFRwS/I68zcyx0fa0in7d9RIdeaSJI4lZBA7k9hA+CXdG/LEqQ
         a/2h1g9ddZ8L0k7aQJsRpcpKit5YIiEf4RH0lN9JlUsGJLOuSMf8EGBRC3xt/+msWd0N
         yfajC8hql9ru1izJVqdfGaNu7sxtAtTNTOusx0i2QCe8uqc7hYecOsMmAeTEWuFf/JZi
         j/NJBStzb/I+0ZZn7HIvEBK7wluFh2apRkVLTGnLg55JgDMp35JBp0y7mDx+KfxlZAEt
         zx87KBi4yC7xBxNPBx98UhUT7ZnqwVwWpj0JNuKIwFCIG5qeqb58ymZUmznGg/qBh7Jc
         YIdw==
X-Gm-Message-State: AOJu0Ywd7AM738KxDemDvHL36q9WpTvHH5GmcZvG72bzXHjrdQNKfUpf
	N5tI6WI3oZYmojulDhtzcyVijuFBNDngcMRLAWEstePwWlUpU/0gRSiLCyIpwR4=
X-Google-Smtp-Source: AGHT+IGR3dEEF3paPLhCSZQYsm1dXDhlnka2LZPKsFs9HlMVLbvtSAJs2IkTJafZE9YHaH92MT5WjA==
X-Received: by 2002:a05:600c:4fd1:b0:426:6353:4b7c with SMTP id 5b1f17b1804b1-429ed7855f7mr22773225e9.8.1723822315663;
        Fri, 16 Aug 2024 08:31:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:31:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:33 +0200
Subject: [PATCH 01/17] leds: aat1290: Use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-1-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=a1YGQS8jzBzLcYjwPx4kf8irSYV8QsT8hVGiKzaSR0k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DZOpqtaUv4QAkOdHVd+6wkSZBmNTro/fzvY
 CO/ZnU/HP+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w2QAKCRDBN2bmhouD
 18eeD/44UH0sp3C6aYfp1LBephrs+liKt3nfnjZdWSJ0v/TieMbxVM6d4zS9ydJ5ky9FnYwB/bn
 /67+vER0yxMdbgcdPdnq+7RJo3bpW2eqChHfkD1gR59G6Ochw7Zhoue60ljd9KsBK2RPJ9+7Dd+
 Bk0oHl3jNMvbjNIfNBaqvnSCmvazbnZi2n1JrGvRuuhOSF6/oY0hlzCzYJj6U3J5JLoUHo/RvEv
 xIDgNvQXD1Ul8c2AhudnTWUCCXGpw5bwLleLXZNh6r77KiudcrQ+wHjc+3AyB5100d/IDZV9pLz
 T5KFT9Qqgr1UnhKUPqvmz/9zaqtUAp1yqWgIyE6dCiKKs5ll1ljE/4lx04RwwH7gIhPAUDp19um
 23NJqm8wECy/46SyyMgwAsCkV2PlLcjsTWknCQUnZKJlQawsbb/R6DYLt0NlwpkK5q+B5uh4cl7
 kq4UnvALsghb7p84K1nYZ43IKYhaeH0AvYe7Q0nL3rFlNOTwi0+nCoCC8v9EleQ4sNat1X3RRxR
 Bu8JX6oRfVsvIDPeQ1hzmdLHAmva4nLqWQQ3yEu8cwGljT1m2fYTuEzrn7BQnFKV/xC5rID1TqV
 vbAdvyBu4MsxqHL8865ARm42fwwkprl2/gxxZdxmhDNYDD0KmvvJ3WQ0qiDzJATfz6/2/NPYVWP
 V56tjRRvGbYMRoQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/flash/leds-aat1290.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/flash/leds-aat1290.c b/drivers/leds/flash/leds-aat1290.c
index e8f9dd293592..c7b6a1f01288 100644
--- a/drivers/leds/flash/leds-aat1290.c
+++ b/drivers/leds/flash/leds-aat1290.c
@@ -7,6 +7,7 @@
  *	Author: Jacek Anaszewski <j.anaszewski@samsung.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/led-class-flash.h>
@@ -215,7 +216,6 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
 			struct device_node **sub_node)
 {
 	struct device *dev = &led->pdev->dev;
-	struct device_node *child_node;
 #if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
 	struct pinctrl *pinctrl;
 #endif
@@ -246,7 +246,8 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
 	}
 #endif
 
-	child_node = of_get_next_available_child(dev_of_node(dev), NULL);
+	struct device_node *child_node __free(device_node) =
+		of_get_next_available_child(dev_of_node(dev), NULL);
 	if (!child_node) {
 		dev_err(dev, "No DT child node found for connected LED.\n");
 		return -EINVAL;
@@ -267,7 +268,7 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
 	if (ret < 0) {
 		dev_err(dev,
 			"flash-max-microamp DT property missing\n");
-		goto err_parse_dt;
+		return ret;
 	}
 
 	ret = of_property_read_u32(child_node, "flash-max-timeout-us",
@@ -275,15 +276,12 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
 	if (ret < 0) {
 		dev_err(dev,
 			"flash-max-timeout-us DT property missing\n");
-		goto err_parse_dt;
+		return ret;
 	}
 
 	*sub_node = child_node;
 
-err_parse_dt:
-	of_node_put(child_node);
-
-	return ret;
+	return 0;
 }
 
 static void aat1290_led_validate_mm_current(struct aat1290_led *led,

-- 
2.43.0


