Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 945F222F93
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2019 10:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731089AbfETI7C (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 May 2019 04:59:02 -0400
Received: from onstation.org ([52.200.56.107]:50840 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730385AbfETI7C (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 20 May 2019 04:59:02 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 622303E8D7;
        Mon, 20 May 2019 08:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1558342741;
        bh=Xgy3+Rs3yBvZB0BUXAIyl2U75vWOzK4nucJwFwG9y2o=;
        h=From:To:Cc:Subject:Date:From;
        b=FUo5HUbTH+MqwO7mv9H2UE6JE1Sw2F8UVEDBoN+IxsVWDh5m9P5Ab0zxNHG9foqtj
         olCdm1bIrFG8JpiNW0bUFdGMKcEHtgLUvdPv/dg0f5OHVNQ2cmNIeI6Rtssn/XNhZP
         dY0Z915b7AkymZkdCxWHtrd6AX+cLnqC/KZZasJA=
From:   Brian Masney <masneyb@onstation.org>
To:     robh+dt@kernel.org, lee.jones@linaro.org
Cc:     daniel.thompson@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dmurphy@ti.com, jonathan@marek.ca
Subject: [PATCH] dt-bindings: backlight: lm3630a: correct schema validation
Date:   Mon, 20 May 2019 04:58:46 -0400
Message-Id: <20190520085846.22320-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The '#address-cells' and '#size-cells' properties were not defined in
the lm3630a bindings and would cause the following error when
attempting to validate the examples against the schema:

Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dt.yaml:
'#address-cells', '#size-cells' do not match any of the regexes:
'^led@[01]$', 'pinctrl-[0-9]+'

Correct this by adding those two properties.

While we're here, move the ti,linear-mapping-mode property to the
led@[01] child nodes to correct the following validation error:

Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dt.yaml:
led@0: 'ti,linear-mapping-mode' does not match any of the regexes:
'pinctrl-[0-9]+'

Fixes: 32fcb75c66a0 ("dt-bindings: backlight: Add lm3630a bindings")
Signed-off-by: Brian Masney <masneyb@onstation.org>
Reported-by: Rob Herring <robh+dt@kernel.org>
---
 .../leds/backlight/lm3630a-backlight.yaml     | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
index 4d61fe0a98a4..f0855e248ae5 100644
--- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
@@ -23,16 +23,17 @@ properties:
   reg:
     maxItems: 1
 
-  ti,linear-mapping-mode:
-    description: |
-      Enable linear mapping mode. If disabled, then it will use exponential
-      mapping mode in which the ramp up/down appears to have a more uniform
-      transition to the human eye.
-    type: boolean
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
 
 required:
   - compatible
   - reg
+  - '#address-cells'
+  - '#size-cells'
 
 patternProperties:
   "^led@[01]$":
@@ -73,6 +74,13 @@ patternProperties:
         minimum: 0
         maximum: 255
 
+      ti,linear-mapping-mode:
+        description: |
+          Enable linear mapping mode. If disabled, then it will use exponential
+          mapping mode in which the ramp up/down appears to have a more uniform
+          transition to the human eye.
+        type: boolean
+
     required:
       - reg
 
-- 
2.20.1

