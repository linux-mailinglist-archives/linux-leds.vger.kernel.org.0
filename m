Return-Path: <linux-leds+bounces-4076-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E76A5A44769
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 18:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 462ED1779AC
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 17:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E281917D4;
	Tue, 25 Feb 2025 17:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBZKXIXv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B1918DB10;
	Tue, 25 Feb 2025 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503179; cv=none; b=jbrRrJLz/T1j8+fWCrEJNrxnEt59rE4VNCvy/ChfmbApAHWOB9Gl2n5qXUOEi2P3ELFFRC9v1IwQDGwGs2jKbVpGMrpB+uvHekPXCKqyyKHQKUZ3+lIACjD41LuTiqkXuvEDB9tT+FuEaxOsjadtdtUVdEtjF/6QJRXuUT1UK7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503179; c=relaxed/simple;
	bh=F9arj9XlSPYLFUn2cFiuuIjkriGaXcT4MDgLxONyaic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sierku1h2MRLTvTRDibG3Mu+Rd1de+ltrvlsK0LyM0K7tIykgX6GowUFjusek1MGzUjDD193cbwC73cZPnhZwFCYii0cDw4JVYBZvHXLJkwcKoXWmvlluvfsRWbBfdMfSsVM9uPhIcWli7cdr0A4TbzvrdrhUjwxiTEpK/ZEesg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBZKXIXv; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-220d28c215eso91758715ad.1;
        Tue, 25 Feb 2025 09:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740503176; x=1741107976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qs/0+j89mqn1YHcz/KkekbDc2+h2ZGxPg7HFDR1eoNA=;
        b=EBZKXIXvF0PvKSeTLMjDGEUIu9+X06iHwI4Qw4sAJqQSSRV4QfLneovxNgfeSVfRbE
         TRYwh887EUQVa3/vrhfIVkICxOBzGPKGg0r7lFz9UfI04iTTpD+EXud4sDLxhgQs198t
         szhtsF2znv80o9km1vPeTOYEbYgfgVUmkjV5l4YCB+TJwR0URpQozog4tuWJAMGChA6e
         T7g2fGiSNk97Zitj/WHJoyNJUXBbHgHu61hoCxUxsV4+3cW47mSGyo2aQkUqn/Cjn79e
         fVVQVbCNzGUn/EnGBmaHVZjnE9TNgmdTQptpFu+SnXc6qINzgY9pzfTCwk53VWPFJHAq
         8RdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740503176; x=1741107976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qs/0+j89mqn1YHcz/KkekbDc2+h2ZGxPg7HFDR1eoNA=;
        b=J0AajdfKix87caP6E2OCuKQgh8T3SjaXjpNh9a9unZ6heyK0qDdkehJUg4I7DO2T3v
         s90LtmUy3lNMmc5s2EPKcK+8csZKsGrcdQK4VyN3ZI4ANd+DPatMQ1vJEpnA20XAN2Nu
         oyLsJXuttBV/u69u6eIgfMmXvQnfBTa5OSmNtVDI6sxrTJ1yJ17H28INFeKWYAXAmdll
         GEoA2Crxo/X8Tx1447ccuS5wOyNBG5E/xUt42ueiU/Hh6uTxQZYPSl0GgMHIyGs3lzUB
         9tajk/SMvsD2axc/uwrpZO3sV1e3o+76vlsi5yujm+IwmY0zRJWxajNr352Bv2NB5p34
         orWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzNyE91mOW5tMtU72yG1w7qg21N+YBsGYO8zSdWs1rJsU35Vm0ekj/K1hCvATuPffHZZFoRvOJT0TGXlc=@vger.kernel.org, AJvYcCWBLS632r8izg13frT38gouzAEAXYMF7vGU7+D38l2XZKMz4ta4L3ymGuwXx5GkjYm5/y+fC73X/qxW7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUuAHhm5IxCtNmLxlnFRAY8Z7NyAccRravHXm+Ib5qnNBm1ZZR
	QdTp3+HSQNKMMvpruj7TUoRC0bMoweIiGRESf0bPjRluR2bgWe7OdHsb6PhF
X-Gm-Gg: ASbGncuE1pa8SBh1yWlToEEswnVeACGkddufk8lERzCZqPOdqUNzoUCB0h4tllG73hK
	60n2nPHTppVzxsZWHaM0aB9hIMIOs2NAlopBhc3YyJwtv+cmjOlkXAg7nek+aFgBlg6XHqir8yl
	U1nABE4H3sku8pwfoVwxHJwCajPVjTSwxkLuOO8qodpkxpZH73xh7K0eMQFAW3a18g1ndQq6wyU
	iHkxG28FOjBHNFqX7XFOWE9lRrIeXKFRIUMH9lTBA2S0hEKzdNg7vSKJIqhkYo+mHqvbjN4FTCA
	QXW+Sx19EaSJo8JTkuttFOkZojapfwY17EE3ZVJ7IL5PyEc=
X-Google-Smtp-Source: AGHT+IG251AWdoXj3YPsOiyV3kX25AqOqmYbGwvFLLj7JBzdt+vcWebCY6rP9OGkXxr6pLe8CTfV/Q==
X-Received: by 2002:a17:902:d4d0:b0:21f:7082:1146 with SMTP id d9443c01a7336-22307b5b90fmr61113065ad.30.1740503176553;
        Tue, 25 Feb 2025 09:06:16 -0800 (PST)
Received: from DESKTOP-P76LG1N.localdomain ([14.162.192.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6abb63sm1759887b3a.9.2025.02.25.09.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:06:16 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: leds: Add LP5812 LED driver bindings
Date: Wed, 26 Feb 2025 00:06:00 +0700
Message-Id: <20250225170601.21334-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250225170601.21334-1-trannamatk@gmail.com>
References: <20250225170601.21334-1-trannamatk@gmail.com>
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
 .../devicetree/bindings/leds/ti,lp5812.yaml   | 34 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++++
 2 files changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
new file mode 100644
index 000000000000..1eb395230531
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+
+title: LED driver for LP5812 LED from Texas Instruments.
+
+maintainers:
+
+description: |
+  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
+
+properties:
+  compatible:
+    const: ti,lp5812
+
+  reg:
+    description: I2C slave address
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
+    i2c1 {
+      lp5812@1b {
+        compatible = "ti,lp5812";
+        reg = <0x1b>;
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 4ff26fa94895..32312959d595 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23494,6 +23494,12 @@ S:	Maintained
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
-- 
2.25.1


