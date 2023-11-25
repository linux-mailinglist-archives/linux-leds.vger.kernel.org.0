Return-Path: <linux-leds+bounces-158-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E9F7F8E6C
	for <lists+linux-leds@lfdr.de>; Sat, 25 Nov 2023 21:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFE80B21207
	for <lists+linux-leds@lfdr.de>; Sat, 25 Nov 2023 20:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691B730F8D;
	Sat, 25 Nov 2023 20:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="pM20NMzQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551ACEE;
	Sat, 25 Nov 2023 12:05:34 -0800 (PST)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 0859512001E;
	Sat, 25 Nov 2023 23:05:33 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 0859512001E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1700942733;
	bh=/HrW0X+9rW0pBeZMX5Q2JYjOL2DcSt6189XJga8hqTE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=pM20NMzQc2m9ujhSUIV3jSpaTOILc7uyt1WXfOkEdo0iJT6asvS4TXG8WWo36pgLO
	 5SA8TWA9WKrlCkL5qSFGguqDRG/PtTYymwvUM2EQbJ8qFCR7f7B1J7iBw925havXh9
	 Gi63TmZUnZne4OkozPVtCU2IbKuf2/UJL+pFDmcJyrZyPhXgGa2mswWLokgEB6BiE2
	 8d2gnMd/kQT1o2S1/zaHhIBG5nJ2hDNGkplOPSQMGbuXXB++cbuIu6C9MTShNR+8tY
	 ZBVuICSqkcr7A3xGbPPZRdn4XWv8cyEu+QdrEbFR9RzYZzkLBhMWFkqrs2FCOaUV1k
	 wmhmL4HayhUIg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat, 25 Nov 2023 23:05:32 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 25 Nov 2023 23:05:32 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <lee@kernel.org>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<andy.shevchenko@gmail.com>
CC: <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, George Stark <gnstark@salutedevices.com>,
	Dmitry Rokosov <ddrokosov@salutedevices.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v5 10/11] dt-bindings: leds: awinic,aw200xx: add AW20108 device
Date: Sat, 25 Nov 2023 23:05:18 +0300
Message-ID: <20231125200519.1750-11-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20231125200519.1750-1-ddrokosov@salutedevices.com>
References: <20231125200519.1750-1-ddrokosov@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181593 [Nov 25 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 4 0.3.4 720d3c21819df9b72e78f051e300e232316d302a, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;www.awinic.com:7.1.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/11/25 18:50:00
X-KSMG-LinksScanning: Clean, bases: 2023/11/25 18:50:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/25 18:32:00 #22537065
X-KSMG-AntiVirus-Status: Clean, skipped

From: George Stark <gnstark@salutedevices.com>

Add aw20108 compatible for Awinic AW20108 led controller.

Signed-off-by: George Stark <gnstark@salutedevices.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/leds/awinic,aw200xx.yaml    | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml b/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml
index a6dced59599d..67c1d960db1d 100644
--- a/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml
+++ b/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml
@@ -10,15 +10,19 @@ maintainers:
   - Martin Kurbanov <mmkurbanov@sberdevices.ru>
 
 description: |
-  This controller is present on AW20036/AW20054/AW20072.
-  It is a 3x12/6x9/6x12 matrix LED programmed via
-  an I2C interface, up to 36/54/72 LEDs or 12/18/24 RGBs,
-  3 pattern controllers for auto breathing or group dimming control.
+  It is a matrix LED driver programmed via an I2C interface. Devices have
+  a set of individually controlled leds and support 3 pattern controllers
+  for auto breathing or group dimming control. Supported devices:
+    - AW20036 (3x12) 36 LEDs
+    - AW20054 (6x9)  54 LEDs
+    - AW20072 (6x12) 72 LEDs
+    - AW20108 (9x12) 108 LEDs
 
   For more product information please see the link below:
   aw20036 - https://www.awinic.com/en/productDetail/AW20036QNR#tech-docs
   aw20054 - https://www.awinic.com/en/productDetail/AW20054QNR#tech-docs
   aw20072 - https://www.awinic.com/en/productDetail/AW20072QNR#tech-docs
+  aw20108 - https://www.awinic.com/en/productDetail/AW20108QNR#tech-docs
 
 properties:
   compatible:
@@ -26,6 +30,7 @@ properties:
       - awinic,aw20036
       - awinic,aw20054
       - awinic,aw20072
+      - awinic,aw20108
 
   reg:
     maxItems: 1
-- 
2.36.0


