Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9BD228B4A5
	for <lists+linux-leds@lfdr.de>; Mon, 12 Oct 2020 14:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388498AbgJLMeJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 12 Oct 2020 08:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388334AbgJLMeI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 12 Oct 2020 08:34:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A83C0613D0
        for <linux-leds@vger.kernel.org>; Mon, 12 Oct 2020 05:34:08 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kRx1f-0001F7-N6; Mon, 12 Oct 2020 14:34:03 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kRx1d-0007Su-AC; Mon, 12 Oct 2020 14:34:01 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-leds@vger.kernel.org,
        linux-serial@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/3] leds: trigger: implement a tty trigger
Date:   Mon, 12 Oct 2020 14:33:58 +0200
Message-Id: <20201012123358.1475928-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012123358.1475928-1-u.kleine-koenig@pengutronix.de>
References: <20201012123358.1475928-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Usage is as follows:

	myled=ledname
	tty=ttyS0

	echo tty > /sys/class/leds/$myled/trigger
	echo $tty > /sys/class/leds/$myled/ttyname

. When this new trigger is active it periodically checks the tty's
statistics and when it changed since the last check the led is flashed
once.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../ABI/testing/sysfs-class-led-trigger-tty   |   6 +
 drivers/leds/trigger/Kconfig                  |   9 +
 drivers/leds/trigger/Makefile                 |   1 +
 drivers/leds/trigger/ledtrig-tty.c            | 187 ++++++++++++++++++
 4 files changed, 203 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-tty
 create mode 100644 drivers/leds/trigger/ledtrig-tty.c

diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-tty b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
new file mode 100644
index 000000000000..5c53ce3ede36
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
@@ -0,0 +1,6 @@
+What:		/sys/class/leds/<led>/ttyname
+Date:		Jul 2020
+KernelVersion:	5.8
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Specifies the tty device name of the triggering tty
diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index ce9429ca6dde..b77a01bd27f4 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -144,4 +144,13 @@ config LEDS_TRIGGER_AUDIO
 	  the audio mute and mic-mute changes.
 	  If unsure, say N
 
+config LEDS_TRIGGER_TTY
+	tristate "LED Trigger for TTY devices"
+	depends on TTY
+	help
+	  This allows LEDs to be controlled by activity on ttys which includes
+	  serial devices like /dev/ttyS0.
+
+	  When build as a module this driver will be called ledtrig-tty.
+
 endif # LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
index 733a83e2a718..25c4db97cdd4 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+= ledtrig-panic.o
 obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
 obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
 obj-$(CONFIG_LEDS_TRIGGER_AUDIO)	+= ledtrig-audio.o
