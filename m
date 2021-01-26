Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5897303FBA
	for <lists+linux-leds@lfdr.de>; Tue, 26 Jan 2021 15:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405735AbhAZOIT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 Jan 2021 09:08:19 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:42516 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405719AbhAZOH7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 Jan 2021 09:07:59 -0500
Date:   Tue, 26 Jan 2021 14:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1611669958;
        bh=1C99cDDTQ+SZKHo4y3ZuqDc9cOo98aFRzT/bhvsGMbc=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=vYrb8rcSN3UG0+AI1EW0yIuwjSq2k0guMoKO/1AKzLa9F9/r+uRcZTL+FjqPwiBXa
         agSwjxM0kdpQCZMVqv9nYNSIrKLh5yuM9KdgUmshxVwD7qpPofLRRrpfDWqnZCT/cv
         38oUN8i4LgyHyjHHl02i+BUnd4m6LJ5q/KRsWzIM=
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
From:   =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: [PATCH v2 2/4] leds: Add driver for QCOM SPMI Flash LEDs
Message-ID: <20210126140240.1517044-3-nfraprado@protonmail.com>
In-Reply-To: <20210126140240.1517044-1-nfraprado@protonmail.com>
References: <20210126140240.1517044-1-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add driver for the Qualcomm SPMI Flash LEDs. These are controlled
through an SPMI bus and are part of the PM8941 PMIC. There are two LEDs
present in the chip, and can be used independently as camera flash or
together in torch mode to act as a lantern.

Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---
Changes in v2:
- Thanks to Jacek:
  - Implemented flash LED class framework
- Thanks to Bjorn:
  - Renamed driver to "qcom spmi flash"
- Refactored code
- Added missing copyright

 drivers/leds/Kconfig                |    8 +
 drivers/leds/Makefile               |    1 +
 drivers/leds/leds-qcom-spmi-flash.c | 1153 +++++++++++++++++++++++++++
 3 files changed, 1162 insertions(+)
 create mode 100644 drivers/leds/leds-qcom-spmi-flash.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 849d3c5f908e..ad1c7846f9b3 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -928,6 +928,14 @@ config LEDS_ACER_A500
 =09  This option enables support for the Power Button LED of
 =09  Acer Iconia Tab A500.
=20
+config LEDS_QCOM_SPMI_FLASH
+=09tristate "Support for QCOM SPMI Flash LEDs"
+=09depends on SPMI
+=09depends on LEDS_CLASS_FLASH
+=09help
+=09  This driver supports the Flash/Torch LED present in Qualcomm's PM8941
+=09  PMIC.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
=20
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 73e603e1727e..e86bcfba016b 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -93,6 +93,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)=09=09+=3D leds-turris-omn=
ia.o
 obj-$(CONFIG_LEDS_WM831X_STATUS)=09+=3D leds-wm831x-status.o
 obj-$(CONFIG_LEDS_WM8350)=09=09+=3D leds-wm8350.o
 obj-$(CONFIG_LEDS_WRAP)=09=09=09+=3D leds-wrap.o
