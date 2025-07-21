Return-Path: <linux-leds+bounces-5100-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 824B4B0C1EF
	for <lists+linux-leds@lfdr.de>; Mon, 21 Jul 2025 12:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B4B23A98B2
	for <lists+linux-leds@lfdr.de>; Mon, 21 Jul 2025 10:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1854729B23E;
	Mon, 21 Jul 2025 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="pT0ltWUY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E5628F92F
	for <linux-leds@vger.kernel.org>; Mon, 21 Jul 2025 10:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095343; cv=none; b=pe9OKFui2UQvWPZixZ8co+wE5i9oGHmIfMrlG4LQlZKQMKqHlF9FdgmecYXUSHXY+mMcDnDWZqT5oFTMULkxLZWZEVgRN1JqrtXmxnbX7kJPzGruA3PF7ugPFztBpv73fPQX2kOfo9umam0kffotHPKs1a8paegpSu64mUY6r0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095343; c=relaxed/simple;
	bh=QtNA1Zw67oY6g9wXhby6BPpqc4kJTg0rFQpE0bGv9MM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HGOHatijkbNPuxGp1zcYfecCLEfVb7X9cE1gF3kSHuG61B5Rtu2Khs/yOwCfsjKEzAG/HH1IapLyX0kdoHVYaoqgMhunQKhq0CsbRhQP3+UgXWyH4BJNi6jnYadA7qRgHPC5ylJtkhWmlOCLsTwbM7dpEbjuKqPpcf7Ri0RFkxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=pT0ltWUY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4560add6cd2so33944655e9.0
        for <linux-leds@vger.kernel.org>; Mon, 21 Jul 2025 03:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1753095339; x=1753700139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHC9dKSjhgDmCS3Dc0Ob+PRUH+xtz/BK7VzlQay8jS0=;
        b=pT0ltWUYe6TkCAuKWAeopr/nLRLmlB0Dknr+5QhNuaJUBhqC4ELiWsnPXh0s43/qgZ
         NBjzLOSF/3Qspr/MIbWEVIib8WXZE7HWs7l1ntqss3nywoOnI3EMUqAaEDoopCGFVAuX
         A3KlEGyXy+boNDvFrCprRAT8E5GsuQ2MD1e6cLhaLjBjqxB6MXYXiuIwEGPVUPAC3sIh
         QrvwGOi8K0mRcx+FMBadG7vGrqTs8H9CjvbkrcroS7dr8YSdi/m5f7B8hOtO2IzXgEiY
         RDzHlPMrDxBp+9Zgf0pDBeETtQOJGAPvWMDqmQ0QQHZ/yD8PxuRgPsKGofUUqhoLCTG5
         ScmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753095339; x=1753700139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHC9dKSjhgDmCS3Dc0Ob+PRUH+xtz/BK7VzlQay8jS0=;
        b=Ro101KGarXpoOBAdViiSUE/J81u7pw/Zxs1khShkRjh9pjVkcbMYEj59sP36+J+KHY
         EXrkMeHMh3GgxvfmUrKu4kKDe8a3R4VXhokc6ECqxCg0dPnbi8G2nPM1uYWJzMdvOt/R
         nKY4Yy/mZ5DWF8zw0y5cAzXyfU3rOEcxI902gSbiWaCOCYhlNJA0yVhmkJTQENbnQIQL
         3XAhSWMISDk647wafjPqWvvPrdjzE1SjPG0zc7/zJ+n/VBqgpUn91yNeFeigHgw2vgQh
         hPXfMiOHoLNkb+pvivj7thJFlCPo4l2/tdnso00AHyTj5Od8fjoeSURk3R4CQySq+3QC
         fvoA==
X-Gm-Message-State: AOJu0YwUWnyeFjkkiXiHjBmG5qck7kApOYDhd4Byne+iIGsjRYYJem8p
	MDGp3MCeUjG0KxPc+2NmxdhehuYAGnPWGgeNDXxT6irOHE/38NEk4Ur3SKBWsu3Pc32wMlUGouL
	FBfJh
