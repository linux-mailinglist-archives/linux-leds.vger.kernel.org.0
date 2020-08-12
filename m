Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BA7242F5C
	for <lists+linux-leds@lfdr.de>; Wed, 12 Aug 2020 21:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgHLTdC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Aug 2020 15:33:02 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42704 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbgHLTdC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Aug 2020 15:33:02 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07CJWted106805;
        Wed, 12 Aug 2020 14:32:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597260775;
        bh=1EW1OwfLbnIn6nn3Pcy0uYF/8AosEYu2FExcNrqoGvo=;
        h=From:To:CC:Subject:Date;
        b=Dzcq8VsGzzadMpEJ0qY/ryBydU1TzxOXmjA9xwrva09hV+cg+m3TZ3wk+cIzRmOTY
         P9ifs19pOmwVRnUzIjwvhibcy160ZHSpE/cU6Z5NaXdNUtDK5Ny0IxLLaLtM6b+ChS
         PK8hZyPrVqc5Tr5qD6LaTV3WCZdJ93LplJTuYD5w=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07CJWtw6024876
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Aug 2020 14:32:55 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 12
 Aug 2020 14:32:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 12 Aug 2020 14:32:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07CJWsvi013991;
        Wed, 12 Aug 2020 14:32:54 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <pavel@ucw.cz>, <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] dt: bindings: lp55xx: Updte yaml examples with new color ID
Date:   Wed, 12 Aug 2020 14:32:48 -0500
Message-ID: <20200812193248.11325-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Update the binding examples for the color ID to LED_COLOR_ID_RGB

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 Documentation/devicetree/bindings/leds/leds-lp55xx.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
index b1bb3feb0f4d..89f69d62493e 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
@@ -189,7 +189,7 @@ examples:
                #address-cells = <1>;
                #size-cells = <0>;
                reg = <0x2>;
-               color = <LED_COLOR_ID_MULTI>;
+               color = <LED_COLOR_ID_RGB>;
                function = LED_FUNCTION_STANDBY;
                linux,default-trigger = "heartbeat";
 
-- 
2.28.0

