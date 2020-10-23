Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41CDB29790A
	for <lists+linux-leds@lfdr.de>; Fri, 23 Oct 2020 23:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756852AbgJWVrl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 23 Oct 2020 17:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756841AbgJWVrl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 23 Oct 2020 17:47:41 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EB9C0613D4
        for <linux-leds@vger.kernel.org>; Fri, 23 Oct 2020 14:47:40 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id k21so3642660ioa.9
        for <linux-leds@vger.kernel.org>; Fri, 23 Oct 2020 14:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0bMgtasO4QBS+scqrbphxnvvVoAnwMbRo+mZ6Ntpvjs=;
        b=bNX6ybv0AO6sp4f5ztASsGBxYRgYu0fc4lU0L73qh9nIGwqF2hXWuEct+FtthQDVg1
         ujKzCoyDngBlbXsY5t4LZizU7Z1x0tS8/LUfXDfuGizwl+A6dBcs/+DGqTQYGZqDpI6e
         E7ROBgZtPRplyUj8P9K3mmepBogAH1HBhcm8pYvc084JbmVlWquktxqZtRJj+tSHdSIn
         qvIbxco5HC/FGqInw5BBMuUEd9nM9e1mTu0WVNHZBlqrR4x394eThFmoRt+s6cBcB2hY
         C46YXP9RHpWBs2QjVovDu3urI1Gf2a/0/EwGKN7G7WDyngoDojNy4X0EfOCZicX/+4St
         QtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0bMgtasO4QBS+scqrbphxnvvVoAnwMbRo+mZ6Ntpvjs=;
        b=JMBZ3O12G3OQZ+urQHlOY3oCBwoGDeiu7gs42gtOwP3gNJePYBU4ANUUg/FBaKUEN4
         Ye2mO6gglR8qewbXzOJmVeP8B1o/zfLt/mBWzHSG3nPOlVt3GgOlAApdxu1IVArD4oth
         MOQfmepLvrlwMII8pKIcXYsReWFXLls4DbLQw+ogRKHAtEP6Il3m126wHpuMLD1VPO5Z
         sm2z2w70JE7OJKbG/nxcoNDWUBW6YhFfs1xtiNoh7/1rg9k0QmH13PrV1jql/fj94GYn
         k+9kNsEBrGuDP2k6VmjrcltiSMw61R6ixW3uf4TapC/q48xwb39vxJp7ScZ8Ge2jwqIm
         ROyg==
X-Gm-Message-State: AOAM532isTdeFEinr+1z9l5AGxv9ZXltbdQnpNxJ05ek6FkPbHfHzw1t
        /hka23fZW+gs4bxQ2V57uPsCuDn6oRlqujfzX2PeDg==
X-Google-Smtp-Source: ABdhPJwmsICvvBHRjddvvDlPICyYoGvXJVqPhH5tNcUKl1CNIHm37eTmY2ANj/DGf1XDGcjrDrbzmEtJesCXYco7aP8=
X-Received: by 2002:a02:9543:: with SMTP id y61mr3842876jah.64.1603489660073;
 Fri, 23 Oct 2020 14:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201019221859.56680-1-luka.kovacic@sartura.hr>
 <20201019221859.56680-4-luka.kovacic@sartura.hr> <CAHp75VdnOJKwvZUOsj3bbT8tK9uZN=NufDrdhUvS886bNUpWhA@mail.gmail.com>
In-Reply-To: <CAHp75VdnOJKwvZUOsj3bbT8tK9uZN=NufDrdhUvS886bNUpWhA@mail.gmail.com>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Fri, 23 Oct 2020 23:47:29 +0200
Message-ID: <CADZsf3ZmeUZppsJaR7bT8y16L3Mj12tUfzo=hkV4nFgjN64Jqw@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] drivers: hwmon: Add the iEi WT61P803 PUZZLE HWMON driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Andy,

