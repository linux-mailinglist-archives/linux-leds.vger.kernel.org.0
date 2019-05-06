Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53B0F1544F
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 21:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfEFTQY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 15:16:24 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44440 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfEFTQX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 15:16:23 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x46JG9Aj115527;
        Mon, 6 May 2019 14:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557170169;
        bh=Zu+lGjPwb6boNQ4Zw8fC+i/x30a+FXOodEjX1XT5Cuo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=WE/hjPxzaxGJ9L6p9ZMbL/WM0Qza8R8W3tk1/iM3vFkePtHOnT0uNc2zJFTNJZ3BL
         FsUKxHoZOxFZhV1Ec/N+1bb7cA8b4v98i1OwEzztlnwC0JkAxK6gKckMuxYRb8V0QS
         hdXwKCqX/i1Ms01K+r7Ev9NPO2p+/aZKtIkcREUk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x46JG9gO074949
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 6 May 2019 14:16:09 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 6 May
 2019 14:16:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 6 May 2019 14:16:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x46JG8KT077954;
        Mon, 6 May 2019 14:16:08 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <lee.jones@linaro.org>, <rdunlap@infradead.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/7] dt-bindings: mfd: LMU: Fix lm3632 dt binding example
Date:   Mon, 6 May 2019 14:16:08 -0500
Message-ID: <20190506191614.25051-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
In-Reply-To: <20190506191614.25051-1-dmurphy@ti.com>
References: <20190506191614.25051-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix the lm3632 dt binding examples as the LCM enable GPIOs
are defined as enable GPIOs per the regulator/lm363x-regulator.txt
bindings document.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v4 - No changes - https://lore.kernel.org/patchwork/patch/1068613/

v3 - No changes added Reviewed-by Rob - https://lore.kernel.org/patchwork/patch/1058757/
v2 - There was no v2 I add this patch on top of this series

 Documentation/devicetree/bindings/mfd/ti-lmu.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
index 980394d701a7..86ca786d54fc 100644
--- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
+++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
@@ -104,8 +104,8 @@ lm3632@11 {
 	regulators {
 		compatible = "ti,lm363x-regulator";
 
-		ti,lcm-en1-gpio = <&pioC 0 GPIO_ACTIVE_HIGH>; /* PC0 */
-		ti,lcm-en2-gpio = <&pioC 1 GPIO_ACTIVE_HIGH>; /* PC1 */
+		enable-gpios = <&pioC 0 GPIO_ACTIVE_HIGH>,
+			       <&pioC 1 GPIO_ACTIVE_HIGH>;
 
 		vboost {
 			regulator-name = "lcd_boost";
-- 
2.21.0.5.gaeb582a983

