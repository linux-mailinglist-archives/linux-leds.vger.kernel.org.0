Return-Path: <linux-leds+bounces-3562-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D359ECB60
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 12:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B30C188A0EC
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 11:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345D0211A37;
	Wed, 11 Dec 2024 11:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFIEkgoQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3B5211A3A;
	Wed, 11 Dec 2024 11:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916938; cv=none; b=IaPsl/Mnmrg9CqGbetJMdHvNEIHYebEjCYmiaGaYNqRjVIQYfGTRLIJfW1oklZ0m4UuWi2wwu2gmvxtVu6GrPlwAfKCZnw7jsEGk3SzGWQkpXjHgNTjfYqw4Kt7FusTG9lBeFyP8zIp8wyfbI38zMJ+5Y1ZyeTapdkbi8i9+jjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916938; c=relaxed/simple;
	bh=dt2bprlcCPOxA3vEWtu0Pmv4h5fSClLCYMNbBSaXJ+E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhLy4IQoR+Dbz7S6o+4OXtAX+OF70IzKvWdTk4ymJEPhIwRKwZOpnCnoeIv7Axyg/0y79T1JhdqfF2LpEV+58gRyNayseMGELo0tKQ8wHgzLQZ8gT4x/CaYQjLerdXrxb5A0hAG8Bz0S3w3dVfNlzoXhcW7Iwr70prWF19o66mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFIEkgoQ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21669fd5c7cso23993045ad.3;
        Wed, 11 Dec 2024 03:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916936; x=1734521736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGkzbcqvOFspYq5q3MXmaYRhS/5bP5b3n/UA7OPeKfo=;
        b=mFIEkgoQ5MWQOjja90C6DVUMAaS/HFvGj9G1YrovUhYrMZUuvs/TyHd25eA0a1w+pX
         gWJOBCaxEyYuSDQbRhdqw1ej5bXDz5zD2Q1Jhi3VTpBeu1UY1HCYMQD4KyyyCL+EGyth
         rgLWjk3FdX/kHuQpg3o82oqB9h1aPUkNpe4fb877y6in4NJCYC6hO/f69s764LPCeGcG
         2wuLxennA3sVrAqwLQVQFB8jfhGGJTJ6hZW/gGPKyxFWO5MywGZJdCzywPMuDdcgFnIX
         k8WMS4hQHijc6DvVJOo+mBauOTWDChq4yjCRinBq7nGUXyljF5yOwd5tTAchWVuYjg8I
         vMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916936; x=1734521736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGkzbcqvOFspYq5q3MXmaYRhS/5bP5b3n/UA7OPeKfo=;
        b=sHdiex/AfA1Gn75EqQB5kg2VVglWGBT99wGKBFWyevQktQpYnvje6DTqREZf4xbCNA
         8jBw4c89nYXcfA+GLHZ4306Co5/6z57n8Co1A4TA+AndXw8DJ8dFcbh1MsvFLD+RWrOm
         4+DCAB33CkMLhJO4vXvyrOsAFjqNz4JZtKMY6vMa95ddcz5LzLcy63CMoJUfW2h3E76R
         dCweabmhef8PDHAPKCiTdPbAReKZ3lySjXHTX2Q/g/1hrRzCEiLVtCtS2maCxml0PonE
         HYOgkV0hh9XDZzxDt0aU6JRSSvmgqIStiEfGwnh5CnNbkq7A5UL3SHMJh3fvobMg2iqP
         rBwA==
X-Forwarded-Encrypted: i=1; AJvYcCVb8imKw8hYj0P4YTgargY5VH1w/iPGEuinnX1+DdIZKzsAve8Y1FogjZ54kbHac9ePfRWSduT+Y/wpQA==@vger.kernel.org, AJvYcCVeQkSuBMo9UKS4mK3KbZ/FJevEmlXa4gZfoT4cX/rT85Dtz5RU6F3bwRQuvDCeBsnbC9fnP/QyBYQhsaNH@vger.kernel.org, AJvYcCW/0j2MmQIEQ2IFgWfOAMnQ76hEDSbY5m5EI1sTGDGgKNFD6fkFY/Y0lHVaxSZtzGrwmtsfeTVM5ghT9Ws=@vger.kernel.org, AJvYcCW8QH355j7Et6aUBmLhafjORRLYoYJYVCSg9QNK6qwTxNkndCCz35el4pJfZmpGwc9ZbxnOTwy1QKd4@vger.kernel.org
X-Gm-Message-State: AOJu0YwFQk5Urn1Ql7b3C/5uN3iHx/A/iXj35OMpmpf4pK9fT2Pt2Yil
	Dqs6WAoRrvjMu7aO5C701H7BDnBmExyK+a0E3m1jK9+KflKhKXlZ
X-Gm-Gg: ASbGncuHMERSFwui2Ei51TpYDKgiG95/RQKBNRl0MXeKWh4UIe4UBbQqoCjWafz02Qb
	PS61dsUJuJhQqfs2K93ywDtS/bZYDhOW1OcIDQKvEPzwN2BtKQM/avuwohmO7ngeM6bb+8bAyk1
	ZXHYz7ZLOdJnZ7aaf37k2UNsAScR38ptaLTmo02EFFRlaeQe5v+V/7vReokNMN7oxZvu8cJIsQz
	Y9rhS0hZjGSZRv5dr3urwUqCT73G7u2WXNuUgfAxfY70riJmEfGLrpdudacMwGaGwqrTA==
X-Google-Smtp-Source: AGHT+IGMlkuqj5IDE2y2hs5ggKANhLCOeqY5ZZVSTXz3hSFIBTS9nP8blx7hzXomQHBVRniqPWetgg==
X-Received: by 2002:a17:902:db08:b0:215:e98c:c5b5 with SMTP id d9443c01a7336-21778390f29mr49010095ad.1.1733916935857;
        Wed, 11 Dec 2024 03:35:35 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-216404df131sm56765635ad.203.2024.12.11.03.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:35:34 -0800 (PST)
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
Subject: [PATCH v4 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
Date: Wed, 11 Dec 2024 19:34:37 +0800
Message-ID: <20241211113512.19009-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211113512.19009-1-towinchenmi@gmail.com>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add backlight controllers attached via Apple DWI 2-wire interface.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..29caeb356e6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,57 @@
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
+description:
+  Apple SoCs contain a 2-wire interface called DWI. On some Apple iPhones,
+  iPads and iPod touches with a LCD display, 1-2 backlight controllers
+  are connected via DWI. Interfacing with DWI controls all backlight
+  controllers at the same time. As such, the backlight controllers are
+  treated as a single controller regardless of the underlying
+  configuration.
+
+allOf:
+  - $ref: common.yaml#
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dwi_bl: backlight@20e200010 {
+        compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+        reg = <0x2 0x0e200010 0x0 0x8>;
+        power-domains = <&ps_dwi>;
+      };
+    };
-- 
2.47.1


