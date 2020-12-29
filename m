Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F57C2E7156
	for <lists+linux-leds@lfdr.de>; Tue, 29 Dec 2020 15:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgL2O0J (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Dec 2020 09:26:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgL2O0J (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Dec 2020 09:26:09 -0500
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81899C0613D6;
        Tue, 29 Dec 2020 06:25:28 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4D4xXM3zVgzQlS0;
        Tue, 29 Dec 2020 15:25:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1609251921;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=K95lzMIGCFZ8Qc3mvVn5s6/gqUKt6RbSmdb7l8bJ3Tc=;
        b=FIawlsVKGtkTD16msnhiEoUkClycB/yueajU9OWxQ5M44ZJPSdVcWSe1XccOyRYV33+uLR
        U5VbKk94SsC612wegFWycEAK4wFSxTSm9pNYQ1eUKBlxQUWjdIK6dmah4o4Sb3pgskZ8GF
        L3f6o1yEsf3vAVflPpaqShFx5jcdqDFITfaPLOEisIBaHlbUHCisq9Y66QjcDjEVmXtIhY
        KbsGvoqM6NllqeNRK3N99p0ano4sV80k1CT/7Do7YPPqkNQjQdI/2vIbXsTzz4K1AOOmqA
        xZtELkHVzOxLbod/ySwChxlHeVsQAxaQ5Cos6rzSBFdGN/2t+khEjPJAqMXfug==
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
        with ESMTP id Mi9UEMG-npsH; Tue, 29 Dec 2020 15:25:17 +0100 (CET)
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH v2] leds: gpio: Set max brightness to 1
Date:   Tue, 29 Dec 2020 15:24:40 +0100
Message-Id: <20201229142440.31916-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -5.98 / 15.00 / 15.00
X-Rspamd-Queue-Id: 644241847
X-Rspamd-UID: 3dbf76
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

GPIO LEDs only know 2 states: ON or OFF and do not have PWM capabilities.
However, the max brightness is reported as 255.

This patch sets the max brightness value of a GPIO controlled LED to 1.

Tested on my PinePhone 1.2.

Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
---
v2 drops an obsolete change in include/linux/leds.h

 drivers/leds/leds-gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
2.26.2

