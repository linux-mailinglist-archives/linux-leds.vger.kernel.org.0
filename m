Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A1E2AAC49
	for <lists+linux-leds@lfdr.de>; Sun,  8 Nov 2020 17:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbgKHQvd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Nov 2020 11:51:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbgKHQvd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Nov 2020 11:51:33 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB55C0613CF;
        Sun,  8 Nov 2020 08:51:31 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id o25so6606453oie.5;
        Sun, 08 Nov 2020 08:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cbrcj8zvxkzgR5sftbmzSPSBf5fQW75mVseNM0dSY1Q=;
        b=lrJvgnsPkPgEfaZzHQLYQOzY/o2gTvskINC1HwodNL7nkZuJin7KkqHr8CkYG37M05
         UWvlrc1cUvsGaGUlNXGQqpIpxnfBbgzkvy3WhZeaRn9G8LzP6jsCvJFK0AVBpRpjESTR
         iCw1opqsnK93szs3WkRsNzYKbFr2T+nKZlljpcGvFLmMUOmqgJY+tsl0ehJHnhsUWHvj
         tKjjJVBAMoBn5XDmRKVqyAc2uxlNJJk6z/mRLohlwAHGUB1EFD8gZt79oN9odg3z2gHH
         1KEVa5T7hBFFSqPakQN780GnhOkjnCeOLymUpN5pyBvsKqK+zHL3XihDQhi5YfLS1d9E
         r6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=cbrcj8zvxkzgR5sftbmzSPSBf5fQW75mVseNM0dSY1Q=;
        b=KZjSSbSSCMWuytVGuqrqIBEffssbIpRKJqHZxfqFPMo2S8Al+adAOi0q4TN0wuBy6H
         i4t/xPcshwkmivjoYCeE+Sif8zF7ZcMMhUEYD5e7gKRRn+Baph0v71V9JhlhAa1K/znM
         V6RsnmpjkEn2cxRjmnkbEJ5YMcKpuGuYdyU8GWcINOTA+MPd93rXZQ1b3j63ssqwl1Xw
         g6gUPIeHSGTJnarAEhD+jOx0ol3wn/vJ2q3+Qlo5FqLU7gzJddgu2LPktlRLYAkd4i1U
         72B1PHjcujJmnha9RsWV958fHN2XPHobdZleKX6l7Gl8dkz8/O8ub0eDZz3uf50SVdNj
         cEAg==
X-Gm-Message-State: AOAM532DvcZsxERWXsdRm56MBhppI7ia2udI4WPwyb+KFGiviSEu9txG
        I9DveWnACTBzl26JNsAOn9w=
X-Google-Smtp-Source: ABdhPJz8N8T+4lny7fMeo0XDxJV0XZtgFYEpzcsTNmctuKgOCJcStq9se4KY8fHrhtu3ycq4ss0g9Q==
X-Received: by 2002:aca:b455:: with SMTP id d82mr6991478oif.127.1604854290755;
        Sun, 08 Nov 2020 08:51:30 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x83sm1824317oig.39.2020.11.08.08.51.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 08:51:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 8 Nov 2020 08:51:29 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, marek.behun@nic.cz,
        luka.perkov@sartura.hr, andy.shevchenko@gmail.com,
        robert.marko@sartura.hr
Subject: Re: [PATCH v7 3/6] drivers: hwmon: Add the IEI WT61P803 PUZZLE HWMON
 driver
Message-ID: <20201108165129.GA28458@roeck-us.net>
References: <20201025005916.64747-1-luka.kovacic@sartura.hr>
 <20201025005916.64747-4-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201025005916.64747-4-luka.kovacic@sartura.hr>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Oct 25, 2020 at 02:59:13AM +0200, Luka Kovacic wrote:
> Add the IEI WT61P803 PUZZLE HWMON driver, that handles the fan speed
> control via PWM, reading fan speed and reading on-board temperature
> sensors.
> 
> The driver registers a HWMON device and a simple thermal cooling device to
> enable in-kernel fan management.
> 
> This driver depends on the IEI WT61P803 PUZZLE MFD driver.
> 
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/hwmon/Kconfig                     |   8 +
>  drivers/hwmon/Makefile                    |   1 +
>  drivers/hwmon/iei-wt61p803-puzzle-hwmon.c | 412 ++++++++++++++++++++++

