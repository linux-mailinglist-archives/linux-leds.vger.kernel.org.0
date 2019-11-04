Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 160FFEE00C
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2019 13:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728873AbfKDMiU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Nov 2019 07:38:20 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52542 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728872AbfKDMiU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Nov 2019 07:38:20 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4CcF6Z118376;
        Mon, 4 Nov 2019 06:38:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572871095;
        bh=zV3cVdmjhCBXzQdA/5xCOaiT1n6XKbwdMaP1jdy4goo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=s2Ok07YbooCpoBleJJoigVhPzRFClv3saCgbjRPyc6sFWMnIjh6OeG+o1Fwh8+mYi
         YbZWABiv2jlqMbJR++nD3V4ZXVmdu1o/zJlEKtRd0TmF3cVL4K6b8dSk9juwACp4lf
         M8G4FVnDqORPOj9N4ZjwvDgaOBJttTABB+n7UenE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4CcFvt067281;
        Mon, 4 Nov 2019 06:38:15 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 06:38:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 06:38:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4CcEga005447;
        Mon, 4 Nov 2019 06:38:15 -0600
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v16 02/19] dt-bindings: leds: Add multicolor ID to the color ID list
Date:   Mon, 4 Nov 2019 06:36:50 -0600
Message-ID: <20191104123707.31930-3-dmurphy@ti.com>
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

