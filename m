Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 861F42D8C0E
	for <lists+linux-leds@lfdr.de>; Sun, 13 Dec 2020 09:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387416AbgLMIBk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 13 Dec 2020 03:01:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbgLMIBk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 13 Dec 2020 03:01:40 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 328FBC0613CF;
        Sun, 13 Dec 2020 00:01:00 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id u12so12847223ilv.3;
        Sun, 13 Dec 2020 00:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SptOwLmCUuWK4mUudyEVRWCBB5pTnk1I3n0w36lMi9g=;
        b=uuEYFa6HoV28cwjfy5wFMvdsb0auwEzNdOTfRNQhZJ90roavKRziOOCSwLwiQJu6tF
         A9Zhh4VJ3NNtE0ab0btNe9fsBBQZwDpiQBpwmq1+PSd2ty9m/8rgdUlkxEh1I6Xp3awX
         KZ6pijACs/pkePCxpfd+sjo4TnixiKvQRClnEpf2t8X5StHp09S80+D/QMMrxZWOdkWJ
         nOWveoYQY73DVsdNLBaDc4RkgknDJ5jIaaTbsffNoL9FuXdfndHny5EXHgevuJF/GL/q
         ynQc83cO8hvOVR2WMozjtJ+MNl46buen3zY9s39dkJGtldP/X4CRswUA4pqP35PFPqzD
         CqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SptOwLmCUuWK4mUudyEVRWCBB5pTnk1I3n0w36lMi9g=;
        b=fa0XTCSAfbEbfQucLVWYKyMBu4ioGv9CsmyUnOjgtZ71qOr+CHSUE8Zx4YnuNyxbTg
         jhpNv1Ei63sUFYCTh9Wyk9+R2O24zI5SFVN39Oqw0yKUmAy26XkFqQnnasCcGrJNAJ46
         jkmcEgDiz+xuEqXwHBIJL51FXN8CN0M1vxyvwiPBA88XUfP9/f1824xPK2ydmoNncp+m
         Zh2ugbGIvZwMVjGxf8tTsPtB6JOJ291tmFwuaQKYrw5HOE9KkEf7vaB4vEegld/rsRaO
         3TRTFggscUbOsccjvhJTsc2Nkh2ZKstDB1w8TvIsCkRSpaIBxZZBWvanJEGQpiG1CY61
         ZGPw==
X-Gm-Message-State: AOAM5309xVW0D6hL7FD/YL0NkKGPvjvHub9y8L4OVnl4IyOh4CfAfo+G
        UVK/GwqdBqxJ+K8eofOnc8rqc3B6GIR3oobGVFQ=
X-Google-Smtp-Source: ABdhPJyri/5+Z8dIb+Y+i2EW/Gy7oOaTCtvTml3CVnDQJMIsTYkZyUIBcvLiU7D5NAXn4eXaKtBsQsCIU6sAPe/KW+c=
X-Received: by 2002:a92:8587:: with SMTP id f129mr26921257ilh.251.1607846459335;
 Sun, 13 Dec 2020 00:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20201212195548.231494-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201212195548.231494-1-dwaipayanray1@gmail.com>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Sun, 13 Dec 2020 09:00:48 +0100
Message-ID: <CAKXUXMx9EnhWhGAJf4ousAgkxDUrN=g2zGaPEk6ijJYse7VJaQ@mail.gmail.com>
Subject: Re: [PATCH] leds: Use DEVICE_ATTR_{RW, RO, WO} macros
To:     Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc:     linux-leds@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Dec 12, 2020 at 8:56 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Instead of open coding DEVICE_ATTR() defines, use the
> DEVICE_ATTR_RW(), DEVICE_ATTR_WO(), and DEVICE_ATTR_RO()
> macros intead.

typo: s/intead/instead/

No need to use the word "instead" twice in one sentence, though, we got it :)

>
> This required a few functions to be renamed, but the functionality
> itself is unchanged.
>
> Note that this is compile tested only.
>

