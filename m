Return-Path: <linux-leds+bounces-1887-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E87A905D52
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 23:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B14931C22245
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 21:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F6185C52;
	Wed, 12 Jun 2024 21:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2xd4nbv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BE3433AF;
	Wed, 12 Jun 2024 21:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718226169; cv=none; b=psx7R4I68V8D4tGb4sVRVWE0oK6Xm291i5UIeG44W63XEpx9XZgVRnJp+blXPY6tYxs1c4x3wlbXKwfmGq0ZDD/c7k+9HYbnf2XcnUROMR1HLchpErokIn+PopjVOq3I2Dm0XmIGogMy5gVW0GHaa6TLqdceXRYWW0jq/mkaNfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718226169; c=relaxed/simple;
	bh=PRQLVXZYS5IE60mlw3rr5jiKM5fyqnwTXajUJxIefrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZzHKpBVnrpxydaUkUHGfeCM0pmnBYBWtSfbXtOQfXsgKF9gbmj6w4rNlNOkY/PbUDDu6Z8nFVncVPzAB6RbRK5uiSD0lo+qrgWQMxtbYNhDyGqFgKZSZKZgwOYqI0QyvYYIno+1fJ7w6RCQigXiabmUo+LbbCMQrOrZQyDXKTls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2xd4nbv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A5B7C4AF48;
	Wed, 12 Jun 2024 21:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718226168;
	bh=PRQLVXZYS5IE60mlw3rr5jiKM5fyqnwTXajUJxIefrk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a2xd4nbvgTGDOBHwDNNpGH4odrUfJL9jmMJCi9EcsRQJF1nv2CfTKLF1CFXAX1NGd
	 KR0nrsS+Ih/dQ+OD6Q9ijIgIEjZAkOarGwG34KcgRz+zcQKugnFpnHH8NIFLdXFfFp
	 9JuoUjpXEU+gwQRorPp2ipKS5P745sDvMf9Yt5auMOcoslxYT4j9iCRr5DhVXjuaP1
	 mVuj/NKeWUrjlItfqYZ239Y9H/EfYr3Xzg2dxrttj7Ept4OhjE5NJFGj0jS2e7daCq
	 ofG0MtL3kL6+AoF1Liyeimo4EoQ2htzDOpYSTooepKsiNIxf86apNg5e0LySUgUz4j
	 QH7H1IdIAnmug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86294C27C79;
	Wed, 12 Jun 2024 21:02:48 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Wed, 12 Jun 2024 23:01:33 +0200
Subject: [PATCH v3 2/3] leds: sy7802: Add support for Silergy SY7802 flash
 LED controller
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240612-sy7802-v3-2-1e9cc1c79b79@apitzsch.eu>
References: <20240612-sy7802-v3-0-1e9cc1c79b79@apitzsch.eu>
In-Reply-To: <20240612-sy7802-v3-0-1e9cc1c79b79@apitzsch.eu>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Trilok Soni <quic_tsoni@quicinc.com>, Kees Cook <kees@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718226168; l=17289;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=TnUmQS0831tC2/T0AI3dHM5Q1FIKaVjcL6w4zm++8nc=;
 b=YVvTiwL+aA7Mv2pSXWQ3cEdMC/iqG/57DjRD0e0yFuYz1w/UrisFFYdY1mcGV/i5BGkg+f40R
 iIAS0ReDNpKB+WZMzhuirOJi3M+VO6JxzBXbi/4USMp8f4uBl3uItv3
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The SY7802 is a current-regulated charge pump which can regulate two
current levels for Flash and Torch modes.

It is a high-current synchronous boost converter with 2-channel high
side current sources. Each channel is able to deliver 900mA current.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/leds/flash/Kconfig       |  11 +
 drivers/leds/flash/Makefile      |   1 +
 drivers/leds/flash/leds-sy7802.c | 546 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 558 insertions(+)

diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 809b6d98bb3e..f39f0bfe6eef 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -121,4 +121,15 @@ config LEDS_SGM3140
 	  This option enables support for the SGM3140 500mA Buck/Boost Charge
 	  Pump LED Driver.
 
