Return-Path: <linux-leds+bounces-5813-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E59BEE228
	for <lists+linux-leds@lfdr.de>; Sun, 19 Oct 2025 11:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C2C64E7F6B
	for <lists+linux-leds@lfdr.de>; Sun, 19 Oct 2025 09:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F0D2E2F15;
	Sun, 19 Oct 2025 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVlzshSa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFE92E2DDE
	for <linux-leds@vger.kernel.org>; Sun, 19 Oct 2025 09:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760865851; cv=none; b=rUXChnKkCGzopqzdHMrsgW1AMJLTXU9wH34lCt3zMHQYkQtv0MmIguyxisPceW18262DPr9rIjIllmjVBKoTEfZKZXfwt2/c4B12juwCv3bQQPw20FslFasPnE3HG1KP+kTG1deKIBV7wD6KIGPHu8Q91qH/rICws+Ch/AFfmjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760865851; c=relaxed/simple;
	bh=df02DgKrk+4o0j+XKxT+07XTitEQJgCwjqyHdVDKGB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hzP+aiI/plAViQlA0HmkRXFUNINr0L/+AiRIMfVFqMjydVrPFjt7O++6Fmg6FPFzLR0wMLDz2NR3X8hM0zQqXy/Lhtm7+VaLqRd6rvWkSx1MlEX35Jl6aH9UH5DPS9aZEWQ/fMp6OhmILQq+eKRAJSSQIt8mmAj6KiXoyEwqBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVlzshSa; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-290dc63fabbso20523745ad.0
        for <linux-leds@vger.kernel.org>; Sun, 19 Oct 2025 02:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760865849; x=1761470649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7v31il/9BPRPMXGobjFhUFF4PVck9XrAiCxTyIxRVAo=;
        b=RVlzshSaBWJfXtFE7vcqGzGYQ+A3fyz1jGSZhd3ctTICWHaJamXtAy2UmKj0ehRxIf
         dZJaN/iRoI+/R2iw2VNxV/W0sUFaj8kf8PM1ppcAZROIyNYQkR/ScbaQegf/A7DVkOe9
         ssgArE5aBxDbQ6BTgtxr7ukGt9moZQMaYTAVa3UAMIRM2AsCx8HSdOZJfxESfk2KshTi
         X+1ONBJELb0dPqnaq3z5iv45Yr0Tptumu/uCN5yFkE2V4Sdm5NnbShqRZwte6/+1IUuv
         Aeuy/wlQZbRwn47rIEHZvDlAwtQyZg9bpL18ttZpukMtfMrPTgFKTDQeP39qOT2UA++1
         mlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760865849; x=1761470649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7v31il/9BPRPMXGobjFhUFF4PVck9XrAiCxTyIxRVAo=;
        b=g7RmSc+FL/sHqDPXiF5VrWS8qeV2GQiwq2xlOfGPoabLZ4JLenMbJCAPqoQZ2Afu0N
         emErYSYoBuloMbLSMWRHM7ryJP0WRpOmmVkQTEk9yi/0+1RN/O+bfbQOrX4ov4uKRdlK
         IE480pww+20QoSOhqEsyPqsDaLqtfNLmPannjk2DPh8NSXU9MB7doajjppBLAhjAO3H8
         n5biOypqu79e3opgcxjdpprmkh0myID1NyKATrhqyCFo0QgbDwb7/5qNSeKlsGCHJvEL
         +0fXUFizsXFKNBs9MU7FR9XP7PUXsZzgzmDyto1eZQy8mopi1EkNavGDoAOG+A7nYG9f
         Ij0A==
X-Forwarded-Encrypted: i=1; AJvYcCVhIbsfE9YLYSPWXFe7Hhn9B9/RKgCKi7GBjR1SpmREteVC/lthXzX4sSK5AjCGoqEyyUoI1/Gm2E5v@vger.kernel.org
X-Gm-Message-State: AOJu0YwsYEKWcVI29fc61qWtjyubdH4iwcJZ6J4MtKI8vILaYTFUBXib
	xfPnbVA+4uUydAVseVZRZu5IliPliaO7+/YEmFmwzrgAPV2mjiABZcRw
