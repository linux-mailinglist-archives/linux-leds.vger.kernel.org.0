Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B66E8C031
	for <lists+linux-leds@lfdr.de>; Tue, 13 Aug 2019 20:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbfHMSMK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Aug 2019 14:12:10 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39772 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728345AbfHMSMJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Aug 2019 14:12:09 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7DIC0Ih061504;
        Tue, 13 Aug 2019 13:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565719920;
        bh=rcJORkZ6Sdyk2JGl2jXoFIyuGmwVg+r6vi7peaiEtlw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=IcH5DOonvzv3nLDM3nm1vW+BUC0irajM0A9YqwmHZa+LIzbOfEjHwrdFn/Rrk9L2T
         ekD2KMtoXmjE95vzRZVTO3yF+iwXryCu4MVwEJF45c3h2qE4xOf/0ErrPdTFTHU2/K
         whAHXPbqHlmuEEkEg6V80NZATq+cLAN3M1StgEYw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7DIC0QR004387
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 13 Aug 2019 13:12:00 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 13
 Aug 2019 13:11:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 13 Aug 2019 13:11:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7DIBxNe051021;
        Tue, 13 Aug 2019 13:11:59 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <tony@atomide.com>,
        <sre@kernel.org>, <nekit1000@gmail.com>, <mpartap@gmx.net>,
        <merlijn@wizzup.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 3/4] dt: lm3532: Add property for full scale current.
Date:   Tue, 13 Aug 2019 13:11:53 -0500
Message-ID: <20190813181154.6614-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190813181154.6614-1-dmurphy@ti.com>
References: <20190813181154.6614-1-dmurphy@ti.com>
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

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v2 - Change ti,fs-current to led-max-microamp - https://lore.kernel.org/patchwork/patch/1109501/

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

