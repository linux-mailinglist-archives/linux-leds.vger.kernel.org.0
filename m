Return-Path: <linux-leds+bounces-8075-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7hpjMni7AGpGMAEAu9opvQ
	(envelope-from <linux-leds+bounces-8075-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 19:08:08 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A6350548C
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 19:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09F803001C4B
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 17:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647A83B2FC7;
	Sun, 10 May 2026 17:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vItAYTbN"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC51253B42;
	Sun, 10 May 2026 17:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778432886; cv=none; b=IJ6n0Kr8psBVt9MprO1XEnRYAlfy5kKGJ2CaR/tDXQGPfr6XnsF8tterEKJWZZFv5a6nRjnN41odk4CtPQuRQCkMaLSW2k3jz3PV2izmYv0h5TE/B7m7FBg+Mvz1sI4zlFgwT2suPZuuXlvkSMjmf/3NCk0XOREXw5fDQZ5erNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778432886; c=relaxed/simple;
	bh=DmaaqQ+1IvWQqu/QWIYcpgG+vPszNRveAj7JBVSE7Jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DcMT2ogx4YuvXkEylEOy1JgUZvifSvQYmZba0BVax98OCQ9g/7VLO5zvquMRt8IK6/H2VWLIgOHOjU88rP5JEY2oZqMPGtEQ+sNp3vLMkkiVZkE4+KeXUxZdZ8krDE1X3i1Mn7N9wtkBzaTZwXsWyua5QAMAO+eSdtJhflxvS4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vItAYTbN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7400C2BCFD;
	Sun, 10 May 2026 17:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778432886;
	bh=DmaaqQ+1IvWQqu/QWIYcpgG+vPszNRveAj7JBVSE7Jc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vItAYTbNtUJb1wu0vLc92nOO+85liWr+hYHETrAoA52Wzop7+b+8F/zNCZu1xaP0m
	 tGR1qeiUyuNJP7Qek48MrpdNxezbiywVVw64yEbstiABMYllTf02pLOPN8ZJT1A1K+
	 SREH2gIszn6B9Xxenc79xtUCXitIIKvzfHM0K8CeQZFUgW9kqFn22H4p8TRMo/R1/4
	 O/szN2FhobHNoqncXUshGmqUaNR6c/Cyh6bJbJZaok5+cmhsTW6f65i4EyhQ56Ag08
	 ik3lQlT0MJT8gHMvd0gIVT1wQEa3JjDfvTXnS5ouFMgX5bzKm/ph5c7uYMapZ2l+Jx
	 QdbWKCOoJ3NwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9724CD37BE;
	Sun, 10 May 2026 17:08:05 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Mon, 11 May 2026 00:08:03 +0700
Subject: [PATCH 2/2] backlight: sy7758: add Silergy SY7758 backlight driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-sy7758-v1-2-999a33081304@gmail.com>
References: <20260511-sy7758-v1-0-999a33081304@gmail.com>
In-Reply-To: <20260511-sy7758-v1-0-999a33081304@gmail.com>
To: Philippe Simons <simons.philippe@gmail.com>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778432883; l=7264;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=9XCTIbMoV49y1xex8SxBrgLyf7GaS0QW2nGCwz+d0Fo=;
 b=w4H2miBquw/vmK2oBk/P8SIhaq7vtIOc/wuxLqy86jD5m7ltkZiQxcjgmCFBNgBFKnldsN/BO
 fcTis5LJoKpBXYppCZ6M53MTP2DNEAyOuwxpjFdBL2UR9TNFq50R97r
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com
X-Rspamd-Queue-Id: 33A6350548C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8075-lists,linux-leds=lfdr.de,azkali.limited.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,gmx.de];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[azkali.limited@gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Alexandre Hamamdjian <azkali.limited@gmail.com>

Add a driver for the Silergy SY7758 I2C-controlled multi-channel LED
backlight controller. The chip drives the edge-lit LED strings of LCD
panels in handheld and embedded devices, and is for example present on
the Ayaneo Pocket DS handheld where it drives the panel backlight.

The driver registers a backlight class device with a 12-bit linear
brightness range. On the first non-zero update, the chip's mode and
current configuration registers are programmed; subsequent brightness
updates only rewrite the two brightness registers. A mutex serialises
concurrent updates against the deferred init path.

Co-developed-by: Philippe Simons <simons.philippe@gmail.com>
Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
 drivers/video/backlight/Kconfig  |  14 ++++
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/sy7758.c | 169 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 184 insertions(+)

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index a7a3fbaf7c29..c529d2861525 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -461,6 +461,20 @@ config BACKLIGHT_SKY81452
 	  To compile this driver as a module, choose M here: the module will
 	  be called sky81452-backlight
 
+config BACKLIGHT_SY7758
+	tristate "Backlight Driver for Silergy SY7758"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  This enables support for the Silergy SY7758 I2C-controlled
+	  multi-channel LED backlight driver, commonly used to drive the
+	  edge-lit LED strings of LCD panels in handheld and embedded
+	  devices. The driver exposes a 12-bit linear brightness control
+	  through the standard backlight class.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called sy7758.
+
 config BACKLIGHT_TPS65217
 	tristate "TPS65217 Backlight"
 	depends on MFD_TPS65217
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 794820a98ed4..00d3e379b297 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_BACKLIGHT_QCOM_WLED)	+= qcom-wled.o
 obj-$(CONFIG_BACKLIGHT_RT4831)		+= rt4831-backlight.o
 obj-$(CONFIG_BACKLIGHT_SAHARA)		+= kb3886_bl.o
 obj-$(CONFIG_BACKLIGHT_SKY81452)	+= sky81452-backlight.o