X-Gm-Gg: ASbGncsWQFTyy1R7r1IbGazl1/7qeO7LJmPY8zymjZ7kKgrFK7A5db4OGO0/JxQiz4N
	/OZFLPX9soym6BHvYaihvcQaV7iIDs+3TUVOjPvVOrPZ0JUZbPfcFQzdKPcRfVVHabbWZ9dDGDZ
	jWq3R41J0b7AgucTw6Au7Oi8oROJSZzmUcnUIggXhlcrlwCx7NMgf6nu2ufvHQcvfFfnIO8fs/K
	BtbxqMcj7XtG5jMJ7+jHNeatk68wOk6Uwm9q3MeI/GuUqjzDohOBGle0klcP1CpKJirlPm4fqjv
	pjsF7MqNOxoTNcDHa4+bVuA/hqJVJdDjc2mHTmXLbq8oL8/WPF7zYkZQt+kWfK2My17IrHisIPZ
	4mB2hAt8eiLrR1AoI+cS4/gjylW6w/im+c2WiDqs=
X-Google-Smtp-Source: AGHT+IEMnp6KbrZ/evTevPv2kZc+1Fdq1BSnaHkk6zE9iOTVsYyUW2/Ifq29t44BarT0k46Gkbj4Pg==
X-Received: by 2002:a05:600c:a113:b0:456:18e:eb7f with SMTP id 5b1f17b1804b1-4563a4fcf8bmr96958405e9.3.1753095339250;
        Mon, 21 Jul 2025 03:55:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:f373:f0d1:903c:a9bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4566dd6b8bfsm18141065e9.35.2025.07.21.03.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 03:55:38 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 21 Jul 2025 11:55:35 +0100
Subject: [PATCH v5 2/3] dt-bindings: leds: issi,is31fl3236: add support for
 is31fl3236a
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-leds-is31fl3236a-v5-2-264e841f4da9@thegoodpenguin.co.uk>
References: <20250721-leds-is31fl3236a-v5-0-264e841f4da9@thegoodpenguin.co.uk>
In-Reply-To: <20250721-leds-is31fl3236a-v5-0-264e841f4da9@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753095336; l=2235;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=QtNA1Zw67oY6g9wXhby6BPpqc4kJTg0rFQpE0bGv9MM=;
 b=kl9gQTsUW6V3nUgx7XzUBEW8xg/8kh7RSP58BqI2GETCvvwvvwT3kfXLGwKz3vr5oecVu+B8C
 LSu8L6wqtEhDmtZaFE5ShDr9kOIaUm6zZWTQBGNdariuj2bn1izZyGu
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=hHrwBom/yjrVTqpEvKpVXLYfxr6nqBNP16RkQopIRrI=

Add an additional and optional control property for setting
the output PWM frequency to 22kHz that exists on is31fl3236a.
The default is 3kHz and this option puts the operational frequency
outside of the audible range.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 .../devicetree/bindings/leds/issi,is31fl3236.yaml  | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
index d8164876611f5e629215fe2715ebff1745f93a26..58f5aa4d0b644fe550e2c48b141c41c37fdf98e9 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
@@ -17,6 +17,7 @@ description: |
 
   For more product information please see the links below:
     https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236A_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3216_DS.pdf
@@ -25,6 +26,7 @@ properties:
   compatible:
     enum:
       - issi,is31fl3236
+      - issi,is31fl3236a
       - issi,is31fl3235
       - issi,is31fl3218
       - issi,is31fl3216
@@ -40,6 +42,12 @@ properties:
   "#size-cells":
     const: 0
 
+  issi,22kHz-pwm:
+    type: boolean
+    description:
+      When present, the chip's PWM will operate at ~22kHz as opposed
+      to ~3kHz to move the operating frequency out of the audible range.
+
 patternProperties:
   "^led@[1-9a-f][0-9a-f]*$":
     type: object
@@ -56,6 +64,22 @@ patternProperties:
     required:
       - reg
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3236
+              - issi,is31fl3235
+              - issi,is31fl3218
+              - issi,is31fl3216
+              - si-en,sn3218
+              - si-en,sn3216
+    then:
+      properties:
+        issi,22kHz-pwm: false
+
 required:
   - compatible
   - reg

-- 
2.48.1


