Return-Path: <linux-leds+bounces-6486-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E278CE8698
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 01:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5FA0301721B
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 00:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4722D9EC4;
	Tue, 30 Dec 2025 00:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIwrHut4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7666D2DA742
	for <linux-leds@vger.kernel.org>; Tue, 30 Dec 2025 00:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767054807; cv=none; b=u6MEtXVmaYoQ2uxBI2XpSAINo23q2rdoBE9heztsZw3bimx1cC9jhtnxoNX3ka/AXON3N7OKsy9eRJsglxqau5nPZVc2a1kGBFUBKCE176t3TstMUYe48OPtREus7K0VT7CWgUZB5bN2YioB8qAIWdIjH+t4JYQ8gF8ld+/BLTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767054807; c=relaxed/simple;
	bh=vb/BqLUoijBBLDl/+VX63lRV9liHQyfBjjjfUcHVVj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKrEVzPctFr+wv6946XKD7s7BtJD3Ay7k0mpE7me6o1TTY1OtwBZdseTN2ix/51svGNT7stYRhpFbfIrW8/ntOGsO0IIRQIMRTPCi0DVSc94iyArsRQxjJyHH0lIaxrPOdkL2PFJ20d+orCX1nvWUD/fFff/cibXqi0zsuAFv8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIwrHut4; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso10256727b3a.1
        for <linux-leds@vger.kernel.org>; Mon, 29 Dec 2025 16:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767054805; x=1767659605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1p20MzKIYWjbK41XCAaEYmJOhhEoaluLx+FMxYZpXG4=;
        b=nIwrHut4lzF28ux5/pyuYp8leBicqOoAPV8fLDGQEMF6eimJYLv0PhMmSCZpHVYX0/
         Yzq+Kgwb8x930jp2hJuYq1GWzbNrFFfwCOxnVvfhG2sCHJ5mG7dBvHlhyfgElHYMt0UV
         DUvCZxmHXrqbASjCbDI+cM5lvGmJ3Vk5YmLj3H2PR2Mhy6JbcSu0BjQkr0UwvmNmSlmB
         JI6rx1bFylpu8g0d1g5bXJq7uWrv/eDAnGm6J1uLT8j9+FKIcPvR8+mj4SLtnDpP3xW7
         tXNHFWmZdklfH2npaUbn+L7H7JpXeaY0tBwGL2PaEQnA3ZvdGrQRXRMVb9gfFnBOo+xL
         aZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767054805; x=1767659605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1p20MzKIYWjbK41XCAaEYmJOhhEoaluLx+FMxYZpXG4=;
        b=KnDH67D2eCAUs/Y2EMMRIIHBWsqbV/Kpw9WZIWNcL5oWn9wAlsGYvGv6CGmffROcfw
         q7oajyPOnhSeZ4TQx3DkDG2AoPV3yRXlwy1a30lVv+gmWUWnSVpUlbToXGyrP6yTDwLq
         tfzR70I5jvqNkwyrB2LF5Z5QM5pw25+c0iKgVftsNq4Fblt0Vnf+BRV2Bwtql13wqHaD
         EhM0onNY5eKPROqEqaUCC3xEn0vV3yazCqpqHXG9nJ/Cpzho89h/adVK8BZCkjle2im3
         wKqBVYDNzilGlgVKdKZe+s5fLcGrUiTuRCLlfyiTkFcqFHuqP7epCMTLcQ80LEYNPRbI
         sDRg==
X-Forwarded-Encrypted: i=1; AJvYcCXDK7bXCNtMXE00Kinnc1NKZbdF5W4/CFEXF24Nb90o7woUZEicAuaeNMh5b2M0IDnFaw3hfh+TwFvP@vger.kernel.org
X-Gm-Message-State: AOJu0YzpH1p2miRvFGkFPdjA6lFgd06kHXPpKm+rpv0ce/dFWOzr/NBq
	YPwMjQp6AvOtOiknW7B+H9x9hj+HrXCrdBbVPf0G88oVMSMbXK3p14dQTo1CXA==
