Return-Path: <linux-leds+bounces-2787-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 667C297DA5B
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 23:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF45128406C
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 21:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4554418661C;
	Fri, 20 Sep 2024 21:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AvTKklaz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D6C17CA1B
	for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726869557; cv=none; b=Yihk12jwyZRzK/rJgX04Koj9p11Jz0tB2l1ytPvU0TSAQbC4coMAENiccwxu1DH1hvo2WOcTYourDhWqwKDLH30uSfM6oua0fy8xKNHJabEoFeghbTXtLShgy+0EIY6Hn+stqRRLegXUo7ECwH2lVmo/CkAoLznE8xLoOavb/38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726869557; c=relaxed/simple;
	bh=lUeowZsuetVPiSHDEbEzNurIe9ysnNsSoEY4sOMCr4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJ5rjeAg3r6FvQG6GJit8lhcOPQySypJbw+RUiCBAW5sgk678Y6kMRo4rlhGF9BvWJck8xy9ovRebCOCkLnuBKqWyuBR+HGSsSbbVfmzAP9adgQsP/xPbCbuKBziL/1i9C9vsnYa+SVKUP6mUOAuH6ezT43IfvbM+tuclnw+CxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AvTKklaz; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8d2daa2262so279749366b.1
        for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 14:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726869554; x=1727474354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xu7r0984CtbTq2n9dKs5JPNziAceYOtF1liwcsGF7Bc=;
        b=AvTKklazhNuziG74RQ1o45tZz3kqYNxtF4fBQO83jaVA9Wb7l2CX/lL596bVCqANR+
         jH8qXDNne+nW3q2cNze/BnmN1PlkC6nyVCpvW42NzbXmxtUDYhHt1Bi66Zt5p5BiiiuV
         g413TsMnPYIWEwfetgDy19QJvr95IZfXmnKixnhUpTmKqORzmTQ6jzPKnBYlJOZoEgYO
         Y1p/SfYVFANfo5Ge3wNwRKIkugWDa7zI3ngTlOohiY3ewvqkN+b9aszJzj0PoAniUMsg
         JRH8/xg+i5gtCBKp6ljjg42m1hCerjVuxPDmIFl/CCNRD9+RGHtyO++HkUYuI+SY+5Oi
         cqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726869554; x=1727474354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xu7r0984CtbTq2n9dKs5JPNziAceYOtF1liwcsGF7Bc=;
        b=mzsHBCgbztdw5ENax8g/wUpHK67Mcj64hsLJdWr0OV2UNHkgVX+E6POv8zsEYbDwgW
         hrnHH7YG31WsnkkfngeyhjEMcogi+X3C8kjxcD0oee75lQNCxiJdwxKG42cUZH4V0+U+
         bi9ci0eL53TEa+k2MN9myqz/8p+SBDoNfhb5Twra0BxZZoKTc+/fTRfDUNkJ+397rwBG
         dpR317nqHiDTBSN+dBzdJbaS69s0WvUe94vB3GuWoJi/T6kDl7IB/JyUtb/sLfuO/bfJ
         LEvfh/3wHKKUfqeUjchewhbvf0CKslUX/S6PYGZ0jmagVQ0z/AHnApZI03lHzx/XtB0C
         bFzw==
X-Gm-Message-State: AOJu0Yw0PIIp5/IxV6zPaonvMgSnD4AcAGJF6ze8bbUN3ZCZBWeOK1fA
	kgWf5VmTuf0sfIjyjTJeLZNaqgfKxr0tDujjuk05SPrI8EvFWAREqvUo59MgG00=
X-Google-Smtp-Source: AGHT+IH2PEu4pnjfpc5VAgi0Jk5JwhFWIMQJgd6STqWnsq0CSHKCP8pK/ncoPOoMq32YlSiPLi8meg==
X-Received: by 2002:a17:906:bc10:b0:a8a:6db5:7e42 with SMTP id a640c23a62f3a-a90d4fdfe74mr391446866b.9.1726869553220;
        Fri, 20 Sep 2024 14:59:13 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3a04sm900617766b.125.2024.09.20.14.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 14:59:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Sep 2024 23:59:03 +0200
Subject: [PATCH 1/4] dt-bindings: leds: bcm63128: Add shift register bits
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240920-bcm63138-leds-v1-1-c150871324a0@linaro.org>
References: <20240920-bcm63138-leds-v1-0-c150871324a0@linaro.org>
In-Reply-To: <20240920-bcm63138-leds-v1-0-c150871324a0@linaro.org>
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
 Documentation/devicetree/bindings/leds/leds-bcm63138.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml b/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
index bb20394fca5c..d27148279ead 100644
--- a/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
@@ -41,6 +41,18 @@ properties:
   "#size-cells":
     const: 0
 
+  brcm,serial-shift-bits:
+    $ref: /schemas/types.yaml#/definitions/uint32
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
@@ -71,6 +83,7 @@ examples:
     leds@ff800800 {
         compatible = "brcm,bcm4908-leds", "brcm,bcm63138-leds";
         reg = <0xff800800 0xdc>;
+        brcm,serial-shift-bits = <16>;
 
         #address-cells = <1>;
         #size-cells = <0>;

-- 
2.46.0