+obj-$(CONFIG_BACKLIGHT_SY7758)		+= sy7758.o
 obj-$(CONFIG_BACKLIGHT_TPS65217)	+= tps65217_bl.o
 obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
 obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+= arcxcnn_bl.o
diff --git a/drivers/video/backlight/sy7758.c b/drivers/video/backlight/sy7758.c
new file mode 100644
index 000000000000..6a318bd62030
--- /dev/null
+++ b/drivers/video/backlight/sy7758.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Backlight driver for the Silergy sy7758
+ *
+ * Copyright (C) 2025 Kancy Joe <kancy2333@outlook.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#define DEFAULT_BRIGHTNESS 1500
+#define MAX_BRIGHTNESS 4080
+#define REG_MAX 0xa9
+
+#define BL_BRT_L 0x10
+#define BL_BRT_H 0x11
+
+static DEFINE_MUTEX(sy7758_update_backlight_mutex);
+
+struct sy7758 {
+	struct i2c_client *client;
+	struct regmap *regmap;
+	bool led_on;
+};
+
+static void sy7758_init(struct sy7758 *sydev);
+
+static const struct regmap_config sy7758_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = REG_MAX,
+};
+
+static int sy7758_write(struct sy7758 *sydev, unsigned int reg,
+			 unsigned int val)
+{
+	return regmap_write(sydev->regmap, reg, val);
+}
+
+static int sy7758_backlight_update_status(struct backlight_device *backlight_dev)
+{
+	struct sy7758 *sydev = bl_get_data(backlight_dev);
+	unsigned int brightness = backlight_get_brightness(backlight_dev);
+
+	mutex_lock(&sy7758_update_backlight_mutex);
+
+	if (!sydev->led_on && brightness > 0) {
+		sy7758_init(sydev);
+		sydev->led_on = true;
+	} else if (brightness == 0) {
+		sydev->led_on = false;
+	}
+
+	sy7758_write(sydev, BL_BRT_L, brightness & 0xf0);
+
+	sy7758_write(sydev, BL_BRT_H, (brightness >> 8) & 0xf);
+
+	mutex_unlock(&sy7758_update_backlight_mutex);
+	return 0;
+}
+
+static const struct backlight_ops sy7758_backlight_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = sy7758_backlight_update_status,
+};
+
+static void sy7758_init(struct sy7758 *sydev)
+{
+	sy7758_write(sydev, 0x01, 0x85);
+	sy7758_write(sydev, 0x10, 0x00);
+	sy7758_write(sydev, 0x11, 0x00);
+	sy7758_write(sydev, 0xa5, 0x64);
+	sy7758_write(sydev, 0xa0, 0x55);
+	sy7758_write(sydev, 0xa1, 0x9a);
+	sy7758_write(sydev, 0xa9, 0x80);
+	sy7758_write(sydev, 0xa2, 0x28);
+
+	usleep_range(10000, 11000);
+
+	sy7758_write(sydev, 0x10, 0x40);
+	sy7758_write(sydev, 0x11, 0x01);
+	// Max brightness
+	// 0x10: 0xf0 Low
+	// 0x11: 0x0f High
+
+	// Min brightness
+	// 0x10: 0x10  Low
+	// 0x11: 0x00  High
+	sydev->led_on = true;
+}
+
+static int sy7758_probe(struct i2c_client *client)
+{
+	struct backlight_device *backlight_dev;
+	struct backlight_properties props;
+	struct sy7758 *sydev;
+
+	sydev = devm_kzalloc(&client->dev, sizeof(*sydev), GFP_KERNEL);
+	if (!sydev)
+		return -ENOMEM;
+
+	sydev->client = client;
+	sydev->regmap = devm_regmap_init_i2c(client, &sy7758_regmap_config);
+	if (IS_ERR(sydev->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(sydev->regmap),
+			"failed to init regmap\n");
+
+	memset(&props, 0, sizeof(props));
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = MAX_BRIGHTNESS;
+	props.brightness = DEFAULT_BRIGHTNESS;
+	props.scale = BACKLIGHT_SCALE_LINEAR;
+
+	backlight_dev = devm_backlight_device_register(&client->dev, "sy7758-backlight",
+					&client->dev, sydev, &sy7758_backlight_ops, &props);
+	if (IS_ERR(backlight_dev))
+		return dev_err_probe(&client->dev, PTR_ERR(backlight_dev),
+				"failed to register backlight device\n");
+
+	sy7758_init(sydev);
+
+	i2c_set_clientdata(client, backlight_dev);
+	backlight_update_status(backlight_dev);
+
+	return 0;
+}
+
+static void sy7758_remove(struct i2c_client *client)
+{
+	struct backlight_device *backlight_dev = i2c_get_clientdata(client);
+
+	backlight_dev->props.brightness = 0;
+	backlight_update_status(backlight_dev);
+}
+
+static const struct i2c_device_id sy7758_ids[] = {
+	{ "sy7758" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, sy7758_ids);
+
+static const struct of_device_id sy7758_match_table[] = {
+	{
+		.compatible = "silergy,sy7758",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, sy7758_match_table);
+
+static struct i2c_driver sy7758_driver = {
+	.driver = {
+		.name = "sy7758",
+		.of_match_table = sy7758_match_table,
+	},
+	.probe = sy7758_probe,
+	.remove = sy7758_remove,
+	.id_table = sy7758_ids,
+};
+
+module_i2c_driver(sy7758_driver);
+
+MODULE_DESCRIPTION("Silergy sy7758 Backlight Driver");
+MODULE_AUTHOR("Kancy Joe <kancy2333@outlook.com>");
+MODULE_LICENSE("GPL");

-- 
2.54.0



