Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3FA414704
	for <lists+linux-leds@lfdr.de>; Wed, 22 Sep 2021 12:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235158AbhIVK43 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Sep 2021 06:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235149AbhIVK42 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Sep 2021 06:56:28 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C91CC061760
        for <linux-leds@vger.kernel.org>; Wed, 22 Sep 2021 03:54:58 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id q26so5445300wrc.7
        for <linux-leds@vger.kernel.org>; Wed, 22 Sep 2021 03:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ebiBzgbUbTeEsJGmVZNDF4EzJm6KxEJGiJhHQ0MPxs4=;
        b=R8HrJLsuT2EZhTuns5k8dugLne13ODiaSPaBgAVnq3VGT+uxvj2qc/0zBK8ct84pzL
         NiK8gHqCbq7uNyL9O98ikRgAZEYl7sd4g3mGKYlgl1obzBDXmE3vTdNHBC8iyO5V3bSL
         zS7anao8bo3ls7Pci7aMQvL4CeIjxcKpaiG9ZXlCgJtGyZLn6gm0L+e7Q43B4eLiuz2J
         8Ekf19HfynvAQREBkbC7vjkjQCWBM38T53snKz1StgVqh8Cw3XpFozHsTBE5eHfHqFEl
         irl1ExRRZwBebkeDwdPHTBbCUuVC0hSYMiNjACznnvWtc3mdVjCmksH84oQZisHL9hxu
         GkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ebiBzgbUbTeEsJGmVZNDF4EzJm6KxEJGiJhHQ0MPxs4=;
        b=rWhCOw1R+hiQ5aovRECQk3C7lRoMwhx965AeaiB5oBUtscTadSwG6n2Ww/JTiu0xg2
         X3hH0lpa6D0Tdpee1O1L/nTEqLmY0Y2UqntsFtkyMF2lROdbM4klAe4OyVwiPfTplsVR
         +4kciFB/IykFJbG14OnFq3v3bIqXImyo6Ceehb1T2OPTwD3tA1Rn6G8y0be8heT+n5os
         tqEYq8I5PqBesiql/GN25F+Hj984wjT4njSAUh0ap264MRXLQ3tg1H0GooEx2cI3sSfK
         p/M7mGfHW4JrBI5s1htdbti7VFznZ3tb5dBOHSYL9SgrhEK3eGD8hCr9cH12HZ+oakLy
         5hkQ==
X-Gm-Message-State: AOAM531bXqOK9mvT0Ou0VfVxgD5j28PbSYQV6xV6N47kaYuDUFHlW4tv
        tliMXtCw/WlR9W7mw2RVlw1Ilw==
X-Google-Smtp-Source: ABdhPJzwDkCvZgi0pDdEsa1//aDwmudh0YshSMCqqLurh05NxI4GXpywpEg2w3zQjILeG0lgwO9gWA==
X-Received: by 2002:a05:600c:3b89:: with SMTP id n9mr9836580wms.186.1632308096316;
        Wed, 22 Sep 2021 03:54:56 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id 61sm1816433wrl.94.2021.09.22.03.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 03:54:55 -0700 (PDT)
Date:   Wed, 22 Sep 2021 11:54:53 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, pavo.banicevic@sartura.hr,
        corbet@lwn.net, pavel@ucw.cz, robh+dt@kernel.org,
        linux@roeck-us.net, jdelvare@suse.com, goran.medic@sartura.hr,
        luka.perkov@sartura.hr, robert.marko@sartura.hr
Subject: Re: [PATCH v9 2/7] drivers: mfd: Add a driver for IEI WT61P803
 PUZZLE MCU
Message-ID: <YUsLfZrnX2hq4FGV@google.com>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
 <20210824124438.14519-3-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210824124438.14519-3-luka.kovacic@sartura.hr>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Greg,

Would you be kind enough to take a look at the SYS imp. please?

I've marked the start with:

###########################################
###########################################


On Tue, 24 Aug 2021, Luka Kovacic wrote:
> Add a driver for the IEI WT61P803 PUZZLE microcontroller, used in some
> IEI Puzzle series devices. The microcontroller controls system power,
> temperature sensors, fans and LEDs.
> 
> This driver implements the core functionality for device communication
> over the system serial (serdev bus). It handles MCU messages and the
> internal MCU properties. Some properties can be managed over sysfs.
> 
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Signed-off-by: Pavo Banicevic <pavo.banicevic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/mfd/Kconfig                     |   8 +
>  drivers/mfd/Makefile                    |   1 +
>  drivers/mfd/iei-wt61p803-puzzle.c       | 908 ++++++++++++++++++++++++
>  include/linux/mfd/iei-wt61p803-puzzle.h |  66 ++
>  4 files changed, 983 insertions(+)
>  create mode 100644 drivers/mfd/iei-wt61p803-puzzle.c
>  create mode 100644 include/linux/mfd/iei-wt61p803-puzzle.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6a3fd2d75f96..c2183eb0775f 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2170,6 +2170,14 @@ config SGI_MFD_IOC3
>  	  If you have an SGI Origin, Octane, or a PCI IOC3 card,
>  	  then say Y. Otherwise say N.
>  
> +config MFD_IEI_WT61P803_PUZZLE
> +	tristate "IEI WT61P803 PUZZLE MCU driver"
> +	depends on SERIAL_DEV_BUS
> +	help
> +	  IEI WT61P803 PUZZLE is a system power management microcontroller
> +	  used for fan control, temperature sensor reading, LED control
> +	  and system identification.
> +
>  config MFD_INTEL_M10_BMC
>  	tristate "Intel MAX 10 Board Management Controller"
>  	depends on SPI_MASTER
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 8116c19d5fd4..42b9767ec37a 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -236,6 +236,7 @@ obj-$(CONFIG_MFD_DLN2)		+= dln2.o
>  obj-$(CONFIG_MFD_RT4831)	+= rt4831.o
>  obj-$(CONFIG_MFD_RT5033)	+= rt5033.o
>  obj-$(CONFIG_MFD_SKY81452)	+= sky81452.o
> +obj-$(CONFIG_MFD_IEI_WT61P803_PUZZLE)	+= iei-wt61p803-puzzle.o
>  
>  intel-soc-pmic-objs		:= intel_soc_pmic_core.o intel_soc_pmic_crc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC)	+= intel-soc-pmic.o
> diff --git a/drivers/mfd/iei-wt61p803-puzzle.c b/drivers/mfd/iei-wt61p803-puzzle.c
> new file mode 100644
> index 000000000000..596ecbc65627
> --- /dev/null
> +++ b/drivers/mfd/iei-wt61p803-puzzle.c
> @@ -0,0 +1,908 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* IEI WT61P803 PUZZLE MCU Driver

This breaks coding standard conventions.

top line should be empty.

Place a '\n' below it too please.

