Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00E87CC030
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 18:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390243AbfJDQHc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 12:07:32 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58836 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390128AbfJDQHc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 12:07:32 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94G7Tje076420;
        Fri, 4 Oct 2019 11:07:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570205249;
        bh=nKBgDExWroacI0cXAYy90RlQTvpdjmGaUe/C+9QHUIk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=V3gIEhu/3ild1Onc0Zp9MGXdAuIXD1xqfQ1OBU0cOciRPisnaFSE16+bngPnclgfm
         birUarb7gj7yrdnUeM7FXVYCx1d2X8tmddG8ztyQZD8m0aeISqPGRsEk2u1yBjLFPt
         kOvi0E/I7jllJ9rVDIxdInz51hwzQPoVv4AYYkAc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94G7Ts7030721
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Oct 2019 11:07:29 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 11:07:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 11:07:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94G7R3P056166;
        Fri, 4 Oct 2019 11:07:28 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dmurphy@ti.com>, <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v6 1/2] dt-bindings: leds: document the "power-supply" property
Date:   Fri, 4 Oct 2019 18:07:23 +0200
Message-ID: <20191004160724.18390-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004160724.18390-1-jjhiblot@ti.com>
References: <20191004160724.18390-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Most of the LEDs are powered by a voltage/current regulator. Describing it
in the device-tree makes it possible for the LED core to enable/disable it
when needed.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 Documentation/devicetree/bindings/leds/common.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 9fa6f9795d50..28c0cbb7c6ab 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -77,6 +77,19 @@ Optional properties for child nodes:
 - panic-indicator : This property specifies that the LED should be used,
 		    if at all possible, as a panic indicator.
 
+- power-supply : A voltage/current regulator used to to power the LED. When a
+		 LED is turned off, the LED core disable its regulator. The
+		 same regulator can power many LED (or other) devices. It is
+		 turned off only when all of its users disabled it.
+
+- power-off-delays-ms: This property specifies the delay between the time a LED
+                       is turned off and the time the regulator is turned off.
+                       It can be used to limit the overhead of the regulator
+                       handling if the LED is toggling fast.
+                       ex: if power-off-delays-ms is set to 500 ms, the
+                       regulator will not be turned off until the LED is turned
+                       off for more than 500ms.
+
 - trigger-sources : List of devices which should be used as a source triggering
 		    this LED activity. Some LEDs can be related to a specific
 		    device and should somehow indicate its state. E.g. USB 2.0
@@ -124,6 +137,7 @@ led-controller@0 {
 		function = LED_FUNCTION_STATUS;
 		linux,default-trigger = "heartbeat";
 		gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
+		power-supply = <&led_regulator>;
 	};
 
 	led1 {
-- 
2.17.1

