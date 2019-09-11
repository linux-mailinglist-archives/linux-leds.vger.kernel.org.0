Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94504B039E
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 20:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729886AbfIKS1f (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 14:27:35 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59228 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729758AbfIKS1f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Sep 2019 14:27:35 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8BIRWOh007757;
        Wed, 11 Sep 2019 13:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568226452;
        bh=AeW/DYP1zkaB9/BB4ZesrqQm2k+eZeF9Bifc81J4frk=;
        h=From:To:CC:Subject:Date;
        b=RPozfMIZ2vDTQYaxoPOFnOcEnciwqNCZ7cTzn4KcF5ddsRPOW4oWLJM6/HG0MXcB7
         +pc0BxiBQXXihGDUog4Er0XNIDvZnZlb6MLeOZIJpXuNj723b845oRRW83Jzv013vw
         CvJyslAAtNRMAKO5H4A0Sbkhi/rWce3xyY+pUd8M=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8BIRWuM038829
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Sep 2019 13:27:32 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 11
 Sep 2019 13:27:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 11 Sep 2019 13:27:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8BIRVEN099700;
        Wed, 11 Sep 2019 13:27:31 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2] leds: lm3532: Fix optional led-max-microamp prop error handling
Date:   Wed, 11 Sep 2019 13:27:30 -0500
Message-ID: <20190911182730.22409-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix the error handling for the led-max-microamp property.
Need to check if the property is present and then if it is
retrieve the setting and its max boundary

Reported-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v2 - Changed full scale current check to use min function

 drivers/leds/leds-lm3532.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 62ace6698d25..a1742dc1f6fa 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -601,11 +601,15 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 			goto child_out;
 		}
 
-		ret = fwnode_property_read_u32(child, "led-max-microamp",
-					       &led->full_scale_current);
-
-		if (led->full_scale_current > LM3532_FS_CURR_MAX)
-			led->full_scale_current = LM3532_FS_CURR_MAX;
+		if (fwnode_property_present(child, "led-max-microamp")) {
+			if (fwnode_property_read_u32(child, "led-max-microamp",
+						     &led->full_scale_current))
+				dev_err(&priv->client->dev,
+					"Failed getting led-max-microamp\n");
+			else
+				min(led->full_scale_current,
+				    LM3532_FS_CURR_MAX);
+		}
 
 		if (led->mode == LM3532_BL_MODE_ALS) {
 			led->mode = LM3532_ALS_CTRL;
-- 
2.22.0.214.g8dca754b1e

