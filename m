Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAC09C88D6
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 14:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfJBMkI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 08:40:08 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54006 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfJBMkI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 08:40:08 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92Ce5ih014742;
        Wed, 2 Oct 2019 07:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570020005;
        bh=dkmFEQUZc03Vkc8FS2ObjTj3FAgduHGfTpnaLbtgfac=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=xW2stUqfGpSlD32dyqxV/tt3Aj8CrWcRCBMW7urDeNJFIOPVXF+ECtodvccrzV7L2
         4eOcDKMJoBkLuB3zx9d3z1EpfIe4Gccgpyn/4ejpjbgCw1wBEAKFjRp78r92Vr2g9F
         KMBGxoPh+YD0eN3nE1sgerHnlQglib/UA6MMKIPs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92Ce40P117296
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 07:40:04 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 07:39:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 07:40:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92Ce48C002060;
        Wed, 2 Oct 2019 07:40:04 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 5/6] leds: core: Fix devm_classdev_match to reference correct structure
Date:   Wed, 2 Oct 2019 07:40:41 -0500
Message-ID: <20191002124042.25593-5-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191002124042.25593-1-dmurphy@ti.com>
References: <20191002124042.25593-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix the devm_classdev_match pointer initilization to the correct
structure type.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/led-class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 3f04334d59ee..438774315e6c 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -403,7 +403,7 @@ EXPORT_SYMBOL_GPL(devm_led_classdev_register_ext);
 
 static int devm_led_classdev_match(struct device *dev, void *res, void *data)
 {
-	struct led_cdev **p = res;
+	struct led_classdev **p = res;
 
 	if (WARN_ON(!p || !*p))
 		return 0;
-- 
2.22.0.214.g8dca754b1e

