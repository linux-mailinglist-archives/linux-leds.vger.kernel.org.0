Return-Path: <linux-leds+bounces-1249-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CD687B993
	for <lists+linux-leds@lfdr.de>; Thu, 14 Mar 2024 09:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EDC71F2185A
	for <lists+linux-leds@lfdr.de>; Thu, 14 Mar 2024 08:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCEC6E616;
	Thu, 14 Mar 2024 08:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="FVYF3nyJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2FD6BB46;
	Thu, 14 Mar 2024 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710405985; cv=none; b=T1jR1GMlFjDBewblNg0DvE0LBM/JhlptkxFU1eognE0XjQbEq/oP0LK3ju3K3Qf7F/aiCTLgo5yIO+YgCc/0WD0O9CEgIugV2RLeVVMsBemQn5z0Efau08GlB6fwaF5ee8J6QdfnSCs61J9dbzR1VI0gzHYr/nVI/9kNd9EUhjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710405985; c=relaxed/simple;
	bh=vUFUEsCwm/+WnjI8Fz9CnNUsoSwU+TtLeBEcKA5W7mk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bf8Od1wncmEPY20zAtbggmhaTfawIIxevDirUR97AZ9SrQvpY3EK5IoT7n00mY5ZGQ9E9fpJ/m/+cRnqPqinN/HsasCT7n7swVsMMi4/UKdJJL6/m0ml504iZz8RyA8qroZq1iyMZoSWpvhChikJdvfr306gg6yYZejQokMS6SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=FVYF3nyJ; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B4321120017;
	Thu, 14 Mar 2024 11:46:15 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B4321120017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710405975;
	bh=kK6WfysHnoHnPx6m7g6/YcvxmY15e9MkbOzMlx2Ecms=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=FVYF3nyJFVV8nqcHI1kM0ThJpq2TvXKVhERwcShPVUnyXw85/EPQPFF6AusH6DKjN
	 Y6lu3+hVjI+RjS7nMswAQKVWxvkYBJfI+CyQuB+Dm4OhkKHA7/AdfoszjABQEEEt8R
	 8kDHRNB/XWd/IUgzh2eX0bUj+bqWftT0RNRJONNnhvUBvtlaudDEIA8XOKD3gDjlwL
	 WGghUGf22kf4Np1AVi3Dbh277kn2fVQqKgzkx/v27iTeV0IIwmtexOXcMe4XhuGXif
	 FjmDWeNiBbv0Y/f6g3A/plsdI5o+NoHlq/TBWABhL67QN/5foA3w5imRuCQhPrcEYs
	 SQ12W1jYMvucg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Mar 2024 11:46:15 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Mar 2024 11:46:15 +0300
From: George Stark <gnstark@salutedevices.com>
To: <andy.shevchenko@gmail.com>, <pavel@ucw.cz>, <lee@kernel.org>,
	<vadimp@nvidia.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <hdegoede@redhat.com>,
	<mazziesaccount@gmail.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<will@kernel.org>, <longman@redhat.com>, <boqun.feng@gmail.com>,
	<nikitos.tr@gmail.com>, <marek.behun@nic.cz>, <kabel@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>
Subject: [PATCH v6 9/9] leds: powernv: use LED_RETAIN_AT_SHUTDOWN flag for leds
Date: Thu, 14 Mar 2024 11:45:31 +0300
Message-ID: <20240314084531.1935545-10-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240314084531.1935545-1-gnstark@salutedevices.com>
References: <20240314084531.1935545-1-gnstark@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
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
index 4f01acb75727..9c6fb7d6e0e7 100644
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
 
@@ -313,9 +308,7 @@ static void powernv_led_remove(struct platform_device *pdev)
 {
 	struct powernv_led_common *powernv_led_common;
 
-	/* Disable LED operation */
 	powernv_led_common = platform_get_drvdata(pdev);
-	powernv_led_common->led_disabled = true;
 
 	/* Destroy lock */
 	mutex_destroy(&powernv_led_common->lock);
-- 
2.25.1


