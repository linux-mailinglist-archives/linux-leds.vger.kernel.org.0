Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 938CDFC781
	for <lists+linux-leds@lfdr.de>; Thu, 14 Nov 2019 14:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbfKNNbk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 14 Nov 2019 08:31:40 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48048 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbfKNNbj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Nov 2019 08:31:39 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAEDVaKZ007384;
        Thu, 14 Nov 2019 07:31:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573738296;
        bh=zV3cVdmjhCBXzQdA/5xCOaiT1n6XKbwdMaP1jdy4goo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JsWTAlHz0+oaxsaIz4PoDF/99FfxM9K9ArlbPl3DMBPVLEI6EwlMil4FpuzZGeifm
         K6vhGjn3f5RhEZ09ko8K6G0RfJTpNc2zeQrO/FAu5sce4S/BHwppUhcTQcVbrXENVX
         7I9p6N2IQ7tbfebsG8XWM5haVDT7NMkd2mznw9zY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAEDVat2019354
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 14 Nov 2019 07:31:36 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 07:31:36 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 07:31:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEDVa2B030509;
        Thu, 14 Nov 2019 07:31:36 -0600
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v17 02/19] dt-bindings: leds: Add multicolor ID to the color ID list
Date:   Thu, 14 Nov 2019 07:30:06 -0600
Message-ID: <20191114133023.32185-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191114133023.32185-1-dmurphy@ti.com>
References: <20191114133023.32185-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a new color ID that is declared as MULTICOLOR as with the
multicolor framework declaring a definitive color is not accurate
as the node can contain multiple colors.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 include/dt-bindings/leds/common.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 9e1256a7c1bf..7006d15f71e8 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -29,7 +29,8 @@
 #define LED_COLOR_ID_VIOLET	5
 #define LED_COLOR_ID_YELLOW	6
 #define LED_COLOR_ID_IR		7
-#define LED_COLOR_ID_MAX	8
+#define LED_COLOR_ID_MULTI	8
+#define LED_COLOR_ID_MAX	9
 
 /* Standard LED functions */
 #define LED_FUNCTION_ACTIVITY "activity"
-- 
2.22.0.214.g8dca754b1e

