Return-Path: <linux-leds+bounces-5752-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 229A5BD2EA8
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 14:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E03D189DED1
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 12:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC79526CE2C;
	Mon, 13 Oct 2025 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGMqzjvY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDF426F293
	for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760357429; cv=none; b=L0Z+fdO50ScYvKk1MwXSoGTvS/7017gdfLQbZmtYDLCBwVCimSn2L8UAiFZAGypGhpMt+lyx46Z+StBp/Zmv3ATc29ZJ4UillLB1Nj8mtsPmVc06w4YeOIfiSugUDCIqvGGZCvbzVM58293vxXAS8R9/uTVE7XiqDaEZhAF2Jho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760357429; c=relaxed/simple;
	bh=DYAG6gza9R5CAESPb/D8ZsLO66e7KqstijNZcnmHd6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCAHGzWjJOwQbscBlxrc0lZKgSlKhvHu3CuszyzXB1ofoPY5cOsNmcatwuJU31U9w+EyuqJrL/QRrHDfIxBdoJQiFCqyDQZUwxWj9thx3FgJkgVjAdoDL5HE47JipOD31YqnVoyPOmwAC3+7FW3RA4grJgBsQuXfZfFj89PgmH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGMqzjvY; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-781db5068b8so3316450b3a.0
        for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 05:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760357427; x=1760962227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HWS+e8O+KlDsHa2yaiXdrc6KPCBOlNosXwk907ZwlI=;
        b=EGMqzjvYjyCouRsnDc1NnOzJ5uf8f5IZjxkwCZ/4uyv5eTSh3Facl4HgWKWYv5x/4/
         LbHZceojR9P6cOpA+xLnen2MSAxVHAgsIagl6/sv+cuKPioF5SP6b5KHy8wlXOCznwLM
         OcxH3vZxm/XXywnqAvvLoN7l9MmLtpLgc7KNuLRfRVEnOvp42oZpk1w3CY+Efplf3AIH
         n7UAxORG59aeLVIK3nHauDc+YwgamGKEdMxg/9nSvns0K50tOLCCBF5oFj7ZAb2qIA+b
         2v6ntXtu+B4PWQGzVytBY+DsBVrfWDIgKfu9KiH55rChyp6AjKK9W4crOqfjxAirgwo9
         RvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760357427; x=1760962227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HWS+e8O+KlDsHa2yaiXdrc6KPCBOlNosXwk907ZwlI=;
        b=ua/3lYNtcBPBJ9NvMms5TWVOu8lhinyLge1fbb5nmnTGMU1SU/JhzfxkD8h/hfBEUg
         Fvy7NtYFhKfmkhdoHbUKbtNb7VJt17cRRMiRf2SCqIBNIq9QahlR5trU5gHCo2C47Du3
         tkSWQ25hJ5caOc0DGhrjn9WxrR3yCmg/5HjdVbqiT/FsykjLdprp3VLKe+CvYv5l+moN
         oDRut+3F8CveWZFWGfWp5V/naLrmglpDFqwQznr3ijui7yyBx2FIPxt2ezl7dqrN2NKD
         Mikxcu1DKJRjjXgf+CAmv56b3dXYHjIWzaaMmYwgTU7Z9GYUiJbPisJPOProETKadOW2
         /moQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQGgZnu9LD4Kz9hZXLek4RT8wsw+w4vRUrnUf3LT7bYVetfYNMRnM1WbIOyBY4C4dm7qgSSUxpv/Si@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd+hCQSVziPWNXovyvy2ru3DX+a4uqxjqqus60WBrw3DLgEXPj
	UFqmyKBZ2KQJBp0tEHMFD5BbK94RW21Twt6fm3GRUq+K9IB0jmQyQI1N
