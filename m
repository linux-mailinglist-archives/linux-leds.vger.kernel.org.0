Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1381A28E63D
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 20:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387869AbgJNSZ0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 14:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387848AbgJNSZ0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Oct 2020 14:25:26 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDF4C0613D2
        for <linux-leds@vger.kernel.org>; Wed, 14 Oct 2020 11:25:25 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id m17so221969ioo.1
        for <linux-leds@vger.kernel.org>; Wed, 14 Oct 2020 11:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FCpwYFoy92YNwSRNsQfcfS8ZlkoMHZYmUcOeUt6x/Is=;
        b=jd4QiDz1RbIq2gFI3mSPVJjjASygNN0WGGlHXPi5XaKmRinmUFYfaJK0gHijR4B5iW
         Le6yae+ADBev49GgRFVJ0CkoJKGkEwc1qzZzBrTgv8uxg6kB2TMSSyqdPzkvSxAJdUb4
         a8LSEcbmYQBOtszG9JINFmiL0YCy7y+AUWPDPExEedZ8quB3rC8BiuyWeeL7MtHU8vYI
         /8HAF4DNGrKgRNdLmA4pX82slpV9eIJ3c3/UTouSzEbN+HjQB+rrUcpS96Upj7Wl5dD0
         160VYPWMipXHSBYnae7oUQACL4SdJ4VltwukWALrpCsmf0AwDK++OL/QyFDRjQ5m7MK1
         ztTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FCpwYFoy92YNwSRNsQfcfS8ZlkoMHZYmUcOeUt6x/Is=;
        b=ZAhK73WOib0EcX+Vb3SLKr0V+aQdXUBB2oxv6X9GvdB4oXKj4d1JbLedIN7y6DMYHV
         Ux5lEQYV5Jm+GH1H52xh7wmbOVFtfmJKEooB91O5wyZwjNDg2sRKOUK7sBB2+hTlH2a6
         UBo1BS9+reZaS3wkGvNQmbLsN8GWrhSg2qwKkurG+l2nnKhWSLY7QWLOTf7SRv42nLim
         n8Q7sImDU89dtsIMDAZ9Kp6Vq/Sq+0aOuuSTxR1fCupjqFrbfruXoV9zLp4VL/e6U/R/
         +/UOgd+6vIqiWFwgVeUpFxjzJsZRuUQ1lOsiSYmQZQxPeQEuL3d4v+0EjBULLbCY8Gca
         CnfA==
X-Gm-Message-State: AOAM533fQMNR5F4gWgFl8yYPm6B5Z4yrNXot/71Jusb1pUhO3HeJcDTg
        6xlepOaC1NAVAXiyZyRfeMJYZQc5gDyFsNc5WLF+Ow==
X-Google-Smtp-Source: ABdhPJyIYWLeMJsb2KgSEbZ+gEqHGGaIG1oKkz5IoyHCz+hbwr5uCjRDk8jz31yQQk6fMQuJ3Pd00fKCNaU5ZaZbn9o=
X-Received: by 2002:a02:6062:: with SMTP id d34mr723574jaf.84.1602699924473;
 Wed, 14 Oct 2020 11:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201007004901.39859-1-luka.kovacic@sartura.hr>
 <20201007004901.39859-4-luka.kovacic@sartura.hr> <20201011212651.GA94919@roeck-us.net>
 <CADZsf3buEvCrVA97x1pX97sMTSXTvZCZyO0OOo=mGEpFNbf5JA@mail.gmail.com> <aa101238-c5ee-c6e4-bf35-fb3e1adcb7b1@roeck-us.net>
In-Reply-To: <aa101238-c5ee-c6e4-bf35-fb3e1adcb7b1@roeck-us.net>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Wed, 14 Oct 2020 20:25:13 +0200
Message-ID: <CADZsf3axGdAYJcko7CekZpjWf+X2tCHx5PddP7WCte5aKjn3iw@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] drivers: hwmon: Add the iEi WT61P803 PUZZLE HWMON driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Marek Behun <marek.behun@nic.cz>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Guenter,

