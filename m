Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33820203FA8
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2020 21:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730453AbgFVS7r (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Jun 2020 14:59:47 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:53998 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730439AbgFVS7r (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Jun 2020 14:59:47 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05MIxWCa102688;
        Mon, 22 Jun 2020 13:59:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592852372;
        bh=4Fus+1STo6fJcdmND8htjDFw0u7LkR/zKPWh9+ob2Js=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=qyg3tID1vrJyNSQsdOx4SLEYJiWxEaKzFXGiYYAaUVOdbogChUdwYEkuueZ5rxEpj
         G73bxoNwoynr6vZ7mQi0HVmEPJaXltuJy09Gzj5rF1qUk2kxtpEiFURoDXTxsbXgOh
         rcYL2WQ+rfsAgb2hhXfRDaNAJAEddkru+evl57r8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05MIxW7D038101
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 22 Jun 2020 13:59:32 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 22
 Jun 2020 13:59:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 22 Jun 2020 13:59:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05MIxWM0113512;
        Mon, 22 Jun 2020 13:59:32 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v29 16/16] leds: lp5523: Fix various formatting issues in the code
Date:   Mon, 22 Jun 2020 13:59:19 -0500
Message-ID: <20200622185919.2131-17-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200622185919.2131-1-dmurphy@ti.com>
References: <20200622185919.2131-1-dmurphy@ti.com>
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
2.26.2

