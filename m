Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D19712A7A1
	for <lists+linux-leds@lfdr.de>; Wed, 25 Dec 2019 12:07:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbfLYLHb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Dec 2019 06:07:31 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:36294 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbfLYLH3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 25 Dec 2019 06:07:29 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 12DC8FB03;
        Wed, 25 Dec 2019 12:07:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BE1zhDwYOEc1; Wed, 25 Dec 2019 12:07:27 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 77E3A40EF6; Wed, 25 Dec 2019 12:07:19 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] dt: bindings: lm3692x: Add led-max-microamp property
Date:   Wed, 25 Dec 2019 12:07:18 +0100
Message-Id: <db76306346364e93a03df25a49ad4a16eb6036b2.1577271823.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1577271823.git.agx@sigxcpu.org>
References: <cover.1577271823.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This can be used to limit the current per led strip

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
index 73f41249ecd3..e0d7b3030c01 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
@@ -37,6 +37,8 @@ Optional child properties:
 	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
 	- linux,default-trigger :
 	   see Documentation/devicetree/bindings/leds/common.txt
+	- led-max-microamp :
+	   see Documentation/devicetree/bindings/leds/common.txt
 
 Example:
 
@@ -58,6 +60,7 @@ led-controller@36 {
 		function = LED_FUNCTION_BACKLIGHT;
 		color = <LED_COLOR_ID_WHITE>;
 		linux,default-trigger = "backlight";
+		led-max-microamp = <20000>;
 	};
 }
 
-- 
2.23.0

