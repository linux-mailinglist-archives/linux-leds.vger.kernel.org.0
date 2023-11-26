Return-Path: <linux-leds+bounces-165-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 613BE7F95AE
	for <lists+linux-leds@lfdr.de>; Sun, 26 Nov 2023 23:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01358B209FE
	for <lists+linux-leds@lfdr.de>; Sun, 26 Nov 2023 22:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D90A4F;
	Sun, 26 Nov 2023 22:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0BABB6;
	Sun, 26 Nov 2023 14:07:33 -0800 (PST)
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r7NHb-0002F8-30;
	Sun, 26 Nov 2023 22:07:21 +0000
Date: Sun, 26 Nov 2023 22:07:18 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Li Zetao <lizetao1@huawei.com>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] leds: trigger: netdev: extend speeds up to 10G
Message-ID: <120eddc938b588622020822510e3c19a4d169686.1701035950.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add 2.5G, 5G and 10G as available speeds to the netdev LED trigger.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v2: add missing sysfs entries

 drivers/leds/trigger/ledtrig-netdev.c | 32 ++++++++++++++++++++++++++-
 include/linux/leds.h                  |  3 +++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index e358e77e4b38f..bd68da15c723e 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -99,6 +99,18 @@ static void set_baseline_state(struct led_netdev_data *trigger_data)
 		    trigger_data->link_speed == SPEED_1000)
 			blink_on = true;
 
+		if (test_bit(TRIGGER_NETDEV_LINK_2500, &trigger_data->mode) &&
+		    trigger_data->link_speed == SPEED_2500)
+			blink_on = true;
+
+		if (test_bit(TRIGGER_NETDEV_LINK_5000, &trigger_data->mode) &&
+		    trigger_data->link_speed == SPEED_5000)
+			blink_on = true;
+
+		if (test_bit(TRIGGER_NETDEV_LINK_10000, &trigger_data->mode) &&
+		    trigger_data->link_speed == SPEED_10000)
+			blink_on = true;
+
 		if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &trigger_data->mode) &&
 		    trigger_data->duplex == DUPLEX_HALF)
 			blink_on = true;
@@ -286,6 +298,9 @@ static ssize_t netdev_led_attr_show(struct device *dev, char *buf,
 	case TRIGGER_NETDEV_LINK_10:
 	case TRIGGER_NETDEV_LINK_100:
 	case TRIGGER_NETDEV_LINK_1000:
+	case TRIGGER_NETDEV_LINK_2500:
+	case TRIGGER_NETDEV_LINK_5000:
+	case TRIGGER_NETDEV_LINK_10000:
 	case TRIGGER_NETDEV_HALF_DUPLEX:
 	case TRIGGER_NETDEV_FULL_DUPLEX:
 	case TRIGGER_NETDEV_TX:
@@ -316,6 +331,9 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 	case TRIGGER_NETDEV_LINK_10:
 	case TRIGGER_NETDEV_LINK_100:
 	case TRIGGER_NETDEV_LINK_1000:
+	case TRIGGER_NETDEV_LINK_2500:
+	case TRIGGER_NETDEV_LINK_5000:
+	case TRIGGER_NETDEV_LINK_10000:
 	case TRIGGER_NETDEV_HALF_DUPLEX:
 	case TRIGGER_NETDEV_FULL_DUPLEX:
 	case TRIGGER_NETDEV_TX:
@@ -334,7 +352,10 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 	if (test_bit(TRIGGER_NETDEV_LINK, &mode) &&
 	    (test_bit(TRIGGER_NETDEV_LINK_10, &mode) ||
 	     test_bit(TRIGGER_NETDEV_LINK_100, &mode) ||
-	     test_bit(TRIGGER_NETDEV_LINK_1000, &mode)))
+	     test_bit(TRIGGER_NETDEV_LINK_1000, &mode) ||
+	     test_bit(TRIGGER_NETDEV_LINK_2500, &mode) ||
+	     test_bit(TRIGGER_NETDEV_LINK_5000, &mode) ||
+	     test_bit(TRIGGER_NETDEV_LINK_10000, &mode)))
 		return -EINVAL;
 
 	cancel_delayed_work_sync(&trigger_data->work);
@@ -364,6 +385,9 @@ DEFINE_NETDEV_TRIGGER(link, TRIGGER_NETDEV_LINK);
 DEFINE_NETDEV_TRIGGER(link_10, TRIGGER_NETDEV_LINK_10);
 DEFINE_NETDEV_TRIGGER(link_100, TRIGGER_NETDEV_LINK_100);
 DEFINE_NETDEV_TRIGGER(link_1000, TRIGGER_NETDEV_LINK_1000);
+DEFINE_NETDEV_TRIGGER(link_2500, TRIGGER_NETDEV_LINK_2500);
+DEFINE_NETDEV_TRIGGER(link_5000, TRIGGER_NETDEV_LINK_5000);
+DEFINE_NETDEV_TRIGGER(link_10000, TRIGGER_NETDEV_LINK_10000);
 DEFINE_NETDEV_TRIGGER(half_duplex, TRIGGER_NETDEV_HALF_DUPLEX);
 DEFINE_NETDEV_TRIGGER(full_duplex, TRIGGER_NETDEV_FULL_DUPLEX);
 DEFINE_NETDEV_TRIGGER(tx, TRIGGER_NETDEV_TX);
@@ -422,6 +446,9 @@ static struct attribute *netdev_trig_attrs[] = {
 	&dev_attr_link_10.attr,
 	&dev_attr_link_100.attr,
 	&dev_attr_link_1000.attr,
+	&dev_attr_link_2500.attr,
+	&dev_attr_link_5000.attr,
+	&dev_attr_link_10000.attr,
 	&dev_attr_full_duplex.attr,
 	&dev_attr_half_duplex.attr,
 	&dev_attr_rx.attr,
@@ -519,6 +546,9 @@ static void netdev_trig_work(struct work_struct *work)
 			 test_bit(TRIGGER_NETDEV_LINK_10, &trigger_data->mode) ||
 			 test_bit(TRIGGER_NETDEV_LINK_100, &trigger_data->mode) ||
 			 test_bit(TRIGGER_NETDEV_LINK_1000, &trigger_data->mode) ||
+			 test_bit(TRIGGER_NETDEV_LINK_2500, &trigger_data->mode) ||
+			 test_bit(TRIGGER_NETDEV_LINK_5000, &trigger_data->mode) ||
+			 test_bit(TRIGGER_NETDEV_LINK_10000, &trigger_data->mode) ||
 			 test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &trigger_data->mode) ||
 			 test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &trigger_data->mode);
 		interval = jiffies_to_msecs(
diff --git a/include/linux/leds.h b/include/linux/leds.h
index aa16dc2a8230f..1bdf7f5a0d7c0 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -588,6 +588,9 @@ enum led_trigger_netdev_modes {
 	TRIGGER_NETDEV_LINK_10,
 	TRIGGER_NETDEV_LINK_100,
 	TRIGGER_NETDEV_LINK_1000,
+	TRIGGER_NETDEV_LINK_2500,
+	TRIGGER_NETDEV_LINK_5000,
+	TRIGGER_NETDEV_LINK_10000,
 	TRIGGER_NETDEV_HALF_DUPLEX,
 	TRIGGER_NETDEV_FULL_DUPLEX,
 	TRIGGER_NETDEV_TX,
-- 
2.43.0

