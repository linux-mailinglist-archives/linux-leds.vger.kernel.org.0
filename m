Return-Path: <linux-leds+bounces-5814-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C935BEE231
	for <lists+linux-leds@lfdr.de>; Sun, 19 Oct 2025 11:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4628189FB0C
	for <lists+linux-leds@lfdr.de>; Sun, 19 Oct 2025 09:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8582E427C;
	Sun, 19 Oct 2025 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4yI0/ft"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D132E2661
	for <linux-leds@vger.kernel.org>; Sun, 19 Oct 2025 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760865855; cv=none; b=YPJh37X+wgYaqERY6akDZv/krrCt3Hupu46b/YNzzalgy7h0G2PzKsIQJXzOapF/d5Va6S8yA41jyV5fNvqQjaJ2kftGZK/NWOiWlkSc38FD7oLABZst/o1ggsYpVtVwBBz/RhnKOzwoQ0Gbtf3HXerVOSTt+I4XTsKsgpYZvwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760865855; c=relaxed/simple;
	bh=owoad7TCAazZ3yfCUCn3ZlXjoAAtmzUY5Xjm2sbEbMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxRWg/CLsbczY0q9r2TbaEo8qQALxaY+OqVEiD73VGl/kX7750y5xtEgdeu5/CBSPrXgYADvqA3HPbDvw6c2HfYfnOjGk+TE7zZ5rWeigYZaMBBS9rNCorIGcjjHLCJi1FH5kjU6LyZ3p+3csXX4R9EicOYbWegjcRXEX824Bzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4yI0/ft; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2909448641eso32722095ad.1
        for <linux-leds@vger.kernel.org>; Sun, 19 Oct 2025 02:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760865854; x=1761470654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDKF4T5CAxbNndzFQqwO7CQ0T8SHXKuxvoZSYO86itI=;
        b=S4yI0/ftbJ5sDNbl6l+IJ90VxUWaUNDXnEJGG8kzBhPStlw1EJlYUfIJUXcz7J+0fW
         li8oA8O/Vc+GQqiTEAsEppFETiayLDM9q472uUD59oRHyY8pimBcVugWlT8x7NEYIh+r
         0aOzY9AaRLCMl8u2gurZm08O/3B4y2HI8BOd/hI7bgAAubGJyRUKxUfi8otLXHuXzdMU
         IZ+JMyAE3wqM0DezdME0u7i36kk6OMHcju+7tLBaWFa3G/KfXi0UMBwgwyE0qVkeGEmC
         ULjbmUMJu7rOGZBizHQ6fAh+SFK4mIFac0CGnt8MjO3xdzi82/eGP3kJOnf6Ymsl09n+
         pm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760865854; x=1761470654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDKF4T5CAxbNndzFQqwO7CQ0T8SHXKuxvoZSYO86itI=;
        b=k29yrEtKjtZFCb3zgMHYY0/4eJif+oJkC/oTOvr7E26szuEd1MJCanTB7o/cEau4eS
         ssI6qSzCf+fOkxf/edvY097ydhJWHUGnKflYlH19HO6tD4yQKVm5drXnqPSLhKlepaxB
         NbIITFKw6rWo4vsnb+W8KTMFMg+sXl/fmUzPCqOZNECAxeb2eBBT5t1GWE12iGlFyRgV
         DPLYwHzmjTXqiRhoNwYeWyXuE/uszvAkpbGYmExW/Z5NVkXY4hPCq/AGaL+MLA9MgVb0
         8ZYJ0+TwsSSPOZx6c/p2EWFJXKQRlYjJ41Lofgl5RdGhdCgSGwkeb9jXqLkozK3Bieyc
         xv0g==
X-Forwarded-Encrypted: i=1; AJvYcCUdPzmy0mLgcx5maW0AZ/QPo3YDUGrycAZcWXNh+TYwsYyskBgBprGrSbdAIvhh//xpDsxG3Zz1p1q9@vger.kernel.org
X-Gm-Message-State: AOJu0YzAT8xFVEV4lpDM/LNjDQXEIsTeX8DOfycVWlW2gky6/vlJhs22
	07HJV2RtRqsEBkJNSVap7gpIcAX5cyfkueC4ZRWjx7o2joQUZ+r7o5PS
X-Gm-Gg: ASbGncuw2d8LlU6xsWxztbSfkMpedaVtLPSdfYv5EWgF67xEqRXQ6MwWnCWY1zoAPDr
	bVaxv/r73Dl0r/32n0VLm3PRabfmvvv2xtZF3FImNxFEWRKu7KeZllZzGOHLUZVVCEzrCr1K2xK
	JqPp4Wfv5x9g+TYBrkIfXyJY5x2ryWPsptJQMrgsxpaK6x1sapPaxHXBdIVMK4cmwDiHsPHyVAw
	yx/nMk1LqeRHCxqXVegJYQtTi48R0mXbc4r1HOdMhkIxtaZP/XdMKkGEsKu+hw0vty59iyxjhjJ
	f9r6lOIzLFcT6BWDVF34ogjDvhkrZ+WyR+9EonLjd4xqlYV0NTveCZPeI4NZlmCBw6dh9WI9cDw
	B8TG3XoZ094/qZiHmGGxla9Bx+pKqd8ps7arBfzuP93+e39KBkCVJp4uGt2BRGWDw8Bser01uVE
	gVmYgfw/RZPB7RfMrl7bYkT4ZuRB9EcA==
