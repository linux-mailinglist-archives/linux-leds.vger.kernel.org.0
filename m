Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E646401CAE
	for <lists+linux-leds@lfdr.de>; Mon,  6 Sep 2021 15:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242810AbhIFN4F (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Sep 2021 09:56:05 -0400
Received: from m12-18.163.com ([220.181.12.18]:34307 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243923AbhIFNzJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 6 Sep 2021 09:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=eru+PgjB5lPQrWe1PB
        y1vaDhviHWfygF3DD2no18Ytw=; b=LOGzmAbMvHaciWsVWC3a7u+6NjCq2BkPbw
        UTUevTvyWV/YuXgxvUO7G5LQ8KAdfhN4RwOz6Rzo5n4CAr7qYNQ0Ln/5+vJ9QhH5
        zxrpwA502rA8tVVsenvCHUl4tdBHvNmu88jq6B0ETXFII6CFXG39TrvF0OzqsBSQ
        GGG8W6o0c=
Received: from localhost.localdomain (unknown [183.220.75.228])
        by smtp14 (Coremail) with SMTP id EsCowABX_b5kHTZhfthN4A--.43881S3;
        Mon, 06 Sep 2021 21:53:48 +0800 (CST)
From:   chaochao2021666@163.com
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jan.kiszk@siemens.com,
        464759471@qq.com, chao zeng <chao.zeng@siemens.com>
Subject: [PATCH 2/3] leds:gpio:Add the support for "panic-indicator-on" and "panic-indicator-off"
Date:   Mon,  6 Sep 2021 21:53:19 +0800
Message-Id: <20210906135320.23134-2-chaochao2021666@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210906135320.23134-1-chaochao2021666@163.com>
References: <20210906135320.23134-1-chaochao2021666@163.com>
X-CM-TRANSID: EsCowABX_b5kHTZhfthN4A--.43881S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWruryDJw47Kw47tF17GFg_yoW5JFy8pa
        n5Cr9F9Fs3GF10y3s7A3W2qa12yw40yry7JF97Gay5JFyUKFyfXr95tF13ZFWUAFZ2kaya
        qa13JFnIkFZrAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bjKs8UUUUU=
X-Originating-IP: [183.220.75.228]
X-CM-SenderInfo: 5fkd0uhkdrjiasrwlli6rwjhhfrp/1tbiLw0GdVUMZ5L+6QAAsq
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: chao zeng <chao.zeng@siemens.com>

This commit extend the panic indicator,allowing to set LED a variety of
different of states on a kernel panic.There are on and off state
in addition to blink for a given LED.

Signed-off-by: chao zeng <chao.zeng@siemens.com>
---
 drivers/leds/leds-gpio.c | 9 +++++++++
 include/linux/leds.h     | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 092eb59a7d32..d77ec57f3f71 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -103,6 +103,11 @@ static int create_gpio_led(const struct gpio_led *template,
 		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
 	if (template->panic_indicator)
 		led_dat->cdev.flags |= LED_PANIC_INDICATOR;
+	else if (template->panic_indicator_on)
+		led_dat->cdev.flags |= LED_PANIC_INDICATOR_ON;
+	else if (template->panic_indicator_off)
+		led_dat->cdev.flags |= LED_PANIC_INDICATOR_OFF;
+
 	if (template->retain_state_shutdown)
 		led_dat->cdev.flags |= LED_RETAIN_AT_SHUTDOWN;
 
@@ -169,6 +174,10 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 			led.retain_state_shutdown = 1;
 		if (fwnode_property_present(child, "panic-indicator"))
 			led.panic_indicator = 1;
+		else if (fwnode_property_present(child, "panic-indicator-on"))
+			led.panic_indicator_on = 1;
+		else if (fwnode_property_present(child, "panic-indicator-off"))
+			led.panic_indicator_off = 1;
 
 		ret = create_gpio_led(&led, led_dat, dev, child, NULL);
 		if (ret < 0) {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index a0b730be40ad..6b3ae1dbc65f 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -85,6 +85,8 @@ struct led_classdev {
 #define LED_BRIGHT_HW_CHANGED	BIT(21)
 #define LED_RETAIN_AT_SHUTDOWN	BIT(22)
 #define LED_INIT_DEFAULT_TRIGGER BIT(23)
+#define LED_PANIC_INDICATOR_ON	BIT(24)
+#define LED_PANIC_INDICATOR_OFF	BIT(25)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
@@ -521,6 +523,8 @@ struct gpio_led {
 	unsigned	active_low : 1;
 	unsigned	retain_state_suspended : 1;
 	unsigned	panic_indicator : 1;
+	unsigned	panic_indicator_on : 1;
+	unsigned	panic_indicator_off : 1;
 	unsigned	default_state : 2;
 	unsigned	retain_state_shutdown : 1;
 	/* default_state should be one of LEDS_GPIO_DEFSTATE_(ON|OFF|KEEP) */
-- 
2.17.1


