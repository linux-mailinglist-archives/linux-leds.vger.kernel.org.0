Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60104293755
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 11:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392227AbgJTJAB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Oct 2020 05:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390221AbgJTJAA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Oct 2020 05:00:00 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF8BC061755;
        Tue, 20 Oct 2020 01:59:58 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id 1so694014ple.2;
        Tue, 20 Oct 2020 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=32DXXPaYfvqxwZc+Ufdj/EMGZ4IWPmSRmpTewywNSVQ=;
        b=DJsnW1P05d7r36kJe9UFhBkPyK47QtTUllE/9wSt6mFWlQrqhnXzAXpXrraJ63H2PI
         t3QICPI4dBsZEBL0SC7WbjHfST3LNuN+CzDk3y+fI2J4ou0Uc2sFUD64bG+Zj2DONrDx
         is6kd+2TSqwo0l3NQEbnGrgz4WOe9VfSh3Y5xNZ3zQ/2eCA5fVmUtl+Pb5pjkCS9B3AZ
         +uTv2uXtx748Osd/DvW7NtpHtHFnEHce97KWof0xhKhbvDHq2dYys35j4YMar3l4gZ0O
         eKEsXwE+NPyQt7U+QRTtkFoOLYRMr8TYKu/9fRcnC+S9BpU3uD8RBei3KpUPZSpq4yJ/
         lGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=32DXXPaYfvqxwZc+Ufdj/EMGZ4IWPmSRmpTewywNSVQ=;
        b=Ux5PUrUNWOekIDDo/cQrxv6/jp5FmfWiyL8/AO+WaNRpHAPUwbNKO41OFMVtje//7Y
         SAXfxLbbzYtq0VbT6fXWMUui47HIwx1xhmqP7YdDAEXneyNuLAWYznchWdEI3ZZe8+1U
         emcR7U6Je2M+dyRN9SUV8CfBG6M/Xtwx/2Ffgrk6dV5I0WRPZORgBGrhI/x+PqnRkdxb
         90QQEtVUduY//MvbGM4Q4qjAd19L3Z1lV5nY+BtB5E6st+Rkt4GdDYMTgHyWlcWrol/S
         Y5oRynxIMqhMDFKE5lvP0Pvq22PhszDx9o4XOo2T11RhPQ3rM7Eee8i1PtA1wvOzq/bY
         3yig==
X-Gm-Message-State: AOAM532ezBnZB5sWFtWB1H9lA/stSHLBgiBNm88mfBuNNcYWJDlGOvB+
        XV6muCIezfRubneI5OeuP7/E9gi7b/W3/r66ohk=
X-Google-Smtp-Source: ABdhPJy9hwkmHtqN6ASWpH6MTF2qZAFQwMqgbuqGxJNxCVnhfHfDYrm6umFgVnKv6i8wAf0+VfuWbMJvxUAq2uxoib0=
X-Received: by 2002:a17:90b:305:: with SMTP id ay5mr1938344pjb.129.1603184398230;
 Tue, 20 Oct 2020 01:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201019221859.56680-1-luka.kovacic@sartura.hr> <20201019221859.56680-4-luka.kovacic@sartura.hr>
In-Reply-To: <20201019221859.56680-4-luka.kovacic@sartura.hr>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 20 Oct 2020 12:00:47 +0300
Message-ID: <CAHp75VdnOJKwvZUOsj3bbT8tK9uZN=NufDrdhUvS886bNUpWhA@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] drivers: hwmon: Add the iEi WT61P803 PUZZLE HWMON driver
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        luka.perkov@sartura.hr, robert.marko@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Oct 20, 2020 at 1:19 AM Luka Kovacic <luka.kovacic@sartura.hr> wrote:
>
> Add the iEi WT61P803 PUZZLE HWMON driver, that handles the fan speed
> control via PWM, reading fan speed and reading on-board temperature
> sensors.
>
> The driver registers a HWMON device and a simple thermal cooling device to
> enable in-kernel fan management.
>
> This driver depends on the iEi WT61P803 PUZZLE MFD driver.

...

> +// SPDX-License-Identifier: GPL-2.0-only
> +/* iEi WT61P803 PUZZLE MCU HWMON Driver

Shouldn't be
/*
 * IEI ...

?

...

> +/**
> + * struct iei_wt61p803_puzzle_thermal_cooling_device - Thermal cooling device instance

> + *

Please, remove all these blank lines in kernel doc descriptions.

> + * @mcu_hwmon:         MCU HWMON struct pointer
> + * @tcdev:             Thermal cooling device pointer
> + * @name:              Thermal cooling device name
> + * @pwm_channel:       PWM channel (0 or 1)
> + * @cooling_levels:    Thermal cooling device cooling levels
> + */

...

