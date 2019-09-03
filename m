Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B10D1A68EB
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2019 14:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729083AbfICMuc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Sep 2019 08:50:32 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:52988 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728587AbfICMuc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 3 Sep 2019 08:50:32 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 3F9661A24466;
        Tue,  3 Sep 2019 15:50:29 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     linux-leds@vger.kernel.org
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH 2/2] leds: ns2: Fix wrong boolean expression
Date:   Tue,  3 Sep 2019 15:50:20 +0300
Message-Id: <20190903125020.20482-2-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903125020.20482-1-oleg@kaa.org.ua>
References: <20190903125020.20482-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Error was detected by PVS-Studio:
V792 The '__gpio_cansleep' function located to the right of
the operator '|' will be called regardless of the value of
the left operand. Perhaps, it is better to use '||'.

Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
 drivers/leds/leds-ns2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 7c500dfdcfa3..8ae60133a15e 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -205,7 +205,7 @@ create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
 	led_dat->cdev.groups = ns2_led_groups;
 	led_dat->cmd = template->cmd;
 	led_dat->slow = template->slow;
-	led_dat->can_sleep = gpio_cansleep(led_dat->cmd) |
+	led_dat->can_sleep = gpio_cansleep(led_dat->cmd) &&
 				gpio_cansleep(led_dat->slow);
 	if (led_dat->can_sleep)
 		led_dat->cdev.brightness_set_blocking = ns2_led_set_blocking;
-- 
2.21.0

