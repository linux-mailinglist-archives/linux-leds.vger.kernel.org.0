Return-Path: <linux-leds+bounces-5214-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B98B20ADC
	for <lists+linux-leds@lfdr.de>; Mon, 11 Aug 2025 15:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B2E12A3B3E
	for <lists+linux-leds@lfdr.de>; Mon, 11 Aug 2025 13:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B96021CC51;
	Mon, 11 Aug 2025 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gDlPurdN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DC920F088
	for <linux-leds@vger.kernel.org>; Mon, 11 Aug 2025 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920458; cv=none; b=d+nPEiIRPXN0IDcbsvQKwinmaTsujaj4AFdTwfrgSXkyqRKcIbWJNNsMWnc2nLRvfY3YS2Z7++L9cSLI2nlrfRj9cB4WZO0iH0vHC7SNLz6RmemG4vTo9svcVeygRbH6JOEqfS+4T3DOeL9VvWRxjqiw7tdOmNaFhbSoidR/W2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920458; c=relaxed/simple;
	bh=TwhL9kHuNMw1ekpCMBDV2BMjjP7HjIb5JBPWSmFWyGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P34ZhA/3XnIUoutJYczhlX0YPSgenX43mjNcZkon9q9YyuP87F+5ZEkDmstcqU1hw2JdYBH/oCxKjYLBumA3k8iPg0xPegLXoa5WVYRyeRtS+0/Od1NHC54x01vcyclxOEUd0c2LkRjTi4IETt1iljH6dSW4fsts+EUqZ6s5uVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gDlPurdN; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-af940717331so58855866b.1
        for <linux-leds@vger.kernel.org>; Mon, 11 Aug 2025 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754920455; x=1755525255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqhbJGyWXO0pDEnjUQmQZz1y0G16+abJkAfpIFUeykg=;
        b=gDlPurdNgV+ShMjUJIzjWDW7Un0Ite+W8OKQMgZlXeNon2eBJbcJFUT9dNY5PCPrLr
         hSdmx6RzOaRyTRhH8RqSQkL6wMaJVaHAH0rXbeIp16HAHL4etxY25/A0mH4rKKdCnMla
         zNYzMkv4YcAU8v3kqGprnaDZ1G5IgLIqzsfuzmP1HGbYjXBmwphjuairxnb7oN6r0nab
         Nx6NCGMnZCrDBIeHeW0yKzy8p9ERTDZRf4xNfBLN5FqcC0GK4jks57llMWR637VEK377
         4JcuKZxh25rSbnISZtXU/b34IgXATa9hdQ+0/TPy41dpJYo4OIlGMvciGoBG56F4yUlp
         y/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920455; x=1755525255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqhbJGyWXO0pDEnjUQmQZz1y0G16+abJkAfpIFUeykg=;
        b=MlRuXjhKCBhngqLJ26naGxj2n4WQR2162gVgilvtSHIaW/m24wvhuULoZdJMlsOsMD
         fMMCBYflrn1Q0pAqx6AUIumC2nYWeJvTluSBzF8E5x+zC7UXjGt+lE+NW8kEH/hkgLIj
         Bnxb0MAl5/sXvUklLM3gJhKwOizO4p0KPqWnU+VxhfTG7O4Y5mwaUGzTGVO9Nh/gNkjH
         paZh4a2cIUXcTdsuB47mvXHGzH/ct4vfZyVrU9oOYXdTZ7zARMUnOEFLmlltaFtY5qU6
         STzNf4pXvkLqgUZLhhqd/FzVeLgO25ggu+X1qXF6XiasMidQ4IEmJoNNJWi1/alMOoVC
         EG9g==
X-Gm-Message-State: AOJu0Yxra38dFeqokNOhcjSypsYuIH+5I20YS+07UZbHRvlsJGQQRJ6R
	G0lfgFeJwxy/V9Aw/xH5lJFQ9Tgz1lSYstdR/0UK0ooW60ZfSVZbKD4CGF+YAzHkNro=
