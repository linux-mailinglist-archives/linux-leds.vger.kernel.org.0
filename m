Return-Path: <linux-leds+bounces-6485-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BA6CE8695
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 01:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6534830133FE
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 00:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309F22DA774;
	Tue, 30 Dec 2025 00:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfHH3c2I"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472482D9EC4
	for <linux-leds@vger.kernel.org>; Tue, 30 Dec 2025 00:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767054803; cv=none; b=ZPoRY2H5DCH39oCrsiSNXyHZ7JcCMgkqmhkp2faI9FfiGfksePTte9B2lD5S0f5MUkFP65oqQ3tObEMK1OHLUo9gTNdp7EPDjRuPOIrTztiS5Hr0E9G+jS2qTi+DQymyNy7bkTTv394VmSiyFLcSduCLRqKkLWVR3PqOelM8Ndc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767054803; c=relaxed/simple;
	bh=OH5YDLvT7eFInoiNwMPu3oyYKH1FopxqgxlbMJ+9IBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RghGzqLiMJkQjimvevEcSZRKFwrk7uqq2ahaaGP7omja8OZg3S2STy7k/mcbSu5bLe8MV0rzzu6iFFJ2EFCD7OLRpjeZ1Jd6bTIlJhECr1Gtvj/f0hXuUTg8yGVSjx9lGPXvnRRVtQMjFtm/q8ne/nhdKKtMJscjpa08wpP9c8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfHH3c2I; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so9483620b3a.2
        for <linux-leds@vger.kernel.org>; Mon, 29 Dec 2025 16:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767054799; x=1767659599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkbI+3IsRhcx6hKZzGBXpGmnt+yRxhw1HJp+AgA3hxo=;
        b=XfHH3c2IuUkYGIaJnRBUFzbu8XgYiFDz35G2NLjGNXPpKX89MydFvuTJJME+ckj3lu
         3acd2861fb35OC1HtIuhZfKW9kQ9AyXpGPYsG981O75mpIEFp80O5E0ExaE7p5kax3dr
         pMlP4SGNgxvvfHoigdOT6cryJbcpP2ZZf5sSdWF0bPACYqqK6bVip8bFyx1EDOAw2b1X
         O3zGXwIzVt2kAyQaDxrBu8/JtiWPQ5y4B5y4lEoWK2ZkmEAoQdmcCE0EHb3/Byf7ZmMF
         0baS6A5Hv2hYaLCOzerXjFfsLmNS7Gvu10Q8rWSVjwdN55RcVVSmFloJhAIsnIwDl2rK
         0F4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767054799; x=1767659599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VkbI+3IsRhcx6hKZzGBXpGmnt+yRxhw1HJp+AgA3hxo=;
        b=skAQxGCSQlGbDcmFYUoIMcGIHqATpV56TtbzRx9pLIoxACuoeEk/lNHN/isqRF33dN
         +dJ4wOMVbPzFk8l1nMfaMB4uPGSYUnAepJSKRCWgHuuxLLAfON++UL+DjAm3H6HmEKS/
         IqjonsYZF5htGIHs9wEQ1rSVlCxVMaEnFNmAsKNCSh99s5rdCAI7JQcE9mwyTCWz4pmN
         Cezp47cHm4AANVR1bqDvZcX5hYTMhHsAST1XbjQZHRfQzhgiriyYUHtyoYlEjcMwYsWs
         wUQv+Gn/HaVOsd7/U+32ScL0HL3KFdUPW9zgjMty1AtbDsK2Xk0QQ9VKmZitUeNfnPM8
         fXVw==
X-Forwarded-Encrypted: i=1; AJvYcCVgptCyNXvTimFjCvF0K/DTI4fdUXG5PMP9E9cZOBMI0ye7zSHcrCXDbLHhg+DM/HbeBlKj9qwaC82y@vger.kernel.org
X-Gm-Message-State: AOJu0YzXVfptPC2Ms8taKZSwtX6S4V8siyQz+epQmUsuiiRC+jz/whwB
	3ldbKjzl3kGeY5kLKfNYjIJq4gHY/t4nynrQCJMqWJt3g0VbK7i7JL/8
X-Gm-Gg: AY/fxX4ZQdR2Y3OYWM9jE+o42XMucLxc5dcNwh3j3oCfBMVUgRonZqKqdvGckyJr7bQ
	zo4DvOFjUWZ0Mv7HR83Rlzek8CH+irWlgBFs9dRXS3dugnNtBfn9bDmos9a8RP2Sob9K1Yqkuv3
	xFk6mzGmzZxvyUR+ly/WXqatv4CAkOYVjG79VK4O6K1xBV8s/aEsA08MiJ9jyq+R/PZ1tjL+haR
	m6W5AIb9Hyim4UniiiIXYqTOnZKWLFAB+WukqSUyDd9CEuWuXJj8SOxrvqfzvJyz/2chPXPdlyX
	0x9IaflbvqKBlJ2SJF3Gov4w1xX03IfsFOxnI+ykbFFgWsH3QmuTJDLITuRzo34LLn51SZbhZ+I
	+KWRngZF2kJki+2RdcjBaxEWbixBpwZCq+21zdD8W0IW+14ECnEEXRCQ6UKQVTDqktyOb6vsOi+
	doIa60PBbSKifz4K5OCANHQp7KR1hCYhSU
