Return-Path: <linux-leds+bounces-82-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6497F3760
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 21:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3412AB218F0
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 20:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0131E55777;
	Tue, 21 Nov 2023 20:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="FT9fNT+B"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554E69D;
	Tue, 21 Nov 2023 12:28:53 -0800 (PST)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id EFA5A100067;
	Tue, 21 Nov 2023 23:28:51 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru EFA5A100067
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1700598531;
	bh=9aZqnQoakoRLfMLYgr2wRgT/Br89mjgKuUHrpHJK25M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=FT9fNT+Bzb6H3uiQOZT/2Kuimxy6ZBkT7k/1/tHHmLDBRKSq8D6rQdTo6NwW4QJk+
	 MWYklfltjyhqGHjpEwPTUCCc2028pmnNdjnzW2VAbvP4I4+WL5H6TBVgEey2GUlXUz
	 QrT9omf59v5tYU0HhbxgA7S5kHLbE7TbeD3zGCN72iGrmFg9aoULnczcL2flGKh0WQ
	 Pq7Ok1zVudq0g96cO4xsEZ/lDaPqGpVrWiwwfNYvYFTQGZCj8n9Nle4JuC8RcmaQlx
	 PgynadBP41vHDjF7N79WNmsePC1R3I3FbAbOeY0rfqzU8M+owdfjYCZ5eg/FZM8DIF
	 UFgBqewr/lL7Q==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 21 Nov 2023 23:28:51 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 23:28:51 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <lee@kernel.org>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<andy.shevchenko@gmail.com>
CC: <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, George Stark <gnstark@salutedevices.com>,
	Dmitry Rokosov <ddrokosov@salutedevices.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 05/11] dt-bindings: leds: aw200xx: remove property "awinic,display-rows"
Date: Tue, 21 Nov 2023 23:28:29 +0300
Message-ID: <20231121202835.28152-6-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20231121202835.28152-1-ddrokosov@salutedevices.com>
References: <20231121202835.28152-1-ddrokosov@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181514 [Nov 21 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 3 0.3.3 e5c6a18a9a9bff0226d530c5b790210c0bd117c8, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/21 17:47:00 #22495004
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