X-Gm-Gg: AY/fxX6ar1dJpQe8fMqMsU6cWPGyH+Ddfk+ZHICV/QMISee4Nvg8m/MENdQTpmujJyI
	vM0vDe9g4B3c+B0XTKJ3g3N2vpNJ9Qy/gVJQue8cCI+pbqA6W00N9Y4n/58VpmaGD3ZUzMrUjOo
	eDDeu5I+AKFwBs2WBkIvr0xuxQsm0lmF8q2tCizs860F/0jppvsyUmy6EohmuEnDntvpvdhV8E8
	gSYeyiFCjevjCUWkPK3QHLbd/sfpq2MKbga1zvY+2jurwZWV5WBfDVL85nal2AAebH7QXcmuM7E
	09O/BqnxyFmiTv9JFQtLKdhMzBM5R+r+eR9NsCu0yMA1KmrTHL0YlN3n8aaJaGfWIhsvzd8p9mZ
	4CwOGKKzXhErcqgSZokeH/0Iwepuf8SXl3mXN+8Icy5gh1kks8nxBBEdI+IteG7v4JOqnUtsKBL
	LQ+/8bgmzL3Z3E4Xw1zOa18NaX/hgHx5x4
X-Google-Smtp-Source: AGHT+IGRgSrXXats3j15UWzgm8MkcNt+CUJWGAcVoa5xo4AR4v9EqVI4JWtRVE11S+bu1IVfOzO2CQ==
X-Received: by 2002:a05:6a00:4298:b0:7a2:8529:259 with SMTP id d2e1a72fcca58-7ff650c7d8dmr27213399b3a.9.1767054804733;
        Mon, 29 Dec 2025 16:33:24 -0800 (PST)
