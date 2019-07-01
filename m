Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 462665BFB6
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2019 17:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728913AbfGAP0M (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jul 2019 11:26:12 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37860 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728801AbfGAP0L (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jul 2019 11:26:11 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61FQ9CS128106;
        Mon, 1 Jul 2019 10:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561994769;
        bh=jcXacZRIDTZo39MNg8v9Tu/Km84xK4Bnbq2hxYScm9Q=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=J470NWPbU1ZEBpdR8mKY7ZkrweV0Ne3oLivJ0f61WeXphlWAwEPq0afNOgKUuDnRZ
         xbb4VP1jJIA49qWc6apwslGBRxJ+kPy9V1IQ/hDnvIx+kLUUVy46b+AtqTNUF0OFgm
         lyyTxkEsEIhLOmAhumeXe8fExPnlNDaC2g5+sDC0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61FQ9KF068675
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 1 Jul 2019 10:26:09 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 10:26:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 10:26:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61FQ8VZ022373;
        Mon, 1 Jul 2019 10:26:08 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <dmurphy@ti.com>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH 2/2] leds: tlc591xx: Use the OF version of the LED registration function
Date:   Mon, 1 Jul 2019 17:26:02 +0200
Message-ID: <20190701152602.31716-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190701152602.31716-1-jjhiblot@ti.com>
References: <20190701152602.31716-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The driver parses the device-tree to identify which LED should be handled.
Since the information about the device node is known at this time, we can
provide the LED core with it. It may be useful later.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/leds/leds-tlc591xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 14e47ff44df5..6a2936c94b73 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -207,7 +207,7 @@ tlc591xx_probe(struct i2c_client *client,
 		led->led_no = idx++;
 		led->ldev.brightness_set_blocking = tlc591xx_brightness_set;
 		led->ldev.max_brightness = LED_FULL;
-		err = devm_led_classdev_register(dev, &led->ldev);
+		err = devm_of_led_classdev_register(dev, child, &led->ldev);
 		if (err < 0) {
 			dev_err(dev, "couldn't register LED %s\n",
 				led->ldev.name);
-- 
2.17.1

