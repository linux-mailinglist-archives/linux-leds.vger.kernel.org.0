Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D16FD26E897
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgIQWeu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:34:50 -0400
Received: from lists.nic.cz ([217.31.204.67]:35720 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726343AbgIQWeS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:18 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id A9710142070;
        Fri, 18 Sep 2020 00:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382042; bh=miG+OrQL2mOeZJTyg/24ok7NmhQ7y6FtesErJ/4bw4E=;
        h=From:To:Date;
        b=Aqc1zzfnogZhx8F7WickLfm1VuQV4HneQH5Zf549bf0fMGj7LbAGfreRJlVJZZgMj
         tIxscvcErp5himhNgCOY4I4g7Hj804Fe00zI00TRWbvyHjqxHTVrDktL2MkJtFbqLW
         osFoeB8ijEzJJ2CEtsU5WmEpsd25FVfddjXcCaEQ=
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
Subject: [PATCH leds v2 49/50] leds: ns2: use struct led_init_data when registering
Date:   Fri, 18 Sep 2020 00:33:37 +0200
Message-Id: <20200917223338.14164-50-marek.behun@nic.cz>
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

By using struct led_init_data when registering we do not need to parse
`label` DT property. Moreover `label` is deprecated and if it is not
present but `color` and `function` are, LED core will compose a name
from these properties instead.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ns2.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 01c54ab0aa00e..b021e94d512c9 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -174,14 +174,11 @@ ATTRIBUTE_GROUPS(ns2_led);
 static int ns2_led_register(struct device *dev, struct device_node *np,
 			    struct ns2_led *led)
 {
+	struct led_init_data init_data = {};
 	struct ns2_led_modval *modval;
 	enum ns2_led_modes mode;
 	int nmodes, ret, i;
 
-	ret = of_property_read_string(np, "label", &led->cdev.name);
-	if (ret)
-		led->cdev.name = np->name;
-
 	led->cmd = devm_gpiod_get_from_of_node(dev, np, "cmd-gpio", 0,
 					       GPIOD_ASIS, np->name);
 	if (IS_ERR(led->cmd))
@@ -238,7 +235,9 @@ static int ns2_led_register(struct device *dev, struct device_node *np,
 	led->sata = (mode == NS_V2_LED_SATA) ? 1 : 0;
 	led->cdev.brightness = (mode == NS_V2_LED_OFF) ? LED_OFF : LED_FULL;
 
-	ret = devm_led_classdev_register(dev, &led->cdev);
+	init_data.fwnode = of_fwnode_handle(np);
+
+	ret = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
 	if (ret)
 		dev_err(dev, "Failed to register LED for node %pOF\n", np);
 
-- 
2.26.2

