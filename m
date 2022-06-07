Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA86B53CCAF
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jun 2022 17:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbiFCPyM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Jun 2022 11:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244897AbiFCPyL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Jun 2022 11:54:11 -0400
Received: from smtpout1.mo528.mail-out.ovh.net (smtpout1.mo528.mail-out.ovh.net [46.105.34.251])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6375FDF59;
        Fri,  3 Jun 2022 08:54:08 -0700 (PDT)
Received: from pro2.mail.ovh.net (unknown [10.108.20.220])
        by mo528.mail-out.ovh.net (Postfix) with ESMTPS id 969D51079121C;
        Fri,  3 Jun 2022 17:54:06 +0200 (CEST)
Received: from localhost.localdomain (88.161.25.233) by DAG1EX2.emp2.local
 (172.16.2.2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 3 Jun 2022
 17:54:05 +0200
From:   Jean-Jacques Hiblot <jjhiblot@traphandler.com>
To:     <pavel@ucw.cz>, <krzk+dt@kernel.org>
CC:     <robh+dt@kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Subject: [PATCH v2 2/3] leds: Add driver for the TLC5925 LED controller
Date:   Fri, 3 Jun 2022 17:53:31 +0200
Message-ID: <20220603155332.112272-3-jjhiblot@traphandler.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220603155332.112272-1-jjhiblot@traphandler.com>
References: <20220603155332.112272-1-jjhiblot@traphandler.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [88.161.25.233]
X-ClientProxiedBy: DAG8EX1.emp2.local (172.16.2.81) To DAG1EX2.emp2.local
 (172.16.2.2)
X-Ovh-Tracer-Id: 3359122373866568155
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgjfhgggfgtihesthekredtredttdenucfhrhhomheplfgvrghnqdflrggtqhhuvghsucfjihgslhhothcuoehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomheqnecuggftrfgrthhtvghrnhepjeevvefffeduuedtudekkeeuieefuefhteefgfefudelhffhgfdvvddvveeikeevnecuffhomhgrihhnpehtihdrtghomhenucfkpheptddrtddrtddrtddpkeekrdduiedurddvhedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhrohdvrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepjhhjhhhisghlohhtsehtrhgrphhhrghnughlvghrrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehvdek
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The TLC5925 is a 16-channels constant-current LED sink driver.
It is controlled via SPI but doesn't offer a register-based interface.
Instead it contains a shift register and latches that convert the
serial input into a parallel output.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
---
 drivers/leds/Kconfig        |   6 ++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-tlc5925.c | 163 ++++++++++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+)
 create mode 100644 drivers/leds/leds-tlc5925.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a49979f41eee..b17eb01210ba 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -658,6 +658,12 @@ config LEDS_TLC591XX
 	  This option enables support for Texas Instruments TLC59108
 	  and TLC59116 LED controllers.
 
+config LEDS_TLC5925
+	tristate "LED driver for TLC5925 controller"
+	depends on LEDS_CLASS && SPI
+	help
+	  This option enables support for Texas Instruments TLC5925.
+
 config LEDS_MAX77650
 	tristate "LED support for Maxim MAX77650 PMIC"
 	depends on LEDS_CLASS && MFD_MAX77650
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 4fd2f92cd198..9d15b88d482f 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_LEDS_SYSCON)		+= leds-syscon.o
 obj-$(CONFIG_LEDS_TCA6507)		+= leds-tca6507.o
 obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
 obj-$(CONFIG_LEDS_TLC591XX)		+= leds-tlc591xx.o
+obj-$(CONFIG_LEDS_TLC5925)		+= leds-tlc5925.o
 obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
 obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
 obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
