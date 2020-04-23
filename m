Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10321B6018
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2020 18:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729282AbgDWQCA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Apr 2020 12:02:00 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51170 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729257AbgDWQB6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Apr 2020 12:01:58 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03NG1uBq027877;
        Thu, 23 Apr 2020 11:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587657716;
        bh=ynYKzF7IA81hE/AQXu47kpPqQhB1lX04VmIlEE6WcNY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=l7cTFSy1B+uqsAxu5tuMP9dDkq15tO4lAo/imwU5Mp9xbILNRl0D7/NzuOoI32rFb
         7VvA3P1SLANkTNNRmqwMKCSd+qOXGf78Ayncnlt80qbiqOi5agIfBMdwZ9yy4o/Jmn
         IzjsnRoj+X/zSyznkEnatVdFw93AQhpWCr6Rbf4Y=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03NG1u8Q049476;
        Thu, 23 Apr 2020 11:01:56 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 23
 Apr 2020 11:01:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 23 Apr 2020 11:01:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03NG1tXJ048081;
        Thu, 23 Apr 2020 11:01:55 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v20 06/17] dt: bindings: lp55xx: Be consistent in the document with LED acronym
Date:   Thu, 23 Apr 2020 10:55:13 -0500
Message-ID: <20200423155524.13971-7-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200423155524.13971-1-dmurphy@ti.com>
References: <20200423155524.13971-1-dmurphy@ti.com>
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
Acked-by: Pavel Machek <pavel@ucw.cz>
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
2.25.1

