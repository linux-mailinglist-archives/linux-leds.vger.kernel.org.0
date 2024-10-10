Return-Path: <linux-leds+bounces-3043-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C30F9988D9
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 16:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 259071F25AF5
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 14:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A215A1CB322;
	Thu, 10 Oct 2024 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jLdCEtHp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53C61BDA99
	for <linux-leds@vger.kernel.org>; Thu, 10 Oct 2024 14:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569460; cv=none; b=PhXHMOhrOFYXeAPZPG7JFt3p9M9z4miiFS4AvxEuxg33ZddXdn66KWoAY2Qu52y1FzHYxg4hQJzszu0/ikKbWbQ7/qpqUUllAezpu0LMzsRfc1zTXIrvwtY2KW1bno0dhxb7iVnNT5cEvyLfh1mgFC5wi+AKG7UHntMH32RPwmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569460; c=relaxed/simple;
	bh=0Qglc/xTIffv1fsSKk0eokjPIP1tzyiC6cSA5ONdmlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ICmzG6xQC4lBubVYXaWHIiFJRFXNud+qOaNQTGIIi0zXqDxK7XPPkFb4hrhwNoI3n6cmLkwbuKr0Z4mTHkCLvXO1u0iG8UycKQVXBMMG4/5JK0JP7m0pVuUFQVwZTLhMcYvmrmvYEm+xqkNv0vCBQxbZHyhJeK/5aQ2BLoUoiA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jLdCEtHp; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9951fba3b4so154385566b.1
        for <linux-leds@vger.kernel.org>; Thu, 10 Oct 2024 07:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728569457; x=1729174257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IW8XCdBGRYIhZReATpdQK1C+vM89LTQJraH135VfcEI=;
        b=jLdCEtHpWvr2vIgWSFGobfykvXRRT87ZF3lfvdcGlsWp/DUPU1J6TwTpO4UKU5/fyk
         aDjhc4XhnbwK2Fny9jv5xLsKH3iJ7a8vOugnMkcU0Bjuw6SuRbcWIX2uF4ArSClJdiT1
         oD9OEn+g1K04WTTWZnDsVHJbUsf9Swy+yhF/ne4Q/+CxaNe8RBYCUCqNVxizQjMRJHhX
         5A0zuPV15KwbfdFeZ1ICjNeipLG3skczN8og/viw5frwq7/ppuomdubJTVA5t9PDZuqe
         Sn2CoJbm0LX3TkcczWbSph1I/Ev+dA+5Ts1Fp7e5FPUPx1lfPRq9byb1UBFREfAi2o2E
         g+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728569457; x=1729174257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IW8XCdBGRYIhZReATpdQK1C+vM89LTQJraH135VfcEI=;
        b=l6eWgsMa2GqQzmFIPz9OfCu9GeZO8ogyUl+xn4l2K7WjOd/4RbTwzH79sUJBgXhriL
         6uvQkBlqOCTQDpkQ9O8kdq9WgvTemQ35l+l+Qp6o1IIC58HK1AN3DSX0zzxwiAPux60u
         2Af2XZ+NfP2pAu8TW/Vf9HaO/Iz45zgngIxjRnCAU7gIMijh4zfjh/wNwXDyTj+3FE2v
         zfAI32IAyX3suCZJoQ0RIH9Toc1EVp/5ooGloSROT/vo7IEC6kyqZwDMgxhPe8Taqg4H
         QYDVwloeKIL5bv7PF/cLj3k+FxD1/wcByX1pWGIYQuab26u7KaOnMHpF+uggPLpNz3zQ
         TD6w==
X-Gm-Message-State: AOJu0Yybhrgijt5dMaZDtWA1Vgpr+9weJyhXO3/7GXLT2XmhPKVa/Jnq
	zoXRFCs0ZzxoMC7mz9yDFh3AEQhWtDyie7+SRnne9SuRzeCea2OjhMleflnQIrg=
X-Google-Smtp-Source: AGHT+IF9T6MbyVFvtNK4bdZhjMeVz375HJKPnDEOmxQLJ4N6tuKly16JWaZNHR28YKCpHdpsPQ+hUw==
X-Received: by 2002:a17:907:c899:b0:a99:56e1:bd30 with SMTP id a640c23a62f3a-a998d313b3amr552425666b.42.1728569457039;
        Thu, 10 Oct 2024 07:10:57 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7ec5704sm94540866b.23.2024.10.10.07.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 07:10:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Oct 2024 16:10:50 +0200
Subject: [PATCH v4 1/4] dt-bindings: leds: bcm63138: Add shift register
 bits
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-bcm63138-leds-v4-1-cdb80780a555@linaro.org>
References: <20241010-bcm63138-leds-v4-0-cdb80780a555@linaro.org>
In-Reply-To: <20241010-bcm63138-leds-v4-0-cdb80780a555@linaro.org>
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
ChangeLog v2->v3:
- Mention that HW defaults will be used if the shift
  register property is missing.
ChangeLog v1->v2:
- Drop the $ref to u32 since the new property is suffixed
  with "-bits" and thus get standard treatment.
---
 Documentation/devicetree/bindings/leds/leds-bcm63138.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml b/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
index bb20394fca5c..62326507c1aa 100644
--- a/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
@@ -41,6 +41,16 @@ properties:
   "#size-cells":
     const: 0
 
+  brcm,serial-shift-bits:
+    minimum: 1
+    maximum: 32
+    description:
+      This describes the number of 8-bit serial shifters connected to the LED
+      controller block. The hardware is typically using 8-bit shift registers
+      with 8 LEDs per shift register, so 4 shifters results in 32 LEDs or 2
+      shifters give 16 LEDs etc, but the hardware supports any odd number of
+      registers. If left unspecified, the hardware boot-time default is used.
+
 patternProperties:
   "^led@[a-f0-9]+$":
     type: object
@@ -71,6 +81,7 @@ examples:
     leds@ff800800 {
         compatible = "brcm,bcm4908-leds", "brcm,bcm63138-leds";
         reg = <0xff800800 0xdc>;
+        brcm,serial-shift-bits = <16>;
 
         #address-cells = <1>;
         #size-cells = <0>;

-- 
2.46.2


