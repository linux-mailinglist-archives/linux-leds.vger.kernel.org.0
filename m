Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B01D2E72F0
	for <lists+linux-leds@lfdr.de>; Tue, 29 Dec 2020 19:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgL2SQp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Dec 2020 13:16:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgL2SQp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Dec 2020 13:16:45 -0500
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050::465:102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C551C061574;
        Tue, 29 Dec 2020 10:16:05 -0800 (PST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4D52f16GcszQlWv;
        Tue, 29 Dec 2020 19:15:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1609265733;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=uAi+P0BDIEVHfAACitvE53eerN20LFfY1Wewe1kXQaM=;
        b=AITspcHidfh0o2Koyv8GGx6LejfKuLEYDkvdSWtFsuT2B382SF7LbEUWbKMv8NCRY68xg+
        Odw/ICFWz8xuP1HFJdfqBBQx6WI5tws7orpjwTo2jpnojoAbHHOXieZVTsnR/l5lq+VEkV
        Wg8T6hmDS6lOEGP/wLZyalRH59hx3Ho7gTMBB35vxBSfomd5QXTtivv3bTtfYx8vsFX+Sx
        pAty3u+ZBcnfhdGD3zkLFK8k/mK+IG1wgFqCKbDuVoy5XF70paFq6zkHh1d1+JLxx2wxpP
        Apb9qmSkVw/zWfYn7KTELn/0vhjDP5KehokA+Fv3QoUu0NNe2SM/t9OrkGahnw==
Received: from smtp2.mailbox.org ([80.241.60.241])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id 2yVREUYdCIF0; Tue, 29 Dec 2020 19:15:32 +0100 (CET)
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH v3] leds: gpio: Set max brightness to 1
Date:   Tue, 29 Dec 2020 19:15:12 +0100
Message-Id: <20201229181512.21057-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -6.12 / 15.00 / 15.00
X-Rspamd-Queue-Id: E0BF11726
X-Rspamd-UID: e92318
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

GPIO LEDs only know 2 states: ON or OFF and do not have PWM capabilities.
However, the max brightness is reported as 255.

This patch sets the max brightness value of a GPIO controlled LED to 1.

Tested on my PinePhone 1.2.

Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
---
Changelog                                          
  - v2 drops an obsolete change in include/linux/leds.h
  - v3 simplifies the patch and makes it more readable

 drivers/leds/leds-gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 93f5b1b60fde..b5d5e22d2d1e 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -96,7 +96,8 @@ static int create_gpio_led(const struct gpio_led *template,
 	} else {
 		state = (template->default_state == LEDS_GPIO_DEFSTATE_ON);
 	}
-	led_dat->cdev.brightness = state ? LED_FULL : LED_OFF;
+	led_dat->cdev.brightness = state;
+	led_dat->cdev.max_brightness = 1;
 	if (!template->retain_state_suspended)
 		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
 	if (template->panic_indicator)
-- 
2.26.2

