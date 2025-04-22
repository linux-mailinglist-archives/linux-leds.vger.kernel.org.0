Return-Path: <linux-leds+bounces-4517-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F98CA9750C
	for <lists+linux-leds@lfdr.de>; Tue, 22 Apr 2025 21:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E2FF17939B
	for <lists+linux-leds@lfdr.de>; Tue, 22 Apr 2025 19:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9B31EDA26;
	Tue, 22 Apr 2025 19:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlSvbvK2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E72D1E1E00;
	Tue, 22 Apr 2025 19:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745348519; cv=none; b=Y2rfRHvGWVudipOfMQ8tAnXTJeat0b8HGOWaAToAmqiNr1GoPUyABMx96qGRE/FxxTQjmLD5Orfe2cMPhILYGOOFnxU7EPO1pFPJDQtkw80nNCZ4VPhlCgrkuANiT7BOwBSqoF7TtAEqF+Q2p8L/ybJWtwbsaX8aTX7OJqmeLNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745348519; c=relaxed/simple;
	bh=HjA9MNbU/6eLu/HE2NgVkC/lcAYe3w6cjqSF/zzFyAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqUuRWRQcGe0uYNh0pGb5s2UgBm0lN1D1+8f4YCpg0lTX/oINkjgBkfUt7yLFM5hG7hSh0cU8HjzzttJkm5ZVgW0ClejMqEqa7VeyOqQ1PAyb3yywLYPsWg1pIg5mKlXv6c+mGW0XVK5JyOTU0/eDEKr5mqC4b4dB1bWoMbgmpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlSvbvK2; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7370a2d1981so4533343b3a.2;
        Tue, 22 Apr 2025 12:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745348517; x=1745953317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8158eprdg/+nLoN9JC42FtzD79NlzWwSow/v958b+3M=;
        b=GlSvbvK27xY/Spj7tdIpuJLk+AbgUIuzAd5oZ8OdN0Ttzwp7OJmA51Sze9sJf1y+3L
         kySVALqbtSZs7IioN66a49kgfhTkv300QQu5irFCJ03OtPj7DyacAijg6aVr5ULB1hhS
         euhlRpY3A8TnK9dFKGA3wAOYXwEJk7jtN7CMsLNwoyXbDC1HLRmOWE0towqLSO7BvZD4
         TlsBdsbJ9WJWW8oYrl5i5tdZZgpVhn15MyFC9tqndTKKZuALF185jRTdLLC0Ekrwi3w1
         uzt9N6SuYniqbVFk+e/BXk31Vw1VjsS/bwnqX8AscBsbAgWjboXZ32HqNS60PVAPAhTg
         F0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745348517; x=1745953317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8158eprdg/+nLoN9JC42FtzD79NlzWwSow/v958b+3M=;
        b=q2TksarxOA2IQ07/+VIbZbp6MPPyHujs2SLwRKucwHPRQ01Pg89E34Ka4qfC9jALNE
         OQUlDFjyd23AfWBqY5LSdsqdpkQIMoJtFO2RRdVb5NvU1dmy/03SA6PPQ2K4AW/OVh42
         p2PL7rOI3rtOZ6s6SX7IwAh2xb4LG245TXGLgOFSiIbt8i2VAi2aH15n9twtXGLS7ttm
         3AjzKr73xy1Bq7ZbHFepPixJiAJv7awMg6gCpbMVds39x+sKCgoZD+5B3s+Tj+wyW1Xl
         eeXNXc7q/rinAjiTMap4ZKZeVMK7EghrTYnEi6Kff93NXUuFDbX2AwH9g32By9aGdlO5
         Fz1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1Ier9bMrxG7arfPr+OZZAhmdDTbynO2hxOW8Ru/FUjEbdZI7BG4yBcjK7++V37sEsqI3+SBHLA5/kJw==@vger.kernel.org, AJvYcCWKppL9JuRUEv0etDMUuo2qmMYB3HCrTrETmNzvVJhXXMoN3SDhkUjuRd3H26NJ9OP0FpFhCgvToOlN8XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh008q4uTJ28CRxavDVr4yCj1tNgRps4kPNNQSW+cAjBYshc53
	PJMmZkcl9sUobkQowt1pPFOmxggHLalgIS7LHEK2YR2fHaPTbWJR
X-Gm-Gg: ASbGncvDHoRCOqNGoftAw4mn9yCA8endF8NpwakaA4L6Xa6M8DyBSZgaxWjuC3lCkJk
	UNalnZ3yKx3Ag9sXnmg2lC6HrhvrXLR84RRUFHO012o/n3uSm6yXdXPc2oLkyEymZz5go+D452i
	8kmzCVAHjgWRTG9g3JURnzsox6VgK6J28sqdrYDS0uAk0zgX7/ecHy2yWJwYP/cvFYzu/dcPUDQ
	/AnRgCLP5o1hcvEFEgCp4+Q59BQFFW9XBGtHfakTsVId6D4tSKFgfsBbTXrTnrKnVh82b+EDCeh
	LiwqWgjIfwy6pG5Fn7T7Ul7WQIekrCA4tJ3nDc0BWTPDDU5tb9XCCg==
X-Google-Smtp-Source: AGHT+IEZJZaE6N32d3y+y9hVtwj2a7Xx9Obt9UaI8m9mvnIgs51rFm0zlEMPPmgmKjPjhlNwn9jpxA==
X-Received: by 2002:a05:6a00:98e:b0:736:5753:12fd with SMTP id d2e1a72fcca58-73dc14438a1mr24571227b3a.4.1745348516588;
        Tue, 22 Apr 2025 12:01:56 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa574fasm9287684b3a.99.2025.04.22.12.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:01:56 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/5] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Wed, 23 Apr 2025 02:01:17 +0700
Message-Id: <20250422190121.46839-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422190121.46839-1-trannamatk@gmail.com>
References: <20250422190121.46839-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The LP5812 is a 4×3 RGB LED driver with an autonomous animation engine
and time-cross-multiplexing (TCM) support for up to 12 LEDs.
It supports both analog (256 levels) and PWM (8-bit) dimming,
including exponential PWM for smooth brightness control.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../devicetree/bindings/leds/ti,lp5812.yaml   | 46 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
new file mode 100644
index 000000000000..28cba25713be
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI/National Semiconductor LP5812 LED Driver
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
+  vcc-supply:
+    description: Regulator providing power to the 'VCC' pin.
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
+            vcc-supply = <&vdd_3v3_reg>;
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index fa1e04e87d1d..434c9afde80b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23990,6 +23990,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
 F:	drivers/iio/dac/ti-dac7612.c
 
+TEXAS INSTRUMENTS' LP5812 LED DRIVER
+M:	Nam Tran <trannamatk@gmail.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+
 TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
 M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
 L:	linux-leds@vger.kernel.org
-- 
2.25.1