> + * System management microcontroller for fan control, temperature sensor reading,
> + * LED control and system identification on IEI Puzzle series ARM-based appliances.
> + *
> + * Copyright (C) 2020 Sartura Ltd.
> + * Author: Luka Kovacic <luka.kovacic@sartura.hr>
> + */
> +
> +#include <linux/atomic.h>
> +#include <linux/delay.h>
> +#include <linux/export.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/iei-wt61p803-puzzle.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/property.h>
> +#include <linux/sched.h>
> +#include <linux/serdev.h>
> +#include <linux/slab.h>
> +#include <linux/sysfs.h>
> +#include <asm/unaligned.h>

Are you 100% sure all of these are in use?

> +/* start, payload and XOR checksum at end */
> +#define IEI_WT61P803_PUZZLE_MAX_COMMAND_LENGTH	(1 + 20 + 1)
> +#define IEI_WT61P803_PUZZLE_RESP_BUF_SIZE	512
> +
> +#define IEI_WT61P803_PUZZLE_MAC_LENGTH			17
> +#define IEI_WT61P803_PUZZLE_SN_LENGTH			36
> +#define IEI_WT61P803_PUZZLE_VERSION_LENGTH		 6
> +#define IEI_WT61P803_PUZZLE_BUILD_INFO_LENGTH		16
> +#define IEI_WT61P803_PUZZLE_PROTOCOL_VERSION_LENGTH	 8
> +#define IEI_WT61P803_PUZZLE_NB_MAC			 8
> +
> +/* Use HZ as a timeout value throughout the driver */
> +#define IEI_WT61P803_PUZZLE_GENERAL_TIMEOUT HZ
> +
> +enum iei_wt61p803_puzzle_attribute_type {
> +	IEI_WT61P803_PUZZLE_VERSION,
> +	IEI_WT61P803_PUZZLE_BUILD_INFO,
> +	IEI_WT61P803_PUZZLE_BOOTLOADER_MODE,
> +	IEI_WT61P803_PUZZLE_PROTOCOL_VERSION,
> +	IEI_WT61P803_PUZZLE_SERIAL_NUMBER,
> +	IEI_WT61P803_PUZZLE_MAC_ADDRESS,
> +	IEI_WT61P803_PUZZLE_AC_RECOVERY_STATUS,
> +	IEI_WT61P803_PUZZLE_POWER_LOSS_RECOVERY,
> +	IEI_WT61P803_PUZZLE_POWER_STATUS,
> +};
> +
> +struct iei_wt61p803_puzzle_device_attribute {
> +	struct device_attribute dev_attr;
> +	enum iei_wt61p803_puzzle_attribute_type type;
> +	u8 index;
> +};

Kernel-doc?

> +/**
> + * struct iei_wt61p803_puzzle_mcu_status - MCU flags state
> + * @ac_recovery_status_flag:	AC Recovery Status Flag
> + * @power_loss_recovery:	System recovery after power loss
> + * @power_status:		System Power-on Method
> + */
> +struct iei_wt61p803_puzzle_mcu_status {
> +	u8 ac_recovery_status_flag;
> +	u8 power_loss_recovery;
> +	u8 power_status;
> +};
> +
> +/**
> + * struct iei_wt61p803_puzzle_reply - MCU reply
> + * @size:	Size of the MCU reply
> + * @data:	Full MCU reply buffer
> + * @state:	Current state of the packet
> + * @received:	Was the response fullfilled
> + */
> +struct iei_wt61p803_puzzle_reply {
> +	size_t size;
> +	unsigned char data[IEI_WT61P803_PUZZLE_RESP_BUF_SIZE];
> +	struct completion received;
> +};
> +
> +/**
> + * struct iei_wt61p803_puzzle_mcu_version - MCU version status
> + * @version:		Primary firmware version
> + * @build_info:		Build date and time
> + * @bootloader_mode:	Status of the MCU operation
> + * @protocol_version:	MCU communication protocol version
> + * @serial_number:	Device factory serial number
> + * @mac_address:	Device factory MAC addresses
> + *
> + * Last element of arrays is reserved for '\0'.
> + */
> +struct iei_wt61p803_puzzle_mcu_version {
> +	char version[IEI_WT61P803_PUZZLE_VERSION_LENGTH + 1];
> +	char build_info[IEI_WT61P803_PUZZLE_BUILD_INFO_LENGTH + 1];
> +	bool bootloader_mode;
> +	char protocol_version[IEI_WT61P803_PUZZLE_PROTOCOL_VERSION_LENGTH + 1];
> +	char serial_number[IEI_WT61P803_PUZZLE_SN_LENGTH + 1];
> +	char mac_address[IEI_WT61P803_PUZZLE_NB_MAC][IEI_WT61P803_PUZZLE_MAC_LENGTH + 1];
> +};
> +
> +/**
> + * struct iei_wt61p803_puzzle - IEI WT61P803 PUZZLE MCU Driver
> + * @serdev:		Pointer to underlying serdev device
> + * @dev:		Pointer to underlying dev device
> + * @reply_lock:		Reply mutex lock
> + * @reply:		Pointer to the iei_wt61p803_puzzle_reply struct
> + * @version:		MCU version related data
> + * @status:		MCU status related data
> + * @response_buffer	Command response buffer allocation
> + * @lock		General member mutex lock
> + */
> +struct iei_wt61p803_puzzle {
> +	struct serdev_device *serdev;
> +	struct device *dev;
> +	struct mutex reply_lock; /* lock to prevent multiple firmware calls */
> +	struct iei_wt61p803_puzzle_reply *reply;
> +	struct iei_wt61p803_puzzle_mcu_version version;
> +	struct iei_wt61p803_puzzle_mcu_status status;
> +	unsigned char response_buffer[IEI_WT61P803_PUZZLE_BUF_SIZE];
> +	struct mutex lock; /* lock to protect response buffer */
> +};
> +
> +static unsigned char iei_wt61p803_puzzle_checksum(unsigned char *buf, size_t len)
> +{
> +	unsigned char checksum = 0;
> +	size_t i;
> +
> +	for (i = 0; i < len; i++)
> +		checksum ^= buf[i];
> +	return checksum;
> +}

Are you sure there isn't a generic implementation you can use?