This requires documentation (Documentation/hwmon/iei-wt61p803-puzzle.rst).

>  3 files changed, 421 insertions(+)
>  create mode 100644 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 8dc28b26916e..e0469384af2a 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -722,6 +722,14 @@ config SENSORS_IBMPOWERNV
>  	  This driver can also be built as a module. If so, the module
>  	  will be called ibmpowernv.
>  
> +config SENSORS_IEI_WT61P803_PUZZLE_HWMON
> +	tristate "IEI WT61P803 PUZZLE MFD HWMON Driver"
> +	depends on MFD_IEI_WT61P803_PUZZLE
> +	help
> +	  The IEI WT61P803 PUZZLE MFD HWMON Driver handles reading fan speed
> +	  and writing fan PWM values. It also supports reading on-board
> +	  temperature sensors.
> +
>  config SENSORS_IIO_HWMON
>  	tristate "Hwmon driver that uses channels specified via iio maps"
>  	depends on IIO
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index a8f4b35b136b..b0afb2d6896f 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -83,6 +83,7 @@ obj-$(CONFIG_SENSORS_HIH6130)	+= hih6130.o
>  obj-$(CONFIG_SENSORS_ULTRA45)	+= ultra45_env.o
>  obj-$(CONFIG_SENSORS_I5500)	+= i5500_temp.o
>  obj-$(CONFIG_SENSORS_I5K_AMB)	+= i5k_amb.o
> +obj-$(CONFIG_SENSORS_IEI_WT61P803_PUZZLE_HWMON) += iei-wt61p803-puzzle-hwmon.o
>  obj-$(CONFIG_SENSORS_IBMAEM)	+= ibmaem.o
>  obj-$(CONFIG_SENSORS_IBMPEX)	+= ibmpex.o
>  obj-$(CONFIG_SENSORS_IBMPOWERNV)+= ibmpowernv.o
> diff --git a/drivers/hwmon/iei-wt61p803-puzzle-hwmon.c b/drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
> new file mode 100644
> index 000000000000..61b06c9e61df
> --- /dev/null
> +++ b/drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
> @@ -0,0 +1,412 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* IEI WT61P803 PUZZLE MCU HWMON Driver
> + *
> + * Copyright (C) 2020 Sartura Ltd.
> + * Author: Luka Kovacic <luka.kovacic@sartura.hr>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/hwmon-sysfs.h>

Unnecessary include.

> +#include <linux/hwmon.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/math64.h>
> +#include <linux/mfd/iei-wt61p803-puzzle.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/slab.h>
> +#include <linux/thermal.h>
> +
> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_TEMP	2
> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_FAN	5
> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_PWM	2
> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_VAL	255
> +
> +/**
> + * struct iei_wt61p803_puzzle_thermal_cooling_device - Thermal cooling device instance
> + * @mcu_hwmon:		Parent driver struct pointer
> + * @tcdev:		Thermal cooling device pointer
> + * @name:		Thermal cooling device name
> + * @pwm_channel:	Controlled PWM channel (0 or 1)
> + * @cooling_levels:	Thermal cooling device cooling levels (DT)
> + */
> +struct iei_wt61p803_puzzle_thermal_cooling_device {
> +	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon;
> +	struct thermal_cooling_device *tcdev;
> +	char name[THERMAL_NAME_LENGTH];
> +	int pwm_channel;
> +	u8 *cooling_levels;
> +};
> +
> +/**
> + * struct iei_wt61p803_puzzle_hwmon - MCU HWMON Driver
> + * @mcu:				MCU struct pointer
> + * @response_buffer			Global MCU response buffer allocation
> + * @thermal_cooling_dev_present:	Per-channel thermal cooling device control indicator
> + * @cdev:				Per-channel thermal cooling device private structure
> + */
> +struct iei_wt61p803_puzzle_hwmon {
> +	struct iei_wt61p803_puzzle *mcu;
> +	unsigned char *response_buffer;
> +	bool thermal_cooling_dev_present[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM];
> +	struct iei_wt61p803_puzzle_thermal_cooling_device
> +		*cdev[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM];
> +};
> +
> +#define raw_temp_to_milidegree_celsius(x) (((x) - 0x80) * 1000)
> +static int iei_wt61p803_puzzle_read_temp_sensor(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon,
> +						int channel, long *value)
> +{
> +	unsigned char *resp_buf = mcu_hwmon->response_buffer;
> +	static unsigned char temp_sensor_ntc_cmd[4] = {
> +		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> +		IEI_WT61P803_PUZZLE_CMD_TEMP,
> +		IEI_WT61P803_PUZZLE_CMD_TEMP_ALL,
> +	};
> +	size_t reply_size = 0;
> +	int ret;
> +
> +	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, temp_sensor_ntc_cmd,
> +						sizeof(temp_sensor_ntc_cmd), resp_buf,
> +						&reply_size);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (reply_size != 7)
> +		return -EIO;
> +
> +	/* Check the number of NTC values */
> +	if (resp_buf[3] != '2')
> +		return -EIO;