diff --git a/drivers/leds/leds-tlc5925.c b/drivers/leds/leds-tlc5925.c
new file mode 100644
index 000000000000..8ce3362b4190
--- /dev/null
+++ b/drivers/leds/leds-tlc5925.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * The driver supports controllers with a very simple SPI protocol:
+ * - the data is deserialized in a shift-register when CS is asserted
+ * - the data is latched when CS is de-asserted
+ * - the LED are either on or off (no control of the brightness)
+ *
+ * Supported devices:
+ * - "ti,tlc5925":  Low-Power 16-Channel Constant-Current LED Sink Driver
+ *                  https://www.ti.com/lit/ds/symlink/tlc5925.pdf
+ */
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/leds.h>
+#include <linux/err.h>
+#include <linux/spi/spi.h>
+#include <linux/property.h>
+#include <linux/workqueue.h>
+
+struct single_led_priv {
+	int idx;
+	struct led_classdev cdev;
+};
+
+struct tlc5925_leds_priv {
+	int max_num_leds;
+	u8 *state;
+	spinlock_t lock;
+	struct single_led_priv leds[];
+};
+
+static int tlc5925_brightness_set_blocking(struct led_classdev *cdev,
+					    enum led_brightness brightness)
+{
+	struct spi_device *spi = to_spi_device(cdev->dev->parent);
+	struct tlc5925_leds_priv *priv = spi_get_drvdata(spi);
+	struct single_led_priv *led = container_of(cdev,
+						   struct single_led_priv,
+						   cdev);
+	int index = led->idx;
+
+	spin_lock(&priv->lock);
+	if (brightness)
+		priv->state[index / 8] |= (1 << (index % 8));
+	else
+		priv->state[index / 8] &= ~(1 << (index % 8));
+	spin_unlock(&priv->lock);
+
+	return spi_write(spi, priv->state, priv->max_num_leds / 8);
+}
+
+
+static int tlc5925_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct fwnode_handle *child;
+	struct tlc5925_leds_priv *priv;
+	int ret;
+	int max_num_leds, count;
+	struct gpio_descs *gpios;
+
+	count = device_get_child_node_count(dev);
+	if (!count) {
+		dev_err(dev, "no led defined.\n");
+		return -ENODEV;
+	}
+
+	ret = device_property_read_u32_array(dev, "shift-register-length",
+					     &max_num_leds, 1);
+	if (ret) {
+		dev_err(dev, "'shift-register-length' property is required.\n");
+		return -EINVAL;
+	}
+
+	if (max_num_leds % 8) {
+		dev_err(dev, "'shift-register-length' must be a multiple of 8\n");
+		return -EINVAL;
+	}
+
+	if (max_num_leds == 0) {
+		dev_err(dev, "'shift-register-length' must be greater than 0\n");
+		return -EINVAL;
+	}
+
+	/* Assert all the OE/ lines */
+	gpios = devm_gpiod_get_array(dev, "output-enable-b", GPIOD_OUT_LOW);
+	if (IS_ERR(gpios)) {
+		dev_err(dev, "Unable to get the 'output-enable-b' gpios\n");
+		return PTR_ERR(gpios);
+	}
+
+	priv = devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->lock);
+
+	priv->state = devm_kzalloc(dev, DIV_ROUND_UP(max_num_leds, 8), GFP_KERNEL);
+	if (!priv->state)
+		return -ENOMEM;
+
+	priv->max_num_leds = max_num_leds;
+
+	device_for_each_child_node(dev, child) {
+		struct led_init_data init_data = {.fwnode = child};
+		struct led_classdev *cdev;
+		u32 idx;
+
+		ret = fwnode_property_read_u32_array(child, "reg", &idx, 1);
+		if (ret || idx >= max_num_leds) {
+			dev_err(dev, "%s: invalid reg value. Ignoring.\n",
+				fwnode_get_name(child));
+			fwnode_handle_put(child);
+			continue;
+		}
+
+		count--;
+		priv->leds[count].idx = idx;
+		cdev = &(priv->leds[count].cdev);
+		cdev->brightness = LED_OFF;
+		cdev->max_brightness = 1;
+		cdev->brightness_set_blocking = tlc5925_brightness_set_blocking;
+
+		ret = devm_led_classdev_register_ext(dev, cdev, &init_data);
+		if (ret) {
+			dev_err(dev, "%s: cannot create LED device.\n",
+				fwnode_get_name(child));
+			fwnode_handle_put(child);
+			continue;
+		}
+	}
+
+	spi_set_drvdata(spi, priv);
+
+	return 0;
+}
+
+static const struct of_device_id tlc5925_dt_ids[] = {
+	{ .compatible = "ti,tlc5925", },
+	{},
+};
+
+static const struct spi_device_id tlc5925_id[] = {
+	{"tlc5925", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(spi, tlc5925_id);
+
+static struct spi_driver tlc5925_driver = {
+	.probe = tlc5925_probe,
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= tlc5925_dt_ids,
+	},
+};
+
+module_spi_driver(tlc5925_driver);
+
+MODULE_AUTHOR("Jean-Jacques Hiblot <jjhiblot@traphandler.com>");
+MODULE_DESCRIPTION("TLC5925 LED driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("spi:tlc5925");
-- 
2.25.1