> +static int iei_wt61p803_puzzle_process_resp(struct iei_wt61p803_puzzle *mcu,
> +					    const unsigned char *raw_resp_data, size_t size)
> +{
> +	unsigned char checksum;
> +
> +	/* Check the incoming frame header */
> +	if (!(raw_resp_data[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START ||
> +	      raw_resp_data[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START_OTHER ||
> +	     (raw_resp_data[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_EEPROM &&
> +	      raw_resp_data[1] == IEI_WT61P803_PUZZLE_CMD_EEPROM_READ))) {
> +		if (mcu->reply->size + size >= sizeof(mcu->reply->data))
> +			return -EIO;
> +
> +		/* Append the frame to existing data */
> +		memcpy(mcu->reply->data + mcu->reply->size, raw_resp_data, size);
> +		mcu->reply->size += size;
> +	} else {
> +		if (size >= sizeof(mcu->reply->data))
> +			return -EIO;
> +
> +		/* Start processing a new frame */
> +		memcpy(mcu->reply->data, raw_resp_data, size);
> +		mcu->reply->size = size;
> +	}
> +
> +	checksum = iei_wt61p803_puzzle_checksum(mcu->reply->data, mcu->reply->size - 1);
> +	if (checksum != mcu->reply->data[mcu->reply->size - 1]) {
> +		/* The checksum isn't matched yet, wait for new frames */
> +		return size;
> +	}
> +
> +	/* Received all the data */
> +	complete(&mcu->reply->received);
> +
> +	return size;
> +}
> +
> +static int iei_wt61p803_puzzle_recv_buf(struct serdev_device *serdev,
> +					const unsigned char *data, size_t size)
> +{
> +	struct iei_wt61p803_puzzle *mcu = serdev_device_get_drvdata(serdev);
> +	int ret;
> +
> +	ret = iei_wt61p803_puzzle_process_resp(mcu, data, size);
> +	/* Return the number of processed bytes if function returns error,
> +	 * discard the remaining incoming data, since the frame this data
> +	 * belongs to is broken anyway
> +	 */

Place this comment above the function call please.

And fix all of your comments to conform to the kernel Coding Standard.

> +	if (ret < 0)
> +		return size;
> +
> +	return ret;
> +}
> +
> +static const struct serdev_device_ops iei_wt61p803_puzzle_serdev_device_ops = {
> +	.receive_buf  = iei_wt61p803_puzzle_recv_buf,
> +	.write_wakeup = serdev_device_write_wakeup,
> +};
> +
> +/**
> + * iei_wt61p803_puzzle_write_command_watchdog() - Watchdog of the normal cmd
> + * @mcu: Pointer to the iei_wt61p803_puzzle core MFD struct
> + * @cmd: Pointer to the char array to send (size should be content + 1 (xor))
> + * @size: Size of the cmd char array
> + * @reply_data: Pointer to the reply/response data array (should be allocated)
> + * @reply_size: Pointer to size_t (size of reply_data)
> + * @retry_count: Number of times to retry sending the command to the MCU
> + */
> +int iei_wt61p803_puzzle_write_command_watchdog(struct iei_wt61p803_puzzle *mcu,
> +					       unsigned char *cmd, size_t size,
> +					       unsigned char *reply_data,
> +					       size_t *reply_size, int retry_count)
> +{
> +	struct device *dev = &mcu->serdev->dev;
> +	int ret, i;
> +
> +	for (i = 0; i < retry_count; i++) {
> +		ret = iei_wt61p803_puzzle_write_command(mcu, cmd, size,
> +							reply_data, reply_size);
> +		if (ret != -ETIMEDOUT)
> +			return ret;
> +	}
> +
> +	dev_err(dev, "Command response timed out. Retries: %d\n", retry_count);
> +
> +	return -ETIMEDOUT;
> +}
> +EXPORT_SYMBOL_GPL(iei_wt61p803_puzzle_write_command_watchdog);

Don't rely on the export/prototype for forward declaration.

Place this function below iei_wt61p803_puzzle_write_command() please.

> +/**
> + * iei_wt61p803_puzzle_write_command() - Send a structured command to the MCU
> + * @mcu: Pointer to the iei_wt61p803_puzzle core MFD struct
> + * @cmd: Pointer to the char array to send (size should be content + 1 (xor))
> + * @size: Size of the cmd char array
> + * @reply_data: Pointer to the reply/response data array (should be allocated)
> + *
> + * Sends a structured command to the MCU.
> + */
> +int iei_wt61p803_puzzle_write_command(struct iei_wt61p803_puzzle *mcu,
> +				      unsigned char *cmd, size_t size,
> +				      unsigned char *reply_data,
> +				      size_t *reply_size)
> +{
> +	struct device *dev = &mcu->serdev->dev;
> +	int ret;
> +
> +	if (size <= 1 || size > IEI_WT61P803_PUZZLE_MAX_COMMAND_LENGTH)
> +		return -EINVAL;
> +
> +	mutex_lock(&mcu->reply_lock);
> +
> +	cmd[size - 1] = iei_wt61p803_puzzle_checksum(cmd, size - 1);
> +
> +	/* Initialize reply struct */
> +	reinit_completion(&mcu->reply->received);
> +	mcu->reply->size = 0;

'\n' here, as the next line is not related to the comment.

> +	usleep_range(2000, 10000);

What's the purpose of the sleep here?

Where does this range come from?  Is there a datasheet?

'\n' here.

> +	serdev_device_write_flush(mcu->serdev);
> +	ret = serdev_device_write_buf(mcu->serdev, cmd, size);
> +	if (ret < 0)
> +		goto exit;
> +
> +	serdev_device_wait_until_sent(mcu->serdev, IEI_WT61P803_PUZZLE_GENERAL_TIMEOUT);
> +	ret = wait_for_completion_timeout(&mcu->reply->received,
> +					  IEI_WT61P803_PUZZLE_GENERAL_TIMEOUT);
> +	if (ret == 0) {
> +		dev_err(dev, "Command reply receive timeout\n");

Can you turn this into a proper English sentence please?

Perhaps "Timeout command received" or "Command timed out"?

> +		ret = -ETIMEDOUT;
> +		goto exit;

Tell us the goto's intention, so 'unlock' here.

> +	}
> +
> +	*reply_size = mcu->reply->size;
> +	/* Copy the received data, as it will not be available after a new frame is received */
> +	memcpy(reply_data, mcu->reply->data, mcu->reply->size);
> +	ret = 0;

read/write calls usually return the size of data read/written.

'\n' here.  This code is very bunched up/hard to read.

> +exit:
> +	mutex_unlock(&mcu->reply_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(iei_wt61p803_puzzle_write_command);
> +
> +static int iei_wt61p803_puzzle_buzzer(struct iei_wt61p803_puzzle *mcu, bool long_beep)
> +{
> +	unsigned char *resp_buf = mcu->response_buffer;
> +	unsigned char buzzer_cmd[4] = {};
> +	size_t reply_size;
> +	int ret;
> +
> +	buzzer_cmd[0] = IEI_WT61P803_PUZZLE_CMD_HEADER_START;
> +	buzzer_cmd[1] = IEI_WT61P803_PUZZLE_CMD_FUNCTION_SINGLE;
> +	buzzer_cmd[2] = long_beep ? '3' : '2'; /* Buzzer 1.5 / 0.5 second beep */
> +
> +	mutex_lock(&mcu->lock);
> +	ret = iei_wt61p803_puzzle_write_command(mcu, buzzer_cmd, sizeof(buzzer_cmd),
> +						resp_buf, &reply_size);
> +	if (ret)
> +		goto exit;
> +
> +	if (reply_size != 3) {
> +		ret = -EIO;
> +		goto exit;
> +	}
> +
> +	if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
> +	      resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
> +	      resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK)) {
> +		ret = -EPROTO;
> +		goto exit;
> +	}

Why does all this processing have to be conducted under a lock?

'\n'

> +exit:
> +	mutex_unlock(&mcu->lock);
> +	return ret;
> +}
> +
> +static int iei_wt61p803_puzzle_get_version(struct iei_wt61p803_puzzle *mcu)
> +{
> +	unsigned char version_cmd[3] = {

As there are multiple 'version's, please name them all.

Is this the 'hw_version'?

> +		IEI_WT61P803_PUZZLE_CMD_HEADER_START_OTHER,
> +		IEI_WT61P803_PUZZLE_CMD_OTHER_VERSION,
> +	};
> +	unsigned char build_info_cmd[3] = {
> +		IEI_WT61P803_PUZZLE_CMD_HEADER_START_OTHER,
> +		IEI_WT61P803_PUZZLE_CMD_OTHER_BUILD,
> +	};
> +	unsigned char bootloader_mode_cmd[3] = {
> +		IEI_WT61P803_PUZZLE_CMD_HEADER_START_OTHER,
> +		IEI_WT61P803_PUZZLE_CMD_OTHER_BOOTLOADER_MODE,
> +	};
> +	unsigned char protocol_version_cmd[3] = {
> +		IEI_WT61P803_PUZZLE_CMD_HEADER_START_OTHER,
> +		IEI_WT61P803_PUZZLE_CMD_OTHER_PROTOCOL_VERSION,
> +	};
> +	unsigned char *rb = mcu->response_buffer;
> +	size_t reply_size;
> +	int ret;
> +
> +	mutex_lock(&mcu->lock);
> +
> +	ret = iei_wt61p803_puzzle_write_command(mcu, version_cmd, sizeof(version_cmd),
> +						rb, &reply_size);
> +	if (ret)
> +		goto err;

This is different again.  Please use 'unlock' throughout.

'\n' after all of these (ret) checks please.

Sometimes it's there, other times it's not.  Please be consistent.

> +	if (reply_size < 7) {
> +		ret = -EIO;
> +		goto err;
> +	}
> +	sprintf(mcu->version.version, "v%c.%.3s", rb[2], &rb[3]);
> +
> +	ret = iei_wt61p803_puzzle_write_command(mcu, build_info_cmd,
> +						sizeof(build_info_cmd),	rb,
> +						&reply_size);
> +	if (ret)
> +		goto err;
> +	if (reply_size < 15) {
> +		ret = -EIO;
> +		goto err;
> +	}

I don't like this setup.

Please change the API so that everything is encoded in ret.

If ret is less than 0 then an error occurred else encode the
reply_size into it.

> +	sprintf(mcu->version.build_info, "%c%c/%c%c/%.4s %c%c:%c%c",
> +		rb[8], rb[9], rb[6], rb[7], &rb[2], rb[10], rb[11],
> +		rb[12], rb[13]);
> +
> +	ret = iei_wt61p803_puzzle_write_command(mcu, bootloader_mode_cmd,
> +						sizeof(bootloader_mode_cmd), rb,
> +						&reply_size);
> +	if (ret)
> +		goto err;
> +	if (reply_size < 4) {
> +		ret = -EIO;
> +		goto err;
> +	}
> +	if (rb[2] == IEI_WT61P803_PUZZLE_CMD_OTHER_MODE_APPS)
> +		mcu->version.bootloader_mode = false;
> +	else if (rb[2] == IEI_WT61P803_PUZZLE_CMD_OTHER_MODE_BOOTLOADER)
> +		mcu->version.bootloader_mode = true;

You can drop one of these checks, no?

If bootloader_mode is already initialised you only need the 2nd one.

If it's not, just 'else bootloader_mode = false'.

> +	ret = iei_wt61p803_puzzle_write_command(mcu, protocol_version_cmd,
> +						sizeof(protocol_version_cmd), rb,
> +						&reply_size);
> +	if (ret)
> +		goto err;
> +	if (reply_size < 9) {
> +		ret = -EIO;
> +		goto err;
> +	}
> +	sprintf(mcu->version.protocol_version, "v%c.%c%c%c%c%c",
> +		rb[7], rb[6], rb[5], rb[4], rb[3], rb[2]);

'\n'

> +err:

'unlock'

> +	mutex_unlock(&mcu->lock);
> +	return ret;
> +}
> +
> +static int iei_wt61p803_puzzle_get_mcu_status(struct iei_wt61p803_puzzle *mcu)
> +{
> +	unsigned char mcu_status_cmd[5] = {
> +		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> +		IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER,
> +		IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER_STATUS,
> +		IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER_STATUS,
> +	};
> +	unsigned char *resp_buf = mcu->response_buffer;
> +	size_t reply_size;
> +	int ret;
> +
> +	mutex_lock(&mcu->lock);
> +	ret = iei_wt61p803_puzzle_write_command(mcu, mcu_status_cmd, sizeof(mcu_status_cmd),
> +						resp_buf, &reply_size);
> +	if (ret)
> +		goto exit;
> +	if (reply_size < 20) {
> +		ret = -EIO;
> +		goto exit;
> +	}
> +
> +	/* Response format:
> +	 * (IDX	RESPONSE)
> +	 * 0	@
> +	 * 1	O
> +	 * 2	S
> +	 * 3	S
> +	 * ...
> +	 * 5	AC Recovery Status Flag
> +	 * ...
> +	 * 10	Power Loss Recovery
> +	 * ...
> +	 * 19	Power Status (system power on method)
> +	 * 20	XOR checksum
> +	 */
> +	if (resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
> +	    resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER &&
> +	    resp_buf[2] == IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER_STATUS &&
> +	    resp_buf[3] == IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER_STATUS) {
> +		mcu->status.ac_recovery_status_flag = resp_buf[5];
> +		mcu->status.power_loss_recovery = resp_buf[10];
> +		mcu->status.power_status = resp_buf[19];
> +	}

'\n'

> +exit:
> +	mutex_unlock(&mcu->lock);
> +	return ret;
> +}
> +
> +static int iei_wt61p803_puzzle_get_serial_number(struct iei_wt61p803_puzzle *mcu)
> +{
> +	unsigned char *resp_buf = mcu->response_buffer;
> +	unsigned char serial_number_cmd[5] = {
> +		IEI_WT61P803_PUZZLE_CMD_HEADER_EEPROM,
> +		IEI_WT61P803_PUZZLE_CMD_EEPROM_READ,
> +		0x00,	/* EEPROM read address */
> +		0x24,	/* Data length */

All of the magic numbers in this driver should be defined ideally.

> +	};
> +	size_t reply_size;
> +	int ret;
> +
> +	mutex_lock(&mcu->lock);
> +	ret = iei_wt61p803_puzzle_write_command(mcu, serial_number_cmd,
> +						sizeof(serial_number_cmd),
> +						resp_buf, &reply_size);
> +	if (ret)
> +		goto err;
> +
> +	if (reply_size < IEI_WT61P803_PUZZLE_SN_LENGTH + 4) {

Why 4?  Probably better to define it.

> +		ret = -EIO;
> +		goto err;
> +	}
> +
> +	sprintf(mcu->version.serial_number, "%.*s",
> +		IEI_WT61P803_PUZZLE_SN_LENGTH, resp_buf + 4);

'\n'

> +err:
> +	mutex_unlock(&mcu->lock);
> +	return ret;
> +}
> +
> +static int iei_wt61p803_puzzle_write_serial_number(struct iei_wt61p803_puzzle *mcu,
> +						   unsigned char serial_number[36])
> +{
> +	unsigned char *resp_buf = mcu->response_buffer;
> +	unsigned char serial_number_header[4] = {
> +		IEI_WT61P803_PUZZLE_CMD_HEADER_EEPROM,
> +		IEI_WT61P803_PUZZLE_CMD_EEPROM_WRITE,
> +		0x00,	/* EEPROM write address */
> +		0xC,	/* Data length */
> +	};
> +	unsigned char serial_number_cmd[4 + 12 + 1]; /* header, serial number, XOR checksum */
> +	int ret, sn_counter;
> +	size_t reply_size;
> +
> +	/* The MCU can only handle 22 byte messages, send the S/N in 12 byte chunks */

Byte

> +	mutex_lock(&mcu->lock);
> +	for (sn_counter = 0; sn_counter < 3; sn_counter++) {

Why 3?  Please define it.

> +		serial_number_header[2] = 0x0 + 0xC * sn_counter;

Define all magic numbers please.

I won't mention this again from here.

> +		memcpy(serial_number_cmd, serial_number_header, sizeof(serial_number_header));
> +		memcpy(serial_number_cmd + sizeof(serial_number_header),
> +		       serial_number + 0xC * sn_counter, 0xC);
> +
> +		ret = iei_wt61p803_puzzle_write_command(mcu, serial_number_cmd,
> +							sizeof(serial_number_cmd),
> +							resp_buf, &reply_size);
> +		if (ret)
> +			goto err;
> +		if (reply_size != 3) {
> +			ret = -EIO;
> +			goto err;
> +		}
> +		if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
> +		      resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
> +		      resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK)) {
> +			ret = -EPROTO;
> +			goto err;
> +		}
> +	}
> +
> +	sprintf(mcu->version.serial_number, "%.*s",
> +		IEI_WT61P803_PUZZLE_SN_LENGTH, serial_number);
> +err:
> +	mutex_unlock(&mcu->lock);
> +	return ret;
> +}
> +
> +static int iei_wt61p803_puzzle_get_mac_address(struct iei_wt61p803_puzzle *mcu, int index)
> +{
> +	unsigned char *resp_buf = mcu->response_buffer;
> +	unsigned char mac_address_cmd[5] = {
> +		IEI_WT61P803_PUZZLE_CMD_HEADER_EEPROM,
> +		IEI_WT61P803_PUZZLE_CMD_EEPROM_READ,
> +		0x00,	/* EEPROM read address */
> +		0x11,	/* Data length */
> +	};
> +	size_t reply_size;
> +	int ret;
> +
> +	mutex_lock(&mcu->lock);
> +	mac_address_cmd[2] = 0x24 + 0x11 * index;
> +
> +	ret = iei_wt61p803_puzzle_write_command(mcu, mac_address_cmd,
> +						sizeof(mac_address_cmd),
> +						resp_buf, &reply_size);
> +	if (ret)
> +		goto err;
> +
> +	if (reply_size < 22) {
> +		ret = -EIO;
> +		goto err;
> +	}
> +
> +	sprintf(mcu->version.mac_address[index], "%.*s",
> +		IEI_WT61P803_PUZZLE_MAC_LENGTH, resp_buf + 4);
> +err:
> +	mutex_unlock(&mcu->lock);
> +	return ret;
> +}
> +
> +static int
> +iei_wt61p803_puzzle_write_mac_address(struct iei_wt61p803_puzzle *mcu,
> +				      unsigned char mac_address[IEI_WT61P803_PUZZLE_MAC_LENGTH],
> +				      int mac_address_idx)
> +{
> +	unsigned char mac_address_cmd[4 + IEI_WT61P803_PUZZLE_MAC_LENGTH + 1];
> +	unsigned char *resp_buf = mcu->response_buffer;
> +	unsigned char mac_address_header[4] = {
> +		IEI_WT61P803_PUZZLE_CMD_HEADER_EEPROM,
> +		IEI_WT61P803_PUZZLE_CMD_EEPROM_WRITE,
> +		0x00,	/* EEPROM write address */
> +		0x11,	/* Data length */
> +	};
> +	size_t reply_size;
> +	int ret;
> +
> +	if (mac_address_idx < 0 || mac_address_idx >= IEI_WT61P803_PUZZLE_NB_MAC)
> +		return -EINVAL;
> +
> +	mac_address_header[2] = 0x24 + 0x11 * mac_address_idx;
> +
> +	/* Concat mac_address_header, mac_address to mac_address_cmd */
> +	memcpy(mac_address_cmd, mac_address_header, sizeof(mac_address_header));
> +	memcpy(mac_address_cmd + sizeof(mac_address_header), mac_address,
> +	       IEI_WT61P803_PUZZLE_MAC_LENGTH);
> +
> +	mutex_lock(&mcu->lock);
> +	ret = iei_wt61p803_puzzle_write_command(mcu, mac_address_cmd,
> +						sizeof(mac_address_cmd),
> +						resp_buf, &reply_size);
> +	if (ret)
> +		goto err;
> +	if (reply_size != 3) {
> +		ret = -EIO;
> +		goto err;
> +	}
> +	if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
> +	      resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
> +	      resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK)) {
> +		ret = -EPROTO;
> +		goto err;
> +	}
> +
> +	sprintf(mcu->version.mac_address[mac_address_idx], "%.*s",
> +		IEI_WT61P803_PUZZLE_MAC_LENGTH, mac_address);
> +err:
> +	mutex_unlock(&mcu->lock);
> +	return ret;
> +}
> +
> +static int iei_wt61p803_puzzle_write_power_loss_recovery(struct iei_wt61p803_puzzle *mcu,
> +							 int power_loss_recovery_action)
> +{
> +	unsigned char *resp_buf = mcu->response_buffer;
> +	unsigned char power_loss_recovery_cmd[5] = {};
> +	size_t reply_size;
> +	int ret;
> +
> +	if (power_loss_recovery_action < 0 || power_loss_recovery_action > 4)

What are the 5 actions?  Are they mentioned/defined/enumed anywhere?

> +		return -EINVAL;
> +
> +	power_loss_recovery_cmd[0] = IEI_WT61P803_PUZZLE_CMD_HEADER_START;
> +	power_loss_recovery_cmd[1] = IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER;
> +	power_loss_recovery_cmd[2] = IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER_POWER_LOSS;
> +	power_loss_recovery_cmd[3] = hex_asc[power_loss_recovery_action];
> +
> +	mutex_lock(&mcu->lock);
> +	ret = iei_wt61p803_puzzle_write_command(mcu, power_loss_recovery_cmd,
> +						sizeof(power_loss_recovery_cmd),
> +						resp_buf, &reply_size);
> +	if (ret)
> +		goto exit;
> +	mcu->status.power_loss_recovery = power_loss_recovery_action;
> +exit:
> +	mutex_unlock(&mcu->lock);
> +	return ret;
> +}

