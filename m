Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 783BBD4076
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2019 15:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbfJKNHX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Oct 2019 09:07:23 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36936 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728221AbfJKNHX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Oct 2019 09:07:23 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BD7KvY078492;
        Fri, 11 Oct 2019 08:07:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570799240;
        bh=2mClMRVmQem6A4eXR7dKG+E8+5lp9Pdw27NqZQki0y8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=epA6GJyrQ0s+rnR9i+KfTupfga8n7MdGT8HG0TNtohjkrZRQrymgi6Sy7b0y4wGSy
         eKcjfElWgpGkG8gPYkcK8ZvGzCYhOigcujtojKnL9RtI/jEC+mqaX2mcO/ejEjKBys
         9PI+gmsmKqiemWCYvJTt4CL4r9q90EPoVcrg5ORA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BD7K6D094107;
        Fri, 11 Oct 2019 08:07:20 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 08:07:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 08:07:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BD7KnQ118544;
        Fri, 11 Oct 2019 08:07:20 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v12 07/16] dt: bindings: lp55xx: Be consistent in the document with LED acronym
Date:   Fri, 11 Oct 2019 08:06:48 -0500
Message-ID: <20191011130657.4713-8-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191011130657.4713-1-dmurphy@ti.com>
References: <20191011130657.4713-1-dmurphy@ti.com>
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

