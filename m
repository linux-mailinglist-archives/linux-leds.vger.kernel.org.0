Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31809405ED1
	for <lists+linux-leds@lfdr.de>; Thu,  9 Sep 2021 23:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347476AbhIIVch (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 17:32:37 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:45019 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347151AbhIIVcd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 17:32:33 -0400
Received: by mail-oi1-f174.google.com with SMTP id c79so4429229oib.11;
        Thu, 09 Sep 2021 14:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/YrpsPCLlUobR5Vg4TFvLJZn3V31ghZUaEW+qKvudbE=;
        b=gKHefDGBECq0oxTBlr+7a+pMvrvh7Bcnv/t36e0tZEE547LLNDZc8hQuK+GPqs/Kj9
         LrIxzt50DhjiowgIxBz2lvIvxvL7I8q1S1hGf3bZJIps4vTUPa5FMFGX+j6LMbBXxrIr
         kP85I61ypl0i9vsvU+9uKkaIbnS5x7uAY8eYmYoWFnB3VyC0wdVi7kdpFhnI+x5vRU7c
         GBeFDZG6JBdAjffDfIlG8je4XeA04p0BTNKFTMzIDO6L11aw3Nd/rmpoZFLfArS5JJF5
         1rLhy2WEbjF6YxbustfUA+kSrglVHGw0SUiw7o9N9pYzVhjVEIU6YHTCc1ucZfX1kwej
         liKQ==
X-Gm-Message-State: AOAM531K9LmeFCMpMAmcgw0LIOEBHC6zrGBzeoIWvJcF7UMFXFBO5GRe
        C/2taI284Gkh5rSKoQiW7w==
X-Google-Smtp-Source: ABdhPJxs4WnPvBISl3yv6RGbeu0AN7FaWzvQ4PcGv0nbW9GSXm9saN/F9l+4QQv47HxR7/cWBm2LSg==
X-Received: by 2002:aca:d68c:: with SMTP id n134mr1621875oig.34.1631223083178;
        Thu, 09 Sep 2021 14:31:23 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm694929oie.50.2021.09.09.14.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 14:31:22 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH 2/8] dt-bindings: leds: register-bit-led: Use 'reg' instead of 'offset'
Date:   Thu,  9 Sep 2021 16:31:12 -0500
Message-Id: <20210909213118.1087083-3-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909213118.1087083-1-robh@kernel.org>
References: <20210909213118.1087083-1-robh@kernel.org>
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
index 4a5bb0aa5f27..404ac75e1dc4 100644
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
 
@@ -51,25 +62,31 @@ examples:
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
             linux,default-trigger = "mmc0";
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

