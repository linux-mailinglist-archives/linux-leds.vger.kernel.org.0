Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 490962A9A0A
	for <lists+linux-leds@lfdr.de>; Fri,  6 Nov 2020 17:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727676AbgKFQ6r (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 6 Nov 2020 11:58:47 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:42924 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbgKFQ6q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 6 Nov 2020 11:58:46 -0500
Date:   Fri, 06 Nov 2020 16:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1604681914;
        bh=xsLf4nlDUCOrHrV/3/k0x1f+6hMboUUSPp1jdSsv+no=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=DUwb13uOJR9og0cykF/L+IpWlgwsipj1az9taG7IzIPY+3JWQi2i16lmGshdGoMew
         hGnkjYlKABniqvg6xeLjC6svCOMUXE0uO2AG+tTs6d2OxxfmUYhtD1I5Rw7M1dY0TT
         R0qbFHLEksBJ60mSDrjKp8QBs63pr3y9NqxeX3PU=
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
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org,
        andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: [RFC PATCH 1/3] leds: Add driver for QPNP flash led
Message-ID: <20201106165737.1029106-2-nfraprado@protonmail.com>
In-Reply-To: <20201106165737.1029106-1-nfraprado@protonmail.com>
References: <20201106165737.1029106-1-nfraprado@protonmail.com>
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

Add driver for the QPNP flash LED. It works over SPMI and is part of the
PM8941 PMIC.

Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---
 drivers/leds/Kconfig     |    9 +
 drivers/leds/Makefile    |    1 +
 drivers/leds/leds-qpnp.c | 1351 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 1361 insertions(+)
 create mode 100644 drivers/leds/leds-qpnp.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 849d3c5f908e..ca5f6e81c064 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -928,6 +928,15 @@ config LEDS_ACER_A500
 =09  This option enables support for the Power Button LED of
 =09  Acer Iconia Tab A500.
=20
+config LEDS_QPNP
+=09tristate "Support for QPNP LEDs"
+=09depends on SPMI
+=09help
+=09  This driver supports the flash/torch led of Qualcomm PNP PMIC.
+
+=09  To compile this driver as a module, choose M here: the module will
+=09  be called leds-qpnp.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
=20
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 73e603e1727e..055360240801 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -93,6 +93,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)=09=09+=3D leds-turris-omn=
ia.o
 obj-$(CONFIG_LEDS_WM831X_STATUS)=09+=3D leds-wm831x-status.o
 obj-$(CONFIG_LEDS_WM8350)=09=09+=3D leds-wm8350.o
 obj-$(CONFIG_LEDS_WRAP)=09=09=09+=3D leds-wrap.o