This note does not go in the commit message. In the future, this will
be simply not true anymore, but this below the "---" (see HERE! as
marker).

For testing, you can generate the objdump of the binary before and
after and compare if that is as expected.

Other than that, the change itself looks good to me, so:

Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thanks, Dwaipayan, for fixing this up.

Will you also add a checkpatch rule to identify other DEVICE_ATTR(...)
that can be adjusted to the refined macros, so that checkpatch informs
other submitters as well?

> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Cc: linux-leds@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-kernel-mentees@lists.linuxfoundation.org

As far as I know, the maintainers will add the Cc lines---if they like
those---with script support.

> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---

HERE!

>  drivers/leds/leds-blinkm.c        | 24 ++++++++++++------------
>  drivers/leds/leds-lm3530.c        | 10 +++++-----
>  drivers/leds/leds-lm355x.c        |  8 ++++----
>  drivers/leds/leds-lm3642.c        | 16 ++++++++--------
>  drivers/leds/leds-max8997.c       | 12 ++++++------
>  drivers/leds/leds-netxbig.c       | 12 ++++++------
>  drivers/leds/leds-ss4200.c        | 12 ++++++------
>  drivers/leds/leds-wm831x-status.c | 12 ++++++------
>  8 files changed, 53 insertions(+), 53 deletions(-)
>
> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
> index e11fe1788242..b4e1fdff4186 100644
> --- a/drivers/leds/leds-blinkm.c
> +++ b/drivers/leds/leds-blinkm.c
> @@ -192,13 +192,13 @@ static int store_color_common(struct device *dev, const char *buf, int color)
>         return 0;
>  }
>
> -static ssize_t show_red(struct device *dev, struct device_attribute *attr,
> +static ssize_t red_show(struct device *dev, struct device_attribute *attr,
>                         char *buf)
>  {
>         return show_color_common(dev, buf, RED);
>  }
>
> -static ssize_t store_red(struct device *dev, struct device_attribute *attr,
> +static ssize_t red_store(struct device *dev, struct device_attribute *attr,
>                          const char *buf, size_t count)
>  {
>         int ret;
> @@ -209,15 +209,15 @@ static ssize_t store_red(struct device *dev, struct device_attribute *attr,
>         return count;
>  }
>
> -static DEVICE_ATTR(red, S_IRUGO | S_IWUSR, show_red, store_red);
> +static DEVICE_ATTR_RW(red);
>
> -static ssize_t show_green(struct device *dev, struct device_attribute *attr,
> +static ssize_t green_show(struct device *dev, struct device_attribute *attr,
>                           char *buf)
>  {
>         return show_color_common(dev, buf, GREEN);
>  }
>
> -static ssize_t store_green(struct device *dev, struct device_attribute *attr,
> +static ssize_t green_store(struct device *dev, struct device_attribute *attr,
>                            const char *buf, size_t count)
>  {
>
> @@ -229,15 +229,15 @@ static ssize_t store_green(struct device *dev, struct device_attribute *attr,
>         return count;
>  }
>
> -static DEVICE_ATTR(green, S_IRUGO | S_IWUSR, show_green, store_green);
> +static DEVICE_ATTR_RW(green);
>
> -static ssize_t show_blue(struct device *dev, struct device_attribute *attr,
> +static ssize_t blue_show(struct device *dev, struct device_attribute *attr,
>                          char *buf)
>  {
>         return show_color_common(dev, buf, BLUE);
>  }
>
> -static ssize_t store_blue(struct device *dev, struct device_attribute *attr,
> +static ssize_t blue_store(struct device *dev, struct device_attribute *attr,
>                           const char *buf, size_t count)
>  {
>         int ret;
> @@ -248,16 +248,16 @@ static ssize_t store_blue(struct device *dev, struct device_attribute *attr,
>         return count;
>  }
>
> -static DEVICE_ATTR(blue, S_IRUGO | S_IWUSR, show_blue, store_blue);
> +static DEVICE_ATTR_RW(blue);
>
> -static ssize_t show_test(struct device *dev, struct device_attribute *attr,
> +static ssize_t test_show(struct device *dev, struct device_attribute *attr,
>                          char *buf)
>  {
>         return scnprintf(buf, PAGE_SIZE,
>                          "#Write into test to start test sequence!#\n");
>  }
>
> -static ssize_t store_test(struct device *dev, struct device_attribute *attr,
> +static ssize_t test_store(struct device *dev, struct device_attribute *attr,
>                           const char *buf, size_t count)
>  {
>
> @@ -273,7 +273,7 @@ static ssize_t store_test(struct device *dev, struct device_attribute *attr,
>         return count;
>  }
>
> -static DEVICE_ATTR(test, S_IRUGO | S_IWUSR, show_test, store_test);
> +static DEVICE_ATTR_RW(test);
>
>  /* TODO: HSB, fade, timeadj, script ... */
>
> diff --git a/drivers/leds/leds-lm3530.c b/drivers/leds/leds-lm3530.c
> index 2f8362f6bf75..2db455efd4b1 100644
> --- a/drivers/leds/leds-lm3530.c
> +++ b/drivers/leds/leds-lm3530.c
> @@ -346,8 +346,8 @@ static void lm3530_brightness_set(struct led_classdev *led_cdev,
>         }
>  }
>
> -static ssize_t lm3530_mode_get(struct device *dev,
> -               struct device_attribute *attr, char *buf)
> +static ssize_t mode_show(struct device *dev,
> +                        struct device_attribute *attr, char *buf)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct lm3530_data *drvdata;
> @@ -365,8 +365,8 @@ static ssize_t lm3530_mode_get(struct device *dev,
>         return len;
>  }
>
> -static ssize_t lm3530_mode_set(struct device *dev, struct device_attribute
> -                                  *attr, const char *buf, size_t size)
> +static ssize_t mode_store(struct device *dev, struct device_attribute
> +                         *attr, const char *buf, size_t size)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct lm3530_data *drvdata;
> @@ -397,7 +397,7 @@ static ssize_t lm3530_mode_set(struct device *dev, struct device_attribute
>
>         return sizeof(drvdata->mode);
>  }
> -static DEVICE_ATTR(mode, 0644, lm3530_mode_get, lm3530_mode_set);
> +static DEVICE_ATTR_RW(mode);
>
>  static struct attribute *lm3530_attrs[] = {
>         &dev_attr_mode.attr,
> diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
> index 1505521249b5..2d3e11845ba5 100644
> --- a/drivers/leds/leds-lm355x.c
> +++ b/drivers/leds/leds-lm355x.c
> @@ -349,9 +349,9 @@ static int lm355x_indicator_brightness_set(struct led_classdev *cdev,
>  }
>
>  /* indicator pattern only for lm3556*/
> -static ssize_t lm3556_indicator_pattern_store(struct device *dev,
> -                                             struct device_attribute *attr,
> -                                             const char *buf, size_t size)
> +static ssize_t pattern_store(struct device *dev,
> +                            struct device_attribute *attr,
> +                            const char *buf, size_t size)
>  {
>         ssize_t ret;
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
> @@ -381,7 +381,7 @@ static ssize_t lm3556_indicator_pattern_store(struct device *dev,
>         return ret;
>  }
>
> -static DEVICE_ATTR(pattern, S_IWUSR, NULL, lm3556_indicator_pattern_store);
> +static DEVICE_ATTR_WO(pattern);
>
>  static struct attribute *lm355x_indicator_attrs[] = {
>         &dev_attr_pattern.attr,
> diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
> index 62c14872caf7..8007b82985a8 100644
> --- a/drivers/leds/leds-lm3642.c
> +++ b/drivers/leds/leds-lm3642.c
> @@ -165,9 +165,9 @@ static int lm3642_control(struct lm3642_chip_data *chip,
>  /* torch */
>
>  /* torch pin config for lm3642 */
> -static ssize_t lm3642_torch_pin_store(struct device *dev,
> -                                     struct device_attribute *attr,
> -                                     const char *buf, size_t size)
> +static ssize_t torch_pin_store(struct device *dev,
> +                              struct device_attribute *attr,
> +                              const char *buf, size_t size)
>  {
>         ssize_t ret;
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
> @@ -193,7 +193,7 @@ static ssize_t lm3642_torch_pin_store(struct device *dev,
>         return size;
>  }
>
> -static DEVICE_ATTR(torch_pin, S_IWUSR, NULL, lm3642_torch_pin_store);
> +static DEVICE_ATTR_WO(torch_pin);
>
>  static int lm3642_torch_brightness_set(struct led_classdev *cdev,
>                                         enum led_brightness brightness)
> @@ -212,9 +212,9 @@ static int lm3642_torch_brightness_set(struct led_classdev *cdev,
>  /* flash */
>
>  /* strobe pin config for lm3642*/
> -static ssize_t lm3642_strobe_pin_store(struct device *dev,
> -                                      struct device_attribute *attr,
> -                                      const char *buf, size_t size)
> +static ssize_t strobe_pin_store(struct device *dev,
> +                               struct device_attribute *attr,
> +                               const char *buf, size_t size)
>  {
>         ssize_t ret;
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
> @@ -240,7 +240,7 @@ static ssize_t lm3642_strobe_pin_store(struct device *dev,
>         return size;
>  }
>
> -static DEVICE_ATTR(strobe_pin, S_IWUSR, NULL, lm3642_strobe_pin_store);
> +static DEVICE_ATTR_WO(strobe_pin);
>
>  static int lm3642_strobe_brightness_set(struct led_classdev *cdev,
>                                          enum led_brightness brightness)
> diff --git a/drivers/leds/leds-max8997.c b/drivers/leds/leds-max8997.c
> index 512a11d142d0..c0bddb33888d 100644
> --- a/drivers/leds/leds-max8997.c
> +++ b/drivers/leds/leds-max8997.c
> @@ -160,8 +160,8 @@ static void max8997_led_brightness_set(struct led_classdev *led_cdev,
>         }
>  }
>
> -static ssize_t max8997_led_show_mode(struct device *dev,
> -                               struct device_attribute *attr, char *buf)
> +static ssize_t mode_show(struct device *dev,
> +                        struct device_attribute *attr, char *buf)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct max8997_led *led =
> @@ -193,9 +193,9 @@ static ssize_t max8997_led_show_mode(struct device *dev,
>         return ret;
>  }
>
> -static ssize_t max8997_led_store_mode(struct device *dev,
> -                               struct device_attribute *attr,
> -                               const char *buf, size_t size)
> +static ssize_t mode_store(struct device *dev,
> +                         struct device_attribute *attr,
> +                         const char *buf, size_t size)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct max8997_led *led =
> @@ -222,7 +222,7 @@ static ssize_t max8997_led_store_mode(struct device *dev,
>         return size;
>  }
>
> -static DEVICE_ATTR(mode, 0644, max8997_led_show_mode, max8997_led_store_mode);
> +static DEVICE_ATTR_RW(mode);
>
>  static struct attribute *max8997_attrs[] = {
>         &dev_attr_mode.attr,
> diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
> index 68fbf0b66fad..77213b79f84d 100644
> --- a/drivers/leds/leds-netxbig.c
> +++ b/drivers/leds/leds-netxbig.c
> @@ -204,9 +204,9 @@ static void netxbig_led_set(struct led_classdev *led_cdev,
>         spin_unlock_irqrestore(&led_dat->lock, flags);
>  }
>
> -static ssize_t netxbig_led_sata_store(struct device *dev,
> -                                     struct device_attribute *attr,
> -                                     const char *buff, size_t count)
> +static ssize_t sata_store(struct device *dev,
> +                         struct device_attribute *attr,
> +                         const char *buff, size_t count)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct netxbig_led_data *led_dat =
> @@ -255,8 +255,8 @@ static ssize_t netxbig_led_sata_store(struct device *dev,
>         return ret;
>  }
>
> -static ssize_t netxbig_led_sata_show(struct device *dev,
> -                                    struct device_attribute *attr, char *buf)
> +static ssize_t sata_show(struct device *dev,
> +                        struct device_attribute *attr, char *buf)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct netxbig_led_data *led_dat =
> @@ -265,7 +265,7 @@ static ssize_t netxbig_led_sata_show(struct device *dev,
>         return sprintf(buf, "%d\n", led_dat->sata);
>  }
>
> -static DEVICE_ATTR(sata, 0644, netxbig_led_sata_show, netxbig_led_sata_store);
> +static DEVICE_ATTR_RW(sata);
>
>  static struct attribute *netxbig_led_attrs[] = {
>         &dev_attr_sata.attr,
> diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
> index 245de443fe9c..a6992323d69d 100644
> --- a/drivers/leds/leds-ss4200.c
> +++ b/drivers/leds/leds-ss4200.c
> @@ -441,8 +441,8 @@ static void set_power_light_amber_noblink(void)
>         nasgpio_led_set_brightness(&amber->led_cdev, LED_FULL);
>  }
>
> -static ssize_t nas_led_blink_show(struct device *dev,
> -                                 struct device_attribute *attr, char *buf)
> +static ssize_t blink_show(struct device *dev,
> +                         struct device_attribute *attr, char *buf)
>  {
>         struct led_classdev *led = dev_get_drvdata(dev);
>         int blinking = 0;
> @@ -451,9 +451,9 @@ static ssize_t nas_led_blink_show(struct device *dev,
>         return sprintf(buf, "%u\n", blinking);
>  }
>
> -static ssize_t nas_led_blink_store(struct device *dev,
> -                                  struct device_attribute *attr,
> -                                  const char *buf, size_t size)
> +static ssize_t blink_store(struct device *dev,
> +                          struct device_attribute *attr,
> +                          const char *buf, size_t size)
>  {
>         int ret;
>         struct led_classdev *led = dev_get_drvdata(dev);
> @@ -468,7 +468,7 @@ static ssize_t nas_led_blink_store(struct device *dev,
>         return size;
>  }
>
> -static DEVICE_ATTR(blink, 0644, nas_led_blink_show, nas_led_blink_store);
> +static DEVICE_ATTR_RW(blink);
>
>  static struct attribute *nasgpio_led_attrs[] = {
>         &dev_attr_blink.attr,
> diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
> index 67f4235cb28a..c48b80574f02 100644
> --- a/drivers/leds/leds-wm831x-status.c
> +++ b/drivers/leds/leds-wm831x-status.c
> @@ -155,8 +155,8 @@ static const char * const led_src_texts[] = {
>         "soft",
>  };
>
> -static ssize_t wm831x_status_src_show(struct device *dev,
> -                                     struct device_attribute *attr, char *buf)
> +static ssize_t src_show(struct device *dev,
> +                       struct device_attribute *attr, char *buf)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct wm831x_status *led = to_wm831x_status(led_cdev);
> @@ -178,9 +178,9 @@ static ssize_t wm831x_status_src_show(struct device *dev,
>         return ret;
>  }
>
> -static ssize_t wm831x_status_src_store(struct device *dev,
> -                                      struct device_attribute *attr,
> -                                      const char *buf, size_t size)
> +static ssize_t src_store(struct device *dev,
> +                        struct device_attribute *attr,
> +                        const char *buf, size_t size)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct wm831x_status *led = to_wm831x_status(led_cdev);
> @@ -197,7 +197,7 @@ static ssize_t wm831x_status_src_store(struct device *dev,
>         return size;
>  }
>
> -static DEVICE_ATTR(src, 0644, wm831x_status_src_show, wm831x_status_src_store);
> +static DEVICE_ATTR_RW(src);
>
>  static struct attribute *wm831x_status_attrs[] = {
>         &dev_attr_src.attr,
> --
> 2.27.0
>