Received: from MRSPARKLE.localdomain ([150.228.155.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e8947a1sm30241562b3a.67.2025.12.29.16.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 16:33:24 -0800 (PST)
From: Jonathan Brophy <professorjonny98@gmail.com>
To: lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andriy Shevencho <andriy.shevchenko@linux.intel.com>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 3/7] dt-bindings: leds: Add virtual LED group controller bindings
Date: Tue, 30 Dec 2025 13:32:40 +1300
Message-ID: <20251230003250.1197744-4-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230003250.1197744-1-professorjonny98@gmail.com>
References: <20251230003250.1197744-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

Add device tree bindings for the virtual LED group controller that
provides priority-based arbitration for shared physical LEDs across
multiple virtual LED instances.

Bindings for the virtual driver are not describing hardware LEDs they
describe virtual devices made from groups of hardware LEDs created from an array
of LED phandles.

Normally the device tree is used to describe hardware not virtual hardware
but it is particularly useful in situations where you require an LED to be a
specific color by mixing primary colors, such as multi element multi color LEDs
to be operated from a device tree binding or a single trigger.

It also becomes useful with multiple LEDs operating the same indicator such as
ring of light indicators, led rope where the LEDs are driven From different GPIO
outputs unifying the control that can give basic indication during system startup,
shutdown upgrade etc...
The controller implements winner-takes-all arbitration where only the
highest-priority active virtual LED controls the hardware at any given
time. This enables multiple subsystems (boot, error, status indicators)
to request LED control without explicit coordination.

Binding supports:
- Multiple virtual LED children with independent priorities
- GPIO, PWM, I2C, and SPI physical LED devices
- Multicolor and standard (fixed-color) operating modes
- Global ownership tracking to prevent conflicts

Example configurations include:
- High-priority emergency/error RGB indicator
- Medium-priority system state RGBW indicator
- Low-priority warm white fixed-color indicator

Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 .../leds/leds-group-virtualcolor.yaml         | 170 ++++++++++++++++++
 1 file changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
new file mode 100644
index 000000000000..88c044f42879
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtual LED Group Controller with Multicolor Support
+
+maintainers:
+  - Jonathan Brophy <professor_jonny@hotmail.com>
+
+description: |
+  The virtual LED group controller provides priority-based arbitration for
+  shared physical LEDs across multiple virtual LED instances. Each virtual LED
+  combines physical monochromatic LEDs into logical units with:
+
+  - Priority-based arbitration: Higher priority virtual LEDs take precedence
+    when multiple virtual LEDs compete for the same physical LEDs
+  - Sequence-based tie-breaking: Among equal priorities, most recent update wins
+  - Winner-takes-all: Only ONE virtual LED controls ALL physical LEDs at any time
+  - Color channel grouping: Organize LEDs by color for multicolor control
+  - Full multicolor ABI support: multi_intensity, multi_index, multi_multipliers
+  - Two operating modes:
+    * Multicolor mode: Dynamic per-channel intensity control (default)
+    * Standard mode: Fixed color ratios via multipliers (brightness only)
+  - Brightness scaling: Master brightness control with per-channel intensity
+  - Global ownership: Physical LEDs claimed exclusively per controller instance
+  - Update batching: Optional coalescing of rapid brightness changes
+
+  Key features:
+  - Supports GPIO, PWM, I2C, and SPI LED devices
+  - Automatic physical LED discovery and claiming
+  - Lock-free arbitration with atomic sequence numbers
+  - Suspend/resume with state preservation
+  - Comprehensive debugfs telemetry (when CONFIG_DEBUG_FS enabled)
+
+  Typical use cases:
+  - System status indicators with boot/update/error priority levels
+  - RGB lighting with priority-based overrides
+  - Multi-element LED arrays unified into single logical controls
+  - LED rings or strips with coordinated color control
+
+properties:
+  compatible:
+    const: leds-group-virtualcolor
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^virtual-led@[0-9a-f]+$":
+    type: object
+    $ref: leds-class-virtualcolor.yaml#
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    /* Physical LED definitions */
+    led-controller {
+        compatible = "gpio-leds";
+
+        led_red: led-red {
+            color = <LED_COLOR_ID_RED>;
+            function = LED_FUNCTION_STATUS;
+            gpios = <&gpio0 10 GPIO_ACTIVE_HIGH>;
+            default-state = "off";
+        };
+
+        led_green: led-green {
+            color = <LED_COLOR_ID_GREEN>;
+            function = LED_FUNCTION_STATUS;
+            gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
+            default-state = "off";
+        };
+
+        led_blue: led-blue {
+            color = <LED_COLOR_ID_BLUE>;
+            function = LED_FUNCTION_STATUS;
+            gpios = <&gpio0 12 GPIO_ACTIVE_HIGH>;
+            default-state = "off";
+        };
+
+        led_white: led-white {
+            color = <LED_COLOR_ID_WHITE>;
+            function = LED_FUNCTION_STATUS;
+            gpios = <&gpio0 13 GPIO_ACTIVE_HIGH>;
+            default-state = "off";
+        };
+    };
+
+    pwm-led-controller {
+        compatible = "pwm-leds";
+
+        pwm_red: led-pwm-red {
+            color = <LED_COLOR_ID_RED>;
+            function = LED_FUNCTION_STATUS;
+            pwms = <&pwm 0 7812500>;
+            max-brightness = <255>;
+        };
+
+        pwm_green: led-pwm-green {
+            color = <LED_COLOR_ID_GREEN>;
+            function = LED_FUNCTION_STATUS;
+            pwms = <&pwm 1 7812500>;
+            max-brightness = <255>;
+        };
+
+        pwm_blue: led-pwm-blue {
+            color = <LED_COLOR_ID_BLUE>;
+            function = LED_FUNCTION_STATUS;
+            pwms = <&pwm 2 7812500>;
+            max-brightness = <255>;
+        };
+    };
+
+    /* virtual LED definitions */
+    virtual-led-controller {
+        compatible = "leds-group-virtualcolor";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* High-priority RGB virtual LED (emergency/error indicator) */
+        virtual-led@0 {
+            reg = <0>;
+            color = <LED_COLOR_ID_MULTI>;
+            function = LED_FUNCTION_STATUS;
+            priority = <1000>;
+            led-mode = "multicolor";
+            leds = <&led_red>, <&led_green>, <&led_blue>;
+            /* Channels ordered by color ID: [0]=red, [1]=green, [2]=blue */
+        };
+
+        /* Medium-priority RGBW indicator (system state) */
+        virtual-led@1 {
+            reg = <1>;
+            color = <LED_COLOR_ID_MULTI>;
+            function = LED_FUNCTION_STATUS;
+            priority = <500>;
+            led-mode = "multicolor";
+            leds = <&pwm_red>, <&pwm_green>, <&pwm_blue>, <&led_white>;
+            /* Channels: [0]=white (ID=0), [1]=red, [2]=green, [3]=blue */
+        };
+
+        /* Low-priority warm white (fixed color ratios, standard mode) */
+        virtual-led@2 {
+            reg = <2>;
+            color = <LED_COLOR_ID_MULTI>;
+            function = LED_FUNCTION_STATUS;
+            priority = <10>;
+            led-mode = "standard";
+            leds = <&led_red>, <&led_green>, <&led_blue>;
+            /* Channels: [0]=red, [1]=green, [2]=blue */
+            mc-channel-multipliers = <255 180 100>;
+            /* Creates warm white: full red, 70% green, 40% blue */
+        };
+    };
+
+...
--
2.43.0

