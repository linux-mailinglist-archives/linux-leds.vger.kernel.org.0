Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 234D71703D4
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 17:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgBZQLI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 11:11:08 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37749 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgBZQLI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 11:11:08 -0500
Received: by mail-pj1-f68.google.com with SMTP id m13so1446633pjb.2
        for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2020 08:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=6Sho8WSJIUkvFSWwSi4tGm1ExbeErhAvY+NyGxPbaPo=;
        b=RmC75sMcIpt4TsIQHlrql8AdchZ1Ak19KwWJQj1DfxAYhAlhGAAElrTWm/5qVR6Ys+
         qm56YjLpbf2iqrKvubJ3hG+UgEtdt+UnMtV6YZfaAsS+y864E+pv22wu6eamuEb3MIJb
         HG4rDyQfXDIq9nFIh+S/3hTo2gmxFJazODqxEF4gD2hn9Ks0NABN8YHq0Kj1HktErMkR
         oDvNSQiWtjZSL2WAmIpxKPCVn/W9m9ssGVRVLw8jyWK6AAgIVTlEEbFpXraGhUOSZUSa
         xFvp9van50ewCm6984pXJ5M/QUCZ6pivoszMGLiB1ofkurr8JIFrgUMr/VTdSuUrRY7R
         tTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=6Sho8WSJIUkvFSWwSi4tGm1ExbeErhAvY+NyGxPbaPo=;
        b=LK5hMY0HWFHLC/umKb33ADJhdtoWMH7dNvL2Y5csyOAqYMmMDP8Ri7tqH4J0Wwr3pg
         Z+Ub+cY5ijqumg27du6KV4yi4QXcGdKYEUAkBBRwDUVToZmbLQ6Ak2MZHSJ7wDhyhbTf
         ix/DWklKwXYa85De3YAbsss5ShL/s6UTTvF8e87qco26j0DxsIrueayuFPeXR93qWE/8
         815oivazYa+g2ZGpLG8wmzoHSuLEOPRDItngJPXq1Clu9j1t0LkZ40tj/q6Oc8iq+SNW
         f82HEsaRm+XhDalT+S2TY6Pyk5Il7LEd6NoBdLZr64NuC53Y0dEoRS7qWSbs6uyK+Oed
         cOoA==
X-Gm-Message-State: APjAAAVT14heBrpP1PchiL8Jk+3FyhMq95+h42NAtEzimrpWxGLF3BJi
        B+g8CTkJKr/iyRWoFasPNSA=
X-Google-Smtp-Source: APXvYqwFaBLAiaEKu4T5QegW3L+SOS2OMWr61kl2lVlaRJKC08yoWXfP9jrY5//UwRvLHtL3R2fLzg==
X-Received: by 2002:a17:90a:7d07:: with SMTP id g7mr6181339pjl.17.1582733467264;
        Wed, 26 Feb 2020 08:11:07 -0800 (PST)
Received: from localhost ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id a9sm3339364pjk.1.2020.02.26.08.11.05
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 26 Feb 2020 08:11:06 -0800 (PST)
From:   qiwuchen55@gmail.com
To:     pavel@ucw.cz, florian@openwrt.org, yuasa@linux-mips.org,
        jacek.anaszewski@gmail.com, dmurphy@ti.com
Cc:     linux-leds@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: [PATCH v2] leds: use devm_platform_ioremap_resource() API to simplify code
Date:   Thu, 27 Feb 2020 00:10:57 +0800
Message-Id: <66479474345d3df541eca961d953c6b4420c87ce.1582732388.git.chenqiwu@xiaomi.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1582732388.git.chenqiwu@xiaomi.com>
References: <cover.1582732388.git.chenqiwu@xiaomi.com>
In-Reply-To: <cover.1582732388.git.chenqiwu@xiaomi.com>
References: <cover.1582732388.git.chenqiwu@xiaomi.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: chenqiwu <chenqiwu@xiaomi.com>

1. Use a wrapped API devm_platform_ioremap_resource() instead of
calling platform_get_resource() and devm_ioremap_resource()
separately to simplify code.
2. Add error checking and error processing for led driver probe.

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
changes in v2:
 - Add error checking and error processing for led driver probe.
 - Modify the commit title and message.
---
 drivers/leds/leds-cobalt-qube.c | 20 +++++++++++---------
 drivers/leds/leds-cobalt-raq.c  | 12 ++++--------
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/leds-cobalt-qube.c b/drivers/leds/leds-cobalt-qube.c
index ef22e1e..d8c3eac 100644
--- a/drivers/leds/leds-cobalt-qube.c
+++ b/drivers/leds/leds-cobalt-qube.c
@@ -36,20 +36,22 @@ static void qube_front_led_set(struct led_classdev *led_cdev,
 
 static int cobalt_qube_led_probe(struct platform_device *pdev)
 {
-	struct resource *res;
+	int retval;
 
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
 
-	return devm_led_classdev_register(&pdev->dev, &qube_front_led);
+	retval = devm_led_classdev_register(&pdev->dev, &qube_front_led);
+	if (retval) {
+		devm_ioremap_release(&pdev->dev, led_port);
+		led_port = NULL;
+	}
+
+	return retval;
 }
 
 static struct platform_driver cobalt_qube_led_driver = {
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

