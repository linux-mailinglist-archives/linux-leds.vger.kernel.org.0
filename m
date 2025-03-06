Return-Path: <linux-leds+bounces-4175-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4D5A552E0
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 18:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB93F188D733
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 17:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D056D25D52C;
	Thu,  6 Mar 2025 17:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuY502ll"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4928A25D52B;
	Thu,  6 Mar 2025 17:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741281703; cv=none; b=nT4Nl+YKYImIsiZWKB53/8Ly2J8VHmOIj1DToIrvSHaNbhcwbvbZRL4et7ogJOgtgs8UUFC61XoOBhL2gFGhfmSWeabspWADIkB+nbrU9FHhT91QjloFcWX5+d1mzX4NFzVMQNfTwQtWZ1ICBg/DuVwP1dcR4Gncxe0OSdSfDzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741281703; c=relaxed/simple;
	bh=AMnKy6OQh7zK/lwy7+mEPk4gnH4M0gvaQEex7RISCdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VbKDOSO96IIykWTJ3NYagXPYNBU5z2W4q/gZMjszSRREh+A1eXrAM7WylnkQC5rH0ee1b3ChIfZ1vMNdD8a3J7s3kPD8zDx6jLo5ppIudwtusLClTcCYrgErzV8wpWkFcLSeBlxwGwL6YSDR/5VFLnxJtvi9rX9YncVFeMXxoJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuY502ll; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2239f8646f6so18236165ad.2;
        Thu, 06 Mar 2025 09:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741281701; x=1741886501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGRPS2h7QrRAdT4ZdB49bTBkpTsQxIfQekO6PTHrYmU=;
        b=fuY502llopBoBqFDXDdYPZSCkWXsxIbPZvwNzZSCVxfm5AB3EZhoxeb7Y0IoljO2EJ
         dtV8DVENnfzFdGjLYhsIdWZra4lT2rrsZwDM4mho8EQsIkyEQXDeGLdxaYF3k44TbIp6
         gBe9264A9Q92g44tToZ/enwxIFy/w8HFQGnyxTzPe5Ixmzj9qyY2lEDdvDPPLR2bC4vo
         Akbds11S0vNmI5AycGi6zpv99iTLSmsk5nE+5WDk47kGR6l0pPhKnXIwoldUA0mOn6ri
         BJwmI1PFLK5EEzTaPyNppHCTuKbi09WZHbhUMSEr/1JKC+se7yq05s0T6PfyZzMrZ32p
         lcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741281701; x=1741886501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGRPS2h7QrRAdT4ZdB49bTBkpTsQxIfQekO6PTHrYmU=;
        b=USuUbBpVbXc88OF/N+DErLYvABqGoBf5KU1eBP5Y+DiKdoE0JfZ4Xvjmh9aJSQe+dR
         ufaaaNt1SlkpJDgu0l3I7Nh/1OOUlSu8mVFH5Np/+DFbuNcTP7R9r0ji6CdP4nUJLvqX
         uinOwLqkD+0swND67ErHlC8EMXnfyxMrdyQy5MLjwQ40Ze99Ft1tTM25x1vmKeRUOCX2
         X3n8ElzM7Ik8MXXDg9+WRmcPYQ4KalBPn5HaCJfKTCoRxgvTg8qOvEY2q1UohB2v8A8H
         fG/XOTsvGpcnc62u+cgo+DXgC8LppJnIF9MFX1Li5It7VgWD98QN3Pj0h99E+LgOujgP
         BnDw==
X-Forwarded-Encrypted: i=1; AJvYcCWxznsnLz+8aibNZIT/EmjjP1ehNuuDt5qMoX1RQ+XyJRx8TM6d1A12YN8F3Gu9iTcU9dihGTl3S6Y7V+E=@vger.kernel.org, AJvYcCXtNh7JLuuPqO3hF2+CcE9E0ZfFJgF8rvzrWxxxTOYkDILCKTsRpFZkzUkujuqDf0SnYYrCucCYXCgBiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW+XT0p2QN+AxowkJzVk6PzVWztNYTfAdWZADGqiIO5zdGWYmR
	kE6M5VmmG5FYAXF5wai+SJEHEOX7t64VDtIBm6EBbc5HTPea9JWg
X-Gm-Gg: ASbGncuOD6GoG8vQ4SY8LnZdrpYX54nvuEva1Mh5itBHuWZSRLBflHL/7wkIVWryyDw
	CsOhnQpY4ExswTKg9NYZcK7+ST7iwFj7MgC9lg9qHlfOoi4q+jQKnXyJfb/aAbQ7jFCa/pc15xr
	Apuzh7VR9i3FvUsr1BpJHHT6TtxL/FVf0SpJjTzcp8Ea+iXD4YuWQdDkLb8gZCg9AEO/rrair2p
	k7rqwHWAINldxzEo5hgP5Eng0dZ16cWoRR4DhnRmUSX/p+4cqtxhwscpJw0X57PbOQKv+9Fu9I4
	llJtNM4kdKUBiznXhLScr5j3GGBinQWKqOKZRhDGy267RmsUrQ4ZPRWMoZ8+mBYLkA==
X-Google-Smtp-Source: AGHT+IHsOi3t5EGukJtyPIZOn9WL/oO+bMNz6n0flXsIVyBMLyKt8QSz0cpDTKEgrAanW/71SGqu5w==
X-Received: by 2002:a17:902:ccc5:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-22428a9d152mr1050685ad.29.1741281699890;
        Thu, 06 Mar 2025 09:21:39 -0800 (PST)
Received: from DESKTOP-P76LG1N.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109dd627sm15103375ad.50.2025.03.06.09.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:21:39 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: leds: Add LP5812 LED driver
Date: Fri,  7 Mar 2025 00:21:24 +0700
Message-Id: <20250306172126.24667-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250306172126.24667-1-trannamatk@gmail.com>
References: <20250306172126.24667-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This documentation ensures proper integration of the LP5812
in Device Tree-based systems.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../devicetree/bindings/leds/ti,lp5812.yaml   | 50 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
new file mode 100644
index 000000000000..9a203da4f272
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+$ref: /schemas/leds/common.yaml#
+
+title: Linux driver for LP5812 LED from Texas Instruments
+
+maintainers:
+  - Nam Tran <trannamatk@gmail.com>
+
+description: |
+  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
+  For more product information please see the link below:
+  https://www.ti.com/product/LP5812#tech-docs
+
+properties:
+  compatible:
+    const: ti,lp5812
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@1b {
+            compatible = "ti,lp5812";
+            reg = <0x1b>;
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8e0736dc2ee0..2bd9f5132cab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23506,6 +23506,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
 F:	drivers/leds/leds-lp8864.c
 
+TEXAS INSTRUMENTS' LP5812 LED DRIVER
+M:	Nam Tran <trannamatk@gmail.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+
 TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TISCI) PROTOCOL DRIVER
 M:	Nishanth Menon <nm@ti.com>
 M:	Tero Kristo <kristo@kernel.org>

base-commit: 48a5eed9ad584315c30ed35204510536235ce402
-- 
2.25.1


