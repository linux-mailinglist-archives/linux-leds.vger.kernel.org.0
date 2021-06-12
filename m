Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612243A4F17
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jun 2021 15:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbhFLN1t (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 12 Jun 2021 09:27:49 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59935 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbhFLN1t (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Jun 2021 09:27:49 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1ls3e0-0005WN-7j; Sat, 12 Jun 2021 13:25:48 +0000
From:   Colin King <colin.king@canonical.com>
To:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] leds: flash: Remove redundant initialization of variable ret
Date:   Sat, 12 Jun 2021 14:25:47 +0100
Message-Id: <20210612132547.58727-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read,
it is being updated later on. The assignment is redundant and can be
removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/led-class-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index 6eeb9effcf65..e4c4fd97bf30 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -92,7 +92,7 @@ static ssize_t flash_strobe_store(struct device *dev,
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
 	unsigned long state;
-	ssize_t ret = -EINVAL;
+	ssize_t ret;
 
 	mutex_lock(&led_cdev->led_access);
 
-- 
2.31.1