+obj-$(CONFIG_LEDS_QPNP)=09=09=09+=3D leds-qpnp.o
=20
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)=09=09+=3D leds-cr0014114.o
diff --git a/drivers/leds/leds-qpnp.c b/drivers/leds/leds-qpnp.c
new file mode 100644
index 000000000000..9970688264aa
--- /dev/null
+++ b/drivers/leds/leds-qpnp.c
@@ -0,0 +1,1351 @@
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/spmi.h>
+#include <linux/of_device.h>
+#include <linux/device.h>
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/mutex.h>
+#include <linux/sysfs.h>
+#include <linux/workqueue.h>
+#include <linux/leds.h>
+#include <linux/regulator/consumer.h>
+#include <linux/delay.h>
+#include <linux/regmap.h>
+
+#define FLASH_SAFETY_TIMER=090x40
+#define FLASH_MAX_CURR=09=090x41
+#define FLASH_LED_0_CURR=090x42
+#define FLASH_LED_1_CURR=090x43
+#define FLASH_CLAMP_CURR=090x44
+#define FLASH_LED_TMR_CTRL=090x48
+#define FLASH_HEADROOM=09=090x4A
+#define FLASH_STARTUP_DELAY=090x4B
+#define FLASH_MASK_ENABLE=090x4C
+#define FLASH_VREG_OK_FORCE=090x4F
+#define FLASH_ENABLE_CONTROL=090x46
+#define FLASH_LED_STROBE_CTRL=090x47
+#define FLASH_LED_UNLOCK_SECURE=090xD0
+#define FLASH_LED_TORCH=09=090xE4
+#define FLASH_FAULT_DETECT=090x51
+#define FLASH_RAMP_RATE=09=090x54
+#define FLASH_PERIPHERAL_SUBTYPE=090x05
+#define FLASH_VPH_PWR_DROOP=090x5A
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
+#define FLASH_CURRENT_PRGM_MIN=09=091
+#define FLASH_CURRENT_PRGM_SHIFT=091
+#define FLASH_CURRENT_MAX=09=090x4F
+#define FLASH_CURRENT_TORCH=09=090x07
+
+#define FLASH_DURATION_200ms=09=090x13
+#define FLASH_CLAMP_200mA=09=090x0F
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
+#define LED_TRIGGER_DEFAULT=09=09"none"
+
+/**
+ * enum qpnp_leds - QPNP supported led ids
+ * @QPNP_ID_WLED - White led backlight
+ */
+enum qpnp_leds {
+=09QPNP_ID_FLASH1_LED0 =3D 1,
+=09QPNP_ID_FLASH1_LED1,
+=09QPNP_ID_MAX,
+};
+
+enum flash_headroom {
+=09HEADROOM_250mV =3D 0,
+=09HEADROOM_300mV,
+=09HEADROOM_400mV,
+=09HEADROOM_500mV,
+};
+
+enum flash_startup_dly {
+=09DELAY_10us =3D 0,
+=09DELAY_32us,
+=09DELAY_64us,
+=09DELAY_128us,
+};
+
+static u8 flash_debug_regs[] =3D {
+=090x40, 0x41, 0x42, 0x43, 0x44, 0x48, 0x49, 0x4b, 0x4c,
+=090x4f, 0x46, 0x47,
+};
+
+/**
+ *  flash_config_data - flash configuration data
+ *  @current_prgm - current to be programmed, scaled by max level
+ *  @clamp_curr - clamp current to use
+ *  @headroom - headroom value to use
+ *  @duration - duration of the flash
+ *  @enable_module - enable address for particular flash
+ *  @trigger_flash - trigger flash
+ *  @startup_dly - startup delay for flash
+ *  @strobe_type - select between sw and hw strobe
+ *  @peripheral_subtype - module peripheral subtype
+ *  @current_addr - address to write for current
+ *  @second_addr - address of secondary flash to be written
+ *  @safety_timer - enable safety timer or watchdog timer
+ *  @torch_enable - enable flash LED torch mode
+ *  @flash_reg_get - flash regulator attached or not
+ *  @flash_on - flash status, on or off
+ *  @torch_on - torch status, on or off
+ *  @flash_boost_reg - boost regulator for flash
+ *  @torch_boost_reg - boost regulator for torch
+ */
+struct flash_config_data {
+=09u8=09current_prgm;
+=09u8=09clamp_curr;
+=09u8=09headroom;
+=09u8=09duration;
+=09u8=09enable_module;
+=09u8=09trigger_flash;
+=09u8=09startup_dly;
+=09u8=09strobe_type;
+=09u8=09peripheral_subtype;
+=09u16=09current_addr;
+=09u16=09second_addr;
+=09bool=09safety_timer;
+=09bool=09torch_enable;
+=09bool=09flash_reg_get;
+=09bool=09flash_on;
+=09bool=09torch_on;
+=09struct regulator *flash_boost_reg;
+=09struct regulator *torch_boost_reg;
+};
+
+/**
+ * struct qpnp_led_data - internal led data structure
+ * @led_classdev - led class device
+ * @delayed_work - delayed work for turning off the LED
+ * @work - workqueue for led
+ * @id - led index
+ * @base_reg - base register given in device tree
+ * @lock - to protect the transactions
+ * @reg - cached value of led register
+ * @num_leds - number of leds in the module
+ * @max_current - maximum current supported by LED
+ * @default_on - true: default state max, false, default state 0
+ * @turn_off_delay_ms - number of msec before turning off the LED
+ */
+struct qpnp_led_data {
+=09struct led_classdev=09cdev;
+=09struct regmap=09=09*regmap;
+=09struct device=09=09*dev;
+=09struct delayed_work=09dwork;
+=09struct work_struct=09work;
+=09int=09=09=09id;
+=09u16=09=09=09base;
+=09u8=09=09=09reg;
+=09u8=09=09=09num_leds;
+=09struct mutex=09=09lock;
+=09struct flash_config_data=09*flash_cfg;
+=09int=09=09=09max_current;
+=09bool=09=09=09default_on;
+=09int=09=09=09turn_off_delay_ms;
+};
+
+static int led_read_reg(struct qpnp_led_data *led, u16 offset, u8 *data)
+{
+=09unsigned int val;
+=09int ret;
+
+=09ret =3D regmap_read(led->regmap, led->base + offset, &val);
+=09if (ret < 0)
+=09=09return ret;
+
+=09*data =3D val;
+=09return 0;
+}
+
+static int led_write_reg(struct qpnp_led_data *led, u16 offset, u8 data)
+{
+=09return regmap_write(led->regmap, led->base + offset, data);
+}
+
+static void qpnp_dump_regs(struct qpnp_led_data *led, u8 regs[], u8 array_=
size)
+{
+=09int i;
+=09u8 val;
+
+=09pr_debug("=3D=3D=3D=3D=3D %s LED register dump start =3D=3D=3D=3D=3D\n"=
, led->cdev.name);
+=09for (i =3D 0; i < array_size; i++) {
+=09=09led_read_reg(led, regs[i], &val);
+=09=09pr_debug("%s: 0x%x =3D 0x%x\n", led->cdev.name,
+=09=09=09=09=09led->base + regs[i], val);
+=09}
+=09pr_debug("=3D=3D=3D=3D=3D %s LED register dump end =3D=3D=3D=3D=3D\n", =
led->cdev.name);
+}
+
+
+static int qpnp_get_common_configs(struct qpnp_led_data *led,
+=09=09=09=09struct device_node *node)
+{
+=09int rc;
+=09u32 val;
+=09const char *temp_string;
+
+=09led->cdev.default_trigger =3D LED_TRIGGER_DEFAULT;
+=09rc =3D of_property_read_string(node, "linux,default-trigger",
+=09=09&temp_string);
+=09if (!rc)
+=09=09led->cdev.default_trigger =3D temp_string;
+=09else if (rc !=3D -EINVAL)
+=09=09return rc;
+
+=09led->default_on =3D false;
+=09rc =3D of_property_read_string(node, "qcom,default-state",
+=09=09&temp_string);
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
+=09return 0;
+}
+
+static void qpnp_led_set(struct led_classdev *led_cdev,
+=09=09=09=09enum led_brightness value)
+{
+=09struct qpnp_led_data *led;
+
+=09led =3D container_of(led_cdev, struct qpnp_led_data, cdev);
+=09if (value < LED_OFF || value > led->cdev.max_brightness) {
+=09=09dev_err(led->dev, "Invalid brightness value\n");
+=09=09return;
+=09}
+
+=09led->cdev.brightness =3D value;
+=09schedule_work(&led->work);
+}
+
+static enum led_brightness qpnp_led_get(struct led_classdev *led_cdev)
+{
+=09struct qpnp_led_data *led;
+
+=09led =3D container_of(led_cdev, struct qpnp_led_data, cdev);
+
+=09return led->cdev.brightness;
+}
+
+static int qpnp_get_config_flash(struct qpnp_led_data *led,
+=09=09=09=09struct device_node *node, bool *reg_set)
+{
+=09int rc;
+=09u32 val;
+
+=09led->flash_cfg =3D devm_kzalloc(led->dev,
+=09=09=09=09sizeof(struct flash_config_data), GFP_KERNEL);
+=09if (!led->flash_cfg) {
+=09=09dev_err(led->dev, "Unable to allocate memory\n");
+=09=09return -ENOMEM;
+=09}
+
+=09rc =3D led_read_reg(led, FLASH_PERIPHERAL_SUBTYPE,
+=09=09=09&led->flash_cfg->peripheral_subtype);
+=09if (rc) {
+=09=09dev_err(led->dev,
+=09=09=09"Unable to read from addr=3D%x, rc(%d)\n",
+=09=09=09FLASH_PERIPHERAL_SUBTYPE, rc);
+=09}
+
+=09led->flash_cfg->torch_enable =3D
+=09=09of_property_read_bool(node, "qcom,torch-enable");
+
+=09if (led->id =3D=3D QPNP_ID_FLASH1_LED0) {
+=09=09led->flash_cfg->enable_module =3D FLASH_ENABLE_LED_0;
+=09=09led->flash_cfg->current_addr =3D FLASH_LED_0_CURR;
+=09=09led->flash_cfg->trigger_flash =3D FLASH_LED_0_OUTPUT;
+=09=09if (!*reg_set) {
+=09=09=09led->flash_cfg->flash_boost_reg =3D
+=09=09=09=09regulator_get(led->dev,
+=09=09=09=09=09=09=09"flash-boost");
+=09=09=09if (IS_ERR(led->flash_cfg->flash_boost_reg)) {
+=09=09=09=09rc =3D PTR_ERR(led->flash_cfg->flash_boost_reg);
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Regulator get failed(%d)\n", rc);
+=09=09=09=09goto error_get_flash_reg;
+=09=09=09}
+=09=09=09led->flash_cfg->flash_reg_get =3D true;
+=09=09=09*reg_set =3D true;
+=09=09} else
+=09=09=09led->flash_cfg->flash_reg_get =3D false;
+
+=09=09if (led->flash_cfg->torch_enable) {
+=09=09=09led->flash_cfg->second_addr =3D
+=09=09=09=09=09=09FLASH_LED_1_CURR;
+=09=09}
+=09} else if (led->id =3D=3D QPNP_ID_FLASH1_LED1) {
+=09=09led->flash_cfg->enable_module =3D FLASH_ENABLE_LED_1;
+=09=09led->flash_cfg->current_addr =3D FLASH_LED_1_CURR;
+=09=09led->flash_cfg->trigger_flash =3D FLASH_LED_1_OUTPUT;
+=09=09if (!*reg_set) {
+=09=09=09led->flash_cfg->flash_boost_reg =3D
+=09=09=09=09=09regulator_get(led->dev,
+=09=09=09=09=09=09=09=09"flash-boost");
+=09=09=09if (IS_ERR(led->flash_cfg->flash_boost_reg)) {
+=09=09=09=09rc =3D PTR_ERR(led->flash_cfg->flash_boost_reg);
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Regulator get failed(%d)\n", rc);
+=09=09=09=09goto error_get_flash_reg;
+=09=09=09}
+=09=09=09led->flash_cfg->flash_reg_get =3D true;
+=09=09=09*reg_set =3D true;
+=09=09} else
+=09=09=09led->flash_cfg->flash_reg_get =3D false;
+
+=09=09if (led->flash_cfg->torch_enable) {
+=09=09=09led->flash_cfg->second_addr =3D
+=09=09=09=09=09=09FLASH_LED_0_CURR;
+=09=09}
+=09} else {
+=09=09dev_err(led->dev, "Unknown flash LED name given\n");
+=09=09return -EINVAL;
+=09}
+
+=09if (led->flash_cfg->torch_enable) {
+=09=09if (of_find_property(of_get_parent(node), "torch-boost-supply",
+=09=09=09=09=09=09=09=09=09NULL)) {
+=09=09=09led->flash_cfg->torch_boost_reg =3D
+=09=09=09=09regulator_get(led->dev,
+=09=09=09=09=09=09=09=09"torch-boost");
+=09=09=09if (IS_ERR(led->flash_cfg->torch_boost_reg)) {
+=09=09=09=09rc =3D PTR_ERR(led->flash_cfg->torch_boost_reg);
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Torch regulator get failed(%d)\n", rc);
+=09=09=09=09goto error_get_torch_reg;
+=09=09=09}
+=09=09=09led->flash_cfg->enable_module =3D FLASH_ENABLE_MODULE;
+=09=09} else
+=09=09=09led->flash_cfg->enable_module =3D FLASH_ENABLE_ALL;
+=09=09led->flash_cfg->trigger_flash =3D FLASH_STROBE_SW;
+=09}
+
+=09rc =3D of_property_read_u32(node, "qcom,current", &val);
+=09if (!rc) {
+=09=09if (led->flash_cfg->torch_enable) {
+=09=09=09led->flash_cfg->current_prgm =3D (val *
+=09=09=09=09TORCH_MAX_LEVEL / led->max_current);
+=09=09=09return 0;
+=09=09}
+=09=09else
+=09=09=09led->flash_cfg->current_prgm =3D (val *
+=09=09=09=09FLASH_MAX_LEVEL / led->max_current);
+=09} else
+=09=09if (led->flash_cfg->torch_enable)
+=09=09=09goto error_get_torch_reg;
+=09=09else
+=09=09=09goto error_get_flash_reg;
+
+=09rc =3D of_property_read_u32(node, "qcom,headroom", &val);
+=09if (!rc)
+=09=09led->flash_cfg->headroom =3D (u8) val;
+=09else if (rc =3D=3D -EINVAL)
+=09=09led->flash_cfg->headroom =3D HEADROOM_500mV;
+=09else
+=09=09goto error_get_flash_reg;
+
+=09rc =3D of_property_read_u32(node, "qcom,duration", &val);
+=09if (!rc)
+=09=09led->flash_cfg->duration =3D (((u8) val) - 10) / 10;
+=09else if (rc =3D=3D -EINVAL)
+=09=09led->flash_cfg->duration =3D FLASH_DURATION_200ms;
+=09else
+=09=09goto error_get_flash_reg;
+
+=09rc =3D of_property_read_u32(node, "qcom,clamp-curr", &val);
+=09if (!rc)
+=09=09led->flash_cfg->clamp_curr =3D (val *
+=09=09=09=09FLASH_MAX_LEVEL / led->max_current);
+=09else if (rc =3D=3D -EINVAL)
+=09=09led->flash_cfg->clamp_curr =3D FLASH_CLAMP_200mA;
+=09else
+=09=09goto error_get_flash_reg;
+
+=09rc =3D of_property_read_u32(node, "qcom,startup-dly", &val);
+=09if (!rc)
+=09=09led->flash_cfg->startup_dly =3D (u8) val;
+=09else if (rc =3D=3D -EINVAL)
+=09=09led->flash_cfg->startup_dly =3D DELAY_128us;
+=09else
+=09=09goto error_get_flash_reg;
+
+=09led->flash_cfg->safety_timer =3D
+=09=09of_property_read_bool(node, "qcom,safety-timer");
+
+=09return 0;
+
+error_get_torch_reg:
+=09regulator_put(led->flash_cfg->torch_boost_reg);
+
+error_get_flash_reg:
+=09regulator_put(led->flash_cfg->flash_boost_reg);
+=09return rc;
+
+}
+
+static ssize_t led_mode_store(struct device *dev,
+=09=09=09struct device_attribute *attr,
+=09=09=09const char *buf, size_t count)
+{
+=09struct qpnp_led_data *led;
+=09unsigned long state;
+=09struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+=09ssize_t ret =3D -EINVAL;
+
+=09ret =3D kstrtoul(buf, 10, &state);
+=09if (ret)
+=09=09return ret;
+
+=09led =3D container_of(led_cdev, struct qpnp_led_data, cdev);
+
+=09/* '1' to enable torch mode; '0' to switch to flash mode */
+=09if (state =3D=3D 1)
+=09=09led->flash_cfg->torch_enable =3D true;
+=09else
+=09=09led->flash_cfg->torch_enable =3D false;
+
+=09return count;
+}
+
+static ssize_t led_strobe_type_store(struct device *dev,
+=09=09=09struct device_attribute *attr,
+=09=09=09const char *buf, size_t count)
+{
+=09struct qpnp_led_data *led;
+=09unsigned long state;
+=09struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+=09ssize_t ret =3D -EINVAL;
+
+=09ret =3D kstrtoul(buf, 10, &state);
+=09if (ret)
+=09=09return ret;
+
+=09led =3D container_of(led_cdev, struct qpnp_led_data, cdev);
+
+=09/* '0' for sw strobe; '1' for hw strobe */
+=09if (state =3D=3D 1)
+=09=09led->flash_cfg->strobe_type =3D 1;
+=09else
+=09=09led->flash_cfg->strobe_type =3D 0;
+
+=09return count;
+}
+
+static DEVICE_ATTR(led_mode, 0664, NULL, led_mode_store);
+static DEVICE_ATTR(strobe, 0664, NULL, led_strobe_type_store);
+
+static struct attribute *led_attrs[] =3D {
+=09&dev_attr_led_mode.attr,
+=09&dev_attr_strobe.attr,
+=09NULL
+};
+
+static const struct attribute_group led_attr_group =3D {
+=09.attrs =3D led_attrs,
+};
+
+static int qpnp_led_set_max_brightness(struct qpnp_led_data *led)
+{
+=09switch (led->id) {
+=09case QPNP_ID_FLASH1_LED0:
+=09case QPNP_ID_FLASH1_LED1:
+=09=09led->cdev.max_brightness =3D led->max_current;
+=09=09break;
+=09default:
+=09=09dev_err(led->dev, "Invalid LED(%d)\n", led->id);
+=09=09return -EINVAL;
+=09}
+
+=09return 0;
+}
+
+static int
+qpnp_led_masked_write(struct qpnp_led_data *led, u16 addr, u8 mask, u8 val=
)
+{
+=09int rc;
+=09u8 reg;
+
+=09rc =3D led_read_reg(led, addr, &reg);
+=09if (rc) {
+=09=09dev_err(led->dev,
+=09=09=09"Unable to read from addr=3D%x, rc(%d)\n", addr, rc);
+=09}
+
+=09reg &=3D ~mask;
+=09reg |=3D val;
+
+=09rc =3D led_write_reg(led, addr, reg);
+=09if (rc)
+=09=09dev_err(led->dev,
+=09=09=09"Unable to write to addr=3D%x, rc(%d)\n", addr, rc);
+=09return rc;
+}
+
+static int qpnp_flash_init(struct qpnp_led_data *led)
+{
+=09int rc;
+
+=09led->flash_cfg->flash_on =3D false;
+
+=09rc =3D qpnp_led_masked_write(led,
+=09=09FLASH_LED_STROBE_CTRL,
+=09=09FLASH_STROBE_MASK, FLASH_DISABLE_ALL);
+=09if (rc) {
+=09=09dev_err(led->dev,
+=09=09=09"LED %d flash write failed(%d)\n", led->id, rc);
+=09=09return rc;
+=09}
+
+=09/* Disable flash LED module */
+=09rc =3D qpnp_led_masked_write(led, FLASH_ENABLE_CONTROL,
+=09=09FLASH_ENABLE_MODULE_MASK, FLASH_DISABLE_ALL);
+=09if (rc) {
+=09=09dev_err(led->dev,
+=09=09=09"Enable reg write failed(%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09if (led->flash_cfg->torch_enable)
+=09=09return 0;
+
+=09/* Set headroom */
+=09rc =3D qpnp_led_masked_write(led, FLASH_HEADROOM,
+=09=09FLASH_HEADROOM_MASK, led->flash_cfg->headroom);
+=09if (rc) {
+=09=09dev_err(led->dev,
+=09=09=09"Headroom reg write failed(%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09/* Set startup delay */
+=09rc =3D qpnp_led_masked_write(led,
+=09=09FLASH_STARTUP_DELAY, FLASH_STARTUP_DLY_MASK,
+=09=09led->flash_cfg->startup_dly);
+=09if (rc) {
+=09=09dev_err(led->dev,
+=09=09=09"Startup delay reg write failed(%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09/* Set timer control - safety or watchdog */
+=09if (led->flash_cfg->safety_timer) {
+=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09FLASH_LED_TMR_CTRL,
+=09=09=09FLASH_TMR_MASK, FLASH_TMR_SAFETY);
+=09=09if (rc) {
+=09=09=09dev_err(led->dev,
+=09=09=09=09"LED timer ctrl reg write failed(%d)\n",
+=09=09=09=09rc);
+=09=09=09return rc;
+=09=09}
+=09}
+
+=09/* Set Vreg force */
+=09rc =3D qpnp_led_masked_write(led,=09FLASH_VREG_OK_FORCE,
+=09=09FLASH_VREG_MASK, FLASH_HW_VREG_OK);
+=09if (rc) {
+=09=09dev_err(led->dev,
+=09=09=09"Vreg OK reg write failed(%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09/* Set self fault check */
+=09rc =3D qpnp_led_masked_write(led, FLASH_FAULT_DETECT,
+=09=09FLASH_FAULT_DETECT_MASK, FLASH_SELFCHECK_DISABLE);
+=09if (rc) {
+=09=09dev_err(led->dev,
+=09=09=09"Fault detect reg write failed(%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09/* Set mask enable */
+=09rc =3D qpnp_led_masked_write(led, FLASH_MASK_ENABLE,
+=09=09FLASH_MASK_REG_MASK, FLASH_MASK_1);
+=09if (rc) {
+=09=09dev_err(led->dev,
+=09=09=09"Mask enable reg write failed(%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09/* Set ramp rate */
+=09rc =3D qpnp_led_masked_write(led, FLASH_RAMP_RATE,
+=09=09FLASH_RAMP_RATE_MASK, 0xBF);
+=09if (rc) {
+=09=09dev_err(led->dev,
+=09=09=09"Ramp rate reg write failed(%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09/* Enable VPH_PWR_DROOP and set threshold to 2.9V */
+=09rc =3D qpnp_led_masked_write(led, FLASH_VPH_PWR_DROOP,
+=09=09=09=09=09FLASH_VPH_PWR_DROOP_MASK, 0xC2);
+=09if (rc) {
+=09=09dev_err(led->dev,
+=09=09=09"FLASH_VPH_PWR_DROOP reg write failed(%d)\n", rc);
+=09=09return rc;
+=09}
+
+=09led->flash_cfg->strobe_type =3D 0;
+
+=09/* dump flash registers */
+=09qpnp_dump_regs(led, flash_debug_regs, ARRAY_SIZE(flash_debug_regs));
+
+=09return 0;
+}
+
+static int qpnp_led_initialize(struct qpnp_led_data *led)
+{
+=09int rc =3D 0;
+
+=09switch (led->id) {
+=09case QPNP_ID_FLASH1_LED0:
+=09case QPNP_ID_FLASH1_LED1:
+=09=09rc =3D qpnp_flash_init(led);
+=09=09if (rc)
+=09=09=09dev_err(led->dev,
+=09=09=09=09"FLASH initialize failed(%d)\n", rc);
+=09=09break;
+=09default:
+=09=09dev_err(led->dev, "Invalid LED(%d)\n", led->id);
+=09=09return -EINVAL;
+=09}
+
+=09return rc;
+}
+
+static int qpnp_flash_regulator_operate(struct qpnp_led_data *led, bool on=
)
+{
+=09int rc, i;
+=09struct qpnp_led_data *led_array;
+=09bool regulator_on =3D false;
+
+=09led_array =3D dev_get_drvdata(led->dev);
+=09if (!led_array) {
+=09=09dev_err(led->dev,
+=09=09=09=09"Unable to get LED array\n");
+=09=09return -EINVAL;
+=09}
+
+=09for (i =3D 0; i < led->num_leds; i++)
+=09=09regulator_on |=3D led_array[i].flash_cfg->flash_on;
+
+=09if (!on)
+=09=09goto regulator_turn_off;
+
+=09if (!regulator_on && !led->flash_cfg->flash_on) {
+=09=09for (i =3D 0; i < led->num_leds; i++) {
+=09=09=09if (led_array[i].flash_cfg->flash_reg_get) {
+=09=09=09=09rc =3D regulator_enable(
+=09=09=09=09=09led_array[i].flash_cfg->\
+=09=09=09=09=09flash_boost_reg);
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09=09"Regulator enable failed(%d)\n",
+=09=09=09=09=09=09=09=09=09rc);
+=09=09=09=09=09return rc;
+=09=09=09=09}
+=09=09=09=09led->flash_cfg->flash_on =3D true;
+=09=09=09}
+=09=09=09break;
+=09=09}
+=09}
+
+=09return 0;
+
+regulator_turn_off:
+=09if (regulator_on && led->flash_cfg->flash_on) {
+=09=09for (i =3D 0; i < led->num_leds; i++) {
+=09=09=09if (led_array[i].flash_cfg->flash_reg_get) {
+=09=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09=09FLASH_ENABLE_CONTROL,
+=09=09=09=09=09FLASH_ENABLE_MASK,
+=09=09=09=09=09FLASH_DISABLE_ALL);
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09=09"Enable reg write failed(%d)\n",
+=09=09=09=09=09=09rc);
+=09=09=09=09}
+
+=09=09=09=09rc =3D regulator_disable(led_array[i].flash_cfg->\
+=09=09=09=09=09=09=09flash_boost_reg);
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09=09"Regulator disable failed(%d)\n",
+=09=09=09=09=09=09=09=09=09rc);
+=09=09=09=09=09return rc;
+=09=09=09=09}
+=09=09=09=09led->flash_cfg->flash_on =3D false;
+=09=09=09}
+=09=09=09break;
+=09=09}
+=09}
+
+=09return 0;
+}
+
+static int qpnp_torch_regulator_operate(struct qpnp_led_data *led, bool on=
)
+{
+=09int rc;
+
+=09if (!on)
+=09=09goto regulator_turn_off;
+
+=09if (!led->flash_cfg->torch_on) {
+=09=09rc =3D regulator_enable(led->flash_cfg->torch_boost_reg);
+=09=09if (rc) {
+=09=09=09dev_err(led->dev,
+=09=09=09=09"Regulator enable failed(%d)\n", rc);
+=09=09=09=09return rc;
+=09=09}
+=09=09led->flash_cfg->torch_on =3D true;
+=09}
+=09return 0;
+
+regulator_turn_off:
+=09if (led->flash_cfg->torch_on) {
+=09=09rc =3D qpnp_led_masked_write(led,=09FLASH_ENABLE_CONTROL,
+=09=09=09=09FLASH_ENABLE_MODULE_MASK, FLASH_DISABLE_ALL);
+=09=09if (rc) {
+=09=09=09dev_err(led->dev,
+=09=09=09=09"Enable reg write failed(%d)\n", rc);
+=09=09}
+
+=09=09rc =3D regulator_disable(led->flash_cfg->torch_boost_reg);
+=09=09if (rc) {
+=09=09=09dev_err(led->dev,
+=09=09=09=09"Regulator disable failed(%d)\n", rc);
+=09=09=09return rc;
+=09=09}
+=09=09led->flash_cfg->torch_on =3D false;
+=09}
+=09return 0;
+}
+
+static int qpnp_flash_set(struct qpnp_led_data *led)
+{
+=09int rc, error;
+=09int val =3D led->cdev.brightness;
+
+=09if (led->flash_cfg->torch_enable)
+=09=09led->flash_cfg->current_prgm =3D
+=09=09=09(val * TORCH_MAX_LEVEL / led->max_current);
+=09else
+=09=09led->flash_cfg->current_prgm =3D
+=09=09=09(val * FLASH_MAX_LEVEL / led->max_current);
+
+=09/* Set led current */
+=09if (val > 0) {
+=09=09if (led->flash_cfg->torch_enable) {
+=09=09=09if (led->flash_cfg->peripheral_subtype =3D=3D
+=09=09=09=09=09=09=09FLASH_SUBTYPE_DUAL) {
+=09=09=09=09rc =3D qpnp_torch_regulator_operate(led, true);
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Torch regulator operate failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09=09return rc;
+=09=09=09=09}
+=09=09=09} else if (led->flash_cfg->peripheral_subtype =3D=3D
+=09=09=09=09=09=09=09FLASH_SUBTYPE_SINGLE) {
+=09=09=09=09rc =3D qpnp_flash_regulator_operate(led, true);
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(led->dev,
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
+=09=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09=09FLASH_ENABLE_CONTROL,
+=09=09=09=09=09FLASH_ENABLE_MODULE_MASK,
+=09=09=09=09=09FLASH_ENABLE_MODULE);
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09=09"Enable reg write failed(%d)\n",
+=09=09=09=09=09=09rc);
+=09=09=09=09=09return rc;
+=09=09=09=09}
+=09=09=09}
+
+=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09FLASH_LED_UNLOCK_SECURE,
+=09=09=09=09FLASH_SECURE_MASK, FLASH_UNLOCK_SECURE);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Secure reg write failed(%d)\n", rc);
+=09=09=09=09goto error_reg_write;
+=09=09=09}
+
+=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09FLASH_LED_TORCH,
+=09=09=09=09FLASH_TORCH_MASK, FLASH_LED_TORCH_ENABLE);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Torch reg write failed(%d)\n", rc);
+=09=09=09=09goto error_reg_write;
+=09=09=09}
+
+=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09led->flash_cfg->current_addr,
+=09=09=09=09FLASH_CURRENT_MASK,
+=09=09=09=09led->flash_cfg->current_prgm);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Current reg write failed(%d)\n", rc);
+=09=09=09=09goto error_reg_write;
+=09=09=09}
+
+=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09led->flash_cfg->second_addr,
+=09=09=09=09FLASH_CURRENT_MASK,
+=09=09=09=09led->flash_cfg->current_prgm);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"2nd Current reg write failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09goto error_reg_write;
+=09=09=09}
+
+=09=09=09qpnp_led_masked_write(led, FLASH_MAX_CURR,
+=09=09=09=09FLASH_CURRENT_MASK,
+=09=09=09=09TORCH_MAX_LEVEL);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Max current reg write failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09goto error_reg_write;
+=09=09=09}
+
+=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09FLASH_ENABLE_CONTROL,
+=09=09=09=09FLASH_ENABLE_MASK,
+=09=09=09=09led->flash_cfg->enable_module);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Enable reg write failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09goto error_reg_write;
+=09=09=09}
+
+=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09FLASH_LED_STROBE_CTRL,
+=09=09=09=09led->flash_cfg->trigger_flash,
+=09=09=09=09led->flash_cfg->trigger_flash);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"LED %d strobe reg write failed(%d)\n",
+=09=09=09=09=09led->id, rc);
+=09=09=09=09goto error_reg_write;
+=09=09=09}
+=09=09} else {
+=09=09=09rc =3D qpnp_flash_regulator_operate(led, true);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Flash regulator operate failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09goto error_flash_set;
+=09=09=09}
+
+=09=09=09/* Set flash safety timer */
+=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09FLASH_SAFETY_TIMER,
+=09=09=09=09FLASH_SAFETY_TIMER_MASK,
+=09=09=09=09led->flash_cfg->duration);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Safety timer reg write failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09goto error_flash_set;
+=09=09=09}
+
+=09=09=09/* Set max current */
+=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09FLASH_MAX_CURR, FLASH_CURRENT_MASK,
+=09=09=09=09FLASH_MAX_LEVEL);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Max current reg write failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09goto error_flash_set;
+=09=09=09}
+
+=09=09=09/* Set clamp current */
+=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09FLASH_CLAMP_CURR,
+=09=09=09=09FLASH_CURRENT_MASK,
+=09=09=09=09led->flash_cfg->clamp_curr);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Clamp current reg write failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09goto error_flash_set;
+=09=09=09}
+
+=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09led->flash_cfg->current_addr,
+=09=09=09=09FLASH_CURRENT_MASK,
+=09=09=09=09led->flash_cfg->current_prgm);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Current reg write failed(%d)\n", rc);
+=09=09=09=09goto error_flash_set;
+=09=09=09}
+
+=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09FLASH_ENABLE_CONTROL,
+=09=09=09=09led->flash_cfg->enable_module,
+=09=09=09=09led->flash_cfg->enable_module);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Enable reg write failed(%d)\n", rc);
+=09=09=09=09goto error_flash_set;
+=09=09=09}
+
+=09=09=09/* TODO try to not busy wait*/
+=09=09=09mdelay(1);
+
+=09=09=09if (!led->flash_cfg->strobe_type) {
+=09=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09=09FLASH_LED_STROBE_CTRL,
+=09=09=09=09=09led->flash_cfg->trigger_flash,
+=09=09=09=09=09led->flash_cfg->trigger_flash);
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"LED %d strobe reg write failed(%d)\n",
+=09=09=09=09=09led->id, rc);
+=09=09=09=09=09goto error_flash_set;
+=09=09=09=09}
+=09=09=09} else {
+=09=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09=09FLASH_LED_STROBE_CTRL,
+=09=09=09=09=09(led->flash_cfg->trigger_flash |
+=09=09=09=09=09FLASH_STROBE_HW),
+=09=09=09=09=09(led->flash_cfg->trigger_flash |
+=09=09=09=09=09FLASH_STROBE_HW));
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"LED %d strobe reg write failed(%d)\n",
+=09=09=09=09=09led->id, rc);
+=09=09=09=09=09goto error_flash_set;
+=09=09=09=09}
+=09=09=09}
+=09=09}
+=09} else {
+=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09FLASH_LED_STROBE_CTRL,
+=09=09=09led->flash_cfg->trigger_flash,
+=09=09=09FLASH_DISABLE_ALL);
+=09=09if (rc) {
+=09=09=09dev_err(led->dev,
+=09=09=09=09"LED %d flash write failed(%d)\n", led->id, rc);
+=09=09=09if (led->flash_cfg->torch_enable)
+=09=09=09=09goto error_torch_set;
+=09=09=09else
+=09=09=09=09goto error_flash_set;
+=09=09}
+
+=09=09/* TODO try to not busy wait*/
+=09=09mdelay(2);
+=09=09udelay(160);
+
+=09=09if (led->flash_cfg->torch_enable) {
+=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09FLASH_LED_UNLOCK_SECURE,
+=09=09=09=09FLASH_SECURE_MASK, FLASH_UNLOCK_SECURE);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Secure reg write failed(%d)\n", rc);
+=09=09=09=09goto error_torch_set;
+=09=09=09}
+
+=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09=09FLASH_LED_TORCH,
+=09=09=09=09=09FLASH_TORCH_MASK,
+=09=09=09=09=09FLASH_LED_TORCH_DISABLE);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Torch reg write failed(%d)\n", rc);
+=09=09=09=09goto error_torch_set;
+=09=09=09}
+
+=09=09=09if (led->flash_cfg->peripheral_subtype =3D=3D
+=09=09=09=09=09=09=09FLASH_SUBTYPE_DUAL) {
+=09=09=09=09rc =3D qpnp_torch_regulator_operate(led, false);
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09=09"Torch regulator operate failed(%d)\n",
+=09=09=09=09=09=09rc);
+=09=09=09=09=09return rc;
+=09=09=09=09}
+=09=09=09} else if (led->flash_cfg->peripheral_subtype =3D=3D
+=09=09=09=09=09=09=09FLASH_SUBTYPE_SINGLE) {
+=09=09=09=09rc =3D qpnp_flash_regulator_operate(led, false);
+=09=09=09=09if (rc) {
+=09=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09=09"Flash regulator operate failed(%d)\n",
+=09=09=09=09=09=09rc);
+=09=09=09=09=09return rc;
+=09=09=09=09}
+=09=09=09}
+=09=09} else {
+=09=09=09rc =3D qpnp_led_masked_write(led,
+=09=09=09=09FLASH_ENABLE_CONTROL,
+=09=09=09=09led->flash_cfg->enable_module &
+=09=09=09=09~FLASH_ENABLE_MODULE_MASK,
+=09=09=09=09FLASH_DISABLE_ALL);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Enable reg write failed(%d)\n", rc);
+=09=09=09=09if (led->flash_cfg->torch_enable)
+=09=09=09=09=09goto error_torch_set;
+=09=09=09=09else
+=09=09=09=09=09goto error_flash_set;
+=09=09=09}
+
+=09=09=09rc =3D qpnp_flash_regulator_operate(led, false);
+=09=09=09if (rc) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Flash regulator operate failed(%d)\n",
+=09=09=09=09=09rc);
+=09=09=09=09return rc;
+=09=09=09}
+=09=09}
+=09}
+
+=09qpnp_dump_regs(led, flash_debug_regs, ARRAY_SIZE(flash_debug_regs));
+
+=09return 0;
+
+error_reg_write:
+=09if (led->flash_cfg->peripheral_subtype =3D=3D FLASH_SUBTYPE_SINGLE)
+=09=09goto error_flash_set;
+
+error_torch_set:
+=09error =3D qpnp_torch_regulator_operate(led, false);
+=09if (error) {
+=09=09dev_err(led->dev,
+=09=09=09"Torch regulator operate failed(%d)\n", rc);
+=09=09return error;
+=09}
+=09return rc;
+
+error_flash_set:
+=09error =3D qpnp_flash_regulator_operate(led, false);
+=09if (error) {
+=09=09dev_err(led->dev,
+=09=09=09"Flash regulator operate failed(%d)\n", rc);
+=09=09return error;
+=09}
+=09return rc;
+}
+
+static void __qpnp_led_work(struct qpnp_led_data *led,
+=09=09=09=09enum led_brightness value)
+{
+=09int rc;
+
+=09mutex_lock(&led->lock);
+
+=09switch (led->id) {
+=09case QPNP_ID_FLASH1_LED0:
+=09case QPNP_ID_FLASH1_LED1:
+=09=09rc =3D qpnp_flash_set(led);
+=09=09if (rc < 0)
+=09=09=09dev_err(led->dev,
+=09=09=09=09"FLASH set brightness failed (%d)\n", rc);
+=09=09break;
+=09default:
+=09=09dev_err(led->dev, "Invalid LED(%d)\n", led->id);
+=09=09break;
+=09}
+=09mutex_unlock(&led->lock);
+
+}
+
+static void qpnp_led_work(struct work_struct *work)
+{
+=09struct qpnp_led_data *led =3D container_of(work,
+=09=09=09=09=09struct qpnp_led_data, work);
+
+=09__qpnp_led_work(led, led->cdev.brightness);
+
+=09return;
+}
+
+static void qpnp_led_turn_off_delayed(struct work_struct *work)
+{
+=09struct delayed_work *dwork =3D to_delayed_work(work);
+=09struct qpnp_led_data *led
+=09=09=3D container_of(dwork, struct qpnp_led_data, dwork);
+
+=09led->cdev.brightness =3D LED_OFF;
+=09qpnp_led_set(&led->cdev, led->cdev.brightness);
+}
+
+static void qpnp_led_turn_off(struct qpnp_led_data *led)
+{
+=09INIT_DELAYED_WORK(&led->dwork, qpnp_led_turn_off_delayed);
+=09schedule_delayed_work(&led->dwork,
+=09=09msecs_to_jiffies(led->turn_off_delay_ms));
+}
+
+static int qpnp_leds_probe(struct platform_device *pdev)
+{
+=09struct qpnp_led_data *led, *led_array;
+=09struct device_node *node, *temp;
+=09int rc, i, num_leds =3D 0, parsed_leds =3D 0;
+=09int reg;
+=09const char *led_label;
+=09bool regulator_probe =3D false;
+
+=09node =3D pdev->dev.of_node;
+=09if (node =3D=3D NULL)
+=09=09return -ENODEV;
+
+=09temp =3D NULL;
+=09while ((temp =3D of_get_next_child(node, temp)))
+=09=09num_leds++;
+
+=09if (!num_leds)
+=09=09return -ECHILD;
+
+=09led_array =3D devm_kzalloc(&pdev->dev,
+=09=09(sizeof(struct qpnp_led_data) * num_leds), GFP_KERNEL);
+=09if (!led_array) {
+=09=09dev_err(&pdev->dev, "Unable to allocate memory\n");
+=09=09return -ENOMEM;
+=09}
+
+=09for_each_child_of_node(node, temp) {
+=09=09led =3D &led_array[parsed_leds];
+=09=09led->num_leds =3D num_leds;
+=09=09led->dev =3D &pdev->dev;
+=09=09led->regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
+=09=09if (!led->regmap)
+=09=09=09return -ENODEV;
+
+=09=09rc =3D of_property_read_u32(node, "reg", &reg);
+=09=09if (rc < 0) {
+=09=09=09dev_err(led->dev,
+=09=09=09=09"Failure reading reg, rc =3D %d\n", rc);
+=09=09=09goto fail_id_check;
+=09=09}
+=09=09led->base =3D reg;
+
+=09=09rc =3D of_property_read_string(temp, "label", &led_label);
+=09=09if (rc < 0) {
+=09=09=09dev_err(led->dev,
+=09=09=09=09"Failure reading label, rc =3D %d\n", rc);
+=09=09=09goto fail_id_check;
+=09=09}
+
+=09=09rc =3D of_property_read_string(temp, "linux,name",
+=09=09=09&led->cdev.name);
+=09=09if (rc < 0) {
+=09=09=09dev_err(led->dev,
+=09=09=09=09"Failure reading led name, rc =3D %d\n", rc);
+=09=09=09goto fail_id_check;
+=09=09}
+
+=09=09rc =3D of_property_read_u32(temp, "qcom,max-current",
+=09=09=09&led->max_current);
+=09=09if (rc < 0) {
+=09=09=09dev_err(led->dev,
+=09=09=09=09"Failure reading max_current, rc =3D  %d\n", rc);
+=09=09=09goto fail_id_check;
+=09=09}
+
+=09=09rc =3D of_property_read_u32(temp, "qcom,id", &led->id);
+=09=09if (rc < 0) {
+=09=09=09dev_err(led->dev,
+=09=09=09=09"Failure reading led id, rc =3D  %d\n", rc);
+=09=09=09goto fail_id_check;
+=09=09}
+
+=09=09rc =3D qpnp_get_common_configs(led, temp);
+=09=09if (rc) {
+=09=09=09dev_err(led->dev,
+=09=09=09=09"Failure reading common led configuration," \
+=09=09=09=09" rc =3D %d\n", rc);
+=09=09=09goto fail_id_check;
+=09=09}
+
+=09=09led->cdev.brightness_set    =3D qpnp_led_set;
+=09=09led->cdev.brightness_get    =3D qpnp_led_get;
+
+=09=09if (strncmp(led_label, "flash", sizeof("flash")) =3D=3D 0) {
+=09=09=09if (!of_find_property(node, "flash-boost-supply", NULL))
+=09=09=09=09regulator_probe =3D true;
+=09=09=09rc =3D qpnp_get_config_flash(led, temp, &regulator_probe);
+=09=09=09if (rc < 0) {
+=09=09=09=09dev_err(led->dev,
+=09=09=09=09=09"Unable to read flash config data\n");
+=09=09=09=09goto fail_id_check;
+=09=09=09}
+=09=09} else {
+=09=09=09dev_err(led->dev, "No LED matching label\n");
+=09=09=09rc =3D -EINVAL;
+=09=09=09goto fail_id_check;
+=09=09}
+
+=09=09mutex_init(&led->lock);
+=09=09INIT_WORK(&led->work, qpnp_led_work);
+
+=09=09rc =3D  qpnp_led_initialize(led);
+=09=09if (rc < 0)
+=09=09=09goto fail_id_check;
+
+=09=09rc =3D qpnp_led_set_max_brightness(led);
+=09=09if (rc < 0)
+=09=09=09goto fail_id_check;
+
+=09=09rc =3D led_classdev_register(&pdev->dev, &led->cdev);
+=09=09if (rc) {
+=09=09=09dev_err(&pdev->dev, "unable to register led %d,rc=3D%d\n",
+=09=09=09=09=09=09 led->id, rc);
+=09=09=09goto fail_id_check;
+=09=09}
+
+=09=09if (led->id =3D=3D QPNP_ID_FLASH1_LED0 ||
+=09=09=09led->id =3D=3D QPNP_ID_FLASH1_LED1) {
+=09=09=09rc =3D sysfs_create_group(&led->cdev.dev->kobj,
+=09=09=09=09=09=09=09&led_attr_group);
+=09=09=09if (rc)
+=09=09=09=09goto fail_id_check;
+
+=09=09}
+
+=09=09/* configure default state */
+=09=09if (led->default_on) {
+=09=09=09led->cdev.brightness =3D led->cdev.max_brightness;
+=09=09=09__qpnp_led_work(led, led->cdev.brightness);
+=09=09=09schedule_work(&led->work);
+=09=09=09if (led->turn_off_delay_ms > 0)
+=09=09=09=09qpnp_led_turn_off(led);
+=09=09} else
+=09=09=09led->cdev.brightness =3D LED_OFF;
+
+=09=09parsed_leds++;
+=09}
+=09dev_set_drvdata(&pdev->dev, led_array);
+=09return 0;
+
+fail_id_check:
+=09for (i =3D 0; i < parsed_leds; i++) {
+=09=09mutex_destroy(&led_array[i].lock);
+=09=09led_classdev_unregister(&led_array[i].cdev);
+=09}
+
+=09return rc;
+}
+
+static int qpnp_leds_remove(struct platform_device *pdev)
+{
+=09struct qpnp_led_data *led_array  =3D dev_get_drvdata(&pdev->dev);
+=09int i, parsed_leds =3D led_array->num_leds;
+
+=09for (i =3D 0; i < parsed_leds; i++) {
+=09=09cancel_work_sync(&led_array[i].work);
+=09=09mutex_destroy(&led_array[i].lock);
+=09=09led_classdev_unregister(&led_array[i].cdev);
+=09=09switch (led_array[i].id) {
+=09=09case QPNP_ID_FLASH1_LED0:
+=09=09case QPNP_ID_FLASH1_LED1:
+=09=09=09if (led_array[i].flash_cfg->flash_reg_get)
+=09=09=09=09regulator_put(led_array[i].flash_cfg-> \
+=09=09=09=09=09=09=09flash_boost_reg);
+=09=09=09if (led_array[i].flash_cfg->torch_enable)
+=09=09=09=09regulator_put(led_array[i].flash_cfg->\
+=09=09=09=09=09=09=09torch_boost_reg);
+=09=09=09sysfs_remove_group(&led_array[i].cdev.dev->kobj,
+=09=09=09=09=09=09=09&led_attr_group);
+=09=09=09break;
+=09=09default:
+=09=09=09dev_err(led_array[i].dev,
+=09=09=09=09=09"Invalid LED(%d)\n",
+=09=09=09=09=09led_array[i].id);
+=09=09=09return -EINVAL;
+=09=09}
+=09}
+
+=09return 0;
+}
+
+static const struct of_device_id qpnp_leds_spmi_of_match[] =3D {
+=09{ .compatible =3D "qcom,leds-qpnp" },
+=09{},
+};
+MODULE_DEVICE_TABLE(of, qpnp_leds_spmi_of_match);
+
+static struct platform_driver qpnp_leds_driver =3D {
+=09.driver=09=09=3D {
+=09=09.name=09=3D "qcom,leds-qpnp",
+=09=09.of_match_table =3D of_match_ptr(qpnp_leds_spmi_of_match),
+=09},
+=09.probe=09=09=3D qpnp_leds_probe,
+=09.remove=09=09=3D qpnp_leds_remove,
+};
+module_platform_driver(qpnp_leds_driver);
+
+MODULE_DESCRIPTION("QPNP LED driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("leds:leds-qpnp");
--=20
2.29.2


