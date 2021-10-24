Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86BC44385FE
	for <lists+linux-leds@lfdr.de>; Sun, 24 Oct 2021 02:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbhJXA0m (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 23 Oct 2021 20:26:42 -0400
Received: from phobos.denx.de ([85.214.62.61]:56482 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231131AbhJXA0l (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 23 Oct 2021 20:26:41 -0400
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A2B7A83310;
        Sun, 24 Oct 2021 02:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1635035060;
        bh=w3YscZiPE/NIQOl2luLOh4QlWW1IHeT4c4f4y6k1oYc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ly1bDjiGs4LDaBGqBblJx3RXzD+OIfDqexWhByTq2jesoXS/mgccLLojvb/B3Bjns
         +iCTvLVZkR2nyonOIbFnj4F8k20//OPHRJ0VedPNWsUurQedqToHURKhC8i0wnfUFi
         Hb0TQXoDuH71rzchJTGAqnTf4TvUoDDi14R75sVH8W6jL5xrhaFfj6GumxqWdTF5Hf
         d54qWui4JuqwVvRQMGv5K5CX5tltaUq6kMCSYp8d4DG4ykBs3Rd/E/DPC7OZSsI4zZ
         psNyrr0IyE1O9VdX32dMdkTyMzqsPmay6s4T6cUW2zY5sxxwXvicHLXe8nqKPD4J9E
         EfTzh0XUrkScQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-leds@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: leds: Document mmc trigger
Date:   Sun, 24 Oct 2021 02:23:58 +0200
Message-Id: <20211024002358.225750-2-marex@denx.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024002358.225750-1-marex@denx.de>
References: <20211024002358.225750-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The mmc subsystem supports triggering leds on card activity, document
the trigger value here. The value is a pattern in this case.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
To: linux-leds@vger.kernel.org
---
 .../devicetree/bindings/leds/common.yaml      | 43 ++++++++++---------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 22197376fa3c7..40afb06072d9c 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -79,26 +79,29 @@ properties:
       the LED.
     $ref: /schemas/types.yaml#/definitions/string
 
-    enum:
-        # LED will act as a back-light, controlled by the framebuffer system
-      - backlight
-        # LED will turn on (but for leds-gpio see "default-state" property in
-        # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
-      - default-on
-        # LED "double" flashes at a load average based rate
-      - heartbeat
-        # LED indicates disk activity
-      - disk-activity
-        # LED indicates IDE disk activity (deprecated), in new implementations
-        # use "disk-activity"
-      - ide-disk
-        # LED is not triggered
-      - none
-        # LED flashes at a fixed, configurable rate
-      - timer
-        # LED alters the brightness for the specified duration with one software
-        # timer (requires "led-pattern" property)
-      - pattern
+    oneOf:
+      - enum:
+          # LED will act as a back-light, controlled by the framebuffer system
+        - backlight
+          # LED will turn on (but for leds-gpio see "default-state" property in
+          # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
+        - default-on
+          # LED "double" flashes at a load average based rate
+        - heartbeat
+          # LED indicates disk activity
+        - disk-activity
+          # LED indicates IDE disk activity (deprecated), in new implementations
+          # use "disk-activity"
+        - ide-disk
+          # LED is not triggered
+        - none
+          # LED flashes at a fixed, configurable rate
+        - timer
+          # LED alters the brightness for the specified duration with one software
+          # timer (requires "led-pattern" property)
+        - pattern
+        # LED is triggered by SD/MMC activity
+      - pattern: "^mmc[0-9]+$"
 
   led-pattern:
     description: |
-- 
2.33.0