X-Gm-Gg: ASbGncu+uZFXkN3YkEs0tv9jgKl0Zv+LoLaskv9rA5OdzbyVoq9M6dUYZratmboBIsx
	qW6HtK47x8gdrEbr/MYpSidFHfvJHFDIUrttODv1oyMZGuQBL2egGDTu5rZxh/Bcf35AKL5m+E7
	A4l3Oy4QzJhJ0pCa15zUrJRXc+2ymvaKNLEOK9+6Jyw579kLU+7cXOtCZgR/AubePKILHqhwcAu
	HjlKKdws1tw8OjoIYbbRMUcFsi/Hry0WsgKOWJ00KVyG1ZM8I+r4eenTAC4GSkr94Wxb/zFoLup
	zAu7NmWrnu53ENNP4N84cX5IwTz637hi5wcmYh0MnHn7Ji0IEujjPSXC81QyH83GRGTPmwYDTFh
	tl/++Y0FRLpaje59tdpyaMZ34OVlbYq1JQc/4VAQ=
X-Google-Smtp-Source: AGHT+IE/1LgQrqO5eCCRUgilyifCk6jF84Qp9fDrZOql9XlTeOhTTbm9h/YyeGwJTKKvwOp71PXCZA==
X-Received: by 2002:a17:907:2d93:b0:ad8:a2b3:66fb with SMTP id a640c23a62f3a-af9deaaef27mr385687866b.3.1754920454644;
        Mon, 11 Aug 2025 06:54:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af986a477c4sm1179029866b.56.2025.08.11.06.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:54:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 11 Aug 2025 15:54:03 +0200
Subject: [PATCH RESEND 1/2] dt-bindings: leds: issi,is31fl319x: Drop 'db'
 suffix duplicating dtschema
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-dt-bindings-db-v1-1-457301523bb5@linaro.org>
References: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
In-Reply-To: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
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
 bh=TwhL9kHuNMw1ekpCMBDV2BMjjP7HjIb5JBPWSmFWyGU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBomfYBFR4XrobLEhq7B1bbNoPCguuPOvtUYVs7T
 QoK2ACsJb2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJn2AQAKCRDBN2bmhouD
 1wX9D/0fgTSAEgjcithvcnihEli0+dhJu1IjNs8D4hs34omPoQQtm7fLqC0xRc+ZgX+vvRs/uD2
 WJrb3kblxWU4xiiT2m000ekQdnlQJaQdGA7JPSgu1YHHgsZdPxdPCzmKkJnxWRBqmcpbAybQ5Yy
 aBb+UA7EY96reCOw9mokeqAoqnZ2UldILGg9i7xKZsJLQbKGeofk6QjjMnA1H/o5IKGB5xBG2X+
 g5TmwluhQkVyB3TSat40bnb5Xx97fS1rLdBvp1o895jugOym4riUHY1DdvdxmqbvimR8uLxq6B5
 pdpTg1Qys0jqZAewiH/s/zRgAARR7toakmq2G0iwAmekvGXDKwpcDQdpnKH8azu0whlaUXlL2Dt
 b8PKF3JNOH8d1FteVKbm2Lb0ODRIPukQlCgDCpJ36p5G5qLjsqKAuEFUVlUYo8u+MVwdsYSPtu+
 P+whAhlYtCLDufA9vaHELAT5beRGjxzHJzxGv5kIDu7kXC/gK8kzjkN8GCFzRdAh3zrGqFldfAf
 vauniUM6e8Ta4Kd9uO//LDT+PZ6m4psOUj6cgsQUekspxFkVGOpYhfSExqaC3LrPWJgclAsVIMI
 FwPf7TcgRnrUAZVrOwLY14f5bD/yb01z9NYzpvW9iorDod4J2OjqkHSpwJPkzp1ILLvEX/V1530
 QU/fB9vh8kGxMXw==
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
2.48.1


