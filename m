Return-Path: <linux-leds+bounces-2364-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7339437EC
	for <lists+linux-leds@lfdr.de>; Wed, 31 Jul 2024 23:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18A15B24840
	for <lists+linux-leds@lfdr.de>; Wed, 31 Jul 2024 21:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A4E16DEC2;
	Wed, 31 Jul 2024 21:25:01 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA2516D9AF;
	Wed, 31 Jul 2024 21:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722461101; cv=none; b=eOrowhYWzAzpWA5J4y5y8ovyaqx2EpsO7GKj8m0BOhGyOJ/ZkHoUmA0We2J7+Gfm7ULSYiPwO/D2Chs5/PmAyeRekzpRMpWwgX6RU3ghIzHOPMBMGG/F2CNmKMlm2mC5/Ha1kgWK3372fUVCCzMCuj3sXFK2H9qZtmwP53iEDa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722461101; c=relaxed/simple;
	bh=ULT8ulKcjDUZJlnU+wdgGsXETWtTdeJK7PeGSa1ODsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DcrFlghdEVBKkGGgBc1vqidkUfTQk9X9D2dLuGyJ7xaIa2tEvcNxItYbaQl22NmiDNTy/C6vvS3kVNbjP1TWVblxJjAo2reSL7O0gLzdm5J6WMmjqz4CdRKd/WIfCArf0mvwWrwyPNmpSA/cjINp6hHIIRkpUvJb9c4qcytRGdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875ac5.versanet.de ([83.135.90.197] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sZGoO-0007jg-FM; Wed, 31 Jul 2024 23:24:44 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	dmitry.torokhov@gmail.com,
	pavel@ucw.cz
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v3 4/7] Input: add driver for the input part of qnap-mcu devices
Date: Wed, 31 Jul 2024 23:24:27 +0200
Message-Id: <20240731212430.2677900-5-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731212430.2677900-1-heiko@sntech.de>
References: <20240731212430.2677900-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MCU controls the power-button and beeper, so expose them as input
device. There is of course no interrupt line, so the status of the
power-button needs to be polled. To generate an event the power-button
also needs to be held for 1-2 seconds, so the polling interval does
not need to be overly fast.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 MAINTAINERS                         |   1 +
 drivers/input/misc/Kconfig          |  12 +++
 drivers/input/misc/Makefile         |   1 +
 drivers/input/misc/qnap-mcu-input.c | 161 ++++++++++++++++++++++++++++
 4 files changed, 175 insertions(+)
 create mode 100644 drivers/input/misc/qnap-mcu-input.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 69c770ce73ee5..fa486343d9827 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18654,6 +18654,7 @@ F:	drivers/media/tuners/qm1d1c0042*
 QNAP MCU DRIVER
 M:	Heiko Stuebner <heiko@sntech.de>
 S:	Maintained
+F:	drivers/input/misc/qnap-mcu-input.c
 F:	drivers/leds/leds-qnap-mcu.c
 F:	drivers/mfd/qnap-mcu.c
 F:	include/linux/qnap-mcu.h
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 6a852c76331b6..13d135257e060 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -917,6 +917,18 @@ config INPUT_HISI_POWERKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called hisi_powerkey.
 
+config INPUT_QNAP_MCU
+	tristate "Input Support for QNAP MCU controllers"
+	depends on MFD_QNAP_MCU
+	help
+	  This option enables support for input elements available on
+	  embedded controllers used in QNAP NAS devices.
+
+	  This includes a polled power-button as well as a beeper.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called qnap-mcu-input.
+
 config INPUT_RAVE_SP_PWRBUTTON
 	tristate "RAVE SP Power button Driver"
 	depends on RAVE_SP_CORE
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 4f7f736831ba8..6d91804d0a6f7 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_INPUT_PMIC8XXX_PWRKEY)	+= pmic8xxx-pwrkey.o
 obj-$(CONFIG_INPUT_POWERMATE)		+= powermate.o
 obj-$(CONFIG_INPUT_PWM_BEEPER)		+= pwm-beeper.o
 obj-$(CONFIG_INPUT_PWM_VIBRA)		+= pwm-vibra.o
+obj-$(CONFIG_INPUT_QNAP_MCU)		+= qnap-mcu-input.o
 obj-$(CONFIG_INPUT_RAVE_SP_PWRBUTTON)	+= rave-sp-pwrbutton.o
 obj-$(CONFIG_INPUT_RB532_BUTTON)	+= rb532_button.o
 obj-$(CONFIG_INPUT_REGULATOR_HAPTIC)	+= regulator-haptic.o