resp_buf always points to mcu_hwmon->response_buffer, yet the use of that buffer is
not mutex protected. This will result in race conditions all over the place
if there is more than one reader/writer.

Guenter

> +
> +	*value = raw_temp_to_milidegree_celsius(resp_buf[4 + channel]);
> +
> +	return 0;
> +}
> +
> +#define raw_fan_val_to_rpm(x, y) ((((x) << 8 | (y)) / 2) * 60)
> +static int iei_wt61p803_puzzle_read_fan_speed(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon,
> +					      int channel, long *value)
> +{
> +	unsigned char *resp_buf = mcu_hwmon->response_buffer;
> +	unsigned char fan_speed_cmd[4] = {};
> +	size_t reply_size = 0;
> +	int ret;
> +
> +	fan_speed_cmd[0] = IEI_WT61P803_PUZZLE_CMD_HEADER_START;
> +	fan_speed_cmd[1] = IEI_WT61P803_PUZZLE_CMD_FAN;
> +	fan_speed_cmd[2] = IEI_WT61P803_PUZZLE_CMD_FAN_RPM(channel);
> +
> +	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, fan_speed_cmd,
> +						sizeof(fan_speed_cmd), resp_buf,
> +						&reply_size);
> +	if (ret)
> +		return ret;
> +
> +	if (reply_size != 7)
> +		return -EIO;
> +
> +	*value = raw_fan_val_to_rpm(resp_buf[3], resp_buf[4]);
> +
> +	return 0;
> +}
> +
> +static int iei_wt61p803_puzzle_write_pwm_channel(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon,
> +						 int channel, long pwm_set_val)
> +{
> +	unsigned char *resp_buf = mcu_hwmon->response_buffer;
> +	unsigned char pwm_set_cmd[6] = {};
> +	size_t reply_size = 0;
> +	int ret;
> +
> +	pwm_set_cmd[0] = IEI_WT61P803_PUZZLE_CMD_HEADER_START;
> +	pwm_set_cmd[1] = IEI_WT61P803_PUZZLE_CMD_FAN;
> +	pwm_set_cmd[2] = IEI_WT61P803_PUZZLE_CMD_FAN_PWM_WRITE;
> +	pwm_set_cmd[3] = IEI_WT61P803_PUZZLE_CMD_FAN_PWM(channel);
> +	pwm_set_cmd[4] = (unsigned char)pwm_set_val;
> +
> +	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, pwm_set_cmd,
> +						sizeof(pwm_set_cmd), resp_buf,
> +						&reply_size);
> +	if (ret)
> +		return ret;
> +
> +	if (reply_size != 3)
> +		return -EIO;
> +
> +	if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
> +	      resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
> +	      resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int iei_wt61p803_puzzle_read_pwm_channel(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon,
> +						int channel, long *value)
> +{
> +	unsigned char *resp_buf = mcu_hwmon->response_buffer;
> +	unsigned char pwm_get_cmd[5] = {};
> +	size_t reply_size = 0;
> +	int ret;
> +
> +	pwm_get_cmd[0] = IEI_WT61P803_PUZZLE_CMD_HEADER_START;
> +	pwm_get_cmd[1] = IEI_WT61P803_PUZZLE_CMD_FAN;
> +	pwm_get_cmd[2] = IEI_WT61P803_PUZZLE_CMD_FAN_PWM_READ;
> +	pwm_get_cmd[3] = IEI_WT61P803_PUZZLE_CMD_FAN_PWM(channel);
> +
> +	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, pwm_get_cmd,
> +						sizeof(pwm_get_cmd), resp_buf,
> +						&reply_size);
> +	if (ret)
> +		return ret;
> +
> +	if (reply_size != 5)
> +		return -EIO;
> +
> +	if (resp_buf[2] != IEI_WT61P803_PUZZLE_CMD_FAN_PWM_READ)
> +		return -EIO;
> +
> +	*value = resp_buf[3];
> +
> +	return 0;
> +}
> +
> +static int iei_wt61p803_puzzle_read(struct device *dev, enum hwmon_sensor_types type,
> +				    u32 attr, int channel, long *val)
> +{
> +	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = dev_get_drvdata(dev->parent);
> +
> +	switch (type) {
> +	case hwmon_pwm:
> +		return iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon, channel, val);
> +	case hwmon_fan:
> +		return iei_wt61p803_puzzle_read_fan_speed(mcu_hwmon, channel, val);
> +	case hwmon_temp:
> +		return iei_wt61p803_puzzle_read_temp_sensor(mcu_hwmon, channel, val);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int iei_wt61p803_puzzle_write(struct device *dev, enum hwmon_sensor_types type,
> +				     u32 attr, int channel, long val)
> +{
> +	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = dev_get_drvdata(dev->parent);
> +
> +	if (attr != hwmon_pwm_input)
> +		return -EINVAL;

This check is unnecesary.

> +	if (mcu_hwmon->thermal_cooling_dev_present[channel]) {
> +		/*
> +		 * The Thermal Framework has already claimed this specific PWM
> +		 * channel.
> +		 */
> +		return -EBUSY;
> +	}

The sensor should not be marked as writeable in this case.
iei_wt61p803_puzzle_is_visible() should check for the condition and
mark the affected attribute(s) read-only.

> +	return iei_wt61p803_puzzle_write_pwm_channel(mcu_hwmon, channel, val);
> +}
> +
> +static umode_t iei_wt61p803_puzzle_is_visible(const void *data, enum hwmon_sensor_types type,
> +					      u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_pwm:
> +		if (attr == hwmon_pwm_input)
> +			return 0644;
> +		break;
> +	case hwmon_fan:
> +		if (attr == hwmon_fan_input)
> +			return 0444;
> +		break;
> +	case hwmon_temp:
> +		if (attr == hwmon_temp_input)
> +			return 0444;
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops iei_wt61p803_puzzle_hwmon_ops = {
> +	.is_visible = iei_wt61p803_puzzle_is_visible,
> +	.read = iei_wt61p803_puzzle_read,
> +	.write = iei_wt61p803_puzzle_write,
> +};
> +
> +static const struct hwmon_channel_info *iei_wt61p803_puzzle_info[] = {
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT),
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info iei_wt61p803_puzzle_chip_info = {
> +	.ops = &iei_wt61p803_puzzle_hwmon_ops,
> +	.info = iei_wt61p803_puzzle_info,
> +};
> +
> +static int iei_wt61p803_puzzle_get_max_state(struct thermal_cooling_device *tcdev,
> +					     unsigned long *state)
> +{
> +	*state = IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_VAL;
> +
> +	return 0;
> +}
> +
> +static int iei_wt61p803_puzzle_get_cur_state(struct thermal_cooling_device *tcdev,
> +					     unsigned long *state)
> +{
> +	struct iei_wt61p803_puzzle_thermal_cooling_device *cdev = tcdev->devdata;
> +	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = cdev->mcu_hwmon;
> +	long value;
> +	int ret;
> +
> +	ret = iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon, cdev->pwm_channel, &value);
> +	if (ret)
> +		return ret;
> +
> +	*state = value;
> +
> +	return 0;
> +}
> +
> +static int iei_wt61p803_puzzle_set_cur_state(struct thermal_cooling_device *tcdev,
> +					     unsigned long state)
> +{
> +	struct iei_wt61p803_puzzle_thermal_cooling_device *cdev = tcdev->devdata;
> +	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = cdev->mcu_hwmon;
> +
> +	return iei_wt61p803_puzzle_write_pwm_channel(mcu_hwmon, cdev->pwm_channel, state);
> +}
> +
> +static const struct thermal_cooling_device_ops iei_wt61p803_puzzle_cooling_ops = {
> +	.get_max_state = iei_wt61p803_puzzle_get_max_state,
> +	.get_cur_state = iei_wt61p803_puzzle_get_cur_state,
> +	.set_cur_state = iei_wt61p803_puzzle_set_cur_state,
> +};
> +
> +static int iei_wt61p803_puzzle_enable_thermal_cooling_dev(struct device *dev,
> +						struct fwnode_handle *child,
> +						struct iei_wt61p803_puzzle_hwmon *mcu_hwmon)
> +{
> +	struct iei_wt61p803_puzzle_thermal_cooling_device *cdev;
> +	u32 pwm_channel;
> +	u8 num_levels;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(child, "reg", &pwm_channel);
> +	if (ret)
> +		return ret;
> +
> +	mcu_hwmon->thermal_cooling_dev_present[pwm_channel] = true;
> +
> +	num_levels = fwnode_property_count_u8(child, "cooling-levels");
> +	if (!num_levels)
> +		return -EINVAL;
> +
> +	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> +	if (!cdev)
> +		return -ENOMEM;
> +
> +	cdev->cooling_levels = devm_kmalloc_array(dev, num_levels, sizeof(u8), GFP_KERNEL);
> +	if (!cdev->cooling_levels)
> +		return -ENOMEM;
> +
> +	ret = fwnode_property_read_u8_array(child, "cooling-levels",
> +					    cdev->cooling_levels,
> +					    num_levels);
> +	if (ret) {
> +		dev_err(dev, "Couldn't read property 'cooling-levels'");
> +		return ret;
> +	}
> +
> +	snprintf(cdev->name, THERMAL_NAME_LENGTH, "iei_wt61p803_puzzle_%d", pwm_channel);
> +
> +	cdev->tcdev = devm_thermal_of_cooling_device_register(dev, NULL, cdev->name, cdev,
> +							      &iei_wt61p803_puzzle_cooling_ops);
> +	if (IS_ERR(cdev->tcdev))
> +		return PTR_ERR(cdev->tcdev);
> +
> +	cdev->mcu_hwmon = mcu_hwmon;
> +	cdev->pwm_channel = pwm_channel;
> +
> +	mcu_hwmon->cdev[pwm_channel] = cdev;
> +
> +	return 0;
> +}
> +
> +static int iei_wt61p803_puzzle_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev->parent);
> +	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon;
> +	struct fwnode_handle *child;
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	mcu_hwmon = devm_kzalloc(dev, sizeof(*mcu_hwmon), GFP_KERNEL);
> +	if (!mcu_hwmon)
> +		return -ENOMEM;
> +
> +	mcu_hwmon->response_buffer = devm_kzalloc(dev, IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
> +	if (!mcu_hwmon->response_buffer)
> +		return -ENOMEM;
> +
> +	mcu_hwmon->mcu = mcu;
> +	platform_set_drvdata(pdev, mcu_hwmon);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, "iei_wt61p803_puzzle",
> +							 mcu_hwmon,
> +							 &iei_wt61p803_puzzle_chip_info,
> +							 NULL);
> +
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	/* Control fans via PWM lines via Linux Kernel */
> +	if (IS_ENABLED(CONFIG_THERMAL)) {
> +		device_for_each_child_node(dev, child) {
> +			ret = iei_wt61p803_puzzle_enable_thermal_cooling_dev(dev, child, mcu_hwmon);
> +			if (ret) {
> +				dev_err(dev, "Enabling the PWM fan failed\n");
> +				fwnode_handle_put(child);
> +				return ret;
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +
> +static const struct of_device_id iei_wt61p803_puzzle_hwmon_id_table[] = {
> +	{ .compatible = "iei,wt61p803-puzzle-hwmon" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, iei_wt61p803_puzzle_hwmon_id_table);
> +
> +static struct platform_driver iei_wt61p803_puzzle_hwmon_driver = {
> +	.driver = {
> +		.name = "iei-wt61p803-puzzle-hwmon",
> +		.of_match_table = iei_wt61p803_puzzle_hwmon_id_table,
> +	},
> +	.probe = iei_wt61p803_puzzle_hwmon_probe,
> +};
> +
> +module_platform_driver(iei_wt61p803_puzzle_hwmon_driver);
> +
> +MODULE_DESCRIPTION("IEI WT61P803 PUZZLE MCU HWMON Driver");
> +MODULE_AUTHOR("Luka Kovacic <luka.kovacic@sartura.hr>");
> +MODULE_LICENSE("GPL");
