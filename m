Return-Path: <linux-leds+bounces-4926-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E000EAECCC2
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 15:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F43D174D93
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 13:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BFC229B1C;
	Sun, 29 Jun 2025 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q55mSuaa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF71224AE8;
	Sun, 29 Jun 2025 13:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202023; cv=none; b=gnboqkIsD+u9wcfxycv+oWvXYzuNzkzBjIC66pM6EOgkGqEGoaobjRBidFVeao5AlLWRtvfKf+3ubxhwJciSO2Lvpn9oix28AtEYxVXuJt9yOm7wn0F+bsyfiyGrMlSUe20Bd34iKpewvCFkeHih8Hpyughd/qgzwYQ4lVbUWyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202023; c=relaxed/simple;
	bh=KJmvjQvZV971OvrJvad69FUPesLIbn0qgoJQFSw74RM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ElEiDciBfdhgqtTvT91wcqUmG9eYFiALMZ41aBRBrrsy+boFDclL738WFV5sejAGM0Oa+oXeT7SbSr7UmpxlgB89xwWyiUW6FpkeWyaRiH/g+tVJgsfdwoUTq6UtEkm2pOTCN+MQL9ONQGAct5LNKSj3Z0LRQto60o+4tc1/uyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q55mSuaa; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a58f79d6e9so51250851cf.2;
        Sun, 29 Jun 2025 06:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202020; x=1751806820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1Izup0JaWpdi0e4PI76ei57r2qvjo9BOKzw0djY64A=;
        b=Q55mSuaavTX3BPA7s3L0+U3uFapLrvqU6WrKkUHELN/qeKCRkxOO5f8aVXhzfE2wAz
         ZfR+eoGbz6pMCtNDmiMG3tjsnTMtEff8d15Dys0Ze15bwAsJpetp51rflYc95pUwTQrU
         ++QNKABCIX2i/jk90Ht1LXMhNknLVLBJIwEMiE8Rm+vZmmcEp9RxAvUys/8Vr8sL8mRu
         ICsXuw1WRKuswe9YeMkfF1ZL5+mrR1tHzFBDCjhcCvqedYhuukyXy0rEdSk/xocY10/z
         bRdnIYUF/p4XamdpxalJX7a8cmYe60ifggXMcb8BXdiofTszxvKD10VEFkZN/8L+r48Q
         2XGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202020; x=1751806820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1Izup0JaWpdi0e4PI76ei57r2qvjo9BOKzw0djY64A=;
        b=LczFRnFHFoWEq3jwBn066FVd4j/4Ta52TnsFpAeODhJPDOlPqh0hqmnAJHIMMBkKgs
         JjhF2uMiZc0HeVztlj+n2wZFMHepzAx4avJnRQCQgDiuSWops+GrtRHJ41h9LtVRaGzC
         wTEnV2emS7tNet4gvcdZ66Lqw39OuFrTcqFzrW/j0r5bokeiU/8zxgjCxwryXFdvtY3Y
         HkQRDs89YIEUWO8MY3VLRVEUph7Ygnp9zGRnNLpkBijy0+KobfsSlA2uZox3rJeF+dE9
         M6mp6Dk+9X4+UGV0Gmmo7ESrRStgIyLs3mNUq6TBxyCqntcVzqwO8VQlMNj0XTLiLA3D
         zABA==
X-Forwarded-Encrypted: i=1; AJvYcCVCaOin0M1khDiPys3ufvjJyQxsFI73WGHkGW2e5wIqKYAggVrHtNy3CubwtyiL26ARPXV7dw9lG9+XyglF@vger.kernel.org, AJvYcCVddVlqOpathKf77tIYyGr61LBAyNZtHwkBxvI3mvoRpc+0hNv8/wzduFOGptoUbPAB3yLkl8NBCBfw@vger.kernel.org, AJvYcCXmjJ88IPDcKo3iyxfRZFiOUZnkp+Dd9HjzOvgpBiTywnxa3s+58qCJzQEgCWBPvxMasyUK+GuP2litZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YznDmQh3Yk/Gh8mwP6XsNvABlCCmTbdK0iS8EkHX/V+mfQyuXYA
	qt1JB/YsS6SCdCFOKjG/rW2MLNchLUj+JKI9kHF1HwfCTILwAe2vPsCa
X-Gm-Gg: ASbGnct8bo+z9cTPj1V8Jy4NCXz4GXllFL8hXYAdRdiZGOrWXTBDUp9ecZtSXoZSvVf
	btOVBiLjsLOJfte0yLMhwFvK1ZpFA9OOFWG/zppwOoBH8AVgibkb4Z+Q3Y+IL2cQZKY2eNfqX0N
	6piUrsIKn9jv59+DUQ5eKwdFR3++1kY2xAZMgLshNg6L50Wj6+9UVsHqA2ZjnrEdn/LrMJvI2vG
	kpFoBsz1fY2dVx8StAQ6do/KPKnmAzm2pmbBFwBxlWWSmV9nGlQeq51p79b1R1Ed0JCJ0FeE4bs
	VqHBiQGMwPJ97w7X72CYNeNuBmBD92716ajH7SDcNDsLG/fBfJ437+qD6FQggumanQ0hueI6kby
	DWrVb5WNvck63iXrne5YU7ayQbn62vN/I
X-Google-Smtp-Source: AGHT+IHGjlvCXcLJHpu+jzfqPwMarWBqMqpmX9TyRepQREZm0vJoiVHNv50WAz4SfpEMgfqdsWwuYw==
X-Received: by 2002:a05:622a:4012:b0:4a7:a8a:eed with SMTP id d75a77b69052e-4a7fcae72c0mr182080261cf.39.1751202020174;
        Sun, 29 Jun 2025 06:00:20 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d905sm42442451cf.64.2025.06.29.06.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:00:19 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Sabatino <paolo.sabatino@gmail.com>
