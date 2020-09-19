Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CDA2710FC
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 00:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgISWPz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 18:15:55 -0400
Received: from lists.nic.cz ([217.31.204.67]:50122 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726707AbgISWPz (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 18:15:55 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 1BD4A140A9E;
        Sun, 20 Sep 2020 00:15:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600553752; bh=NB5LiiD9QW3rkQMR/lNEjPEXNmou7qEgsAqeLCDs/T4=;
        h=From:To:Date;
        b=P81QVNtb1gfvpYbq8B9N4MEYhXtEPwepkRuGOmvBhFSb+c/uihE7z627EFmd7ugE7
         iyW6JMlkB0tdvtVOGCGvmonGbZ/C6F9mdoNUCM9s/hiRA3eru8I4ZrceDo5qgJ307m
         pSxaedIWbNgTT3jvU8qx2LQhdp5kz/UEK/HMq0aM=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH leds + devicetree 13/13] leds: tca6507: use struct led_init_data when registering
Date:   Sun, 20 Sep 2020 00:15:48 +0200
Message-Id: <20200919221548.29984-14-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919221548.29984-1-marek.behun@nic.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
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
`label` nor `linux,default-trigger` DT property. Moreover `label` is
deprecated and if it is not present but `color` and `function` are, LED
core will compose a name from these properties instead.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: NeilBrown <neilb@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/leds/leds-tca6507.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index ad4af6b6e94c7..362dc9b3d97d0 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -654,6 +654,7 @@ static int tca6507_register_leds_and_gpios(struct device *dev,
 		return -EINVAL;
 
 	device_for_each_child_node(dev, child) {
+		struct led_init_data init_data = {};
 		struct tca6507_led *led;
 		u32 reg;
 
@@ -679,18 +680,14 @@ static int tca6507_register_leds_and_gpios(struct device *dev,
 		led = &tca->leds[reg];
 		led->chip = tca;
 		led->num = reg;
-
-		if (fwnode_property_read_string(child, "label",
-						&led->led_cdev.name))
-			led->led_cdev.name = fwnode_get_name(child);
-
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led->led_cdev.default_trigger);
-
+		led->bank = -1;
 		led->led_cdev.brightness_set = tca6507_brightness_set;
 		led->led_cdev.blink_set = tca6507_blink_set;
-		led->bank = -1;
-		ret = devm_led_classdev_register(dev, &led->led_cdev);
+
+		init_data.fwnode = child;
+
+		ret = devm_led_classdev_register_ext(dev, &led->led_cdev,
+						     &init_data);
 		if (ret) {
 			dev_err(dev, "Failed to register LED for node %pfw\n",
 				child);
-- 
2.26.2

