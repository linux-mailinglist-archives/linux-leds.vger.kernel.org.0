Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC586367B61
	for <lists+linux-leds@lfdr.de>; Thu, 22 Apr 2021 09:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235146AbhDVHrm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 22 Apr 2021 03:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235058AbhDVHrm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 22 Apr 2021 03:47:42 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1FAC06174A
        for <linux-leds@vger.kernel.org>; Thu, 22 Apr 2021 00:47:07 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jbe@pengutronix.de>)
        id 1lZU3E-0004XQ-0f; Thu, 22 Apr 2021 09:47:04 +0200
Received: from [2a0a:edc0:0:900:2e4d:54ff:fe67:bfa5] (helo=ginster)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <jbe@pengutronix.de>)
        id 1lZU3C-0000Js-VA; Thu, 22 Apr 2021 09:47:02 +0200
Received: from jbe by ginster with local (Exim 4.92)
        (envelope-from <jbe@pengutronix.de>)
        id 1lZU3C-0002JA-Tv; Thu, 22 Apr 2021 09:47:02 +0200
From:   Juergen Borleis <jbe@pengutronix.de>
To:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
Subject: [PATCH] leds: trigger/tty: feature data direction
Date:   Thu, 22 Apr 2021 09:47:02 +0200
Message-Id: <20210422074702.8831-1-jbe@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jbe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The current implementation just signals a visible feedback on all kind of
activity on the corresponding TTY. But sometimes it is useful to see what
kind of activity just happens. This change adds the capability to filter
the direction of TTY's data flow. It enables a user to forward both
directions to separate LEDs for tx and rx on demand. Default behavior is
still both directions.

Signed-off-by: Juergen Borleis <jbe@pengutronix.de>
---
 Documentation/leds/ledtrig-tty.rst | 47 ++++++++++++++++++++++++++
 drivers/leds/trigger/ledtrig-tty.c | 53 +++++++++++++++++++++++++++++-
 2 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/leds/ledtrig-tty.rst

diff --git a/Documentation/leds/ledtrig-tty.rst b/Documentation/leds/ledtrig-tty.rst
new file mode 100644
index 00000000..6fc765c
--- /dev/null
+++ b/Documentation/leds/ledtrig-tty.rst
@@ -0,0 +1,47 @@
+===============
+LED TTY Trigger
+===============
+
+This LED trigger flashes the LED whenever some data flows are happen on the
+corresponding TTY device. The TTY device can be freely selected, as well as the
+data flow direction.
+
+TTY trigger can be enabled and disabled from user space on led class devices,
+that support this trigger as shown below::
+
+	echo tty > trigger
+	echo none > trigger
+
+This trigger exports two properties, 'ttyname' and 'dirfilter'. When the
+tty trigger is activated both properties are set to default values, which means
+no related TTY device yet and the LED would flash on both directions.
+
+Selecting a corresponding trigger TTY::
+
+	echo ttyS0 > ttyname
+
+This LED will now flash on data flow in both directions of 'ttyS0'.
+
+Selecting a direction::
+
+	echo in > dirfilter
+	echo out > dirfilter
+	echo inout > dirfilter
+
+This selection will flash the LED on data flow in the selected direction.
+
+Example
+=======
+
+With the 'dirfilter' property one can use two LEDs to give a user a separate
+visual feedback about data flow.
+
+Flash on data send on one LED::
+
+	echo ttyS0 > ttyname
+	echo out > dirfilter
+
+Flash on data receive on a second LED::
+
+	echo ttyS0 > ttyname
+	echo in > dirfilter
diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
index f62db7e..d3bd231 100644
--- a/drivers/leds/trigger/ledtrig-tty.c
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -14,6 +14,8 @@ struct ledtrig_tty_data {
 	const char *ttyname;
 	struct tty_struct *tty;
 	int rx, tx;
+	unsigned indirection:1;
+	unsigned outdirection:1;
 };
 
 static void ledtrig_tty_restart(struct ledtrig_tty_data *trigger_data)
@@ -76,6 +78,47 @@ static ssize_t ttyname_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(ttyname);
 
+static ssize_t dirfilter_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
+
+	if (trigger_data->indirection)
+		return (ssize_t)sprintf(buf, "in\n");
+	if (trigger_data->outdirection)
+		return (ssize_t)sprintf(buf, "out\n");
+	return (ssize_t)sprintf(buf, "inout\n");
+}
+
+static ssize_t dirfilter_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
+	ssize_t ret = size;
+
+	if (size > 0 && buf[size - 1] == '\n')
+		size -= 1;
+
+	if (size) {
+		if (!strncmp(buf, "in", size)) {
+			trigger_data->indirection = 1;
+			trigger_data->outdirection = 0;
+			return ret;
+		}
+		if (!strncmp(buf, "out", size)) {
+			trigger_data->indirection = 0;
+			trigger_data->outdirection = 1;
+			return ret;
+		}
+	}
+
+	trigger_data->indirection = 0;
+	trigger_data->outdirection = 0;
+	return ret;
+}
+static DEVICE_ATTR_RW(dirfilter);
+
 static void ledtrig_tty_work(struct work_struct *work)
 {
 	struct ledtrig_tty_data *trigger_data =
@@ -122,7 +165,14 @@ static void ledtrig_tty_work(struct work_struct *work)
 
 	if (icount.rx != trigger_data->rx ||
 	    icount.tx != trigger_data->tx) {
-		led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
+		if (trigger_data->indirection) {
+			if (icount.rx != trigger_data->rx)
+				led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
+		} else if (trigger_data->outdirection) {
+			if (icount.tx != trigger_data->tx)
+				led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
+		} else
+			led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
 
 		trigger_data->rx = icount.rx;
 		trigger_data->tx = icount.tx;
@@ -137,6 +187,7 @@ static void ledtrig_tty_work(struct work_struct *work)
 
 static struct attribute *ledtrig_tty_attrs[] = {
 	&dev_attr_ttyname.attr,
+	&dev_attr_dirfilter.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(ledtrig_tty);
-- 
2.20.1

