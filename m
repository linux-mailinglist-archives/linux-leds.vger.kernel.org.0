Return-Path: <linux-leds+bounces-3290-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 361429BDB7E
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 02:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 593871C22888
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 01:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CE318BBBB;
	Wed,  6 Nov 2024 01:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="WYzvBVLb"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com [52.119.213.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D266BFCA;
	Wed,  6 Nov 2024 01:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730858089; cv=none; b=GDrgH4vryXdaHWnvZ7IfH5r8CTS+7kGORFQ2sKbQVjRb0Q24lwlt8M9XrZ33UB7f8Kyb5FrSgXKKHJwgCmpk63+YNnIyyVwY5K0BRw1IKen5eyvj7MP4QqFnbIoCeuyTte2D8oXObIbzSBcMC/K+WA1CWcikG/hkS5c0MxQpqzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730858089; c=relaxed/simple;
	bh=aG3UK+CVuWHOb3OOJcJnDpLZgZTUdLmLjz460K3Pfy8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bvzkSaReGUlhQsYX9vyqwETgwb/hnYAQZdM6fkFYA80t1/N+CR6CwuPoINuizC/G7cvqB4MdzbijFllNlLGrJ6nhiIcRmoHQPtGVB0Rkdqxr7gteZ9kvIJUHEOGjnQ9byPoi0506c/EGG2oUGoTe/n4IBoOiMFwccXvaqNC5ybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=WYzvBVLb; arc=none smtp.client-ip=52.119.213.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730858088; x=1762394088;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zThZNmrvdvQBHwrxPBNp03hJ36qLcErblHLPxcP3g8Q=;
  b=WYzvBVLbx8WbgWdOMdQku+p3NtaWscV3OVLzOj+W4jK6yxgoMrMWaq2y
   hxImiP7EZHqk4D9BI+FZOAXf+oXMe1NB30xGxgjiaYLUDMA1fiadUPiQs
   k94fds1Vn85XlX72jdXuEGqLFmaLa5G9JV/PuxRupOr+ZPDOdGtCJw+TN
   0=;
X-IronPort-AV: E=Sophos;i="6.11,261,1725321600"; 
   d="scan'208";a="693368507"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 01:54:46 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.7.35:61550]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.37:2525] with esmtp (Farcaster)
 id 4f1531bb-e8bf-48a2-93c4-f41193bd1676; Wed, 6 Nov 2024 01:54:45 +0000 (UTC)
X-Farcaster-Flow-ID: 4f1531bb-e8bf-48a2-93c4-f41193bd1676
Received: from EX19D018UWC002.ant.amazon.com (10.13.138.159) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 6 Nov 2024 01:54:44 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D018UWC002.ant.amazon.com (10.13.138.159) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 6 Nov 2024 01:54:44 +0000
Received: from email-imr-corp-prod-pdx-1box-2b-8c2c6aed.us-west-2.amazon.com
 (10.25.36.214) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Wed, 6 Nov 2024 01:54:44 +0000
Received: from u82295ab0776f5b.ant.amazon.com (u82295ab0776f5b.ant.amazon.com [10.68.86.58])
	by email-imr-corp-prod-pdx-1box-2b-8c2c6aed.us-west-2.amazon.com (Postfix) with ESMTP id 32863A059D;
	Wed,  6 Nov 2024 01:54:44 +0000 (UTC)
From: <anishkmr@amazon.com>
To: <pavel@ucw.cz>, <dmurphy@ti.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Anish Kumar
	<anishkmr@amazon.com>, Anish Kumar <yesanishhere@gmail.com>, Karthik Poduval
	<kpoduval@lab126.com>, Yue Hu <yhuamzn@amazon.com>
Subject: [PATCH] leds: driver for O2 Micro LED IC
Date: Tue, 5 Nov 2024 17:54:41 -0800
Message-ID: <20241106015441.995014-1-anishkmr@amazon.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anish Kumar <anishkmr@amazon.com>

LED Driver for O2 Micro LED IC

reviewed-by: Anish Kumar <yesanishhere@gmail.com>
Signed-off-by: Karthik Poduval <kpoduval@lab126.com>
Signed-off-by: Yue Hu <yhuamzn@amazon.com>
---
 .../devicetree/bindings/leds/leds-ozl003.txt  |  23 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/leds/Kconfig                          |   6 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-ozl003.c                    | 306 ++++++++++++++++++
 5 files changed, 338 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ozl003.txt
 create mode 100644 drivers/leds/leds-ozl003.c