On Tue, Oct 13, 2020 at 8:51 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/13/20 11:09 AM, Luka Kovacic wrote:
> > Hello Guenter,
> >
> > On Sun, Oct 11, 2020 at 11:26 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On Wed, Oct 07, 2020 at 02:48:58AM +0200, Luka Kovacic wrote:
> >>> Add the iEi WT61P803 PUZZLE HWMON driver, that handles the fan speed
> >>> control via PWM, reading fan speed and reading on-board temperature
> >>> sensors.
> >>>
> >>> The driver registers a HWMON device and a simple thermal cooling device to
> >>> enable in-kernel fan management.
> >>>
> >>> This driver depends on the iEi WT61P803 PUZZLE MFD driver.
> >>>
> >>> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> >>> Cc: Luka Perkov <luka.perkov@sartura.hr>
> >>> Cc: Robert Marko <robert.marko@sartura.hr>
> >>> ---
> >>>  drivers/hwmon/Kconfig                     |   8 +
> >>>  drivers/hwmon/Makefile                    |   1 +
> >>>  drivers/hwmon/iei-wt61p803-puzzle-hwmon.c | 457 ++++++++++++++++++++++
> >>>  3 files changed, 466 insertions(+)
> >>>  create mode 100644 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
> >>>
> >>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> >>> index 8dc28b26916e..ff279df9bf40 100644
> >>> --- a/drivers/hwmon/Kconfig
> >>> +++ b/drivers/hwmon/Kconfig
> >>> @@ -722,6 +722,14 @@ config SENSORS_IBMPOWERNV
> >>>         This driver can also be built as a module. If so, the module
> >>>         will be called ibmpowernv.
> >>>
> >>> +config SENSORS_IEI_WT61P803_PUZZLE_HWMON
> >>> +     tristate "iEi WT61P803 PUZZLE MFD HWMON Driver"
> >>> +     depends on MFD_IEI_WT61P803_PUZZLE
> >>> +     help
> >>> +       The iEi WT61P803 PUZZLE MFD HWMON Driver handles reading fan speed
> >>> +       and writing fan PWM values. It also supports reading on-board
> >>> +       temperature sensors.
> >>> +
> >>>  config SENSORS_IIO_HWMON
> >>>       tristate "Hwmon driver that uses channels specified via iio maps"
> >>>       depends on IIO
> >>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> >>> index a8f4b35b136b..b0afb2d6896f 100644
> >>> --- a/drivers/hwmon/Makefile
> >>> +++ b/drivers/hwmon/Makefile
> >>> @@ -83,6 +83,7 @@ obj-$(CONFIG_SENSORS_HIH6130)       += hih6130.o
> >>>  obj-$(CONFIG_SENSORS_ULTRA45)        += ultra45_env.o
> >>>  obj-$(CONFIG_SENSORS_I5500)  += i5500_temp.o
> >>>  obj-$(CONFIG_SENSORS_I5K_AMB)        += i5k_amb.o
> >>> +obj-$(CONFIG_SENSORS_IEI_WT61P803_PUZZLE_HWMON) += iei-wt61p803-puzzle-hwmon.o
> >>>  obj-$(CONFIG_SENSORS_IBMAEM) += ibmaem.o
> >>>  obj-$(CONFIG_SENSORS_IBMPEX) += ibmpex.o
> >>>  obj-$(CONFIG_SENSORS_IBMPOWERNV)+= ibmpowernv.o
> >>> diff --git a/drivers/hwmon/iei-wt61p803-puzzle-hwmon.c b/drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
> >>> new file mode 100644
> >>> index 000000000000..be7b019d126c
> >>> --- /dev/null
> >>> +++ b/drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
> >>> @@ -0,0 +1,457 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +/* iEi WT61P803 PUZZLE MCU HWMON Driver
> >>> + *
> >>> + * Copyright (C) 2020 Sartura Ltd.
> >>> + * Author: Luka Kovacic <luka.kovacic@sartura.hr>
> >>> + */
> >>> +
> >>> +#include <linux/err.h>
> >>> +#include <linux/hwmon-sysfs.h>
> >>> +#include <linux/hwmon.h>
> >>> +#include <linux/interrupt.h>
> >>> +#include <linux/irq.h>
> >>> +#include <linux/math64.h>
> >>> +#include <linux/mfd/iei-wt61p803-puzzle.h>
> >>> +#include <linux/mod_devicetable.h>
> >>> +#include <linux/module.h>
> >>> +#include <linux/platform_device.h>
> >>> +#include <linux/property.h>
> >>> +#include <linux/slab.h>
> >>> +#include <linux/thermal.h>
> >>> +
> >>> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_TEMP_NUM 2
> >>> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_FAN_NUM 5
> >>> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM 2
> >>> +#define IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_VAL 255
> >>> +
> >>> +/**
> >>> + * struct iei_wt61p803_puzzle_thermal_cooling_device - Thermal cooling device instance
> >>> + *
> >>> + * @mcu_hwmon:               MCU HWMON struct pointer
> >>> + * @tcdev:           Thermal cooling device pointer
> >>> + * @name:            Thermal cooling device name
> >>> + * @pwm_channel:     PWM channel (0 or 1)
> >>> + * @cooling_levels:  Thermal cooling device cooling levels
> >>> + */
> >>> +struct iei_wt61p803_puzzle_thermal_cooling_device {
> >>> +     struct iei_wt61p803_puzzle_hwmon *mcu_hwmon;
> >>> +     struct thermal_cooling_device *tcdev;
> >>> +     char name[THERMAL_NAME_LENGTH];
> >>> +     int pwm_channel;
> >>> +     u8 *cooling_levels;
> >>> +};
> >>> +
> >>> +/**
> >>> + * struct iei_wt61p803_puzzle_hwmon - MCU HWMON Driver
> >>> + *
> >>> + * @mcu:                             MCU struct pointer
> >>> + * @response_buffer                  Global MCU response buffer allocation
> >>> + * @thermal_cooling_dev_present:     Per-channel thermal cooling device control
> >>> + * @cdev:                            Per-channel thermal cooling device private structure
> >>> + */
> >>> +struct iei_wt61p803_puzzle_hwmon {
> >>> +     struct iei_wt61p803_puzzle *mcu;
> >>> +     unsigned char *response_buffer;
> >>> +     bool thermal_cooling_dev_present[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
> >>> +     struct iei_wt61p803_puzzle_thermal_cooling_device
> >>> +             *cdev[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
> >>> +};
> >>> +
> >>> +#define raw_temp_to_milidegree_celsius(x) ((int)(((x) - 0x80) * 1000))
> >>> +static int iei_wt61p803_puzzle_read_temp_sensor(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon,
> >>> +                                             int channel, int *value)
> >>> +{
> >>> +     unsigned char *resp_buf = mcu_hwmon->response_buffer;
> >>> +     unsigned char temp_sensor_ntc_cmd[4] = {
> >>
> >> static ?
> > These can be changed to static to avoid reallocations, every time the
> > function is called.
> > Although I will always have to assign these values anyway.
> >>
> >>> +             IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> >>> +             IEI_WT61P803_PUZZLE_CMD_TEMP,
> >>> +             IEI_WT61P803_PUZZLE_CMD_TEMP_ALL
> >>> +     };
> >>> +     size_t reply_size = 0;
> >>> +     int ret;
> >>> +
> >>> +     ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, temp_sensor_ntc_cmd,
> >>> +                                             sizeof(temp_sensor_ntc_cmd), resp_buf,
> >>> +                                             &reply_size);
> >>> +
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     /* Check the number of NTC values (should be 0x32/'2') */
> >>> +     if (resp_buf[3] != 0x32)
> >>> +             return -EIO;
> >>> +
> >>> +     *value = raw_temp_to_milidegree_celsius(resp_buf[4 + channel]);
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +#define raw_fan_val_to_rpm(x, y) ((int)(((x) << 8 | (y)) / 2) * 60)
> >>> +static int iei_wt61p803_puzzle_read_fan_speed
> >>> +(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon, int channel, int *value)
> >>> +{
> >>> +     unsigned char *resp_buf = mcu_hwmon->response_buffer;
> >>> +     static const u8 fan_speed_cmds[] = {
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN_RPM_0,
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN_RPM_1,
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN_RPM_2,
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN_RPM_3,
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN_RPM_4
> >>> +     };
> >>> +     unsigned char fan_speed_cmd[4] = {
> >>> +             IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN,
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN_RPM_0
> >>
> >> This is unconditionally overwritten below.
> > I also add it to the array, to make it easier to read if someone is
> > debugging the code.
>
> That doesn't make it easier. It causes everyone (including me) to wonder
> if the overwrite index is wrong, and having to look into details
> to notice that the overwritten value is similar. And that has to be
> repeated for each of the functions over and over again, because
> after all one can not be sure if the submitter maybe got
> some index wrong.
>
> That kind of code in your driver caused me to get stuck on that level
> of review, and I didn't even get to the point where I actually reviewed
> the _real_ code. That kind of code is extremely difficult to review,
> it takes a lot of time to do it, and it can easily result in missing
> the real problems.
>
> Really, code such as
>         unsigned char fan_speed_cmd[4] = {};
>         ...
>
>         fan_speed_cmd[0] = IEI_WT61P803_PUZZLE_CMD_HEADER_START;
>         fan_speed_cmd[1] = IEI_WT61P803_PUZZLE_CMD_FAN;
>         fan_speed_cmd[2] = fan_speed_cmds[channel];
>
> may not look as fancy, but it would be much easier to understand,
> and it would be much easier to see that it does what it is supposed
> to do.
>
> FWIW, the same is true for the actual commands. It is obviously
> your call, but something like
>
> #define IEI_WT61P803_PUZZLE_CMD_FAN_RPM_BASE    'A'
> #define IEI_WT61P803_PUZZLE_CMD_FAN_RPM(x)      (IEI_WT61P803_PUZZLE_CMD_FAN_RPM_BASE + (x))
>
>         fan_speed_cmd[2] = IEI_WT61P803_PUZZLE_CMD_FAN_RPM(channel)
>
> would be much easier to understand and be more straightforward
> than all those arrays.
>
> Guenter
>
Understood. That does look easier to understand.

I'll convert the command arrays to reflect this, where the content of the array
is modified before it's sent.
I will also change the commands, where this applies.

Kind regards,
Luka
> >>
> >>> +     };
> >>> +     size_t reply_size = 0;
> >>> +     int ret;
> >>> +
> >>> +     fan_speed_cmd[2] = fan_speed_cmds[channel];
> >>> +
> >>> +     ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, fan_speed_cmd,
> >>> +                                             sizeof(fan_speed_cmd), resp_buf,
> >>> +                                             &reply_size);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     *value = raw_fan_val_to_rpm(resp_buf[3], resp_buf[4]);
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int iei_wt61p803_puzzle_write_pwm_channel
> >>> +(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon, int channel, long pwm_set_val)
> >>> +{
> >>> +     unsigned char *resp_buf = mcu_hwmon->response_buffer;
> >>> +     static const u8 pwm_set_cmds[] = {
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN_PWM_0,
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN_PWM_1
> >>> +     };
> >>> +     unsigned char pwm_set_cmd[6] = {
> >>> +             IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN,
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN_PWM_WRITE,
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN_PWM_0,
> >>
> >> Another unconditional overwrite.
> >>
> >>> +             0x00
> >>
> >> As is this, and more below. Guess it is on purpose, but I don't
> >> see the point.
> > This one can be removed as it's calculated by the
> > iei_wt61p803_puzzle_write_command
> > function.
> >>
> >>> +     };
> >>> +     size_t reply_size = 0;
> >>> +     int ret;
> >>> +
> >>> +     pwm_set_cmd[3] = pwm_set_cmds[channel];
> >>> +
> >>> +     /* Add the PWM value to the command */
> >>> +     pwm_set_cmd[4] = (unsigned char)pwm_set_val;
> >>> +
> >>> +     ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, pwm_set_cmd,
> >>> +                                             sizeof(pwm_set_cmd), resp_buf,
> >>> +                                             &reply_size);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     /* Store the PWM value */
> >>> +     if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
> >>> +           resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
> >>> +           resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK))
> >>> +             return -EIO;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int iei_wt61p803_puzzle_read_pwm_channel
> >>> +(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon, int channel, int *value)
> >>
> >> I am sure I mentioned before that I don't like those odd follow-up line
> >> indentations.
> > I'll fix these, sorry.
> >>
> >>> +{
> >>> +     unsigned char *resp_buf = mcu_hwmon->response_buffer;
> >>> +     static const u8 pwm_get_cmds[] = {
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN_PWM_0,
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN_PWM_1
> >>> +     };
> >>> +     unsigned char pwm_get_cmd[5] = {
> >>> +             IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN,
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN_PWM_READ,
> >>> +             IEI_WT61P803_PUZZLE_CMD_FAN_PWM_0
> >>> +     };
> >>> +     size_t reply_size = 0;
> >>> +     int ret;
> >>> +
> >>> +     pwm_get_cmd[3] = pwm_get_cmds[channel];
> >>> +
> >>> +     ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, pwm_get_cmd,
> >>> +                                             sizeof(pwm_get_cmd), resp_buf,
> >>> +                                             &reply_size);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     if (resp_buf[2] != IEI_WT61P803_PUZZLE_CMD_FAN_PWM_READ)
> >>> +             return -EIO;
> >>> +
> >>> +     *value = resp_buf[3];
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int iei_wt61p803_puzzle_read(struct device *dev, enum hwmon_sensor_types type,
> >>> +                                 u32 attr, int channel, long *val)
> >>> +{
> >>> +     struct iei_wt61p803_puzzle_hwmon *mcu_hwmon =
> >>> +             dev_get_drvdata(dev->parent);
> >>> +     int ret, value;
> >>> +
> >>> +     switch (type) {
> >>> +     case hwmon_pwm:
> >>> +             if (attr != hwmon_pwm_input)
> >>> +                     return -ENODEV;
> >>
> >> Those are all unnecessary tests, and -ENODEV is wrong.
> > Okay, I can remove the attr tests.
> >>
> >>> +             ret = iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon, channel, &value);
> >>> +             if (ret)
> >>> +                     return ret;
> >>> +             *val = (long)value;
> >>
> >> Unnecessary type cast. The return value of this function is _always_
> >> type casted, which really doesn't make sense.
> >>
> >>> +             return ret;
> >>> +     case hwmon_fan:
> >>> +             if (attr != hwmon_fan_input)
> >>> +                     return -ENODEV;
> >>> +             ret = iei_wt61p803_puzzle_read_fan_speed(mcu_hwmon, channel, &value);
> >>> +             if (ret)
> >>> +                     return ret;
> >>> +             *val = (long)value;
> >>> +             return ret;
> >>> +     case hwmon_temp:
> >>> +             if (attr != hwmon_temp_input)
> >>> +                     return -ENODEV;
> >>> +             ret = iei_wt61p803_puzzle_read_temp_sensor(mcu_hwmon, channel, &value);
> >>> +             if (ret)
> >>> +                     return ret;
> >>> +             *val = (long)value;
> >>
> >> Hmm, seems like you like type casts. Ok, I'll want to see an explanation
> >> for each of those: Explain why the function argument is an int *, and
> >> explain why the it is necessary to type cast the result here.
> > I'll change the function argument to long * to avoid these.
> >>
> >>> +             return ret;
> >>> +     default:
> >>> +             return -ENODEV;
> >>> +     }
> >>> +}
> >>> +
> >>> +static int iei_wt61p803_puzzle_write(struct device *dev, enum hwmon_sensor_types type,
> >>> +                                  u32 attr, int channel, long val)
> >>> +{
> >>> +     struct iei_wt61p803_puzzle_hwmon *mcu_hwmon =
> >>> +             dev_get_drvdata(dev->parent);
> >>> +
> >>> +     if (attr != hwmon_pwm_input)
> >>> +             return -ENODEV;
> >>> +     if (mcu_hwmon->thermal_cooling_dev_present[channel]) {
> >>> +             /*
> >>> +              * The Thermal Framework has already claimed this specific PWM
> >>> +              * channel.
> >>
> >> ... and if it did, this code won't be called. I am sure I mentioned
> >> this before. If you insist keeping it, I'll want to see an explanation
> >> here because I don't want to have to deal with follow-up patches removing
> >> the unnecessary code.
> > In the previous patch this was done here and by setting the visibility
> > (umode_t).
> > I'd rather return an error with more context to the user instead of
> > just changing
> > the permissions on the sysfs attribute.
> >>
> >>> +              */
> >>> +             return -EBUSY;
> >>> +     }
> >>> +     return iei_wt61p803_puzzle_write_pwm_channel(mcu_hwmon, channel, val);
> >>> +}
> >>> +
> >>> +static umode_t iei_wt61p803_puzzle_is_visible(const void *data, enum hwmon_sensor_types type,
> >>> +                                           u32 attr, int channel)
> >>> +{
> >>> +     switch (type) {
> >>> +     case hwmon_pwm:
> >>> +             switch (attr) {
> >>> +             case hwmon_pwm_input:
> >>> +                     return 0644;
> >>> +             default:
> >>> +                     return 0;
> >>> +             }
> >>> +     case hwmon_fan:
> >>> +             switch (attr) {
> >>> +             case hwmon_fan_input:
> >>> +                     return 0444;
> >>> +             default:
> >>> +                     return 0;
> >>> +             }
> >>> +     case hwmon_temp:
> >>> +             switch (attr) {
> >>> +             case hwmon_temp_input:
> >>> +                     return 0444;
> >>> +             default:
> >>> +                     return 0;
> >>> +             }
> >>> +     default:
> >>> +             return 0;
> >>> +     }
> >>> +}
> >>> +
> >>> +static const struct hwmon_ops iei_wt61p803_puzzle_hwmon_ops = {
> >>> +     .is_visible = iei_wt61p803_puzzle_is_visible,
> >>> +     .read = iei_wt61p803_puzzle_read,
> >>> +     .write = iei_wt61p803_puzzle_write,
> >>> +};
> >>> +
> >>> +static const struct hwmon_channel_info *iei_wt61p803_puzzle_info[] = {
> >>> +     HWMON_CHANNEL_INFO(pwm,
> >>> +                        HWMON_PWM_INPUT,
> >>> +                        HWMON_PWM_INPUT),
> >>> +     HWMON_CHANNEL_INFO(fan,
> >>> +                        HWMON_F_INPUT,
> >>> +                        HWMON_F_INPUT,
> >>> +                        HWMON_F_INPUT,
> >>> +                        HWMON_F_INPUT,
> >>> +                        HWMON_F_INPUT),
> >>> +     HWMON_CHANNEL_INFO(temp,
> >>> +                        HWMON_T_INPUT,
> >>> +                        HWMON_T_INPUT),
> >>> +     NULL
> >>> +};
> >>> +
> >>> +static const struct hwmon_chip_info iei_wt61p803_puzzle_chip_info = {
> >>> +     .ops = &iei_wt61p803_puzzle_hwmon_ops,
> >>> +     .info = iei_wt61p803_puzzle_info,
> >>> +};
> >>> +
> >>> +static int iei_wt61p803_puzzle_get_max_state(struct thermal_cooling_device *tcdev,
> >>> +                                          unsigned long *state)
> >>> +{
> >>> +     *state = IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_VAL;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int iei_wt61p803_puzzle_get_cur_state(struct thermal_cooling_device *tcdev,
> >>> +                                          unsigned long *state)
> >>> +{
> >>> +     struct iei_wt61p803_puzzle_thermal_cooling_device *cdev = tcdev->devdata;
> >>> +     struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = cdev->mcu_hwmon;
> >>> +
> >>> +     int ret, value;
> >>> +
> >>> +     if (!mcu_hwmon)
> >>> +             return -EINVAL;
> >>
> >> This check needs to be explained.
> > This is not needed and will be removed.
> >>
> >>> +
> >>> +     ret = iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon, cdev->pwm_channel, &value);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     *state = (unsigned long)value;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int iei_wt61p803_puzzle_set_cur_state
> >>> +(struct thermal_cooling_device *tcdev, unsigned long state)
> >>> +{
> >>> +     struct iei_wt61p803_puzzle_thermal_cooling_device *cdev = tcdev->devdata;
> >>> +     struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = cdev->mcu_hwmon;
> >>> +
> >>> +     if (!mcu_hwmon)
> >>> +             return -EINVAL;
> >>> +
> >>> +     return iei_wt61p803_puzzle_write_pwm_channel(mcu_hwmon, cdev->pwm_channel, state);
> >>> +}
> >>> +
> >>> +static const struct thermal_cooling_device_ops iei_wt61p803_puzzle_cooling_ops = {
> >>> +     .get_max_state = iei_wt61p803_puzzle_get_max_state,
> >>> +     .get_cur_state = iei_wt61p803_puzzle_get_cur_state,
> >>> +     .set_cur_state = iei_wt61p803_puzzle_set_cur_state,
> >>> +};
> >>> +
> >>> +static int iei_wt61p803_puzzle_enable_thermal_cooling_dev
> >>> +(struct device *dev, struct fwnode_handle *child, struct iei_wt61p803_puzzle_hwmon *mcu_hwmon)
> >>> +{
> >>> +     struct iei_wt61p803_puzzle_thermal_cooling_device *cdev;
> >>> +     int ret, num_levels;
> >>> +     u32 pwm_channel;
> >>> +
> >>> +     ret = fwnode_property_read_u32(child, "reg", &pwm_channel);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     mcu_hwmon->thermal_cooling_dev_present[pwm_channel] = true;
> >>> +
> >>> +     num_levels = fwnode_property_read_u8_array(child, "cooling-levels", NULL, 0);
> >>> +     if (num_levels > 0) {
> >>> +             cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> >>> +             if (!cdev)
> >>> +                     return -ENOMEM;
> >>> +
> >>> +             cdev->cooling_levels = devm_kzalloc(dev, num_levels, GFP_KERNEL);
> >>> +             if (!cdev->cooling_levels)
> >>> +                     return -ENOMEM;
> >>> +
> >>> +             ret = fwnode_property_read_u8_array(child, "cooling-levels",
> >>> +                                                 cdev->cooling_levels,
> >>> +                                                 num_levels);
> >>> +             if (ret) {
> >>> +                     dev_err(dev, "Couldn't read property 'cooling-levels'");
> >>> +                     return ret;
> >>> +             }
> >>> +
> >>> +             snprintf(cdev->name, THERMAL_NAME_LENGTH, "iei_wt61p803_puzzle_%d", pwm_channel);
> >>> +
> >>> +             cdev->tcdev = devm_thermal_of_cooling_device_register(dev, NULL,
> >>> +                             cdev->name, cdev, &iei_wt61p803_puzzle_cooling_ops);
> >>> +             if (IS_ERR(cdev->tcdev))
> >>> +                     return PTR_ERR(cdev->tcdev);
> >>> +
> >>> +             cdev->mcu_hwmon = mcu_hwmon;
> >>> +             cdev->pwm_channel = pwm_channel;
> >>> +
> >>> +             mcu_hwmon->cdev[pwm_channel] = cdev;
> >>> +     }
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int iei_wt61p803_puzzle_hwmon_probe(struct platform_device *pdev)
> >>> +{
> >>> +     struct device *dev = &pdev->dev;
> >>> +     struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev->parent);
> >>> +     struct iei_wt61p803_puzzle_hwmon *mcu_hwmon;
> >>> +     struct fwnode_handle *child;
> >>> +     struct device *hwmon_dev;
> >>> +     int ret;
> >>> +
> >>> +     mcu_hwmon = devm_kzalloc(dev, sizeof(*mcu_hwmon), GFP_KERNEL);
> >>> +     if (!mcu_hwmon)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     mcu_hwmon->response_buffer = devm_kzalloc(dev, IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
> >>> +     if (!mcu_hwmon->response_buffer)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     mcu_hwmon->mcu = mcu;
> >>> +     platform_set_drvdata(pdev, mcu_hwmon);
> >>> +
> >>> +     hwmon_dev = devm_hwmon_device_register_with_info(dev, "iei_wt61p803_puzzle",
> >>> +                                                      mcu_hwmon,
> >>> +                                                      &iei_wt61p803_puzzle_chip_info,
> >>> +                                                      NULL);
> >>> +
> >>> +     if (IS_ERR(hwmon_dev))
> >>> +             return PTR_ERR(hwmon_dev);
> >>> +
> >>> +     /* Control fans via PWM lines via Linux Kernel */
> >>> +     if (IS_ENABLED(CONFIG_THERMAL)) {
> >>> +             device_for_each_child_node(dev, child) {
> >>> +                     ret = iei_wt61p803_puzzle_enable_thermal_cooling_dev(dev, child, mcu_hwmon);
> >>> +                     if (ret) {
> >>> +                             dev_err(dev, "Enabling the PWM fan failed\n");
> >>> +                             fwnode_handle_put(child);
> >>> +                             return ret;
> >>> +                     }
> >>> +             }
> >>> +     }
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static const struct of_device_id iei_wt61p803_puzzle_hwmon_id_table[] = {
> >>> +     { .compatible = "iei,wt61p803-puzzle-hwmon" },
> >>> +     {}
> >>> +};
> >>> +MODULE_DEVICE_TABLE(of, iei_wt61p803_puzzle_hwmon_id_table);
> >>> +
> >>> +static struct platform_driver iei_wt61p803_puzzle_hwmon_driver = {
> >>> +     .driver = {
> >>> +             .name = "iei-wt61p803-puzzle-hwmon",
> >>> +             .of_match_table = iei_wt61p803_puzzle_hwmon_id_table,
> >>> +     },
> >>> +     .probe = iei_wt61p803_puzzle_hwmon_probe,
> >>> +};
> >>> +
> >>> +module_platform_driver(iei_wt61p803_puzzle_hwmon_driver);
> >>> +
> >>> +MODULE_DESCRIPTION("iEi WT61P803 PUZZLE MCU HWMON Driver");
> >>> +MODULE_AUTHOR("Luka Kovacic <luka.kovacic@sartura.hr>");
> >>> +MODULE_LICENSE("GPL");
> >>> --
> >>> 2.26.2
> >>>
> >
> > Kind regards,
> > Luka
> >
>
