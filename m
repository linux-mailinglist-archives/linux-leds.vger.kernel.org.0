Return-Path: <linux-leds+bounces-6046-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5170BC437F9
	for <lists+linux-leds@lfdr.de>; Sun, 09 Nov 2025 04:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53DC2188CF81
	for <lists+linux-leds@lfdr.de>; Sun,  9 Nov 2025 03:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7FD2036E9;
	Sun,  9 Nov 2025 03:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfddiPDC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DA61FECD4
	for <linux-leds@vger.kernel.org>; Sun,  9 Nov 2025 03:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762658579; cv=none; b=OOlSc9B/ipukpXk4UbHpPvLKQI7YbxHN7rm7RjSv2U60P/4HnblFE7pBoMqInUOdaFGzqVfTPClVVUnp4aZP1N716GnIsHKqpd0evnzOjPf8UMDYUjfn7fO1WPHSy1pVEQxxn+EAJodjP86gf4rFGxa7McEiJh40r9yn7Catqyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762658579; c=relaxed/simple;
	bh=vPxJ/by/abaOom4AmLg1ViOmOazh60+nNoiMNG82d74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgIcSbwErkmZ+FXShT34vq2+gP1iyawJAWlhHl1f8JlSjqV+nh+8l0Py5MPgCUDA6iMEAuT/q1Mn5xzcsSK8PgVGShLSRWl6aqaCiGkcGRM9aHCG+aBRNS8+xutnApOR5BVYI0mZuzwGSZ1GmZFS4YKmB3uVl1WfgFSvhSrcmpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfddiPDC; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-29555415c5fso24916155ad.1
        for <linux-leds@vger.kernel.org>; Sat, 08 Nov 2025 19:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762658577; x=1763263377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6/p/VFD5rODc41UaByBAjykLqoESbzOCT7V1sUMyAw=;
        b=hfddiPDCarXNEqvx+7tfRgkgfELETkr8OyRsosTfj4Ta10Kb5r0pH5+h24qTjspwTU
         1utRdfvoqgcGfTfuBvsxs+hD/JgLxZUn3dqTHcLO0R1kReBQojGSe3+XYSG/zuo0TVrg
         qF8zEvu0tH7i/AZ8Oyb9jwsL7EItUqFUYhSsOpr7sCvy3vmGHuEI6Pb873yaZGIX5pCs
         NyXOWRFRoKhsaafSqAUYFEfF0p98y+4iCVqqepKYmwU6LkyRHdD+MWE/5FQyPTOPyi7c
         gpxJ36a3eAQqU/gNN30WPsuVvw1UWZx2Vhtod1E+lp5Uctm4MmmnGlY0wFWy1juttwVo
         dECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762658577; x=1763263377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y6/p/VFD5rODc41UaByBAjykLqoESbzOCT7V1sUMyAw=;
        b=l7JE7fHxWV23F4jHY0Ss1nqPHhigOeRFAcrxVbxrumwJQVLgtQPQJ6EMCyknM0hf63
         0fwkHdgcBJEhV+uGw/eDRiLE7jhpWscwpGkFcRYispRFVIVyFrFhIRWgaMHmxXe7vFbR
         OOQRs+wB/h15kNQI28wujvqwV6HzfcRcjHvqzXXFQmhQfn4/lrA9SSI/yMirRYBZmpu/
         dEtjuogzEIfEhaQ1wZ3YHQGOPeLvtsujgKSS3bJqfmT715Pzzz7fG605vu2cfRG/wTxn
         A91pa7gaE13jkeAzeThcMoIx35Gykgs/SvN6THgzCBM0AP3CAPrnAvw9u14LNFdqyrfW
         MFRA==
X-Forwarded-Encrypted: i=1; AJvYcCUbfZxA01MINZVCoDOMqElJkZHuxfAIvPIxC2uO7DZlz+GHBHm4xQAL41L5vlW1eS5jlUxlO0JMZmti@vger.kernel.org
X-Gm-Message-State: AOJu0YzDIPPVzbl6B7POOPJyNQKWaS9QQ9Rwi2jt0AYjrN9UHZsNDWFm
	JzadgAESylM/K+4FnjHtKzt9unYYWxk1l6v5xuH5PnYH3WtyIDXzivE4qo0xluR3xNFQGA==
