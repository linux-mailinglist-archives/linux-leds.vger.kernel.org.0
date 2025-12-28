Return-Path: <linux-leds+bounces-6470-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E52ACE558B
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 19:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C63C83004C96
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 18:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8D622D4C8;
	Sun, 28 Dec 2025 18:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/1iyM1y"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A88D237180
	for <linux-leds@vger.kernel.org>; Sun, 28 Dec 2025 18:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766946214; cv=none; b=VBlRqZRhJuWK2BK+NIqubZcgu/YPkH/9M308EZdTUP+JYUUxf0JfChL+Bqoak/zVqMfb6cMCy7p/Fh8MZzSrPIE79pGzLZ9ddrZkruSLFPfrK+H2tCLDSyTxl3ppjADeHXZkbGODS0K8/bolvRLCpK0jUUddbOLnZuKllJQ6qX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766946214; c=relaxed/simple;
	bh=qnxj1dC/cCFhtpEx9uTCMc00ugysyCX2y8hqP+/0TCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TiftieBm5leSFYvov4KnF5CWFXPBLECV/Pkb2qHMhdjiutcAqR0HDYXzPswy2mbbfp8Aklb4tnYXlq940W9bRsTrIl20eeapTCIu0M1FlWmLoLaM+tiXHpmq1VfTwqFLrdQZB8fZUKpuQnoRKzKgsN9JXYyPFpbrkobxUEFCiqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/1iyM1y; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7f89d0b37f0so4206193b3a.0
        for <linux-leds@vger.kernel.org>; Sun, 28 Dec 2025 10:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766946212; x=1767551012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8J9+R8OyR5jrsym1MdOdINO4Sn7+ZiEPmIquYIfwATk=;
        b=L/1iyM1y81rNzdiAaEPs7Mg4WIWE+zpcuSDOrRmUaFXnY94o1l3d0puLyIekqi7oyW
         +I+ClxYWRUJVPCaUJ5gn/Alle6j4uWx6yUN5TO8QxzSXXtlX8LJcQwVALkb+/zT61KN2
         pOTzYvU0o2Pvbhm/ZfImt9ld79k7O2qax4AYOfSMCoogDlsW5rmVGpi6XDYPMxkQNRgI
         mzznq3p5oXrLIcWQeNQQSNw0QYpwtttK+lyHiaMm+lC4iu3zRbnURHFcV7te5aiAKOe3
         RwR0NDqR1mP+nLNfcOjfcsvDf9jukrLFWUioJZfLl50WZVbCXOmLJ1eIcAyDeKkcwXYl
         X18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766946212; x=1767551012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8J9+R8OyR5jrsym1MdOdINO4Sn7+ZiEPmIquYIfwATk=;
        b=oY1mkPv0T++EFkGe4a/lC0teGYfmvd2+lsLShCYem06u1ahEF48CZl1F0N9Djh8Ptd
         a/uZaRKP0NkZqgkobODgLv/yULxHJmdXVq7fDqyPn3FvsOOCDzo7X640ZoXhiKWTxeGv
         9dt4gJBktN8nX+ifjJrnIJYkbuzSRQUlsr7zyaU0+jmOszaWTjR4yC2r1xN6gF11cW7Z
         /GLh78tjDpFRboU2Qeo5gtK1jKH1G0czpWX/4voVrJ4E+qPSDZz2dl60SxWe2jqtbgd9
         xzEokBvDXrGaouexXQ2wkahcG+mkJR4AOU7W5nkXBoTscizP9VG4KXGCex8rO8Rqf2f8
         N+bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSeVs5pEdJvZbZflxpC3SmQZXUItCO1X1TfusUk4ovJ0mNIpu3i/anl3SkyBLjRidatMB9gy8Je3/0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/CxrTHpKt5/VUAxuAPgS54Jnl947agHhQNG8sDknAu9hObiYy
	6s38blY17X5RRd7JxRZg/IseuKZssDBfWqNVMjv/l5zuDbfOk/TMHPyU
X-Gm-Gg: AY/fxX7XumHB06AVjiAK9gXokBIxbCwSui3o6EJlJ8Esq3vCF/NNdvnuBZVZgw1XRRJ
	zjvqBtfPrjgqx04J/1vJiUo9e8g1YeYBFkEh6mpUqouZRDRTtDN0kUE1CfCFb3xaAaZLLamga5a
	B9SnXiMkdHCir++hWlHjvEGrc4+9jb39f/veO76YPdddpiS+f0upgMpZdyGkhD+7fEWUO4dYMHy
	40PGKDFHj7zzx9CYzKG+jku6MFbNd995C9ERADkq1TIMBMKNWB8vZIY4WDP9OuDkkDdeQU/e1T/
	mSk1wlWVCmoIdwLUixcUi6fx5qV5nbinUzWUVaY3Ur37bbJarrZpWc8d7XZN34msn5IeBcv7jj0
	DE4iMnrkzN7scax+tg1ny8GRFRIzpuMGYy5an/UGF39W+Tw7ZMhS8O136muYJZR2ZoJcMqkCxDk
	NXRRCjCMO+gd8vzIeZnU1Hz/2yF6lD0UbckC4N8lsqyuI=
