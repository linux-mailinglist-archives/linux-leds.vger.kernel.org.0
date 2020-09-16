Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A35626CF71
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 01:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgIPXQ7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Sep 2020 19:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgIPXQ4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Sep 2020 19:16:56 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00842C061756;
        Wed, 16 Sep 2020 16:16:55 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 84DD2140995;
        Thu, 17 Sep 2020 01:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600298212; bh=fMIM9nwOL3d3xvDMYEH4AqMhcjZlOHqwUnX0vDmNqzw=;
        h=From:To:Date;
        b=xESQfUPCeCHdkJkX5GjMuPpQKrSJThhLGsuGNKy7DN5DxMzxBWNKHCNqDZvNeqPoC
         A3FaLTVAoQkEvugHIIJdAomxddBu+HbM8kGDdSb1W2tVotkXbcT7+AfmEMSFvpRq88
         HHnUgiUG0CmvVq5C+m4ZoxPbohmFNwnEjDfspV2s=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v1 03/10] leds: lm3697: use struct led_init_data when registering
Date:   Thu, 17 Sep 2020 01:16:43 +0200
Message-Id: <20200916231650.11484-4-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916231650.11484-1-marek.behun@nic.cz>
References: <20200916231650.11484-1-marek.behun@nic.cz>
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
`label` DT property nor `linux,default-trigger` property.

Previously if the `label` DT property was not present, the code composed
name for the LED in the form
  "parent_name::"
For backwards compatibility we therefore set
  init_data->default_label = ":";
so that the LED will not get a different name if `label` property is not
present.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm3697.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 024983088d599..fffeac37b8afa 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -194,7 +194,6 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 {
 	struct fwnode_handle *child = NULL;
 	struct lm3697_led *led;
-	const char *name;
 	int control_bank;
 	size_t i = 0;
 	int ret = -EINVAL;
@@ -214,6 +213,8 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 		priv->regulator = NULL;
 
 	device_for_each_child_node(priv->dev, child) {
+		struct led_init_data init_data = {};
+
 		ret = fwnode_property_read_u32(child, "reg", &control_bank);
 		if (ret) {
 			dev_err(&priv->client->dev, "reg property missing\n");
@@ -268,19 +269,12 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 		if (ret)
 			dev_warn(&priv->client->dev, "runtime-ramp properties missing\n");
 
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led->led_dev.default_trigger);
-
-		ret = fwnode_property_read_string(child, "label", &name);
-		if (ret)
-			snprintf(led->label, sizeof(led->label),
-				"%s::", priv->client->name);
-		else
-			snprintf(led->label, sizeof(led->label),
-				 "%s:%s", priv->client->name, name);
+		init_data.fwnode = child;
+		init_data.devicename = priv->client->name;
+		/* for backwards compatibility if `label` is not present */
+		init_data.default_label = ":";
 
 		led->priv = priv;
-		led->led_dev.name = led->label;
 		led->led_dev.max_brightness = led->lmu_data.max_brightness;
 		led->led_dev.brightness_set_blocking = lm3697_brightness_set;
 
-- 
2.26.2