###########################################
###########################################

> +#define to_puzzle_dev_attr(_attr) \
> +	container_of(_attr, struct iei_wt61p803_puzzle_device_attribute, dev_attr)

Place this at the top of the file please.

> +static ssize_t show_output(struct device *dev,
> +			   struct device_attribute *attr, char *buf)
> +{
> +	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev);
> +	struct iei_wt61p803_puzzle_device_attribute *pattr = to_puzzle_dev_attr(attr);
> +	int ret;
> +
> +	switch (pattr->type) {
> +	case IEI_WT61P803_PUZZLE_VERSION:
> +		return scnprintf(buf, PAGE_SIZE, "%s\n", mcu->version.version);
> +	case IEI_WT61P803_PUZZLE_BUILD_INFO:
> +		return scnprintf(buf, PAGE_SIZE, "%s\n", mcu->version.build_info);
> +	case IEI_WT61P803_PUZZLE_BOOTLOADER_MODE:
> +		return scnprintf(buf, PAGE_SIZE, "%d\n", mcu->version.bootloader_mode);
> +	case IEI_WT61P803_PUZZLE_PROTOCOL_VERSION:
> +		return scnprintf(buf, PAGE_SIZE, "%s\n", mcu->version.protocol_version);
> +	case IEI_WT61P803_PUZZLE_SERIAL_NUMBER:
> +		ret = iei_wt61p803_puzzle_get_serial_number(mcu);
> +		if (!ret)
> +			ret = scnprintf(buf, PAGE_SIZE, "%s\n", mcu->version.serial_number);
> +		else
> +			ret = 0;
> +		return ret;
> +	case IEI_WT61P803_PUZZLE_MAC_ADDRESS:
> +		ret = iei_wt61p803_puzzle_get_mac_address(mcu, pattr->index);
> +		if (!ret)
> +			ret = scnprintf(buf, PAGE_SIZE, "%s\n",
> +					mcu->version.mac_address[pattr->index]);
> +		else
> +			ret = 0;
> +		return ret;
> +	case IEI_WT61P803_PUZZLE_AC_RECOVERY_STATUS:
> +	case IEI_WT61P803_PUZZLE_POWER_LOSS_RECOVERY:
> +	case IEI_WT61P803_PUZZLE_POWER_STATUS:
> +		ret = iei_wt61p803_puzzle_get_mcu_status(mcu);
> +		if (ret)
> +			return ret;
> +
> +		mutex_lock(&mcu->lock);
> +		switch (pattr->type) {
> +		case IEI_WT61P803_PUZZLE_AC_RECOVERY_STATUS:
> +			ret = scnprintf(buf, PAGE_SIZE, "%x\n",
> +					mcu->status.ac_recovery_status_flag);
> +			break;
> +		case IEI_WT61P803_PUZZLE_POWER_LOSS_RECOVERY:
> +			ret = scnprintf(buf, PAGE_SIZE, "%x\n", mcu->status.power_loss_recovery);
> +			break;
> +		case IEI_WT61P803_PUZZLE_POWER_STATUS:
> +			ret = scnprintf(buf, PAGE_SIZE, "%x\n", mcu->status.power_status);
> +			break;
> +		default:
> +			ret = 0;
> +			break;
> +		}
> +		mutex_unlock(&mcu->lock);
> +		return ret;
> +	default:
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t store_output(struct device *dev,
> +			    struct device_attribute *attr,
> +			    const char *buf, size_t len)
> +{
> +	unsigned char serial_number[IEI_WT61P803_PUZZLE_SN_LENGTH];
> +	unsigned char mac_address[IEI_WT61P803_PUZZLE_MAC_LENGTH];
> +	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev);
> +	struct iei_wt61p803_puzzle_device_attribute *pattr = to_puzzle_dev_attr(attr);
> +	int power_loss_recovery_action = 0;
> +	int ret;
> +
> +	switch (pattr->type) {
> +	case IEI_WT61P803_PUZZLE_SERIAL_NUMBER:
> +		if (len != (size_t)(IEI_WT61P803_PUZZLE_SN_LENGTH + 1))
> +			return -EINVAL;
> +		memcpy(serial_number, buf, sizeof(serial_number));
> +		ret = iei_wt61p803_puzzle_write_serial_number(mcu, serial_number);
> +		if (ret)
> +			return ret;
> +		return len;
> +	case IEI_WT61P803_PUZZLE_MAC_ADDRESS:
> +		if (len != (size_t)(IEI_WT61P803_PUZZLE_MAC_LENGTH + 1))
> +			return -EINVAL;
> +
> +		memcpy(mac_address, buf, sizeof(mac_address));
> +
> +		if (strlen(attr->attr.name) != 13)
> +			return -EIO;
> +
> +		ret = iei_wt61p803_puzzle_write_mac_address(mcu, mac_address, pattr->index);
> +		if (ret)
> +			return ret;
> +		return len;
> +	case IEI_WT61P803_PUZZLE_POWER_LOSS_RECOVERY:
> +		ret = kstrtoint(buf, 10, &power_loss_recovery_action);
> +		if (ret)
> +			return ret;
> +		ret = iei_wt61p803_puzzle_write_power_loss_recovery(mcu,
> +								    power_loss_recovery_action);
> +		if (ret)
> +			return ret;
> +		return len;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +#define IEI_WT61P803_PUZZLE_ATTR(_name, _mode, _show, _store, _type, _index) \
> +	struct iei_wt61p803_puzzle_device_attribute dev_attr_##_name = \
> +		{ .dev_attr	= __ATTR(_name, _mode, _show, _store), \
> +		  .type		= _type, \
> +		  .index	= _index }
> +
> +#define IEI_WT61P803_PUZZLE_ATTR_RO(_name, _type, _id) \
> +	IEI_WT61P803_PUZZLE_ATTR(_name, 0444, show_output, NULL, _type, _id)
> +
> +#define IEI_WT61P803_PUZZLE_ATTR_RW(_name, _type, _id) \
> +	IEI_WT61P803_PUZZLE_ATTR(_name, 0644, show_output, store_output, _type, _id)
> +
> +static IEI_WT61P803_PUZZLE_ATTR_RO(version, IEI_WT61P803_PUZZLE_VERSION, 0);
> +static IEI_WT61P803_PUZZLE_ATTR_RO(build_info, IEI_WT61P803_PUZZLE_BUILD_INFO, 0);
> +static IEI_WT61P803_PUZZLE_ATTR_RO(bootloader_mode, IEI_WT61P803_PUZZLE_BOOTLOADER_MODE, 0);
> +static IEI_WT61P803_PUZZLE_ATTR_RO(protocol_version, IEI_WT61P803_PUZZLE_PROTOCOL_VERSION, 0);
> +static IEI_WT61P803_PUZZLE_ATTR_RW(serial_number, IEI_WT61P803_PUZZLE_SERIAL_NUMBER, 0);
> +static IEI_WT61P803_PUZZLE_ATTR_RW(mac_address_0, IEI_WT61P803_PUZZLE_MAC_ADDRESS, 0);
> +static IEI_WT61P803_PUZZLE_ATTR_RW(mac_address_1, IEI_WT61P803_PUZZLE_MAC_ADDRESS, 1);
> +static IEI_WT61P803_PUZZLE_ATTR_RW(mac_address_2, IEI_WT61P803_PUZZLE_MAC_ADDRESS, 2);
> +static IEI_WT61P803_PUZZLE_ATTR_RW(mac_address_3, IEI_WT61P803_PUZZLE_MAC_ADDRESS, 3);
> +static IEI_WT61P803_PUZZLE_ATTR_RW(mac_address_4, IEI_WT61P803_PUZZLE_MAC_ADDRESS, 4);
> +static IEI_WT61P803_PUZZLE_ATTR_RW(mac_address_5, IEI_WT61P803_PUZZLE_MAC_ADDRESS, 5);
> +static IEI_WT61P803_PUZZLE_ATTR_RW(mac_address_6, IEI_WT61P803_PUZZLE_MAC_ADDRESS, 6);
> +static IEI_WT61P803_PUZZLE_ATTR_RW(mac_address_7, IEI_WT61P803_PUZZLE_MAC_ADDRESS, 7);
> +static IEI_WT61P803_PUZZLE_ATTR_RO(ac_recovery_status, IEI_WT61P803_PUZZLE_AC_RECOVERY_STATUS, 0);
> +static IEI_WT61P803_PUZZLE_ATTR_RW(power_loss_recovery, IEI_WT61P803_PUZZLE_POWER_LOSS_RECOVERY, 0);
> +static IEI_WT61P803_PUZZLE_ATTR_RO(power_status, IEI_WT61P803_PUZZLE_POWER_STATUS, 0);
> +
> +static struct attribute *iei_wt61p803_puzzle_attrs[] = {
> +	&dev_attr_version.dev_attr.attr,
> +	&dev_attr_build_info.dev_attr.attr,
> +	&dev_attr_bootloader_mode.dev_attr.attr,
> +	&dev_attr_protocol_version.dev_attr.attr,
> +	&dev_attr_serial_number.dev_attr.attr,
> +	&dev_attr_mac_address_0.dev_attr.attr,
> +	&dev_attr_mac_address_1.dev_attr.attr,
> +	&dev_attr_mac_address_2.dev_attr.attr,
> +	&dev_attr_mac_address_3.dev_attr.attr,
> +	&dev_attr_mac_address_4.dev_attr.attr,
> +	&dev_attr_mac_address_5.dev_attr.attr,
> +	&dev_attr_mac_address_6.dev_attr.attr,
> +	&dev_attr_mac_address_7.dev_attr.attr,
> +	&dev_attr_ac_recovery_status.dev_attr.attr,
> +	&dev_attr_power_loss_recovery.dev_attr.attr,
> +	&dev_attr_power_status.dev_attr.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(iei_wt61p803_puzzle);
> +
> +static int iei_wt61p803_puzzle_sysfs_create(struct device *dev,
> +					    struct iei_wt61p803_puzzle *mcu)

Why do you need 'mcu' here?

> +{
> +	int ret;
> +
> +	ret = sysfs_create_groups(&mcu->dev->kobj, iei_wt61p803_puzzle_groups);
> +	if (ret)
> +		mfd_remove_devices(mcu->dev);

You can't remove devices you haven't added!

> +	return ret;
> +}
> +
> +static int iei_wt61p803_puzzle_sysfs_remove(struct device *dev,
> +					    struct iei_wt61p803_puzzle *mcu)
> +{
> +	/* Remove sysfs groups */
> +	sysfs_remove_groups(&mcu->dev->kobj, iei_wt61p803_puzzle_groups);
> +	mfd_remove_devices(mcu->dev);
> +
> +	return 0;
> +}

###########################################
###########################################

> +static int iei_wt61p803_puzzle_probe(struct serdev_device *serdev)
> +{
> +	struct device *dev = &serdev->dev;
> +	struct iei_wt61p803_puzzle *mcu;
> +	u32 baud;
> +	int ret;
> +
> +	/* Read the baud rate from 'current-speed', because the MCU supports different rates */
> +	if (device_property_read_u32(dev, "current-speed", &baud)) {
> +		dev_err(dev,
> +			"'current-speed' is not specified in device node\n");

Same line please.

"'current-speed' device tree property not found"

> +		return -EINVAL;
> +	}
> +	dev_dbg(dev, "Driver baud rate: %d\n", baud);
> +
> +	/* Allocate the memory */

Drop this comment.

> +	mcu = devm_kzalloc(dev, sizeof(*mcu), GFP_KERNEL);
> +	if (!mcu)
> +		return -ENOMEM;
> +
> +	mcu->reply = devm_kzalloc(dev, sizeof(*mcu->reply), GFP_KERNEL);
> +	if (!mcu->reply)
> +		return -ENOMEM;
> +
> +	/* Initialize device struct data */

And this please.

> +	mcu->serdev = serdev;
> +	mcu->dev = dev;

Doesn't serdev already have dev?

If so, you don't need to store both.

> +	init_completion(&mcu->reply->received);
> +	mutex_init(&mcu->reply_lock);

Why can't you use 'lock' in all cases?

> +	mutex_init(&mcu->lock);
> +
> +	/* Setup UART interface */

Drop the comment please.  It's superfluous.

> +	serdev_device_set_drvdata(serdev, mcu);
> +	serdev_device_set_client_ops(serdev, &iei_wt61p803_puzzle_serdev_device_ops);
> +	ret = devm_serdev_device_open(dev, serdev);
> +	if (ret)
> +		return ret;

'\n'

> +	serdev_device_set_baudrate(serdev, baud);
> +	serdev_device_set_flow_control(serdev, false);
> +	ret = serdev_device_set_parity(serdev, SERDEV_PARITY_NONE);
> +	if (ret) {
> +		dev_err(dev, "Failed to set parity\n");
> +		return ret;
> +	}
> +
> +	ret = iei_wt61p803_puzzle_get_version(mcu);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(dev, "MCU version: %s\n", mcu->version.version);
> +	dev_dbg(dev, "MCU firmware build info: %s\n", mcu->version.build_info);
> +	dev_dbg(dev, "MCU in bootloader mode: %s\n",
> +		mcu->version.bootloader_mode ? "true" : "false");
> +	dev_dbg(dev, "MCU protocol version: %s\n", mcu->version.protocol_version);
> +
> +	if (device_property_read_bool(dev, "enable-beep")) {
> +		ret = iei_wt61p803_puzzle_buzzer(mcu, false);

You're beeping just because it's enabled?

> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = iei_wt61p803_puzzle_sysfs_create(dev, mcu);
> +	if (ret)
> +		return ret;
> +
> +	return devm_of_platform_populate(dev);
> +}
> +
> +static void iei_wt61p803_puzzle_remove(struct serdev_device *serdev)
> +{
> +	struct device *dev = &serdev->dev;
> +	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev);
> +
> +	iei_wt61p803_puzzle_sysfs_remove(dev, mcu);
> +}
> +
> +static const struct of_device_id iei_wt61p803_puzzle_dt_ids[] = {
> +	{ .compatible = "iei,wt61p803-puzzle" },
> +	{ }
> +};
> +

Remove this line.

> +MODULE_DEVICE_TABLE(of, iei_wt61p803_puzzle_dt_ids);
> +
> +static struct serdev_device_driver iei_wt61p803_puzzle_drv = {
> +	.probe			= iei_wt61p803_puzzle_probe,
> +	.remove			= iei_wt61p803_puzzle_remove,

No need to tab these out to match the subordinate structure.

> +	.driver = {
> +		.name		= "iei-wt61p803-puzzle",
> +		.of_match_table	= iei_wt61p803_puzzle_dt_ids,
> +	},
> +};
> +

Remove this line.

> +module_serdev_device_driver(iei_wt61p803_puzzle_drv);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Luka Kovacic <luka.kovacic@sartura.hr>");
> +MODULE_DESCRIPTION("IEI WT61P803 PUZZLE MCU Driver");
> diff --git a/include/linux/mfd/iei-wt61p803-puzzle.h b/include/linux/mfd/iei-wt61p803-puzzle.h
> new file mode 100644
> index 000000000000..7f2da5887dae
> --- /dev/null
> +++ b/include/linux/mfd/iei-wt61p803-puzzle.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* IEI WT61P803 PUZZLE MCU Driver

Non-conformant multi-line comment

> + * System management microcontroller for fan control, temperature sensor reading,
> + * LED control and system identification on IEI Puzzle series ARM-based appliances.
> + *
> + * Copyright (C) 2020 Sartura Ltd.
> + * Author: Luka Kovacic <luka.kovacic@sartura.hr>
> + */
> +
> +#ifndef _MFD_IEI_WT61P803_PUZZLE_H_
> +#define _MFD_IEI_WT61P803_PUZZLE_H_
> +
> +#define IEI_WT61P803_PUZZLE_BUF_SIZE 512
> +
> +/* Command magic numbers */
> +#define IEI_WT61P803_PUZZLE_CMD_HEADER_START		0x40 /* @ */
> +#define IEI_WT61P803_PUZZLE_CMD_HEADER_START_OTHER	0x25 /* % */
> +#define IEI_WT61P803_PUZZLE_CMD_HEADER_EEPROM		0xF7
> +
> +#define IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK		0x30 /* 0 */
> +#define IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK	0x70
> +
> +#define IEI_WT61P803_PUZZLE_CMD_EEPROM_READ		0xA1
> +#define IEI_WT61P803_PUZZLE_CMD_EEPROM_WRITE		0xA0
> +
> +#define IEI_WT61P803_PUZZLE_CMD_OTHER_VERSION		0x56 /* V */
> +#define IEI_WT61P803_PUZZLE_CMD_OTHER_BUILD		0x42 /* B */
> +#define IEI_WT61P803_PUZZLE_CMD_OTHER_BOOTLOADER_MODE	0x4D /* M */
> +#define IEI_WT61P803_PUZZLE_CMD_OTHER_MODE_BOOTLOADER	0x30
> +#define IEI_WT61P803_PUZZLE_CMD_OTHER_MODE_APPS		0x31
> +#define IEI_WT61P803_PUZZLE_CMD_OTHER_PROTOCOL_VERSION	0x50 /* P */
> +
> +#define IEI_WT61P803_PUZZLE_CMD_FUNCTION_SINGLE		0x43 /* C */
> +#define IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER		0x4F /* O */
> +#define IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER_STATUS	0x53 /* S */
> +#define IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER_POWER_LOSS 0x41 /* A */
> +
> +#define IEI_WT61P803_PUZZLE_CMD_LED			0x52 /* R */
> +#define IEI_WT61P803_PUZZLE_CMD_LED_POWER		0x31 /* 1 */
> +
> +#define IEI_WT61P803_PUZZLE_CMD_TEMP			0x54 /* T */
> +#define IEI_WT61P803_PUZZLE_CMD_TEMP_ALL		0x41 /* A */
> +
> +#define IEI_WT61P803_PUZZLE_CMD_FAN			0x46 /* F */
> +#define IEI_WT61P803_PUZZLE_CMD_FAN_PWM_READ		0x5A /* Z */
> +#define IEI_WT61P803_PUZZLE_CMD_FAN_PWM_WRITE		0x57 /* W */
> +#define IEI_WT61P803_PUZZLE_CMD_FAN_PWM_BASE		0x30
> +#define IEI_WT61P803_PUZZLE_CMD_FAN_RPM_BASE		0x41 /* A */
> +
> +#define IEI_WT61P803_PUZZLE_CMD_FAN_PWM(x) (IEI_WT61P803_PUZZLE_CMD_FAN_PWM_BASE + (x)) /* 0 - 1 */
> +#define IEI_WT61P803_PUZZLE_CMD_FAN_RPM(x) (IEI_WT61P803_PUZZLE_CMD_FAN_RPM_BASE + (x)) /* 0 - 5 */
> +
> +struct iei_wt61p803_puzzle_mcu_version;
> +struct iei_wt61p803_puzzle_reply;
> +struct iei_wt61p803_puzzle;
> +
> +int iei_wt61p803_puzzle_write_command_watchdog(struct iei_wt61p803_puzzle *mcu,
> +					       unsigned char *cmd, size_t size,
> +					       unsigned char *reply_data, size_t *reply_size,
> +					       int retry_count);
> +
> +int iei_wt61p803_puzzle_write_command(struct iei_wt61p803_puzzle *mcu,
> +				      unsigned char *cmd, size_t size,
> +				      unsigned char *reply_data, size_t *reply_size);
> +
> +#endif /* _MFD_IEI_WT61P803_PUZZLE_H_ */

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
