Return-Path: <linux-leds+bounces-4472-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C21A88691
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 17:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964FB19425C3
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 15:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A22253926;
	Mon, 14 Apr 2025 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwhtRbXb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE6B27465F;
	Mon, 14 Apr 2025 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642702; cv=none; b=GV/451PcxwwnClHHwb0lpEp47UCXARAitOK0tgQBUGSl0gT6VaD4WOtu4tP+0RXXZNSztRjz2Wt1nXFal0+3cFIGgcpSMpEXHa+ko/2eZ8fXgeMetL00MQnbZs5OhCILpPg+RiMvqlnBELJ+fVBwMU25CzBtdWJK69lSa9QQZfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642702; c=relaxed/simple;
	bh=orUJeog3kdVwiBRKYNm0FaDv5psltR/nQ2XOfqjajDE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=otwEwfm2z/P/+6LQVQes5aRsoFZS/IUU2jC1J6SREytDYE2EnotgeDcdLlBlAHKGPkrKhE/J2nR6fLi9J2KR3R8JTQfvtSTVOdcAQRUw363f6r0NY6hnLPRQ3qIlCMvy4CZpjeg7uJqaEvIKvYyiCIssL6oyhkgeoNH58AC5sgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwhtRbXb; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736bfa487c3so3877891b3a.1;
        Mon, 14 Apr 2025 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642700; x=1745247500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTJJY2Nt7Gmmg9hUWwAsET7kUZ5bCoKAexou8Fr2nGc=;
        b=lwhtRbXbA6Cb+NzuWhje3jBqiUo6YymScrit3+0nPA7I6ABsRP4R8UKIrgYqMylAfH
         8P94TrqRNbF972xKj4+ej253PoG4a7SIWOVtbsnftKj5ZSndsMihQx8UA0rFsjkO9Dqr
         Q2Zyr9wHvjYsDXGBEo5kePhT3T+ulkbLyCb256I+2UlaLDt6d5jcftmIRCvUT15xVXOW
         tWL3YTjXppeAUGrHLgVEsPXnHqXJI93SBZUp8+enWqu262ZilyOOlTg+pbxjyMTvyV+9
         76G39jBouJgT35f/TCpr6kM/VedsgcBdo9Vaktv/+IEjwRsf6l4su8Tbh87AB0wUX0TG
         5aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642700; x=1745247500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTJJY2Nt7Gmmg9hUWwAsET7kUZ5bCoKAexou8Fr2nGc=;
        b=Zt0b+4bYmMikQy2MQAmrqecA8KwPbaRvsgill+HJiceaccFRGNCYQA+eOhHUlfZ4p7
         /g3SXIGd+DsQSLK5nlFFsoz7ge7/aeEbOPZNzOm744bArWtoqTEJacBUP14fZYioizU9
         FE2ZaOwjqAjFv/QlNJwkiDRdgRyzJjqyfKtZPIKilWYrKjM2lVIoMa3SeIB/CHb4MFSZ
         i4tEV7bXBhC3FiGTNt67IE605nx+fW99mhtAMIJVGvMA3StvcxNYLK/K3aylrKbqkI2p
         8/f/s5sPcUSYG2gxroHsPamlnUiy2CHwpkW3DbFwxD8tgX9fk9jZEue5bsNnhEl0zZzG
         NHgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF3ZptwKcj/6pSlW0VNhUGpiU2tgRUE5rFxsAFML08gmPyBoLNR+EdoldLh5lJT9S/QQbtKzj0Aruc+Sg=@vger.kernel.org, AJvYcCWmuSGSqDnJ1biQIq0d97KFFNNscG3ZJL6aXT4GDSgvDxBMS7JvKRMGdB4jWyDhpWmHiVCeJsQN7nimQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycyo104HQh54SWPChOQB9VCD0GP0zlrH5QgjajZICce7fdiVrv
	NkrhjKRZKb4h2Z8DcQOuICkohjdN3tQTJF9pqVaQvcC/Mc2K/05W
X-Gm-Gg: ASbGncu73oyaiLmwMBXfy6kQFKxThIuPhHy5Cs3dZyY6ss9qn2ixqeMbO95/pragIbI
	bDcjCrQGOgq15eN2F80MW3JzvziPkJStXDxCvEzvVwWb9VzGDzirXAi+6HlJPikk10KoUFoAGZs
	QqBcrBvw2az2KuSU8HpY96RWe3Vxsw1aEv7HITGAvClBLHX/4IiTXRkDFzTbtu1CeVcY1YY5Igz
	7BI5YGrjI6rKO1KMQp7cpdwZNsMM9Ns6AHVRMiyGbj6sMZkdi+EaK5LtWi6FuxOIoAqmM2FLhQV
	MmYZw5wBzX8DCPN0alui5mGxNUUPXkvZLutWVbun20Qg586X37MsACJPR80YNE19
X-Google-Smtp-Source: AGHT+IE6LrJzwepFdlPBYH7nbuypWSS8ZE0zuKzE72JZacxjKcoCtTxkUURYK13u15R7cf51+MlNag==
X-Received: by 2002:a05:6a00:2e29:b0:736:7a00:e522 with SMTP id d2e1a72fcca58-73bd1193913mr16062473b3a.2.1744642699577;
        Mon, 14 Apr 2025 07:58:19 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f1071sm6632165b3a.120.2025.04.14.07.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:58:19 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v5 1/5] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Mon, 14 Apr 2025 21:57:38 +0700
Message-Id: <20250414145742.35713-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250414145742.35713-1-trannamatk@gmail.com>
References: <20250414145742.35713-1-trannamatk@gmail.com>
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

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../devicetree/bindings/leds/ti,lp5812.yaml   | 119 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
new file mode 100644
index 000000000000..448d6f87b586
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
@@ -0,0 +1,119 @@
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-9a-b]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 0xb
+
+      chan-name:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: LED channel name
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@1b {
+            compatible = "ti,lp5812";
+            reg = <0x1b>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0x0>;
+                chan-name = "a0";
+            };
+            led@1 {
+                reg = <0x1>;
+                chan-name = "a1";
+            };
+            led@2 {
+                reg = <0x2>;
+                chan-name = "a2";
+            };
+            led@3 {
+                reg = <0x3>;
+                chan-name = "b0";
+            };
+            led@4 {
+                reg = <0x4>;
+                chan-name = "b1";
+            };
+            led@5 {
+                reg = <0x5>;
+                chan-name = "b2";
+            };
+            led@6 {
+                reg = <0x6>;
+                chan-name = "c0";
+            };
+            led@7 {
+                reg = <0x7>;
+                chan-name = "c1";
+            };
+            led@8 {
+                reg = <0x8>;
+                chan-name = "c2";
+            };
+            led@9 {
+                reg = <0x9>;
+                chan-name = "d0";
+            };
+            led@a {
+                reg = <0xa>;
+                chan-name = "d1";
+            };
+            led@b {
+                reg = <0xb>;
+                chan-name = "d2";
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c59316109e3f..3901c04b9734 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23934,6 +23934,12 @@ S:	Supported
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


