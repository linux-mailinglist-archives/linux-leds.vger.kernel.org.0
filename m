Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144CE2E3193
	for <lists+linux-leds@lfdr.de>; Sun, 27 Dec 2020 15:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgL0Olj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Dec 2020 09:41:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbgL0Oli (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Dec 2020 09:41:38 -0500
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [IPv6:2001:67c:2050::465:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D6AC061795;
        Sun, 27 Dec 2020 06:40:57 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4D3jzB5twzzQlF7;
        Sun, 27 Dec 2020 15:40:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1609080052;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Su9EmqxTFyjd3dtZ0DJqAJWM+HidJ1cY0TUrGFRJtpo=;
        b=sLFqocuaAMFLk60h50QhcG5fIPWm/zaW4FFBBEEy2n5nsKx2D8sBpFtDRn8Pk73sTXrwQi
        yNGnf0Y0DXpqQCu3kvfv/4gc8h4Wa5vagjI59XH9nic1Ui+uBYht5xqtI3gPeyjaqhY12m
        0rLHRVu/Ij2q49e7L8HYS73wQpm9NQGLz/5juABu1NXtHzpGbck/AXzuXKNuQXCndTBqAJ
        aPdc9KNmvCmS85v9fvf1ooKQ87Q0LTRbBcSbCUGx7mCLwa9WDKLBdkbSocFgEh/qo4b5mx
        2H7/rSJpFxvkiz5uy1HxnQO3OJHCb7pcqlG051InCXVoT/o2yCpW+3TzO/L53Q==
Received: from smtp1.mailbox.org ([80.241.60.240])
        by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
        with ESMTP id ir1MYudsjB1I; Sun, 27 Dec 2020 15:40:51 +0100 (CET)
From:   me@dylanvanassche.be
To:     pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH] leds: gpio: Set max brightness to 1
Date:   Sun, 27 Dec 2020 15:40:15 +0100
Message-Id: <20201227144014.6590-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -6.19 / 15.00 / 15.00
X-Rspamd-Queue-Id: 87D281850
X-Rspamd-UID: cf6e61
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Dylan Van Assche <me@dylanvanassche.be>

GPIO LEDs only know 2 states: ON or OFF and do not have PWM capabilities.
However, the max brightness is reported as 255.

This patch sets the max brightness value of a GPIO controlled LED to 1.

Tested on my PinePhone 1.2.

Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
---
 drivers/leds/leds-gpio.c | 3 ++-
 include/linux/leds.h     | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 93f5b1b60fde..0d66f19d71ba 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -96,7 +96,8 @@ static int create_gpio_led(const struct gpio_led *template,
 	} else {
 		state = (template->default_state == LEDS_GPIO_DEFSTATE_ON);
 	}
-	led_dat->cdev.brightness = state ? LED_FULL : LED_OFF;
+	led_dat->cdev.brightness = state ? LED_ON : LED_OFF;
+	led_dat->cdev.max_brightness = LED_ON;
 	if (!template->retain_state_suspended)
 		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
 	if (template->panic_indicator)
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6a8d6409c993..43f0cac2a87b 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -514,6 +514,7 @@ struct gpio_led {
 	const char *name;
 	const char *default_trigger;
 	unsigned 	gpio;
+	unsigned	max_brightness;
 	unsigned	active_low : 1;
 	unsigned	retain_state_suspended : 1;
 	unsigned	panic_indicator : 1;
-- 
2.26.2