X-Gm-Gg: ASbGncs+9exh+Csiix5e90S0qrw2N8jYZnogd3RnCdc+UVK/9/r5lZWlnoOUmmAO+6d
	F5y4uqmNmsVhbqKT+kCEzInn3WeSRWvRshN1LRCERKyP6UDr82z+Pr0IPFEQSD1E9SN0xJOc4fo
	D5BbG6DtEEhUNCBYhAcv14QZK2yaiRRF3w5XXsirSkAlaqV84MOVgYX3p96XSBV60Nb8Qd247cV
	n/wYBxgN9NjdrQNdrmRUYsXuBv56t9jRi7nBV0dRm2URZdPEO/UXi0QGzZAefXqAsGtVkmNVPor
	+VlD1HmyJSwZKp6wGZTvx+6NnVyHh2aGEiBjHh/WDyyU1sJgwsP0qOKVhsPvspZxZJQEp/hfV1W
	AG0KX1Dy6Qfj1GI/m08PD531tPUrar9QD29ncyomCjts1IXz64NrShfaeIHGA+ABN3u3H9oF/O6
	mxUj3Fygs=
X-Google-Smtp-Source: AGHT+IGjUSrbW6m1DH+9XkPyVh7AhctSYExE5kfh2YwM8eVJ3y2QK60XKY2TAgRvk2wScpvMqkmDcw==
X-Received: by 2002:a17:903:3ba4:b0:295:70bd:b04b with SMTP id d9443c01a7336-297e5708ef8mr48929025ad.55.1762658576771;
        Sat, 08 Nov 2025 19:22:56 -0800 (PST)
Received: from VM-0-14-ubuntu.. ([43.134.26.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296509682casm101941215ad.22.2025.11.08.19.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 19:22:56 -0800 (PST)
From: Junjie Cao <caojunjie650@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Junjie Cao <caojunjie650@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: leds: backlight: Add Awinic AW99706 backlight
Date: Sun,  9 Nov 2025 11:22:39 +0800
Message-ID: <20251109032240.3422503-2-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251109032240.3422503-1-caojunjie650@gmail.com>
References: <20251109032240.3422503-1-caojunjie650@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Awinic AW99706 backlight binding documentation.

Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
Changes in v3:
- breaking a long line (Krzysztof)
- rename backlight node (Krzysztof)
- Link to v2: https://lore.kernel.org/linux-leds/20251103110648.878325-2-caojunjie650@gmail.com

Changes in v2:
- use proper units for properties (Krzysztof)
- drop non-fixed properties (Krzysztof)
- add properties(max-brightness, default-brightness) (Krzysztof)
- Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727-2-caojunjie650@gmail.com

 .../leds/backlight/awinic,aw99706.yaml        | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
new file mode 100644
index 000000000..f48ce7a34
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/awinic,aw99706.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic AW99706 6-channel WLED Backlight Driver
+
+maintainers:
+  - Junjie Cao <caojunjie650@gmail.com>
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: awinic,aw99706
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO to use to enable/disable the backlight (HWEN pin).
+    maxItems: 1
+
+  awinic,dim-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      Select dimming mode of the device.
+        0 = Bypass mode.
+        1 = DC mode.
+        2 = MIX mode(PWM at low brightness and DC at high brightness).
+        3 = MIX-26k mode(MIX mode with different PWM frequency).
+    enum: [ 0, 1, 2, 3 ]
+    default: 1
+
+  awinic,sw-freq-hz:
+    description: Boost switching frequency in Hz.
+    enum: [ 300000, 400000, 500000, 600000, 660000, 750000, 850000, 1000000,
+            1200000, 1330000, 1500000, 1700000 ]
+    default: 750000
+
+  awinic,sw-ilmt-microamp:
+    description: Switching current limitation in uA.
+    enum: [ 1500000, 2000000, 2500000, 3000000 ]
+    default: 3000000
+
+  awinic,iled-max-microamp:
+    description: Maximum LED current setting in uA.
+    minimum: 5000
+    maximum: 50000
+    multipleOf: 500
+    default: 20000
+
+  awinic,uvlo-thres-microvolt:
+    description: UVLO(Under Voltage Lock Out) in uV.
+    enum: [ 2200000, 5000000 ]
+    default: 2200000
+
+  awinic,ramp-ctl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      Select ramp control and filter of the device.
+        0 = Fade in/fade out.
+        1 = Light filter.
+        2 = Medium filter.
+        3 = Heavy filter.
+    enum: [ 0, 1, 2, 3 ]
+    default: 2
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@76 {
+            compatible = "awinic,aw99706";
+            reg = <0x76>;
+            enable-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+            default-brightness = <2047>;
+            max-brightness = <4095>;
+            awinic,dim-mode = <1>;
+            awinic,sw-freq-hz = <750000>;
+            awinic,sw-ilmt-microamp = <3000000>;
+            awinic,uvlo-thres-microvolt = <2200000>;
+            awinic,iled-max-microamp = <20000>;
+            awinic,ramp-ctl = <2>;
+        };
+    };
+
+...
-- 
2.51.1.dirty


