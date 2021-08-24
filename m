Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCCF3F6B4F
	for <lists+linux-leds@lfdr.de>; Tue, 24 Aug 2021 23:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233818AbhHXVqM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Aug 2021 17:46:12 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40048 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234725AbhHXVqL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Aug 2021 17:46:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nfraprado)
        with ESMTPSA id B861D1F43480
Date:   Tue, 24 Aug 2021 18:45:15 -0300
From:   =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado 
        <nfraprado@collabora.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, ~lkcamp/patches@lists.sr.ht,
        =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@collabora.com>,
        kernel@collabora.com
Subject: Re: [PATCH v3 2/5] leds: Add driver for QCOM SPMI Flash LEDs
Message-ID: <20210824214515.ekjpvaymkgxltlzp@notapiano>
References: <20210803162641.1525980-1-nfraprado@collabora.com>
 <20210803162641.1525980-3-nfraprado@collabora.com>
 <b1060e9a-f78e-fbe9-bde3-2b4d89cbc73e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1060e9a-f78e-fbe9-bde3-2b4d89cbc73e@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

Thank you for the review. I'll answer below.

On Tue, Aug 17, 2021 at 12:03:49AM +0200, Jacek Anaszewski wrote:
> Hi Nicolas,
> 
> Thanks for the update. See my comments below.
> 
> On 8/3/21 6:26 PM, N�colas F. R. A. Prado wrote:
> > Add driver for Qualcomm's SPMI Flash LEDs. These are controlled
> > through an SPMI bus and are part of the PM8941 PMIC. There are two LEDs
> > present on the chip, which can be used independently as camera flash or,
> > when in torch mode, as a lantern.
> > 
> > Signed-off-by: N�colas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> > 
> > Changes in v3:
> > - The two LEDs can now be operated independently even when in torch mode
> > - The flashes can now strobe consecutive times without needing to manually
> >    disable them between strobes
> > - Implemented strobe_get()
> > - Moved dt parsing to a separate function
> > - Split multiplexed torch/flash on/off and torch/flash regulator on/off
> >    functions
> > - Set current on brightness callback and timeout on timeout callback, instead of
> >    setting everything every time when strobing/turning torch on
> > - And a whole lot of other minor changes
> > 
> > Changes in v2:
> > - Thanks to Jacek:
> >    - Implemented flash LED class framework
> > - Thanks to Bjorn:
> >    - Renamed driver to "qcom spmi flash"
> > - Refactored code
> > - Added missing copyright
> > 
> >   drivers/leds/flash/Kconfig                |    8 +
> >   drivers/leds/flash/Makefile               |    1 +
> >   drivers/leds/flash/leds-qcom-spmi-flash.c | 1251 +++++++++++++++++++++
> >   3 files changed, 1260 insertions(+)
> >   create mode 100644 drivers/leds/flash/leds-qcom-spmi-flash.c
> > 
> > diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
> > index 3f49f3edbffb..72f61323cd2a 100644
> > --- a/drivers/leds/flash/Kconfig
> > +++ b/drivers/leds/flash/Kconfig
> > @@ -24,4 +24,12 @@ config LEDS_RT8515
> >   	  To compile this driver as a module, choose M here: the module
> >   	  will be called leds-rt8515.
> > +config LEDS_QCOM_SPMI_FLASH
> > +	tristate "Support for QCOM SPMI Flash LEDs"
> > +	depends on REGMAP_SPMI
> > +	depends on OF
> > +	help
> > +	  This option enables support for the flash/torch LEDs present in
> > +	  Qualcomm's PM8941 PMIC.
> > +
> >   endif # LEDS_CLASS_FLASH
> > diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
> > index 09aee561f769..c141d277e9b6 100644
> > --- a/drivers/leds/flash/Makefile
> > +++ b/drivers/leds/flash/Makefile
> > @@ -2,3 +2,4 @@
> >   obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
> >   obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
> > +obj-$(CONFIG_LEDS_QCOM_SPMI_FLASH)	+= leds-qcom-spmi-flash.o
> > diff --git a/drivers/leds/flash/leds-qcom-spmi-flash.c b/drivers/leds/flash/leds-qcom-spmi-flash.c
> > new file mode 100644
> > index 000000000000..9763707bb986
> > --- /dev/null
> > +++ b/drivers/leds/flash/leds-qcom-spmi-flash.c
> > @@ -0,0 +1,1251 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Qualcomm SPMI Flash LEDs Driver
> > + *
> > + * Copyright (c) 2020-2021, N�colas F. R. A. Prado <n@nfraprado.net>
> > + * Copyright (c) 2021, Collabora Ltd.
> > + *
> > + * Based on QPNP LEDs driver from downstream MSM kernel sources.
> > + * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/led-class-flash.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/spmi.h>
> > +#include <linux/string.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/types.h>
> > +
> > +#define QCOM_FLASH_ADDR_PERIPHERAL_SUBTYPE	0x05
> > +#define QCOM_FLASH_ADDR_STATUS			0x10
> > +#define QCOM_FLASH_ADDR_SAFETY_TIMER		0x40
> > +#define QCOM_FLASH_ADDR_MAX_CURR		0x41
> > +#define QCOM_FLASH_ADDR_CURR_LED0		0x42
> > +#define QCOM_FLASH_ADDR_CURR_LED1		0x43
> > +#define QCOM_FLASH_ADDR_CLAMP_CURR		0x44
> > +#define QCOM_FLASH_ADDR_ENABLE_CONTROL		0x46
> > +#define QCOM_FLASH_ADDR_LED_STROBE_CTRL		0x47
> > +#define QCOM_FLASH_ADDR_LED_TMR_CTRL		0x48
> > +#define QCOM_FLASH_ADDR_HEADROOM		0x4A
> > +#define QCOM_FLASH_ADDR_STARTUP_DELAY		0x4B
> > +#define QCOM_FLASH_ADDR_MASK_ENABLE		0x4C
> > +#define QCOM_FLASH_ADDR_VREG_OK_FORCE		0x4F
> > +#define QCOM_FLASH_ADDR_LED_UNLOCK_SECURE	0xD0
> > +#define QCOM_FLASH_ADDR_LED_TORCH		0xE4
> > +#define QCOM_FLASH_ADDR_FAULT_DETECT		0x51
> > +#define QCOM_FLASH_ADDR_RAMP_RATE		0x54
> > +#define QCOM_FLASH_ADDR_VPH_PWR_DROOP		0x5A
> > +
> > +#define QCOM_FLASH_MAX_LEVEL		0x4F
> > +#define QCOM_FLASH_TORCH_MAX_LEVEL	0x0F
> > +#define	QCOM_FLASH_NO_MASK		0x00
> > +
> > +#define QCOM_FLASH_MASK_1		0x20
> > +#define QCOM_FLASH_MASK_REG_MASK	0xE0
> > +#define QCOM_FLASH_HEADROOM_MASK	0x03
> > +#define QCOM_FLASH_SAFETY_TIMER_MASK	0x7F
> > +#define QCOM_FLASH_CURRENT_MASK		0xFF
> > +#define QCOM_FLASH_MAX_CURRENT_MASK	0x7F
> > +#define QCOM_FLASH_TMR_MASK		0x03
> > +#define QCOM_FLASH_TMR_WATCHDOG		0x03
> > +#define QCOM_FLASH_TMR_SAFETY		0x00
> > +#define QCOM_FLASH_FAULT_DETECT_MASK	0x80
> > +#define QCOM_FLASH_HW_VREG_OK		0x40
> > +#define QCOM_FLASH_VREG_MASK		0xC0
> > +#define QCOM_FLASH_STARTUP_DLY_MASK	0x02
> > +#define QCOM_FLASH_RAMP_RATE_MASK	0xBF
> > +#define QCOM_FLASH_VPH_PWR_DROOP_MASK	0xF3
> > +
> > +#define QCOM_FLASH_ENABLE_ALL		0xE0
> > +#define QCOM_FLASH_ENABLE_MODULE	0x80
> > +#define QCOM_FLASH_ENABLE_MODULE_MASK	0x80
> > +#define QCOM_FLASH_DISABLE_ALL		0x00
> > +#define QCOM_FLASH_ENABLE_MASK		0xE0
> > +#define QCOM_FLASH_ENABLE_LED0		0xC0
> > +#define QCOM_FLASH_ENABLE_LED1		0xA0
> > +#define QCOM_FLASH_INIT_MASK		0xE0
> > +#define QCOM_FLASH_SELFCHECK_ENABLE	0x80
> > +#define QCOM_FLASH_SELFCHECK_DISABLE	0x00
> > +
> > +#define QCOM_FLASH_STROBE_SW		0xC0
> > +#define QCOM_FLASH_STROBE_HW		0x04
> > +#define QCOM_FLASH_STROBE_MASK		0xC7
> > +#define QCOM_FLASH_STROBE_LED0		0x80
> > +#define QCOM_FLASH_STROBE_LED1		0x40
> > +
> > +#define QCOM_FLASH_TORCH_MASK		0x03
> > +#define QCOM_FLASH_LED_TORCH_ENABLE	0x00
> > +#define QCOM_FLASH_LED_TORCH_DISABLE	0x03
> > +#define QCOM_FLASH_UNLOCK_SECURE	0xA5
> > +#define QCOM_FLASH_SECURE_MASK		0xFF
> > +
> > +#define QCOM_FLASH_SUBTYPE_DUAL		0x01
> > +#define QCOM_FLASH_SUBTYPE_SINGLE	0x02
> > +
> > +#define QCOM_FLASH_DURATION_STEP	10000
> > +#define QCOM_FLASH_DURATION_MIN		10000
> > +#define QCOM_FLASH_DURATION_DEFAULT	200000
> > +
> > +#define QCOM_FLASH_CURRENT_STEP		12500
> > +#define QCOM_FLASH_CURRENT_MIN		12500
> > +
> > +#define QCOM_FLASH_DEFAULT_CLAMP	200000
> > +
> > +#define QCOM_FLASH_MASK_ON_LED0		0x8
> > +#define QCOM_FLASH_MASK_ON_LED1		0x2
> > +#define QCOM_FLASH_MASK_STATUS_TIMEDOUT	0x5
> > +
> > +enum qcom_flash_headroom {
> > +	QCOM_FLASH_HEADROOM_250MV,
> > +	QCOM_FLASH_HEADROOM_300MV,
> > +	QCOM_FLASH_HEADROOM_400MV,
> > +	QCOM_FLASH_HEADROOM_500MV,
> > +};
> > +
> > +enum qcom_flash_startup_dly {
> > +	QCOM_FLASH_STARTUP_DLY_10US,
> > +	QCOM_FLASH_STARTUP_DLY_32US,
> > +	QCOM_FLASH_STARTUP_DLY_64US,
> > +	QCOM_FLASH_STARTUP_DLY_128US,
> > +};
> > +
> > +enum qcom_flash_ids {
> > +	QCOM_FLASH_ID_LED0,
> > +	QCOM_FLASH_ID_LED1,
> > +};
> > +
> > +/**
> > + * struct qcom_flash_led - Represents each individual flash LED
> > + * @fled_cdev: flash LED classdev
> > + * @id: LED ID as given by enum qcom_flash_ids
> > + * @default_on: default state for the LED
> > + * @flash_enable_cmd: enable command for particular flash
> > + * @flash_strobe_cmd: strobe command for particular flash
> > + * @current_addr: address to write for current
> > + * @mask_led_on: bitmask for STATUS register that shows if LED is on
> > + * @flash_current_invalidated: whether the flash current in the current register
> > + *	was invalidated by torch usage
> > + */
> > +struct qcom_flash_led {
> > +	struct led_classdev_flash fled_cdev;
> > +	enum qcom_flash_ids id;
> > +	bool default_on;
> > +	u8 flash_enable_cmd;
> > +	u8 flash_strobe_cmd;
> > +	u16 current_addr;
> > +	u8 mask_led_on;
> > +	bool flash_current_invalidated;
> > +};
> > +
> > +/**
> > + * struct qcom_flash_device - QCOM SPMI Flash device, contains 2 flash LEDs
> > + * @regmap: regmap used to access LED registers over SPMI
> > + * @base: base register given in device tree
> > + * @dev: device from devicetree
> > + * @flash_supply: voltage regulator to supply the flashes
> > + * @torch_supply: voltage regulator to supply torch mode
> > + * @leds: flash LEDs
> > + * @num_leds: number of LEDs registered (between 0 and 2)
> > + * @lock: lock to protect SPMI transactions
> > + * @torch_enable_cmd: enable flash LED torch mode
> > + * @peripheral_subtype: module peripheral subtype
> > + * @flash_regulator_on: flash regulator status
> > + * @torch_regulator_on: torch regulator status
> > + * @torch_enabled: whether torch mode is enabled
> > + */
> > +struct qcom_flash_device {
> > +	struct regmap *regmap;
> > +	unsigned int base;
> > +	struct device *dev;
> > +	struct regulator *flash_supply;
> > +	struct regulator *torch_supply;
> > +	struct qcom_flash_led leds[2];
> > +	u8 num_leds;
> > +	struct mutex lock;
> > +	u8 torch_enable_cmd;
> > +	unsigned int peripheral_subtype;
> > +	bool flash_regulator_on;
> > +	bool torch_regulator_on;
> > +	bool torch_enabled;
> > +};
> > +
> > +struct qcom_flash_config {
> > +	unsigned int base;
> > +	struct regulator *flash_supply;
> > +	struct regulator *torch_supply;
> > +	unsigned int num_leds;
> > +
> > +	enum qcom_flash_ids id[2];
> > +	bool default_on[2];
> > +	u32 led_max_brightness[2];
> > +	u32 flash_max_brightness[2];
> > +	u32 flash_max_timeout[2];
> > +};
> > +
> > +static inline struct qcom_flash_led *flcdev_to_led(struct led_classdev_flash *fled_cdev)
> > +{
> > +	return container_of(fled_cdev, struct qcom_flash_led, fled_cdev);
> > +}
> > +
> > +static inline struct qcom_flash_device *led_to_leds_dev(struct qcom_flash_led *led)
> > +{
> > +	return container_of(led, struct qcom_flash_device, leds[led->id]);
> > +}
> > +
> > +static inline int qcom_flash_read_reg(struct qcom_flash_device *leds_dev,
> > +				      unsigned int reg, unsigned int *val)
> > +{
> > +	return regmap_read(leds_dev->regmap, leds_dev->base + reg, val);
> > +}
> > +
> > +static inline int qcom_flash_masked_write(struct qcom_flash_device *leds_dev,
> > +					  unsigned int reg, unsigned int mask,
> > +					  unsigned int val)
> > +{
> > +	return regmap_update_bits(leds_dev->regmap, leds_dev->base + reg, mask,
> > +				  val);
> > +}
> > +
> > +static u8 qcom_flash_duration_to_reg(u32 us)
> > +{
> > +	if (us < QCOM_FLASH_DURATION_MIN)
> > +		us = QCOM_FLASH_DURATION_MIN;
> > +	return (us - QCOM_FLASH_DURATION_MIN) / QCOM_FLASH_DURATION_STEP;
> > +}
> > +
> > +static u8 qcom_flash_current_to_reg(u32 ua)
> > +{
> > +	if (ua < QCOM_FLASH_CURRENT_MIN)
> > +		ua = QCOM_FLASH_CURRENT_MIN;
> > +	return (ua - QCOM_FLASH_CURRENT_MIN) / QCOM_FLASH_CURRENT_STEP;
> > +}
> > +
> > +static void clamp_align(u32 *v, u32 min, u32 max, u32 step)
> > +{
> > +	*v = clamp_val(*v, min, max);
> > +	if (step > 1)
> > +		*v = (*v - min) / step * step + min;
> > +}
> > +
> > +static int qcom_flash_status_get(struct qcom_flash_led *led)
> > +{
> > +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> > +	unsigned int status;
> > +	int rc;
> > +
> > +	rc = qcom_flash_read_reg(leds_dev, QCOM_FLASH_ADDR_STATUS, &status);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Failure reading status, rc =  %d\n",
> > +			rc);
> > +		return rc;
> > +	}
> > +
> > +	return status & led->mask_led_on;
> > +}
> > +
> > +static int qcom_flash_status_clear(struct qcom_flash_device *leds_dev)
> > +{
> > +	unsigned int enable_val;
> > +	int rc;
> > +
> > +	rc = qcom_flash_read_reg(leds_dev, QCOM_FLASH_ADDR_ENABLE_CONTROL,
> > +				 &enable_val);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Enable reg read failed(%d)\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_ENABLE_CONTROL,
> > +				     QCOM_FLASH_ENABLE_MASK, QCOM_FLASH_DISABLE_ALL);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Enable reg write failed(%d)\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_ENABLE_CONTROL,
> > +				     QCOM_FLASH_ENABLE_MASK, enable_val);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Enable reg write failed(%d)\n", rc);
> 
> It would be good to have different error messages to discern between
> the two above calls' failures.

