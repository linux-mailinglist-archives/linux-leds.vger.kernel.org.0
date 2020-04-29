Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E761BDCFF
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2020 15:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgD2NDC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 Apr 2020 09:03:02 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57980 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbgD2NDB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 Apr 2020 09:03:01 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TD2vNs081873;
        Wed, 29 Apr 2020 08:02:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588165377;
        bh=ynYKzF7IA81hE/AQXu47kpPqQhB1lX04VmIlEE6WcNY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gFVDbHKFaJhuERscEYKsN9rfU9o91OduBYmG43X6KbA6dcR0z9qUvNmzFeoRIezST
         9YivpGhSDCfmGN4WLO2jS7TUqJ8WNROgtCNBHrjE//WfgnZnq2xHk/+UTWvBYk17zF
         9B46CjQhkmvl/0PQTuYd7bc/Hb0WO691Qbl8UbX4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TD2vJ4115257
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 08:02:57 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 08:02:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 08:02:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TD2vHN071411;
        Wed, 29 Apr 2020 08:02:57 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v22 05/16] dt: bindings: lp55xx: Be consistent in the document with LED acronym
Date:   Wed, 29 Apr 2020 07:56:20 -0500
Message-ID: <20200429125631.7044-6-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200429125631.7044-1-dmurphy@ti.com>
References: <20200429125631.7044-1-dmurphy@ti.com>
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