Subject: [PATCH v2 6/8] dt-bindings: auxdisplay: add Titan Micro Electronics TM16XX
Date: Sun, 29 Jun 2025 08:59:56 -0400
Message-ID: <20250629130002.49842-8-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629130002.49842-1-jefflessard3@gmail.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add documentation for Titanmec TM16XX and compatible LED display controllers.

This patch is inspired by previous work from Andreas Färber and Heiner Kallweit.

Co-developed-by: Andreas Färber <afaerber@suse.de>
Co-developed-by: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 .../bindings/auxdisplay/titanmec,tm16xx.yaml  | 210 ++++++++++++++++++
 1 file changed, 210 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml

diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
new file mode 100644
index 0000000000..65c43e3ba4
--- /dev/null
+++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
@@ -0,0 +1,210 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/auxdisplay/titanmec,tm16xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Auxiliary displays based on TM16xx and compatible LED controllers
+
+maintainers:
+  - Jean-François Lessard <jefflessard3@gmail.com>
+
+description: |
+  TM16xx controllers manage a matrix of LEDs organized in grids (rows) and segments (columns).
+  Each grid or segment can be wired to drive either a digit or individual icons, depending on the
+  board design.
+
+  Typical display example:
+
+           ---    ---       ---    ---
+    WIFI  |   |  |   |  -  |   |  |   |  USB  PLAY
+           ---    ---       ---    ---
+    LAN   |   |  |   |  -  |   |  |   |  BT   PAUSE
+           ---    ---       ---    ---
+
+  The controller itself is agnostic of the display layout. The specific arrangement
+  (which grids and segments drive which digits or icons) is determined by the board-level
+  wiring. Therefore, these bindings describe hardware configuration at the PCB level
+  to enable support of multiple display implementations using these LED controllers.
+
+properties:
+  compatible:
+    enum:
+      - titanmec,tm1618
+      - titanmec,tm1620
+      - titanmec,tm1628
+      - titanmec,tm1650
+      - fdhisi,fd620
+      - fdhisi,fd628
+      - fdhisi,fd650
+      - fdhisi,fd6551
+      - fdhisi,fd655
+      - icore,aip650
+      - icore,aip1618
+      - icore,aip1628
+      - princeton,pt6964
+      - winrise,hbs658
+
+  reg:
+    maxItems: 1
+
+  titanmec,digits:
+    description: |
+      Array of grid (row) indexes corresponding to specific wiring of digits in the display matrix.
+      Defines which grid lines are connected to digit elements.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    items:
+      minimum: 0
+      maximum: 7
+    minItems: 1
+    maxItems: 8
+
+  titanmec,segment-mapping:
+    description: |
+      Array of segment (column) indexes specifying the hardware layout mapping used for digit display.
+      Each entry gives the segment index corresponding to a standard 7-segment element (a-g).
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    items:
+      minimum: 0
+      maximum: 7
+    minItems: 7
+    maxItems: 7
+
+  titanmec,transposed:
+    description: |
+      Optional flag indicating if grids and segments are swapped compared to standard matrix orientation.
+      This accommodates devices where segments are wired to rows and grids to columns.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-7],[0-7]$":
+    $ref: /schemas/leds/common.yaml#
+    properties:
+      reg:
+        description: Grid (row) and segment (column) index in the matrix of this individual LED icon
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - titanmec,digits
+  - titanmec,segment-mapping
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      display-controller@24 {
+        reg = <0x24>;
+        compatible = "fdhisi,fd655";
+        titanmec,digits = [01 02 03 04];
+        titanmec,segment-mapping = [03 04 05 00 01 02 06];
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        led@0,0 {
+          reg = <0 0>;
+          function = LED_FUNCTION_ALARM;
+        };
+
+        led@0,1 {
+          reg = <0 1>;
+          function = LED_FUNCTION_USB;
+        };
+
+        led@0,2 {
+          reg = <0 2>;
+          function = "play";
+        };
+
+        led@0,3 {
+          reg = <0 3>;
+          function = "pause";
+        };
+
+        led@0,4 {
+          reg = <0 4>;
+          function = "colon";
+        };
+
+        led@0,5 {
+          reg = <0 5>;
+          function = LED_FUNCTION_LAN;
+        };
+
+        led@0,6 {
+          reg = <0 6>;
+          function = LED_FUNCTION_WLAN;
+        };
+      };
+    };
+
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      display-controller@0 {
+        reg = <0x0>;
+        compatible = "fdhisi,fd628";
+        titanmec,transposed;
+        titanmec,digits = [00 01 02 03];
+        titanmec,segment-mapping = [00 01 02 03 04 05 06];
+        spi-3wire;
+        spi-lsb-first;
+        spi-rx-delay-us = <1>;
+        spi-max-frequency = <500000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        led@4,0 {
+          reg = <4 0>;
+          function = "apps";
+        };
+
+        led@4,1 {
+          reg = <4 1>;
+          function = "setup";
+        };
+
+        led@4,2 {
+          reg = <4 2>;
+          function = LED_FUNCTION_USB;
+        };
+
+        led@4,3 {
+          reg = <4 3>;
+          function = LED_FUNCTION_SD;
+        };
+
+        led@4,4 {
+          reg = <4 4>;
+          function = "colon";
+        };
+
+        led@4,5 {
+          reg = <4 5>;
+          function = "hdmi";
+        };
+
+        led@4,6 {
+          reg = <4 6>;
+          function = "video";
+        };
+      };
+    };
-- 
2.43.0


