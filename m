Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF4E57DE8B
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2019 17:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732401AbfHAPOc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Aug 2019 11:14:32 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33780 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727853AbfHAPOc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Aug 2019 11:14:32 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71FENOn066123;
        Thu, 1 Aug 2019 10:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564672463;
        bh=vT9TTA9+yJvY9rAaobu7P0YUoXflgY+8195JQIElkeU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=M3Rtfh41Py3G8PEm5bW+uyZWynRjC+FZyqNipU9MJlkycXPkxZP8xuXyw4b4gUztu
         J362/+p+7VkRdMeT1JXuCvyibQu3tkXPrDirP6dgG2KMY0GbgpS4NrAOrCO6q8kZwr
         +/FCW1w2VO6HpycPZQhuYiZIpNS1KGEldkPMmNOg=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71FEN01121654
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 1 Aug 2019 10:14:23 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 10:14:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 10:14:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x71FEMNL089261;
        Thu, 1 Aug 2019 10:14:22 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <tony@atomide.com>,
        <sre@kernel.org>, <nekit1000@gmail.com>, <mpartap@gmx.net>,
        <merlijn@wizzup.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/3] dt: lm3532: Add property for full scale current.
Date:   Thu, 1 Aug 2019 10:14:20 -0500
Message-ID: <20190801151421.21486-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190801151421.21486-1-dmurphy@ti.com>
References: <20190801151421.21486-1-dmurphy@ti.com>
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
 Documentation/devicetree/bindings/leds/leds-lm3532.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3532.txt b/Documentation/devicetree/bindings/leds/leds-lm3532.txt
index c087f85ddddc..d3498dd24e8e 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm3532.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm3532.txt
@@ -62,6 +62,9 @@ Optional LED child properties:
 	- label : see Documentation/devicetree/bindings/leds/common.txt
 	- linux,default-trigger :
 	   see Documentation/devicetree/bindings/leds/common.txt
+	- ti,fs-current : Defines the full scale current value for each control
+			  bank.  The range is from 5000uA-29800uA in increments
+			  of 800uA.
 
 Example:
 led-controller@38 {
@@ -85,6 +88,7 @@ led-controller@38 {
 		reg = <0>;
 		led-sources = <2>;
 		ti,led-mode = <1>;
+		ti,fs-current = <21800>;
 		label = ":backlight";
 		linux,default-trigger = "backlight";
 	};
-- 
2.22.0.214.g8dca754b1e