X-Google-Smtp-Source: AGHT+IGEvwjAaXnEv8no6RZsY0HBC49g6PiK4QzNbg3KorZuw7bgkfXWv3VkMFMoukIOrSt53i/tAw==
X-Received: by 2002:a17:902:e5c8:b0:25c:43f7:7e40 with SMTP id d9443c01a7336-290c69dcee1mr125886265ad.10.1760865853595;
        Sun, 19 Oct 2025 02:24:13 -0700 (PDT)
Received: from MRSPARKLE.localdomain ([206.83.99.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebd215sm48313115ad.14.2025.10.19.02.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 02:24:13 -0700 (PDT)
From: Jonathan Brophy <professorjonny98@gmail.com>
To: lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: leds: Add virtualcolor group dt bindings documentation.
Date: Sun, 19 Oct 2025 22:23:25 +1300
Message-ID: <20251019092331.49531-3-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251019092331.49531-1-professorjonny98@gmail.com>
References: <20251019092331.49531-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

Add device tree binding documentation for the virtual LED group driver
that implements virtual LED groups by aggregating multiple monochromatic
LEDs

Bindings for the virtual driver are not describing hardware LEDs they
describe virtual devices made from groups of hardware LEDs created from an array
of LED phandles.

Normally the device tree is used to describe hardware not virtual hardware
but it is particularly useful in situations where you require an LED to be a
specific color by mixing primary colors, such as multi element multi color LEDs
to be operated from a device tree binding.

It also becomes useful with multiple LEDs operating the same indicator such as
ring of light indicators where the LEDs are driven From different GPIO outputs
unifying the control that can give basic indication during system startup,
shutdown upgrade etc...

co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 .../leds/leds-group-virtualcolor.yaml         | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
new file mode 100644
index 000000000000..f638bdd4d65e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+title: virtualcolor LED group driver
+maintainers:
+  - Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
+description: |
+  Implements virtual LED groups by aggregating multiple monochromatic LEDs.
+  Provides priority-based control for managing concurrent LED activation requests,
+  ensuring only the highest-priority LED state is active at any given time.
+properties:
+  compatible:
+    const: leds-group-virtualcolor
+  '#address-cells':
+    const: 1
+  '#size-cells':
+    const: 0
+patternProperties:
+  "^virtual":
+    $ref: leds-class-virtualcolor.yaml#
+required:
+  - compatible
+additionalProperties: false
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    led-controller {
+        compatible = "gpio-leds";
+        led_red: led_red {
+            gpios = <&gpio0 10 GPIO_ACTIVE_HIGH>;
+            default-state = "off";
+        };
+        led_green: led_green {
+            gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
+            default-state = "off";
+        };
+        led_blue: led_blue {
+            gpios = <&gpio0 12 GPIO_ACTIVE_HIGH>;
+            default-state = "off";
+        };
+    };
+
+    pwm-led-controller {
+        compatible = "pwm-leds";
+
+        led_1: led-1 {
+            color = <LED_COLOR_ID_RED>;
+            pwms = <&twl_pwm 0 7812500>;
+        };
+
+        led_2: led-2 {
+            color = <LED_COLOR_ID_GREEN>;
+            pwms = <&twl_pwmled 0 7812500>;
+        };
+
+        led_3: led-3 {
+            color = <LED_COLOR_ID_RED>;
+            pwms = <&twl_pwm 0 7812500>;
+        };
+
+        led_4: led-4 {
+            color = <LED_COLOR_ID_GREEN>;
+            pwms = <&twl_pwmled 0 7812500>;
+        };
+
+    };
+
+    virtual-led-controller {
+        compatible = "leds-group-virtualcolor";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        virtual_red@0 {
+            reg = <0>;
+            function = LED_FUNCTION_VIRTUAL_STATUS;
+            color = <LED_COLOR_ID_RED>;
+            leds = <&led_red>;
+            priority = <2>;
+        };
+
+        virtual_yellow_mix@1 {
+            reg = <1>;
+            function = LED_FUNCTION_VIRTUAL_STATUS;
+            color = <LED_COLOR_ID_YELLOW>;
+            leds = <&led_green &led_red>;
+            pwm-leds-red = <&led_1 &led_2>;
+            pwm-leds-green = <&led_1 &led_3>;
+            priority = <1>;
+        };
+
+        virtual_white@2 {
+            reg = <2>;
+            function = LED_FUNCTION_VIRTUAL_STATUS;
+            color = <LED_COLOR_ID_WHITE>;
+            leds = <&led_red &led_green &led_blue>;
+            priority = <15>;
+        };
+
+        virtual_pwm_red@3 {
+            reg = <3>;
+            function = LED_FUNCTION_VIRTUAL_STATUS;
+            color = <LED_COLOR_ID_RED>;
+            pwm-leds-red = <&led_1 &led_3>;
+            priority = <1>;
+        };
+    };
--
2.43.0

