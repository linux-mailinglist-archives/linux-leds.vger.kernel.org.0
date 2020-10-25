Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73EE2297FCE
	for <lists+linux-leds@lfdr.de>; Sun, 25 Oct 2020 02:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1766588AbgJYB0W (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Oct 2020 21:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1766589AbgJYB0V (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Oct 2020 21:26:21 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2517C0613D2
        for <linux-leds@vger.kernel.org>; Sat, 24 Oct 2020 18:26:21 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id p9so5000494ilr.1
        for <linux-leds@vger.kernel.org>; Sat, 24 Oct 2020 18:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VxZ3UxYxPemlnwMfICb3ouhVPNv37y0m3jFPS6sTZAI=;
        b=z1/9xfa0xNt9bKy6jznsVmPFDEft1KY6ada9+geUK3QxnnX9QmdrHGdxvctK2NBZB1
         4o6nAEiUYnrLrcC9+0okKny0+z4ntOu86oDV+bntPBd2imDzjloNtMpswPOEwnDs7mjF
         t8Wh/B+g6zWtIKuXce4nhueNoWlx65Pl0pMHX1gYxfeyAc8l6nrgKWGDzc0Q6sHiXKI0
         cujDKrUPvoKFULaR4INtdxCt7tQfEIKlTzNOEPnvMXYDGag8tze/uwSw1fNPHZtsCYMC
         WxyfZX2e9ANHngGx5sgrJCj+fGaeIUYDrX6akqLBHPADD6nntQKdJ32Wi48LdaINFxxF
         YgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VxZ3UxYxPemlnwMfICb3ouhVPNv37y0m3jFPS6sTZAI=;
        b=raQOU6tmdwCKhvaki6C4zBSSVBShAFf0bAZRISYsopSV5Wp1MBzC6G1Kk4UWVqMLcO
         G6aAsBdZvuLPQIHkYssPr8QjDP8qfQavew0kEankSlmYDs2WEqv2leFS/6E90Y8g2yGx
         J2v94AST8PFAvbTzUcqKeBqklZmH7XEmCxt9nZdrWuOJeGULcRmZNN6wEicg4nKZj56f
         Wd46779IVbZ0JjpkOn6aaerdTdLsENiwVkCuEzC9Wqwe4MCYDYrYPdNFVdR1VKs9XJWf
         HGLPbjuDgxytyIfQlP8n4DOzbdXSLcHw1HSBFDsCtt4uu8kBs0bbk5zcVH5GwYMz8UmD
         fM7A==
X-Gm-Message-State: AOAM5334CBhQo/it1qNkNvD1d4Y8PDIlv42CGEALM/wrMAPcIFc9LlPQ
        oX4V9rfkZg+bHWbM+NvyjIzFoiRqwe8PW8EaakOxWA==
X-Google-Smtp-Source: ABdhPJyQ5F1jYZX1GW3RGMs0me1Sbr5z1qRVTDsOlzdRwvUaGoafecphAFiH9UrCRY+479pEq5XNthpQ3n8Sowkp/ug=
X-Received: by 2002:a92:1e02:: with SMTP id e2mr6770636ile.294.1603589180763;
 Sat, 24 Oct 2020 18:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201019221859.56680-1-luka.kovacic@sartura.hr>
 <20201019221859.56680-4-luka.kovacic@sartura.hr> <CAHp75VdnOJKwvZUOsj3bbT8tK9uZN=NufDrdhUvS886bNUpWhA@mail.gmail.com>
 <CADZsf3ZmeUZppsJaR7bT8y16L3Mj12tUfzo=hkV4nFgjN64Jqw@mail.gmail.com>
In-Reply-To: <CADZsf3ZmeUZppsJaR7bT8y16L3Mj12tUfzo=hkV4nFgjN64Jqw@mail.gmail.com>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Sun, 25 Oct 2020 02:26:09 +0100
Message-ID: <CADZsf3Yp7LvZU7DNaOBP6KDx3cdV-fqsg74cMzXxSV1Rc+tt4g@mail.gmail.com>
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

Hello Andy,

On Fri, Oct 23, 2020 at 11:47 PM Luka Kovacic <luka.kovacic@sartura.hr> wrote:
>
> Hi Andy,
>
> On Tue, Oct 20, 2020 at 10:59 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Tue, Oct 20, 2020 at 1:19 AM Luka Kovacic <luka.kovacic@sartura.hr> wrote:
> > >
> > > Add the iEi WT61P803 PUZZLE HWMON driver, that handles the fan speed
> > > control via PWM, reading fan speed and reading on-board temperature
> > > sensors.
> > >
> > > The driver registers a HWMON device and a simple thermal cooling device to
> > > enable in-kernel fan management.
> > >
> > > This driver depends on the iEi WT61P803 PUZZLE MFD driver.
> >
> > ...
> >
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/* iEi WT61P803 PUZZLE MCU HWMON Driver
> >
> > Shouldn't be
> > /*
> >  * IEI ...
> >
> > ?
> >
> > ...
> >
> > > +/**
> > > + * struct iei_wt61p803_puzzle_thermal_cooling_device - Thermal cooling device instance
> >
> > > + *
> >
> > Please, remove all these blank lines in kernel doc descriptions.
> >
> > > + * @mcu_hwmon:         MCU HWMON struct pointer
> > > + * @tcdev:             Thermal cooling device pointer
> > > + * @name:              Thermal cooling device name
> > > + * @pwm_channel:       PWM channel (0 or 1)
> > > + * @cooling_levels:    Thermal cooling device cooling levels
> > > + */
> >
> > ...
> >
> > > +struct iei_wt61p803_puzzle_hwmon {
> > > +       struct iei_wt61p803_puzzle *mcu;
> > > +       unsigned char *response_buffer;
> > > +       bool thermal_cooling_dev_present[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
> > > +       struct iei_wt61p803_puzzle_thermal_cooling_device
> > > +               *cdev[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
> >
> > Isn't this constant a bit too long? Perhaps drop NUM (MAX would
> > suffice I think) for a starter.
>
> Okay, I'll drop NUM.
>
> >
> > > +};
> >
> > ...
> >
> > > +       static unsigned char temp_sensor_ntc_cmd[4] = {
> > > +               IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> > > +               IEI_WT61P803_PUZZLE_CMD_TEMP,
> > > +               IEI_WT61P803_PUZZLE_CMD_TEMP_ALL
> >
> > + comma.
> >
> > > +       };
> >
> > Why not to be consistent with the rest assignments, choose either
> > above form, or like you have done in the below functions.
>
> Assignments, where the array content will not be modified with custom
> values are done as above.
> Although I could change these to the other form, if that makes it clearer.

I sent out a new patchset that fixes all of the mentioned points,
except this one.
I'd like to keep the assignments, which aren't changed later in the
code assigned,
when the variable is defined.

Kind regards,
Luka

>
> > Also, why 4?
>
> 1 additional character is always required, as this array is passed by reference
> to the iei_wt61p803_puzzle_write_command() function, which requires it to
> store a calculated checksum of the array content.
>
> This is done to avoid unnecessary copying of the array inside the MFD driver.
>
> The checksum is a part of the command, so the driver and the MCU can check
> the integrity of the sent data.
>
> >
> > > +       size_t reply_size = 0;
> >
> > How is it used in all these functions?
>
> I will add an additional check for the size of the received reply, as
> it should be fixed.
>
> >
> > > +       int ret;
> > > +
> > > +       ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, temp_sensor_ntc_cmd,
> > > +                                               sizeof(temp_sensor_ntc_cmd), resp_buf,
> > > +                                               &reply_size);
> > > +
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       /* Check the number of NTC values (should be 0x32/'2') */
> >
> > > +       if (resp_buf[3] != 0x32)
> >
> > Instead of comment in the parentheses, just do it here
> > " != '2')"
> >
> > > +               return -EIO;
> >
> > ...
> >
> > > +static int iei_wt61p803_puzzle_read(struct device *dev, enum hwmon_sensor_types type,
> > > +                                   u32 attr, int channel, long *val)
> > > +{
> > > +       struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = dev_get_drvdata(dev->parent);
> > > +       int ret;
> > > +
> > > +       switch (type) {
> > > +       case hwmon_pwm:
> >
> > > +               ret = iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon, channel, val);
> > > +               return ret;
> >
> >   return iei_...(...);
> > in all such cases.
> >
> > > +       case hwmon_fan:
> > > +               ret = iei_wt61p803_puzzle_read_fan_speed(mcu_hwmon, channel, val);
> > > +               return ret;
> > > +       case hwmon_temp:
> > > +               ret = iei_wt61p803_puzzle_read_temp_sensor(mcu_hwmon, channel, val);
> > > +               return ret;
> > > +       default:
> > > +               return -EINVAL;
> > > +       }
> > > +}
> >
> > ...
> >
> > > +static umode_t iei_wt61p803_puzzle_is_visible(const void *data, enum hwmon_sensor_types type,
> > > +                                             u32 attr, int channel)
> > > +{
> > > +       switch (type) {
> > > +       case hwmon_pwm:
> >
> > > +               switch (attr) {
> > > +               case hwmon_pwm_input:
> > > +                       return 0644;
> > > +               default:
> > > +                       return 0;
> > > +               }
> >
> > Isn't too long for
> >   if (attr == ...)
> >     return 0644;
> >   break;
> >
> > ...see below...
> >
> > > +       case hwmon_fan:
> > > +               switch (attr) {
> > > +               case hwmon_fan_input:
> > > +                       return 0444;
> > > +               default:
> > > +                       return 0;
> > > +               }
> > > +       case hwmon_temp:
> > > +               switch (attr) {
> > > +               case hwmon_temp_input:
> > > +                       return 0444;
> > > +               default:
> > > +                       return 0;
> > > +               }
> >
> > > +       default:
> > > +               return 0;
> >
> > break;
> >
> > > +       }
> >
> > return 0;
> >
> > ?
> >
> > > +}
> >
> > ...
> >
> > > +       mcu_hwmon->thermal_cooling_dev_present[pwm_channel] = true;
> > > +
> >
> > > +       num_levels = fwnode_property_read_u8_array(child, "cooling-levels", NULL, 0);
> >
> > fwnode_property_count_u8()
> >
> > > +       if (num_levels > 0) {
> >
> > You can improve readability by reducing indentation level via
> > replacement to negative conditional.
> >
> > > +               cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> > > +               if (!cdev)
> > > +                       return -ENOMEM;
> > > +
> > > +               cdev->cooling_levels = devm_kzalloc(dev, num_levels, GFP_KERNEL);
> >
> > For the sake of cleaness, shouldn't it be devm_kmalloc_array() ?
> > (Note, zeroing is not needed if you read entire array)
>
> I agree, this can be converted to devm_kmalloc_array().
>
> >
> > > +               if (!cdev->cooling_levels)
> > > +                       return -ENOMEM;
> > > +
> > > +               ret = fwnode_property_read_u8_array(child, "cooling-levels",
> > > +                                                   cdev->cooling_levels,
> > > +                                                   num_levels);
> > > +               if (ret) {
> > > +                       dev_err(dev, "Couldn't read property 'cooling-levels'");
> > > +                       return ret;
> > > +               }
> > > +
> > > +               snprintf(cdev->name, THERMAL_NAME_LENGTH, "iei_wt61p803_puzzle_%d", pwm_channel);
> > > +
> > > +               cdev->tcdev = devm_thermal_of_cooling_device_register(dev, NULL,
> > > +                               cdev->name, cdev, &iei_wt61p803_puzzle_cooling_ops);
> > > +               if (IS_ERR(cdev->tcdev))
> > > +                       return PTR_ERR(cdev->tcdev);
> > > +
> > > +               cdev->mcu_hwmon = mcu_hwmon;
> > > +               cdev->pwm_channel = pwm_channel;
> > > +
> > > +               mcu_hwmon->cdev[pwm_channel] = cdev;
> > > +       }
> > > +       return 0;
> > > +}
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
>
> I'll fix the issues you have mentioned above in the next patchset.
>
> Kind regards,
> Luka
