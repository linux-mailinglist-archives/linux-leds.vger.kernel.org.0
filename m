Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA0F6BDC1
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jul 2019 16:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfGQOAC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jul 2019 10:00:02 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60592 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbfGQOAC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jul 2019 10:00:02 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6HDxuJ5109675;
        Wed, 17 Jul 2019 08:59:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563371996;
        bh=xIc3z2d+5D/rJ8xZOe9QZOEhKhuuTTaa43KvfS4jeRo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=pOqupyCBGjnrz0nJQNTrCs64BdkxnLHnn3JpNanz6a5oPZ8AxmEwq9FR9RlN5UoDZ
         xEgMq9JTNgsb60B9QtC/qwX0nYnziUB0val5vBdYeSw89/t/hUxqxVVoQkP2y5Vohb
         uFxTafJq1ABnruwPhbY9fLj3pxsvNCaqa4hMGbZc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6HDxuB6055077
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 17 Jul 2019 08:59:56 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 17
 Jul 2019 08:59:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 17 Jul 2019 08:59:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6HDxtpw016885;
        Wed, 17 Jul 2019 08:59:55 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v3 3/3] leds: Make led_set_brightness_sync() also use __led_set_brightness()
Date:   Wed, 17 Jul 2019 15:59:48 +0200
Message-ID: <20190717135948.19340-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190717135948.19340-1-jjhiblot@ti.com>
References: <20190717135948.19340-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There are some LED drivers that do not implement brightness_set_blocking(),
for those drivers led_set_brightness_sync() cannot work.
Fixing it by calling first __led_set_brightness() and falling back to
__led_set_brightness_blocking() if it failed.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/leds/led-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index dab32cf778f2..4a0506081c0e 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -320,15 +320,19 @@ int led_set_brightness_sync(struct led_classdev *led_cdev,
 	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
 		return -EBUSY;
 
-	led_cdev->brightness = min(value, led_cdev->max_brightness);
+	value = min(value, led_cdev->max_brightness);
 
 	if (led_cdev->flags & LED_SUSPENDED)
 		return 0;
 
-	ret = __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
+	ret = __led_set_brightness(led_cdev, value);
+	if (ret == -ENOTSUPP)
+		ret = __led_set_brightness_blocking(led_cdev, value);
 	if (ret)
 		return ret;
 
+	led_cdev->brightness = value;
+
 	return __led_handle_regulator(led_cdev, led_cdev->brightness);
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_sync);
-- 
2.17.1

