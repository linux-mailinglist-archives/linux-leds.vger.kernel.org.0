Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD348270C45
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 11:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgISJqg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 05:46:36 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:13724 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726097AbgISJqg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 05:46:36 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id AC6DB9C4F879D1014F4E;
        Sat, 19 Sep 2020 17:46:33 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Sat, 19 Sep 2020
 17:46:25 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH -next] leds: pca9532 - simplify the return expression of pca9532_remove
Date:   Sat, 19 Sep 2020 18:08:53 +0800
Message-ID: <20200919100853.1639215-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/leds/leds-pca9532.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 7d515d5e57bd..88d2edf285c2 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -545,13 +545,8 @@ static int pca9532_probe(struct i2c_client *client,
 static int pca9532_remove(struct i2c_client *client)
 {
 	struct pca9532_data *data = i2c_get_clientdata(client);
-	int err;
 
-	err = pca9532_destroy_devices(data, data->chip_info->num_leds);
-	if (err)
-		return err;
-
-	return 0;
+	return pca9532_destroy_devices(data, data->chip_info->num_leds);
 }
 
 module_i2c_driver(pca9532_driver);
-- 
2.25.1