Indeed.

> 
> > +		return rc;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int qcom_flash_check_timedout(struct qcom_flash_device *leds_dev)
> > +{
> > +	unsigned int status;
> > +	int rc;
> > +
> > +	rc = qcom_flash_read_reg(leds_dev, QCOM_FLASH_ADDR_STATUS, &status);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Failure reading status, rc =  %d\n",
> > +			rc);
> > +		return rc;
> > +	}
> > +
> > +	return status & QCOM_FLASH_MASK_STATUS_TIMEDOUT;
> > +}
> > +
> > +static int qcom_flash_torch_reg_enable(struct qcom_flash_device *leds_dev,
> > +				       bool state)
> > +{
> > +	int rc;
> > +
> > +	if (leds_dev->torch_enabled == state)
> > +		return 0;
> > +
> > +	/*
> > +	 * For the TORCH register (0xE4) to become writable, the UNLOCK_SECURE
> > +	 * register (0xD0) needs to be written with the UNLOCK_SECURE value
> > +	 * (0xA5) first.
> > +	 * It gets re-locked after any register write.
> > +	 */
> > +	rc = qcom_flash_masked_write(leds_dev,
> > +				     QCOM_FLASH_ADDR_LED_UNLOCK_SECURE,
> > +				     QCOM_FLASH_SECURE_MASK,
> > +				     QCOM_FLASH_UNLOCK_SECURE);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Secure reg write failed(%d)\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_LED_TORCH,
> > +				     QCOM_FLASH_TORCH_MASK,
> > +				     state ? QCOM_FLASH_LED_TORCH_ENABLE :
> > +					     QCOM_FLASH_LED_TORCH_DISABLE);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Torch reg write failed(%d)\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int qcom_flash_max_brightness_set(struct qcom_flash_led *led,
> > +					 unsigned int brightness)
> > +{
> > +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> > +	struct device *dev = leds_dev->dev;
> > +	int rc;
> > +
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_MAX_CURR,
> > +				     QCOM_FLASH_CURRENT_MASK, brightness);
> > +	if (rc) {
> > +		dev_err(dev, "Max current reg write failed(%d)\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int qcom_flash_brightness_set(struct qcom_flash_led *led,
> > +				     unsigned int brightness)
> > +{
> > +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> > +	struct device *dev = leds_dev->dev;
> > +	int rc;
> > +
> > +	rc = qcom_flash_masked_write(leds_dev, led->current_addr,
> > +				     QCOM_FLASH_CURRENT_MASK, brightness);
> > +	if (rc) {
> > +		dev_err(dev, "Current reg write failed(%d)\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int qcom_flash_fled_regulator_on(struct qcom_flash_device *leds_dev)
> > +{
> > +	int rc;
> > +
> > +	if (leds_dev->flash_regulator_on)
> > +		return 0;
> > +
> > +	rc = regulator_enable(leds_dev->flash_supply);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Regulator enable failed(%d)\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	leds_dev->flash_regulator_on = true;
> > +
> > +	return 0;
> > +}
> > +
> > +static int qcom_flash_fled_regulator_off(struct qcom_flash_device *leds_dev)
> > +{
> > +	unsigned int i;
> > +	u8 enable = 0;
> > +	int rc;
> > +
> > +	if (!leds_dev->flash_regulator_on)
> > +		return 0;
> > +
> > +	for (i = 0; i < leds_dev->num_leds; i++) {
> > +		rc = qcom_flash_status_get(&leds_dev->leds[i]);
> > +		if (rc < 0)
> > +			return rc;
> > +
> > +		if (!rc)
> > +			continue;
> > +
> > +		enable |= leds_dev->leds[i].flash_enable_cmd;
> > +	}
> > +
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_ENABLE_CONTROL,
> > +				     QCOM_FLASH_ENABLE_MASK, enable);
> > +	if (rc)
> > +		dev_err(leds_dev->dev, "Enable reg write failed(%d)\n", rc);
> > +
> > +	if (enable)
> > +		return 0;
> > +
> > +	rc = regulator_disable(leds_dev->flash_supply);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Regulator disable failed(%d)\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	leds_dev->flash_regulator_on = false;
> > +
> > +	return 0;
> > +}
> > +
> > +static int qcom_flash_torch_regulator_on(struct qcom_flash_device *leds_dev)
> > +{
> > +	int rc;
> > +
> > +	if (leds_dev->torch_regulator_on)
> > +		return 0;
> > +
> > +	rc = regulator_enable(leds_dev->torch_supply);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Regulator enable failed(%d)\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	leds_dev->torch_regulator_on = true;
> > +
> > +	return 0;
> > +}
> > +
> > +static int qcom_flash_torch_regulator_off(struct qcom_flash_device *leds_dev)
> > +{
> > +	int rc;
> > +
> > +	if (!leds_dev->torch_regulator_on)
> > +		return 0;
> > +
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_ENABLE_CONTROL,
> > +				     QCOM_FLASH_ENABLE_MODULE_MASK,
> > +				     QCOM_FLASH_DISABLE_ALL);
> > +	if (rc)
> > +		dev_err(leds_dev->dev, "Enable reg write failed(%d)\n", rc);
> > +
> > +	rc = regulator_disable(leds_dev->torch_supply);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Regulator disable failed(%d)\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	leds_dev->torch_regulator_on = false;
> > +
> > +	return 0;
> > +}
> > +
> > +static int qcom_flash_fled_on(struct qcom_flash_led *led)
> > +{
> > +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> > +	struct device *dev = leds_dev->dev;
> > +	int rc, error;
> > +
> > +	rc = qcom_flash_fled_regulator_on(leds_dev);
> > +	if (rc)
> > +		goto error_flash_set;
> > +
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_ENABLE_CONTROL,
> > +				     led->flash_enable_cmd,
> > +				     led->flash_enable_cmd);
> > +	if (rc) {
> > +		dev_err(dev, "Enable reg write failed(%d)\n", rc);
> > +		goto error_flash_set;
> > +	}
> > +
> > +	/*
> > +	 * TODO The downstream driver also allowed HW strobe. Add support for it
> > +	 * after v4l2 support is added and ISP can be used
> > +	 */
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_LED_STROBE_CTRL,
> > +				     led->flash_strobe_cmd,
> > +				     led->flash_strobe_cmd);
> > +	if (rc) {
> > +		dev_err(dev, "LED %d strobe reg write failed(%d)\n", led->id,
> > +			rc);
> > +		goto error_flash_set;
> > +	}
> > +
> > +	return 0;
> > +
> > +error_flash_set:
> > +	error = qcom_flash_fled_regulator_off(leds_dev);
> > +	if (error)
> > +		return error;
> > +	return rc;
> > +}
> > +
> > +static int qcom_flash_fled_off(struct qcom_flash_led *led)
> > +{
> > +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> > +	struct device *dev = leds_dev->dev;
> > +	int rc, error;
> > +
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_LED_STROBE_CTRL,
> > +				     led->flash_strobe_cmd,
> > +				     QCOM_FLASH_DISABLE_ALL);
> > +	if (rc)
> > +		dev_err(dev, "LED %d flash write failed(%d)\n", led->id, rc);
> > +
> > +	error = qcom_flash_fled_regulator_off(leds_dev);
> > +	if (error)
> > +		return error;
> > +	return rc;
> > +}
> > +
> > +static int qcom_flash_torch_on(struct qcom_flash_led *led)
> > +{
> > +	int rc, error;
> > +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> > +	struct device *dev = leds_dev->dev;
> > +
> > +	if (leds_dev->peripheral_subtype == QCOM_FLASH_SUBTYPE_DUAL) {
> > +		rc = qcom_flash_torch_regulator_on(leds_dev);
> > +		if (rc)
> > +			goto error_reg_write;
> > +	} else if (leds_dev->peripheral_subtype == QCOM_FLASH_SUBTYPE_SINGLE) {
> > +		rc = qcom_flash_fled_regulator_on(leds_dev);
> 
> Why for torch mode you need to enable fled regulator?

Based on [1], apparently the hardware present in the Single variant of the PMIC
has some limitation that requires the use of the flash regulator and the value
QCOM_FLASH_ENABLE_ALL to enable the LEDs for the torch mode. The Dual variant on
the other hand can just use the torch regulator and enables the LEDs with
QCOM_FLASH_ENABLE_MODULE.

[1] https://github.com/AICP/kernel_lge_hammerhead/commit/0f47c747c074993655d0bfebd045e8ddd228fe4c

I'm honestly not sure what the impact is on using the different regulators and
enable values. I have tested enabling the Dual PMIC with different enable values
and all seemed to work the same, so must be some hardware detail.

I left that Single codepath in the hope that it is useful for devices that have
that variant of the hardware, but I have only actually tested the Dual PMIC,
which is the one present on the Nexus 5.

> 
> > +		if (rc)
> > +			goto error_flash_set;
> > +
> > +		/*
> > +		 * Write 0x80 to MODULE_ENABLE before writing
> > +		 * 0xE0 in order to avoid a hardware bug caused
> > +		 * by register value going from 0x00 to 0xE0.
> > +		 */
> > +		rc = qcom_flash_masked_write(leds_dev,
> > +					     QCOM_FLASH_ADDR_ENABLE_CONTROL,
> > +					     QCOM_FLASH_ENABLE_MODULE_MASK,
> > +					     QCOM_FLASH_ENABLE_MODULE);
> > +		if (rc) {
> > +			dev_err(dev, "Enable reg write failed(%d)\n", rc);
> > +			goto error_flash_set;
> > +		}
> > +	}
> > +
> > +	rc = qcom_flash_torch_reg_enable(leds_dev, true);
> > +	if (rc)
> > +		goto error_reg_write;
> > +
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_ENABLE_CONTROL,
> > +				     QCOM_FLASH_ENABLE_MASK,
> > +				     leds_dev->torch_enable_cmd);
> > +	if (rc) {
> > +		dev_err(dev, "Enable reg write failed(%d)\n", rc);
> > +		goto error_reg_write;
> > +	}
> > +
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_LED_STROBE_CTRL,
> > +				     led->flash_strobe_cmd,
> > +				     led->flash_strobe_cmd);
> 
> Just to make sure - the hardware requires strobe cmd to enable torch?

