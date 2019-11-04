Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26A6AEE016
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2019 13:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbfKDMio (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Nov 2019 07:38:44 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51132 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbfKDMio (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Nov 2019 07:38:44 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4CcfMd014942;
        Mon, 4 Nov 2019 06:38:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572871121;
        bh=2mClMRVmQem6A4eXR7dKG+E8+5lp9Pdw27NqZQki0y8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Y9qaB1TjjSQB36bY4+jHL39xZqPXjxukKIUZifeE7gRQ7OsS6EE2VtVwMlv0kqxP7
         VuN8G0pyKNLIAR3yS9PWY1u5FXcccoM+Yw/zS+OruttVEb6NmjlItu6fywqzpS67EN
         wUBHg9e9GgYGP9SMl+MK6hh6I+1cdoGbwKVaSN/E=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4Ccfig129494
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 06:38:41 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 06:38:27 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 06:38:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4Ccf5U011999;
        Mon, 4 Nov 2019 06:38:41 -0600
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v16 07/19] dt: bindings: lp55xx: Be consistent in the document with LED acronym
Date:   Mon, 4 Nov 2019 06:36:55 -0600
Message-ID: <20191104123707.31930-8-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191104123707.31930-1-dmurphy@ti.com>
References: <20191104123707.31930-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Update the document to be consistent in case when using "LED".
This acronym should be capital throughout the document.

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

