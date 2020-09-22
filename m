Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C80E2748C3
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 21:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgIVTG4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 15:06:56 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60140 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbgIVTGz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 15:06:55 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08MJ6nSL104668;
        Tue, 22 Sep 2020 14:06:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600801609;
        bh=FXdbHyKP4OzNMIPypLxJLv10RnWs+v7R3nDuBJSAw6Q=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mpNHno2PW+BcB4HeOBpbFHKx9ydO48kRdmI1NjZfb6oLgjdxaG7z19z24NYtyV18C
         4D8hJ5P4g6RrKmMEEBivjAiB2zjti/IuP+/EI9i6bclVVQPG/tUJqGd6ZftXCrj5dx
         dHlDDgwmESHID+T5b71TGIHHhQaHfBP8IXn771iQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08MJ6nlh093212
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Sep 2020 14:06:49 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 22
 Sep 2020 14:06:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 22 Sep 2020 14:06:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08MJ6n2P130557;
        Tue, 22 Sep 2020 14:06:49 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <marek.behun@nic.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] leds: lm36274: Fix warning for undefined parameters
Date:   Tue, 22 Sep 2020 14:06:38 -0500
Message-ID: <20200922190638.5323-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922190638.5323-1-dmurphy@ti.com>
References: <20200922190638.5323-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix warnings for undefined parameters when building with W=1.

Fixes: 11e1bbc116a75 ("leds: lm36274: Introduce the TI LM36274 LED driver")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm36274.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index 10a63b7f2ecc..bf6487e9a1f4 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -26,8 +26,8 @@
  * @lmu_data: Register and setting values for common code
  * @regmap: Devices register map
  * @dev: Pointer to the devices device struct
- * @led_sources - The LED strings supported in this array
- * @num_leds - Number of LED strings are supported in this array
+ * @led_sources: The LED strings supported in this array
+ * @num_leds: Number of LED strings are supported in this array
  */
 struct lm36274 {
 	struct platform_device *pdev;
@@ -163,6 +163,7 @@ static struct platform_driver lm36274_driver = {
 	.probe  = lm36274_probe,
 	.driver = {
 		.name = "lm36274-leds",
+		.of_match_table = of_lm36274_leds_match,
 	},
 };
 module_platform_driver(lm36274_driver)
-- 
2.28.0