+config LEDS_SY7802
+	tristate "LED support for the Silergy SY7802"
+	depends on I2C && OF
+	depends on GPIOLIB
+	select REGMAP_I2C
+	help
+	  This option enables support for the SY7802 flash LED controller.
+	  SY7802 includes torch and flash functions with programmable current.
+
+	  This driver can be built as a module, it will be called "leds-sy7802".
+
 endif # LEDS_CLASS_FLASH
diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
index 91d60a4b7952..48860eeced79 100644
--- a/drivers/leds/flash/Makefile
+++ b/drivers/leds/flash/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_LEDS_QCOM_FLASH)	+= leds-qcom-flash.o
 obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
 obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
 obj-$(CONFIG_LEDS_SGM3140)	+= leds-sgm3140.o
+obj-$(CONFIG_LEDS_SY7802)	+= leds-sy7802.o
diff --git a/drivers/leds/flash/leds-sy7802.c b/drivers/leds/flash/leds-sy7802.c
new file mode 100644
index 000000000000..35d092aa4ad5
--- /dev/null
+++ b/drivers/leds/flash/leds-sy7802.c
@@ -0,0 +1,546 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Silergy SY7802 flash LED driver with I2C interface
+ *
+ * Copyright 2024 André Apitzsch <git@apitzsch.eu>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/led-class-flash.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#define SY7802_MAX_LEDS 2
+#define SY7802_LED_JOINT 2
+
+#define SY7802_REG_ENABLE		0x10
+#define SY7802_REG_TORCH_BRIGHTNESS	0xa0
+#define SY7802_REG_FLASH_BRIGHTNESS	0xb0
+#define SY7802_REG_FLASH_DURATION	0xc0
+#define SY7802_REG_FLAGS		0xd0
+#define SY7802_REG_CONFIG_1		0xe0
+#define SY7802_REG_CONFIG_2		0xf0
+#define SY7802_REG_VIN_MONITOR		0x80
+#define SY7802_REG_LAST_FLASH		0x81
+#define SY7802_REG_VLED_MONITOR		0x30
+#define SY7802_REG_ADC_DELAY		0x31
+#define SY7802_REG_DEV_ID		0xff
+
+#define SY7802_MODE_OFF		0
+#define SY7802_MODE_TORCH	2
+#define SY7802_MODE_FLASH	3
+#define SY7802_MODE_MASK	GENMASK(1, 0)
+
+#define SY7802_LEDS_SHIFT	3
+#define SY7802_LEDS_MASK(_id)	(BIT(_id) << SY7802_LEDS_SHIFT)
+#define SY7802_LEDS_MASK_ALL	(SY7802_LEDS_MASK(0) | SY7802_LEDS_MASK(1))
+
+#define SY7802_TORCH_CURRENT_SHIFT	3
+#define SY7802_TORCH_CURRENT_MASK(_id) \
+	(GENMASK(2, 0) << (SY7802_TORCH_CURRENT_SHIFT * (_id)))
+#define SY7802_TORCH_CURRENT_MASK_ALL \
+	(SY7802_TORCH_CURRENT_MASK(0) | SY7802_TORCH_CURRENT_MASK(1))
+
+#define SY7802_FLASH_CURRENT_SHIFT	4
+#define SY7802_FLASH_CURRENT_MASK(_id) \
+	(GENMASK(3, 0) << (SY7802_FLASH_CURRENT_SHIFT * (_id)))
+#define SY7802_FLASH_CURRENT_MASK_ALL \
+	(SY7802_FLASH_CURRENT_MASK(0) | SY7802_FLASH_CURRENT_MASK(1))
+
+#define SY7802_TIMEOUT_DEFAULT_US	512000U
+#define SY7802_TIMEOUT_MIN_US		32000U
+#define SY7802_TIMEOUT_MAX_US		1024000U
+#define SY7802_TIMEOUT_STEPSIZE_US	32000U
+
+#define SY7802_TORCH_BRIGHTNESS_MAX 8
+
+#define SY7802_FLASH_BRIGHTNESS_DEFAULT	14
+#define SY7802_FLASH_BRIGHTNESS_MIN	0
+#define SY7802_FLASH_BRIGHTNESS_MAX	15
+#define SY7802_FLASH_BRIGHTNESS_STEP	1
+
+#define SY7802_FLAG_TIMEOUT			BIT(0)
+#define SY7802_FLAG_THERMAL_SHUTDOWN		BIT(1)
+#define SY7802_FLAG_LED_FAULT			BIT(2)
+#define SY7802_FLAG_TX1_INTERRUPT		BIT(3)
+#define SY7802_FLAG_TX2_INTERRUPT		BIT(4)
+#define SY7802_FLAG_LED_THERMAL_FAULT		BIT(5)
+#define SY7802_FLAG_FLASH_INPUT_VOLTAGE_LOW	BIT(6)
+#define SY7802_FLAG_INPUT_VOLTAGE_LOW		BIT(7)
+
+#define SY7802_CHIP_ID	0x51
+
+static const struct reg_default sy7802_regmap_defs[] = {
+	{ SY7802_REG_ENABLE, SY7802_LEDS_MASK_ALL },
+	{ SY7802_REG_TORCH_BRIGHTNESS, 0x92 },
+	{ SY7802_REG_FLASH_BRIGHTNESS, SY7802_FLASH_BRIGHTNESS_DEFAULT |
+		SY7802_FLASH_BRIGHTNESS_DEFAULT << SY7802_FLASH_CURRENT_SHIFT },
+	{ SY7802_REG_FLASH_DURATION, 0x6f },
+	{ SY7802_REG_FLAGS, 0x0 },
+	{ SY7802_REG_CONFIG_1, 0x68 },
+	{ SY7802_REG_CONFIG_2, 0xf0 },
+};
+
+struct sy7802_led {
+	struct led_classdev_flash flash;
+	struct sy7802 *chip;
+	u8 led_id;
+};
+
+struct sy7802 {
+	struct device *dev;
+	struct regmap *regmap;
+	struct mutex mutex;
+
+	struct gpio_desc *enable_gpio;
+	struct regulator *vin_regulator;
+
+	unsigned int fled_strobe_used;
+	unsigned int fled_torch_used;
+	unsigned int leds_active;
+	int num_leds;
+	struct sy7802_led leds[] __counted_by(num_leds);
+};
+
+static int sy7802_torch_brightness_set(struct led_classdev *lcdev, enum led_brightness brightness)
+{
+	struct sy7802_led *led = container_of(lcdev, struct sy7802_led, flash.led_cdev);
+	struct sy7802 *chip = led->chip;
+	u32 fled_torch_used_tmp;
+	u32 led_enable_mask;
+	u32 enable_mask;
+	u32 torch_mask;
+	u32 val;
+	int ret;
+
+	mutex_lock(&chip->mutex);
+
+	if (chip->fled_strobe_used) {
+		dev_warn(chip->dev, "Cannot set torch brightness whilst strobe is enabled\n");
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	if (brightness)
+		fled_torch_used_tmp = chip->fled_torch_used | BIT(led->led_id);
+	else
+		fled_torch_used_tmp = chip->fled_torch_used & ~BIT(led->led_id);
+
+	led_enable_mask = led->led_id == SY7802_LED_JOINT ?
+			  SY7802_LEDS_MASK_ALL :
+			  SY7802_LEDS_MASK(led->led_id);
+
+	val = brightness ? led_enable_mask : SY7802_MODE_OFF;
+	if (fled_torch_used_tmp)
+		val |= SY7802_MODE_TORCH;
+
+	/* Disable torch to apply brightness */
+	ret = regmap_update_bits(chip->regmap, SY7802_REG_ENABLE, SY7802_MODE_MASK,
+				 SY7802_MODE_OFF);
+	if (ret)
+		goto unlock;
+
+	torch_mask = led->led_id == SY7802_LED_JOINT ?
+		     SY7802_TORCH_CURRENT_MASK_ALL :
+		     SY7802_TORCH_CURRENT_MASK(led->led_id);
+
+	/* Register expects brightness between 0 and MAX_BRIGHTNESS - 1 */
+	if (brightness)
+		brightness -= 1;
+
+	brightness |= (brightness << SY7802_TORCH_CURRENT_SHIFT);
+
+	ret = regmap_update_bits(chip->regmap, SY7802_REG_TORCH_BRIGHTNESS, torch_mask, brightness);
+	if (ret)
+		goto unlock;
+
+	enable_mask = SY7802_MODE_MASK | led_enable_mask;
+	ret = regmap_update_bits(chip->regmap, SY7802_REG_ENABLE, enable_mask, val);
+	if (ret)
+		goto unlock;
+
+	chip->fled_torch_used = fled_torch_used_tmp;
+
+unlock:
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+
+static int sy7802_flash_brightness_set(struct led_classdev_flash *fl_cdev, u32 brightness)
+{
+	struct sy7802_led *led = container_of(fl_cdev, struct sy7802_led, flash);
+	struct led_flash_setting *s = &fl_cdev->brightness;
+	u32 val = (brightness - s->min) / s->step;
+	struct sy7802 *chip = led->chip;
+	u32 flash_mask;
+	int ret;
+
+	val |= (val << SY7802_FLASH_CURRENT_SHIFT);
+	flash_mask = led->led_id == SY7802_LED_JOINT ?
+		     SY7802_FLASH_CURRENT_MASK_ALL :
+		     SY7802_FLASH_CURRENT_MASK(led->led_id);
+
+	mutex_lock(&chip->mutex);
+	ret = regmap_update_bits(chip->regmap, SY7802_REG_FLASH_BRIGHTNESS, flash_mask, val);
+	mutex_unlock(&chip->mutex);
+
+	return ret;
+}
+
+static int sy7802_strobe_set(struct led_classdev_flash *fl_cdev, bool state)
+{
+	struct sy7802_led *led = container_of(fl_cdev, struct sy7802_led, flash);
+	struct sy7802 *chip = led->chip;
+	u32 fled_strobe_used_tmp;
+	u32 led_enable_mask;
+	u32 enable_mask;
+	u32 val;
+	int ret;
+
+	mutex_lock(&chip->mutex);
+
+	if (chip->fled_torch_used) {
+		dev_warn(chip->dev, "Cannot set strobe brightness whilst torch is enabled\n");
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	if (state)
+		fled_strobe_used_tmp = chip->fled_strobe_used | BIT(led->led_id);
+	else
+		fled_strobe_used_tmp = chip->fled_strobe_used & ~BIT(led->led_id);
+
+	led_enable_mask = led->led_id == SY7802_LED_JOINT ?
+			  SY7802_LEDS_MASK_ALL :
+			  SY7802_LEDS_MASK(led->led_id);
+
+	val = state ? led_enable_mask : SY7802_MODE_OFF;
+	if (fled_strobe_used_tmp)
+		val |= SY7802_MODE_FLASH;
+
+	enable_mask = SY7802_MODE_MASK | led_enable_mask;
+	ret = regmap_update_bits(chip->regmap, SY7802_REG_ENABLE, enable_mask, val);
+
+	if (ret)
+		goto unlock;
+
+	chip->fled_strobe_used = fled_strobe_used_tmp;
+
+unlock:
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+
+static int sy7802_strobe_get(struct led_classdev_flash *fl_cdev, bool *state)
+{
+	struct sy7802_led *led = container_of(fl_cdev, struct sy7802_led, flash);
+	struct sy7802 *chip = led->chip;
+
+	mutex_lock(&chip->mutex);
+	*state = !!(chip->fled_strobe_used & BIT(led->led_id));
+	mutex_unlock(&chip->mutex);
+
+	return 0;
+}
+
+static int sy7802_timeout_set(struct led_classdev_flash *fl_cdev,
+			      u32 timeout)
+{
+	struct sy7802_led *led = container_of(fl_cdev, struct sy7802_led, flash);
+	struct led_flash_setting *s = &fl_cdev->timeout;
+	u32 val = (timeout - s->min) / s->step;
+	struct sy7802 *chip = led->chip;
+
+	return regmap_write(chip->regmap, SY7802_REG_FLASH_DURATION, val);
+}
+
+static int sy7802_fault_get(struct led_classdev_flash *fl_cdev, u32 *fault)
+{
+	struct sy7802_led *led = container_of(fl_cdev, struct sy7802_led, flash);
+	struct sy7802 *chip = led->chip;
+	u32 val, led_faults = 0;
+	int ret;
+
+	/* NOTE: reading register clears fault status */
+	ret = regmap_read(chip->regmap, SY7802_REG_FLAGS, &val);
+	if (ret)
+		return ret;
+
+	if (val & (SY7802_FLAG_FLASH_INPUT_VOLTAGE_LOW | SY7802_FLAG_INPUT_VOLTAGE_LOW))
+		led_faults |= LED_FAULT_INPUT_VOLTAGE;
+
+	if (val & SY7802_FLAG_THERMAL_SHUTDOWN)
+		led_faults |= LED_FAULT_OVER_TEMPERATURE;
+
+	if (val & SY7802_FLAG_TIMEOUT)
+		led_faults |= LED_FAULT_TIMEOUT;
+
+	*fault = led_faults;
+	return 0;
+}
+
+static const struct led_flash_ops sy7802_flash_ops = {
+	.flash_brightness_set = sy7802_flash_brightness_set,
+	.strobe_set = sy7802_strobe_set,
+	.strobe_get = sy7802_strobe_get,
+	.timeout_set = sy7802_timeout_set,
+	.fault_get = sy7802_fault_get,
+};
+
+static void sy7802_init_flash_brightness(struct led_classdev_flash *fl_cdev)
+{
+	struct led_flash_setting *s;
+
+	/* Init flash brightness setting */
+	s = &fl_cdev->brightness;
+	s->min = SY7802_FLASH_BRIGHTNESS_MIN;
+	s->max = SY7802_FLASH_BRIGHTNESS_MAX;
+	s->step = SY7802_FLASH_BRIGHTNESS_STEP;
+	s->val = SY7802_FLASH_BRIGHTNESS_DEFAULT;
+}
+
+static void sy7802_init_flash_timeout(struct led_classdev_flash *fl_cdev)
+{
+	struct led_flash_setting *s;
+
+	/* Init flash timeout setting */
+	s = &fl_cdev->timeout;
+	s->min = SY7802_TIMEOUT_MIN_US;
+	s->max = SY7802_TIMEOUT_MAX_US;
+	s->step = SY7802_TIMEOUT_STEPSIZE_US;
+	s->val = SY7802_TIMEOUT_DEFAULT_US;
+}
+
+static int sy7802_led_register(struct device *dev, struct sy7802_led *led,
+			       struct device_node *np)
+{
+	struct led_init_data init_data = {};
+	int ret;
+
+	init_data.fwnode = of_fwnode_handle(np);
+
+	ret = devm_led_classdev_flash_register_ext(dev, &led->flash, &init_data);
+	if (ret) {
+		dev_err(dev, "Couldn't register flash %d\n", led->led_id);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sy7802_init_flash_properties(struct device *dev, struct sy7802_led *led,
+					struct device_node *np)
+{
+	struct led_classdev_flash *flash = &led->flash;
+	struct led_classdev *lcdev = &flash->led_cdev;
+	u32 sources[SY7802_MAX_LEDS];
+	int i, num, ret;
+
+	num = of_property_count_u32_elems(np, "led-sources");
+	if (num < 1) {
+		dev_err(dev, "Not specified or wrong number of led-sources\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32_array(np, "led-sources", sources, num);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < num; i++) {
+		if (sources[i] >= SY7802_MAX_LEDS)
+			return -EINVAL;
+		if (led->chip->leds_active & BIT(sources[i]))
+			return -EINVAL;
+		led->chip->leds_active |= BIT(sources[i]);
+	}
+
+	/* If both channels are specified in 'led-sources', joint flash output mode is used */
+	led->led_id = num == 2 ? SY7802_LED_JOINT : sources[0];
+
+	lcdev->max_brightness = SY7802_TORCH_BRIGHTNESS_MAX;
+	lcdev->brightness_set_blocking = sy7802_torch_brightness_set;
+	lcdev->flags |= LED_DEV_CAP_FLASH;
+
+	flash->ops = &sy7802_flash_ops;
+
+	sy7802_init_flash_brightness(flash);
+	sy7802_init_flash_timeout(flash);
+
+	return 0;
+}
+
+static int sy7802_chip_check(struct sy7802 *chip)
+{
+	struct device *dev = chip->dev;
+	u32 chipid;
+	int ret;
+
+	ret = regmap_read(chip->regmap, SY7802_REG_DEV_ID, &chipid);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read chip ID\n");
+
+	if (chipid != SY7802_CHIP_ID)
+		return dev_err_probe(dev, -ENODEV, "Unsupported chip detected: %x\n", chipid);
+
+	return 0;
+}
+
+static void sy7802_enable(struct sy7802 *chip)
+{
+	gpiod_set_value_cansleep(chip->enable_gpio, 1);
+	usleep_range(200, 300);
+}
+
+static void sy7802_disable(struct sy7802 *chip)
+{
+	gpiod_set_value_cansleep(chip->enable_gpio, 0);
+}
+
+static int sy7802_probe_dt(struct sy7802 *chip)
+{
+	struct device_node *np = dev_of_node(chip->dev);
+	struct device_node *child;
+	int child_num;
+	int ret;
+
+	regmap_write(chip->regmap, SY7802_REG_ENABLE, SY7802_MODE_OFF);
+	regmap_write(chip->regmap, SY7802_REG_TORCH_BRIGHTNESS, LED_OFF);
+
+	child_num = 0;
+	for_each_available_child_of_node(np, child) {
+		struct sy7802_led *led = chip->leds + child_num;
+
+		led->chip = chip;
+		led->led_id = child_num;
+
+		ret = sy7802_init_flash_properties(chip->dev, led, child);
+		if (ret) {
+			of_node_put(child);
+			return ret;
+		}
+
+		ret = sy7802_led_register(chip->dev, led, child);
+		if (ret) {
+			of_node_put(child);
+			return ret;
+		}
+
+		child_num++;
+	}
+	return 0;
+}
+
+static void sy7802_chip_disable_action(void *data)
+{
+	struct sy7802 *chip = data;
+
+	sy7802_disable(chip);
+	regulator_disable(chip->vin_regulator);
+}
+
+static const struct regmap_config sy7802_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xff,
+	.cache_type = REGCACHE_MAPLE,
+	.reg_defaults = sy7802_regmap_defs,
+	.num_reg_defaults = ARRAY_SIZE(sy7802_regmap_defs),
+};
+
+static int sy7802_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct sy7802 *chip;
+	size_t count;
+	int ret;
+
+	count = device_get_child_node_count(dev);
+	if (!count || count > SY7802_MAX_LEDS)
+		return dev_err_probe(dev, -EINVAL, "Invalid amount of LED nodes %zu\n", count);
+
+	chip = devm_kzalloc(dev, struct_size(chip, leds, count), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->num_leds = count;
+
+	chip->dev = dev;
+	i2c_set_clientdata(client, chip);
+
+	chip->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(chip->enable_gpio);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request enable gpio\n");
+
+	chip->vin_regulator = devm_regulator_get(dev, "vin");
+	ret = PTR_ERR_OR_ZERO(chip->vin_regulator);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request regulator\n");
+
+	ret = regulator_enable(chip->vin_regulator);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable regulator\n");
+
+	ret = devm_mutex_init(dev, &chip->mutex);
+	if (ret)
+		return ret;
+
+	mutex_lock(&chip->mutex);
+
+	chip->regmap = devm_regmap_init_i2c(client, &sy7802_regmap_config);
+	if (IS_ERR(chip->regmap)) {
+		ret = PTR_ERR(chip->regmap);
+		dev_err(dev, "Failed to allocate register map: %d\n", ret);
+		goto error;
+	}
+
+	ret = devm_add_action(dev, sy7802_chip_disable_action, chip);
+	if (ret)
+		goto error;
+
+	ret = sy7802_probe_dt(chip);
+	if (ret < 0)
+		goto error;
+
+	sy7802_enable(chip);
+
+	ret = sy7802_chip_check(chip);
+	if (ret) {
+		sy7802_disable(chip);
+		goto error;
+	}
+
+	mutex_unlock(&chip->mutex);
+
+	return 0;
+
+error:
+	regulator_disable(chip->vin_regulator);
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+
+static const struct of_device_id __maybe_unused sy7802_leds_match[] = {
+	{ .compatible = "silergy,sy7802", },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, sy7802_leds_match);
+
+static struct i2c_driver sy7802_driver = {
+	.driver = {
+		.name = "sy7802",
+		.of_match_table = of_match_ptr(sy7802_leds_match),
+	},
+	.probe = sy7802_probe,
+};
+
+module_i2c_driver(sy7802_driver);
+
+MODULE_AUTHOR("André Apitzsch <git@apitzsch.eu>");
+MODULE_DESCRIPTION("Silergy SY7802 flash LED driver");
+MODULE_LICENSE("GPL");

-- 
2.45.2



