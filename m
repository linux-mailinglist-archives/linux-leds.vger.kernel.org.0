Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE1EB28AAB9
	for <lists+linux-leds@lfdr.de>; Sun, 11 Oct 2020 23:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387543AbgJKV0y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 11 Oct 2020 17:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387413AbgJKV0y (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 11 Oct 2020 17:26:54 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C10C0613CE;
        Sun, 11 Oct 2020 14:26:53 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id n61so14051264ota.10;
        Sun, 11 Oct 2020 14:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ClQKRsfb4P3n/LKcU9EHMArBjfC1Fl43ankWeBEXQ24=;
        b=XvLuio9K3zui624CgDNtj28mD/DcnyZjNruBTFh9s4siu6mVCiTGEwUyaTdFMdB3WN
         oPiThdvfk6JF7tEDGH+J5zUp0C8NP+2Yz6szuf+/42ds14ec+U679z9TRl+FvfHg//qP
         /TZbgANgDBj2zguq6bmm0j6cFibCMSJm3Cvtu6YSgCKb90iohZX5yDjGnrdNCF8zWipK
         vrVth8G+X1eftb892GPzqpAcmKQvfX8ZpP1S+5vB5PBj8jRlbCSU8kg765pWP0fCEo7H
         5svFuSfsKhMe8/gOImEd+v4db3yABFT+hyfKfMqhNswRhhu/u/620zkqEcFA/OSa9xbg
         31Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ClQKRsfb4P3n/LKcU9EHMArBjfC1Fl43ankWeBEXQ24=;
        b=AaqEuO2eAdq0HWHQScDK6Iohdks4YyH7PUjtlEW766N31b0Y3jZyAy2nXyNEft2Iqo
         nCVLY9przRDUW41iN66FlHpOAISN23nrlmkALAhFH0j194E/Evz0/t0a70G2op6hY6Eo
         kng5is1DnszzxcwlaCwxVZ5hx5PpGfZINwKFMCjeDInOEnk4O1XKI7vriTUer3JALMuI
         ZIzwhIB7EdneIJEo5NkXiPtH7S+oMKSb1O5mNKmdOvbFlwRL7tjbpdLdUTq4O1mHoFud
         B1ZKTMsxAIASiVUbqJXH6oAPiZVtM00WRlzWT5kUQ+0YC04HtZ/ORVP82wDfRMpSlB5W
         YNiA==
X-Gm-Message-State: AOAM531XaAz3tZK5wCLmVkZ2B428qZKE9pR64WSoxPlaf6JJpRk9ucWu
        dug6Cp83JaVrusWTDp8Bav0=
X-Google-Smtp-Source: ABdhPJx4MlbuysvCwRlp4V5tkyZ6iQeJeEK6btLFhj5x2LThQsQub2rO9hDqke3hWJ21QF4Xn8ZRlQ==
X-Received: by 2002:a9d:d01:: with SMTP id 1mr6739642oti.16.1602451613123;
        Sun, 11 Oct 2020 14:26:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w64sm9218877oig.31.2020.10.11.14.26.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Oct 2020 14:26:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 11 Oct 2020 14:26:51 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, lee.jones@linaro.org, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org, jdelvare@suse.com,
        marek.behun@nic.cz, luka.perkov@sartura.hr, robert.marko@sartura.hr
Subject: Re: [PATCH v4 3/6] drivers: hwmon: Add the iEi WT61P803 PUZZLE HWMON
 driver
Message-ID: <20201011212651.GA94919@roeck-us.net>
References: <20201007004901.39859-1-luka.kovacic@sartura.hr>
 <20201007004901.39859-4-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007004901.39859-4-luka.kovacic@sartura.hr>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Oct 07, 2020 at 02:48:58AM +0200, Luka Kovacic wrote:
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
> Cc: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/hwmon/Kconfig                     |   8 +
>  drivers/hwmon/Makefile                    |   1 +
>  drivers/hwmon/iei-wt61p803-puzzle-hwmon.c | 457 ++++++++++++++++++++++
>  3 files changed, 466 insertions(+)
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
> index 000000000000..be7b019d126c
> --- /dev/null
> +++ b/drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
> @@ -0,0 +1,457 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* iEi WT61P803 PUZZLE MCU HWMON Driver
> + *
> + * Copyright (C) 2020 Sartura Ltd.
> + * Author: Luka Kovacic <luka.kovacic@sartura.hr>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/hwmon-sysfs.h>
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
> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_TEMP_NUM 2
> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_FAN_NUM 5
> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM 2
> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_VAL 255
> +
> +/**
> + * struct iei_wt61p803_puzzle_thermal_cooling_device - Thermal cooling device instance
> + *
> + * @mcu_hwmon:		MCU HWMON struct pointer
> + * @tcdev:		Thermal cooling device pointer
> + * @name:		Thermal cooling device name
> + * @pwm_channel:	PWM channel (0 or 1)
> + * @cooling_levels:	Thermal cooling device cooling levels
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
> + * @mcu:				MCU struct pointer
> + * @response_buffer			Global MCU response buffer allocation
> + * @thermal_cooling_dev_present:	Per-channel thermal cooling device control
> + * @cdev:				Per-channel thermal cooling device private structure
> + */
> +struct iei_wt61p803_puzzle_hwmon {
> +	struct iei_wt61p803_puzzle *mcu;
> +	unsigned char *response_buffer;
> +	bool thermal_cooling_dev_present[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
> +	struct iei_wt61p803_puzzle_thermal_cooling_device
> +		*cdev[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
> +};
> +
> +#define raw_temp_to_milidegree_celsius(x) ((int)(((x) - 0x80) * 1000))
> +static int iei_wt61p803_puzzle_read_temp_sensor(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon,
> +						int channel, int *value)
> +{
> +	unsigned char *resp_buf = mcu_hwmon->response_buffer;
> +	unsigned char temp_sensor_ntc_cmd[4] = {

static ?

> +		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> +		IEI_WT61P803_PUZZLE_CMD_TEMP,
> +		IEI_WT61P803_PUZZLE_CMD_TEMP_ALL
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
> +	/* Check the number of NTC values (should be 0x32/'2') */
> +	if (resp_buf[3] != 0x32)
> +		return -EIO;
> +
> +	*value = raw_temp_to_milidegree_celsius(resp_buf[4 + channel]);
> +
> +	return 0;
> +}
> +
> +#define raw_fan_val_to_rpm(x, y) ((int)(((x) << 8 | (y)) / 2) * 60)
> +static int iei_wt61p803_puzzle_read_fan_speed
> +(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon, int channel, int *value)
> +{
> +	unsigned char *resp_buf = mcu_hwmon->response_buffer;
> +	static const u8 fan_speed_cmds[] = {
> +		IEI_WT61P803_PUZZLE_CMD_FAN_RPM_0,
> +		IEI_WT61P803_PUZZLE_CMD_FAN_RPM_1,
> +		IEI_WT61P803_PUZZLE_CMD_FAN_RPM_2,
> +		IEI_WT61P803_PUZZLE_CMD_FAN_RPM_3,
> +		IEI_WT61P803_PUZZLE_CMD_FAN_RPM_4
> +	};
> +	unsigned char fan_speed_cmd[4] = {
> +		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> +		IEI_WT61P803_PUZZLE_CMD_FAN,
> +		IEI_WT61P803_PUZZLE_CMD_FAN_RPM_0

This is unconditionally overwritten below.

> +	};
> +	size_t reply_size = 0;
> +	int ret;
> +
> +	fan_speed_cmd[2] = fan_speed_cmds[channel];
> +
> +	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, fan_speed_cmd,
> +						sizeof(fan_speed_cmd), resp_buf,
> +						&reply_size);
> +	if (ret)
> +		return ret;
> +
> +	*value = raw_fan_val_to_rpm(resp_buf[3], resp_buf[4]);
> +
> +	return 0;
> +}
> +
> +static int iei_wt61p803_puzzle_write_pwm_channel
> +(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon, int channel, long pwm_set_val)
> +{
> +	unsigned char *resp_buf = mcu_hwmon->response_buffer;
> +	static const u8 pwm_set_cmds[] = {
> +		IEI_WT61P803_PUZZLE_CMD_FAN_PWM_0,
> +		IEI_WT61P803_PUZZLE_CMD_FAN_PWM_1
> +	};
> +	unsigned char pwm_set_cmd[6] = {
> +		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> +		IEI_WT61P803_PUZZLE_CMD_FAN,
> +		IEI_WT61P803_PUZZLE_CMD_FAN_PWM_WRITE,
> +		IEI_WT61P803_PUZZLE_CMD_FAN_PWM_0,

Another unconditional overwrite.

> +		0x00

As is this, and more below. Guess it is on purpose, but I don't
see the point.

> +	};
> +	size_t reply_size = 0;
> +	int ret;
> +
> +	pwm_set_cmd[3] = pwm_set_cmds[channel];
> +
> +	/* Add the PWM value to the command */
> +	pwm_set_cmd[4] = (unsigned char)pwm_set_val;
> +
> +	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, pwm_set_cmd,
> +						sizeof(pwm_set_cmd), resp_buf,
> +						&reply_size);
> +	if (ret)
> +		return ret;
> +
> +	/* Store the PWM value */
> +	if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
> +	      resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
> +	      resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int iei_wt61p803_puzzle_read_pwm_channel
> +(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon, int channel, int *value)

I am sure I mentioned before that I don't like those odd follow-up line
indentations.

> +{
> +	unsigned char *resp_buf = mcu_hwmon->response_buffer;
> +	static const u8 pwm_get_cmds[] = {
> +		IEI_WT61P803_PUZZLE_CMD_FAN_PWM_0,
> +		IEI_WT61P803_PUZZLE_CMD_FAN_PWM_1
> +	};
> +	unsigned char pwm_get_cmd[5] = {
> +		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> +		IEI_WT61P803_PUZZLE_CMD_FAN,
> +		IEI_WT61P803_PUZZLE_CMD_FAN_PWM_READ,
> +		IEI_WT61P803_PUZZLE_CMD_FAN_PWM_0
> +	};
> +	size_t reply_size = 0;
> +	int ret;
> +
> +	pwm_get_cmd[3] = pwm_get_cmds[channel];
> +
> +	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, pwm_get_cmd,
> +						sizeof(pwm_get_cmd), resp_buf,
> +						&reply_size);
> +	if (ret)
> +		return ret;
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
> +	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon =
> +		dev_get_drvdata(dev->parent);
> +	int ret, value;
> +
> +	switch (type) {
> +	case hwmon_pwm:
> +		if (attr != hwmon_pwm_input)
> +			return -ENODEV;

Those are all unnecessary tests, and -ENODEV is wrong.

> +		ret = iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon, channel, &value);
> +		if (ret)
> +			return ret;
> +		*val = (long)value;

Unnecessary type cast. The return value of this function is _always_
type casted, which really doesn't make sense.

> +		return ret;
> +	case hwmon_fan:
> +		if (attr != hwmon_fan_input)
> +			return -ENODEV;
> +		ret = iei_wt61p803_puzzle_read_fan_speed(mcu_hwmon, channel, &value);
> +		if (ret)
> +			return ret;
> +		*val = (long)value;
> +		return ret;
> +	case hwmon_temp:
> +		if (attr != hwmon_temp_input)
> +			return -ENODEV;
> +		ret = iei_wt61p803_puzzle_read_temp_sensor(mcu_hwmon, channel, &value);
> +		if (ret)
> +			return ret;
> +		*val = (long)value;

Hmm, seems like you like type casts. Ok, I'll want to see an explanation
for each of those: Explain why the function argument is an int *, and
explain why the it is necessary to type cast the result here.

> +		return ret;
> +	default:
> +		return -ENODEV;
> +	}
> +}
> +
> +static int iei_wt61p803_puzzle_write(struct device *dev, enum hwmon_sensor_types type,
> +				     u32 attr, int channel, long val)
> +{
> +	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon =
> +		dev_get_drvdata(dev->parent);
> +
> +	if (attr != hwmon_pwm_input)
> +		return -ENODEV;
> +	if (mcu_hwmon->thermal_cooling_dev_present[channel]) {
> +		/*
> +		 * The Thermal Framework has already claimed this specific PWM
> +		 * channel.

... and if it did, this code won't be called. I am sure I mentioned 
this before. If you insist keeping it, I'll want to see an explanation
here because I don't want to have to deal with follow-up patches removing
the unnecessary code.

> +		 */
> +		return -EBUSY;
> +	}
> +	return iei_wt61p803_puzzle_write_pwm_channel(mcu_hwmon, channel, val);
> +}
> +
> +static umode_t iei_wt61p803_puzzle_is_visible(const void *data, enum hwmon_sensor_types type,
> +					      u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			return 0644;
> +		default:
> +			return 0;
> +		}
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			return 0444;
> +		default:
> +			return 0;
> +		}
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			return 0444;
> +		default:
> +			return 0;
> +		}
> +	default:
> +		return 0;
> +	}
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
> +
> +	int ret, value;
> +
> +	if (!mcu_hwmon)
> +		return -EINVAL;

