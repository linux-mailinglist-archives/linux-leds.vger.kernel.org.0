Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D98F1C48E9
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2020 23:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgEDVWg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 May 2020 17:22:36 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46986 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbgEDVWf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 May 2020 17:22:35 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 044LMXLC014148;
        Mon, 4 May 2020 16:22:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588627353;
        bh=bmBuG9jt62UFiiDsKieHCLET4q0si6GpPuir0KvUPKA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=KiTW//cVUb0gkXW8U9XVCcCCSU7ZgiJ5exeItbZk+NNh76v2slRHQOXmcHayfnOXt
         5YFpDPACq8vsUp6IjWhONc5tf7YGDXPi1AON8/j13DjrjyNyZJEyeQIl4tU3e9CTvu
         YSKGBTg7AiGtK07aQo6Q49ZVQO9IbIoabWTteRkQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 044LMXLS052710
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 May 2020 16:22:33 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 4 May
 2020 16:22:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 4 May 2020 16:22:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 044LMWQ8102096;
        Mon, 4 May 2020 16:22:32 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v25 15/16] leds: lp5523: Fix checkpatch issues in the code
Date:   Mon, 4 May 2020 16:13:43 -0500
Message-ID: <20200504211344.13221-16-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200504211344.13221-1-dmurphy@ti.com>
References: <20200504211344.13221-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix checkpatch errors and warnings for the LP5523.c device
driver.

Acked-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp5523.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 9776dc72a764..f55d97258d5e 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -23,13 +23,13 @@
 
 #define LP5523_PROGRAM_LENGTH		32	/* bytes */
 /* Memory is used like this:
-   0x00 engine 1 program
-   0x10 engine 2 program
-   0x20 engine 3 program
-   0x30 engine 1 muxing info
-   0x40 engine 2 muxing info
-   0x50 engine 3 muxing info
-*/
+ * 0x00 engine 1 program
+ * 0x10 engine 2 program
+ * 0x20 engine 3 program
+ * 0x30 engine 1 muxing info
+ * 0x40 engine 2 muxing info
+ * 0x50 engine 3 muxing info
+ */
 #define LP5523_MAX_LEDS			9
 
 /* Registers */
@@ -326,7 +326,7 @@ static int lp5523_update_program_memory(struct lp55xx_chip *chip,
 					const u8 *data, size_t size)
 {
 	u8 pattern[LP5523_PROGRAM_LENGTH] = {0};
-	unsigned cmd;
+	unsigned int cmd;
 	char c[3];
 	int nrchars;
 	int ret;
@@ -468,6 +468,7 @@ static int lp5523_mux_parse(const char *buf, u16 *mux, size_t len)
 static void lp5523_mux_to_array(u16 led_mux, char *array)
 {
 	int i, pos = 0;
+
 	for (i = 0; i < LP5523_MAX_LEDS; i++)
 		pos += sprintf(array + pos, "%x", LED_ACTIVE(led_mux, i));
 
@@ -506,7 +507,7 @@ static int lp5523_load_mux(struct lp55xx_chip *chip, u16 mux, int nr)
 	if (ret)
 		return ret;
 
-	ret = lp55xx_write(chip, LP5523_REG_PROG_MEM , (u8)(mux >> 8));
+	ret = lp55xx_write(chip, LP5523_REG_PROG_MEM, (u8)(mux >> 8));
 	if (ret)
 		return ret;
 
-- 
2.25.1