diff --git a/Documentation/devicetree/bindings/leds/leds-ozl003.txt b/Documentation/devicetree/bindings/leds/leds-ozl003.txt
new file mode 100644
index 000000000000..9dbd78ed1093
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-ozl003.txt
@@ -0,0 +1,23 @@
+*O2 Micro Compact LED Strobe Light Controller
+
+Compact LED strobe light controller, can be controlled by I2C or via a
+PWM gpio controlled.
+
+Required properties:
+- compatible : "o2micro,ozl003"
+- #address-cells: must be 1
+- #size-cells: must be 0
+- reg: I2C slave address. depends on the model.
+
+Optional properties:
+- gpio-mode: if set then controlled via gpio
+
+Examples:
+
+irled: ozl003@4b {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+	compatible = "o2micro,ozl003";
+	reg = <0x4B>;
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f6064d84a424..06453649c0e7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -796,6 +796,8 @@ patternProperties:
     description: NVIDIA
   "^nxp,.*":
     description: NXP Semiconductors
+  "^o2micro,.*":
+    description: O2Micro Ltd.
   "^oceanic,.*":
     description: Oceanic Systems (UK) Ltd.
   "^oct,.*":
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b6742b4231bf..ddc5bc0886af 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -732,6 +732,12 @@ config LEDS_OT200
 	  This option enables support for the LEDs on the Bachmann OT200.
 	  Say Y to enable LEDs on the Bachmann OT200.
 
+config LEDS_OZL003
+	tristate "O2 Micro OZL003 Compact LED Strobe Light Controller"
+	depends on LEDS_CLASS && I2C
+	help
+	  This option enables support for O2 Micro LED IC.
+
 config LEDS_MENF21BMC
 	tristate "LED support for the MEN 14F021P00 BMC"
 	depends on LEDS_CLASS && MFD_MENF21BMC
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2a698df9da57..b89c8747466d 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -73,6 +73,7 @@ obj-$(CONFIG_LEDS_NETXBIG)		+= leds-netxbig.o
 obj-$(CONFIG_LEDS_NIC78BX)		+= leds-nic78bx.o
 obj-$(CONFIG_LEDS_NS2)			+= leds-ns2.o
 obj-$(CONFIG_LEDS_OT200)		+= leds-ot200.o
+obj-$(CONFIG_LEDS_OZL003)		+= leds-ozl003.o
 obj-$(CONFIG_LEDS_PCA9532)		+= leds-pca9532.o
 obj-$(CONFIG_LEDS_PCA955X)		+= leds-pca955x.o
 obj-$(CONFIG_LEDS_PCA963X)		+= leds-pca963x.o
diff --git a/drivers/leds/leds-ozl003.c b/drivers/leds/leds-ozl003.c
new file mode 100644
index 000000000000..0b6a98a2ab19
--- /dev/null
+++ b/drivers/leds/leds-ozl003.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/delay.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/leds.h>
+#include <linux/of_gpio.h>
+
+/* Register mapping */
+#define OPERATION_MODE			(0x00)
+#define ISEN1_REG_SETTING		(0x01)
+#define ISEN2_REG_SETTING		(0x02)
+#define DURATION_WDT			(0x03)
+#define STATUS_REG			(0x04)
+#define PROTECTION_THRES		(0x05)
+
+/* Register bit masks */
+#define OPERATION_MODE_CNTRL_MSK	(0x01)
+#define OPERATION_MODE_ENA_MSK		(0x02)
+#define OPERATION_MODE_VLED_MSK		(0xFC)
+#define ISEN_REG_MSK			(0x80)
+#define DURATION_WDT_LED_MSK		(0x80)
+
+/* Default Register values */
+#define ISEN1_CURRENT			(0x7D)
+#define ISEN2_CURRENT			(0x7D)
+#define DEFAULT_STROBE_OP		(0x00)
+#define DEFAULT_VLED_OUTPUT		(0x00)
+#define DEFAULT_PROT_THRES		(0x06)
+#define DEFAULT_WDT_AND_I2C_DISABLE	(0x00)
+
+#define OZL003_MAX_BRIGHTNESS		(127)
+
+struct ozl003 {
+	struct i2c_client *client;
+	bool gpio_mode;
+	struct led_classdev led_dev;
+	enum led_brightness brightness;
+	struct mutex lock;
+	struct work_struct work;
+};
+
+static int ozl003_i2c_read_byte(struct ozl003 *ozl003, u8 addr, u8 *val)
+{
+	int retval;
+	struct i2c_client *client = ozl003->client;
+	struct i2c_adapter *adap = client->adapter;
+	struct i2c_msg msg[2];
+
+	msg[0].addr = client->addr;
+	msg[0].len = 1;
+	msg[0].flags = 0;
+	msg[0].buf = &addr;
+
+	msg[1].addr = client->addr;
+	msg[1].flags = I2C_M_RD;
+	msg[1].len = 1;
+	msg[1].buf = val;
+
+	retval = i2c_transfer(adap, msg, 2);
+	if (retval < 0)
+		return retval;
+	return (retval == 2) ? 0 : -EIO;
+}
+
+static int ozl003_i2c_write_byte(struct ozl003 *ozl003, u8 addr, u8 val)
+{
+	int retval;
+	u8 buf[2];
+	struct i2c_client *client = ozl003->client;
+
+	buf[0] = addr;
+	buf[1] = val;
+
+	retval = i2c_master_send(client, buf, 2);
+	if (retval < 0)
+		return retval;
+	return (retval == 2) ? 0 : -EIO;
+}
+
+static int ozl003_set_led_operation(struct ozl003 *ozl003, bool on)
+{
+	int ret;
+	u8 val;
+
+	/* If we are using gpio to toggle LED, no need to set register */
+	if (ozl003->gpio_mode)
+		return 0;
+
+	ret = ozl003_i2c_read_byte(ozl003, DURATION_WDT, &val);
+	if (unlikely(ret)) {
+		dev_err(&(ozl003->client->dev),
+				"Failed getting WDT register ret=%d\n", ret);
+		return ret;
+	}
+	if (on)
+		val |= DURATION_WDT_LED_MSK;
+	else
+		val &= (~DURATION_WDT_LED_MSK);
+	ret = ozl003_i2c_write_byte(ozl003, DURATION_WDT, val);
+	if (unlikely(ret)) {
+		dev_err(&(ozl003->client->dev),
+				"Failed setting WDT register ret=%d\n", ret);
+	}
+	return ret;
+}
+
+static int ozl003_set_led_brightness(struct ozl003 *ozl003, enum led_brightness brt_val)
+{
+	int ret = 0;
+	u8 s1_current;
+	u8 s2_current;
+
+	s1_current = s2_current = brt_val;
+
+	ret = ozl003_i2c_write_byte(ozl003, ISEN1_REG_SETTING, s1_current);
+	if (unlikely(ret)) {
+		dev_err(&(ozl003->client->dev),
+				"Failed setting SEN1 current register ret=%d\n", ret);
+		return ret;
+	}
+	ret = ozl003_i2c_write_byte(ozl003, ISEN2_REG_SETTING, s2_current);
+	if (unlikely(ret)) {
+		dev_err(&(ozl003->client->dev),
+				"Failed setting SEN2 current ret=%d\n", ret);
+		return ret;
+	}
+	return ret;
+
+}
+
+static void ozl003_led_brightness_work(struct work_struct *work)
+{
+	struct ozl003 *ozl003 = container_of(work, struct ozl003, work);
+
+	mutex_lock(&ozl003->lock);
+
+	if (ozl003->brightness == LED_OFF) {
+		ozl003_set_led_operation(ozl003, false);
+	} else {
+		ozl003_set_led_brightness(ozl003, ozl003->brightness);
+		ozl003_set_led_operation(ozl003, true);
+	}
+
+	mutex_unlock(&ozl003->lock);
+}
+
+static void ozl003_brightness_set(struct led_classdev *led_cdev,
+		enum led_brightness brt_val)
+{
+	struct ozl003 *ozl003 = container_of(led_cdev, struct ozl003, led_dev);
+	bool update_brightness = false;
+
+	mutex_lock(&ozl003->lock);
+
+	if (brt_val != ozl003->brightness)
+		update_brightness = true;
+
+	ozl003->brightness = brt_val;
+
+	mutex_unlock(&ozl003->lock);
+
+	if (update_brightness)
+		schedule_work(&ozl003->work);
+}
+
+static int ozl003_init(struct ozl003 *ozl003)
+{
+	int ret;
+	u8 mode = DEFAULT_VLED_OUTPUT;
+	u8 s1_current = 0;
+	u8 s2_current = 0;
+
+	if (ozl003->gpio_mode) {
+		mode &= (~OPERATION_MODE_CNTRL_MSK);
+	} else { /* I2C mode */
+		mode |= OPERATION_MODE_CNTRL_MSK;
+	}
+
+	ret = ozl003_i2c_write_byte(ozl003, OPERATION_MODE, mode);
+	if (unlikely(ret)) {
+		dev_err(&(ozl003->client->dev),
+				"Failed setting OP register ret=%d\n", ret);
+		return ret;
+	}
+
+	ret = ozl003_i2c_write_byte(ozl003, ISEN1_REG_SETTING, s1_current);
+	if (unlikely(ret)) {
+		dev_err(&(ozl003->client->dev),
+				"Failed setting SEN1 current register ret=%d\n", ret);
+		return ret;
+	}
+
+	ret = ozl003_i2c_write_byte(ozl003, ISEN2_REG_SETTING, s2_current);
+	if (unlikely(ret)) {
+		dev_err(&(ozl003->client->dev),
+				"Failed setting SEN2 current ret=%d\n", ret);
+		return ret;
+	}
+
+	/* disable the delay timer */
+	ret = ozl003_i2c_write_byte(ozl003, DURATION_WDT, DEFAULT_WDT_AND_I2C_DISABLE);
+	if (unlikely(ret)) {
+		dev_err(&(ozl003->client->dev),
+				"Failed setting WDT register ret=%d\n", ret);
+	}
+
+	/* enable the IC */
+	mode |= OPERATION_MODE_ENA_MSK;
+	ret = ozl003_i2c_write_byte(ozl003, OPERATION_MODE, mode);
+	if (unlikely(ret)) {
+		dev_err(&(ozl003->client->dev),
+				"Failed setting OP register ret=%d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int ozl003_probe(struct i2c_client *client,
+		const struct i2c_device_id *id)
+{
+	struct ozl003 *ozl003;
+	struct device_node *np = client->dev.of_node;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(&client->dev, "i2c_check_functionality error\n");
+		return -EIO;
+	}
+
+	ozl003 = devm_kzalloc(&client->dev, sizeof(struct ozl003), GFP_KERNEL);
+	if (!ozl003)
+		return -ENOMEM;
+	ozl003->client = client;
+	i2c_set_clientdata(client, ozl003);
+	mutex_init(&ozl003->lock);
+	INIT_WORK(&ozl003->work, ozl003_led_brightness_work);
+
+	if (client->dev.of_node) {
+		ozl003->gpio_mode = of_property_read_bool(np, "gpio-mode");
+		dev_info(&client->dev, "gpio-mode %d\n", ozl003->gpio_mode);
+	}
+
+
+	ozl003->led_dev.max_brightness = OZL003_MAX_BRIGHTNESS;
+	ozl003->led_dev.brightness_set = ozl003_brightness_set;
+	ozl003->led_dev.name = "ozl003";
+
+	ret = ozl003_init(ozl003);
+	if (ret)
+		goto err;
+
+	ret = led_classdev_register(&client->dev, &ozl003->led_dev);
+	if (ret) {
+		dev_err(&client->dev, "led register err: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	return ret;
+}
+
+static int ozl003_remove(struct i2c_client *client)
+{
+	struct ozl003 *ozl003 = i2c_get_clientdata(client);
+
+	led_classdev_unregister(&ozl003->led_dev);
+	return 0;
+}
+
+static const struct i2c_device_id ozl003_id[] = {
+	{ "ozl003", 0 },
+	{ }
+};
+
+static const struct of_device_id ozl003_match_table[] = {
+	{.compatible = "o2micro,ozl003",},
+	{ },
+};
+
+MODULE_DEVICE_TABLE(i2c, ozl003_id);
+
+static struct i2c_driver ozl003_driver = {
+	.driver = {
+		.owner = THIS_MODULE,
+		.name = "ozl003",
+		.of_match_table = ozl003_match_table,
+	},
+	.id_table = ozl003_id,
+	.probe = ozl003_probe,
+	.remove = ozl003_remove,
+};
+
+module_i2c_driver(ozl003_driver);
+
+MODULE_AUTHOR("Yue Hu <yhuamzn@amazon.com>");
+MODULE_AUTHOR("Karthik Poduval <kpoduval@lab126.com>");
+MODULE_DESCRIPTION("O2 Micro LED Controller driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:ozl003-led");
-- 
2.25.1


