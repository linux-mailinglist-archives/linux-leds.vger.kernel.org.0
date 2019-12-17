Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9246122682
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 09:18:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfLQISG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 03:18:06 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34051 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfLQIRw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Dec 2019 03:17:52 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ih839-0000yJ-68; Tue, 17 Dec 2019 09:17:47 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ih838-0002Ib-Cu; Tue, 17 Dec 2019 09:17:46 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-serial@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v2 3/3] leds: trigger: implement a tty trigger
Date:   Tue, 17 Dec 2019 09:17:18 +0100
Message-Id: <20191217081718.23807-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191217081718.23807-1-u.kleine-koenig@pengutronix.de>
References: <20191217081718.23807-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Usage is as follows:

	myled=ledname
	tty=ttyS0

	echo tty > /sys/class/led/$myled/trigger
	cat /sys/class/tty/$tty/dev > /sys/class/led/$myled/dev

. When this new trigger is active it periodically checks the tty's
statistics and when it changed since the last check the led is flashed
once.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/trigger/Kconfig       |   7 ++
 drivers/leds/trigger/Makefile      |   1 +
 drivers/leds/trigger/ledtrig-tty.c | 146 +++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 drivers/leds/trigger/ledtrig-tty.c

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index ce9429ca6dde..40ff08c93f56 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -144,4 +144,11 @@ config LEDS_TRIGGER_AUDIO
 	  the audio mute and mic-mute changes.
 	  If unsure, say N
 
+config LEDS_TRIGGER_TTY
+	tristate "LED Trigger for TTY devices"
+	depends on TTY
+	help
+	  This allows LEDs to be controlled by activity on ttys which includes
+	  serial devices like /dev/ttyS0.
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
index 000000000000..3f3197366700
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/tty.h>
+#include <uapi/linux/serial.h>
+
+struct ledtrig_tty_data {
+	struct led_classdev *led_cdev;
+	struct delayed_work dwork;
+	struct tty_struct *tty;
+	dev_t device;
+	struct serial_icounter_struct icount;
+};
+
+static void ledtrig_tty_halt(struct ledtrig_tty_data *trigger_data)
+{
+	cancel_delayed_work_sync(&trigger_data->dwork);
+}
+
+static void ledtrig_tty_restart(struct ledtrig_tty_data *trigger_data)
+{
+	if (!trigger_data->tty)
+		return;
+
+	schedule_delayed_work(&trigger_data->dwork, 0);
+}
+
+static ssize_t dev_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
+{
+	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
+	ssize_t len = 0;
+
+	if (trigger_data->tty)
+		len = sprintf(buf, "%u\n", trigger_data->device);
+
+	return len;
+}
+
+static ssize_t dev_store(struct device *dev,
+			 struct device_attribute *attr, const char *buf,
+			 size_t size)
+{
+	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
+	struct tty_struct *tty;
+	unsigned major, minor;
+	int ret;
+
+	if (size == 0 || (size == 1 && buf[0] == '\n')) {
+		tty = NULL;
+	} else {
+		ret = sscanf(buf, "%u:%u", &major, &minor);
+		if (ret < 2) {
+			dev_err(dev, "invalid value\n");
+			return -EINVAL;
+		}
+
+		tty = tty_kopen_shared(MKDEV(major, minor));
+		if (IS_ERR(tty)) {
+			dev_err(dev, "failed to open tty: %pe\n", tty);
+			return PTR_ERR(tty);
+		}
+	}
+
+	ledtrig_tty_halt(trigger_data);
+
+	tty_kref_put(trigger_data->tty);
+	trigger_data->tty = tty;
+	trigger_data->device = MKDEV(major, minor);
+
+	ledtrig_tty_restart(trigger_data);
+
+	return size;
+}
+static DEVICE_ATTR_RW(dev);
+
+static void ledtrig_tty_work(struct work_struct *work)
+{
+	struct ledtrig_tty_data *trigger_data =
+		container_of(work, struct ledtrig_tty_data, dwork.work);
+	struct serial_icounter_struct icount;
+	int ret;
+
+	if (!trigger_data->tty) {
+		led_set_brightness(trigger_data->led_cdev, LED_OFF);
+		return;
+	}
+
+	ret = tty_get_icount(trigger_data->tty, &icount);
+	if (icount.rx > trigger_data->icount.rx ||
+	    icount.tx > trigger_data->icount.tx) {
+		unsigned long delay_on = 100, delay_off = 100;
+
+		led_blink_set_oneshot(trigger_data->led_cdev,
+				      &delay_on, &delay_off, 0);
+
+		trigger_data->icount = icount;
+	}
+
+	schedule_delayed_work(&trigger_data->dwork, msecs_to_jiffies(100));
+}
+
+static struct attribute *ledtrig_tty_attrs[] = {
+	&dev_attr_dev.attr,
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
2.24.0