This check needs to be explained.

> +
> +	ret = iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon, cdev->pwm_channel, &value);
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
> +	return iei_wt61p803_puzzle_write_pwm_channel(mcu_hwmon, cdev->pwm_channel, state);
> +}
> +
> +static const struct thermal_cooling_device_ops iei_wt61p803_puzzle_cooling_ops = {
> +	.get_max_state = iei_wt61p803_puzzle_get_max_state,
> +	.get_cur_state = iei_wt61p803_puzzle_get_cur_state,
> +	.set_cur_state = iei_wt61p803_puzzle_set_cur_state,
> +};
> +
> +static int iei_wt61p803_puzzle_enable_thermal_cooling_dev
> +(struct device *dev, struct fwnode_handle *child, struct iei_wt61p803_puzzle_hwmon *mcu_hwmon)
> +{
> +	struct iei_wt61p803_puzzle_thermal_cooling_device *cdev;
> +	int ret, num_levels;
> +	u32 pwm_channel;
> +
> +	ret = fwnode_property_read_u32(child, "reg", &pwm_channel);
> +	if (ret)
> +		return ret;
> +
> +	mcu_hwmon->thermal_cooling_dev_present[pwm_channel] = true;
> +
> +	num_levels = fwnode_property_read_u8_array(child, "cooling-levels", NULL, 0);
> +	if (num_levels > 0) {
> +		cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> +		if (!cdev)
> +			return -ENOMEM;
> +
> +		cdev->cooling_levels = devm_kzalloc(dev, num_levels, GFP_KERNEL);
> +		if (!cdev->cooling_levels)
> +			return -ENOMEM;
> +
> +		ret = fwnode_property_read_u8_array(child, "cooling-levels",
> +						    cdev->cooling_levels,
> +						    num_levels);
> +		if (ret) {
> +			dev_err(dev, "Couldn't read property 'cooling-levels'");
> +			return ret;
> +		}
> +
> +		snprintf(cdev->name, THERMAL_NAME_LENGTH, "iei_wt61p803_puzzle_%d", pwm_channel);
> +
> +		cdev->tcdev = devm_thermal_of_cooling_device_register(dev, NULL,
> +				cdev->name, cdev, &iei_wt61p803_puzzle_cooling_ops);
> +		if (IS_ERR(cdev->tcdev))
> +			return PTR_ERR(cdev->tcdev);
> +
> +		cdev->mcu_hwmon = mcu_hwmon;
> +		cdev->pwm_channel = pwm_channel;
> +
> +		mcu_hwmon->cdev[pwm_channel] = cdev;
> +	}
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
> +MODULE_DESCRIPTION("iEi WT61P803 PUZZLE MCU HWMON Driver");
> +MODULE_AUTHOR("Luka Kovacic <luka.kovacic@sartura.hr>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.26.2
> 
