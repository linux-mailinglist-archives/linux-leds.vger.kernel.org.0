Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60A009191B
	for <lists+linux-leds@lfdr.de>; Sun, 18 Aug 2019 21:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfHRTAI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 18 Aug 2019 15:00:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42774 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfHRTAH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 18 Aug 2019 15:00:07 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hzQPM-00084Q-87; Sun, 18 Aug 2019 19:00:04 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] leds: trigger: timer: remove redundant assignment to ret
Date:   Sun, 18 Aug 2019 20:00:03 +0100
Message-Id: <20190818190004.15833-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable ret is initialized to a value that is never read and it
is re-assigned later. The initialization is redundant and can be
removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/trigger/ledtrig-timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
index 34a68604c46c..b4688d1d9d2b 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -28,7 +28,7 @@ static ssize_t led_delay_on_store(struct device *dev,
 {
 	struct led_classdev *led_cdev = led_trigger_get_led(dev);
 	unsigned long state;
-	ssize_t ret = -EINVAL;
+	ssize_t ret;
 
 	ret = kstrtoul(buf, 10, &state);
 	if (ret)
@@ -53,7 +53,7 @@ static ssize_t led_delay_off_store(struct device *dev,
 {
 	struct led_classdev *led_cdev = led_trigger_get_led(dev);
 	unsigned long state;
-	ssize_t ret = -EINVAL;
+	ssize_t ret;
 
 	ret = kstrtoul(buf, 10, &state);
 	if (ret)
-- 
2.20.1

