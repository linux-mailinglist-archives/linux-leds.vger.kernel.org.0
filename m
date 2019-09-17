Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6BEB54BE
	for <lists+linux-leds@lfdr.de>; Tue, 17 Sep 2019 19:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbfIQR6G (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Sep 2019 13:58:06 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45552 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfIQR5j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Sep 2019 13:57:39 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8HHvYWR042784;
        Tue, 17 Sep 2019 12:57:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568743054;
        bh=Yxm8SULxI+b291k9owGh4ffelO3YSlG1GwHzQHO4shI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gBEYOA0P8ZpW0jbNrjZmRYWj+WyP65P58SWUgxwvHtLTdeOHVvMWhsvt9BC6+i8UH
         e9B6kuYRBR7LtOR3MT8TuvmjWZ0wLTi14jcmLeaulvOUBP+OU/juuM1YxhW8R2n3Bb
         JKzR/UYRxzHTuKXNdK7SOQackD7bPa8xlZLixWUs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8HHvYM1105697
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Sep 2019 12:57:34 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 17
 Sep 2019 12:57:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 17 Sep 2019 12:57:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8HHvYlj068332;
        Tue, 17 Sep 2019 12:57:34 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v6 3/9] dt: bindings: Add multicolor class dt bindings documention
Date:   Tue, 17 Sep 2019 12:59:31 -0500
Message-ID: <20190917175937.13872-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190917175937.13872-1-dmurphy@ti.com>
References: <20190917175937.13872-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add DT bindings for the LEDs multicolor class framework.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v6 - Fixed description and added suffix for function

 .../bindings/leds/leds-class-multicolor.txt   | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
new file mode 100644
index 000000000000..215d3c90f351
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
@@ -0,0 +1,95 @@
+* Multicolor LED properties
+
+Monochrome LEDs can grouped into LED clusters.  These clusters can provide a
+visible output that have a wide range of colors and intensities.
+
+The nodes and properties defined in this document are unique to the multicolor
+LED class.  Common LED nodes and properties are inherited from the common.txt
+within this documentation directory.
+
+Required LED Child properties:
+	- color : For multicolor LED support this property should be defined as
+		  LED_COLOR_ID_MULTI and further definition can be found in
+		  include/linux/leds/common.h.
+
+led-controller@30 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	compatible = "ti,lp5024";
+	reg = <0x29>;
+
+	multi-led@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+		color = <LED_COLOR_ID_MULTI>;
+		function = LED_FUNCTION_STATUS;
+
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@4 {
+			reg = <4>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@5 {
+			reg = <5>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+
+	multi-led@2 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		color = <LED_COLOR_ID_MULTI>;
+		function = LED_FUNCTION_ACTIVITY;
+		reg = <2>;
+		ti,led-bank = <2 3 5>;
+
+		led@6 {
+			reg = <0x6>;
+			color = <LED_COLOR_ID_RED>;
+			led-sources = <6 9 15>;
+		};
+
+		led@7 {
+			reg = <0x7>;
+			color = <LED_COLOR_ID_GREEN>;
+			led-sources = <7 10 16>;
+		};
+
+		led@8 {
+			reg = <0x8>;
+			color = <LED_COLOR_ID_BLUE>;
+			led-sources = <8 11 17>;
+		};
+	};
+
+	multi-led@4 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <4>;
+		color = <LED_COLOR_ID_MULTI>;
+		function = LED_FUNCTION_ACTIVITY;
+
+		led@12 {
+			reg = <12>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@13 {
+			reg = <13>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@14 {
+			reg = <14>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+
+};
-- 
2.22.0.214.g8dca754b1e

