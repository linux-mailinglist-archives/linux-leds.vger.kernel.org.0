Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6D25BB228
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 12:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfIWKVU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 06:21:20 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53578 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439441AbfIWKVK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 06:21:10 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NAL6X5015049;
        Mon, 23 Sep 2019 05:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569234066;
        bh=cBoKvprCWX4HfA/N5m5okyZPanqB24Wctagwezb2Vbo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=sLPysFGFWiRo8k+tP4+1KZAGbGlNMkk0F9aeHqyslpDtdB6s9sVyAEo+EGg4/RFf/
         Pt189duKU9d4+8v8MYtJdxtDKMi/E0wlgI59O8c25ei+MdU/X+Lg8FuIu2qo9C3Qaz
         ErRjY9FUJowHHPl0krJgMIcV6K57ZMal1ydt2vgU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NAL6Oa117942;
        Mon, 23 Sep 2019 05:21:06 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 23
 Sep 2019 05:21:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 23 Sep 2019 05:21:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NAL55m049668;
        Mon, 23 Sep 2019 05:21:05 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <daniel.thompson@linaro.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dmurphy@ti.com>, <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v5 2/3] dt-bindings: leds: document the "power-supply" property
Date:   Mon, 23 Sep 2019 12:20:58 +0200
Message-ID: <20190923102059.17818-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923102059.17818-1-jjhiblot@ti.com>
References: <20190923102059.17818-1-jjhiblot@ti.com>
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

