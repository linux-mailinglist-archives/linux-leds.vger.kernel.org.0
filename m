Return-Path: <linux-leds+bounces-2951-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B6D98FE46
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2024 09:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BE461C23267
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2024 07:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A8413B58F;
	Fri,  4 Oct 2024 07:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I2Gv3DQ6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871382209F
	for <linux-leds@vger.kernel.org>; Fri,  4 Oct 2024 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028770; cv=none; b=Whq/Rws/pAbHhi1JOETPFqDkEsgHsDcMy9QzJDnvl70MWBQuZIo6SpPnha3EjjThai7u597wxTwKI0gwfkU5WuYjOWDmnULUH/QLeGKjlZe8qRHu+I/btH0HOwkd0qm3DDO7HElZm/YUbvYYNLNmAh7Qhsb3qOyWBN8KbRrdN5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028770; c=relaxed/simple;
	bh=EGNoZIO/vlfcemr/RGHB02B7TfnoQUphfmCjY031KWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IncfoPeJnMXnSbrNG5LgAWa12zJADZMnEiaTXZ3Y0fRZFNHufpVu/NZ80gT1muyXu0bsnsPC4Gb7mfDv5UMJ+AnRtJUY0Fx2UU+Rc/yL1ASa4+WK9bJdzTgn4is9pX9pSAOkJvX+XeDZdoeXjNQ0sIi7JuYs/NhMe9OV2Gn9PFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I2Gv3DQ6; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37cd26c6dd1so1794893f8f.3
        for <linux-leds@vger.kernel.org>; Fri, 04 Oct 2024 00:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728028767; x=1728633567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZkBafPwhv6nYLIe7Fdcz5SMgpMEz1d8d1WiVoZDDR4=;
        b=I2Gv3DQ6iETBDW+ABXeTmEHkaz05RlBP7WnOi8Ta4W8ip02Jb+G1dcQ68/iO6Ck8Yb
         Nk7Q8lPL43fL7YW6J+8QShrl0xYLDpJXm3+lTEaRvfZ4j4xMyXV1TmvjE2i0482Jc+Zh
         ktaltDhHYnF+HdSLqad2qOC2a0eKCRcp5/pYaj1aRSShpc6mc81klxpLUhHwfsbm2hbI
         +vAsil35BDa6gAbKV4k/WaapoaBg9cjuW7LsBQfVVtEDSjvD7P6XuRgUkDzjBsrmwyCe
         yIwMLsxrk5SdXDi/wefIZ7D9iJRZiytkXtFTe+jPWkphgaXE0tepKWNgTzIJmA/pLRY+
         S/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728028767; x=1728633567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZkBafPwhv6nYLIe7Fdcz5SMgpMEz1d8d1WiVoZDDR4=;
        b=V6NlX2YiHz2bqoZCqFkOMly/1tyKfcWzcZ0naNkkEYPPE1/qEH2VoGfdNUpQiGHtH0
         DMSOJsu2b0Epyft45aydWJugqlTkyoDyFTQ0o6l5kuIRKjVuTraKwv4LE36M8fHhFqxs
         EugYEEtDPNOo4ToalIZ48AtwAWyZb6/K6ekCB+N+g2qZVDsd2XU7+UtnQLWDKqifR/vS
         pJdRbEZO5gQWup/Zl+RyYdqXzWeHj6rRK6/MrJNG3CFY6qsuxkZoZ8U9h3iOLdj2+ugA
         A/YTq4L1KuP1+3rkSsYQyY9kGltp5/A5CCe7Xizb2Hg86TgVFECspEpqvwW6my8lyNwO
         ZTSQ==
X-Gm-Message-State: AOJu0YyliuKEq9NO97nMYDvOFKkTWvEUkkAChu5xH8vQ8kQyViXus4QF
	6Qop7nPxvGCqpH21a/SnNUqtn4BFu2OyjB+SSk4eIPWqYsuLSh+edF8QurOo02I=
X-Google-Smtp-Source: AGHT+IHOsD3NUi/gKKM4K2mxJfT234oFxvIipMAb5gjgaRqa5l5uxuWuqKhPPTQGZ7ZPD08lArFZZg==
X-Received: by 2002:a5d:4b4b:0:b0:374:c7a5:d610 with SMTP id ffacd0b85a97d-37d0e8daf56mr1692767f8f.43.1728028766702;
        Fri, 04 Oct 2024 00:59:26 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9910286fd8sm187266366b.27.2024.10.04.00.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 00:59:25 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 04 Oct 2024 09:59:22 +0200
Subject: [PATCH v3 1/4] dt-bindings: leds: bcm63138: Add shift register
 bits
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-bcm63138-leds-v3-1-ba99a8e464b9@linaro.org>
References: <20241004-bcm63138-leds-v3-0-ba99a8e464b9@linaro.org>
In-Reply-To: <20241004-bcm63138-leds-v3-0-ba99a8e464b9@linaro.org>
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
2.46.1