+obj-$(CONFIG_LEDS_QCOM_SPMI_FLASH)=09+=3D leds-qcom-spmi-flash.o
=20
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)=09=09+=3D leds-cr0014114.o
diff --git a/drivers/leds/leds-qcom-spmi-flash.c b/drivers/leds/leds-qcom-s=
pmi-flash.c
new file mode 100644
index 000000000000..023fc107abce
--- /dev/null
+++ b/drivers/leds/leds-qcom-spmi-flash.c
@@ -0,0 +1,1153 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Qualcomm SPMI Flash Driver
+ *
+ * Copyright (c) 2020, N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.c=
om>
+ *
+ * Based on QPNP LEDs driver from downstream MSM kernel sources.
+ * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/spmi.h>
+#include <linux/of_device.h>
+#include <linux/device.h>
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/mutex.h>
+#include <linux/sysfs.h>
+#include <linux/led-class-flash.h>
+#include <linux/regulator/consumer.h>
+#include <linux/delay.h>
+#include <linux/regmap.h>
+#include <dt-bindings/leds/leds-qcom-spmi-flash.h>
+
+#define FLASH_SAFETY_TIMER=09=090x40
+#define FLASH_MAX_CURR=09=09=090x41
+#define FLASH_LED_0_CURR=09=090x42
+#define FLASH_LED_1_CURR=09=090x43
+#define FLASH_CLAMP_CURR=09=090x44
+#define FLASH_LED_TMR_CTRL=09=090x48
+#define FLASH_HEADROOM=09=09=090x4A
+#define FLASH_STARTUP_DELAY=09=090x4B
+#define FLASH_MASK_ENABLE=09=090x4C
+#define FLASH_VREG_OK_FORCE=09=090x4F
+#define FLASH_ENABLE_CONTROL=09=090x46
+#define FLASH_LED_STROBE_CTRL=09=090x47
+#define FLASH_LED_UNLOCK_SECURE=09=090xD0
+#define FLASH_LED_TORCH=09=09=090xE4
+#define FLASH_FAULT_DETECT=09=090x51
+#define FLASH_RAMP_RATE=09=09=090x54
+#define FLASH_PERIPHERAL_SUBTYPE=090x05
+#define FLASH_VPH_PWR_DROOP=09=090x5A
+
+#define FLASH_MAX_LEVEL=09=09=090x4F
+#define TORCH_MAX_LEVEL=09=09=090x0F
+#define=09FLASH_NO_MASK=09=09=090x00
+
+#define FLASH_MASK_1=09=09=090x20
+#define FLASH_MASK_REG_MASK=09=090xE0
+#define FLASH_HEADROOM_MASK=09=090x03
+#define FLASH_SAFETY_TIMER_MASK=09=090x7F
+#define FLASH_CURRENT_MASK=09=090xFF
+#define FLASH_MAX_CURRENT_MASK=09=090x7F
+#define FLASH_TMR_MASK=09=09=090x03
+#define FLASH_TMR_WATCHDOG=09=090x03
+#define FLASH_TMR_SAFETY=09=090x00
+#define FLASH_FAULT_DETECT_MASK=09=090X80
+#define FLASH_HW_VREG_OK=09=090x40
+#define FLASH_VREG_MASK=09=09=090xC0
+#define FLASH_STARTUP_DLY_MASK=09=090x02
+#define FLASH_RAMP_RATE_MASK=09=090xBF
+#define FLASH_VPH_PWR_DROOP_MASK=090xF3
+
+#define FLASH_ENABLE_ALL=09=090xE0
+#define FLASH_ENABLE_MODULE=09=090x80
+#define FLASH_ENABLE_MODULE_MASK=090x80
+#define FLASH_DISABLE_ALL=09=090x00
+#define FLASH_ENABLE_MASK=09=090xE0
+#define FLASH_ENABLE_LED_0=09=090xC0
+#define FLASH_ENABLE_LED_1=09=090xA0
+#define FLASH_INIT_MASK=09=09=090xE0
+#define FLASH_SELFCHECK_ENABLE=09=090x80
+#define FLASH_SELFCHECK_DISABLE=09=090x00
+
+#define FLASH_STROBE_SW=09=09=090xC0
+#define FLASH_STROBE_HW=09=09=090x04
+#define FLASH_STROBE_MASK=09=090xC7
+#define FLASH_LED_0_OUTPUT=09=090x80
+#define FLASH_LED_1_OUTPUT=09=090x40
+
+#define FLASH_TORCH_MASK=09=090x03
+#define FLASH_LED_TORCH_ENABLE=09=090x00
+#define FLASH_LED_TORCH_DISABLE=09=090x03
+#define FLASH_UNLOCK_SECURE=09=090xA5
+#define FLASH_SECURE_MASK=09=090xFF
+
+#define FLASH_SUBTYPE_DUAL=09=090x01
+#define FLASH_SUBTYPE_SINGLE=09=090x02
+
+#define FLASH_DURATION_STEP=09=0910000
+#define FLASH_DURATION_MIN=09=0910000
+#define FLASH_DURATION_MAX=09=091280000 //TODO: find real value
+
+#define FLASH_CURRENT_STEP=09=0912500
+#define FLASH_CURRENT_MIN=09=0912500
+#define FLASH_CURRENT_MAX=09=091000000
+#define FLASH_TORCH_CURRENT_MAX=09=09200000
+
+#define FLASH_DEFAULT_CLAMP=09=09200000
+
+enum qcom_flash_ids {
+=09QCOM_FLASH_ID_LED0,
+=09QCOM_FLASH_ID_LED1,
+};
+
+static u8 flash_debug_regs[] =3D {
+=090x40, 0x41, 0x42, 0x43, 0x44, 0x48, 0x49, 0x4b, 0x4c,
+=090x4f, 0x46, 0x47,
+};
+
+/**
+ * struct qcom_flash_led - Represents each individual flash LED
+ * @cdev: flash LED classdev
+ * @id: led ID as given by enum qcom_flash_ids
+ * @default_on: default state for the LED
+ * @turn_off_delay_ms: number of msec before turning off the LED
+ * @clamp_curr: Clamp current to use
+ * @headroom: Headroom value to use, as given by leds-qcom-spmi-flash.h
+ * @enable_module: enable address for particular flash
+ * @trigger_flash: trigger flash
+ * @startup_dly: startup delay for flash, as given by leds-qcom-spmi-flash=
.h
+ * @strobe_type: select between sw and hw strobe
+ * @current_addr: address to write for current
+ * @second_addr: address of secondary flash to be written
+ * @safety_timer: enable safety timer or watchdog timer
+ * @torch_enable: whether torch mode is enabled or individual flash LED
+ */
+struct qcom_flash_led {
+=09struct led_classdev_flash cdev;
+=09int id;
+=09bool default_on;
+=09int turn_off_delay_ms;
+=09u32 clamp_curr;
+=09u8 headroom;
+=09u8 enable_module;
+=09u8 trigger_flash;
+=09u8 startup_dly;
+=09u8 strobe_type;
+=09u16 current_addr;
+=09u16 second_addr;
+=09bool safety_timer;
+=09bool torch_enable;
+};
+
+/**
+ * struct qcom_flash_device - QCOM SPMI Flash device, contains 2 flash LED=
s
+ * @regmap: regmap used to access LED registers over SPMI
+ * @base: base register given in device tree
+ * @pdev: platform device from devicetree
+ * @flash_boost_reg: voltage regulator to supply the flashes
+ * @torch_boost_reg: voltage regulator to supply torch mode
+ * @leds: flash LEDs
+ * @num_leds: number of LEDs registered (between 0 and 2)
+ * @lock: lock to protect SPMI transactions
+ * @torch_enable: enable flash LED torch mode
+ * @peripheral_subtype: module peripheral subtype
+ * @flash_regulator_on: flash regulator status
+ * @torch_regulator_on: torch regulator status
+ */
+struct qcom_flash_device {
+=09struct regmap *regmap;
+=09u16 base;
+=09struct platform_device *pdev;
+=09struct regulator *flash_boost_reg;
+=09struct regulator *torch_boost_reg;
+=09struct qcom_flash_led leds[2];
+=09u8 num_leds;
+=09struct mutex lock;
+=09u8 torch_enable;
+=09u8 peripheral_subtype;
+=09bool flash_regulator_on;
+=09bool torch_regulator_on;
+};
+
+static inline struct qcom_flash_led *flcdev_to_led(struct led_classdev_fla=
sh *fled_cdev)
+{
+=09return container_of(fled_cdev, struct qcom_flash_led, cdev);
+}
+
+static inline struct qcom_flash_device *led_to_leds_dev(struct qcom_flash_=
led *led)
+{
+=09return container_of(led, struct qcom_flash_device, leds[led->id]);
+}
+
+static int led_read_reg(struct qcom_flash_device *leds_dev, u16 offset, u8=
 *data)
