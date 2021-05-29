Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800C6394AD9
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 08:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhE2G4Q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 02:56:16 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2459 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbhE2G4Q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 May 2021 02:56:16 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FsXK85wX2z66Vc;
        Sat, 29 May 2021 14:51:40 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 14:54:35 +0800
Received: from code-website.localdomain (10.175.127.227) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 14:54:34 +0800
From:   Luo Meng <luomeng12@huawei.com>
To:     <jansimon.moeller@gmx.de>, <pavel@ucw.cz>, <nathan@kernel.org>,
        <ndesaulniers@google.com>, <linux-leds@vger.kernel.org>,
        <luomeng12@huawei.com>
Subject: [PATCH] leds: remove unused variable
Date:   Sat, 29 May 2021 15:03:57 +0800
Message-ID: <20210529070357.2872533-1-luomeng12@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix the following clang warning:
drivers/leds/leds-blinkm.c:483:6: warning:
variable ‘ret’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Luo Meng <luomeng12@huawei.com>
---
 drivers/leds/leds-blinkm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index b4e1fdff4186..bd7d0d5cf3b6 100644
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
2.25.4

