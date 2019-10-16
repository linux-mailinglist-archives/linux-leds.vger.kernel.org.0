Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C316FD9635
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 18:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405922AbfJPQBM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Oct 2019 12:01:12 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41866 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405930AbfJPQAf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Oct 2019 12:00:35 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9GG0Wh3121881;
        Wed, 16 Oct 2019 11:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571241632;
        bh=DaxoDAt9j1qqv6dP7ny+9Mz7K8+GmtFtHMAHTyu2vvU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rm1eiIb8YGZyCIf8UzE4GPwqw97ahMrPJQh24DqwIDjgYvVrsW1/ub8swRx8YBk8G
         J9gNiL1kG6VFGnXS0tpfcIxQPVfSoWBoywGS23t5URaNvle5K02ASs1JaWQuKFkp4+
         oyW+QBmgIN4FBdYA11b4RyliXju/XQVXwRHTAIBc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9GG0WH3094859
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Oct 2019 11:00:32 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 11:00:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 11:00:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9GG0WqN113291;
        Wed, 16 Oct 2019 11:00:32 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v13 17/18] leds: lp5523: Fix checkpatch issues in the code
Date:   Wed, 16 Oct 2019 10:59:53 -0500
Message-ID: <20191016155954.29044-18-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191016155954.29044-1-dmurphy@ti.com>
References: <20191016155954.29044-1-dmurphy@ti.com>
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

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp5523.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index b5beed5bbd85..ffa2b5e6e38e 100644
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
2.22.0.214.g8dca754b1e