X-Gm-Gg: ASbGnctRpmbacr2Ovix0IOJKNGZDo4TiKrzXITmEfhQ5XDJDi/NZGjIvUTmsAPr9M7l
	ldC1vkal706k0MKB6XVz/HBHjZsjQxjS3AUS/+EiLAJGN7hy9kC696lMrvGuCys4B1tyR9P8NlI
	9PrwK4MBlEHlefECCbII+zAWu8NHkFXU5m6Sc5VRogGymfX7pXkqaKL9ZitilF+Foc7cSyzBOgX
	bpz80B0hD+X6bkJcw5R96QI5W33niPuodzL7MPdUgW70BqoPoqrXm7PuBD3Iwg6bpNWtWQEnh8d
	/cPC+jWa8gJxjfkZ3n4xvw+csEuxPccOeimepqe7bxyx7Yndlc4R7I4Pt5NVzIwvU62LrtdoD+h
	ViMMD7OwfMbSAo5M61jpHiCoaYWrsMK3LlGNWQFA8xa4ZlzyL7sB4ow+llADq7rmHzfd3uaxQ7b
	Gupw455m4x534Si7A8npjl1D0zZxZp8A==
X-Google-Smtp-Source: AGHT+IFRlFFqv027OSQUv7v+MX1Tdba7pA0SqEFYdNoXA1iNG1aZgnCBxSFI/EZIbC1jeqbHbOHR4g==
X-Received: by 2002:a17:903:46d0:b0:26a:b9b4:8342 with SMTP id d9443c01a7336-290c9cf2ca2mr120029135ad.25.1760865849103;
        Sun, 19 Oct 2025 02:24:09 -0700 (PDT)
Received: from MRSPARKLE.localdomain ([206.83.99.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebd215sm48313115ad.14.2025.10.19.02.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 02:24:08 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt: bindings: Add virtualcolor class dt bindings documentation.
Date: Sun, 19 Oct 2025 22:23:24 +1300
Message-ID: <20251019092331.49531-2-professorjonny98@gmail.com>
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

Add DT bindings for the LEDs virtualcolor class framework. Add
LED-FUNCTION-VIRTUAL-STATUS ID to the FUNCTION ID list for device tree
bindings.

co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 .../leds/leds-class-virtualcolor.yaml         | 90 +++++++++++++++++++
 include/dt-bindings/leds/common.h             |  4 +
 2 files changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-virtualcolor.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-class-virtualcolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-virtualcolor.yaml
new file mode 100644
index 000000000000..8cbbbf0d746c
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-class-virtualcolor.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-class-virtualcolor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: virtualcolor LED class
+
+maintainers:
+  - Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
+
+description: |
+  Validates individual virtual LED nodes that aggregate multiple monochromatic
+  or PWM LEDs.
+
+properties:
+  $nodename:
+    pattern: "^virtual-led(@[0-9a-f])?$"
+
+  reg:
+    maxItems: 1
+    description: Virtual LED index/number
+
+  function:
+    description: |
+      LED function. It is recommended to use LED_FUNCTION_VIRTUAL_STATUS
+      for virtual LEDs to distinguish them from physical LEDs.
+      See: include/dt-bindings/leds/common.h
+
+  color:
+    description: |
+      LED color identifier from the LED_COLOR_ID_* namespace.
+      See: include/dt-bindings/leds/common.h
+
+  leds:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 15
+    description: |
+      Array of phandles to monochromatic LEDs that compose this virtual LED.
+
+  pwm-leds-red:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 15
+    description: |
+      Array of phandles to PWM-controlled red LEDs that compose this virtual
+      LED.
+
+  pwm-leds-green:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 15
+    description: |
+      Array of phandles to PWM-controlled green LEDs that compose this virtual
+      LED.
+
+  pwm-leds-blue:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 15
+    description: |
+      Array of phandles to PWM-controlled blue LEDs that compose this virtual
+      LED.
+
+  priority:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    description: |
+      Priority level for this virtual LED. Higher values take precedence
+      when multiple virtual LEDs are active simultaneously.
+
+required:
+  - reg
+
+anyOf:
+  - required:
+      - leds
+  - required:
+      - pwm-leds-red
+  - required:
+      - pwm-leds-green
+  - required:
+      - pwm-leds-blue
+
+allOf:
+  - $ref: common.yaml#
+
+additionalProperties: true
+...
diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 4f017bea0123..39c34d585a47 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -63,6 +63,10 @@
      "lp5523:{r,g,b}" (Nokia N900) */
 #define LED_FUNCTION_STATUS "status"

+/* Virtual system LEDs Used for virtual LED groups, multifunction RGB
+	 indicators or status LEDs that reflect complex system states */
+#define LED_FUNCTION_VIRTUAL_STATUS "virtual-status"
+
 #define LED_FUNCTION_MICMUTE "micmute"
 #define LED_FUNCTION_MUTE "mute"

--
2.43.0

