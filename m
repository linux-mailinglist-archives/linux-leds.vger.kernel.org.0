Return-Path: <linux-leds+bounces-2233-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FF992CEDA
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 12:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA2E2B249FB
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 10:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4414516D4F9;
	Wed, 10 Jul 2024 10:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="NUAVtNEe"
X-Original-To: linux-leds@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCD61B86F3;
	Wed, 10 Jul 2024 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720606049; cv=none; b=W8leYlGGQuCY/+7jwTy8yVTe8CnsgV3pTo8JbekwDak+95egBjV3zxJGri3sdwxn6xSjizHWkuQMRbdseJxyvEy/iEifzleUA7/u6I2tczleOoY9tI7X7joeHPjKK/xBT3E2yLkaFuWJyLBWXCvK/GNZdvJLLJ0hF1OatmWcAlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720606049; c=relaxed/simple;
	bh=6wXpt7XYjcDNGjv5yoOXr7CoBDQcbXL3aGdpf2FY4yI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KtrjC8T26nRCxBxzTo3+ORXMz05bXv80WoyLZL5Apdxq1POlolaDZb8kxhC/Js33XUE21V8UbN0GHb/paADfA8Cvfq9FGH7YCUnjb42N2IwtVJsYijpD2jTrKN56u6OCb29la3gxqmu0HdsGY+8G+oIKikZLTRJILMPWZObDvYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=NUAVtNEe; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5805C886EE;
	Wed, 10 Jul 2024 12:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720606039;
	bh=ylgL5qgH3GiW86diEu73+cfrmEBeNmq9X/KhYaPz8rE=;
	h=From:To:Cc:Subject:Date:From;
	b=NUAVtNEexXjQmiUylNIcugGMv8sL0weM6AmC3/idhQCyw00N+yHEkxArxYrCguzJO
	 z9TDXOr2/1snN9Z+wvefZr8VA5DHaDJ+JxWtyEJEV+7iezXRapQBh4njPAN+5aHOlX
	 YuCZVTS04N7paM9904AFZNfePT1DkracfrVV+cWI/uAMs6br4coRgeirX7yzeF65Ht
	 pExEx1pR78lGyJ1q/SOEXitGZ17QlG1QHKYBjCgrWT7uz6xOxA9l1PNKX27J+gbE/5
	 aFUuowmhdQIujEzA+FdqQJbUlTtQwqu/+Z7odZ8rPKCiSGg75PmowWOHWvwqd/tAEb
	 +7AF5AqkZ+ieA==
From: Lukasz Majewski <lukma@denx.de>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Li Zetao <lizetao1@huawei.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v1 net-next] leds: trigger: netdev: Add support for tx_err and rx_err notification with LEDs
Date: Wed, 10 Jul 2024 12:06:51 +0200
Message-Id: <20240710100651.4059887-1-lukma@denx.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

This patch provides support for enabling blinking of LEDs when RX or TX
errors are detected.

Approach taken in this patch is similar to one for TX or RX data
transmission indication (i.e. TRIGGER_NETDEV_TX/RX attribute).

One can inspect transmission errors with:
ip -s link show eth0

Example LED configuration:
cd /sys/devices/platform/amba_pl@0/a001a000.leds/leds/
echo netdev > mode:blue/trigger && \
echo eth0 > mode:blue/device_name && \
echo 1 > mode:blue/tx_err

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 drivers/leds/trigger/ledtrig-netdev.c | 24 +++++++++++++++++++++---
 include/linux/leds.h                  |  2 ++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 22bba8e97642..4b0863db901a 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -39,6 +39,8 @@
  *         (has carrier) or not
  * tx -  LED blinks on transmitted data
  * rx -  LED blinks on receive data
+ * tx_err -  LED blinks on transmit error
+ * rx_err -  LED blinks on receive error
  *
  * Note: If the user selects a mode that is not supported by hw, default
  * behavior is to fall back to software control of the LED. However not every
@@ -144,7 +146,9 @@ static void set_baseline_state(struct led_netdev_data *trigger_data)
 		 * checking stats
 		 */
 		if (test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) ||
-		    test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode))
+		    test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) ||
+		    test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) ||
+		    test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode))
 			schedule_delayed_work(&trigger_data->work, 0);
 	}
 }
@@ -337,6 +341,8 @@ static ssize_t netdev_led_attr_show(struct device *dev, char *buf,
 	case TRIGGER_NETDEV_FULL_DUPLEX:
 	case TRIGGER_NETDEV_TX:
 	case TRIGGER_NETDEV_RX:
+	case TRIGGER_NETDEV_TX_ERR:
+	case TRIGGER_NETDEV_RX_ERR:
 		bit = attr;
 		break;
 	default:
@@ -371,6 +377,8 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 	case TRIGGER_NETDEV_FULL_DUPLEX:
 	case TRIGGER_NETDEV_TX:
 	case TRIGGER_NETDEV_RX:
+	case TRIGGER_NETDEV_TX_ERR:
+	case TRIGGER_NETDEV_RX_ERR:
 		bit = attr;
 		break;
 	default:
@@ -429,6 +437,8 @@ DEFINE_NETDEV_TRIGGER(half_duplex, TRIGGER_NETDEV_HALF_DUPLEX);
 DEFINE_NETDEV_TRIGGER(full_duplex, TRIGGER_NETDEV_FULL_DUPLEX);
 DEFINE_NETDEV_TRIGGER(tx, TRIGGER_NETDEV_TX);
 DEFINE_NETDEV_TRIGGER(rx, TRIGGER_NETDEV_RX);
+DEFINE_NETDEV_TRIGGER(tx_err, TRIGGER_NETDEV_TX_ERR);
+DEFINE_NETDEV_TRIGGER(rx_err, TRIGGER_NETDEV_RX_ERR);
 
 static ssize_t interval_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
@@ -538,6 +548,8 @@ static struct attribute *netdev_trig_attrs[] = {
 	&dev_attr_half_duplex.attr,
 	&dev_attr_rx.attr,
 	&dev_attr_tx.attr,
+	&dev_attr_rx_err.attr,
+	&dev_attr_tx_err.attr,
 	&dev_attr_interval.attr,
 	&dev_attr_offloaded.attr,
 	NULL
@@ -628,7 +640,9 @@ static void netdev_trig_work(struct work_struct *work)
 
 	/* If we are not looking for RX/TX then return  */
 	if (!test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) &&
-	    !test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode))
+	    !test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) &&
+	    !test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) &&
+	    !test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode))
 		return;
 
 	dev_stats = dev_get_stats(trigger_data->net_dev, &temp);
@@ -636,7 +650,11 @@ static void netdev_trig_work(struct work_struct *work)
 	    (test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) ?
 		dev_stats->tx_packets : 0) +
 	    (test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) ?
-		dev_stats->rx_packets : 0);
+		dev_stats->rx_packets : 0) +
+	    (test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) ?
+		dev_stats->tx_errors : 0) +
+	    (test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode) ?
+		dev_stats->rx_errors : 0);
 
 	if (trigger_data->last_activity != new_activity) {
 		led_stop_software_blink(trigger_data->led_cdev);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6300313c46b7..c4087c15e61d 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -574,6 +574,8 @@ enum led_trigger_netdev_modes {
 	TRIGGER_NETDEV_FULL_DUPLEX,
 	TRIGGER_NETDEV_TX,
 	TRIGGER_NETDEV_RX,
+	TRIGGER_NETDEV_TX_ERR,
+	TRIGGER_NETDEV_RX_ERR,
 
 	/* Keep last */
 	__TRIGGER_NETDEV_MAX,
-- 
2.39.2