> +struct iei_wt61p803_puzzle_hwmon {
> +       struct iei_wt61p803_puzzle *mcu;
> +       unsigned char *response_buffer;
> +       bool thermal_cooling_dev_present[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
> +       struct iei_wt61p803_puzzle_thermal_cooling_device
> +               *cdev[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];

Isn't this constant a bit too long? Perhaps drop NUM (MAX would
suffice I think) for a starter.

> +};

...

> +       static unsigned char temp_sensor_ntc_cmd[4] = {
> +               IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> +               IEI_WT61P803_PUZZLE_CMD_TEMP,
> +               IEI_WT61P803_PUZZLE_CMD_TEMP_ALL

+ comma.

> +       };

Why not to be consistent with the rest assignments, choose either
above form, or like you have done in the below functions.
Also, why 4?

> +       size_t reply_size = 0;

How is it used in all these functions?

> +       int ret;
> +
> +       ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, temp_sensor_ntc_cmd,
> +                                               sizeof(temp_sensor_ntc_cmd), resp_buf,
> +                                               &reply_size);
> +
> +       if (ret)
> +               return ret;
> +
> +       /* Check the number of NTC values (should be 0x32/'2') */

> +       if (resp_buf[3] != 0x32)

Instead of comment in the parentheses, just do it here
" != '2')"

> +               return -EIO;

...

> +static int iei_wt61p803_puzzle_read(struct device *dev, enum hwmon_sensor_types type,
> +                                   u32 attr, int channel, long *val)
> +{
> +       struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = dev_get_drvdata(dev->parent);
> +       int ret;
> +
> +       switch (type) {
> +       case hwmon_pwm:

> +               ret = iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon, channel, val);
> +               return ret;

  return iei_...(...);
in all such cases.

> +       case hwmon_fan:
> +               ret = iei_wt61p803_puzzle_read_fan_speed(mcu_hwmon, channel, val);
> +               return ret;
> +       case hwmon_temp:
> +               ret = iei_wt61p803_puzzle_read_temp_sensor(mcu_hwmon, channel, val);
> +               return ret;
> +       default:
> +               return -EINVAL;
> +       }
> +}

...

> +static umode_t iei_wt61p803_puzzle_is_visible(const void *data, enum hwmon_sensor_types type,
> +                                             u32 attr, int channel)
> +{
> +       switch (type) {
> +       case hwmon_pwm:

> +               switch (attr) {
> +               case hwmon_pwm_input:
> +                       return 0644;
> +               default:
> +                       return 0;
> +               }

Isn't too long for
  if (attr == ...)
    return 0644;
  break;

...see below...

> +       case hwmon_fan:
> +               switch (attr) {
> +               case hwmon_fan_input:
> +                       return 0444;
> +               default:
> +                       return 0;
> +               }
> +       case hwmon_temp:
> +               switch (attr) {
> +               case hwmon_temp_input:
> +                       return 0444;
> +               default:
> +                       return 0;
> +               }

> +       default:
> +               return 0;

break;

> +       }

return 0;

?

> +}

...

> +       mcu_hwmon->thermal_cooling_dev_present[pwm_channel] = true;
> +

> +       num_levels = fwnode_property_read_u8_array(child, "cooling-levels", NULL, 0);

fwnode_property_count_u8()

> +       if (num_levels > 0) {

You can improve readability by reducing indentation level via
replacement to negative conditional.

> +               cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> +               if (!cdev)
> +                       return -ENOMEM;
> +
> +               cdev->cooling_levels = devm_kzalloc(dev, num_levels, GFP_KERNEL);

For the sake of cleaness, shouldn't it be devm_kmalloc_array() ?
(Note, zeroing is not needed if you read entire array)

> +               if (!cdev->cooling_levels)
> +                       return -ENOMEM;
> +
> +               ret = fwnode_property_read_u8_array(child, "cooling-levels",
> +                                                   cdev->cooling_levels,
> +                                                   num_levels);
> +               if (ret) {
> +                       dev_err(dev, "Couldn't read property 'cooling-levels'");
> +                       return ret;
> +               }
> +
> +               snprintf(cdev->name, THERMAL_NAME_LENGTH, "iei_wt61p803_puzzle_%d", pwm_channel);
> +
> +               cdev->tcdev = devm_thermal_of_cooling_device_register(dev, NULL,
> +                               cdev->name, cdev, &iei_wt61p803_puzzle_cooling_ops);
> +               if (IS_ERR(cdev->tcdev))
> +                       return PTR_ERR(cdev->tcdev);
> +
> +               cdev->mcu_hwmon = mcu_hwmon;
> +               cdev->pwm_channel = pwm_channel;
> +
> +               mcu_hwmon->cdev[pwm_channel] = cdev;
> +       }
> +       return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko
