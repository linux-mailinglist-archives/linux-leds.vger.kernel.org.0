Return-Path: <linux-leds+bounces-2460-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD388954DCB
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CF641F2109E
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 15:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1421C4632;
	Fri, 16 Aug 2024 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M5Wq6bGl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016B91C4607
	for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 15:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723822339; cv=none; b=eBeJ8k95FEeZeVcf1BeJ56KHUnbA9E+MURzqaiMcJGBptSX5a9yTWBkw3FGYij87PKOvBSwN1W0t5rPzJ4W4fZrkLImmoG3hnlf4he3OGcB0Lcqisx0usv6G4207Zh2ylwRnG7IfbavHF+hA8NJ1rPpLpZgSmSbFgENqQp95IQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723822339; c=relaxed/simple;
	bh=P/bMkN6MpG1hpAYn2CS2V4doNmtsHBv2dg+qwQSz6uY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kU+wqxruPZPnd0uDEUtAHqIusfESFVW8iMExjdm65LuAOkUkQBBCENPP5Md7O7hAijYv8CJt0dJPXU/2uYwd76ldOUBn7BzmtJ+uXX5rPfRZX3nWY8oVal75EN4G2PhIi0+1KSAdLnynanmmThTKypbnQDju9Zy+vLyZCHJimUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M5Wq6bGl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso15479625e9.1
        for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 08:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822336; x=1724427136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82u0aLxCOMmAENgy1g3HMnv8Q8OUR/q6nxVGVYKir68=;
        b=M5Wq6bGlzKHiX/nRBnmIYHjJ1DoteqazCN3RhFOOxAVrUbIkuapXgRjDRQB5HaOqRt
         O82Vb4QsyeKOC4QRYEpQn/DyP7C/vo0SOwiZAZvA17C2R9z5NHjfNkhr8YMo6Ox+8bSx
         pt8LgWboGLo5TiUEKpLXSFKxXb+MQ+POa/StDqAtH0PGpmxUvnVL19kcjHvNsPx6JcdF
         4a6p0RAxMoA92yQLxGsF8u1Xqqap90P6xkr2/25A32eCxsjthNVhFwe85OPqHGiKd30q
         HJ4C42QWqUXG8tQO3WfsoLDNX5vp9wuuy1gXB5ODVE6gc0oTKH9utDsPlrO2gtBLHPeX
         fFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822336; x=1724427136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82u0aLxCOMmAENgy1g3HMnv8Q8OUR/q6nxVGVYKir68=;
        b=SRj6hmSzNIp+SpbfklrhcoaBCjTxL9amKWQ6j2nilN8agJzDDxOl5hFOY/s0nSmEN3
         7wKUIxGNPdoiOFrVIB3g4nTJ+mbztOcaW5qqdKajCjPvRiPJGLRj3t5ZZoyhPISJxkhZ
         iM8J4YBFybLxE8KQwtzK8f6C3iZIjH6uF4OLddlA/n+Pew77kImDOF09EnAS//UyohnQ
         Fl4WY4+si91tvMBWq0FG1c5+dwHPckiIqzyRwC5lc0IpdnI8vKpiPVOScmOS4w7DdRXn
         J+WWSi3tJ9u2BfA8iaEP1VM9iNqgwhg+jS8YW5qgruuUxrlDqZJvdo7Gb2ukg0pklaqi
         0HXA==
X-Gm-Message-State: AOJu0YzAkpvljbksZt538R4ynlRAaQv2izOJajDqeP4gI9rd6kHIx64f
	WuSY7jFOQQJkqWrKpt8jbTGVxUGQKujYAp8MHTWcl40FI+NyXIi31I6MYEvD/Gk=
X-Google-Smtp-Source: AGHT+IFoty7tTAPOCyav/M+yMTn7h/aGTkjK2dWYaVz5fLcCWS//Y230cKvMHPE242A86aP9/IgluA==
X-Received: by 2002:a05:600c:46cf:b0:426:64f4:7793 with SMTP id 5b1f17b1804b1-429ed7af3d8mr25468635e9.22.1723822336156;
        Fri, 16 Aug 2024 08:32:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:47 +0200
Subject: [PATCH 15/17] leds: sc27xx: Simplify with scoped for each OF child
 loop
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-15-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=P/bMkN6MpG1hpAYn2CS2V4doNmtsHBv2dg+qwQSz6uY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3Dm8noI8EzoG5LCskKgbLFVnnrv1PYZVipeX
 tFmNsyKbeGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w5gAKCRDBN2bmhouD
 180EEACar4IcrZlsd3xk9bIpi0NxSlkXiLAuI8nxmW6mz+cNcfhPQWr4juEKIKU8SWq8Bcjuz0A
 RA0/Qwpgh/ThAWVSamp8X55go6COy9pVnFY/WIozfcjxLDmnjQc2rNa03f5aknsPajDOz2WoySW
 vV/UYxxrb2GFPccA/TJERMXE5GeOfqMzjLmOmv2GvpLO6MLT77aVmgva9B55Rg8FG2SyQx0J7pE
 Lo3Sb5LhsPgASPhBfGo1CNKh/s7c0mO4IhaZIY9gT/M+cJ3k5+2F+tBX95He9It9KNZkpBRh8mF
 qMOxPToh9G+2XWQbtx7/6RT1NWgXf0xEbwhed0/huc3VhD3QRluxkKuxaUuWrVlS+mRbjiCqm4z
 pKWcD56pWCpwCxStIm4WVykqOfcDFy7YZTDuSt3s5rxPTEkWutlE/sag3C3XQ8DXw76QWs8k3YE
 Aj5VT+19zWwY9Gsa7lvRt/KKMZpWgL2FZA+YPZHGspCt0j2sSimeiy3R0rUMnY7U+yVbXXAy1R7
 ely/fkQQKsGD6yfysPNqnHAvqiH4vxarsInC0k7iVnm8T8hj1Kd+axD2KUF+Ap1hUF8wvNRJY9O
 +8lEqFLj2LocXZuxPu+xEX1QvniXbD8I0kYayTZoa+jVonEkM36vST9pM1G2uzlrWhIDTSKn7S7
 mTyIm3ENeFrPMCA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-sc27xx-bltc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-sc27xx-bltc.c b/drivers/leds/leds-sc27xx-bltc.c
index f04db793e8d6..cca98c644aa6 100644
--- a/drivers/leds/leds-sc27xx-bltc.c
+++ b/drivers/leds/leds-sc27xx-bltc.c
@@ -276,7 +276,7 @@ static int sc27xx_led_register(struct device *dev, struct sc27xx_led_priv *priv)
 static int sc27xx_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev_of_node(dev), *child;
+	struct device_node *np = dev_of_node(dev);
 	struct sc27xx_led_priv *priv;
 	u32 base, count, reg;
 	int err;
@@ -304,17 +304,13 @@ static int sc27xx_led_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		err = of_property_read_u32(child, "reg", &reg);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 
-		if (reg >= SC27XX_LEDS_MAX || priv->leds[reg].active) {
-			of_node_put(child);
+		if (reg >= SC27XX_LEDS_MAX || priv->leds[reg].active)
 			return -EINVAL;
-		}
 
 		priv->leds[reg].fwnode = of_fwnode_handle(child);
 		priv->leds[reg].active = true;

-- 
2.43.0


