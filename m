Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 603EF15DB71
	for <lists+linux-leds@lfdr.de>; Fri, 14 Feb 2020 16:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgBNPs0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Feb 2020 10:48:26 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35093 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728859AbgBNPs0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Feb 2020 10:48:26 -0500
Received: by mail-pg1-f193.google.com with SMTP id v23so1749922pgk.2
        for <linux-leds@vger.kernel.org>; Fri, 14 Feb 2020 07:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=m6NevJCZ5yqgRxrMSZcxlk/RLIITNmWvO16cVlHH9lA=;
        b=fso/ypSCziPPNILx9l2PgFvI957+9QfhCf+G9xtFqeynt4hah4v739XGhh3cr8l0lo
         tdqmMtgAY4eOXb4ULZcvcFY1W4PNla2OC5GtGuUtXUofUabC4WLrC4znhbVFo+e+TOAZ
         FMdTZs9ca5wFIrrC2xtUHGkoT1smeRyfLuMyCXuYFzSlQx98ucDsfW2TfREmYgCKNsRQ
         UdAZt2IYy+aX7CtsG40ob5LzeiPWsL8AOWVt+15ZmZP6RbszwIP/tama2QtJ0Xnb9OzB
         iDQp/fiWVn0nUtd0nwK7cPYmKScRJ1wPgUwxUfzLVtGg/lmqh2xOOeQO+NDIquHo8FNE
         wbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=m6NevJCZ5yqgRxrMSZcxlk/RLIITNmWvO16cVlHH9lA=;
        b=mxN0INEaSwBFHkpK9em+kz0mnSOoLM9VDtPZiOydINIspMrewWGBV/dbN5Ph5JnHTq
         nGcrN5B6N9A5GshVMT2yzWL0ekZgWBA2pzGkGPsKezELdC0bHbeTZNuDxX3gS2MipIQs
         k4MpGe56/UJILgXW350HZLotUo1/S29CiiWKGT6g+X9AmsPR9bPMVvVso+Rk8ue7U+JA
         VyegCqwhicob2JVZmzztq14FjTfCTaELZllvdRJPwX5TjJao27/+2MOvp3kknLogv7Tz
         WGBRodzQVE/l1dutGEjP07niXqvxfgeNogK5UsYHkC/gsUJWgJubfzbLleD1YKAjfAMt
         kMvA==
X-Gm-Message-State: APjAAAVopW0P16Td2GQNzfsxLF8dUtoKXQndvObffj9SIw7Jn8o0hh6j
        hayZW1oDXaOxaPfo1TfKRkAEic9Cx7M=
X-Google-Smtp-Source: APXvYqwtvunVUyYFqplx3qFvUAkBfYHrczSsjHGMNOUsk282Gy4X5C/h8IHIdP/5RFRjqsHj+7oEqA==
X-Received: by 2002:aa7:9a8b:: with SMTP id w11mr4302955pfi.38.1581695306046;
        Fri, 14 Feb 2020 07:48:26 -0800 (PST)
Received: from localhost ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id z5sm7396820pfq.3.2020.02.14.07.48.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 14 Feb 2020 07:48:25 -0800 (PST)
From:   qiwuchen55@gmail.com
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Cc:     linux-leds@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: [PATCH] leds: use devm_platform_ioremap_resource_byname()
Date:   Fri, 14 Feb 2020 23:48:21 +0800
Message-Id: <1581695301-16604-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: chenqiwu <chenqiwu@xiaomi.com>

Use devm_platform_ioremap_resource_byname() instead of calling
platform_get_resource_byname() and devm_ioremap_resource() separately.

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
 drivers/leds/leds-cobalt-qube.c | 12 +++---------
 drivers/leds/leds-cobalt-raq.c  | 12 ++++--------
 2 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/leds-cobalt-qube.c b/drivers/leds/leds-cobalt-qube.c
index ef22e1e..76af9d8 100644
--- a/drivers/leds/leds-cobalt-qube.c
+++ b/drivers/leds/leds-cobalt-qube.c
@@ -36,15 +36,9 @@ static void qube_front_led_set(struct led_classdev *led_cdev,
 
 static int cobalt_qube_led_probe(struct platform_device *pdev)
 {
-	struct resource *res;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EBUSY;
-
-	led_port = devm_ioremap(&pdev->dev, res->start, resource_size(res));
-	if (!led_port)
-		return -ENOMEM;
+	led_port = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(led_port))
+		return PTR_ERR(led_port);
 
 	led_value = LED_FRONT_LEFT | LED_FRONT_RIGHT;
 	writeb(led_value, led_port);
diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-raq.c
index 045c239..8b1317d 100644
--- a/drivers/leds/leds-cobalt-raq.c
+++ b/drivers/leds/leds-cobalt-raq.c
@@ -65,16 +65,11 @@ static void raq_power_off_led_set(struct led_classdev *led_cdev,
 
 static int cobalt_raq_led_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	int retval;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EBUSY;
-
-	led_port = devm_ioremap(&pdev->dev, res->start, resource_size(res));
-	if (!led_port)
-		return -ENOMEM;
+	led_port = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(led_port))
+		return PTR_ERR(led_port);
 
 	retval = led_classdev_register(&pdev->dev, &raq_power_off_led);
 	if (retval)
@@ -90,6 +85,7 @@ static int cobalt_raq_led_probe(struct platform_device *pdev)
 	led_classdev_unregister(&raq_power_off_led);
 
 err_null:
+	devm_ioremap_release(&pdev->dev, led_port);
 	led_port = NULL;
 
 	return retval;
-- 
1.9.1