X-Google-Smtp-Source: AGHT+IFxu1X07rvxROoKTd47BW6KRbd9zLwIEqGQ6nrGR/rCPRoC8FEYxber7zuWsEXxprD0hpJ0EA==
X-Received: by 2002:a05:6a21:328c:b0:342:fa5:8b20 with SMTP id adf61e73a8af0-3769f9332a1mr27553338637.30.1766946212430;
        Sun, 28 Dec 2025 10:23:32 -0800 (PST)
Received: from MRSPARKLE.localdomain ([150.228.155.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f3d7sm27399695b3a.51.2025.12.28.10.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 10:23:32 -0800 (PST)
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
Subject: [RFC PATCH 2/2] dt-bindings: leds: common: Add led-instance property
Date: Mon, 29 Dec 2025 07:22:45 +1300
Message-ID: <20251228182252.1550173-3-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251228182252.1550173-1-professorjonny98@gmail.com>
References: <20251228182252.1550173-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

Document the optional "led-instance" property for providing deterministic
LED naming when multiple LEDs share the same function and color.

Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 .../devicetree/bindings/leds/common.yaml      | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index f4e44b33f56d..0e9611662850 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -51,6 +51,33 @@ properties:
       needed, differing only with an ordinal number.
     $ref: /schemas/types.yaml#/definitions/uint32

+  led-instance:
+    description:
+      Optional instance identifier for deterministic LED naming when multiple
+      LEDs share the same function and color. Without this property, the LED
+      core appends numerical suffixes (_1, _2) based on registration order,
+      which is non-deterministic and breaks userspace automation.
+
+      The instance identifier becomes the third component in the LED name
+      using the format "function:color:instance" (or "color:function-N:instance"
+      when function-enumerator is present).
+
+      This property is only used with the modern function and color based naming
+      scheme. It is ignored when the deprecated "label" property is present, as
+      "label" already provides full control over the LED name.
+
+      Common use cases include multi-port network devices ("port0", "port1"),
+      multi-domain power indicators ("battery", "ac", "usb"), and system state
+      LEDs ("boot", "upgrade", "panic").
+
+      The identifier should be semantic (describes purpose), deterministic
+      (fixed in hardware description), and concise (under 32 characters).
+      Only alphanumeric characters, dashes, and underscores are allowed, and
+      the identifier must start with an alphanumeric character.
+    $ref: /schemas/types.yaml#/definitions/string
+    maxLength: 31
+    pattern: "^[a-zA-Z0-9][a-zA-Z0-9_-]*$"
+
   label:
     description:
       The label for this LED. If omitted, the label is taken from the node name
@@ -320,4 +347,70 @@ examples:
         };
     };

+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    /* Example: 48-port network switch with deterministic port LEDs */
+    ethernet-leds {
+        compatible = "gpio-leds";
+
+        led-port0 {
+            function = LED_FUNCTION_LAN;
+            color = <LED_COLOR_ID_GREEN>;
+            led-instance = "port0";
+            gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
+            /* Result: /sys/class/leds/green:lan:port0 */
+        };
+
+        led-port1 {
+            function = LED_FUNCTION_LAN;
+            color = <LED_COLOR_ID_GREEN>;
+            led-instance = "port1";
+            gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+            /* Result: /sys/class/leds/green:lan:port1 */
+        };
+
+        led-port47 {
+            function = LED_FUNCTION_LAN;
+            color = <LED_COLOR_ID_GREEN>;
+            led-instance = "port47";
+            gpios = <&gpio0 47 GPIO_ACTIVE_HIGH>;
+            /* Result: /sys/class/leds/green:lan:port47 */
+        };
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    /* Example: Multiple power domain LEDs */
+    power-leds {
+        compatible = "gpio-leds";
+
+        led-ac-power {
+            function = LED_FUNCTION_POWER;
+            color = <LED_COLOR_ID_GREEN>;
+            led-instance = "ac";
+            gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+            /* Result: /sys/class/leds/green:power:ac */
+        };
+
+        led-battery-power {
+            function = LED_FUNCTION_POWER;
+            color = <LED_COLOR_ID_GREEN>;
+            led-instance = "battery";
+            gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+            /* Result: /sys/class/leds/green:power:battery */
+        };
+
+        led-usbc-power {
+            function = LED_FUNCTION_POWER;
+            color = <LED_COLOR_ID_GREEN>;
+            led-instance = "usbc";
+            gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+            /* Result: /sys/class/leds/green:power:usbc */
+        };
+    };
+
 ...
--
2.43.0

