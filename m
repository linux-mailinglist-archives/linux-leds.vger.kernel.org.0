Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05490969CE
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2019 21:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730552AbfHTTx2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Aug 2019 15:53:28 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60926 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbfHTTx2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Aug 2019 15:53:28 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7KJrI9P074396;
        Tue, 20 Aug 2019 14:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566330798;
        bh=V6U4nR1WxqWcfL0/OWHdgADpknh3P+hm2/lQOtdCRsQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=COeJZCFGzVany4YYPoxNpbE6TWmMg6v4sJZVhVLhluA02l4xoQ3nc9QWOiLghXcOO
         2h+xHFkEXW84QzixbSmWdaDDdj4O0jGScXHSo6YMUiLsLc1AjunCsp2N8/0ikaSyF9
         gdWJgGoWtc+2fheYs84zuuEQSaQbxZmvJv2TrrU4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7KJrISb026901
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Aug 2019 14:53:18 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 14:53:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 14:53:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7KJrHRI098248;
        Tue, 20 Aug 2019 14:53:17 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <tony@atomide.com>,
        <sre@kernel.org>, <nekit1000@gmail.com>, <mpartap@gmx.net>,
        <merlijn@wizzup.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 2/5] leds: lm3532: Change the define for the fs current register
Date:   Tue, 20 Aug 2019 14:53:04 -0500
Message-ID: <20190820195307.27590-2-dmurphy@ti.com>
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

Change the define name of the full scale current registers.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v3 - New patch - https://lore.kernel.org/patchwork/patch/1114542/

 drivers/leds/leds-lm3532.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 8132d05f7add..0c3d67671ab2 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -23,11 +23,11 @@
 #define LM3532_REG_PWM_B_CFG	0x14
 #define LM3532_REG_PWM_C_CFG	0x15
 #define LM3532_REG_ZONE_CFG_A	0x16
-#define LM3532_REG_CTRL_A_BRT	0x17
+#define LM3532_REG_CTRL_A_FS_CURR	0x17
 #define LM3532_REG_ZONE_CFG_B	0x18
-#define LM3532_REG_CTRL_B_BRT	0x19
+#define LM3532_REG_CTRL_B_FS_CURR	0x19
 #define LM3532_REG_ZONE_CFG_C	0x1a
-#define LM3532_REG_CTRL_C_BRT	0x1b
+#define LM3532_REG_CTRL_C_FS_CURR	0x1b
 #define LM3532_REG_ENABLE	0x1d
 #define LM3532_ALS_CONFIG	0x23
 #define LM3532_REG_ZN_0_HI	0x60
@@ -173,11 +173,11 @@ static const struct reg_default lm3532_reg_defs[] = {
 	{LM3532_REG_PWM_B_CFG, 0x82},
 	{LM3532_REG_PWM_C_CFG, 0x82},
 	{LM3532_REG_ZONE_CFG_A, 0xf1},
-	{LM3532_REG_CTRL_A_BRT, 0xf3},
+	{LM3532_REG_CTRL_A_FS_CURR, 0xf3},
 	{LM3532_REG_ZONE_CFG_B, 0xf1},
-	{LM3532_REG_CTRL_B_BRT, 0xf3},
+	{LM3532_REG_CTRL_B_FS_CURR, 0xf3},
 	{LM3532_REG_ZONE_CFG_C, 0xf1},
-	{LM3532_REG_CTRL_C_BRT, 0xf3},
+	{LM3532_REG_CTRL_C_FS_CURR, 0xf3},
 	{LM3532_REG_ENABLE, 0xf8},
 	{LM3532_ALS_CONFIG, 0x44},
 	{LM3532_REG_ZN_0_HI, 0x35},
-- 
2.22.0.214.g8dca754b1e

