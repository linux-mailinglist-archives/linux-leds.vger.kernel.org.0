Return-Path: <linux-leds+bounces-5111-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C10B0EF1A
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jul 2025 12:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F17F17D4E4
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jul 2025 10:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15AD28C2BE;
	Wed, 23 Jul 2025 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="buxXO2mq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA16128B7DE
	for <linux-leds@vger.kernel.org>; Wed, 23 Jul 2025 10:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753264938; cv=none; b=dGDssmhuRpKoqbe1bcPcd8No5ds9a1eheLusN2kQ6DENqXQhhfU5cL57E+CNWbaIZgefmuq0W6NuSgQn3wwFG0Y+xIwuvZ7VyRHOgil7hAmEkrG42nbPRt3K+WGHaOt6K00FFMu+K0aetT9KSF2nRuSsOBp3kQJK/znSqHlBrrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753264938; c=relaxed/simple;
	bh=cc5BZaAROg3hR6jmHXFsW2REoH4SgVJ71CzqrNwe0HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SnV0d85T0b0o0BaK0xzXASq4tAUhFRbllWv1lr8ppO9WakCpUcMI//wAmJrQjqxDfI2t7jhpCaL9LuYYXXJlHQEzfWC30fvkrNc1nzTbwWCQBq6eZd7yOe+UMsCNAVDNyhrb++NpDYAw4yeEgx9Z2lrhi/NGFQgEcCmrEgwMeic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=buxXO2mq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45619d70c72so6749135e9.0
        for <linux-leds@vger.kernel.org>; Wed, 23 Jul 2025 03:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1753264935; x=1753869735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlqSkXY8/eWL8QswhAWWKjIEfwL5h0gj2X3KVSyjUzI=;
        b=buxXO2mqfMNMQq06B4iZRrT97+cYd13dnwwCHDR8UzK9lyz8uoGSI9bxH3C13lyi/K
         wL2/8wBS/EqWmYTo4QxepAY4vIAn/0pa6rPi8odM9oa2IZ/sihi5vQAP/wO5PhDkbjys
         YYtyCZ2BmojA27OqQ2DKE03znAfJRQMDkS2cIK77Zxy3jGFRbRV5N/WZSK+K3gF6ACdW
         HcUUfg/XZUpnf1gKx1kEG3WdFSUk2xNphjffaLSQ5YiXq0cIs61z4GKAXVwZlBtZqKa4
         BKUYCx9lir4J3hxgOv4ZcOL4G4PD17Bd/2VSe+Cg6223b9hLwLZSIt1WKIUtuVVqCMIr
         bRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753264935; x=1753869735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlqSkXY8/eWL8QswhAWWKjIEfwL5h0gj2X3KVSyjUzI=;
        b=aCViRf0VvB0oswdG7ZTpt4aFKG/aSo+xsnux8wZNtmh3LpRE1T8cayQqGaLWodoDDE
         v7k0NZzTWCo9CK7XT4CWI6755GJX89Anqaw+wzQHL0R/whuBvBFb6EUO/dws9R/3hxlc
         46gKsim5JcfrGHOCmyOT+Q8Luv3KX7lsSzM9UA+sFwHpm5w8EWX6CW/i3CUl0k2jSP55
         Um+0EBF8iwCbYb0wGp5jm52PeKoXlZ/oROSIfctsl2jeg+nHoVhb/rfiiioOJjt7nIEu
         QNX6nLJato1kqhqc064W+xULquqlKWkifuGAS3DvTPdw3qo4zq/TlJhJ6XF8aCTVFmuL
         33Fg==
X-Gm-Message-State: AOJu0YyIdGeWUUQBip5PY3L/O1XseDRuZShDMvEe91nZhjxjVBUiQrct
	FtkSlDrTonAI2BjyOMGcLKec5LLJkad/WI0Z+Dheo6xd6hvm+LWazPgWg6wq+qqxeNc=
X-Gm-Gg: ASbGncvIf1TJ9UJFCyVFO3t3dQEMOQlf44FwNgqf5drlCt5cd/wCeHZ5n6Qyz8qoioG
	TT2lYAnZxYBIKrajh5zUQkZXBIDwwQwwPPasx3KfRinXNyIUjirwzk9V+D2CcZse/Dh6tX4P3qN
	aHsl4yfpaPsGsdGPBMcMhKJg4ok0d46PNZMR6vMwudgSAbcObtT/YYtr85GpVcqVZLaFnVM3+nV
	6RDUaBfaZ2qdoDP9MvBIvNdd6uAfjmrtmztLiJBgV57DdasGcQV493BcdXxGqsdjMYDHt9MabYV
	Ya97XQSwOgfSbAWyEjmMgZ7lDiEsaRWO/iJZiy3zG09NY6h3+p6JXdDD7zy1QQEIpxEm6wpw/Kh
	Ct9TDjnvS/Qlfi728LvTW/8UaeIt915AS0bnlmg==
X-Google-Smtp-Source: AGHT+IEhgsJzsV7IfravQSqZYJmOjKxH8Jaad3zEB+E4m32fhG3tLEMWBLJlEsgKuzSLLBJCvm+mrQ==
X-Received: by 2002:a05:600c:458b:b0:455:efd7:17dc with SMTP id 5b1f17b1804b1-458627512c0mr63332405e9.11.1753264934992;
        Wed, 23 Jul 2025 03:02:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:6066:6737:c27:90a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca31394sm15930793f8f.37.2025.07.23.03.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 03:02:14 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 23 Jul 2025 11:02:07 +0100
Subject: [PATCH v6 2/3] dt-bindings: leds: issi,is31fl3236: add support for
 is31fl3236a
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-leds-is31fl3236a-v6-2-210328058625@thegoodpenguin.co.uk>
References: <20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk>
In-Reply-To: <20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753264931; l=2144;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=cc5BZaAROg3hR6jmHXFsW2REoH4SgVJ71CzqrNwe0HM=;
 b=6bJwpk+Lu4obClf839BR+6undZ9888r4NE0TXX8Fb6fHr6oeacfp5DymQu0D87UOBw3ezj/Tx
 bEbKz8564wcCpkZn2fVeW+DMRQqYp3cQ6/dn49+iDB+cNpT7GbfWlek
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
index c778866d51fe6ba947631ee80741f0d8a02f82ee..3886a67dca71a5030fe90e946b1dcbfc9d727cf7 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
@@ -20,6 +20,7 @@ description: |
     https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236A_DS.pdf
 
 properties:
   compatible:
@@ -28,6 +29,7 @@ properties:
       - issi,is31fl3218
       - issi,is31fl3235
       - issi,is31fl3236
+      - issi,is31fl3236a
       - si-en,sn3216
       - si-en,sn3218
 
@@ -40,6 +42,12 @@ properties:
   "#size-cells":
     const: 0
 
+  issi,22khz-pwm:
+    type: boolean
+    description:
+      When present, the chip's PWM will operate at ~22kHz as opposed
+      to ~3kHz to move the operating frequency out of the audible range.
+
 patternProperties:
   "^led@([1-9a-f]|1[0-9a-f]|2[0-4])$":
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
+              - issi,is31fl3216
+              - issi,is31fl3218
+              - issi,is31fl3235
+              - issi,is31fl3236
+              - si-en,sn3216
+              - si-en,sn3218
+    then:
+      properties:
+        issi,22khz-pwm: false
+
 required:
   - compatible
   - reg

-- 
2.48.1


