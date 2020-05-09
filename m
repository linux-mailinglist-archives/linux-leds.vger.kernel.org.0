Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0857D1CBE0F
	for <lists+linux-leds@lfdr.de>; Sat,  9 May 2020 08:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgEIGbN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 9 May 2020 02:31:13 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:44698 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726115AbgEIGbN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 9 May 2020 02:31:13 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 93F6381CBEAC0A11A6BE;
        Sat,  9 May 2020 14:31:09 +0800 (CST)
Received: from euler.huawei.com (10.175.101.6) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Sat, 9 May 2020 14:30:58 +0800
From:   Hongbo Yao <yaohongbo@huawei.com>
To:     <jansimon.moeller@gmx.de>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>
CC:     <yaohongbo@huawei.com>, <chenzhou10@huawei.com>,
        <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
Subject: [PATCH -next] leds: blinkm: remove set but not used variable
Date:   Sat, 9 May 2020 22:23:57 +0800
Message-ID: <20200509142357.33702-1-yaohongbo@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:
drivers/leds/leds-blinkm.c:483:6: warning: variable ‘ret’ set
but not used [-Wunused-but-set-variable]
  int ret;

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Hongbo Yao <yaohongbo@huawei.com>
---
 drivers/leds/leds-blinkm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index e11fe1788242..a493ee0e0fc7 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -480,9 +480,8 @@ static int blinkm_led_blue_set(struct led_classdev *led_cdev,
 
 static void blinkm_init_hw(struct i2c_client *client)
 {
-	int ret;
-	ret = blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
-	ret = blinkm_transfer_hw(client, BLM_GO_RGB);
+	blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
+	blinkm_transfer_hw(client, BLM_GO_RGB);
 }
 
 static int blinkm_test_run(struct i2c_client *client)
-- 
2.17.1

