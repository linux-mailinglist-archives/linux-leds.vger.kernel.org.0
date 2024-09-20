Return-Path: <linux-leds+bounces-2773-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2647C97D49A
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 13:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF3022832C5
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 11:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAEE13F431;
	Fri, 20 Sep 2024 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ryeqEOxB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AA338DE5
	for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726830920; cv=none; b=QqCD6HThNDMqoAS9Bur7qiECtacYSMq7CONsUXjTnKq2uzG6iCxooREiuGb3gSZcMasm88pRNNAnfPYo2dh/K/RL1K00nT+eE9pW5pR5UZAKsjP/XdBMgC/Ju4QSFtOJX6ID1+1k9oERv0R9MyowYtfMh0skTxPHxy6KRGCY2dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726830920; c=relaxed/simple;
	bh=3EzdKFwNjJiOtkQLdUrsZHq1Dar03EPpfASw0h0NtLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M5phsHOURl5G+rzQWSPxi/2/U8uUGK/kS5iVnUZsPZHjJUlKxH1Ib6rZcCpn4HG7cztSiBrkmHOrfTeqw/AXQRFNVjyMGS35aVOOGZxWFTGJtgjiFgVe2j8d3iCwMvqjwouoHzqHK0+cJTM1t0my+xoSTyZ4b4YkhoAIrmHTOvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ryeqEOxB; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5356bb5522bso2381400e87.1
        for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726830917; x=1727435717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqkRbX7cvnqn3NxpF9ZaXzLw5MpKO313tJC374Y70as=;
        b=ryeqEOxB4ZwklWD2iwx6CFtT+ly11luekzHNykYIheMDx8BSWxDkJbgqhXvHzTTIUl
         Ql5uUE8ClhdrAq4PfR7+D3x5XBZM8qINVNfR2J7OTc8CIB14dYFdfc03kHWwa56Y8cxo
         lH8KE8F4/OOmEjZOdcPqST78Ii40mtrE/5CF+wInXzRlMpvG0aeWG4GxE6f4CbTc6PL1
         I46QJy9SwtA3MAa2r2cgfhtpC/IKuzZO3TGgJZZrAuKU2YsBFEzOgm4ieUGAy1mEZn/C
         fUBVPQsMh6N1f757vEfSBQe+j3FKr4Z1WH9S4RoyzrQvGLnpq2qhx8nVrU27E3Pko45W
         vXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726830917; x=1727435717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqkRbX7cvnqn3NxpF9ZaXzLw5MpKO313tJC374Y70as=;
        b=BSqhNwJQkqmJNXKxB1iUjXMSTaMvFxR6TUcLhoD+GafXqUtt6Z9iDMhu5uShVj8hbb
         s4WZablQryB8jU4jgN7PMVPQqK2QW2Bt36GKCAZG4/PKMVjYAkqCEEXflW4AXm70jvoK
         UIt3kFLmuZV4Q+kEwk/a17CkKTaCRXso/Rtv0w8xt4q4yEStW1dFFz3pBeR5CTYlbkzg
         il9GRup/R4pyOukf1gYOil1s9TjLKyibHwYElC3230Ws36Gw/dzxaNf24h3Ya17l+fb6
         nrpGQWd6pzRaLbpcpzlPvswhTkhLYJQ6+63joLRVeS9RHM0ZFakmIp8nrSqvFdKb6jow
         PJxw==
X-Gm-Message-State: AOJu0YxFu1noHBKDpFsbST0Pple/lyTjOUhnTOXrXqBvReYthKIUuVQh
	pq4pLUcC5NGw7E/dlLFbJG6oV00Wx61mmgE5VTDfDKOxZlmw2frxWaATPZtb7QahOYjXDMMptmK
	x
X-Google-Smtp-Source: AGHT+IEeYpo8PQHRLHcz+C5f+4ycbwcLk1+m5tXAcsiG5bPi6YAeNtkNq5R30PtO1zoYrVGQDM/Dvw==
X-Received: by 2002:a05:6512:1191:b0:534:3cdc:dbfe with SMTP id 2adb3069b0e04-536ac2f509emr1546809e87.28.1726830916661;
        Fri, 20 Sep 2024 04:15:16 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f452csm838261266b.89.2024.09.20.04.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 04:15:16 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Sep 2024 13:15:12 +0200
Subject: [PATCH 1/2] dt-bindings: leds: bcmbca: Add bindings for BRCMBCA
 LEDs
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240920-bcmbca-leds-v1-1-5f70e692c6ff@linaro.org>
References: <20240920-bcmbca-leds-v1-0-5f70e692c6ff@linaro.org>
In-Reply-To: <20240920-bcmbca-leds-v1-0-5f70e692c6ff@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

The Broadcom BCA (Broadband Access) SoCs contain a unique
LED block. Add bindings for it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/leds/brcm,bcmbca-leds.yaml | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/brcm,bcmbca-leds.yaml b/Documentation/devicetree/bindings/leds/brcm,bcmbca-leds.yaml
new file mode 100644
index 000000000000..7fe2222c0c58
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/brcm,bcmbca-leds.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/brcm,bcmbca-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCMBCA LEDs
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  The Broadcom BCA (Broadband Access) SoCs have a LED control
+  block that can support either parallel (directly connected)
+  LEDs or serial (connected to 1-4 shift registers) LEDs.
+  The LEDs can optionally be hardware-triggered by ethernet port
+  traffic.
+
+properties:
+  compatible:
+    const: brcm,bcmbca-leds
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
+  brcm,serial-shifters:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      This describes the number of 8-bit serial shifters
+      connected to the LED controller block. If this property
+      is definied, it is implicit that the driver is using
+      serial LED control, if it is missing, parallel LED
+      control is assumed.
+
+patternProperties:
+  "^led@[0-9a-f]+$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
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
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        led-controller@800 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "brcm,bcmbca-leds";
+            reg = <0x800 0xc8>;
+
+            led@0 {
+                reg = <0>;
+                active-low;
+                function = "ext";
+                color = <LED_COLOR_ID_GREEN>;
+            };
+
+            led@1 {
+                reg = <1>;
+                active-low;
+                function = "ext";
+                color = <LED_COLOR_ID_AMBER>;
+            };
+        };
+    };

-- 
2.46.0