X-Gm-Gg: ASbGncvfFvsywmfhWg2uM7R2OM+gWpmwjd+E8FBLIAk+y3RfApLhGoH4ro/GcNeWYTK
	G+Y8edA3l+ODkZOu2FQefkCtTPfWkkTM/R2m477dpZ3ENq/vrqJO4ASqBgDzghVcts7nTXCs9g2
	t7czjQ6tNYT+lyj/WLQ9NP0fy/NIxl1m/sLnoUzzyFommd2dule5AzSx+4EdPZObqtqShM4eAKM
	OFB47akukri+1RRtUsa1LXq+taDa1UUuly2CfkAMXUUjQ82JpcVvXKrz5zf/FgoQCRHLYmD44Iq
	qTcQ+ndUEBq2+P6eB3L5JuPDPjIC+0sA4qO5/Te6AAZn95BYLdjI0CnmqHg1qCYElN+iksxdc7E
	ur1ZlIL697TR54VPxCmrE9VIlrxNCbhG9uisbUu+sP6S3jRFiHH1f+sIBeOIP
X-Google-Smtp-Source: AGHT+IFVrAe1c+HSOfDTrJXTl++FYyGq7XL7XzrDD98EJPi9dBGxOpdHa046ZnEbYF8M6mQemgd3Pg==
X-Received: by 2002:a05:6a21:e097:b0:2d9:4afc:e1cf with SMTP id adf61e73a8af0-32da83e694fmr25851633637.47.1760357427217;
        Mon, 13 Oct 2025 05:10:27 -0700 (PDT)
Received: from MRSPARKLE.localdomain ([206.83.98.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df48a83sm9633354a12.31.2025.10.13.05.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:10:26 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: leds: Add YAML bindings for Virtual Color LED Group driver
Date: Tue, 14 Oct 2025 01:09:45 +1300
Message-ID: <20251013120955.227572-2-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013120955.227572-1-professorjonny98@gmail.com>
References: <20251013120955.227572-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

Document Virtual Color device tree bindings.

Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 .../leds/leds-group-virtualcolor.yaml         | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
new file mode 100644
index 000000000000..bafdd8fb9557
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common properties for virtualcolor led class
+
+maintainers:
+  - Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
+
+description: |
+  Bindings to show how to achieve logically grouped virtual LEDs.
+  The nodes and properties defined in this document are unique to the
+  virtualcolor LED class.
+  Common LED nodes and properties are inherited from the common.yaml
+  within this documentation directory
+
+allOf:
+  - $ref: common.yaml#
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
+required:
+  - compatible
+
+patternProperties:
+  '^led@[0-9a-f]$':
+    type: object
+    $ref: common.yaml#
+    properties:
+      reg:
+        maxItems: 1
+        description: Virtual LED number
+
+      leds:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description: List of phandles to the monochromatic LEDs to group
+
+      function:
+        description: |
+          For virtualcolor LEDs this property should be defined as
+          LED_FUNCTION_VIRTUAL_STATUS as outlined in:
+          include/dt-bindings/leds/common.h.
+
+      priority:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Priority level for LED activation
+          (higher value means higher priority)
+
+      blink-delay-on:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Time in milliseconds the LED is on during blink
+
+      blink-delay-off:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Time in milliseconds the LED is off during blink
+        note: Setting just one of the blink delays to a valid value while
+          setting the other to null will cause the LED to operate with a one-shot
+          on or off delay instead of a repeat cycle.
+
+    required:
+      - reg
+      - monochromatic-leds
+
+additionalProperties: false
+
+examples:
+  - |
+    led-controller {
+        compatible = "leds-group-virtualcolor";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led@0 {
+            reg = <0>;
+            function = LED_FUNCTION_VIRTUAL_STATUS;
+            color = <LED_COLOR_ID_RED>;
+            leds = <&led_red>;
+            priority = <2>;
+            blink-delay-on = <500>;
+            blink-delay-off = <500>;
+        };
+
+        led@1 {
+            reg = <1>;
+            function = LED_FUNCTION_VIRTUAL_STATUS;
+            color = <LED_COLOR_ID_YELLOW>;
+            leds = <&led_green>, <&led_red>;
+            priority = <1>;
+        };
+    };
--
2.43.0

