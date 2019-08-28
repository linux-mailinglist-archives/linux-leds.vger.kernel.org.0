Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF22A062F
	for <lists+linux-leds@lfdr.de>; Wed, 28 Aug 2019 17:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfH1PW0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Aug 2019 11:22:26 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38068 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbfH1PWZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Aug 2019 11:22:25 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7SFMKTC117468;
        Wed, 28 Aug 2019 10:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567005740;
        bh=7IGgI698zMF/+s89pWm3Pcl96yqo3HGlbNGLfaQySdY=;
        h=From:To:CC:Subject:Date;
        b=UEaOy375IM8Zc52bptNfiBPLq8fFfh9vY/h54ozDOihtFo9koAzGiqXkZPYYJdVLX
         8ze0Tw2g23PvEXeBMonrE+Pe5N9W0iDBTPIU5e8edaoXx2PNUwo7bdjd4kqXAwAFd9
         2g90DP4npjy8ooU2E5wk71nHX4mn7erQJKmlj30g=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7SFMKai029873
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 10:22:20 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 10:22:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 10:22:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7SFMKH2047280;
        Wed, 28 Aug 2019 10:22:20 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2] leds: ti-lmu-common: Fix coccinelle issue in TI LMU
Date:   Wed, 28 Aug 2019 10:22:19 -0500
Message-ID: <20190828152219.27640-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix the coccinelle issues found in the TI LMU common code

drivers/leds/leds-ti-lmu-common.c:97:20-29: WARNING: Unsigned expression compared with zero: ramp_down < 0
drivers/leds/leds-ti-lmu-common.c:97:5-12: WARNING: Unsigned expression compared with zero: ramp_up < 0

Fixes: f717460ba4d7 ("leds: TI LMU: Add common code for TI LMU devices")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-ti-lmu-common.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-ti-lmu-common.c b/drivers/leds/leds-ti-lmu-common.c
index adc7293004f1..e294a0b097e3 100644
--- a/drivers/leds/leds-ti-lmu-common.c
+++ b/drivers/leds/leds-ti-lmu-common.c
@@ -11,10 +11,10 @@
 
 #include <linux/leds-ti-lmu-common.h>
 
-const static int ramp_table[16] = {2048, 262000, 524000, 1049000, 2090000,
-				4194000, 8389000, 16780000, 33550000, 41940000,
-				50330000, 58720000, 67110000, 83880000,
-				100660000, 117440000};
+const static unsigned int ramp_table[16] = {2048, 262000, 524000, 1049000,
+				2090000, 4194000, 8389000, 16780000, 33550000,
+				41940000, 50330000, 58720000, 67110000,
+				83880000, 100660000, 117440000};
 
 static int ti_lmu_common_update_brightness(struct ti_lmu_bank *lmu_bank,
 					   int brightness)
@@ -54,7 +54,7 @@ int ti_lmu_common_set_brightness(struct ti_lmu_bank *lmu_bank, int brightness)
 }
 EXPORT_SYMBOL(ti_lmu_common_set_brightness);
 
-static int ti_lmu_common_convert_ramp_to_index(unsigned int usec)
+static unsigned int ti_lmu_common_convert_ramp_to_index(unsigned int usec)
 {
 	int size = ARRAY_SIZE(ramp_table);
 	int i;
@@ -78,7 +78,7 @@ static int ti_lmu_common_convert_ramp_to_index(unsigned int usec)
 		}
 	}
 
-	return -EINVAL;
+	return 0;
 }
 
 int ti_lmu_common_set_ramp(struct ti_lmu_bank *lmu_bank)
@@ -94,9 +94,6 @@ int ti_lmu_common_set_ramp(struct ti_lmu_bank *lmu_bank)
 		ramp_down = ti_lmu_common_convert_ramp_to_index(lmu_bank->ramp_down_usec);
 	}
 
-	if (ramp_up < 0 || ramp_down < 0)
-		return -EINVAL;
-
 	ramp = (ramp_up << 4) | ramp_down;
 
 	return regmap_write(regmap, lmu_bank->runtime_ramp_reg, ramp);
-- 
2.22.0.214.g8dca754b1e

