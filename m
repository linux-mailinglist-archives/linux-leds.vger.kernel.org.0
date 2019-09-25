Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09EBBE39E
	for <lists+linux-leds@lfdr.de>; Wed, 25 Sep 2019 19:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408401AbfIYRmN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Sep 2019 13:42:13 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58562 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732339AbfIYRlU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Sep 2019 13:41:20 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PHfGjx055227;
        Wed, 25 Sep 2019 12:41:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569433276;
        bh=UDFcTS6C48EriDoiPf6gaHVdwzTyvBdisepMFN/NjOI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hoOPcvuu6WuC2rnUBHanY4OZSBsq2qWbjzAkA1NnQx9/l4cPVdjpeANlfOykiybpP
         abSnsU4xEES74CRj0scE0NEwxwaz/ve+2wojq6BjqXByumIRH3dFXhoIakivOMoN/H
         YRDG8+Z3fL35eY0nLHZHkadgmh2npyaQBq911XwM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PHfGnJ018223;
        Wed, 25 Sep 2019 12:41:16 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 25
 Sep 2019 12:41:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 25 Sep 2019 12:41:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PHfGm5129605;
        Wed, 25 Sep 2019 12:41:16 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v9 08/15] dt: bindings: lp55xx: Be consistent in the document with LED
Date:   Wed, 25 Sep 2019 12:46:09 -0500
Message-ID: <20190925174616.3714-9-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190925174616.3714-1-dmurphy@ti.com>
References: <20190925174616.3714-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Update the document to be consistent in case when using LED.
This should be capital throughout the document.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 Documentation/devicetree/bindings/leds/leds-lp55xx.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
index 1b66a413fb9d..bfe2805c5534 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
@@ -1,4 +1,4 @@
-Binding for TI/National Semiconductor LP55xx Led Drivers
+Binding for TI/National Semiconductor LP55xx LED Drivers
 
 Required properties:
 - compatible: one of
@@ -12,8 +12,8 @@ Required properties:
 - clock-mode: Input clock mode, (0: automode, 1: internal, 2: external)
 
 Each child has own specific current settings
-- led-cur: Current setting at each led channel (mA x10, 0 if led is not connected)
-- max-cur: Maximun current at each led channel.
+- led-cur: Current setting at each LED channel (mA x10, 0 if LED is not connected)
+- max-cur: Maximun current at each LED channel.
 
 Optional properties:
 - enable-gpio: GPIO attached to the chip's enable pin
-- 
2.22.0.214.g8dca754b1e

