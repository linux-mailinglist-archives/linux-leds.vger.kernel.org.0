Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB4110024
	for <lists+linux-leds@lfdr.de>; Tue, 30 Apr 2019 21:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfD3TRe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 15:17:34 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52836 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbfD3TRe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 15:17:34 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UJHSZt072407;
        Tue, 30 Apr 2019 14:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556651848;
        bh=CAcuzsZlcjBc1jlbv8INWEI3nZWV72+jYZzsHbl232A=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=L9SVJOCQHLa5Obp/l5mycVeZWzFCg6+Cv2vmz1TKT64Ik4hk+onDEIbmaUJ76r+Xa
         0jWJI2cdcExASiJAxmfKKCKLBjLoRj/+I5jogjzMz44a8rpVkjDh2e96b+ugSm/Ywn
         dXbZLuUYFIyAOyGVy/7BEcAO0w3Brv37zxmE0JMw=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UJHSGA078475
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 14:17:28 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 14:17:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 14:17:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UJHSSI007754;
        Tue, 30 Apr 2019 14:17:28 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/7] dt-bindings: mfd: LMU: Fix lm3632 dt binding example
Date:   Tue, 30 Apr 2019 14:17:24 -0500
Message-ID: <20190430191730.19450-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
In-Reply-To: <20190430191730.19450-1-dmurphy@ti.com>
References: <20190430191730.19450-1-dmurphy@ti.com>
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

