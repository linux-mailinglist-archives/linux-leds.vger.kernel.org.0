Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF9A25E8AA
	for <lists+linux-leds@lfdr.de>; Sat,  5 Sep 2020 17:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgIEPYx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 5 Sep 2020 11:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgIEPYv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 5 Sep 2020 11:24:51 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FCDDC061244;
        Sat,  5 Sep 2020 08:24:50 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id j34so467109pgi.7;
        Sat, 05 Sep 2020 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O7Pw+WuFBfGI/zTCib7kodJQiNW2K4u30lpoQDGmodw=;
        b=n5kNT8ZkIoAFPXUH4Tdanaq/ilpNsYr6MaTZ7CFss3fQNmniJ+F2rFXrYClzHWm/zV
         bqX/BkbDmaiHsA7xqFOOdz1fswtkF61gHEzYXG/5QjTpBwzJ3S+ACMbMNXuf0kcCabR7
         H6cTV+PmFS/EoT8Ww4ooD5uutQlCesv5MLwuXMtUVXxod0Ll8ucPpLICv4gPomP92DX/
         +7NRODfVuArJhvLpV56vpSpwCym9b+ECfX6GZbQ/Mbrpw+DHhfaJjXr3OkKQFRHA0Czm
         KAn4c05BDdr6nAaYrtp3g5IcdUjZh7OovbHRCs2nt5WNU+7NKQutQgEFExhduGbIQNzU
         K+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=O7Pw+WuFBfGI/zTCib7kodJQiNW2K4u30lpoQDGmodw=;
        b=i7Y6k2C8Eq9rZenAdLMzKOY7yEJDX0RxP36NU5aRL5w4YovUgPhoXc37eZt6Ea0nLH
         c7SN6qV7/XLTIO8A2XZsyhihArl/3Pb+mFE2NdCbW8BoxH5tNwk7gawH3PS8Nh07G7ul
         QfTRL2vlMqgRaUdwmhMUDH8NMogM//V914YhinZ3Mf8VgiDOzK/rSD+DrOr1Fv+zR+S6
         +P/8LG+Pim59BjptLhsLY2yf2mdffSo3wR/HWLG14IWUsMAr5axjvMkGZjAX4ydyymxp
         r+DPQ4pvzbbAPhW2rbw6DAYwMFlGnZZemier4f8rf0cUXooIJOwxSfG/DXH+8nN+Hqfk
         NziA==
X-Gm-Message-State: AOAM532u9vvcwSXRteo/9oFz6J2ezwsohIzK3bZAB879c6cAMfqG4gPs
        o70KaGSIOEk7deTy3rMAnN4=
X-Google-Smtp-Source: ABdhPJwnPN9O+hDPqs2mSdQQ4WJrrM9GD/IFa1bCgHiEInVg7aD34EEoYwrP7gu2HQnD7eaQ3LBFiQ==
X-Received: by 2002:a63:1356:: with SMTP id 22mr10312867pgt.108.1599319489426;
        Sat, 05 Sep 2020 08:24:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j9sm9951037pfe.170.2020.09.05.08.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 08:24:48 -0700 (PDT)
Subject: Re: [PATCH 3/7] drivers: hwmon: Add the iEi WT61P803 PUZZLE HWMON
 driver
To:     Luka Kovacic <luka.kovacic@sartura.hr>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, andrew@lunn.ch,
        jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr
References: <20200905130336.967622-1-luka.kovacic@sartura.hr>
 <20200905130336.967622-4-luka.kovacic@sartura.hr>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1eb5273b-35cb-bae8-9d73-6e7b25fd8b65@roeck-us.net>
Date:   Sat, 5 Sep 2020 08:24:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905130336.967622-4-luka.kovacic@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/5/20 6:03 AM, Luka Kovacic wrote:
> Add the iEi WT61P803 PUZZLE HWMON driver, that handles the fan speed
> control via PWM, reading fan speed and reading on-board temperature
> sensors.
> 
> The driver registers a HWMON device and a simple thermal cooling device to
> enable in-kernel fan management.
> 
> This driver depends on the iEi WT61P803 PUZZLE MFD driver.
> 
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>

New hwmon drivers should use the [devm_]hwmon_device_register_with_info() API.

Guenter

