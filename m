Return-Path: <linux-leds+bounces-4891-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E3EAEB0D9
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 10:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E068018985BE
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 08:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6BC237164;
	Fri, 27 Jun 2025 08:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PsOzgwgS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C1323027C
	for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 08:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011325; cv=none; b=S8ccUmtepGOIY6PxSJV/3hPlNYVPdgM/NUVx8HkVZ7AVZVazUIoMm0MEcyx9UIqPD3dp+65cyzWcbQ0mSBs4UH9xr2MdIVbs3ayIms638Fui44P5waIhDiuiP42Ty+6Of555Vcj2bU+SGmVE7IqKIQ3jgTVoUoObJs7pucEDhlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011325; c=relaxed/simple;
	bh=PwmTdHsj4/TIhdqdhH2xWAIrULM+XVHbnLKlVFqmrQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TsQP+9V/+XU3xaKVh5Xj/9lLA6+SkV+ZZz5VVJgtdXAKVCZ9jEnpBSKP9ZFX3fhhB9CZuKgq0ejjB+AtAlWMwAzY7jLAD7ETaf5XSjygOMqcc8LIBbK5u/m/vD7XS6BDPMcex+cKsifSu9Kf+nHNGSc4YNfIbtA6RWykYzHpjp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PsOzgwgS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a577f164c8so257387f8f.2
        for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 01:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751011321; x=1751616121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYKyHT6aO5DOvkeXEodSr/zn4tG0sPpdUKZb0fO86vs=;
        b=PsOzgwgS3Gy9VrlLf2Ub++c0tjjE8KPUUW05h/0bQIb+3XDlKLe8C1dlwAAPueyHR4
         Hse+ejm58Yh2C82DsiuL+EmtejSaA0DMPvxB+08kSLU9CJxrsOb+/9Npz7HWf2CNnVmB
         yLM2bprcU5yVLkaqgZbFHq0y7pt/3CLNPv4/4EwQUDappLy/fIekbV9mBBLqebzcYqpJ
         ZzMqvPN9hRWA/U8/z8TnUP8O2Xcsm7zuiEWumbNDldserLHBlk4JMpd07QHQSTvT/Fey
         BJVKthL9gPnW1vgRJbLFNaPbGFDTbFHI4MlJfUqCs2N998oY9E3JZSHe2hoJ8N9nNYG/
         t18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751011321; x=1751616121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYKyHT6aO5DOvkeXEodSr/zn4tG0sPpdUKZb0fO86vs=;
        b=TU1CEhsr4P83qm1atkdRTN1APriN8kFepGA1FY5V5wznHIja1vupulIGKL5nRgmK3z
         unuat6mUFpRReHILYJFGgLXQa67xgxbq9pcqVioJrSYxWPfFCQBMNVcoX67/rzNzuPhW
         v804tkhqpQSwq7Sp5jOF+VM4m+Cb2T2UPkRVIqILRtq/RZKX9oHKWjP3mukteuVC1t/p
         27fkmRRwcYW+gMQSVvDyMqAz3ryMWL9hE5gLBNzsVbc3esTRVEQP3n0sn+Auh8Wo1Kkl
         EKtsfuPFQaxIBXb6nJABgshOcS+XNF2IHs7eCQM6bMufZSc0curtgdtuzS28M7j4Qx5K
         ET1w==
X-Gm-Message-State: AOJu0Yxek3C7fFx57u6j0B+BEl7INdhP6AJOfYbBD9RjxXDDUrm7Gwaj
	sR/3HjcDWAJ0c9HdVA6ZA5+vbPkv3j1Wc8NhAybzmo0IhPwutAlUb21LXYw3E1ESIgc=
