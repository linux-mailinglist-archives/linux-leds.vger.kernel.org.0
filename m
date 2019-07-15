Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0FE169579
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 16:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388840AbfGOO6W (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 10:58:22 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:42089 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390903AbfGOO5o (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 10:57:44 -0400
Received: from orion.localdomain ([95.118.111.244]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MOzKk-1i5nCR2tVE-00PLVd; Mon, 15 Jul 2019 16:57:39 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: [PATCH 4/6] leds: apu: drop profile field from priv data
Date:   Mon, 15 Jul 2019 16:57:31 +0200
Message-Id: <1563202653-20994-5-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1563202653-20994-1-git-send-email-info@metux.net>
References: <1563202653-20994-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:/XuT5C5+ZAd8EZV57RjhC1vSM1n2EnuzZFECLA56V3Uz7rBFADh
 rS7H91OCIwDT+ngUcqwzWyR6poASpCtFBY5cGLpF2ApYS7Aunsxcg0HOli3DY0ayinJFpX1
 uFSxVzGegIT4xLsI1+HJrYSqJb/RNlMPyogNFlN7zg0kEG4YHOgtI8ycdPRK17xXXEBDl3v
 LqFs+TpB4yuoy29lNA10w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:t/j9D14XzVI=:QxMs7OptdsJotNbcM77P2W
 B4SZ2Yc5dqRJcyKXwEqUyvY5mDSOYwK/cCUUq/ClUPRu2lHXDczvahn2fF5P2/8LTGW41RkTR
 49CASclXakqezdHiPOO/glwmGnQ56O8qn2P9YYAWgiUTKyQE42reeW0soTm0cd6ntkhInLIXg
 OJt39VXCEPtDE4P2aFs2jRLePbMYLPob5Hr5+pQsyTxDerwY2sP+Ek8VMh9zOt5GGP+OjBhj8
 rNPw59as+n7g/k277cH54gnZUdTOyTHEruW8MJpw09I3zfiO12WVfIDJyp/I6YtOhW5qCe5Sa
 3CRoPkFdi59EyFxZaaH3DOvaDvSUehv0O7rsqha0wp9Xpe7xg7sHvBvviaEbCUovfZXVXvwYN
 u3OYtui+C0rpUxxMU2SRr5w5R+tiKgWmS/wCByLH0nND8OcttaiaCxT7HVBH3AERXk8LR00hj
 O6MyKHl4KMEonUXO9Kn29FNelFLHpzVNY1Xk1Li+KVSbIsSVRiz6EJwQy92d1bAtv4ER4Hkpz
 EaYkmDsa0UxEWPw9SSbBOLWaDmumgZGBGGJGXK0bYH6Y/5Fekep3ONRbKk/2mmJ0PIuKx5r1q
 CU5qrTTa/XBgzXkGSP1HL2+MfYdSDU88+xSQxUqMeZirFmxSqscYTfQweZ1M3tZXL6Friouxd
 HQGHOo8dslOxa9a8pO5jkkbsjTt6ou5Qj7SVdAZZKIWUh8X9ZHVRFtKXjySFe/wImdAy5o3rB
 xGCCtQhIs159zT20doOn1ttwZ9Hu+N4NFieJ5Q==
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

As this driver now only supports the APU1 boards, we don't need
to handle profiles anymore and just can use the only one global
array directly.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/leds/leds-apu.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
index f79146c..451cb9f 100644
--- a/drivers/leds/leds-apu.c
+++ b/drivers/leds/leds-apu.c
@@ -69,8 +69,6 @@ struct apu_led_profile {
 struct apu_led_pdata {
 	struct platform_device *pdev;
 	struct apu_led_priv *pled;
-	const struct apu_led_profile *profile;
-	int num_led_instances;
 	spinlock_t lock;
 };
 
@@ -109,24 +107,24 @@ static int apu_led_config(struct device *dev, struct apu_led_pdata *apuld)
 	int err;
 
 	apu_led->pled = devm_kcalloc(dev,
-		apu_led->num_led_instances, sizeof(struct apu_led_priv),
+		ARRAY_SIZE(apu1_led_profile), sizeof(struct apu_led_priv),
 		GFP_KERNEL);
 
 	if (!apu_led->pled)
 		return -ENOMEM;
 
-	for (i = 0; i < apu_led->num_led_instances; i++) {
+	for (i = 0; i < ARRAY_SIZE(apu1_led_profile); i++) {
 		struct apu_led_priv *pled = &apu_led->pled[i];
 		struct led_classdev *led_cdev = &pled->cdev;
 
-		led_cdev->name = apu_led->profile[i].name;
-		led_cdev->brightness = apu_led->profile[i].brightness;
+		led_cdev->name = apu1_led_profile[i].name;
+		led_cdev->brightness = apu1_led_profile[i].brightness;
 		led_cdev->max_brightness = 1;
 		led_cdev->flags = LED_CORE_SUSPENDRESUME;
 		led_cdev->brightness_set = apu1_led_brightness_set;
 
 		pled->param.addr = devm_ioremap(dev,
-				apu_led->profile[i].offset, APU1_IOSIZE);
+				apu1_led_profile[i].offset, APU1_IOSIZE);
 		if (!pled->param.addr) {
 			err = -ENOMEM;
 			goto error;
@@ -136,7 +134,7 @@ static int apu_led_config(struct device *dev, struct apu_led_pdata *apuld)
 		if (err)
 			goto error;
 
-		apu1_led_brightness_set(led_cdev, apu_led->profile[i].brightness);
+		apu1_led_brightness_set(led_cdev, apu1_led_profile[i].brightness);
 	}
 
 	return 0;
@@ -157,9 +155,6 @@ static int __init apu_led_probe(struct platform_device *pdev)
 
 	apu_led->pdev = pdev;
 
-	apu_led->profile = apu1_led_profile;
-	apu_led->num_led_instances = ARRAY_SIZE(apu1_led_profile);
-
 	spin_lock_init(&apu_led->lock);
 	return apu_led_config(&pdev->dev, apu_led);
 }
@@ -204,7 +199,7 @@ static void __exit apu_led_exit(void)
 {
 	int i;
 
-	for (i = 0; i < apu_led->num_led_instances; i++)
+	for (i = 0; i < ARRAY_SIZE(apu1_led_profile); i++)
 		led_classdev_unregister(&apu_led->pled[i].cdev);
 
 	platform_device_unregister(apu_led->pdev);
-- 
1.9.1

