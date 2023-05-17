Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8C8707295
	for <lists+linux-leds@lfdr.de>; Wed, 17 May 2023 21:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjEQTxD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 May 2023 15:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjEQTxA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 May 2023 15:53:00 -0400
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E79935BA5;
        Wed, 17 May 2023 12:52:56 -0700 (PDT)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
        by mx.sberdevices.ru (Postfix) with ESMTP id 6F3135FD4A;
        Wed, 17 May 2023 22:52:54 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
        s=mail; t=1684353174;
        bh=YmT+l9X9SmMH7zZqlQ+weSzx21Uldk76YJ6cQHzhBtc=;
        h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
        b=HHrWkoMDHzGITY0PMWZY074JTPiKS6APJWl0CiTUZB/TCNjxlHme8QKxDIfsiJ508
         NcVbezkkyfXzKsLkSHj7NgJ+qJcP6a0WITdqzsxYRTCWsmwLXq0FYJKBY51dO/r8dY
         cM9QFbPRcj5uj75lino4ea/Yejd3nqUKS6iidhbM9a8XrGygKExDHfnO7xT93NqOR7
         QaUiuanDOC8FIHXITCIZ/z1ozydiBRa2E3z297dLNzKaURD3dZ6qLhXIW1mOJKV2h9
         BV3S3YG/06MXtJFyhUhj8hXuDISuVdICq/69Oc/jVGYW6zTHhM34ej8fPKZ97htlWp
         QQcD64ZxIxlzA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
        by mx.sberdevices.ru (Postfix) with ESMTP;
        Wed, 17 May 2023 22:52:54 +0300 (MSK)
From:   Martin Kurbanov <mmkurbanov@sberdevices.ru>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <kernel@sberdevices.ru>,
        Martin Kurbanov <mmkurbanov@sberdevices.ru>
Subject: [PATCH v4 2/2] leds: add aw20xx driver
Date:   Wed, 17 May 2023 22:52:38 +0300
Message-ID: <20230517195238.34069-3-mmkurbanov@sberdevices.ru>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230517195238.34069-1-mmkurbanov@sberdevices.ru>
References: <20230517195238.34069-1-mmkurbanov@sberdevices.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/17 11:04:00 #21328336
X-KSMG-AntiVirus-Status: Clean, skipped
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This commit adds support for AWINIC AW20036/AW20054/AW20072 LED driver.
This driver supports following AW200XX features:
  - Individual 64-level DIM currents

Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
---
 .../testing/sysfs-class-led-driver-aw200xx    |   5 +
 drivers/leds/Kconfig                          |  13 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-aw200xx.c                   | 593 ++++++++++++++++++
 4 files changed, 612 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-aw200xx
 create mode 100644 drivers/leds/leds-aw200xx.c

diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-aw200xx b/Documentation/ABI/testing/sysfs-class-led-driver-aw200xx
new file mode 100644
index 000000000000..2122e3ee3d95
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-driver-aw200xx
@@ -0,0 +1,5 @@
+What:		/sys/class/leds/<led>/dim
+Date:		March 2023
+Description:	64-level DIM current. If you write a negative value or
+		"auto", the dim will be calculated according to the
+		brightness.
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 499d0f215a8b..065aac96728b 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -94,6 +94,19 @@ config LEDS_ARIEL
 
 	  Say Y to if your machine is a Dell Wyse 3020 thin client.
 
+config LEDS_AW200XX
+	tristate "LED support for Awinic AW20036/AW20054/AW20072"
+	depends on LEDS_CLASS
+	depends on I2C
+	help
+	  This option enables support for the AW20036/AW20054/AW20072 LED driver.
+	  It is a 3x12/6x9/6x12 matrix LED driver programmed via
+	  an I2C interface, up to 36/54/72 LEDs or 12/18/24 RGBs,
+	  3 pattern controllers for auto breathing or group dimming control.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-aw200xx.
+
 config LEDS_AW2013
 	tristate "LED support for Awinic AW2013"
 	depends on LEDS_CLASS && I2C && OF
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 4fd2f92cd198..f611e48cd3f5 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
 obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
 obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
 obj-$(CONFIG_LEDS_ASIC3)		+= leds-asic3.o
