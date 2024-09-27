Return-Path: <linux-leds+bounces-2869-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5E5988C74
	for <lists+linux-leds@lfdr.de>; Sat, 28 Sep 2024 00:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F24F1C20E53
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 22:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F48188CD8;
	Fri, 27 Sep 2024 22:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v5CMLCZ9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3959418C031
	for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2024 22:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727476196; cv=none; b=Zn6XXt71nJm1GTm7kJMF7PpqNCAO16qrKDUb4bkNyCkUIiy0w2uaSy31FOrRER3jKI5uV8aRy0uuq6tDQGI6/f3U/RQzLudH0XpHTtRM19DEyb31vfQSzOVDZvHUTEaQVWizypQ30sxw3m9H9b6E2uo9ZWXn94L1i0IKjTLjJds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727476196; c=relaxed/simple;
	bh=FmGcDe1p/XryRMot0XsEfBe1wWBOoapRPT+K+lRDZVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PCfJSEYHf21W6EFsOuU1Sj0TiQt82WbJ7xmHkRvnW2s1W1/5WqnBb/kz8d05mKv/rHAbcuOkaruDhE7iqO46VaHt7+wcwmVPmhsRiIdewi5TTJ0d0HhOEH6T8bfDGWoUdv8+4oxb5E64YzRspuQEleRJ78PQbPUCX3IGXUjRhR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v5CMLCZ9; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8ce5db8668so411765466b.1
        for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2024 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727476194; x=1728080994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3LUVzEQIz/A5tXIUDtOQ9ez96BC3u8YRQCjYb/XLh+M=;
        b=v5CMLCZ96CVN8GhX801mFuZAszZjsM7C5Gj7zP9KftndCbjfPU9pFzBjE3tYiNdVRz
         pwMgsrToxhh80kf+z/cb/INye2ByscwHVbzgXhFXahp7g7ZdWjmSxfCCtLC2iLxAG7Ym
         49UfpYluO0zqE0HxVVoCu4DDCXKG0MvH8IIW8qGDQ96zPvK/aRAykCmWeipPr1VdXOLb
         YRNQOZb2Nsp9owJg9WwY+KP1dzpuofHJbrTdW/hisGaWSwh7kuQjssbaOfbKZdmxSXUX
         xFp06pUYLxr/7hEzpQ5Trzqf/XLoHuG8NpZHc8Np7Al424UdebCF5XvDYSr1bF0PC6HO
         ocSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727476194; x=1728080994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LUVzEQIz/A5tXIUDtOQ9ez96BC3u8YRQCjYb/XLh+M=;
        b=GyjCLg1v+ph9nuFIVpblInz4MCJb5O1HuhKVWR+1j6q0leKSrbquzXO62YG2tRYZ1S
         nsJc2IffcibpuHX63KoTD7brJ9IwVCjsw7/4DWXZWRjrjI2R2gni2OH5kzuxaTWt9xjL
         Jhi2D9O0RSPB4VpY7jmPJ1+9zM9zhR2kvL69ehd2Jp5c6nqGh/XunvUoN2Dy7bXHIbim
         pz4H5vVXWny13JciXIDGOSncvgIqkPhIyXNTLbYy11jfi5xOxEBUtcP1DdwhqaiQn1al
         kpW42G1QP6Qd5IW0yH2a9tmQOyhW6Fvws7unCgN+M0xL81Fm+gu+gjj30f9kcsQO40Gh
         WO7g==
X-Gm-Message-State: AOJu0YzpQtLIQYCqN4ayNLUCwZtsi/z7AfbiBgzT40i0Hkp1s5BXrf/r
	0EpNgLiTAn7X/5Hif06xn66eUGtjYhuA/eBC+GbkOJXZhpDd2UkjkEwOix2cpj4=
X-Google-Smtp-Source: AGHT+IHB0zTVjEfwaHCQx8PIwBJBJrhn37SfrjLIPeiADOfkCNOJ4wTJti1Tz9xOpDocnW+tseBUwQ==
X-Received: by 2002:a17:907:930a:b0:a8b:ddf4:46f1 with SMTP id a640c23a62f3a-a93c4a98de5mr450042266b.63.1727476193687;
        Fri, 27 Sep 2024 15:29:53 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c29460eesm179504066b.119.2024.09.27.15.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 15:29:52 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 28 Sep 2024 00:29:47 +0200
Subject: [PATCH v2 1/4] dt-bindings: leds: bcm63138: Add shift register
 bits
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240928-bcm63138-leds-v2-1-f6aa4d4d6ef2@linaro.org>
References: <20240928-bcm63138-leds-v2-0-f6aa4d4d6ef2@linaro.org>
In-Reply-To: <20240928-bcm63138-leds-v2-0-f6aa4d4d6ef2@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

The BCM63138 family of serial LED controllers has a register
where we can set up bits for the shift registers. These are
the number of rounds the bits need to be shifted before all
bits have been shifted through the external shift registers.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Drop the $ref to u32 since the new property is suffixed
  with "-bits" and thus get standard treatment.
---
 Documentation/devicetree/bindings/leds/leds-bcm63138.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml b/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
index bb20394fca5c..b3d530c46061 100644
--- a/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
@@ -41,6 +41,17 @@ properties:
   "#size-cells":
     const: 0
 
+  brcm,serial-shift-bits:
+    minimum: 1
+    maximum: 32
+    description:
+      This describes the number of 8-bit serial shifters
+      connected to the LED controller block. The hardware
+      is typically using 8-bit shift registers with 8 LEDs
+      per shift register, so 4 shifters results in 32 LEDs
+      or 2 shifters give 16 LEDs etc, but the hardware
+      supports any odd number of registers.
+
 patternProperties:
   "^led@[a-f0-9]+$":
     type: object
@@ -71,6 +82,7 @@ examples:
     leds@ff800800 {
         compatible = "brcm,bcm4908-leds", "brcm,bcm63138-leds";
         reg = <0xff800800 0xdc>;
+        brcm,serial-shift-bits = <16>;
 
         #address-cells = <1>;
         #size-cells = <0>;

-- 
2.46.1


