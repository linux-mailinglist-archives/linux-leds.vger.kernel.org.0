Return-Path: <linux-leds+bounces-384-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F4C812A55
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 09:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A9981F218DF
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 08:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC081C6B0;
	Thu, 14 Dec 2023 08:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="jqjhhqiB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FFAD10B;
	Thu, 14 Dec 2023 00:29:51 -0800 (PST)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DF64012004E;
	Thu, 14 Dec 2023 11:29:49 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DF64012004E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1702542589;
	bh=IipliOBxVO1mB0P9vxh3aTZrhIFdLT6fPsP0SLsHsZA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=jqjhhqiB/+anaFc34B+FJmzHIV8CpFNjoCkCIDLydqBcwljVDX7AlrUWRGw8C9iAk
	 c/hrdk2fWtox+w01FdHzNqiZWln97DcN3LsgkgmRshr8SM+YgZrMdp33yi1aLlOXsl
	 9z/wSTD7oPG6nFov1jtJE9vcGDjNiybCu/SH1g1g/vSi7355/84FxUmJbJlXvF1sTf
	 pNiL+2zzyDVvhe/e8r26JKgMoot3PSQvbHNpv8RNwrlso9rMM/SgzvWHH8qmDC/vFK
	 8zjF6wj7e8a8qd0Uy/PzcGXn+zcLZujMsb+SDd3+URo1yTrM3f1GmmoABZO/2XwSY3
	 tKKmkI8uTUniA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Dec 2023 11:29:49 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Dec 2023 11:29:49 +0300
From: George Stark <gnstark@salutedevices.com>
To: <andy.shevchenko@gmail.com>, <pavel@ucw.cz>, <lee@kernel.org>,
	<vadimp@nvidia.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <hdegoede@redhat.com>,
	<mazziesaccount@gmail.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<will@kernel.org>, <longman@redhat.com>, <boqun.feng@gmail.com>,
	<nikitos.tr@gmail.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>
Subject: [PATCH v3 11/11] leds: powernv: use LED_RETAIN_AT_SHUTDOWN flag for leds
Date: Thu, 14 Dec 2023 11:29:40 +0300
Message-ID: <20231214082940.2718303-7-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214082940.2718303-1-gnstark@salutedevices.com>
References: <20231214082940.2718303-1-gnstark@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 182104 [Dec 14 2023]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/14 06:13:00 #22683038
X-KSMG-AntiVirus-Status: Clean, skipped

This driver wants to keep its LEDs state after module is removed
and implemented it in its own way. LED subsystem supports dedicated
flag LED_RETAIN_AT_SHUTDOWN for the same purpose so use the flag
instead of custom implementation.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 drivers/leds/leds-powernv.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 743e2cdd0891..018ec933ac10 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -30,15 +30,6 @@ static const struct led_type_map led_type_map[] = {
 };
 
 struct powernv_led_common {
-	/*
-	 * By default unload path resets all the LEDs. But on PowerNV
-	 * platform we want to retain LED state across reboot as these
-	 * are controlled by firmware. Also service processor can modify
-	 * the LEDs independent of OS. Hence avoid resetting LEDs in
-	 * unload path.
-	 */
-	bool		led_disabled;
-
 	/* Max supported LED type */
 	__be64		max_led_type;
 
@@ -178,10 +169,6 @@ static int powernv_brightness_set(struct led_classdev *led_cdev,
 	struct powernv_led_common *powernv_led_common = powernv_led->common;
 	int rc;
 
-	/* Do not modify LED in unload path */
-	if (powernv_led_common->led_disabled)
-		return 0;
-
 	mutex_lock(&powernv_led_common->lock);
 	rc = powernv_led_set(powernv_led, value);
 	mutex_unlock(&powernv_led_common->lock);
@@ -225,6 +212,14 @@ static int powernv_led_create(struct device *dev,
 
 	powernv_led->cdev.brightness_set_blocking = powernv_brightness_set;
 	powernv_led->cdev.brightness_get = powernv_brightness_get;
+	/*
+	 * By default unload path resets all the LEDs. But on PowerNV
+	 * platform we want to retain LED state across reboot as these
+	 * are controlled by firmware. Also service processor can modify
+	 * the LEDs independent of OS. Hence avoid resetting LEDs in
+	 * unload path.
+	 */
+	powernv_led->cdev.flags = LED_RETAIN_AT_SHUTDOWN;
 	powernv_led->cdev.brightness = LED_OFF;
 	powernv_led->cdev.max_brightness = LED_FULL;
 
@@ -313,9 +308,7 @@ static int powernv_led_remove(struct platform_device *pdev)
 {
 	struct powernv_led_common *powernv_led_common;
 
-	/* Disable LED operation */
 	powernv_led_common = platform_get_drvdata(pdev);
-	powernv_led_common->led_disabled = true;
 
 	/* Destroy lock */
 	mutex_destroy(&powernv_led_common->lock);
-- 
2.25.1