X-Google-Smtp-Source: AGHT+IECW0eo3Oi62nw/+nZehLW7fne4GAiwW05RNQvGenyCKL5tdoQdZfmoiNvdPl9P4jxCFkb57g==
X-Received: by 2002:a05:6a00:3002:b0:7ab:8d8a:1006 with SMTP id d2e1a72fcca58-7ff644011fbmr23360668b3a.2.1767054799508;
        Mon, 29 Dec 2025 16:33:19 -0800 (PST)
Received: from MRSPARKLE.localdomain ([150.228.155.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e8947a1sm30241562b3a.67.2025.12.29.16.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 16:33:19 -0800 (PST)
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
Subject: [PATCH v4 2/7] dt-bindings: leds: Add virtual LED class bindings
Date: Tue, 30 Dec 2025 13:32:39 +1300
Message-ID: <20251230003250.1197744-3-professorjonny98@gmail.com>
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

Add device tree bindings for the virtual LED class of led devices.
for representation of virtual LEDs that combine multiple physical monochromatic
LEDs into a group.

Usefull for representing complex system states without complex userspace scripting

Key binding properties:
- priority: Arbitration priority (0-2147483647, higher wins)
- led-mode: Operating mode (multicolor or standard/fixed-color)
- leds: Phandle array to physical LED devices
- mc-channel-multipliers: Per-channel brightness multipliers

Channel ordering is deterministic, sorted by ascending LED_COLOR_ID
value. The multi_index sysfs attribute allows runtime verification.

Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 .../leds/leds-class-virtualcolor.yaml         | 197 ++++++++++++++++++
 1 file changed, 197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-virtualcolor.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-class-virtualcolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-virtualcolor.yaml
new file mode 100644
index 000000000000..4a3721455648
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-class-virtualcolor.yaml
@@ -0,0 +1,197 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-class-virtualcolor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtual LED class device with priority-based arbitration
+
+maintainers:
+  - Jonathan Brophy <professor_jonny@hotmail.com>
+
+description: |
+  Represents a single virtual LED that combines one or more physical monochromatic
+  LEDs. Multiple virtual LEDs can share the same physical LEDs, with priority-based
+  arbitration determining which virtual LED's state is displayed.
+
+  The driver implements winner-takes-all arbitration:
+  - Only virtual LEDs with brightness > 0 participate in arbitration
+  - Highest priority wins (ties broken by sequence number - most recent wins)
+  - Winner controls ALL physical LEDs
+  - Physical LEDs not used by winner are turned off
+
+  Two operating modes are supported:
+
+  1. Multicolor mode (default):
+     - Full multicolor LED ABI support
+     - Exposes multi_intensity, multi_index, multi_multipliers in sysfs
+     - Per-channel intensity control (0-255)
+     - Channel multipliers for color temperature adjustment
+     - Master brightness scales all channels proportionally
+
+  2. Standard mode:
+     - Fixed color ratios via mc-channel-multipliers
+     - Only brightness control available (no intensity changes)
+     - Useful for fixed-color LEDs (e.g., warm white, amber)
+
+  Sysfs interface (multicolor mode):
+  - /sys/class/leds/<led>/brightness - Master brightness (0-max_brightness)
+  - /sys/class/leds/<led>/mc/multi_intensity - Per-channel intensities (space-separated)
+  - /sys/class/leds/<led>/mc/multi_index - Color IDs per channel (read-only)
+  - /sys/class/leds/<led>/mc/multi_multipliers - Channel multipliers (read-only)
+
+properties:
+  $nodename:
+    pattern: "^virtual-led(@[0-9a-f])?$"
+
+  reg:
+    maxItems: 1
+    description: |
+      Unique index of this virtual LED within the controller. Used for node addressing.
+
+  function:
+    description: |
+      LED function identifier. recommended to use: LED_FUNCTION_VIRTUAL_STATUS,
+      See include/dt-bindings/leds/common.h
+
+  priority:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    minimum: 0
+    maximum: 2147483647
+    description: |
+      Arbitration priority for this virtual LED (signed 32-bit integer).
+      When multiple virtual LEDs sharing physical LEDs are active (brightness > 0),
+      only the highest-priority LED's state is displayed.
+
+      Tie-breaking: If priorities are equal, the most recently updated virtual LED wins.
+
+      Suggested priority ranges:
+        0-99:   Normal operation indicators
+        100-499: System state indicators (boot, shutdown)
+        500-999: Warning/error indicators
+        1000+:   Critical alerts and emergency overrides
+
+  led-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [multicolor, standard]
+    default: multicolor
+    description: |
+      Operating mode for this virtual LED:
+
+      - "multicolor": (default) Full multicolor ABI with dynamic intensity control
+        * Exposes multi_intensity sysfs attribute for per-channel control
+        * Channels can be adjusted independently at runtime
+        * Suitable for RGB LEDs, color-changing indicators
+
+      - "standard": Fixed color ratios, brightness-only control
+        * Channel intensities fixed by mc-channel-multipliers
+        * Only brightness sysfs attribute available (no multi_intensity)
+        * Suitable for warm white, amber, or other fixed-color LEDs
+
+  leds:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 255
+    description: |
+      Array of phandles to physical LED devices that compose this virtual LED.
+      LEDs are automatically grouped by their 'color' property into channels.
+
+      Channel ordering: Channels are ordered by ascending LED_COLOR_ID value.
+      Only colors present in the LED list are included (no sparse indices).
+
+      Color ID values (from include/dt-bindings/leds/common.h):
+        LED_COLOR_ID_WHITE = 0
+        LED_COLOR_ID_RED = 1
+        LED_COLOR_ID_GREEN = 2
+        LED_COLOR_ID_BLUE = 3
+        LED_COLOR_ID_AMBER = 4
+        LED_COLOR_ID_VIOLET = 5
+        LED_COLOR_ID_YELLOW = 6
+        LED_COLOR_ID_IR = 7
+        ... (see header for complete list)
+
+      The /sys/class/leds/<led>/mc/multi_index file reports the color ID for
+      each channel, allowing userspace to verify the ordering.
+
+      Supported LED types:
+      - GPIO LEDs (gpio-leds compatible)
+      - PWM LEDs (pwm-leds compatible)
+      - I2C/SPI LED controllers (any with brightness_set or brightness_set_blocking)
+
+      Example 1 - RGB LED:
+        leds = <&led_red>, <&led_green>, <&led_blue>;
+        Results in 3 channels: [0]=red (ID 1), [1]=green (ID 2), [2]=blue (ID 3)
+
+      Example 2 - RGBW LED:
+        leds = <&led_red>, <&led_green>, <&led_blue>, <&led_white>;
+        Results in 4 channels: [0]=white (ID 0), [1]=red (ID 1), [2]=green (ID 2), [3]=blue (ID 3)
+        Note: White comes first because LED_COLOR_ID_WHITE = 0
+
+      Example 3 - Non-contiguous IDs:
+        leds = <&led_amber>, <&led_red>;
+        Results in 2 channels: [0]=red (ID 1), [1]=amber (ID 4)
+
+      Userspace verification:
+        $ cat /sys/class/leds/status:multi/mc/multi_index
+        1 2 3
+        # Confirms: [0]=red, [1]=green, [2]=blue
+
+  mc-channel-multipliers:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 255
+    description: |
+      Per-channel brightness multipliers (0-255) for color temperature adjustment
+      and normalization. Array must have one entry per channel.
+
+      Channel ordering: Array indices must match the channel order, which is
+      determined by ascending LED_COLOR_ID value. Only colors present in the
+      'leds' property are included.
+
+      For predictable DT configuration, list multipliers in ascending color ID order.
+      The /sys/class/leds/<led>/mc/multi_index file can verify the ordering at runtime.
+
+      In multicolor mode:
+        - Scales the intensity value before applying brightness
+        - Formula: final = (intensity * multiplier / 255) * brightness / max_brightness
+        - Useful for: Color temperature control, vendor normalization, power limiting
+        - Default: 255 (no scaling) for all channels if omitted
+
+      In standard mode:
+        - Defines the FIXED color ratios (intensity changes not allowed)
+        - Formula: final = multiplier * brightness / max_brightness
+        - Useful for: Fixed-color LEDs (warm white, amber)
+        - REQUIRED in standard mode
+
+      Example 1 - RGB with equal scaling:
+        leds = <&red>, <&green>, <&blue>;
+        mc-channel-multipliers = <255 255 255>;
+        # Channels: [0]=red, [1]=green, [2]=blue - all at full scale
+
+      Example 2 - RGBW warm white (standard mode):
+        leds = <&red>, <&green>, <&blue>, <&white>;
+        mc-channel-multipliers = <180 255 200 100>;
+        # Channels: [0]=white:180, [1]=red:255, [2]=green:200, [3]=blue:100
+        # Note: White (ID=0) comes first, then red (ID=1), green (ID=2), blue (ID=3)
+
+      Example 3 - Color temperature adjustment:
+        leds = <&red>, <&green>, <&blue>;
+        mc-channel-multipliers = <255 180 100>;
+        # Creates warm white by reducing green/blue relative to red
+
+required:
+  - reg
+  - leds
+
+allOf:
+  - $ref: common.yaml#
+  - if:
+      properties:
+        led-mode:
+          const: standard
+    then:
+      required:
+        - mc-channel-multipliers
+
+unevaluatedProperties: false
--
2.43.0

