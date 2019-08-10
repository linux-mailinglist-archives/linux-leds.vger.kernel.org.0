Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF2A18876D
	for <lists+linux-leds@lfdr.de>; Sat, 10 Aug 2019 02:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfHJA7D (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 9 Aug 2019 20:59:03 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:46551 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726022AbfHJA7D (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 9 Aug 2019 20:59:03 -0400
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Fri, 09 Aug 2019 20:59:03 EDT
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Aug 2019 17:52:58 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg04-sd.qualcomm.com with ESMTP; 09 Aug 2019 17:52:58 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 9CEA7435F; Fri,  9 Aug 2019 17:52:58 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH 1/2] leds: Add flag to keep trigger always
Date:   Fri,  9 Aug 2019 17:52:46 -0700
Message-Id: <1565398367-11811-1-git-send-email-gurus@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Subbaraman Narayanamurthy <subbaram@codeaurora.org>

Commit 0013b23d66a2768f5babbb0ea9f03ab067a990d8 ("leds: disable triggers
on brightness set") removes the trigger on an LED class device when
brightness is set to 0. However, there are some LED class devices which
need the trigger not to be removed. In a use case like camera flash,
camera flash driver passes in a trigger device to LED class driver. If
the trigger is removed when the brightness is set to 0, this will affect
the clients using those triggers. Hence add a flag to always keep the
trigger even when brightness is set to 0.

Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 drivers/leds/led-class.c | 2 +-
 include/linux/leds.h     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index d231240..13c28d1 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -52,7 +52,7 @@ static ssize_t brightness_store(struct device *dev,
 	if (ret)
 		goto unlock;
 
-	if (state == LED_OFF)
+	if (state == LED_OFF && !(led_cdev->flags & LED_KEEP_TRIGGER))
 		led_trigger_remove(led_cdev);
 	led_set_brightness(led_cdev, state);
 	flush_work(&led_cdev->set_brightness_work);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index d101fd1..e079a22 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -73,6 +73,7 @@ struct led_classdev {
 #define LED_BRIGHT_HW_CHANGED	BIT(21)
 #define LED_RETAIN_AT_SHUTDOWN	BIT(22)
 #define LED_INIT_DEFAULT_TRIGGER BIT(23)
+#define LED_KEEP_TRIGGER	BIT(24)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

