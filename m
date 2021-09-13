Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1B0409CFF
	for <lists+linux-leds@lfdr.de>; Mon, 13 Sep 2021 21:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344113AbhIMT3j (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Sep 2021 15:29:39 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:38483 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242848AbhIMT3i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Sep 2021 15:29:38 -0400
Received: by mail-ot1-f46.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso14901753ots.5;
        Mon, 13 Sep 2021 12:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HsJ9yRBqsMmIwK48AF1ryBbOjSrUMVMLDh6+UU2RkmE=;
        b=UQNIxaRzQZvkkt0YU9FKAfn1a9uGqNSxLS1FgqWYc1Bo/LKTUWOBQUozZ34lCrykgv
         6FTpyhlgfGVtEzgrFPtKulEUd/a82p6h5DOE7EufFzArkXS4YV/ipUHGk4wGvTntjo3U
         SoeKc+OeGoP+KrTHaojyp+Kx32EQvMA869l4fCnsyncRxDhN0ZoFsDvJ3rMTqAx3sWm0
         usC1y8fnZIzhPeQKpu1v2lGSSEy2+lUkjBaOMSXvQXiMZD1IeKghuWuNsyaLLt4qBkAe
         sHdgEzpQG2yGeN78y0qerYWNxUrdMjTPhhw4TQGJ2rN7QFMNOdNPDuPwZGRL9Kdi8Mxn
         mdAA==
X-Gm-Message-State: AOAM530voTNES26c72KLtf0W0XAzr7ElXmb4uzTECOlQiitntisd3jNp
        KlGBpGz4kd61s8wff05Zjw==
X-Google-Smtp-Source: ABdhPJz7zU8VVcPu6j2PnVgAT1gMjODXQvA4mY65E4UmaEnvk9iopp324LfGSG341JgI7l0/WtBXhQ==
X-Received: by 2002:a05:6830:4003:: with SMTP id h3mr11364149ots.56.1631561301733;
        Mon, 13 Sep 2021 12:28:21 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm1907838oie.50.2021.09.13.12.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 12:28:21 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 2/8] dt-bindings: leds: register-bit-led: Use 'reg' instead of 'offset'
Date:   Mon, 13 Sep 2021 14:28:10 -0500
Message-Id: <20210913192816.1225025-3-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913192816.1225025-1-robh@kernel.org>
References: <20210913192816.1225025-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

'reg' is the standard property for defining register banks/addresses. Add
it to use for the register address and deprecate 'offset'. This also
allows for using standard node names with unit-addresses. However, since
it is quite possible to have multiple nodes at the same register
address, allow for the unit-address to optionally have the bit
offset. The unit-address format is '@<reg address>[,<bit offset>]'. This
matches the format recently added for nvmem binding which has the same
issue.

Cc: Pavel Machek <pavel@ucw.cz>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/leds/register-bit-led.yaml       | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/register-bit-led.yaml b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
index 77ba0b824c15..79b8fc0f9d23 100644
--- a/Documentation/devicetree/bindings/leds/register-bit-led.yaml
+++ b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
@@ -20,9 +20,19 @@ allOf:
   - $ref: /schemas/leds/common.yaml#
 
 properties:
+  $nodename:
+    description:
+      The unit-address is in the form of @<reg addr>,<bit offset>
+    pattern: '^led@[0-9a-f]+,[0-9a-f]{1,2}$'
+
   compatible:
     const: register-bit-led
 
+  reg:
+    description:
+      The register address and size
+    maxItems: 1
+
   mask:
     description:
       bit mask for the bit controlling this LED in the register
@@ -37,11 +47,12 @@ properties:
     description:
       register offset to the register controlling this LED
     $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
 
 required:
   - compatible
   - mask
-  - offset
+  - reg
 
 unevaluatedProperties: false
 
@@ -51,24 +62,30 @@ examples:
     syscon@10000000 {
         compatible = "arm,realview-pb1176-syscon", "syscon";
         reg = <0x10000000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x10000000 0x1000>;
 
-        led@8.0 {
+        led@8,0 {
             compatible = "register-bit-led";
+            reg = <0x08 0x04>;
             offset = <0x08>;
             mask = <0x01>;
             label = "versatile:0";
             linux,default-trigger = "heartbeat";
             default-state = "on";
         };
-        led@8.1 {
+        led@8,1 {
             compatible = "register-bit-led";
+            reg = <0x08 0x04>;
             offset = <0x08>;
             mask = <0x02>;
             label = "versatile:1";
             default-state = "off";
         };
-        led@8.2 {
+        led@8,2 {
             compatible = "register-bit-led";
+            reg = <0x08 0x04>;
             offset = <0x08>;
             mask = <0x04>;
             label = "versatile:2";
-- 
2.30.2

