Return-Path: <linux-leds+bounces-3524-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BA79E8CC7
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 08:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9158281C9A
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 07:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94941215185;
	Mon,  9 Dec 2024 07:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+YJKXmM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3443215178;
	Mon,  9 Dec 2024 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731177; cv=none; b=HnIRTul8PpNcJZQftXy0J9u6cuHbgziq734aKVdrmIZiQkdLYeIgV4y5MtF3+Yzxnlf38PsvGuGHd2x0+8Om8dv8PXCfN9oldzhBFs0p5gy4bbXxQ+F7fodr9q9011VW6yh/vNQN/0+QVcYqaDUOFjr3T0xgxjJ/zLgc2T5MTOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731177; c=relaxed/simple;
	bh=a+ffvi8Pvp87P/1lPCLBagqzbCZkXpLPTrqcZ5m6KYI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGhh6SW4yPUvLvXlL0KS1dTQ4MCvEQ9Tj2dd9nAFmQwa+bEVgzay5XOS8I1I0vuza7jzTTuhF4naRb2jbWfss1m4I7VLr2Yg6JqTJSbc58AQP4MtLbXc2LnbuXbTV4wUuSikRVo/VQ/l8RK8xIdY8HL9XWk6FLkYP6C4qKYkMUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+YJKXmM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216634dd574so1064295ad.2;
        Sun, 08 Dec 2024 23:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733731174; x=1734335974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
        b=W+YJKXmMKok9y48zoBXZmZxNvIpYGhLl/QFdZ4gSyFzaITByNtzCS+x88aFY7P2PrX
         Haui+jLtX3MLBB2sGgrKl5BjBRgjA7/G4f+aW5nqvHZ0ydXeHIQ7J50tWWwIKvtfcbf/
         LfJRErYPE3DPqsj1qQd9p23v9pri1+dK4mkqsqD06ybfrFBR1tA2PKu2bj/1rDJHQ24b
         69MrVuUIJxP6g8dkDGMSvLHJTVaCaiCmPRhUb1C645EgTN3T+D2/C58QIsavHHl6W2CX
         bE1te2VKimBhDdonG3KzOEGRvSl0ei5J3tPRQIkHxxmSip569lUYl1ZoEZVGfKZ9oBKm
         l7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731174; x=1734335974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
        b=qHxS4FBCUbZfUSnG3MkUARG3TkwcsuNa/uRAd1CgVHbXDnUgrtWCCo1hbRMtPdioWw
         lAt3hq4fQ47FmKq2eAX4CC4mnHGSDLiDlhyCqm2CR0ApkhZke1AKa6NFSYhuKAMvE8TW
         EcLSldR2RCyGE4avZZT8jlO5QYtDy4Aych/krDsJahw+iHcWS19uQxb4GUKaksTQhEME
         M+DAX74DHw9idgRE36kChj947pUubHjNA88h3Vc4l7lfsgI2TKOaA3k9R5LZsj3PME16
         N1UxTT2Ft5xzcpDw27BmzHNnliOVmIxul5Jgi18uIYCAs0xd2l4QuKnzW70aBz+Ai8Cm
         U6KA==
X-Forwarded-Encrypted: i=1; AJvYcCUwRLqamZFDWgQcgql758wlOqeGI+Q9/gnasSoCaKxIoH1huuZasF96yF5G+CwyLeKeqaTU9SwX+KyD@vger.kernel.org, AJvYcCUy6RPN7vdVSEu1P1gTB4URj0Gwvv2ctXLJwzXHYhl16Jciix7o0hKbqSdAc9RS3pMMsKPyMepVbkNV3FWI@vger.kernel.org, AJvYcCV3nlzn0qCcTwcYY8SoUHYwEMrT54fQWwHJC4DKZkiyebwgj1Ht44WvszXzFEenXmhdEJ7ezsJaNHWw0A==@vger.kernel.org, AJvYcCXCsdUJgXoDpViso3D+yigeEqc5FujBPErSKa8m9lDHSihSYIVs0B4y8Lt6mLcFoK9+8jxwW8xPdAaI4jc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC6mgifZpbxh6Y/AB+/BN95Racgh3/gz7DdZaYWvWx7oB/AORh
	zdLIs6auA1XB35PO2dmBWQkiRnpzG4z/ga6eYL5QSsqK+vBe6ary
X-Gm-Gg: ASbGncvKYqFZafys5zJuhhVZDZB5mNTfrjnWh4hRPaoV8Q5lgfmm4MyaomuySuCaC8O
	uoTi+0lYW2lcaG2h8wwDUcnrLtn2VjQp4e/iC5fsn833GY+xoWou9ljcvLqG2mZqPIi/qA8WzjH
	GooAr63SRBhPWjfynMaBu38BeF+FehOE+r/Y26aWPhXDFpSp3ixdLCSmMkSbvF3KEj6jCUJuPXG
	aGfYhCqi8MyhmFDy+lTzm1+xZg317tCOH3sPiP4XMRPOeXPPk3cpXf6lvkdhiLAwg==
X-Google-Smtp-Source: AGHT+IHAz1igIUyVxn7/F31nUUXielqAW/wiAuTMbEeQeNxfmCtQzSeNLB5DvIv4dcsvWo5CidKtsA==
X-Received: by 2002:a17:903:234b:b0:216:4943:e575 with SMTP id d9443c01a7336-2164943e7d6mr35625795ad.57.1733731174215;
        Sun, 08 Dec 2024 23:59:34 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628b6588csm36508025ad.235.2024.12.08.23.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:59:33 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI backlight
Date: Mon,  9 Dec 2024 15:58:33 +0800
Message-ID: <20241209075908.140014-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209075908.140014-1-towinchenmi@gmail.com>
References: <20241209075908.140014-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree bindings for backlight controllers attached via Apple
DWI 2-wire interface.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..9d4aa243f679
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/apple,dwi-bl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple DWI 2-Wire Interface Backlight Controller
+
+maintainers:
+  - Nick Chan <towinchenmi@gmail.com>
+
+description: |
+  Apple SoCs contain a 2-wire interface called DWI. On some Apple iPhones,
+  iPads and iPod touches with a LCD display, 1-2 backlight controllers
+  are connected via DWI. Interfacing with DWI controls all backlight
+  controllers at the same time. As such, the backlight controllers are
+  treated as a single controller regardless of the underlying
+  configuration.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,s5l8960x-dwi-bl
+          - apple,t7000-dwi-bl
+          - apple,s8000-dwi-bl
+          - apple,t8010-dwi-bl
+          - apple,t8015-dwi-bl
+      - const: apple,dwi-bl
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dwi_bl: backlight@20e200010 {
+        compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+        reg = <0x2 0x0e200010 0 8>;
+        power-domains = <&ps_dwi>;
+      };
+    };
-- 
2.47.1


