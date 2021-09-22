Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34A4414EF3
	for <lists+linux-leds@lfdr.de>; Wed, 22 Sep 2021 19:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236758AbhIVRXR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Sep 2021 13:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236701AbhIVRXR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Sep 2021 13:23:17 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D91C061574;
        Wed, 22 Sep 2021 10:21:47 -0700 (PDT)
Received: from sandvich.training.denx.de (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: hws@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2EE7C832FB;
        Wed, 22 Sep 2021 19:21:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1632331303;
        bh=BFyTMvottiIYx7K8jxjbZ/Lv8MzpO0zJc3PvHju9+G4=;
        h=From:To:Cc:Subject:Date:From;
        b=xhyeM86XwGvJPOkGGR09vc+EykYk29/eUmfMRVG3ul19/jXFW4l5l5qr/MhCOlxSm
         DAnf9q6s+N8ENHl9MfTJY/wCVo4HO3RPrC4GPHJUPH/B8L5ZXPcnAPbnEJd+RFQ1Yv
         c3pBagRaYQxNkEs5UH6ff+b0dycdPTZHDEYQrPSyzSBqKG298Eo3+uO8m9rc03XGGJ
         LmZ/zGmZ8Wm19cVM8PLW0W1N7CEUEG228RrgSyZ0vo7esqOgYKyvdWhpUNdad3l006
         fu7pkJUS2kysC3NKZ2U1UoQ+g64XI7NrFXbLwsgKgWIngGEmFOA0283Zvz9yI22oJu
         d9L8kqId92DnA==
From:   Harald Seiler <hws@denx.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harald Seiler <hws@denx.de>,
        Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] leds: gpio: Always provide cdev->brightness_set_blocking()
Date:   Wed, 22 Sep 2021 19:21:33 +0200
Message-Id: <20210922172133.2257467-1-hws@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Even if the GPIO driver will never sleep, setting
cdev->brightness_set_blocking() makes sense so
led_set_brightness_sync() can be used with such LEDs.

Internally, both gpio_led_set_blocking() and gpio_led_set() call
the same implementation anyway.

Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Signed-off-by: Harald Seiler <hws@denx.de>
---
 drivers/leds/leds-gpio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index b5d5e22d2d1e..bbe582e47607 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -79,11 +79,12 @@ static int create_gpio_led(const struct gpio_led *template,
 	int ret, state;
 
 	led_dat->cdev.default_trigger = template->default_trigger;
+	led_dat->cdev.brightness_set_blocking = gpio_led_set_blocking;
+
 	led_dat->can_sleep = gpiod_cansleep(led_dat->gpiod);
 	if (!led_dat->can_sleep)
 		led_dat->cdev.brightness_set = gpio_led_set;
-	else
-		led_dat->cdev.brightness_set_blocking = gpio_led_set_blocking;
+
 	led_dat->blinking = 0;
 	if (blink_set) {
 		led_dat->platform_gpio_blink_set = blink_set;
-- 
2.33.0