+obj-$(CONFIG_LEDS_TRIGGER_TTY)		+= ledtrig-tty.o
diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
new file mode 100644
index 000000000000..806548e33cd8
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/delay.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/tty.h>
+#include <uapi/linux/serial.h>
+
+struct ledtrig_tty_data {
+	struct led_classdev *led_cdev;
+	struct delayed_work dwork;
+	struct mutex mutex;
+	const char *ttyname;
+	struct tty_struct *tty;
+	int rx, tx;
+};
+
+static void ledtrig_tty_halt(struct ledtrig_tty_data *trigger_data)
+{
+	cancel_delayed_work_sync(&trigger_data->dwork);
+}
+
+static void ledtrig_tty_restart(struct ledtrig_tty_data *trigger_data)
+{
+	schedule_delayed_work(&trigger_data->dwork, 0);
+}
+
+static ssize_t ttyname_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
+	ssize_t len = 0;
+
+	mutex_lock(&trigger_data->mutex);
+
+	if (trigger_data->ttyname)
+		len = sprintf(buf, "%s\n", trigger_data->ttyname);
+
+	mutex_unlock(&trigger_data->mutex);
+
+	return len;
+}
+
+static ssize_t ttyname_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t size)
+{
+	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
+	char *ttyname;
+	ssize_t ret = size;
+
+	ledtrig_tty_halt(trigger_data);
+
+	mutex_lock(&trigger_data->mutex);
+
+	if (size > 0 && buf[size - 1] == '\n')
+		size -= 1;
+
+	if (size) {
+		ttyname = kmemdup_nul(buf, size, GFP_KERNEL);
+		if (!ttyname) {
+			ret = -ENOMEM;
+			goto out_unlock;
+		}
+	} else {
+		ttyname = NULL;
+	}
+
+	kfree(trigger_data->ttyname);
+	tty_kref_put(trigger_data->tty);
+	trigger_data->tty = NULL;
+
+	trigger_data->ttyname = ttyname;
+
+out_unlock:
+	mutex_unlock(&trigger_data->mutex);
+
+	if (ttyname)
+		ledtrig_tty_restart(trigger_data);
+
+	return ret;
+}
+static DEVICE_ATTR_RW(ttyname);
+
+static void ledtrig_tty_work(struct work_struct *work)
+{
+	struct ledtrig_tty_data *trigger_data =
+		container_of(work, struct ledtrig_tty_data, dwork.work);
+	struct serial_icounter_struct icount;
+	int ret;
+	bool firstrun = false;
+
+	mutex_lock(&trigger_data->mutex);
+
+	BUG_ON(!trigger_data->ttyname);
+
+	/* try to get the tty corresponding to $ttyname */
+	if (!trigger_data->tty) {
+		dev_t devno;
+		struct tty_struct *tty;
+		int ret;
+
+		firstrun = true;
+
+		ret = tty_dev_name_to_number(trigger_data->ttyname, &devno);
+		if (ret < 0)
+			/*
+			 * A device with this name might appear later, so keep
+			 * retrying.
+			 */
+			goto out;
+
+		tty = tty_kopen_shared(devno);
+		if (IS_ERR(tty) || !tty)
+			/* What to do? retry or abort */
+			goto out;
+
+		trigger_data->tty = tty;
+	}
+
+	ret = tty_get_icount(trigger_data->tty, &icount);
+	if (ret) {
+		mutex_unlock(&trigger_data->mutex);
+		dev_info(trigger_data->tty->dev, "Failed to get icount, stopped polling\n");
+		mutex_unlock(&trigger_data->mutex);
+		return;
+	}
+
+	if (icount.rx != trigger_data->rx ||
+	    icount.tx != trigger_data->tx) {
+		led_set_brightness(trigger_data->led_cdev, LED_ON);
+
+		trigger_data->rx = icount.rx;
+		trigger_data->tx = icount.tx;
+	} else {
+		led_set_brightness(trigger_data->led_cdev, LED_OFF);
+	}
+
+out:
+	mutex_unlock(&trigger_data->mutex);
+	schedule_delayed_work(&trigger_data->dwork, msecs_to_jiffies(100));
+}
+
+static struct attribute *ledtrig_tty_attrs[] = {
+	&dev_attr_ttyname.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(ledtrig_tty);
+
+static int ledtrig_tty_activate(struct led_classdev *led_cdev)
+{
+	struct ledtrig_tty_data *trigger_data;
+
+	trigger_data = kzalloc(sizeof(*trigger_data), GFP_KERNEL);
+	if (!trigger_data)
+		return -ENOMEM;
+
+	led_set_trigger_data(led_cdev, trigger_data);
+
+	INIT_DELAYED_WORK(&trigger_data->dwork, ledtrig_tty_work);
+	trigger_data->led_cdev = led_cdev;
+	mutex_init(&trigger_data->mutex);
+
+	return 0;
+}
+
+static void ledtrig_tty_deactivate(struct led_classdev *led_cdev)
+{
+	struct ledtrig_tty_data *trigger_data = led_get_trigger_data(led_cdev);
+
+	cancel_delayed_work_sync(&trigger_data->dwork);
+
+	kfree(trigger_data);
+}
+
+struct led_trigger ledtrig_tty = {
+	.name = "tty",
+	.activate = ledtrig_tty_activate,
+	.deactivate = ledtrig_tty_deactivate,
+	.groups = ledtrig_tty_groups,
+};
+module_led_trigger(ledtrig_tty);
+
+MODULE_AUTHOR("Uwe Kleine-König <u.kleine-koenig@pengutronix.de>");
+MODULE_DESCRIPTION("UART LED trigger");
+MODULE_LICENSE("GPL v2");
-- 
2.28.0