X-Gm-Gg: ASbGncvOHDVlOd0SkCIOK75UUnBqdYgNgWHbqEOEpFjHNxwXXAhOrrH90Uvvpx4og29
	OfFJhJn+D3GCDGVkGKatkLsm9WdpePzAzC0xyFDXrvXeYzb8kRj0g2/uDpeNsvX8Zw3LNTQG8D6
	0aFtBW1tCE2kJNff7nxKnwX1/emUwSgKxgjXkI/ZKrFAD7TNur9HPOxN0+Jrpig+WNi6bAg4wI2
	LfSbP8EGfmzSu7M7Gc62sRp5BDcevwGCHq5J7atLU9pQ0X8T6VGUtlkMCP7myH+CBu+FrrJ3Sm/
	kzkMxdi0QIODlHIWZiywRuoZTaginwqhqWoqclEikyBrh508kYlI4Rf2mRn0NgEZtxgLC7Ae+Ii
	2
X-Google-Smtp-Source: AGHT+IGbEV2sUnNrxRFYjuNrRGMB7WXW//KusOejXZ3SR2Oskrso+cf6bF7nRXl/S837W13BPpM60A==
X-Received: by 2002:a05:600c:358d:b0:453:8c5:95d3 with SMTP id 5b1f17b1804b1-4538ee5d303mr8805925e9.7.1751011320856;
        Fri, 27 Jun 2025 01:02:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a423abbsm43490295e9.39.2025.06.27.01.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:02:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 27 Jun 2025 10:01:51 +0200
Subject: [PATCH 1/2] dt-bindings: leds: issi,is31fl319x: Drop 'db' suffix
 duplicating dtschema
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-dt-bindings-db-v1-1-d5c7072acbee@linaro.org>
References: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
In-Reply-To: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PwmTdHsj4/TIhdqdhH2xWAIrULM+XVHbnLKlVFqmrQc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoXk/zDffaVv55xO33AhhgMDKyChlptnb0LKWur
 /dA0UkREASJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaF5P8wAKCRDBN2bmhouD
 1yO3D/wMQLq1PsZux5RgQ00wXyiyyHfReZ+crthyF6UOADtqrkzEfMMHGxklbh8VFbm4OwQmyVd
 gQCQmXR3RSty42vCDsZK235jY80s6ogQudAcA7sudV9l03aos+6xp7c/FASx8Ziko10NlvSgyIE
 pfX4xD7FqMA//3i5ze18WV1q69K3iCcXy25FYV7bWbJJl1eHBBikOphoDL4HAeSMjG3U0GJ/MCh
 eyqUfl6OuiP2DJId69jXKDhc7OHJt8BGTBlh3KIoGc/3MF1ufLTnUc0cISc9cX7jk6aBSKBXZEl
 +U5JHKpIhuSPNZ4utuTREOV3BUO37GgGhdUnS6jOeLgePHd++txihWJ6zePHEzwGqkC7A7s2BeU
 +y7SXiwWPY45eVNiF5m4FlVdiA7GKi3KnaSu4BGwAg3vqaxS1ykJmQzjCHMmbwQK52sSFzlbnSW
 WPW9Qas3JC74gC623P192CvfOVPvyYv46Ul6REyHemhEo5eg7AduALAPCadm5Bk32gzTgGeOnKG
 uzNXOGn/N+8WVXWWKPBaxl1YaQeOAjaAWdAJ5M6f2iftZWDwXqbRpFmQx+EZXkzUEKWNSR9CVX9
 9P+fR7ARSG9kkSXJPCBWQec9OM4CShzGn9tpkRr7dESn6Gtteg9gCombIJ0NNhiw0s7muTsiNMC
 /rzMX3sNs4DelnA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

A common property unit suffix '-db' was added to dtschema, thus
in-kernel bindings should not reference the type.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

RFC because this depends on dtschema changes and should be accepted
after new dtschema is released with this merged:
https://github.com/devicetree-org/dt-schema/pull/166
---
 Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
index 3c0431c51159e549920b17cf2ddfd1b85ecde810..906735acfbaf94fa08244f771139df207dd6e4da 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
@@ -42,7 +42,6 @@ properties:
     description: GPIO attached to the SDB pin.
 
   audio-gain-db:
-    $ref: /schemas/types.yaml#/definitions/uint32
     default: 0
     description: Audio gain selection for external analog modulation input.
     enum: [0, 3, 6, 9, 12, 15, 18, 21]

-- 
2.43.0