+{
+=09unsigned int val;
+=09int ret;
+
+=09ret =3D regmap_read(leds_dev->regmap, leds_dev->base + offset, &val);
+=09if (ret < 0)
+=09=09return ret;
+
+=09*data =3D val;
+=09return 0;
+}
+
+static int led_write_reg(struct qcom_flash_device *leds_dev, u16 offset, u=
8 data)
+{
+=09return regmap_write(leds_dev->regmap, leds_dev->base + offset, data);
+}
+
+static int qcom_flash_masked_write(struct qcom_flash_device *leds_dev,
+=09=09=09=09   u16 addr,
+=09=09=09=09   u8 mask,
+=09=09=09=09   u8 val)
+{
+=09int rc;
+=09u8 reg;
+
+=09rc =3D led_read_reg(leds_dev, addr, &reg);
+=09if (rc)
+=09=09dev_err(&leds_dev->pdev->dev,
+=09=09=09"Unable to read from addr=3D%x, rc(%d)\n", addr, rc);
+
+=09reg &=3D ~mask;
+=09reg |=3D val;
+
+=09rc =3D led_write_reg(leds_dev, addr, reg);
+=09if (rc)
+=09=09dev_err(&leds_dev->pdev->dev,
+=09=09=09"Unable to write to addr=3D%x, rc(%d)\n", addr, rc);
+=09return rc;
+}
+
+static void qcom_flash_dump_regs(struct qcom_flash_device *leds_dev,
+=09=09=09=09 u8 regs[],
+=09=09=09=09 u8 array_size)
+{
+=09int i;
+=09u8 val;
+
+=09pr_debug("=3D=3D=3D=3D=3D LED register dump start =3D=3D=3D=3D=3D\n");
+=09for (i =3D 0; i < array_size; i++) {
+=09=09led_read_reg(leds_dev, regs[i], &val);
+=09=09pr_debug("0x%x =3D 0x%x\n", leds_dev->base + regs[i], val);
+=09}
+=09pr_debug("=3D=3D=3D=3D=3D LED register dump end =3D=3D=3D=3D=3D\n");
+}
+
+static u8 qcom_flash_duration_to_reg(u32 us)
+{
+=09if (us < FLASH_DURATION_MIN)
+=09=09us =3D FLASH_DURATION_MIN;
+=09return (us - FLASH_DURATION_MIN) / FLASH_DURATION_STEP;
+}
+
+static u8 qcom_flash_current_to_reg(u32 ua)
+{
+=09if (ua < FLASH_CURRENT_MIN)
+=09=09ua =3D FLASH_CURRENT_MIN;
+=09return (ua - FLASH_CURRENT_MIN) / FLASH_CURRENT_STEP;
+}
+
+static void clamp_align(u32 *v, u32 min, u32 max, u32 step)
+{
+=09*v =3D clamp_val(*v, min, max);
+=09if (step > 1)
+=09=09*v =3D (*v - min) / step * step + min;
+}
+
+static int qcom_flash_fled_regulator_operate(struct qcom_flash_device *led=
s_dev,
+=09=09=09=09=09     bool on)
+{
+=09int rc;
+
+=09if (!on)
+=09=09goto regulator_turn_off;
+
+=09if (!leds_dev->flash_regulator_on) {
+=09=09if (leds_dev->flash_boost_reg) {
+=09=09=09rc =3D regulator_enable(leds_dev->flash_boost_reg);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(&leds_dev->pdev->dev,
+=09=09=09=09=09"Regulator enable failed(%d)\n", rc);
+=09=09=09=09return rc;
+=09=09=09}
+=09=09=09leds_dev->flash_regulator_on =3D true;
+=09=09}
+=09}
+
+=09return 0;
+
+regulator_turn_off:
+=09if (leds_dev->flash_regulator_on) {
+=09=09if (leds_dev->flash_boost_reg) {
+=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09FLASH_ENABLE_CONTROL,
+=09=09=09=09FLASH_ENABLE_MASK,
+=09=09=09=09FLASH_DISABLE_ALL);
+=09=09=09if (rc)
+=09=09=09=09dev_err(&leds_dev->pdev->dev,
+=09=09=09=09=09"Enable reg write failed(%d)\n", rc);
+
+=09=09=09rc =3D regulator_disable(leds_dev->flash_boost_reg);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(&leds_dev->pdev->dev,
+=09=09=09=09=09"Regulator disable failed(%d)\n", rc);
+=09=09=09=09return rc;
+=09=09=09}
+=09=09=09leds_dev->flash_regulator_on =3D false;
+=09=09}
+=09}
+
+=09return 0;
+}
+
+static int qcom_flash_torch_regulator_operate(struct qcom_flash_device *le=
ds_dev,
+=09=09=09=09=09      bool on)
+{
+=09int rc;
+
+=09if (!on)
+=09=09goto regulator_turn_off;
+
+=09if (!leds_dev->torch_regulator_on) {
+=09=09rc =3D regulator_enable(leds_dev->torch_boost_reg);
+=09=09if (rc) {
+=09=09=09dev_err(&leds_dev->pdev->dev,
+=09=09=09=09"Regulator enable failed(%d)\n", rc);
+=09=09=09return rc;
+=09=09}
+=09=09leds_dev->torch_regulator_on =3D true;
+=09}
+=09return 0;
+
+regulator_turn_off:
+=09if (leds_dev->torch_regulator_on) {
+=09=09rc =3D qcom_flash_masked_write(leds_dev, FLASH_ENABLE_CONTROL,
+=09=09=09=09FLASH_ENABLE_MODULE_MASK, FLASH_DISABLE_ALL);
+=09=09if (rc)
+=09=09=09dev_err(&leds_dev->pdev->dev,
+=09=09=09=09"Enable reg write failed(%d)\n", rc);
+
+=09=09rc =3D regulator_disable(leds_dev->torch_boost_reg);
+=09=09if (rc) {
+=09=09=09dev_err(&leds_dev->pdev->dev,
+=09=09=09=09"Regulator disable failed(%d)\n", rc);
+=09=09=09return rc;
+=09=09}
+=09=09leds_dev->torch_regulator_on =3D false;
+=09}
+=09return 0;
+}
+
+static int qcom_flash_fled_set(struct qcom_flash_led *led, bool on)
+{
+=09int rc, error;
+=09u8 curr;
+=09struct qcom_flash_device *leds_dev =3D led_to_leds_dev(led);
+=09struct device *dev =3D &leds_dev->pdev->dev;
+
+=09/* dump flash registers */
+=09pr_debug("Regdump before\n");
+=09qcom_flash_dump_regs(leds_dev, flash_debug_regs,
+=09=09=09     ARRAY_SIZE(flash_debug_regs));
+
+=09/* Set led current */
+=09if (on) {
+=09=09if (led->torch_enable)
+=09=09=09curr =3D qcom_flash_current_to_reg(led->cdev.led_cdev.brightness)=
;
+=09=09else
+=09=09=09curr =3D qcom_flash_current_to_reg(led->cdev.brightness.val);
+
+=09=09if (led->torch_enable) {
+=09=09=09if (leds_dev->peripheral_subtype =3D=3D FLASH_SUBTYPE_DUAL) {
+=09=09=09=09rc =3D qcom_flash_torch_regulator_operate(leds_dev, true);
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(dev,
+=09=09=09=09=09"Torch regulator operate failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09=09return rc;
+=09=09=09=09}
+=09=09=09} else if (leds_dev->peripheral_subtype =3D=3D FLASH_SUBTYPE_SING=
LE) {
+=09=09=09=09rc =3D qcom_flash_fled_regulator_operate(leds_dev, true);
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(dev,
+=09=09=09=09=09"Flash regulator operate failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09=09goto error_flash_set;
+=09=09=09=09}
+
+=09=09=09=09/*
+=09=09=09=09 * Write 0x80 to MODULE_ENABLE before writing
+=09=09=09=09 * 0xE0 in order to avoid a hardware bug caused
+=09=09=09=09 * by register value going from 0x00 to 0xE0.
+=09=09=09=09 */
+=09=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09=09FLASH_ENABLE_CONTROL,
+=09=09=09=09=09FLASH_ENABLE_MODULE_MASK,
+=09=09=09=09=09FLASH_ENABLE_MODULE);
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(dev,
+=09=09=09=09=09=09"Enable reg write failed(%d)\n",
+=09=09=09=09=09=09rc);
+=09=09=09=09=09return rc;
+=09=09=09=09}
+=09=09=09}
+
+=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09FLASH_LED_UNLOCK_SECURE,
+=09=09=09=09FLASH_SECURE_MASK, FLASH_UNLOCK_SECURE);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev, "Secure reg write failed(%d)\n", rc);
+=09=09=09=09goto error_reg_write;
+=09=09=09}
+
+=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09FLASH_LED_TORCH,
+=09=09=09=09FLASH_TORCH_MASK, FLASH_LED_TORCH_ENABLE);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev, "Torch reg write failed(%d)\n", rc);
+=09=09=09=09goto error_reg_write;
+=09=09=09}
+
+=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09led->current_addr,
+=09=09=09=09FLASH_CURRENT_MASK,
+=09=09=09=09curr);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev, "Current reg write failed(%d)\n", rc);
+=09=09=09=09goto error_reg_write;
+=09=09=09}
+
+=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09led->second_addr,
+=09=09=09=09FLASH_CURRENT_MASK,
+=09=09=09=09curr);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev,
+=09=09=09=09=09"2nd Current reg write failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09goto error_reg_write;
+=09=09=09}
+
+=09=09=09qcom_flash_masked_write(leds_dev, FLASH_MAX_CURR,
+=09=09=09=09FLASH_CURRENT_MASK,
+=09=09=09=09TORCH_MAX_LEVEL);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev,
+=09=09=09=09=09"Max current reg write failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09goto error_reg_write;
+=09=09=09}
+
+=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09FLASH_ENABLE_CONTROL,
+=09=09=09=09FLASH_ENABLE_MASK,
+=09=09=09=09leds_dev->torch_enable);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev, "Enable reg write failed(%d)\n", rc);
+=09=09=09=09goto error_reg_write;
+=09=09=09}
+
+=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09FLASH_LED_STROBE_CTRL,
+=09=09=09=09FLASH_STROBE_SW,
+=09=09=09=09FLASH_STROBE_SW);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev,
+=09=09=09=09=09"LED %d strobe reg write failed(%d)\n",
+=09=09=09=09=09led->id, rc);
+=09=09=09=09goto error_reg_write;
+=09=09=09}
+=09=09} else {
+=09=09=09rc =3D qcom_flash_fled_regulator_operate(leds_dev, true);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev,
+=09=09=09=09=09"Flash regulator operate failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09goto error_flash_set;
+=09=09=09}
+
+=09=09=09/* Set flash safety timer */
+=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09FLASH_SAFETY_TIMER,
+=09=09=09=09FLASH_SAFETY_TIMER_MASK,
+=09=09=09=09qcom_flash_duration_to_reg(led->cdev.timeout.val));
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev,
+=09=09=09=09=09"Safety timer reg write failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09goto error_flash_set;
+=09=09=09}
+
+=09=09=09/* Set max current */
+=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09FLASH_MAX_CURR, FLASH_CURRENT_MASK,
+=09=09=09=09FLASH_MAX_LEVEL);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev,
+=09=09=09=09=09"Max current reg write failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09goto error_flash_set;
+=09=09=09}
+
+=09=09=09/* Set clamp current */
+=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09FLASH_CLAMP_CURR,
+=09=09=09=09FLASH_CURRENT_MASK,
+=09=09=09=09qcom_flash_current_to_reg(led->clamp_curr));
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev,
+=09=09=09=09=09"Clamp current reg write failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09goto error_flash_set;
+=09=09=09}
+
+=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09led->current_addr,
+=09=09=09=09FLASH_CURRENT_MASK,
+=09=09=09=09curr);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev, "Current reg write failed(%d)\n", rc);
+=09=09=09=09goto error_flash_set;
+=09=09=09}
+
+=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09FLASH_ENABLE_CONTROL,
+=09=09=09=09led->enable_module,
+=09=09=09=09led->enable_module);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev, "Enable reg write failed(%d)\n", rc);
+=09=09=09=09goto error_flash_set;
+=09=09=09}
+
+=09=09=09/* TODO try to not busy wait*/
+=09=09=09mdelay(1);
+
+=09=09=09if (!led->strobe_type) {
+=09=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09=09FLASH_LED_STROBE_CTRL,
+=09=09=09=09=09led->trigger_flash,
+=09=09=09=09=09led->trigger_flash);
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(dev,
+=09=09=09=09=09"LED %d strobe reg write failed(%d)\n",
+=09=09=09=09=09led->id, rc);
+=09=09=09=09=09goto error_flash_set;
+=09=09=09=09}
+=09=09=09} else {
+=09=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09=09FLASH_LED_STROBE_CTRL,
+=09=09=09=09=09(led->trigger_flash | FLASH_STROBE_HW),
+=09=09=09=09=09(led->trigger_flash | FLASH_STROBE_HW));
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(dev,
+=09=09=09=09=09"LED %d strobe reg write failed(%d)\n",
+=09=09=09=09=09led->id, rc);
+=09=09=09=09=09goto error_flash_set;
+=09=09=09=09}
+=09=09=09}
+=09=09}
+=09} else {
+=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09FLASH_LED_STROBE_CTRL,
+=09=09=09led->trigger_flash,
+=09=09=09FLASH_DISABLE_ALL);
+=09=09if (rc) {
+=09=09=09dev_err(dev,
+=09=09=09=09"LED %d flash write failed(%d)\n", led->id, rc);
+=09=09=09if (led->torch_enable)
+=09=09=09=09goto error_torch_set;
+=09=09=09else
+=09=09=09=09goto error_flash_set;
+=09=09}
+
+=09=09/* TODO try to not busy wait*/
+=09=09mdelay(2);
+=09=09udelay(160);
+
+=09=09if (led->torch_enable) {
+=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09FLASH_LED_UNLOCK_SECURE,
+=09=09=09=09FLASH_SECURE_MASK, FLASH_UNLOCK_SECURE);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev, "Secure reg write failed(%d)\n", rc);
+=09=09=09=09goto error_torch_set;
+=09=09=09}
+
+=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09=09FLASH_LED_TORCH,
+=09=09=09=09=09FLASH_TORCH_MASK,
+=09=09=09=09=09FLASH_LED_TORCH_DISABLE);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev, "Torch reg write failed(%d)\n", rc);
+=09=09=09=09goto error_torch_set;
+=09=09=09}
+
+=09=09=09if (leds_dev->peripheral_subtype =3D=3D FLASH_SUBTYPE_DUAL) {
+=09=09=09=09rc =3D qcom_flash_torch_regulator_operate(leds_dev,false);
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(dev,
+=09=09=09=09=09=09"Torch regulator operate failed(%d)\n",
+=09=09=09=09=09=09rc);
+=09=09=09=09=09return rc;
+=09=09=09=09}
+=09=09=09} else if (leds_dev->peripheral_subtype =3D=3D FLASH_SUBTYPE_SING=
LE) {
+=09=09=09=09rc =3D qcom_flash_fled_regulator_operate(leds_dev, false);
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(dev,
+=09=09=09=09=09=09"Flash regulator operate failed(%d)\n",
+=09=09=09=09=09=09rc);
+=09=09=09=09=09return rc;
+=09=09=09=09}
+=09=09=09}
+=09=09} else {
+=09=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09=09FLASH_ENABLE_CONTROL,
+=09=09=09=09led->enable_module &
+=09=09=09=09~FLASH_ENABLE_MODULE_MASK,
+=09=09=09=09FLASH_DISABLE_ALL);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev, "Enable reg write failed(%d)\n", rc);
+=09=09=09=09if (led->torch_enable)
+=09=09=09=09=09goto error_torch_set;
+=09=09=09=09else
+=09=09=09=09=09goto error_flash_set;
+=09=09=09}
+
+=09=09=09rc =3D qcom_flash_fled_regulator_operate(leds_dev, false);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(dev,
+=09=09=09=09=09"Flash regulator operate failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09return rc;
+=09=09=09}
+=09=09}
+=09}
+
+=09pr_debug("Regdump after\n");
+=09qcom_flash_dump_regs(leds_dev, flash_debug_regs, ARRAY_SIZE(flash_debug=
_regs));
+
+=09return 0;
+
+error_reg_write:
+=09if (leds_dev->peripheral_subtype =3D=3D FLASH_SUBTYPE_SINGLE)
+=09=09goto error_flash_set;
+
+error_torch_set:
+=09error =3D qcom_flash_torch_regulator_operate(leds_dev, false);
+=09if (error) {
+=09=09dev_err(dev, "Torch regulator operate failed(%d)\n", rc);
+=09=09return error;
+=09}
+=09return rc;
+
+error_flash_set:
+=09error =3D qcom_flash_fled_regulator_operate(leds_dev, false);
+=09if (error) {
+=09=09dev_err(dev, "Flash regulator operate failed(%d)\n", rc);
+=09=09return error;
+=09}
+=09return rc;
+}
+
+static int qcom_flash_led_set(struct led_classdev *led_cdev,
+=09=09=09      enum led_brightness value)
+{
+=09struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
+=09struct qcom_flash_led *led =3D flcdev_to_led(fled_cdev);
+=09struct qcom_flash_device *leds_dev =3D led_to_leds_dev(led);
+=09u32 val =3D value;
+=09int rc;
+=09bool on;
+
+=09if (val > led_cdev->max_brightness) {
+=09=09dev_err(&leds_dev->pdev->dev, "Invalid brightness value\n");
+=09=09return -EINVAL;
+=09}
+
+=09if (val) {
+=09=09on =3D true;
+=09=09clamp_align(&val, FLASH_CURRENT_MIN, led_cdev->max_brightness,
+=09=09=09    FLASH_CURRENT_STEP);
+=09=09led_cdev->brightness =3D val;
+=09=09led->torch_enable =3D true;
+=09} else {
+=09=09on =3D false;
+=09}
+
+=09mutex_lock(&leds_dev->lock);
+=09rc =3D qcom_flash_fled_set(led, on);
+=09if (rc < 0)
+=09=09dev_err(&leds_dev->pdev->dev, "FLASH set brightness failed (%d)\n", =
rc);
+=09mutex_unlock(&leds_dev->lock);
+=09return rc;
+}
+
+static int qcom_flash_fled_brightness_set(struct led_classdev_flash *fled_=
cdev,
+=09=09=09=09=09  u32 brightness)
+{
+=09clamp_align(&brightness, FLASH_CURRENT_MIN, fled_cdev->brightness.max,
+=09=09    FLASH_CURRENT_STEP);
+=09fled_cdev->brightness.val =3D brightness;
+=09return 0;
+}
+
+static int qcom_flash_fled_strobe_set(struct led_classdev_flash *fled_cdev=
,
+=09=09=09=09      bool state)
+{
+=09struct qcom_flash_led *led =3D flcdev_to_led(fled_cdev);
+=09struct qcom_flash_device *leds_dev =3D led_to_leds_dev(led);
+=09int rc;
+
+=09led->torch_enable =3D false;
+
+=09mutex_lock(&leds_dev->lock);
+=09rc =3D qcom_flash_fled_set(led, state);
+=09if (rc < 0)
+=09=09return rc;
+=09mutex_unlock(&leds_dev->lock);
+
+=09return 0;
+}
+
+static int qcom_flash_fled_strobe_get(struct led_classdev_flash *fled_cdev=
,
+=09=09=09=09      bool *state)
+{
+=09//TODO
+=09*state =3D 0;
+=09return 0;
+}
+
+static int qcom_flash_fled_timeout_set(struct led_classdev_flash *fled_cde=
v,
+=09=09=09=09       u32 timeout)
+{
+=09fled_cdev->timeout.val =3D timeout;
+=09return 0;
+}
+
+static int qcom_flash_fled_fault_get(struct led_classdev_flash *fled_cdev,
+=09=09=09=09     u32 *fault)
+{
+=09//TODO
+=09*fault =3D 0;
+=09return 0;
+}
+
+static const struct led_flash_ops flash_ops =3D {
+=09.flash_brightness_set=09=3D qcom_flash_fled_brightness_set,
+=09.strobe_set=09=09=3D qcom_flash_fled_strobe_set,
+=09.strobe_get=09=09=3D qcom_flash_fled_strobe_get,
+=09.timeout_set=09=09=3D qcom_flash_fled_timeout_set,
+=09.fault_get=09=09=3D qcom_flash_fled_fault_get,
+};
+
+static int qcom_flash_flcdev_setup(struct qcom_flash_led *led,
+=09=09=09=09   struct device_node *node)
+{
+=09int rc;
+=09struct platform_device *pdev =3D led_to_leds_dev(led)->pdev;
+=09struct led_init_data init_data =3D {};
+
+=09init_data.fwnode =3D of_fwnode_handle(node);
+=09init_data.devicename =3D "qcom-spmi-flash";
+=09init_data.default_label =3D "flash";
+
+=09led->cdev.led_cdev.brightness_set_blocking    =3D qcom_flash_led_set;
+
+=09rc =3D of_property_read_u32(node, "led-max-microamp",
+=09=09=09=09  &led->cdev.led_cdev.max_brightness);
+=09if (rc < 0) {
+=09=09dev_err(&pdev->dev, "Failure reading max_current, rc =3D  %d\n", rc)=
;
+=09=09return rc;
+=09}
+=09led->cdev.led_cdev.max_brightness =3D min((u32) led->cdev.led_cdev.max_=
brightness,
+=09=09=09=09=09=09(u32) FLASH_TORCH_CURRENT_MAX);
+
+=09rc =3D of_property_read_u32(node, "flash-max-microamp", &led->cdev.brig=
htness.max);
+=09if (rc < 0) {
+=09=09dev_err(&pdev->dev, "Failure reading max_current, rc =3D  %d\n", rc)=
;
+=09=09return rc;
+=09}
+=09led->cdev.brightness.max =3D min((u32) led->cdev.brightness.max,
+=09=09=09=09(u32) FLASH_CURRENT_MAX);
+=09led->cdev.brightness.min =3D FLASH_CURRENT_MIN;
+=09led->cdev.brightness.step =3D FLASH_CURRENT_STEP;
+=09led->cdev.brightness.val =3D led->cdev.brightness.max;
+
+=09rc =3D of_property_read_u32(node, "flash-max-timeout-us", &led->cdev.ti=
meout.max);
+=09if (rc < 0) {
+=09=09dev_err(&pdev->dev, "Failure reading max_timeout, rc =3D  %d\n", rc)=
;
+=09=09return rc;
+=09}
+=09led->cdev.timeout.max =3D min((u32) led->cdev.timeout.max,
+=09=09=09=09    (u32) FLASH_DURATION_MAX);
+=09led->cdev.timeout.min =3D FLASH_DURATION_MIN;
+=09led->cdev.timeout.step =3D FLASH_DURATION_STEP;
+=09led->cdev.timeout.val =3D led->cdev.timeout.max;
+
+=09led->cdev.ops =3D &flash_ops;
+=09led->cdev.led_cdev.flags |=3D LED_DEV_CAP_FLASH;
+
+=09rc =3D led_classdev_flash_register_ext(&pdev->dev, &led->cdev, &init_da=
ta);
+=09if (rc) {
+=09=09dev_err(&pdev->dev, "unable to register led %d,rc=3D%d\n", led->id, =
rc);
+=09=09return rc;
+=09}
+
+=09return 0;
+}
+
+static int qcom_flash_setup_flash_regs(struct qcom_flash_led *led)
+{
+=09int rc;
+=09struct qcom_flash_device *leds_dev =3D led_to_leds_dev(led);
+
+=09/* Set headroom */
+=09rc =3D qcom_flash_masked_write(leds_dev, FLASH_HEADROOM,
+=09=09FLASH_HEADROOM_MASK, led->headroom);
+=09if (rc) {
+=09=09dev_err(&leds_dev->pdev->dev, "Headroom reg write failed(%d)\n", rc)=
;
+=09=09return rc;
+=09}
+
+=09/* Set startup delay */
+=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09FLASH_STARTUP_DELAY, FLASH_STARTUP_DLY_MASK,
+=09=09led->startup_dly);
+=09if (rc) {
+=09=09dev_err(&leds_dev->pdev->dev,
+=09=09=09"Startup delay reg write failed(%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09/* Set timer control - safety or watchdog */
+=09if (led->safety_timer) {
+=09=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09=09FLASH_LED_TMR_CTRL,
+=09=09=09FLASH_TMR_MASK, FLASH_TMR_SAFETY);
+=09=09if (rc) {
+=09=09=09dev_err(&leds_dev->pdev->dev,
+=09=09=09=09"LED timer ctrl reg write failed(%d)\n", rc);
+=09=09=09return rc;
+=09=09}
+=09}
+
+=09/* dump flash registers */
+=09qcom_flash_dump_regs(leds_dev, flash_debug_regs, ARRAY_SIZE(flash_debug=
_regs));
+
+=09return 0;
+}
+
+static int qcom_flash_get_config_flash(struct qcom_flash_led *led,
+=09=09=09=09       struct device_node *node)
+{
+=09int rc;
+=09u32 val;
+=09const char *temp_string;
+=09struct device *dev =3D &led_to_leds_dev(led)->pdev->dev;
+
+=09rc =3D of_property_read_u32(node, "led-sources", &led->id);
+=09if (rc < 0) {
+=09=09dev_err(dev, "Failure reading led id, rc =3D  %d\n", rc);
+=09=09return rc;
+=09}
+
+=09led->default_on =3D false;
+=09rc =3D of_property_read_string(node, "default-state", &temp_string);
+=09if (!rc) {
+=09=09if (strncmp(temp_string, "on", sizeof("on")) =3D=3D 0)
+=09=09=09led->default_on =3D true;
+=09} else if (rc !=3D -EINVAL)
+=09=09return rc;
+
+=09led->turn_off_delay_ms =3D 0;
+=09rc =3D of_property_read_u32(node, "qcom,turn-off-delay-ms", &val);
+=09if (!rc)
+=09=09led->turn_off_delay_ms =3D val;
+=09else if (rc !=3D -EINVAL)
+=09=09return rc;
+
+=09if (led->id =3D=3D QCOM_FLASH_ID_LED0) {
+=09=09led->enable_module =3D FLASH_ENABLE_LED_0;
+=09=09led->current_addr =3D FLASH_LED_0_CURR;
+=09=09led->trigger_flash =3D FLASH_LED_0_OUTPUT;
+
+=09=09led->second_addr =3D FLASH_LED_1_CURR;
+=09} else if (led->id =3D=3D QCOM_FLASH_ID_LED1) {
+=09=09led->enable_module =3D FLASH_ENABLE_LED_1;
+=09=09led->current_addr =3D FLASH_LED_1_CURR;
+=09=09led->trigger_flash =3D FLASH_LED_1_OUTPUT;
+
+=09=09led->second_addr =3D FLASH_LED_0_CURR;
+=09} else {
+=09=09dev_err(dev, "Unknown flash LED name given\n");
+=09=09return -EINVAL;
+=09}
+
+=09rc =3D of_property_read_u32(node, "qcom,headroom", &val);
+=09if (!rc)
+=09=09led->headroom =3D (u8) val;
+=09else if (rc =3D=3D -EINVAL)
+=09=09led->headroom =3D QCOM_SPMI_FLASH_HEADROOM_500MV;
+
+=09rc =3D of_property_read_u32(node, "qcom,clamp-curr", &val);
+=09if (!rc)
+=09=09led->clamp_curr =3D val;
+=09else if (rc =3D=3D -EINVAL)
+=09=09led->clamp_curr =3D FLASH_DEFAULT_CLAMP;
+
+=09rc =3D of_property_read_u32(node, "qcom,startup-dly", &val);
+=09if (!rc)
+=09=09led->startup_dly =3D (u8) val;
+=09else if (rc =3D=3D -EINVAL)
+=09=09led->startup_dly =3D QCOM_SPMI_FLASH_STARTUP_DLY_128US;
+
+=09led->safety_timer =3D of_property_read_bool(node, "qcom,safety-timer");
+
+=09return 0;
+}
+
+static int qcom_flash_setup_regs(struct qcom_flash_device *leds_dev)
+{
+=09int rc;
+
+=09rc =3D qcom_flash_masked_write(leds_dev,
+=09=09FLASH_LED_STROBE_CTRL,
+=09=09FLASH_STROBE_MASK, FLASH_DISABLE_ALL);
+=09if (rc) {
+=09=09dev_err(&leds_dev->pdev->dev, "LED flash write failed(%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09/* Disable flash LED module */
+=09rc =3D qcom_flash_masked_write(leds_dev, FLASH_ENABLE_CONTROL,
+=09=09FLASH_ENABLE_MODULE_MASK, FLASH_DISABLE_ALL);
+=09if (rc) {
+=09=09dev_err(&leds_dev->pdev->dev, "Enable reg write failed(%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09/* Set Vreg force */
+=09rc =3D qcom_flash_masked_write(leds_dev, FLASH_VREG_OK_FORCE,
+=09=09FLASH_VREG_MASK, FLASH_HW_VREG_OK);
+=09if (rc) {
+=09=09dev_err(&leds_dev->pdev->dev, "Vreg OK reg write failed(%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09/* Set self fault check */
+=09rc =3D qcom_flash_masked_write(leds_dev, FLASH_FAULT_DETECT,
+=09=09FLASH_FAULT_DETECT_MASK, FLASH_SELFCHECK_DISABLE);
+=09if (rc) {
+=09=09dev_err(&leds_dev->pdev->dev,
+=09=09=09"Fault detect reg write failed(%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09/* Set mask enable */
+=09rc =3D qcom_flash_masked_write(leds_dev, FLASH_MASK_ENABLE,
+=09=09FLASH_MASK_REG_MASK, FLASH_MASK_1);
+=09if (rc) {
+=09=09dev_err(&leds_dev->pdev->dev, "Mask enable reg write failed(%d)\n", =
rc);
+=09=09return rc;
+=09}
+
+=09/* Set ramp rate */
+=09rc =3D qcom_flash_masked_write(leds_dev, FLASH_RAMP_RATE,
+=09=09FLASH_RAMP_RATE_MASK, 0xBF);
+=09if (rc) {
+=09=09dev_err(&leds_dev->pdev->dev, "Ramp rate reg write failed(%d)\n", rc=
);
+=09=09return rc;
+=09}
+
+=09/* Enable VPH_PWR_DROOP and set threshold to 2.9V */
+=09rc =3D qcom_flash_masked_write(leds_dev, FLASH_VPH_PWR_DROOP,
+=09=09=09=09=09FLASH_VPH_PWR_DROOP_MASK, 0xC2);
+=09if (rc) {
+=09=09dev_err(&leds_dev->pdev->dev,
+=09=09=09"FLASH_VPH_PWR_DROOP reg write failed(%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09return 0;
+}
+
+static int qcom_flash_setup_led(struct qcom_flash_led *led,
+=09=09=09=09struct device_node *node)
+{
+=09int rc;
+
+=09rc =3D qcom_flash_get_config_flash(led, node);
+=09if (rc < 0) {
+=09=09dev_err(&led_to_leds_dev(led)->pdev->dev,
+=09=09=09"Unable to read flash config data\n");
+=09=09return rc;
+=09}
+
+=09rc =3D qcom_flash_setup_flash_regs(led);
+=09if (rc) {
+=09=09dev_err(&led_to_leds_dev(led)->pdev->dev,
+=09=09=09"FLASH initialize failed(%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09rc =3D qcom_flash_flcdev_setup(led, node);
+=09if (rc < 0)
+=09=09return rc;
+
+=09/* configure default state */
+=09if (led->default_on) {
+=09=09led->cdev.led_cdev.brightness =3D led->cdev.led_cdev.max_brightness;
+=09=09led->torch_enable =3D true;
+=09=09mutex_lock(&led_to_leds_dev(led)->lock);
+=09=09rc =3D qcom_flash_fled_set(led, true);
+=09=09if (rc < 0)
+=09=09=09return rc;
+=09=09mutex_unlock(&led_to_leds_dev(led)->lock);
+=09} else {
+=09=09led->cdev.led_cdev.brightness =3D LED_OFF;
+=09}
+
+=09return 0;
+}
+
+static int qcom_flash_setup_leds_device(struct qcom_flash_device *leds_dev=
,
+=09=09=09=09=09struct device_node *node,
+=09=09=09=09=09struct platform_device *pdev)
+{
+=09u32 reg;
+=09int rc;
+
+=09leds_dev->pdev =3D pdev;
+
+=09leds_dev->regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
+=09if (!leds_dev->regmap)
+=09=09return -ENODEV;
+
+=09rc =3D of_property_read_u32(node, "reg", &reg);
+=09if (rc < 0) {
+=09=09dev_err(&pdev->dev, "Failure reading reg, rc =3D %d\n", rc);
+=09=09return rc;
+=09}
+=09leds_dev->base =3D reg;
+
+=09qcom_flash_setup_regs(leds_dev);
+
+=09if (of_find_property(node, "flash-boost-supply", NULL)) {
+=09=09leds_dev->flash_boost_reg =3D regulator_get(&pdev->dev, "flash-boost=
");
+=09=09if (IS_ERR(leds_dev->flash_boost_reg)) {
+=09=09=09rc =3D PTR_ERR(leds_dev->flash_boost_reg);
+=09=09=09dev_err(&pdev->dev, "Regulator get failed(%d)\n", rc);
+=09=09=09regulator_put(leds_dev->flash_boost_reg);
+=09=09=09leds_dev->flash_boost_reg =3D NULL;
+=09=09=09return rc;
+=09=09}
+=09}
+
+=09if (of_find_property(node, "torch-boost-supply", NULL)) {
+=09=09leds_dev->torch_boost_reg =3D regulator_get(&pdev->dev, "torch-boost=
");
+=09=09if (IS_ERR(leds_dev->torch_boost_reg)) {
+=09=09=09rc =3D PTR_ERR(leds_dev->torch_boost_reg);
+=09=09=09dev_err(&pdev->dev, "Torch regulator get failed(%d)\n", rc);
+=09=09=09regulator_put(leds_dev->flash_boost_reg);
+=09=09=09regulator_put(leds_dev->torch_boost_reg);
+=09=09=09leds_dev->flash_boost_reg =3D NULL;
+=09=09=09leds_dev->torch_boost_reg =3D NULL;
+=09=09=09return rc;
+=09=09}
+=09=09leds_dev->torch_enable =3D FLASH_ENABLE_MODULE;
+=09} else {
+=09=09leds_dev->torch_enable =3D FLASH_ENABLE_ALL;
+=09}
+
+=09rc =3D led_read_reg(leds_dev, FLASH_PERIPHERAL_SUBTYPE,
+=09=09=09  &leds_dev->peripheral_subtype);
+=09if (rc) {
+=09=09dev_err(&pdev->dev,
+=09=09=09"Unable to read from addr=3D%x, rc(%d)\n",
+=09=09=09FLASH_PERIPHERAL_SUBTYPE, rc);
+=09}
+
+=09mutex_init(&leds_dev->lock);
+
+=09return 0;
+}
+
+static int qcom_flash_probe(struct platform_device *pdev)
+{
+=09struct device *dev =3D &pdev->dev;
+=09struct qcom_flash_device *leds_dev;
+=09struct device_node *node =3D dev->of_node;
+=09struct qcom_flash_led *led;
+=09struct device_node *temp;
+=09int rc, i, parsed_leds =3D 0;
+
+=09leds_dev =3D devm_kzalloc(dev, sizeof(struct qcom_flash_device), GFP_KE=
RNEL);
+=09if (!leds_dev)
+=09=09return -ENOMEM;
+
+=09rc =3D qcom_flash_setup_leds_device(leds_dev, node, pdev);
+=09if (rc) {
+=09=09pr_debug("Probe failed setting up base (%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09platform_set_drvdata(pdev, leds_dev);
+
+=09for_each_child_of_node(node, temp) {
+=09=09led =3D &leds_dev->leds[parsed_leds];
+
+=09=09rc =3D qcom_flash_setup_led(led, temp);
+=09=09if (rc) {
+=09=09=09for (i =3D 0; i < parsed_leds; i++)
+=09=09=09=09led_classdev_flash_unregister(&leds_dev->leds[i].cdev);
+=09=09=09pr_debug("Probe failed setting up leds (%d)\n", rc);
+=09=09=09return rc;
+=09=09}
+
+=09=09parsed_leds++;
+=09}
+=09leds_dev->num_leds =3D parsed_leds;
+=09return 0;
+}
+
+static int qcom_flash_remove(struct platform_device *pdev)
+{
+=09struct qcom_flash_device *leds_dev  =3D platform_get_drvdata(pdev);
+=09int i, parsed_leds =3D leds_dev->num_leds;
+
+=09mutex_destroy(&leds_dev->lock);
+=09if (leds_dev->flash_boost_reg)
+=09=09regulator_put(leds_dev->flash_boost_reg);
+=09if (leds_dev->torch_boost_reg)
+=09=09regulator_put(leds_dev->torch_boost_reg);
+=09for (i =3D 0; i < parsed_leds; i++)
+=09=09led_classdev_flash_unregister(&leds_dev->leds[i].cdev);
+
+=09return 0;
+}
+
+static const struct of_device_id qcom_flash_spmi_of_match[] =3D {
+=09{ .compatible =3D "qcom,spmi-flash" },
+=09{},
+};
+MODULE_DEVICE_TABLE(of, qcom_flash_spmi_of_match);
+
+static struct platform_driver qcom_flash_driver =3D {
+=09.driver=09=09=3D {
+=09=09.name=09=3D "qcom,spmi-flash",
+=09=09.of_match_table =3D of_match_ptr(qcom_flash_spmi_of_match),
+=09},
+=09.probe=09=09=3D qcom_flash_probe,
+=09.remove=09=09=3D qcom_flash_remove,
+};
+module_platform_driver(qcom_flash_driver);
+
+MODULE_DESCRIPTION("Qualcomm SPMI Flash LED driver");
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>");
--=20
2.30.0


