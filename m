Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61E2B69576
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 16:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391373AbfGOO5p (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 10:57:45 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:41069 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391187AbfGOO5o (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 10:57:44 -0400
Received: from orion.localdomain ([95.118.111.244]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MnJdC-1iCEHn0LUC-00jKG5; Mon, 15 Jul 2019 16:57:39 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: [PATCH 2/6] leds: apu: drop enum_apu_led_platform_types
Date:   Mon, 15 Jul 2019 16:57:29 +0200
Message-Id: <1563202653-20994-3-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1563202653-20994-1-git-send-email-info@metux.net>
References: <1563202653-20994-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:2XVHfQn9y9/unTfgQQX3BK6lbqoCKEWS50tFTMvKjoKLtPqkHCv
 pQP7y9J/DN3ItT73E+qy1z0Uffix6QTPqM7V228r6L4qj8Ox8kpi2P/opvRE6hZ0k0lhLlK
 wHygYY4raTR4t/47Hjx31cf5+ayYuUAeem8v0Cr2pp+dbiXlXPlsj4kotqAQFbHFST+QEMa
 Imv2Nkpc2JBbJDqrIx5cQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dqx88A5qMTA=:1S4046MfPD8y/IpFSx2c3H
 /8ObSM67QTcUhEm+m9wLxrdAPfS+5BKoDu4cVnerdrigzMZe7ENSuFGCJ0+zIgQAni7YMyGsC
 gJKPc+I8NlRlRImTXQ13qYccs7a7Ss1908nLXLwOEeTrYVsgnPNvbuWHGqiNeTnPYfncXIsf8
 qFVUZGmY/R3MM2V1EFcyr3coAPPhCqsYjzq5q55KTmNncgYKssnAgrSqriBVgS7vUsKZX5vn/
 K33yCnXrJ0ufLce+ldnnstSx+GVtZ/EKUBV87O4+ERuYI8samehVPKcRjvBY8wNVtyCLkjCrb
 yo8ovK1CXt8njgK1PHM2ptL5D9cvTrwAvWHRDjiz+hqu2Zs1a/1LbFXflz3bYFqnzG/uzRa2i
 /Jz/mkhnuXU3+YtbIUrclIt6v2DDKQlMKSVpsv0HsIiarNYF3UhMeJUh7wdJarFmv5tJJ7QT8
 Hr9FpHURuTH9PizLThX/MAFa5vhjRfnOrwuGWy2j8ovrneLEL9skGMb7iflUckgUSG8gn6vQk
 mPdX90mffX66XDG4UGE45L0QedcrjZl9qGkxeSTST4EgDWUCE4wmseOF2xXFGX4AtB+35K90/
 FsKc5Cfuz9I2MDLsBvASLa1z54inBD/xk8zuQrccvuBK3I9HVEon/R5tFrdhHkIYlrrkLxrqp
 BRtKEPE6UXyrXtebKNpskNsns0bbLE6ArG1qA5ZMvSgVv8TJDStGW0e4iiNE4+sHhpZwaSeQM
 /xOrWoborgoj7Ox/SoDtfsAy5QmUIx8vyKPolQ==
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

As this driver now only supports the APU1 boards, we don't need
to differenciate between board types anymore. Therefore optimize
away the now obsolete code.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/leds/leds-apu.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
index 140093a..37b054f 100644
--- a/drivers/leds/leds-apu.c
+++ b/drivers/leds/leds-apu.c
@@ -66,16 +66,10 @@ struct apu_led_profile {
 	unsigned long offset; /* for devm_ioremap */
 };
 
-/* Supported platform types */
-enum apu_led_platform_types {
-	APU1_LED_PLATFORM,
-};
-
 struct apu_led_pdata {
 	struct platform_device *pdev;
 	struct apu_led_priv *pled;
 	const struct apu_led_profile *profile;
-	enum apu_led_platform_types platform;
 	int num_led_instances;
 	int iosize; /* for devm_ioremap() */
 	spinlock_t lock;
@@ -130,8 +124,7 @@ static int apu_led_config(struct device *dev, struct apu_led_pdata *apuld)
 		led_cdev->brightness = apu_led->profile[i].brightness;
 		led_cdev->max_brightness = 1;
 		led_cdev->flags = LED_CORE_SUSPENDRESUME;
-		if (apu_led->platform == APU1_LED_PLATFORM)
-			led_cdev->brightness_set = apu1_led_brightness_set;
+		led_cdev->brightness_set = apu1_led_brightness_set;
 
 		pled->param.addr = devm_ioremap(dev,
 				apu_led->profile[i].offset, apu_led->iosize);
@@ -144,7 +137,7 @@ static int apu_led_config(struct device *dev, struct apu_led_pdata *apuld)
 		if (err)
 			goto error;
 
-		led_cdev->brightness_set(led_cdev, apu_led->profile[i].brightness);
+		apu1_led_brightness_set(led_cdev, apu_led->profile[i].brightness);
 	}
 
 	return 0;
@@ -166,7 +159,6 @@ static int __init apu_led_probe(struct platform_device *pdev)
 	apu_led->pdev = pdev;
 
 	apu_led->profile = apu1_led_profile;
-	apu_led->platform = APU1_LED_PLATFORM;
 	apu_led->num_led_instances = ARRAY_SIZE(apu1_led_profile);
 	apu_led->iosize = APU1_IOSIZE;
 
-- 
1.9.1

