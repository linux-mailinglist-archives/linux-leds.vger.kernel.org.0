Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CDB302C52
	for <lists+linux-leds@lfdr.de>; Mon, 25 Jan 2021 21:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbhAYUO0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 25 Jan 2021 15:14:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbhAYUOP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 25 Jan 2021 15:14:15 -0500
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F73C061573;
        Mon, 25 Jan 2021 12:13:35 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4DPgz71gwVzQlRT;
        Mon, 25 Jan 2021 21:13:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1611605585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=fW70VQsfx1iS6yKV+TnS95XSsveNmLFJUkcB4V1UMko=;
        b=nr0Qj+ICbleoKF4cbGXuxJwGnVzGYA17FBTzKYwo71sItjoDWBZA0gokKOmwExoNNN1ZyY
        sDOHaB1iiTNHT2AGGC/eKJ5UV/rdO59j4G0um0Ess+Lw4XDJYwoZ9oeve4gifOG8ftP13+
        D7ck8MqXOZFBoyip7IoGXOhpZ4TgL9V1f/jPjQsznbpiqZmMGSCmsfRXoT2o3rAbOeR94W
        kFnIzODu/AZF+hdqox9mZT9QH2lwKcLZLz8b0/bRm/Fmv+V2/IXk52nl/ZXEz9V16u0GQD
        JfYEfLQDGvKqbqkUECZsyT3RDsDNjtydVj3MPJ1ZeN+vGKBMRWSx1TdVv8PtBQ==
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id kv44TnqRXBQh; Mon, 25 Jan 2021 21:13:04 +0100 (CET)
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH v3] leds: gpio: Set max brightness to 1
Date:   Mon, 25 Jan 2021 21:08:57 +0100
Message-Id: <20210125200856.1976-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -6.11 / 15.00 / 15.00
X-Rspamd-Queue-Id: 4FD791848
X-Rspamd-UID: 40e9dc
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
v3 simplifies the patch for better readability

 drivers/leds/leds-gpio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 93f5b1b60fde..242bb38cadee 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -96,7 +96,9 @@ static int create_gpio_led(const struct gpio_led *template,
 	} else {
 		state = (template->default_state == LEDS_GPIO_DEFSTATE_ON);
 	}
-	led_dat->cdev.brightness = state ? LED_FULL : LED_OFF;
+	led_dat->cdev.brightness = state;
+	led_dat->cdev.max_brightness = 1;
+
 	if (!template->retain_state_suspended)
 		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
 	if (template->panic_indicator)
-- 
2.30.0

