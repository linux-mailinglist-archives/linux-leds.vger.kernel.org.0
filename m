Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8137F4C3088
	for <lists+linux-leds@lfdr.de>; Thu, 24 Feb 2022 16:59:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236783AbiBXP6R (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Feb 2022 10:58:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236877AbiBXP5u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Feb 2022 10:57:50 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7093CF68F0
        for <linux-leds@vger.kernel.org>; Thu, 24 Feb 2022 07:57:03 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nNGUH-0002YT-9m; Thu, 24 Feb 2022 16:57:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nNGUG-0012fU-KG; Thu, 24 Feb 2022 16:56:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nNGUF-005GIW-31; Thu, 24 Feb 2022 16:56:59 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] leds: trigger/tty: Add knob to blink only for tx or only for rx
Date:   Thu, 24 Feb 2022 16:56:55 +0100
Message-Id: <20220224155655.702255-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3954; h=from:subject; bh=REukF/PMZs/vFmkcIKU625DRW7XWF5ea9udVrvGdaxY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiF6rDU8h6YDAvalMh7uuvDNbbmUsK2QWpQWPm/L3n ZxpyOliJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYheqwwAKCRDB/BR4rcrsCX8CCA CcT2UWydpxVRrAzrkQ9Kqeqyp1fEN/gPW7AYe+Ve3n/ZAjdivTPUQrJ+4JKFNKbAkZJRk9B0yMQ3Al uso/gYegSFVvhuScX+WfR8cUq/RdKOFnOrrw9lQwDQQkPmzYpukOvHSB2trHJeQXaTNB0fPt7TQsH6 lNVEFYZUjJ9UP4veqF7Q2eRqwtsBEQpbBdKYV5DbGyh309O4vcLAadJ8Tvrlax5MjgmciXT2w1Yd4x IDJ5BSswtT6vDXGOyQfgEEMe1qWW8l6bJxGWQMe+O05EmdOU3/Fe1JzGA7dTu5MLWQl6P1uRtNCoXw cxBKbpk4HjQv3+H0XCyEp81CuRx6LE
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The newly introduced "triggerevent" attribute allows to restrict
blinking to TX or RX only.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../ABI/testing/sysfs-class-led-trigger-tty   |  9 +++
 drivers/leds/trigger/ledtrig-tty.c            | 60 ++++++++++++++++++-
 2 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-tty b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
index 2bf6b24e781b..27532f685b0d 100644
--- a/Documentation/ABI/testing/sysfs-class-led-trigger-tty
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
@@ -4,3 +4,12 @@ KernelVersion:	5.10
 Contact:	linux-leds@vger.kernel.org
 Description:
 		Specifies the tty device name of the triggering tty
+
+What:		/sys/class/leds/<led>/triggerevent
+Date:		Feb 2022
+KernelVersion:	5.18
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Can contain "tx', "rx" (to only blink on transfers
+		in the specified direction) or "both" (to blink for
+		both directions.)
diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
index f62db7e520b5..f87877ca48d4 100644
--- a/drivers/leds/trigger/ledtrig-tty.c
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -14,6 +14,7 @@ struct ledtrig_tty_data {
 	const char *ttyname;
 	struct tty_struct *tty;
 	int rx, tx;
+	bool handle_rx, handle_tx;
 };
 
 static void ledtrig_tty_restart(struct ledtrig_tty_data *trigger_data)
@@ -76,6 +77,57 @@ static ssize_t ttyname_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(ttyname);
 
+static ssize_t triggerevent_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
+	ssize_t len = 0;
+
+	mutex_lock(&trigger_data->mutex);
+
+	if (trigger_data->handle_tx && trigger_data->handle_rx)
+		len = sprintf(buf, "both\n");
+	else if (trigger_data->handle_tx)
+		len = sprintf(buf, "tx\n");
+	else
+		len = sprintf(buf, "rx\n");
+
+	mutex_unlock(&trigger_data->mutex);
+
+	return len;
+}
+
+static ssize_t triggerevent_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t size)
+{
+	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
+	ssize_t ret = size;
+
+	if (size > 0 && buf[size - 1] == '\n')
+		size -= 1;
+
+	mutex_lock(&trigger_data->mutex);
+
+	if (!strncmp(buf, "both", size)) {
+		trigger_data->handle_tx = true;
+		trigger_data->handle_rx = true;
+	} else if (!strncmp(buf, "tx", size)) {
+		trigger_data->handle_tx = true;
+		trigger_data->handle_rx = false;
+	} else if (!strncmp(buf, "rx", size)) {
+		trigger_data->handle_tx = false;
+		trigger_data->handle_rx = true;
+	} else {
+		ret = -EINVAL;
+	}
+
+	mutex_unlock(&trigger_data->mutex);
+
+	return ret;
+}
+static DEVICE_ATTR_RW(triggerevent);
+
 static void ledtrig_tty_work(struct work_struct *work)
 {
 	struct ledtrig_tty_data *trigger_data =
@@ -120,8 +172,8 @@ static void ledtrig_tty_work(struct work_struct *work)
 		return;
 	}
 
-	if (icount.rx != trigger_data->rx ||
-	    icount.tx != trigger_data->tx) {
+	if ((icount.rx != trigger_data->rx && trigger_data->handle_rx) ||
+	    (icount.tx != trigger_data->tx && trigger_data->handle_tx)) {
 		led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
 
 		trigger_data->rx = icount.rx;
@@ -137,6 +189,7 @@ static void ledtrig_tty_work(struct work_struct *work)
 
 static struct attribute *ledtrig_tty_attrs[] = {
 	&dev_attr_ttyname.attr,
+	&dev_attr_triggerevent.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(ledtrig_tty);
@@ -155,6 +208,9 @@ static int ledtrig_tty_activate(struct led_classdev *led_cdev)
 	trigger_data->led_cdev = led_cdev;
 	mutex_init(&trigger_data->mutex);
 
+	trigger_data->handle_tx = true;
+	trigger_data->handle_rx = true;
+
 	return 0;
 }
 
-- 
2.34.1

