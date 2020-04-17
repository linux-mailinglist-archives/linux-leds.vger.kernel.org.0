Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C231ADC48
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2020 13:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730316AbgDQLiI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Apr 2020 07:38:08 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40732 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730267AbgDQLiI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Apr 2020 07:38:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03HBc3rY116827;
        Fri, 17 Apr 2020 06:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587123483;
        bh=yBJEl/0Oda/rxnUe6nInwW0JQFXAi4bCO+nfJPxMYec=;
        h=From:To:CC:Subject:Date;
        b=tzynctNf0KNlaokdABEj8VM9vH2DLz77NVmLsraWzkqh06H7TwTF/tn0DRvOh8QXg
         ckrgUCSEAMKUcBSqpf++vaf3Opr9TAq0Dgsxdxai3SLLbwtfBtu88JbdtqdwUDR0/r
         XF5P6DYZqB3CrU96ke8AjjYi68Nmc6TBow1AgPYo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03HBc2Wr126853
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 17 Apr 2020 06:38:03 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Apr 2020 06:38:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Apr 2020 06:38:03 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HBc1lN020609;
        Fri, 17 Apr 2020 06:38:01 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        <linux-leds@vger.kernel.org>
CC:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] leds: tlc591xxt: hide error on EPROBE_DEFER
Date:   Fri, 17 Apr 2020 14:37:58 +0300
Message-ID: <20200417113758.24924-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

If devm_led_classdev_register_ext() fails with EPROBE_DEFER, we get:

tlc591xx 0-0040: couldn't register LED (null)

Only print the error if the error is something else than EPROBE_DEFER.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/leds/leds-tlc591xx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index a8911ebd30e5..0929f1275814 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -214,8 +214,9 @@ tlc591xx_probe(struct i2c_client *client,
 		err = devm_led_classdev_register_ext(dev, &led->ldev,
 						     &init_data);
 		if (err < 0) {
-			dev_err(dev, "couldn't register LED %s\n",
-				led->ldev.name);
+			if (err != -EPROBE_DEFER)
+				dev_err(dev, "couldn't register LED %s\n",
+					led->ldev.name);
 			return err;
 		}
 	}
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

