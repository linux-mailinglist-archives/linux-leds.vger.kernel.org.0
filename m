Return-Path: <linux-leds+bounces-149-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A8B7F8E5B
	for <lists+linux-leds@lfdr.de>; Sat, 25 Nov 2023 21:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16414B210C0
	for <lists+linux-leds@lfdr.de>; Sat, 25 Nov 2023 20:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EC930676;
	Sat, 25 Nov 2023 20:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="psEyE1K7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D68FE1;
	Sat, 25 Nov 2023 12:05:31 -0800 (PST)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 1571C100023;
	Sat, 25 Nov 2023 23:05:30 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 1571C100023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1700942730;
	bh=9aZqnQoakoRLfMLYgr2wRgT/Br89mjgKuUHrpHJK25M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=psEyE1K77ho8Ff3+T8aehAYJcwzabNUjOiinlKOp/+9AVHC1n7DFmyTkCF7/Jcfsa
	 d98zxvUQwSvGwMLmO9QTQfb5CEkpYjfYMBvOnhurXS3k0iruB8L2+4mNEi2PdMjXLy
	 vSfDa6ZzwXDKhYpOrdBUGB9lytVLv/03wnF0oZMDvGGli6fpnt0rKWHofOOKqBo79k
	 fc+LOZJl5GTsZcOhEyMpM+uax9OlmPE00eIcdony3Vd6cyDq8sULHUNqLQ3NA6IOFH
	 kwIluOYnVXlhK9KoJTl36dslIZq9DlYo9q5UriYReXYdW2bOAAVydrGZUdUFamU+LT
	 3RHYov8W46WMA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat, 25 Nov 2023 23:05:29 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 25 Nov 2023 23:05:29 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <lee@kernel.org>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<andy.shevchenko@gmail.com>
CC: <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, George Stark <gnstark@salutedevices.com>,
	Dmitry Rokosov <ddrokosov@salutedevices.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 05/11] dt-bindings: leds: aw200xx: remove property "awinic,display-rows"
Date: Sat, 25 Nov 2023 23:05:13 +0300
Message-ID: <20231125200519.1750-6-ddrokosov@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 4 0.3.4 720d3c21819df9b72e78f051e300e232316d302a, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/25 18:32:00 #22537065
X-KSMG-AntiVirus-Status: Clean, skipped

From: George Stark <gnstark@salutedevices.com>

Get rid of the property "awinic,display-rows" and calculate it
in the driver using led definition nodes.

Signed-off-by: George Stark <gnstark@salutedevices.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/leds/awinic,aw200xx.yaml         | 28 +++----------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml b/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml
index 3da3633a242c..a6dced59599d 100644
--- a/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml
+++ b/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml
@@ -36,11 +36,6 @@ properties:
   "#size-cells":
     const: 0
 
-  awinic,display-rows:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      Leds matrix size
-
   enable-gpios:
     maxItems: 1
 
@@ -63,31 +58,17 @@ patternProperties:
           since the chip has a single global setting.
           The maximum output current of each LED is calculated by the
           following formula:
-            IMAXled = 160000 * (592 / 600.5) * (1 / display-rows)
+            IMAXled = 160000 * (592 / 600.5) * (1 / max-current-switch-number)
           And the minimum output current formula:
-            IMINled = 3300 * (592 / 600.5) * (1 / display-rows)
+            IMINled = 3300 * (592 / 600.5) * (1 / max-current-switch-number)
+          where max-current-switch-number is determinated by led configuration
+          and depends on how leds are physically connected to the led driver.
 
 required:
   - compatible
   - reg
   - "#address-cells"
   - "#size-cells"
-  - awinic,display-rows
-
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: awinic,aw20036
-    then:
-      properties:
-        awinic,display-rows:
-          enum: [1, 2, 3]
-    else:
-      properties:
-        awinic,display-rows:
-          enum: [1, 2, 3, 4, 5, 6, 7]
 
 additionalProperties: false
 
@@ -105,7 +86,6 @@ examples:
             reg = <0x3a>;
             #address-cells = <1>;
             #size-cells = <0>;
-            awinic,display-rows = <3>;
             enable-gpios = <&gpio 3 GPIO_ACTIVE_HIGH>;
 
             led@0 {
-- 
2.36.0


