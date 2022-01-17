Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72AA2490712
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jan 2022 12:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239047AbiAQLVU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Jan 2022 06:21:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59291 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236242AbiAQLVT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 17 Jan 2022 06:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642418479;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AyH60sfTvvph6+RX0SU8Ph5zVQEHEPB8dqcptx1BpjU=;
        b=Pwc+2uH5Dk/fGMCrhs6MrC3EaNYnr9TPx1oFvYQr66Bf8AjE4Iv2SXyNpTwBVXUdHIOuxL
        bxFV4wVJcFbqzO237BKUAww7Gomqgb0AoY10JwOOnjSntaor0wEyrkq3jG7Bs3ZXAURZbS
        ovhY1a7y4ZCB470zULij+6wxyrJSfZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-jVrrHo_8Ojixs6ep_Ta8Qg-1; Mon, 17 Jan 2022 06:21:17 -0500
X-MC-Unique: jVrrHo_8Ojixs6ep_Ta8Qg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B24AD1934100;
        Mon, 17 Jan 2022 11:21:16 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.194])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 99FBC752C9;
        Mon, 17 Jan 2022 11:21:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org,
        Henning Schild <henning.schild@siemens.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 2/2] leds: simatic-ipc-leds: Don't directly deref ioremap_resource() returned ptr
Date:   Mon, 17 Jan 2022 12:21:09 +0100
Message-Id: <20220117112109.215695-2-hdegoede@redhat.com>
In-Reply-To: <20220117112109.215695-1-hdegoede@redhat.com>
References: <20220117112109.215695-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Sparse (rightly) currently gives the following warning:

drivers/leds/simple/simatic-ipc-leds.c:155:40:
 sparse: sparse: incorrect type in assignment (different address spaces)
 expected void *static [toplevel] simatic_ipc_led_memory
 got void [noderef] __iomem *

Fix this by changing the type of simatic_ipc_led_memory to void __iomem *
and use readl()/writel() to access it.

Cc: Henning Schild <henning.schild@siemens.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note this is not tested on actual hw, since I do not have the hw in question
---
 drivers/leds/simple/simatic-ipc-leds.c | 32 +++++++++++++++-----------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/simple/simatic-ipc-leds.c b/drivers/leds/simple/simatic-ipc-leds.c
index 179110448659..078d43f5ba38 100644
--- a/drivers/leds/simple/simatic-ipc-leds.c
+++ b/drivers/leds/simple/simatic-ipc-leds.c
@@ -41,7 +41,7 @@ static struct simatic_ipc_led simatic_ipc_leds_io[] = {
 /* the actual start will be discovered with PCI, 0 is a placeholder */
 static struct resource simatic_ipc_led_mem_res = DEFINE_RES_MEM_NAMED(0, SZ_4K, KBUILD_MODNAME);
 
-static void *simatic_ipc_led_memory;
+static void __iomem *simatic_ipc_led_memory;
 
 static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
 	{0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
@@ -92,21 +92,22 @@ static void simatic_ipc_led_set_mem(struct led_classdev *led_cd,
 				    enum led_brightness brightness)
 {
 	struct simatic_ipc_led *led = cdev_to_led(led_cd);
+	void __iomem *reg = simatic_ipc_led_memory + led->value;
+	u32 val;
 
-	u32 *p;
-
-	p = simatic_ipc_led_memory + led->value;
-	*p = (*p & ~1) | (brightness == LED_OFF);
+	val = readl(reg);
+	val = (val & ~1) | (brightness == LED_OFF);
+	writel(val, reg);
 }
 
 static enum led_brightness simatic_ipc_led_get_mem(struct led_classdev *led_cd)
 {
 	struct simatic_ipc_led *led = cdev_to_led(led_cd);
+	void __iomem *reg = simatic_ipc_led_memory + led->value;
+	u32 val;
 
-	u32 *p;
-
-	p = simatic_ipc_led_memory + led->value;
-	return (*p & 1) ? LED_OFF : led_cd->max_brightness;
+	val = readl(reg);
+	return (val & 1) ? LED_OFF : led_cd->max_brightness;
 }
 
 static int simatic_ipc_leds_probe(struct platform_device *pdev)
@@ -116,8 +117,9 @@ static int simatic_ipc_leds_probe(struct platform_device *pdev)
 	struct simatic_ipc_led *ipcled;
 	struct led_classdev *cdev;
 	struct resource *res;
+	void __iomem *reg;
 	int err, type;
-	u32 *p;
+	u32 val;
 
 	switch (plat->devmode) {
 	case SIMATIC_IPC_DEVICE_227D:
@@ -157,11 +159,13 @@ static int simatic_ipc_leds_probe(struct platform_device *pdev)
 			return PTR_ERR(simatic_ipc_led_memory);
 
 		/* initialize power/watchdog LED */
-		p = simatic_ipc_led_memory + 0x500 + 0x1D8; /* PM_WDT_OUT */
-		*p = (*p & ~1);
-		p = simatic_ipc_led_memory + 0x500 + 0x1C0; /* PM_BIOS_BOOT_N */
-		*p = (*p | 1);
+		reg = simatic_ipc_led_memory + 0x500 + 0x1D8; /* PM_WDT_OUT */
+		val = readl(reg);
+		writel(val & ~1, reg);
 
+		reg = simatic_ipc_led_memory + 0x500 + 0x1C0; /* PM_BIOS_BOOT_N */
+		val = readl(reg);
+		writel(val | 1, reg);
 		break;
 	default:
 		return -ENODEV;
-- 
2.33.1