Yes. The strobe value is the one that actually turns each of the LEDs on,
doesn't matter if it's on flash or torch mode. The difference in torch mode is
actually just that the timeout on the LEDs is disabled (done by writing 0x00
into the TORCH, 0xE4, register).
So for both modes, the LEDs are turned on by writing to the STROBE_CTRL, 0x47,
register. If torch is on they'll stay on indefinitely, while on flash mode
they'll turn off after the timeout.

Perhaps it's just a naming issue?

> 
> > +	if (rc) {
> > +		dev_err(dev, "LED %d strobe reg write failed(%d)\n", led->id,
> > +			rc);
> > +		goto error_reg_write;
> > +	}
> > +
> > +	leds_dev->torch_enabled = true;
> > +
> > +	return 0;
> > +
> > +error_reg_write:
> > +	if (leds_dev->peripheral_subtype == QCOM_FLASH_SUBTYPE_SINGLE)
> > +		goto error_flash_set;
> > +
> > +	error = qcom_flash_torch_regulator_off(leds_dev);
> > +	if (error)
> > +		return error;
> > +	return rc;
> > +
> > +error_flash_set:
> > +	error = qcom_flash_fled_regulator_off(leds_dev);
> > +	if (error)
> > +		return error;
> > +	return rc;
> > +}
> > +
> > +static int qcom_flash_torch_off(struct qcom_flash_led *led)
> > +{
> > +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> > +	struct device *dev = leds_dev->dev;
> > +	int rc, error;
> > +	unsigned int i;
> > +
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_LED_STROBE_CTRL,
> > +				     led->flash_strobe_cmd, QCOM_FLASH_DISABLE_ALL);
> > +	if (rc) {
> > +		dev_err(dev, "LED %d flash write failed(%d)\n", led->id, rc);
> > +		goto error_torch_set;
> > +	}
> > +
> > +	/* Keep torch on if the other LED is still on */
> > +	for (i = 0; i < leds_dev->num_leds; i++)
> > +		if (leds_dev->leds[i].fled_cdev.led_cdev.brightness)
> > +			return 0;
> > +
> > +	rc = qcom_flash_torch_reg_enable(leds_dev, false);
> > +	if (rc)
> > +		goto error_torch_set;
> > +
> > +	if (leds_dev->peripheral_subtype == QCOM_FLASH_SUBTYPE_DUAL) {
> > +		rc = qcom_flash_torch_regulator_off(leds_dev);
> > +		if (rc)
> > +			return rc;
> > +	} else if (leds_dev->peripheral_subtype == QCOM_FLASH_SUBTYPE_SINGLE) {
> > +		rc = qcom_flash_fled_regulator_off(leds_dev);
> > +		if (rc)
> > +			return rc;
> > +	}
> > +
> > +	leds_dev->torch_enabled = false;
> > +
> > +	return 0;
> > +
> > +error_torch_set:
> > +	error = qcom_flash_torch_regulator_off(leds_dev);
> > +	if (error)
> > +		return error;
> > +	return rc;
> > +}
> > +
> > +static int qcom_flash_ledcdev_brightness_set(struct led_classdev *led_cdev,
> > +					     enum led_brightness value)
> > +{
> > +	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
> > +	struct qcom_flash_led *led = flcdev_to_led(fled_cdev);
> > +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> > +	unsigned int max_brightness;
> > +	int rc;
> > +
> > +	if (value > led_cdev->max_brightness) {
> 
> LED framework takes care of it. You can skip this.

Ok.

> 
> > +		dev_err(leds_dev->dev, "Invalid brightness value\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	mutex_lock(&leds_dev->lock);
> > +	if (!value) {
> > +		rc = qcom_flash_torch_off(led);
> > +	} else {
> > +		/*
> > +		 * The minimum on value for the brightness register is 0, but for
> > +		 * led_classdev is 1, as 0 there means off.
> > +		 */
> > +		rc = qcom_flash_brightness_set(led, led_cdev->brightness - 1);
> > +		if (rc)
> > +			goto unlock;
> > +
> > +		led->flash_current_invalidated = true;
> > +
> > +		if (leds_dev->torch_enabled) {
> > +			/* Clear status to update brightness */
> > +			rc = qcom_flash_status_clear(leds_dev);
> > +			if (rc)
> > +				goto unlock;
> > +		} else {
> > +			/*
> > +			 * Clear status from previous flash strobe so the LED
> > +			 * can turn on
> > +			 */
> > +			rc = qcom_flash_check_timedout(leds_dev);
> > +			if (rc > 0)
> > +				rc = qcom_flash_status_clear(leds_dev);
> > +			else if (rc < 0)
> > +				goto unlock;
> > +
> > +			max_brightness = led_cdev->max_brightness - 1;
> > +			rc = qcom_flash_max_brightness_set(led, max_brightness);
> > +			if (rc)
> > +				goto unlock;
> > +		}
> > +		rc = qcom_flash_torch_on(led);
> > +	}
> > +
> > +unlock:
> > +	mutex_unlock(&leds_dev->lock);
> > +	return rc;
> > +}
> > +
> > +static int qcom_flash_flcdev_brightness_set(struct led_classdev_flash *fled_cdev,
> > +					    u32 brightness)
> > +{
> > +	struct qcom_flash_led *led = flcdev_to_led(fled_cdev);
> > +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> > +	unsigned int bright;
> > +	int rc;
> > +
> > +	/* Can't operate on flash if torch is on */
> > +	if (leds_dev->torch_enabled)
> > +		return -EBUSY;
> > +
> > +	clamp_align(&brightness, QCOM_FLASH_CURRENT_MIN,
> > +		    fled_cdev->brightness.max, QCOM_FLASH_CURRENT_STEP);
> > +	fled_cdev->brightness.val = brightness;
> > +
> > +	bright = qcom_flash_current_to_reg(brightness);
> > +
> > +	mutex_lock(&leds_dev->lock);
> > +	rc = qcom_flash_brightness_set(led, bright);
> > +	if (rc)
> > +		goto unlock;
> > +
> > +	if (led->flash_current_invalidated) {
> > +		bright = qcom_flash_current_to_reg(fled_cdev->brightness.max);
> > +		rc = qcom_flash_max_brightness_set(led, bright);
> > +		if (rc)
> > +			goto unlock;
> > +	}
> > +
> > +	led->flash_current_invalidated = false;
> > +
> > +unlock:
> > +	mutex_unlock(&leds_dev->lock);
> > +	return rc;
> > +}
> > +
> > +static int qcom_flash_flcdev_strobe_set(struct led_classdev_flash *fled_cdev,
> > +					bool state)
> > +{
> > +	struct qcom_flash_led *led = flcdev_to_led(fled_cdev);
> > +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> > +	unsigned int bright;
> > +	unsigned int i;
> > +	int rc;
> > +
> > +	/* Can't operate on flash if torch is on */
> > +	if (leds_dev->torch_enabled)
> > +		return -EBUSY;
> > +
> > +	mutex_lock(&leds_dev->lock);
> > +	if (!state) {
> > +		rc = qcom_flash_fled_off(led);
> > +	} else {
> > +		/*
> > +		 * Turn off flash LEDs from previous strobe
> > +		 */
> > +		rc = qcom_flash_check_timedout(leds_dev);
> > +		if (rc > 0) {
> > +			for (i = 0; i < leds_dev->num_leds; i++) {
> > +				rc = qcom_flash_fled_off(&leds_dev->leds[i]);
> > +				if (rc)
> > +					goto unlock;
> > +			}
> > +		} else if (rc < 0) {
> > +			goto unlock;
> > +		}
> 
> What if flash gets timed out after this check here? Why do you need to
> call qcom_flash_fled_off() if it has already timed out?

The issue is that after the flash times out, the hardware is not ready for
another strobe.

When I strobe LED0 for example, the STATUS register, 0x10, gets set to 0x08
indicating the LED0 is on. After the timeout, it changes to 0x04. At that point
if I try to strobe LED0 again, it doesn't work. When I turn the LED0 off (write
0x00 to either the ENABLE or STROBE register), the STATUS is reset to 0x00. Now
I'm able to strobe the LED0 again.

I'm not sure if this is the normal behavior on other flash LED controllers, and
maybe there's even some configuration of this PMIC that resets the LED status
automatically after the strobe timeout, but I have not been able to do that. So
that's why I reset the status manually everytime it's needed.

> 
> > +		if (led->flash_current_invalidated) {
> > +			bright = qcom_flash_current_to_reg(fled_cdev->brightness.val);
> > +			rc = qcom_flash_brightness_set(led, bright);
> > +			if (rc)
> > +				goto unlock;
> > +
> > +			bright = qcom_flash_current_to_reg(fled_cdev->brightness.max);
> > +			rc = qcom_flash_max_brightness_set(led, bright);
> > +			if (rc)
> > +				goto unlock;
> > +
> > +			led->flash_current_invalidated = false;
> > +		}
> > +
> > +		rc = qcom_flash_fled_on(led);
> > +	}
> > +
> > +unlock:
> > +	mutex_unlock(&leds_dev->lock);
> > +	return rc;
> > +}
> > +
> > +static int qcom_flash_flcdev_strobe_get(struct led_classdev_flash *fled_cdev,
> > +					bool *state)
> > +{
> > +	struct qcom_flash_led *led = flcdev_to_led(fled_cdev);
> > +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> > +	int status;
> > +
> > +	mutex_lock(&leds_dev->lock);
> > +	status = qcom_flash_status_get(led);
> > +	mutex_unlock(&leds_dev->lock);
> > +	if (status < 0)
> > +		return status;
> > +
> > +	*state = status && !leds_dev->torch_enabled;
> > +	return 0;
> > +}
> > +
> > +static int qcom_flash_flcdev_timeout_set(struct led_classdev_flash *fled_cdev,
> > +					 u32 timeout)
> > +{
> > +	struct qcom_flash_led *led = flcdev_to_led(fled_cdev);
> > +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> > +	unsigned int time, i;
> > +	int rc;
> > +
> > +	clamp_align(&timeout, QCOM_FLASH_DURATION_MIN, fled_cdev->timeout.max,
> > +		    QCOM_FLASH_DURATION_STEP);
> > +
> > +	/* Since the timeout register is shared between LEDs, update for all */
> > +	for (i = 0; i < leds_dev->num_leds; i++)
> > +		leds_dev->leds[i].fled_cdev.timeout.val = timeout;
> > +
> > +	time = qcom_flash_duration_to_reg(fled_cdev->timeout.val);
> > +
> > +	mutex_lock(&leds_dev->lock);
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_SAFETY_TIMER,
> > +				     QCOM_FLASH_SAFETY_TIMER_MASK, time);
> > +	if (rc)
> > +		dev_err(leds_dev->dev, "Safety timer reg write failed(%d)\n",
> > +			rc);
> > +	mutex_unlock(&leds_dev->lock);
> > +
> > +	return rc;
> > +}
> > +
> > +static int qcom_flash_flcdev_fault_get(struct led_classdev_flash *fled_cdev,
> > +				       u32 *fault)
> > +{
> > +	/*
> > +	 * TODO Add fault detection when we find out how to. No clue from
> > +	 * inspecting the SPMI registers
> > +	 */
> > +	*fault = 0;
> > +	return 0;
> > +}
> > +
> > +static const struct led_flash_ops flash_ops = {
> > +	.flash_brightness_set	= qcom_flash_flcdev_brightness_set,
> > +	.strobe_set		= qcom_flash_flcdev_strobe_set,
> > +	.strobe_get		= qcom_flash_flcdev_strobe_get,
> > +	.timeout_set		= qcom_flash_flcdev_timeout_set,
> > +	.fault_get		= qcom_flash_flcdev_fault_get,
> > +};
> > +
> > +static int qcom_flash_setup_flcdev(struct qcom_flash_config *cfg,
> > +				   struct qcom_flash_led *led,
> > +				   struct device_node *node)
> > +{
> > +	int rc;
> > +	struct device *dev = led_to_leds_dev(led)->dev;
> > +	struct led_classdev_flash *fled_cdev = &led->fled_cdev;
> > +	struct led_classdev *led_cdev = &fled_cdev->led_cdev;
> > +	struct led_init_data init_data = {};
> > +	struct led_flash_setting *setting;
> > +
> > +	init_data.fwnode = of_fwnode_handle(node);
> > +
> > +	led_cdev->brightness_set_blocking = qcom_flash_ledcdev_brightness_set;
> > +
> > +	led_cdev->max_brightness = cfg->led_max_brightness[led->id];
> > +	led_cdev->max_brightness /= QCOM_FLASH_CURRENT_STEP;
> 
> Just assign the result of division:
> 
> led_cdev->max_brightness = cfg->led_max_brightness[led->id] /
>                            QCOM_FLASH_CURRENT_STEP;
> 
> Two consecutive assignments look a bit convoluted.

Sure.

> 
> > +
> > +	setting = &fled_cdev->brightness;
> > +	setting->max = cfg->flash_max_brightness[led->id];
> > +	setting->min = QCOM_FLASH_CURRENT_MIN;
> > +	setting->step = QCOM_FLASH_CURRENT_STEP;
> > +	setting->val = setting->min;
> > +
> > +	setting = &fled_cdev->timeout;
> > +	setting->max = cfg->flash_max_timeout[led->id];
> > +	setting->min = QCOM_FLASH_DURATION_MIN;
> > +	setting->step = QCOM_FLASH_DURATION_STEP;
> > +	setting->val = QCOM_FLASH_DURATION_DEFAULT;
> > +
> > +	fled_cdev->ops = &flash_ops;
> > +	led_cdev->flags |= LED_DEV_CAP_FLASH;
> > +
> > +	rc = devm_led_classdev_flash_register_ext(dev, fled_cdev, &init_data);
> > +	if (rc)
> > +		dev_err(dev, "unable to register led %d,rc=%d\n", led->id, rc);
> > +
> > +	return rc;
> > +}
> > +
> > +static int qcom_flash_setup_fled(struct qcom_flash_config *cfg,
> > +				 struct qcom_flash_led *led,
> > +				 enum qcom_flash_ids id)
> > +{
> > +	led->id = cfg->id[id];
> > +	led->default_on = cfg->default_on[id];
> > +	led->flash_current_invalidated = true;
> > +
> > +	if (led->id == QCOM_FLASH_ID_LED0) {
> > +		led->flash_enable_cmd = QCOM_FLASH_ENABLE_LED0;
> > +		led->flash_strobe_cmd = QCOM_FLASH_STROBE_LED0;
> > +		led->current_addr = QCOM_FLASH_ADDR_CURR_LED0;
> > +		led->mask_led_on = QCOM_FLASH_MASK_ON_LED0;
> > +	} else {
> > +		led->flash_enable_cmd = QCOM_FLASH_ENABLE_LED1;
> > +		led->flash_strobe_cmd = QCOM_FLASH_STROBE_LED1;
> > +		led->current_addr = QCOM_FLASH_ADDR_CURR_LED1;
> > +		led->mask_led_on = QCOM_FLASH_MASK_ON_LED1;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int qcom_flash_setup_regs(struct qcom_flash_device *leds_dev)
> > +{
> > +	int rc;
> > +
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_LED_STROBE_CTRL,
> > +				     QCOM_FLASH_STROBE_MASK,
> > +				     QCOM_FLASH_DISABLE_ALL);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "LED flash write failed(%d)\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	/* Disable flash LED module */
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_ENABLE_CONTROL,
> > +				     QCOM_FLASH_ENABLE_MASK,
> > +				     QCOM_FLASH_DISABLE_ALL);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Enable reg write failed(%d)\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	/* Set Vreg force */
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_VREG_OK_FORCE,
> > +				     QCOM_FLASH_VREG_MASK,
> > +				     QCOM_FLASH_HW_VREG_OK);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Vreg OK reg write failed(%d)\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	/* Set self fault check */
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_FAULT_DETECT,
> > +				     QCOM_FLASH_FAULT_DETECT_MASK,
> > +				     QCOM_FLASH_SELFCHECK_DISABLE);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Fault detect reg write failed(%d)\n",
> > +			rc);
> > +		return rc;
> > +	}
> > +
> > +	/* Set mask enable */
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_MASK_ENABLE,
> > +				     QCOM_FLASH_MASK_REG_MASK,
> > +				     QCOM_FLASH_MASK_1);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Mask enable reg write failed(%d)\n",
> > +			rc);
> > +		return rc;
> > +	}
> > +
> > +	/* Set ramp rate */
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_RAMP_RATE,
> > +				     QCOM_FLASH_RAMP_RATE_MASK, 0xBF);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Ramp rate reg write failed(%d)\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	/* Enable VPH_PWR_DROOP and set threshold to 2.9V */
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_VPH_PWR_DROOP,
> > +				     QCOM_FLASH_VPH_PWR_DROOP_MASK, 0xC2);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "VPH_PWR_DROOP reg write failed(%d)\n",
> > +			rc);
> > +		return rc;
> > +	}
> > +
> > +	/* Set headroom */
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_HEADROOM,
> > +				     QCOM_FLASH_HEADROOM_MASK,
> > +				     QCOM_FLASH_HEADROOM_500MV);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Headroom reg write failed(%d)\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	/* Set startup delay */
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_STARTUP_DELAY,
> > +				     QCOM_FLASH_STARTUP_DLY_MASK,
> > +				     QCOM_FLASH_STARTUP_DLY_10US);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "Startup delay reg write failed(%d)\n",
> > +			rc);
> > +		return rc;
> > +	}
> > +
> > +	/*
> > +	 * TODO The downstream driver also supported watchdog mode. Not sure
> > +	 * about the difference, so only support safety timer for now
> > +	 */
> > +	/* Set timer control */
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_LED_TMR_CTRL,
> > +				     QCOM_FLASH_TMR_MASK,
> > +				     QCOM_FLASH_TMR_SAFETY);
> > +	if (rc) {
> > +		dev_err(leds_dev->dev, "LED timer ctrl reg write failed(%d)\n",
> > +			rc);
> > +		return rc;
> > +	}
> > +
> > +	/* Set clamp current */
> > +	rc = qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_CLAMP_CURR,
> > +				     QCOM_FLASH_CURRENT_MASK,
> > +				     qcom_flash_current_to_reg(QCOM_FLASH_DEFAULT_CLAMP));
> > +	if (rc)
> > +		dev_err(leds_dev->dev, "Clamp current reg write failed(%d)\n",
> > +			rc);
> > +
> > +	return rc;
> > +}
> > +
> > +static int qcom_flash_setup_led(struct qcom_flash_config *cfg,
> > +				struct qcom_flash_led *led,
> > +				enum qcom_flash_ids id,
> > +				struct device_node *node)
> > +{
> > +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> > +	struct led_classdev *led_cdev = &led->fled_cdev.led_cdev;
> > +	int rc;
> > +
> > +	rc = qcom_flash_setup_fled(cfg, led, id);
> > +	if (rc)
> > +		return rc;
> > +
> > +	rc = qcom_flash_setup_flcdev(cfg, led, node);
> > +	if (rc)
> > +		return rc;
> > +
> > +	/* configure default state */
> > +	if (!led->default_on) {
> > +		led_cdev->brightness = LED_OFF;
> > +	} else {
> > +		led_cdev->brightness = led_cdev->max_brightness;
> > +		mutex_lock(&leds_dev->lock);
> > +		rc = qcom_flash_torch_on(led);
> > +		mutex_unlock(&leds_dev->lock);
> > +		if (rc)
> > +			return rc;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int qcom_flash_setup_leds_device(struct qcom_flash_device *leds_dev,
> > +					struct qcom_flash_config *cfg,
> > +					struct device *dev)
> > +{
> > +	int rc;
> > +
> > +	leds_dev->dev = dev;
> > +
> > +	leds_dev->base = cfg->base;
> > +	leds_dev->num_leds = cfg->num_leds;
> > +
> > +	leds_dev->regmap = dev_get_regmap(dev->parent, NULL);
> > +	if (!leds_dev->regmap) {
> > +		dev_err(dev, "Failure getting regmap\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	rc = qcom_flash_setup_regs(leds_dev);
> > +	if (rc)
> > +		return rc;
> > +
> > +	rc = qcom_flash_read_reg(leds_dev, QCOM_FLASH_ADDR_PERIPHERAL_SUBTYPE,
> > +				 &leds_dev->peripheral_subtype);
> > +	if (rc) {
> > +		dev_err(dev, "Unable to read from addr=%x, rc(%d)\n",
> > +			QCOM_FLASH_ADDR_PERIPHERAL_SUBTYPE, rc);
> > +		return rc;
> > +	}
> > +
> > +	leds_dev->flash_supply = cfg->flash_supply;
> > +
> > +	if (leds_dev->peripheral_subtype == QCOM_FLASH_SUBTYPE_DUAL) {
> > +		leds_dev->torch_supply = cfg->torch_supply;
> > +		leds_dev->torch_enable_cmd = QCOM_FLASH_ENABLE_MODULE;
> > +	} else {
> > +		leds_dev->torch_enable_cmd = QCOM_FLASH_ENABLE_ALL;
> > +	}
> > +
> > +	mutex_init(&leds_dev->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static int qcom_flash_parse_dt(struct device *dev,
> > +			       struct qcom_flash_config *cfg,
> > +			       struct device_node *sub_nodes[])
> > +{
> > +	struct device_node *node = dev->of_node;
> > +	struct device_node *child_node;
> > +	const char *temp_string;
> > +	int rc, parsed_leds = 0;
> > +	u32 val;
> > +
> > +	rc = of_property_read_u32(node, "reg", &val);
> > +	if (rc < 0) {
> > +		dev_err(dev, "Failure reading reg, rc = %d\n", rc);
> > +		return rc;
> > +	}
> > +	cfg->base = val;
> > +
> > +	cfg->flash_supply = devm_regulator_get(dev, "flash-boost");
> > +	cfg->torch_supply = devm_regulator_get(dev, "torch-boost");
> > +
> > +	for_each_available_child_of_node(node, child_node) {
> > +		/* LED properties */
> > +
> > +		rc = of_property_read_u32(child_node, "reg",
> > +					  &cfg->id[parsed_leds]);
> > +		if (rc) {
> > +			dev_err(dev, "Failure reading led id, rc =  %d\n", rc);
> > +			of_node_put(child_node);
> > +			return rc;
> > +		}
> > +
> > +		/* Assume LED IDs are ordered in DT for simplicity */
> 
> You need to mention this requirement in DT bindings, but I am not sure
> if DT child nodes parsing order is guaranteed to be top-down.

Ok, I'll take a look at the documentation for the DT bindings if there's any
clue on that, and check what other drivers normally do. I did that just because
it's simpler, but I guess I could use a linked list for the nodes instead of an
array, or maybe even simpler, have an array for the LED IDs read, so we can
remove this restriction.

Thanks,
N�colas

> 
> > +		if (cfg->id[parsed_leds] != parsed_leds) {
> > +			dev_err(dev, "Unordered LED nodes in DT\n");
> > +			of_node_put(child_node);
> > +			return -EINVAL;
> > +		}
> > +
> > +		sub_nodes[parsed_leds] = child_node;
> > +
> > +		rc = of_property_read_string(child_node, "default-state",
> > +					     &temp_string);
> > +		if (!rc) {
> > +			if (strncmp(temp_string, "on", sizeof("on")) == 0)
> > +				cfg->default_on[parsed_leds] = true;
> > +		} else if (rc != -EINVAL) {
> > +			dev_err(dev,
> > +				"Failure reading default-state, rc =  %d\n",
> > +				rc);
> > +			of_node_put(child_node);
> > +			return rc;
> > +		}
> > +
> > +		/* FLED properties */
> > +
> > +		rc = of_property_read_u32(child_node, "led-max-microamp",
> > +					  &cfg->led_max_brightness[parsed_leds]);
> > +		if (rc < 0) {
> > +			dev_err(dev, "Failure reading max_current, rc =  %d\n",
> > +				rc);
> > +			of_node_put(child_node);
> > +			return rc;
> > +		}
> > +
> > +		rc = of_property_read_u32(child_node, "flash-max-microamp",
> > +					  &cfg->flash_max_brightness[parsed_leds]);
> > +		if (rc < 0) {
> > +			dev_err(dev, "Failure reading max_current, rc =  %d\n",
> > +				rc);
> > +			of_node_put(child_node);
> > +			return rc;
> > +		}
> > +
> > +		rc = of_property_read_u32(child_node, "flash-max-timeout-us",
> > +					  &cfg->flash_max_timeout[parsed_leds]);
> > +		if (rc < 0) {
> > +			dev_err(dev, "Failure reading max_timeout, rc =  %d\n",
> > +				rc);
> > +			of_node_put(child_node);
> > +			return rc;
> > +		}
> > +
> > +		parsed_leds++;
> > +		if (parsed_leds >= 2) {
> > +			of_node_put(child_node);
> > +			break;
> > +		}
> > +	}
> > +	cfg->num_leds = parsed_leds;
> > +
> > +	return 0;
> > +}
> > +
> > +static int qcom_flash_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct qcom_flash_device *leds_dev;
> > +	struct qcom_flash_config cfg = { 0 };
> > +	struct device_node *sub_nodes[2];
> > +	unsigned int i;
> > +	int rc;
> > +
> > +	leds_dev = devm_kzalloc(dev, sizeof(*leds_dev), GFP_KERNEL);
> > +	if (!leds_dev)
> > +		return -ENOMEM;
> > +
> > +	rc = qcom_flash_parse_dt(dev, &cfg, sub_nodes);
> > +	if (rc)
> > +		return rc;
> > +
> > +	rc = qcom_flash_setup_leds_device(leds_dev, &cfg, dev);
> > +	if (rc)
> > +		return rc;
> > +
> > +	for (i = 0; i < leds_dev->num_leds; i++) {
> > +		rc = qcom_flash_setup_led(&cfg, &leds_dev->leds[i], i,
> > +					  sub_nodes[i]);
> > +		if (rc)
> > +			return rc;
> > +	}
> > +
> > +	platform_set_drvdata(pdev, leds_dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int qcom_flash_remove(struct platform_device *pdev)
> > +{
> > +	struct qcom_flash_device *leds_dev = platform_get_drvdata(pdev);
> > +
> > +	mutex_destroy(&leds_dev->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id qcom_flash_spmi_of_match[] = {
> > +	{ .compatible = "qcom,spmi-flash-leds" },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, qcom_flash_spmi_of_match);
> > +
> > +static struct platform_driver qcom_flash_driver = {
> > +	.driver		= {
> > +		.name	= "qcom,spmi-flash-leds",
> > +		.of_match_table = qcom_flash_spmi_of_match,
> > +	},
> > +	.probe		= qcom_flash_probe,
> > +	.remove		= qcom_flash_remove,
> > +};
> > +module_platform_driver(qcom_flash_driver);
> > +
> > +MODULE_DESCRIPTION("Qualcomm SPMI Flash LED driver");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_AUTHOR("N�colas F. R. A. Prado <n@nfraprado.net>");
> > 
> 
> -- 
> Best regards,
> Jacek Anaszewski