+obj-$(CONFIG_LEDS_AW200XX)		+= leds-aw200xx.o
 obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
 obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
new file mode 100644
index 000000000000..78c2478be127
--- /dev/null
+++ b/drivers/leds/leds-aw200xx.c
@@ -0,0 +1,593 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Awinic AW20036/AW20054/AW20072 LED driver
+ *
+ * Copyright (c) 2023, SberDevices. All Rights Reserved.
+ *
+ * Author: Martin Kurbanov <mmkurbanov@sberdevices.ru>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/time.h>
+#include <linux/units.h>
+
+#define AW200XX_DIM_MAX                  (BIT(6) - 1)
+#define AW200XX_FADE_MAX                 (BIT(8) - 1)
+#define AW200XX_IMAX_DEFAULT_uA          60000
+#define AW200XX_IMAX_MAX_uA              160000
+#define AW200XX_IMAX_MIN_uA              3300
+
+/* Page 0 */
+#define AW200XX_REG_PAGE0_BASE 0xc000
+
+/* Select page register */
+#define AW200XX_REG_PAGE       0xF0
+#define AW200XX_PAGE_MASK      (GENMASK(7, 6) | GENMASK(2, 0))
+#define AW200XX_PAGE_SHIFT     0
+#define AW200XX_NUM_PAGES      6
+#define AW200XX_PAGE_SIZE      256
+#define AW200XX_REG(page, reg) \
+	(AW200XX_REG_PAGE0_BASE + (page) * AW200XX_PAGE_SIZE + (reg))
+#define AW200XX_REG_MAX \
+	AW200XX_REG(AW200XX_NUM_PAGES - 1, AW200XX_PAGE_SIZE - 1)
+#define AW200XX_PAGE0 0
+#define AW200XX_PAGE1 1
+#define AW200XX_PAGE2 2
+#define AW200XX_PAGE3 3
+#define AW200XX_PAGE4 4
+#define AW200XX_PAGE5 5
+
+/* Chip ID register */
+#define AW200XX_REG_IDR       AW200XX_REG(AW200XX_PAGE0, 0x00)
+#define AW200XX_IDR_CHIPID    0x18
+
+/* Sleep mode register */
+#define AW200XX_REG_SLPCR     AW200XX_REG(AW200XX_PAGE0, 0x01)
+#define AW200XX_SLPCR_ACTIVE  0x00
+
+/* Reset register */
+#define AW200XX_REG_RSTR      AW200XX_REG(AW200XX_PAGE0, 0x02)
+#define AW200XX_RSTR_RESET    0x01
+
+/* Global current configuration register */
+#define AW200XX_REG_GCCR        AW200XX_REG(AW200XX_PAGE0, 0x03)
+#define AW200XX_GCCR_IMAX_MASK  GENMASK(7, 4)
+#define AW200XX_GCCR_IMAX(x)    ((x) << 4)
+#define AW200XX_GCCR_ALLON      BIT(3)
+
+/* Fast clear display control register */
+#define AW200XX_REG_FCD       AW200XX_REG(AW200XX_PAGE0, 0x04)
+#define AW200XX_FCD_CLEAR     0x01
+
+/* Display size configuration */
+#define AW200XX_REG_DSIZE          AW200XX_REG(AW200XX_PAGE0, 0x80)
+#define AW200XX_DSIZE_COLUMNS_MAX  12
+
+#define AW200XX_LED2REG(x, columns) \
+	((x) + (((x) / (columns)) * (AW200XX_DSIZE_COLUMNS_MAX - (columns))))
+
+/*
+ * DIM current configuration register (page 4).
+ * The even address for current DIM configuration.
+ * The odd address for current FADE configuration
+ */
+#define AW200XX_REG_DIM(x, columns) \
+	AW200XX_REG(AW200XX_PAGE4, AW200XX_LED2REG(x, columns) * 2)
+#define AW200XX_REG_DIM2FADE(x) ((x) + 1)
+
+/*
+ * Duty ratio of display scan (see p.15 of datasheet for formula):
+ *   duty = (592us / 600.5us) * (1 / (display_rows + 1))
+ *
+ * Multiply to 1000 (MILLI) to improve the accuracy of calculations.
+ */
+#define AW200XX_DUTY_RATIO(rows) \
+	(((592UL * USEC_PER_SEC) / 600500UL) * (MILLI / (rows)) / MILLI)
+
+struct aw200xx_chipdef {
+	u32 channels;
+	u32 display_size_rows_max;
+	u32 display_size_columns;
+};
+
+struct aw200xx_led {
+	struct led_classdev cdev;
+	struct aw200xx *chip;
+	int dim;
+	u32 num;
+};
+
+struct aw200xx {
+	const struct aw200xx_chipdef *cdef;
+	struct i2c_client *client;
+	struct regmap *regmap;
+	struct mutex mutex;
+	u32 num_leds;
+	u32 display_rows;
+	struct aw200xx_led leds[];
+};
+
+static ssize_t dim_show(struct device *dev, struct device_attribute *devattr,
+			char *buf)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct aw200xx_led *led = container_of(cdev, struct aw200xx_led, cdev);
+	int dim = led->dim;
+
+	if (dim < 0)
+		return sysfs_emit(buf, "auto\n");
+
+	return sysfs_emit(buf, "%d\n", dim);
+}
+
+static ssize_t dim_store(struct device *dev, struct device_attribute *devattr,
+			 const char *buf, size_t count)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct aw200xx_led *led = container_of(cdev, struct aw200xx_led, cdev);
+	struct aw200xx *chip = led->chip;
+	u32 columns = chip->cdef->display_size_columns;
+	int dim;
+	ssize_t ret;
+
+	if (sysfs_streq(buf, "auto")) {
+		dim = -1;
+	} else {
+		ret = kstrtoint(buf, 0, &dim);
+		if (ret)
+			return ret;
+
+		if (dim > AW200XX_DIM_MAX)
+			return -EINVAL;
+	}
+
+	mutex_lock(&chip->mutex);
+
+	if (dim >= 0) {
+		ret = regmap_write(chip->regmap,
+				   AW200XX_REG_DIM(led->num, columns), dim);
+		if (ret)
+			goto out_unlock;
+	}
+
+	led->dim = dim;
+	ret = count;
+
+out_unlock:
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+static DEVICE_ATTR_RW(dim);
+
+static struct attribute *dim_attrs[] = {
+	&dev_attr_dim.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(dim);
+
+static int aw200xx_brightness_set(struct led_classdev *cdev,
+				  enum led_brightness brightness)
+{
+	struct aw200xx_led *led = container_of(cdev, struct aw200xx_led, cdev);
+	struct aw200xx *chip = led->chip;
+	int dim;
+	u32 reg;
+	int ret;
+
+	mutex_lock(&chip->mutex);
+
+	reg = AW200XX_REG_DIM(led->num, chip->cdef->display_size_columns);
+
+	dim = led->dim;
+	if (dim < 0)
+		dim = max_t(int,
+			    brightness / (AW200XX_FADE_MAX / AW200XX_DIM_MAX),
+			    1);
+
+	ret = regmap_write(chip->regmap, reg, dim);
+	if (ret)
+		goto out_unlock;
+
+	ret = regmap_write(chip->regmap,
+			   AW200XX_REG_DIM2FADE(reg), brightness);
+
+out_unlock:
+	mutex_unlock(&chip->mutex);
+
+	return ret;
+}
+
+static u32 aw200xx_imax_from_global(const struct aw200xx *const chip,
+				    u32 global_imax_uA)
+{
+	u64 led_imax_uA;
+
+	/*
+	 * The output current of each LED (see p.14 of datasheet for formula):
+	 *   Iled = Imax * (dim / 63) * ((fade + 1) / 256) * duty
+	 *
+	 * The value of duty is determined by the following formula:
+	 *   duty = (592us / 600.5us) * (1 / (display_rows + 1))
+	 *
+	 * Calculated for the maximum values of fade and dim.
+	 * We divide by 1000 because we earlier multiplied by 1000 to improve
+	 * accuracy when calculating the duty.
+	 */
+	led_imax_uA = global_imax_uA * AW200XX_DUTY_RATIO(chip->display_rows);
+	do_div(led_imax_uA, MILLI);
+
+	return led_imax_uA;
+}
+
+static u32 aw200xx_imax_to_global(const struct aw200xx *const chip,
+				  u32 led_imax_uA)
+{
+	u32 duty = AW200XX_DUTY_RATIO(chip->display_rows);
+
+	/* The output current of each LED (see p.14 of datasheet for formula) */
+	return (led_imax_uA * 1000U) / duty;
+}
+
+#define AW200XX_IMAX_MULTIPLIER1    10000
+#define AW200XX_IMAX_MULTIPLIER2    3333
+#define AW200XX_IMAX_BASE_VAL1      0
+#define AW200XX_IMAX_BASE_VAL2      8
+
+/*
+ * The AW200XX has a 4-bit register (GCCR) to configure the global current,
+ * which ranges from 3.3mA to 160mA. The following table indicates the values
+ * of the global current, divided into two parts:
+ *
+ * +-----------+-----------------+-----------+-----------------+
+ * | reg value | global max (mA) | reg value | global max (mA) |
+ * +-----------+-----------------+-----------+-----------------+
+ * | 0         | 10              | 8         | 3.3             |
+ * | 1         | 20              | 9         | 6.7             |
+ * | 2         | 30              | 10        | 10              |
+ * | 3         | 40              | 11        | 13.3            |
+ * | 4         | 60              | 12        | 20              |
+ * | 5         | 80              | 13        | 26.7            |
+ * | 6         | 120             | 14        | 40              |
+ * | 7         | 160             | 15        | 53.3            |
+ * +-----------+-----------------+-----------+-----------------+
+ *
+ * The left part  with a multiplier of 10, and the right part  with a multiplier
+ * of 3.3.
+ * So we have two formulas to calculate the global current:
+ *   for the left part of the table:
+ *     imax = coefficient * 10
+ *
+ *   for the right part of the table:
+ *     imax = coefficient * 3.3
+ *
+ * The coefficient table consists of the following values:
+ *   1, 2, 3, 4, 6, 8, 12, 16.
+ */
+static int aw200xx_set_imax(const struct aw200xx *const chip,
+			    u32 led_imax_uA)
+{
+	u32 g_imax_uA = aw200xx_imax_to_global(chip, led_imax_uA);
+	u32 coeff_table[] = {1, 2, 3, 4, 6, 8, 12, 16};
+	u32 gccr_imax = UINT_MAX;
+	u32 cur_imax = 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(coeff_table); i++) {
+		u32 imax;
+
+		/* select closest ones */
+		imax = coeff_table[i] * AW200XX_IMAX_MULTIPLIER1;
+		if (g_imax_uA >= imax && imax > cur_imax) {
+			cur_imax = imax;
+			gccr_imax = i + AW200XX_IMAX_BASE_VAL1;
+		}
+
+		imax = coeff_table[i] * AW200XX_IMAX_MULTIPLIER2;
+		imax = DIV_ROUND_CLOSEST(imax, 100) * 100;
+		if (g_imax_uA >= imax && imax > cur_imax) {
+			cur_imax = imax;
+			gccr_imax = i + AW200XX_IMAX_BASE_VAL2;
+		}
+	}
+
+	if (gccr_imax == UINT_MAX)
+		return -EINVAL;
+
+	return regmap_update_bits(chip->regmap, AW200XX_REG_GCCR,
+				  AW200XX_GCCR_IMAX_MASK,
+				  AW200XX_GCCR_IMAX(gccr_imax));
+}
+
+static int aw200xx_chip_reset(const struct aw200xx *const chip)
+{
+	int ret;
+
+	ret = regmap_write(chip->regmap, AW200XX_REG_RSTR, AW200XX_RSTR_RESET);
+	if (ret)
+		return ret;
+
+	regcache_mark_dirty(chip->regmap);
+	return regmap_write(chip->regmap, AW200XX_REG_FCD, AW200XX_FCD_CLEAR);
+}
+
+static int aw200xx_chip_init(const struct aw200xx *const chip)
+{
+	int ret;
+
+	ret = regmap_write(chip->regmap, AW200XX_REG_DSIZE,
+			   chip->display_rows - 1);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(chip->regmap, AW200XX_REG_SLPCR,
+			   AW200XX_SLPCR_ACTIVE);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(chip->regmap, AW200XX_REG_GCCR,
+				  AW200XX_GCCR_ALLON, AW200XX_GCCR_ALLON);
+}
+
+static int aw200xx_chip_check(const struct aw200xx *const chip)
+{
+	struct device *dev = &chip->client->dev;
+	u32 chipid;
+	int ret;
+
+	ret = regmap_read(chip->regmap, AW200XX_REG_IDR, &chipid);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read chip ID\n");
+
+	if (chipid != AW200XX_IDR_CHIPID)
+		return dev_err_probe(dev, -ENODEV,
+				     "Chip reported wrong ID: %x\n", chipid);
+
+	return 0;
+}
+
+static int aw200xx_probe_dt(struct device *dev, struct aw200xx *chip)
+{
+	struct fwnode_handle *child;
+	u32 current_min, current_max, min_uA;
+	int ret;
+	int i = 0;
+
+	ret = device_property_read_u32(dev, "awinic,display-rows",
+				       &chip->display_rows);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to read 'display-rows' property\n");
+
+	if (!chip->display_rows ||
+	    chip->display_rows > chip->cdef->display_size_rows_max) {
+		return dev_err_probe(dev, ret,
+				     "Invalid leds display size %u\n",
+				     chip->display_rows);
+	}
+
+	current_max = aw200xx_imax_from_global(chip, AW200XX_IMAX_MAX_uA);
+	current_min = aw200xx_imax_from_global(chip, AW200XX_IMAX_MIN_uA);
+	min_uA = UINT_MAX;
+
+	device_for_each_child_node(dev, child) {
+		struct led_init_data init_data = {};
+		struct aw200xx_led *led;
+		u32 source, imax;
+
+		ret = fwnode_property_read_u32(child, "reg", &source);
+		if (ret) {
+			dev_err(dev, "Missing reg property\n");
+			chip->num_leds--;
+			continue;
+		}
+
+		if (source >= chip->cdef->channels) {
+			dev_err(dev, "LED reg %u out of range (max %u)\n",
+				source, chip->cdef->channels);
+			chip->num_leds--;
+			continue;
+		}
+
+		ret = fwnode_property_read_u32(child, "led-max-microamp",
+					       &imax);
+		if (ret) {
+			dev_info(&chip->client->dev,
+				 "DT property led-max-microamp is missing\n");
+		} else if (imax < current_min || imax > current_max) {
+			dev_err(dev, "Invalid value %u for led-max-microamp\n",
+				imax);
+			chip->num_leds--;
+			continue;
+		} else {
+			min_uA = min(min_uA, imax);
+		}
+
+		led = &chip->leds[i];
+		led->dim = -1;
+		led->num = source;
+		led->chip = chip;
+		led->cdev.brightness_set_blocking = aw200xx_brightness_set;
+		led->cdev.groups = dim_groups;
+		init_data.fwnode = child;
+
+		ret = devm_led_classdev_register_ext(dev, &led->cdev,
+						     &init_data);
+		if (ret) {
+			fwnode_handle_put(child);
+			break;
+		}
+
+		i++;
+	}
+
+	if (!chip->num_leds)
+		return -EINVAL;
+
+	if (min_uA == UINT_MAX) {
+		min_uA = aw200xx_imax_from_global(chip,
+						  AW200XX_IMAX_DEFAULT_uA);
+	}
+
+	return aw200xx_set_imax(chip, min_uA);
+}
+
+static const struct regmap_range_cfg aw200xx_ranges[] = {
+	{
+		.name = "aw200xx",
+		.range_min = 0,
+		.range_max = AW200XX_REG_MAX,
+		.selector_reg = AW200XX_REG_PAGE,
+		.selector_mask = AW200XX_PAGE_MASK,
+		.selector_shift = AW200XX_PAGE_SHIFT,
+		.window_start = 0,
+		.window_len = AW200XX_PAGE_SIZE,
+	},
+};
+
+static const struct regmap_range aw200xx_writeonly_ranges[] = {
+	regmap_reg_range(AW200XX_REG(AW200XX_PAGE1, 0x00), AW200XX_REG_MAX),
+};
+
+static const struct regmap_access_table aw200xx_readable_table = {
+	.no_ranges = aw200xx_writeonly_ranges,
+	.n_no_ranges = ARRAY_SIZE(aw200xx_writeonly_ranges),
+};
+
+static const struct regmap_range aw200xx_readonly_ranges[] = {
+	regmap_reg_range(AW200XX_REG_IDR, AW200XX_REG_IDR),
+};
+
+static const struct regmap_access_table aw200xx_writeable_table = {
+	.no_ranges = aw200xx_readonly_ranges,
+	.n_no_ranges = ARRAY_SIZE(aw200xx_readonly_ranges),
+};
+
+static const struct regmap_config aw200xx_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = AW200XX_REG_MAX,
+	.ranges = aw200xx_ranges,
+	.num_ranges = ARRAY_SIZE(aw200xx_ranges),
+	.rd_table = &aw200xx_readable_table,
+	.wr_table = &aw200xx_writeable_table,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static int aw200xx_probe(struct i2c_client *client)
+{
+	const struct aw200xx_chipdef *cdef;
+	struct aw200xx *chip;
+	int count;
+	int ret;
+
+	cdef = device_get_match_data(&client->dev);
+	if (!cdef)
+		return -ENODEV;
+
+	count = device_get_child_node_count(&client->dev);
+	if (!count || count > cdef->channels)
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "Incorrect number of leds (%d)", count);
+
+	chip = devm_kzalloc(&client->dev, struct_size(chip, leds, count),
+			    GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->cdef = cdef;
+	chip->num_leds = count;
+	chip->client = client;
+	i2c_set_clientdata(client, chip);
+
+	chip->regmap = devm_regmap_init_i2c(client, &aw200xx_regmap_config);
+	if (IS_ERR(chip->regmap))
+		return PTR_ERR(chip->regmap);
+
+	ret = aw200xx_chip_check(chip);
+	if (ret)
+		return ret;
+
+	mutex_init(&chip->mutex);
+
+	/* Need a lock now since after call aw200xx_probe_dt, sysfs nodes created */
+	mutex_lock(&chip->mutex);
+
+	ret = aw200xx_probe_dt(&client->dev, chip);
+	if (ret < 0)
+		goto out_unlock;
+
+	ret = aw200xx_chip_reset(chip);
+	if (ret)
+		goto out_unlock;
+
+	ret = aw200xx_chip_init(chip);
+
+out_unlock:
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+
+static void aw200xx_remove(struct i2c_client *client)
+{
+	struct aw200xx *chip = i2c_get_clientdata(client);
+
+	aw200xx_chip_reset(chip);
+	mutex_destroy(&chip->mutex);
+}
+
+static const struct aw200xx_chipdef aw20036_cdef = {
+	.channels = 36,
+	.display_size_rows_max = 3,
+	.display_size_columns = 12,
+};
+
+static const struct aw200xx_chipdef aw20054_cdef = {
+	.channels = 54,
+	.display_size_rows_max = 6,
+	.display_size_columns = 9,
+};
+
+static const struct aw200xx_chipdef aw20072_cdef = {
+	.channels = 72,
+	.display_size_rows_max = 6,
+	.display_size_columns = 12,
+};
+
+static const struct i2c_device_id aw200xx_id[] = {
+	{ "aw20036" },
+	{ "aw20054" },
+	{ "aw20072" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, aw200xx_id);
+
+static const struct of_device_id aw200xx_match_table[] = {
+	{ .compatible = "awinic,aw20036", .data = &aw20036_cdef, },
+	{ .compatible = "awinic,aw20054", .data = &aw20054_cdef, },
+	{ .compatible = "awinic,aw20072", .data = &aw20072_cdef, },
+	{}
+};
+MODULE_DEVICE_TABLE(of, aw200xx_match_table);
+
+static struct i2c_driver aw200xx_driver = {
+	.driver = {
+		.name = "aw200xx",
+		.of_match_table = aw200xx_match_table,
+	},
+	.probe_new = aw200xx_probe,
+	.remove = aw200xx_remove,
+	.id_table = aw200xx_id,
+};
+module_i2c_driver(aw200xx_driver);
+
+MODULE_AUTHOR("Martin Kurbanov <mmkurbanov@sberdevices.ru>");
+MODULE_DESCRIPTION("AW200XX LED driver");
+MODULE_LICENSE("GPL");
-- 
2.40.0