diff --git a/drivers/input/misc/qnap-mcu-input.c b/drivers/input/misc/qnap-mcu-input.c
new file mode 100644
index 0000000000000..8debc8f988246
--- /dev/null
+++ b/drivers/input/misc/qnap-mcu-input.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Driver for input events on QNAP-MCUs
+ *
+ * Copyright (C) 2024 Heiko Stuebner <heiko@sntech.de>
+ */
+
+#include <linux/input.h>
+#include <linux/mfd/qnap-mcu.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <uapi/linux/input-event-codes.h>
+
+/*
+ * The power-key needs to be pressed for a while to create an event,
+ * so there is no use for overly frequent polling.
+ */
+#define POLL_INTERVAL		500
+
+struct qnap_mcu_input_dev {
+	struct input_dev *input;
+	struct qnap_mcu *mcu;
+	struct device *dev;
+
+	struct work_struct beep_work;
+	int beep_type;
+};
+
+static void qnap_mcu_input_poll(struct input_dev *input)
+{
+	struct qnap_mcu_input_dev *idev = input_get_drvdata(input);
+	static const u8 cmd[] = {
+		[0] = 0x40, /* @ */
+		[1] = 0x43, /* C */
+		[2] = 0x56  /* V */
+	};
+	u8 reply[4];
+	int state, ret;
+
+	/* poll the power button */
+	ret = qnap_mcu_exec(idev->mcu, cmd, sizeof(cmd), reply, sizeof(reply));
+	if (ret)
+		return;
+
+	/* First bytes must mirror the sent command */
+	if (memcmp(cmd, reply, sizeof(cmd))) {
+		dev_err(idev->dev, "malformed data received\n");
+		return;
+	}
+
+	state = reply[3] - 0x30;
+	input_event(input, EV_KEY, KEY_POWER, state);
+	input_sync(input);
+}
+
+static void qnap_mcu_input_beeper_work(struct work_struct *work)
+{
+	struct qnap_mcu_input_dev *idev =
+		container_of(work, struct qnap_mcu_input_dev, beep_work);
+	const u8 cmd[] = {
+		[0] = 0x40, /* @ */
+		[1] = 0x43, /* C */
+		[2] = (idev->beep_type == SND_TONE) ? 0x33 : 0x32
+	};
+
+	qnap_mcu_exec_with_ack(idev->mcu, cmd, sizeof(cmd));
+}
+
+static int qnap_mcu_input_event(struct input_dev *input, unsigned int type,
+				unsigned int code, int value)
+{
+	struct qnap_mcu_input_dev *idev = input_get_drvdata(input);
+
+	if (type != EV_SND || (code != SND_BELL && code != SND_TONE))
+		return -EOPNOTSUPP;
+
+	if (value < 0)
+		return -EINVAL;
+
+	/* beep runtime is determined by the MCU */
+	if (value == 0)
+		return 0;
+
+	/* Schedule work to actually turn the beeper on */
+	idev->beep_type = code;
+	schedule_work(&idev->beep_work);
+
+	return 0;
+}
+
+static void qnap_mcu_input_close(struct input_dev *input)
+{
+	struct qnap_mcu_input_dev *idev = input_get_drvdata(input);
+
+	cancel_work_sync(&idev->beep_work);
+}
+
+static int qnap_mcu_input_probe(struct platform_device *pdev)
+{
+	struct qnap_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
+	struct qnap_mcu_input_dev *idev;
+	struct device *dev = &pdev->dev;
+	struct input_dev *input;
+	int ret;
+
+	idev = devm_kzalloc(dev, sizeof(*idev), GFP_KERNEL);
+	if (!idev)
+		return -ENOMEM;
+
+	input = devm_input_allocate_device(dev);
+	if (!input)
+		return dev_err_probe(dev, -ENOMEM, "no memory for input device\n");
+
+	idev->input = input;
+	idev->dev = dev;
+	idev->mcu = mcu;
+
+	input_set_drvdata(input, idev);
+
+	input->name		= "qnap-mcu";
+	input->phys		= "qnap-mcu-input/input0";
+	input->id.bustype	= BUS_HOST;
+	input->id.vendor	= 0x0001;
+	input->id.product	= 0x0001;
+	input->id.version	= 0x0100;
+	input->event		= qnap_mcu_input_event;
+	input->close		= qnap_mcu_input_close;
+
+	input_set_capability(input, EV_KEY, KEY_POWER);
+	input_set_capability(input, EV_SND, SND_BELL);
+	input_set_capability(input, EV_SND, SND_TONE);
+
+	INIT_WORK(&idev->beep_work, qnap_mcu_input_beeper_work);
+
+	ret = input_setup_polling(input, qnap_mcu_input_poll);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to set up polling\n");
+
+	input_set_poll_interval(input, POLL_INTERVAL);
+
+	ret = input_register_device(input);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to register input device\n");
+
+	return 0;
+}
+
+static struct platform_driver qnap_mcu_input_driver = {
+	.probe = qnap_mcu_input_probe,
+	.driver = {
+		.name = "qnap-mcu-input",
+	},
+};
+module_platform_driver(qnap_mcu_input_driver);
+
+MODULE_ALIAS("platform:qnap-mcu-input");
+MODULE_AUTHOR("Heiko Stuebner <heiko@sntech.de>");
+MODULE_DESCRIPTION("QNAP MCU input driver");
+MODULE_LICENSE("GPL");
-- 
2.39.2