> ---
>  drivers/hwmon/Kconfig                     |   8 +
>  drivers/hwmon/Makefile                    |   1 +
>  drivers/hwmon/iei-wt61p803-puzzle-hwmon.c | 613 ++++++++++++++++++++++
>  3 files changed, 622 insertions(+)
>  create mode 100644 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 8dc28b26916e..ff279df9bf40 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -722,6 +722,14 @@ config SENSORS_IBMPOWERNV
>  	  This driver can also be built as a module. If so, the module
>  	  will be called ibmpowernv.
>  
> +config SENSORS_IEI_WT61P803_PUZZLE_HWMON
> +	tristate "iEi WT61P803 PUZZLE MFD HWMON Driver"
> +	depends on MFD_IEI_WT61P803_PUZZLE
> +	help
> +	  The iEi WT61P803 PUZZLE MFD HWMON Driver handles reading fan speed
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
> index 000000000000..ca26d0cc6884
> --- /dev/null
> +++ b/drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
> @@ -0,0 +1,613 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* iEi WT61P803 PUZZLE MCU HWMON Driver
> + *
> + * Copyright (C) 2020 Sartura Ltd.
> + * Author: Luka Kovacic <luka.kovacic@sartura.hr>
> + */
> +
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/iei-wt61p803-puzzle.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/math64.h>
> +#include <linux/err.h>
> +
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/thermal.h>
> +
> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_TEMP_NUM 2
> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_FAN_NUM 5
> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM 2
> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_VAL 255
> +
> +/**
> + * struct iei_wt61p803_puzzle_thermal_cooling_device - Thermal cooling device instance
> + *
> + * @mcu_hwmon: MCU HWMON struct pointer
> + * @tcdev: Thermal cooling device pointer
> + * @name: Thermal cooling device name
> + * @pwm_channel: PWM channel (0 or 1)
> + * @cooling_levels: Thermal cooling device cooling levels
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
> + *
> + * @mcu: MCU struct pointer
> + * @temp_lock: Mutex for temp_sensor_val
> + * @temp_sensor_val: Temperature sensor values
> + * @fan_lock: Mutex for fan_speed_val
> + * @fan_speed_val: FAN speed (RPM) values
> + * @pwm_lock: Mutex for pwm_val
> + * @pwm_val: PWM values (0-255)
> + * @thermal_cooling_dev_lock: Mutex for Thermal Framework related members
> + * @thermal_cooling_dev_present: Per-channel thermal cooling device control
> + * @cdev: Per-channel thermal cooling device private structure
> + */
> +struct iei_wt61p803_puzzle_hwmon {
> +	struct iei_wt61p803_puzzle *mcu;
> +
> +	struct mutex temp_lock;
> +	int temp_sensor_val[IEI_WT61P803_PUZZLE_HWMON_MAX_TEMP_NUM];
> +
> +	struct mutex fan_lock;
> +	int fan_speed_val[IEI_WT61P803_PUZZLE_HWMON_MAX_FAN_NUM];
> +
> +	struct mutex pwm_lock;
> +	int pwm_val[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
> +
> +	struct mutex thermal_cooling_dev_lock;
> +	bool thermal_cooling_dev_present[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
> +	struct iei_wt61p803_puzzle_thermal_cooling_device
> +		*cdev[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
> +};
> +
> +/*
> + * Generic MCU access functions
> + *
> + * Description: The functions below are used as generic translation functions
> + * between the kernel and the MCU hardware. These can be used from HWMON or
> + * from the Thermal Framework.
> + */
> +
> +#define raw_temp_to_milidegree_celsius(x) ((int)((x - 0x80)*1000))
> +static int iei_wt61p803_puzzle_read_temp_sensor
> +(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon, int channel, int *value)
> +{
> +	int ret;
> +	size_t reply_size = 0;
> +	unsigned char *resp_buf;
> +
> +	/* MCU Command: Retrieve all available NTC values */
> +	unsigned char temp_sensor_ntc_cmd[4] = { '@', 'T', 'A' };
> +
> +	if (channel > 1 && channel < 0)
> +		return -EINVAL;
> +
> +	resp_buf = kmalloc(IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
> +	if (!resp_buf)
> +		return -ENOMEM;
> +
> +	/* Write the command to the MCU */
> +	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu,
> +			temp_sensor_ntc_cmd, sizeof(temp_sensor_ntc_cmd),
> +			resp_buf, &reply_size);
> +	if (!ret) {
> +		/* Check the number of NTC values (should be 0x32/'2') */
> +		if (resp_buf[3] == 0x32) {
> +			mutex_lock(&mcu_hwmon->temp_lock);
> +
> +			/* Write values to the struct */
> +			mcu_hwmon->temp_sensor_val[0] =
> +				raw_temp_to_milidegree_celsius(resp_buf[4]);
> +			mcu_hwmon->temp_sensor_val[1] =
> +				raw_temp_to_milidegree_celsius(resp_buf[5]);
> +
> +			mutex_unlock(&mcu_hwmon->temp_lock);
> +		}
> +
> +	}
> +
> +	kfree(resp_buf);
> +
> +	mutex_lock(&mcu_hwmon->temp_lock);
> +	*value = mcu_hwmon->temp_sensor_val[channel];
> +	mutex_unlock(&mcu_hwmon->temp_lock);
> +
> +	return ret;
> +}
> +
> +#define raw_fan_val_to_rpm(x, y) ((int)(((x)<<8|(y))/2)*60)
> +static int iei_wt61p803_puzzle_read_fan_speed
> +(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon, int channel, int *value)
> +{
> +	int ret;
> +	size_t reply_size = 0;
> +	unsigned char *resp_buf;
> +
> +	/* MCU Command: Retrieve fan speed value */
> +	unsigned char fan_speed_cmd[4] = { '@', 'F', 'A' };
> +
> +	resp_buf = kmalloc(IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
> +	if (!resp_buf)
> +		return -ENOMEM;
> +
> +	switch (channel) {
> +	case 0:
> +		fan_speed_cmd[2] = 'A';
> +		break;
> +	case 1:
> +		fan_speed_cmd[2] = 'B';
> +		break;
> +	case 2:
> +		fan_speed_cmd[2] = 'C';
> +		break;
> +	case 3:
> +		fan_speed_cmd[2] = 'D';
> +		break;
> +	case 4:
> +		fan_speed_cmd[2] = 'E';
> +		break;
> +	default:
> +		kfree(resp_buf);
> +		return -EINVAL;
> +	}
> +
> +	/* Write the command to the MCU */
> +	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, fan_speed_cmd,
> +			sizeof(fan_speed_cmd), resp_buf, &reply_size);
> +	if (!ret) {
> +		mutex_lock(&mcu_hwmon->fan_lock);
> +
> +		/* Calculate fan RPM */
> +		mcu_hwmon->fan_speed_val[channel] = raw_fan_val_to_rpm(resp_buf[3],
> +				resp_buf[4]);
> +
> +		mutex_unlock(&mcu_hwmon->fan_lock);
> +	}
> +
> +	kfree(resp_buf);
> +
> +	mutex_lock(&mcu_hwmon->fan_lock);
> +	*value = mcu_hwmon->fan_speed_val[channel];
> +	mutex_unlock(&mcu_hwmon->fan_lock);
> +
> +	return 0;
> +}
> +
> +static int iei_wt61p803_puzzle_write_pwm_channel
> +(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon, int channel, long pwm_set_val)
> +{
> +	int ret;
> +	size_t reply_size = 0;
> +	unsigned char *resp_buf;
> +
> +	/* MCU Command: Set PWM value (Default channel is 0/0x30 at index 3) */
> +	unsigned char pwm_set_cmd[6] = { '@', 'F', 'W', 0x30, 0x00 };
> +
> +	resp_buf = kmalloc(IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
> +	if (!resp_buf)
> +		return -ENOMEM;
> +
> +	/* Determine the PWM channel */
> +	switch (channel) {
> +	case 0:
> +		pwm_set_cmd[3] = 0x30;
> +		break;
> +	case 1:
> +		pwm_set_cmd[3] = 0x31;
> +		break;
> +	default:
> +		kfree(resp_buf);
> +		return -EINVAL;
> +	}
> +
> +	if (pwm_set_val < 0 || pwm_set_val > IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_VAL) {
> +		kfree(resp_buf);
> +		return -EINVAL;
> +	}
> +
> +	/* Add the value to the command */
> +	pwm_set_cmd[4] = (char)pwm_set_val;
> +
> +	/* Write the command to the MCU */
> +	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, pwm_set_cmd,
> +			sizeof(pwm_set_cmd), resp_buf, &reply_size);
> +	if (!ret) {
> +		/* Store the PWM value */
> +		if (resp_buf[0] == '@' && resp_buf[1] == 0x30) {
> +			mutex_lock(&mcu_hwmon->pwm_lock);
> +			mcu_hwmon->pwm_val[channel] = (int)pwm_set_val;
> +			mutex_unlock(&mcu_hwmon->pwm_lock);
> +		}
> +	}
> +
> +	kfree(resp_buf);
> +	return 0;
> +}
> +
> +static int iei_wt61p803_puzzle_read_pwm_channel
> +(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon, int channel, int *value)
> +{
> +	int ret;
> +	size_t reply_size = 0;
> +	unsigned char *resp_buf;
> +
> +	/* MCU Command: Retrieve PWM value (Default channel: 0x30 at idx 3) */
> +	unsigned char pwm_get_cmd[5] = { '@', 'F', 'Z', 0x30 };
> +
> +	resp_buf = kmalloc(IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
> +	if (!resp_buf)
> +		return -ENOMEM;
> +
> +	/* Determine the PWM channel */
> +	switch (channel) {
> +	case 0:
> +		pwm_get_cmd[3] = 0x30;
> +		break;
> +	case 1:
> +		pwm_get_cmd[3] = 0x31;
> +		break;
> +	default:
> +		kfree(resp_buf);
> +		return -EINVAL;
> +	}
> +
> +	/* Write the command to the MCU */
> +	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, pwm_get_cmd,
> +			sizeof(pwm_get_cmd), resp_buf, &reply_size);
> +	if (!ret) {
> +		/* Store the PWM value */
> +		if (resp_buf[2] == 'Z') {
> +			mutex_lock(&mcu_hwmon->pwm_lock);
> +			mcu_hwmon->pwm_val[channel] = (int)resp_buf[3];
> +			mutex_unlock(&mcu_hwmon->pwm_lock);
> +		}
> +	}
> +
> +	kfree(resp_buf);
> +
> +	mutex_lock(&mcu_hwmon->pwm_lock);
> +	*value = mcu_hwmon->pwm_val[channel];
> +	mutex_unlock(&mcu_hwmon->pwm_lock);
> +
> +	return 0;
> +}
> +
> +/*
> + * HWMON attributes
> + *
> + * Description: The attributes below are registered with the HWMON subsystem.
> + * Fans can only be controlled, if they are not controlled by the Thermal
> + * Framework.
> + */
> +
> +static ssize_t temp_input_show(struct device *dev,
> +			struct device_attribute *attr, char *buf)
> +{
> +	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon =
> +		dev_get_drvdata(dev->parent);
> +	struct sensor_device_attribute *sensor_dev_attr =
> +		to_sensor_dev_attr(attr);
> +	int nr = sensor_dev_attr->index;
> +
> +	int ret, value;
> +
> +	ret = iei_wt61p803_puzzle_read_temp_sensor(mcu_hwmon, nr, &value);
> +	if (ret)
> +		return ret;
> +
> +	return sprintf(buf, "%d\n", value);
> +}
> +
> +static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_input, 0);
> +static SENSOR_DEVICE_ATTR_RO(temp2_input, temp_input, 1);
> +
> +static ssize_t fan_input_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon =
> +		dev_get_drvdata(dev->parent);
> +	struct sensor_device_attribute *sensor_dev_attr =
> +		to_sensor_dev_attr(attr);
> +	int nr = sensor_dev_attr->index;
> +
> +	int ret, value;
> +
> +	ret = iei_wt61p803_puzzle_read_fan_speed(mcu_hwmon, nr, &value);
> +	if (ret)
> +		return ret;
> +
> +	return sprintf(buf, "%d\n", value);
> +}
> +
> +static SENSOR_DEVICE_ATTR_RO(fan1_input, fan_input, 0);
> +static SENSOR_DEVICE_ATTR_RO(fan2_input, fan_input, 1);
> +static SENSOR_DEVICE_ATTR_RO(fan3_input, fan_input, 2);
> +static SENSOR_DEVICE_ATTR_RO(fan4_input, fan_input, 3);
> +static SENSOR_DEVICE_ATTR_RO(fan5_input, fan_input, 4);
> +
> +static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
> +			const char *buf, size_t count)
> +{
> +	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon =
> +		dev_get_drvdata(dev->parent);
> +	struct sensor_device_attribute *sensor_dev_attr =
> +		to_sensor_dev_attr(attr);
> +	int nr = sensor_dev_attr->index;
> +
> +	int ret;
> +	long pwm_value;
> +
> +	if (mcu_hwmon->thermal_cooling_dev_present[nr]) {
> +		/*
> +		 * The Thermal Framework has already claimed this specific PWM
> +		 * channel. Return 0, to indicate 0 bytes written.
> +		 */
> +
> +		return 0;
> +	}
> +
> +	/* Convert the string to a long */
> +	ret = kstrtol(buf, 10, &pwm_value);
> +	if (ret)
> +		return ret;
> +
> +	ret = iei_wt61p803_puzzle_write_pwm_channel(mcu_hwmon, nr, pwm_value);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t pwm_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon =
> +		dev_get_drvdata(dev->parent);
> +	struct sensor_device_attribute *sensor_dev_attr =
> +		to_sensor_dev_attr(attr);
> +	int nr = sensor_dev_attr->index;
> +
> +	int ret, value;
> +
> +	ret = iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon, nr, &value);
> +	if (ret)
> +		return ret;
> +
> +	return sprintf(buf, "%d\n", value);
> +}
> +
> +static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
> +static SENSOR_DEVICE_ATTR_RW(pwm2, pwm, 1);
> +
> +static struct attribute *iei_wt61p803_puzzle_attributes_temp[] = {
> +	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	&sensor_dev_attr_temp2_input.dev_attr.attr,
> +	NULL
> +};
> +
> +static struct attribute *iei_wt61p803_puzzle_attributes_fan[] = {
> +	&sensor_dev_attr_fan1_input.dev_attr.attr,
> +	&sensor_dev_attr_fan2_input.dev_attr.attr,
> +	&sensor_dev_attr_fan3_input.dev_attr.attr,
> +	&sensor_dev_attr_fan4_input.dev_attr.attr,
> +	&sensor_dev_attr_fan5_input.dev_attr.attr,
> +	NULL
> +};
> +
> +static struct attribute *iei_wt61p803_puzzle_attributes_pwm[] = {
> +	&sensor_dev_attr_pwm1.dev_attr.attr,
> +	&sensor_dev_attr_pwm2.dev_attr.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group iei_wt61p803_puzzle_group_temp = {
> +	.attrs = iei_wt61p803_puzzle_attributes_temp
> +};
> +
> +static const struct attribute_group iei_wt61p803_puzzle_group_fan = {
> +	.attrs = iei_wt61p803_puzzle_attributes_fan
> +};
> +
> +static const struct attribute_group iei_wt61p803_puzzle_group_pwm = {
> +	.attrs = iei_wt61p803_puzzle_attributes_pwm
> +};
> +
> +static const struct attribute_group *iei_wt61p803_puzzle_attr_groups[] = {
> +	&iei_wt61p803_puzzle_group_temp,
> +	&iei_wt61p803_puzzle_group_fan,
> +	&iei_wt61p803_puzzle_group_pwm,
> +	NULL
> +};
> +
> +/*
> + * Thermal cooling device
> + *
> + * Description: The functions below are thermal cooling device ops, registered
> + * with the Thermal Framework.
> + */
> +
> +static int iei_wt61p803_puzzle_get_max_state
> +(struct thermal_cooling_device *tcdev, unsigned long *state)
> +{
> +	*state = IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_VAL;
> +
> +	return 0;
> +}
> +
> +static int iei_wt61p803_puzzle_get_cur_state
> +(struct thermal_cooling_device *tcdev, unsigned long *state)
> +{
> +	struct iei_wt61p803_puzzle_thermal_cooling_device *cdev = tcdev->devdata;
> +	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = cdev->mcu_hwmon;
> +
> +	int ret, value;
> +
> +	if (!mcu_hwmon)
> +		return -EINVAL;
> +
> +	ret = iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon,
> +			cdev->pwm_channel, &value);
> +	if (ret)
> +		return ret;
> +
> +	*state = (unsigned long)value;
> +
> +	return 0;
> +}
> +
> +static int iei_wt61p803_puzzle_set_cur_state
> +(struct thermal_cooling_device *tcdev, unsigned long state)
> +{
> +	struct iei_wt61p803_puzzle_thermal_cooling_device *cdev = tcdev->devdata;
> +	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = cdev->mcu_hwmon;
> +
> +	if (!mcu_hwmon)
> +		return -EINVAL;
> +
> +	return iei_wt61p803_puzzle_write_pwm_channel(mcu_hwmon,
> +			cdev->pwm_channel, state);
> +}
> +
> +static const struct thermal_cooling_device_ops iei_wt61p803_puzzle_cooling_ops = {
> +	.get_max_state = iei_wt61p803_puzzle_get_max_state,
> +	.get_cur_state = iei_wt61p803_puzzle_get_cur_state,
> +	.set_cur_state = iei_wt61p803_puzzle_set_cur_state,
> +};
> +
> +/*
> + * Driver setup
> + */
> +
> +static int iei_wt61p803_puzzle_enable_thermal_cooling_dev
> +(struct device *dev, struct device_node *child, struct iei_wt61p803_puzzle_hwmon *mcu_hwmon)
> +{
> +	u32 pwm_channel;
> +	int ret, num_levels;
> +
> +	struct iei_wt61p803_puzzle_thermal_cooling_device *cdev;
> +
> +	ret = of_property_read_u32(child, "reg", &pwm_channel);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&mcu_hwmon->thermal_cooling_dev_lock);
> +	mcu_hwmon->thermal_cooling_dev_present[pwm_channel] = true;
> +	mutex_unlock(&mcu_hwmon->thermal_cooling_dev_lock);
> +
> +	num_levels = of_property_count_u8_elems(child, "cooling-levels");
> +	if (num_levels > 0) {
> +		cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> +		if (!cdev)
> +			return -ENOMEM;
> +
> +		cdev->cooling_levels = devm_kzalloc(dev, num_levels, GFP_KERNEL);
> +		if (!cdev->cooling_levels)
> +			return -ENOMEM;
> +
> +		ret = of_property_read_u8_array(child, "cooling-levels",
> +				cdev->cooling_levels, num_levels);
> +		if (ret) {
> +			dev_err(dev, "Couldn't read property 'cooling-levels'");
> +			return ret;
> +		}
> +
> +		snprintf(cdev->name, THERMAL_NAME_LENGTH, "iei_wt61p803_puzzle_%d", pwm_channel);
> +
> +		cdev->tcdev = devm_thermal_of_cooling_device_register(dev, child,
> +				cdev->name, cdev, &iei_wt61p803_puzzle_cooling_ops);
> +		if (IS_ERR(cdev->tcdev))
> +			return PTR_ERR(cdev->tcdev);
> +
> +		cdev->mcu_hwmon = mcu_hwmon;
> +		cdev->pwm_channel = pwm_channel;
> +
> +		mutex_lock(&mcu_hwmon->thermal_cooling_dev_lock);
> +		mcu_hwmon->cdev[pwm_channel] = cdev;
> +		mutex_unlock(&mcu_hwmon->thermal_cooling_dev_lock);
> +	}
> +	return 0;
> +}
> +
> +static int iei_wt61p803_puzzle_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *child;
> +
> +	/* iEi WT61P803 PUZZLE HWMON priv struct */
> +	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon;
> +
> +	/* iEi WT61P803 PUZZLE MCU Core driver */
> +	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev->parent);
> +
> +	struct device *hwmon_dev;
> +
> +	int ret;
> +
> +	mcu_hwmon = devm_kzalloc(dev, sizeof(*mcu_hwmon), GFP_KERNEL);
> +	if (!mcu_hwmon)
> +		return -ENOMEM;
> +
> +	/* Set reference to the parent 'core' MFD driver */
> +	mcu_hwmon->mcu = mcu;
> +
> +	/* Initialize the mutex members */
> +	mutex_init(&mcu_hwmon->temp_lock);
> +	mutex_init(&mcu_hwmon->fan_lock);
> +	mutex_init(&mcu_hwmon->pwm_lock);
> +	mutex_init(&mcu_hwmon->thermal_cooling_dev_lock);
> +
> +	platform_set_drvdata(pdev, mcu_hwmon);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
> +					"iei_wt61p803_puzzle",
> +					mcu_hwmon,
> +					iei_wt61p803_puzzle_attr_groups);
> +
> +	/* Control fans via PWM lines via Linux Kernel */
> +	if (IS_ENABLED(CONFIG_THERMAL)) {
> +		for_each_child_of_node(dev->of_node, child) {
> +			ret = iei_wt61p803_puzzle_enable_thermal_cooling_dev(dev, child, mcu_hwmon);
> +			if (ret) {
> +				dev_err(dev, "Enabling the PWM fan failed\n");
> +				of_node_put(child);
> +				return ret;
> +			}
> +		}
> +	}
> +
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
> +MODULE_DESCRIPTION("iEi WT61P803 PUZZLE MCU HWMON Driver");
> +MODULE_AUTHOR("Luka Kovacic <luka.kovacic@sartura.hr>");
> +MODULE_LICENSE("GPL");
> 

