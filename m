Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83EB029FB7C
	for <lists+linux-leds@lfdr.de>; Fri, 30 Oct 2020 03:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgJ3CjV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 22:39:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:38636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725831AbgJ3CjV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Oct 2020 22:39:21 -0400
Received: from dellmb.labs.office.nic.cz (nat-1.nic.cz [217.31.205.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A947E2087E;
        Fri, 30 Oct 2020 02:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604025561;
        bh=8WnvhZaN5KcJBl5KN374+G8jxDmsSlGwyBuRF7jyDDs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HMeBYEiqMSS1cOvZY25LExq6k/mjDu9LgYFdj7R6HXSFB6XC//QY5wpjRWiXFssaz
         kQjU2Dbso+I9fnrcTMlLTkIsi3j+LiEgwMdXH36Sy0VhNIozfk2dfVQuOkF3J2NVXl
         aAdUToj7GSyzZc0R4apwghaXbIH9fDsyMJ6DgrUA=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: [PATCH leds 4/5] dt-bindings: leds: leds-class-multicolor: use LED_COLOR_ID_RGB for now
Date:   Fri, 30 Oct 2020 03:39:05 +0100
Message-Id: <20201030023906.24259-4-kabel@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201030023906.24259-1-kabel@kernel.org>
References: <20201030023906.24259-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Commit 77dce3a22e89 ("leds: disallow /sys/class/leds/*:multi:* for now")
disallows LED_COLOR_ID_MULTI for now, and instead LED_COLOR_ID_RGB
should be used. Fix this is leds-class-multicolor binding.

After we have some usecases for non-RGB multicolor LEDs, this can be
changed.

Signed-off-by: Marek Behún <kabel@kernel.org>
Fixes: 77dce3a22e89 ("leds: disallow /sys/class/leds/*:multi:* for now")
Cc: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org
---
 .../devicetree/bindings/leds/cznic,turris-omnia-leds.yaml     | 4 ++--
 .../devicetree/bindings/leds/leds-class-multicolor.yaml       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
index fe7fa25877fd..2015db9b7618 100644
--- a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
+++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
@@ -73,14 +73,14 @@ examples:
                  * LEDs.
                  */
                 reg = <0>;
-                color = <LED_COLOR_ID_MULTI>;
+                color = <LED_COLOR_ID_RGB>;
                 function = LED_FUNCTION_POWER;
                 linux,default-trigger = "heartbeat";
             };
 
             multi-led@a {
                 reg = <0xa>;
-                color = <LED_COLOR_ID_MULTI>;
+                color = <LED_COLOR_ID_RGB>;
                 function = LED_FUNCTION_INDICATOR;
                 function-enumerator = <1>;
             };
diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
index b1a53f054b89..9faa3609a6bb 100644
--- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
@@ -25,10 +25,10 @@ patternProperties:
     description: Represents the LEDs that are to be grouped.
     properties:
       color:
-        const: 8  # LED_COLOR_ID_MULTI
+        const: 9  # LED_COLOR_ID_RGB
         description: |
           For multicolor LED support this property should be defined as
-          LED_COLOR_ID_MULTI which can be found in include/linux/leds/common.h.
+          LED_COLOR_ID_RGB which can be found in include/linux/leds/common.h.
 
     $ref: "common.yaml#"
 
-- 
2.26.2

