Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6072826E896
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgIQWeu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:34:50 -0400
Received: from mail.nic.cz ([217.31.204.67]:35812 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726154AbgIQWeR (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:17 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 50D15142064;
        Fri, 18 Sep 2020 00:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382041; bh=FAMJe7ITJwHvd1FSQ0yZOsBfv9QEw/KPWeoHMgngVTg=;
        h=From:To:Date;
        b=EuhGpqLf8WvukoxqnkqlVo7N7F+M0/SnvrfyARgExn6P4fsR05N2cL92GWPjUVw4g
         BnD++AoZBUpMENF2CahaNhM/OP/ftITLDpqi1avAeY+foN9CIrqF9o7rVwrtsjhTxB
         QjpqnV2A6TbiPZ1rgdlAdxdJ37Z9YRTQQsYea/BE=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH leds v2 43/50] leds: ns2: cosmetic change
Date:   Fri, 18 Sep 2020 00:33:31 +0200
Message-Id: <20200917223338.14164-44-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Return directly instead of setting result and breaking.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ns2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index dde476420a733..912db40c51183 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -65,7 +65,6 @@ struct ns2_led {
 static int ns2_led_get_mode(struct ns2_led *led, enum ns2_led_modes *mode)
 {
 	int i;
-	int ret = -EINVAL;
 	int cmd_level;
 	int slow_level;
 
@@ -76,12 +75,11 @@ static int ns2_led_get_mode(struct ns2_led *led, enum ns2_led_modes *mode)
 		if (cmd_level == led->modval[i].cmd_level &&
 		    slow_level == led->modval[i].slow_level) {
 			*mode = led->modval[i].mode;
-			ret = 0;
-			break;
+			return 0;
 		}
 	}
 
-	return ret;
+	return -EINVAL;
 }
 
 static void ns2_led_set_mode(struct ns2_led *led, enum ns2_led_modes mode)
-- 
2.26.2

