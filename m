Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83E1C414808
	for <lists+linux-leds@lfdr.de>; Wed, 22 Sep 2021 13:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235746AbhIVLnS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Sep 2021 07:43:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:48586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235730AbhIVLnS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 22 Sep 2021 07:43:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E830260F26;
        Wed, 22 Sep 2021 11:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632310908;
        bh=NtJn+wAjZNf5HxZyenFf6aYlFFqZnj+NWeST+Y+XyzU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ydtWcjWe0dDy5LC+83gUnjDE3iUej5Xd2WvtatjAW9BCxlZAmOR9d4Sy5NIRzZzfz
         fnqhyO0el7GhBblMGW0EQCnLOtAvZ1qREdpqlvqbAEusfKclrqOL66E/zGUgs5kZzc
         r95TXX8VJmW6e589auZ+Q/8WQ6vSd48Q224cyo5w=
Date:   Wed, 22 Sep 2021 13:41:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, pavo.banicevic@sartura.hr,
        corbet@lwn.net, lee.jones@linaro.org, pavel@ucw.cz,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        goran.medic@sartura.hr, luka.perkov@sartura.hr,
        robert.marko@sartura.hr
Subject: Re: [PATCH v9 2/7] drivers: mfd: Add a driver for IEI WT61P803
 PUZZLE MCU
Message-ID: <YUsWeWlfanGMCpT8@kroah.com>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
 <20210824124438.14519-3-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824124438.14519-3-luka.kovacic@sartura.hr>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Aug 24, 2021 at 02:44:33PM +0200, Luka Kovacic wrote:
> +++ b/drivers/mfd/iei-wt61p803-puzzle.c
> @@ -0,0 +1,908 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* IEI WT61P803 PUZZLE MCU Driver
> + * System management microcontroller for fan control, temperature sensor reading,
> + * LED control and system identification on IEI Puzzle series ARM-based appliances.
> + *
> + * Copyright (C) 2020 Sartura Ltd.

It is 2021 now :(


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

Did you run checkpatch.pl on this series?

> +struct iei_wt61p803_puzzle_device_attribute {
> +	struct device_attribute dev_attr;
> +	enum iei_wt61p803_puzzle_attribute_type type;
> +	u8 index;
> +};

Why does a driver need a special attribute structure?  What is wrong
with the existing one that this is required?

Your "type" and index can come from the device that the attribute is
called for, right?


> +/**
> + * struct iei_wt61p803_puzzle - IEI WT61P803 PUZZLE MCU Driver

This isn't a driver, it's a device.

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

What controls the lifespan of this object?

> +	struct mutex reply_lock; /* lock to prevent multiple firmware calls */
> +	struct iei_wt61p803_puzzle_reply *reply;
> +	struct iei_wt61p803_puzzle_mcu_version version;
> +	struct iei_wt61p803_puzzle_mcu_status status;
> +	unsigned char response_buffer[IEI_WT61P803_PUZZLE_BUF_SIZE];
> +	struct mutex lock; /* lock to protect response buffer */
> +};

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

Use sysfs_emit() for all of these please.

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

No error?  Why not?

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

No error to return?

> +			break;
> +		}
> +		mutex_unlock(&mcu->lock);
> +		return ret;
> +	default:
> +		return 0;

Again, no error to return?

> +	}
> +
> +	return 0;

Shouldn't you return the size of the buffer?

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

Again, don't use your own attribute macro mess.  Use the
DEVICE_ATTR_RW() ones instead please.


> +
> +#define IEI_WT61P803_PUZZLE_ATTR_RO(_name, _type, _id) \
> +	IEI_WT61P803_PUZZLE_ATTR(_name, 0444, show_output, NULL, _type, _id)

DEVICE_ATTR_RO()

> +
> +#define IEI_WT61P803_PUZZLE_ATTR_RW(_name, _type, _id) \
> +	IEI_WT61P803_PUZZLE_ATTR(_name, 0644, show_output, store_output, _type, _id)

DEVICE_ATTR_RW()

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
> +{
> +	int ret;
> +
> +	ret = sysfs_create_groups(&mcu->dev->kobj, iei_wt61p803_puzzle_groups);

You just raced with userspace and lost :(

Please set the default attribute group for your device in the driver and
then the driver core will properly bind and create everything correctly
when the driver binds to the device.

As it is, userspace just did not notice these attributes showing up :(

thanks,

greg k-h
