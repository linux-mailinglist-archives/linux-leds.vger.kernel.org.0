Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE84D270FE5
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 20:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgISSDK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 14:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgISSDK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 14:03:10 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26725C0613CE
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 11:03:10 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 7E164140A84;
        Sat, 19 Sep 2020 20:03:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600538586; bh=xfJxCa1ZtShObzL/Z8DhVsAsRoT0kI2V3U/K6GeORYQ=;
        h=From:To:Date;
        b=oqS2dOS9s5y/Jc5XcSaMS9n2unpi8BR45uEM7whE2bTiHvrsWVCQczDXLrmwyBCXJ
         lemhQgpX3pio8bo2R1Z40xrJU3e7xLd6pl3Dx/zrwJX8WGv+7PuwhX0zbSbqHvwWE3
         hFtotwXHWMaPupGzIRWcq5mwWszdp/YELtmuDpDA=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v3 7/9] leds: lm3532: don't parse label DT property
Date:   Sat, 19 Sep 2020 20:03:02 +0200
Message-Id: <20200919180304.2885-8-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919180304.2885-1-marek.behun@nic.cz>
References: <20200919180304.2885-1-marek.behun@nic.cz>
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

This driver uses extended LED registration, so we do not need to parse
the `label` DT property on our own.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 drivers/leds/leds-lm3532.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 946ad67eaecb7..9b6973217cc0b 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -129,7 +129,6 @@ struct lm3532_als_data {
  * @full_scale_current - The full-scale current setting for the current sink.
  * @led_strings - The LED strings supported in this array
  * @enabled - Enabled status
- * @label - LED label
  */
 struct lm3532_led {
 	struct led_classdev led_dev;
@@ -142,7 +141,6 @@ struct lm3532_led {
 	int full_scale_current;
 	unsigned int enabled:1;
 	u32 led_strings[LM3532_MAX_CONTROL_BANKS];
-	char label[LED_MAX_NAME_SIZE];
 };
 
 /**
@@ -548,7 +546,6 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 {
 	struct fwnode_handle *child = NULL;
 	struct lm3532_led *led;
-	const char *name;
 	int control_bank;
 	u32 ramp_time;
 	size_t i = 0;
@@ -646,16 +643,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 		fwnode_property_read_string(child, "linux,default-trigger",
 					    &led->led_dev.default_trigger);
 
-		ret = fwnode_property_read_string(child, "label", &name);
-		if (ret)
-			snprintf(led->label, sizeof(led->label),
-				"%s::", priv->client->name);
-		else
-			snprintf(led->label, sizeof(led->label),
-				 "%s:%s", priv->client->name, name);
-
 		led->priv = priv;
-		led->led_dev.name = led->label;
 		led->led_dev.brightness_set_blocking = lm3532_brightness_set;
 
 		ret = devm_led_classdev_register_ext(priv->dev, &led->led_dev, &idata);
-- 
2.26.2