On Tue, Oct 20, 2020 at 10:59 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Oct 20, 2020 at 1:19 AM Luka Kovacic <luka.kovacic@sartura.hr> wrote:
> >
> > Add the iEi WT61P803 PUZZLE HWMON driver, that handles the fan speed
> > control via PWM, reading fan speed and reading on-board temperature
> > sensors.
> >
> > The driver registers a HWMON device and a simple thermal cooling device to
> > enable in-kernel fan management.
> >
> > This driver depends on the iEi WT61P803 PUZZLE MFD driver.
>
> ...
>
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* iEi WT61P803 PUZZLE MCU HWMON Driver
>
> Shouldn't be
> /*
>  * IEI ...
>
> ?
>
> ...
>
> > +/**
> > + * struct iei_wt61p803_puzzle_thermal_cooling_device - Thermal cooling device instance
>
> > + *
>
> Please, remove all these blank lines in kernel doc descriptions.
>
> > + * @mcu_hwmon:         MCU HWMON struct pointer
> > + * @tcdev:             Thermal cooling device pointer
> > + * @name:              Thermal cooling device name
> > + * @pwm_channel:       PWM channel (0 or 1)
> > + * @cooling_levels:    Thermal cooling device cooling levels
> > + */
>
> ...
>
> > +struct iei_wt61p803_puzzle_hwmon {
> > +       struct iei_wt61p803_puzzle *mcu;
> > +       unsigned char *response_buffer;
> > +       bool thermal_cooling_dev_present[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
> > +       struct iei_wt61p803_puzzle_thermal_cooling_device
> > +               *cdev[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
>
> Isn't this constant a bit too long? Perhaps drop NUM (MAX would
> suffice I think) for a starter.

Okay, I'll drop NUM.

>
> > +};
>
> ...
>
> > +       static unsigned char temp_sensor_ntc_cmd[4] = {
> > +               IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> > +               IEI_WT61P803_PUZZLE_CMD_TEMP,
> > +               IEI_WT61P803_PUZZLE_CMD_TEMP_ALL
>
> + comma.
>
> > +       };
>
> Why not to be consistent with the rest assignments, choose either
> above form, or like you have done in the below functions.

Assignments, where the array content will not be modified with custom
values are done as above.
Although I could change these to the other form, if that makes it clearer.

> Also, why 4?

1 additional character is always required, as this array is passed by reference
to the iei_wt61p803_puzzle_write_command() function, which requires it to
store a calculated checksum of the array content.

This is done to avoid unnecessary copying of the array inside the MFD driver.

The checksum is a part of the command, so the driver and the MCU can check
the integrity of the sent data.

>
> > +       size_t reply_size = 0;
>
> How is it used in all these functions?

I will add an additional check for the size of the received reply, as
it should be fixed.

>
> > +       int ret;
> > +
> > +       ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, temp_sensor_ntc_cmd,
> > +                                               sizeof(temp_sensor_ntc_cmd), resp_buf,
> > +                                               &reply_size);
> > +
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Check the number of NTC values (should be 0x32/'2') */
>
> > +       if (resp_buf[3] != 0x32)
>
> Instead of comment in the parentheses, just do it here
> " != '2')"
>
> > +               return -EIO;
>
> ...
>
> > +static int iei_wt61p803_puzzle_read(struct device *dev, enum hwmon_sensor_types type,
> > +                                   u32 attr, int channel, long *val)
> > +{
> > +       struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = dev_get_drvdata(dev->parent);
> > +       int ret;
> > +
> > +       switch (type) {
> > +       case hwmon_pwm:
>
> > +               ret = iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon, channel, val);
> > +               return ret;
>
>   return iei_...(...);
> in all such cases.
>
> > +       case hwmon_fan:
> > +               ret = iei_wt61p803_puzzle_read_fan_speed(mcu_hwmon, channel, val);
> > +               return ret;
> > +       case hwmon_temp:
> > +               ret = iei_wt61p803_puzzle_read_temp_sensor(mcu_hwmon, channel, val);
> > +               return ret;
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +}
>
> ...
>
> > +static umode_t iei_wt61p803_puzzle_is_visible(const void *data, enum hwmon_sensor_types type,
> > +                                             u32 attr, int channel)
> > +{
> > +       switch (type) {
> > +       case hwmon_pwm:
>
> > +               switch (attr) {
> > +               case hwmon_pwm_input:
> > +                       return 0644;
> > +               default:
> > +                       return 0;
> > +               }
>
> Isn't too long for
>   if (attr == ...)
>     return 0644;
>   break;
>
> ...see below...
>
> > +       case hwmon_fan:
> > +               switch (attr) {
> > +               case hwmon_fan_input:
> > +                       return 0444;
> > +               default:
> > +                       return 0;
> > +               }
> > +       case hwmon_temp:
> > +               switch (attr) {
> > +               case hwmon_temp_input:
> > +                       return 0444;
> > +               default:
> > +                       return 0;
> > +               }
>
> > +       default:
> > +               return 0;
>
> break;
>
> > +       }
>
> return 0;
>
> ?
>
> > +}
>
> ...
>
> > +       mcu_hwmon->thermal_cooling_dev_present[pwm_channel] = true;
> > +
>
> > +       num_levels = fwnode_property_read_u8_array(child, "cooling-levels", NULL, 0);
>
> fwnode_property_count_u8()
>
> > +       if (num_levels > 0) {
>
> You can improve readability by reducing indentation level via
> replacement to negative conditional.
>
> > +               cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> > +               if (!cdev)
> > +                       return -ENOMEM;
> > +
> > +               cdev->cooling_levels = devm_kzalloc(dev, num_levels, GFP_KERNEL);
>
> For the sake of cleaness, shouldn't it be devm_kmalloc_array() ?
> (Note, zeroing is not needed if you read entire array)

I agree, this can be converted to devm_kmalloc_array().

>
> > +               if (!cdev->cooling_levels)
> > +                       return -ENOMEM;
> > +
> > +               ret = fwnode_property_read_u8_array(child, "cooling-levels",
> > +                                                   cdev->cooling_levels,
> > +                                                   num_levels);
> > +               if (ret) {
> > +                       dev_err(dev, "Couldn't read property 'cooling-levels'");
> > +                       return ret;
> > +               }
> > +
> > +               snprintf(cdev->name, THERMAL_NAME_LENGTH, "iei_wt61p803_puzzle_%d", pwm_channel);
> > +
> > +               cdev->tcdev = devm_thermal_of_cooling_device_register(dev, NULL,
> > +                               cdev->name, cdev, &iei_wt61p803_puzzle_cooling_ops);
> > +               if (IS_ERR(cdev->tcdev))
> > +                       return PTR_ERR(cdev->tcdev);
> > +
> > +               cdev->mcu_hwmon = mcu_hwmon;
> > +               cdev->pwm_channel = pwm_channel;
> > +
> > +               mcu_hwmon->cdev[pwm_channel] = cdev;
> > +       }
> > +       return 0;
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko

I'll fix the issues you have mentioned above in the next patchset.

Kind regards,
Luka
