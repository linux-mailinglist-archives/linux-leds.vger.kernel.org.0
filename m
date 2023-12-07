Return-Path: <linux-leds+bounces-297-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A045B8088A2
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 14:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4475F283352
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 13:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6513EA72;
	Thu,  7 Dec 2023 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="cL+zTqWq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E1010CA;
	Thu,  7 Dec 2023 05:00:02 -0800 (PST)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DD165120005;
	Thu,  7 Dec 2023 15:59:59 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DD165120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1701953999;
	bh=gkQwxsJaDBoQZllnRj+h3QzAObadH3z2wRpjqRg+rsw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=cL+zTqWqHtkMUxz363jjuG2pQbsTUMQSz0QL6Tq+0QsRqvR3yPv+73OdNmI4gz08K
	 rEPv8TG6SsGIKaDtjQZmEhXj9owiSTQKnP0d85jejkgYtI06Ivo9RIgheXSr3I0Sjg
	 hhoHq6XG90eal+FxxwQRAg+GSC8O8+Ad6cHGd7Qq0Hs0JrnExymOYdOvfzIDHhVbSy
	 RpU/09wAxuX4Al6u2CxIJpMz2r40X6M3XFpA8cV5y13LuVXDJX6IQ8gmCrnFaJXqmx
	 IswUjxByq7zJyuGCdcQXDK87uHH+acEEA4qGAeR8yn4JbJOlabssXLHdW9ovdotZ5q
	 3iUZ+QA53uY9g==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  7 Dec 2023 15:59:59 +0300 (MSK)
Received: from CAB-WSD-0004828.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 7 Dec 2023 15:59:59 +0300
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Andy Shevchenko <andy.shevchenko@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v1 2/2] dt-bindings: leds: aw200xx: add 'interrupts' property
Date: Thu, 7 Dec 2023 15:59:38 +0300
Message-ID: <20231207125938.175119-3-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231207125938.175119-1-mmkurbanov@salutedevices.com>
References: <20231207125938.175119-1-mmkurbanov@salutedevices.com>
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
X-KSMG-AntiSpam-Lua-Profiles: 181937 [Dec 07 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 5 0.3.5 98d108ddd984cca1d7e65e595eac546a62b0144b, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;salutedevices.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/07 02:56:00 #22627289
X-KSMG-AntiVirus-Status: Clean, skipped

Added support for interrupt to the LED controller driver, which
indicates the finished of the auto-breath pattern.

Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
---
 Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml b/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml
index 54d6d1f08e24..7ab35b7a3fe6 100644
--- a/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml
+++ b/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml
@@ -44,6 +44,9 @@ properties:
   enable-gpios:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+
 patternProperties:
   "^led@[0-9a-f]+$":
     type: object
@@ -137,6 +140,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/leds/common.h>
 
     i2c {
@@ -149,6 +153,8 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
             enable-gpios = <&gpio 3 GPIO_ACTIVE_HIGH>;
+            interrupt-parent = <&gpio_intc>;
+            interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
 
             led@0 {
                 reg = <0x0>;
-- 
2.40.0


