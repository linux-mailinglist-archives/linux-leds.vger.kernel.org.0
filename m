Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 774F9969C7
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2019 21:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730088AbfHTTx2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Aug 2019 15:53:28 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60924 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729639AbfHTTx2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Aug 2019 15:53:28 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7KJrIFA074400;
        Tue, 20 Aug 2019 14:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566330798;
        bh=SoaUx4hsoNivA4WY8SmxX4gYKChR8ekucNpgYs7oGOU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Hy340tu5ou14SvE18E+vON9oaCf/IDpFPZzgdYuv7qdLP8bCheSZGeEOWh5Mx15wA
         FzFQpTp77swGYDq0yGyRDxecTjRYFKu3zz1mN8/5R9SrkjQOH6frCwkti7CdhM605W
         HOoIx3CN7imoY7Xc+ubIvn7JHDuIJg8h4oItNC44=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7KJrIXR026918
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Aug 2019 14:53:18 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 14:53:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 14:53:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7KJrIAB098256;
        Tue, 20 Aug 2019 14:53:18 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <tony@atomide.com>,
        <sre@kernel.org>, <nekit1000@gmail.com>, <mpartap@gmx.net>,
        <merlijn@wizzup.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 4/5] dt: lm3532: Add property for full scale current.
Date:   Tue, 20 Aug 2019 14:53:06 -0500
Message-ID: <20190820195307.27590-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190820195307.27590-1-dmurphy@ti.com>
References: <20190820195307.27590-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a property for each control bank to configure the
full scale current setting for the device.

Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v3 - No changes - https://lore.kernel.org/patchwork/patch/1114540/

 Documentation/devicetree/bindings/leds/leds-lm3532.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3532.txt b/Documentation/devicetree/bindings/leds/leds-lm3532.txt
index c087f85ddddc..53793213dd52 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm3532.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm3532.txt
@@ -62,6 +62,9 @@ Optional LED child properties:
 	- label : see Documentation/devicetree/bindings/leds/common.txt
 	- linux,default-trigger :
 	   see Documentation/devicetree/bindings/leds/common.txt
+	- led-max-microamp : Defines the full scale current value for each control
+			  bank.  The range is from 5000uA-29800uA in increments
+			  of 800uA.
 
 Example:
 led-controller@38 {
@@ -85,6 +88,7 @@ led-controller@38 {
 		reg = <0>;
 		led-sources = <2>;
 		ti,led-mode = <1>;
+		led-max-microamp = <21800>;
 		label = ":backlight";
 		linux,default-trigger = "backlight";
 	};
-- 
2.22.0.214.g8dca754b1e

