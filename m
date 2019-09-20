Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13A61B8FB8
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2019 14:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438337AbfITMZw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Sep 2019 08:25:52 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35984 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438317AbfITMZw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Sep 2019 08:25:52 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KCPmCk032284;
        Fri, 20 Sep 2019 07:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568982348;
        bh=cBoKvprCWX4HfA/N5m5okyZPanqB24Wctagwezb2Vbo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Nl1TakozdPzVbEQvO1alKSE8NOUYHoiMJrDKf3N87fODTezlvEb8tQfk68Iw+lXkZ
         U8c6vrB4EmbYuylOhwvGQZx8gk50rsQvY2dmQ4VjvQEVIembPgcUvgo6fwG45xyYxu
         QsERGkZfShIeZqY2HryNTK+5Qn4mrpRj6E2xNO2Y=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KCPm2s125513
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 07:25:48 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 07:25:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 07:25:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KCPlli024329;
        Fri, 20 Sep 2019 07:25:47 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <daniel.thompson@linaro.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dmurphy@ti.com>, <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v4 2/3] dt-bindings: leds: document the "power-supply" property
Date:   Fri, 20 Sep 2019 14:25:24 +0200
Message-ID: <20190920122525.15712-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920122525.15712-1-jjhiblot@ti.com>
References: <20190920122525.15712-1-jjhiblot@ti.com>
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
 Documentation/devicetree/bindings/leds/common.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 9fa6f9795d50..54857c16573d 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -77,6 +77,11 @@ Optional properties for child nodes:
 - panic-indicator : This property specifies that the LED should be used,
 		    if at all possible, as a panic indicator.
 
+- power-supply : A voltage/current regulator used to to power the LED. When a
+		 LED is turned off, the LED core disable its regulator. The
+		 same regulator can power many LED (or other) devices. It is
+		 turned off only when all of its users disabled it.
+
 - trigger-sources : List of devices which should be used as a source triggering
 		    this LED activity. Some LEDs can be related to a specific
 		    device and should somehow indicate its state. E.g. USB 2.0
@@ -124,6 +129,7 @@ led-controller@0 {
 		function = LED_FUNCTION_STATUS;
 		linux,default-trigger = "heartbeat";
 		gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
+		power-supply = <&led_regulator>;
 	};
 
 	led1 {
-- 
2.17.1

