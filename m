Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBEA8D196E
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2019 22:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731397AbfJIULb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 16:11:31 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35584 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729865AbfJIULb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 16:11:31 -0400
Received: by mail-ed1-f66.google.com with SMTP id v8so3311098eds.2
        for <linux-leds@vger.kernel.org>; Wed, 09 Oct 2019 13:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ddzBfqy9u7gjkYDiqV514IQ9gWFkLefe2CBN8ASK3jI=;
        b=bJ/zri/HZbpQGnq7algN4DrGo+oA50xy5sggEJrXoRYDbWVZG1QnXIuoFIcSpxcRey
         Q78jLkbgaNzkq93QtlNhDIZ15UOccYrvfx1HIKvIxP4HL5m2vPVVR0D/xACfYxAtbH71
         rsntSj+Co/Usru+cDN5ECUCkdDv0MnZxXxoYdrrLkNQUrohFhqY5Jtz42CJai35fIiuu
         AvJebHCoO1JXoRRPEiEAXTfRfQoZSxBjl+5nzdjmgRkpCJPE1htCXgR75YHkzFvUXI6J
         D8jm85cqd8fA9qdV+QFZDm5wu9dGzZyqWP95VBcXHbHjq06XhKHwio3CM2NQZbV52TgO
         w2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ddzBfqy9u7gjkYDiqV514IQ9gWFkLefe2CBN8ASK3jI=;
        b=guewwih4Ef+3g0WKRED5x5tY4rXZIrmzqRuubT34Uhs70sOLTru1aJ+uKvlajbNLVh
         yVaBSX181/9oyb5td/xP2pPdh2md5C8pwk09E7BXw/cFirXvCA0LOxHXdPRC4sYU6HhA
         4RmYsHLS6CqrwzoTz3cc2wXzc9CajZIRQAfdAiy1Nbxtf+o1YXT9f5mxtvEhdSB1U03G
         +lpcLckNcDa08u1B8g2kA/WlFQjtsgXIDRLD04p8Wpij3V7lv+s7FqIgCWsn0qc8XRUr
         1jlgEnZWgs2/iybTD36Uk+wclrEgHc9ZKJiZ5nvWAmrpcH+nEryMTT3BTg1qpWuRZmFI
         JCHg==
X-Gm-Message-State: APjAAAWCuOe4yK0sv/8ydzNYQxsv05JdEzWCA3/sE8uCfPhf6coL7zSO
        YQFDqG7gc78KlwPWbGo2TnvAllQJMjJOwMb2Qjv6Mg==
X-Google-Smtp-Source: APXvYqyTN+pTmKSXytUKX/zMRg/OcR3M+2NHIYF/b2uHk0I7WRMb7QbRG4+XErm7zQHkUBcdfvGnnlKQ2DaoJADKSno=
X-Received: by 2002:a17:906:95c2:: with SMTP id n2mr4468326ejy.296.1570651887274;
 Wed, 09 Oct 2019 13:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191008204800.19870-1-dmurphy@ti.com> <20191008204800.19870-5-dmurphy@ti.com>
In-Reply-To: <20191008204800.19870-5-dmurphy@ti.com>
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Wed, 9 Oct 2019 13:11:16 -0700
Message-ID: <CAOCOHw5uQL56T_DcZA47721yS1tLsp9cyUEdmiWr+Ccfh7YpRQ@mail.gmail.com>
Subject: Re: [PATCH v11 04/16] leds: multicolor: Introduce a multicolor class definition
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Oct 8, 2019 at 1:49 PM Dan Murphy <dmurphy@ti.com> wrote:
>
> Introduce a multicolor class that groups colored LEDs
> within a LED node.
>
> The multi color class groups monochrome LEDs and allows controlling two
> aspects of the final combined color: hue and lightness. The former is
> controlled via <color>_intensity files and the latter is controlled
> via brightness file.
>

Thanks for making progress on this, it's been the one outstanding
question mark for the long overdue respin of the Qualcomm LPG driver.

But while it works for the LPG, in that it has outputs named "RGB" I
have boards with "generic" LED drivers that are connected to RGB LEDs.
So per your proposed solution we would need to add the additional
mc_class handling to every single LED driver that might be used to
sink current into an RGB LED.

I also don't see anything preventing hardware designers from feeding
single RGB LEDs from multiple different LED controllers, something the
current proposal would prohibit.

Regards,
Bjorn

> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../ABI/testing/sysfs-class-led-multicolor    |  35 +++
>  Documentation/leds/index.rst                  |   1 +
>  Documentation/leds/leds-class-multicolor.rst  |  96 +++++++
>  drivers/leds/Kconfig                          |  10 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/led-class-multicolor.c           | 271 ++++++++++++++++++
>  include/linux/led-class-multicolor.h          | 143 +++++++++
>  7 files changed, 557 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>  create mode 100644 Documentation/leds/leds-class-multicolor.rst
>  create mode 100644 drivers/leds/led-class-multicolor.c
>  create mode 100644 include/linux/led-class-multicolor.h
>
> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
> new file mode 100644
> index 000000000000..65cb43de26e6
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -0,0 +1,35 @@
> +What:          /sys/class/leds/<led>/brightness
> +Date:          Sept 2019
> +KernelVersion: 5.5
> +Contact:       Dan Murphy <dmurphy@ti.com>
> +Description:   read/write
> +               Writing to this file will update all LEDs within the group to a
> +               calculated percentage of what each color LED intensity is set
> +               to. The percentage is calculated via the equation below:
> +
> +               led_brightness = brightness * <color>_intensity/<color>_max_intensity
> +
> +               For additional details please refer to
> +               Documentation/leds/leds-class-multicolor.rst.
> +
> +               The value of the color is from 0 to
> +               /sys/class/leds/<led>/max_brightness.
> +
> +What:          /sys/class/leds/<led>/colors/<color>_intensity
> +Date:          Sept 2019
> +KernelVersion: 5.5
> +Contact:       Dan Murphy <dmurphy@ti.com>
> +Description:   read/write
> +               The <color>_intensity file is created based on the color
> +               defined by the registrar of the class.
> +               There is one file per color presented.
> +
> +               The value of the color is from 0 to
> +               /sys/class/leds/<led>/colors/<color>_max_intensity.
> +
> +What:          /sys/class/leds/<led>/colors/<color>_max_intensity
> +Date:          Sept 2019
> +KernelVersion: 5.5
> +Contact:       Dan Murphy <dmurphy@ti.com>
> +Description:   read only
> +               Maximum intensity level for the LED color.
> diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
> index 060f4e485897..bc70c6aa7138 100644
> --- a/Documentation/leds/index.rst
> +++ b/Documentation/leds/index.rst
> @@ -9,6 +9,7 @@ LEDs
>
>     leds-class
>     leds-class-flash
> +   leds-class-multicolor
>     ledtrig-oneshot
>     ledtrig-transient
>     ledtrig-usbport
> diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/leds/leds-class-multicolor.rst
> new file mode 100644
> index 000000000000..7a695a29377e
> --- /dev/null
> +++ b/Documentation/leds/leds-class-multicolor.rst
> @@ -0,0 +1,96 @@
> +====================================
> +Multi Color LED handling under Linux
> +====================================
> +
> +Description
> +===========
> +The multi color class groups monochrome LEDs and allows controlling two
> +aspects of the final combined color: hue and lightness. The former is
> +controlled via <color>_intensity files and the latter is controlled
> +via brightness file.
> +
> +For more details on hue and lightness notions please refer to
> +https://en.wikipedia.org/wiki/CIECAM02.
> +
> +Note that intensity files only cache the written value and the actual
> +change of hardware state occurs upon writing brightness file. This
> +allows for changing many factors of the perceived color in a virtually
> +unnoticeable way for the human observer.
> +
> +Multicolor Class Control
> +========================
> +The multicolor class presents the LED groups under a directory called "colors".
> +This directory is a child under the LED parent node created by the led_class
> +framework.  The led_class framework is documented in led-class.rst within this
> +documentation directory.
> +
> +Each colored LED will have two files created under the colors directory
> +<color>_intensity and <color>_max_intensity. These files will contain
> +one of LED_COLOR_ID_* definitions from the header
> +include/dt-bindings/leds/common.h.
> +
> +Directory Layout Example
> +========================
> +root:/sys/class/leds/rgb:grouped_leds# ls -lR colors/
> +-rw-r--r--    1 root     root          4096 Jul  7 03:10 blue_intensity
> +-r--r--r--    1 root     root          4096 Jul  7 03:10 blue_max_intensity
> +-rw-r--r--    1 root     root          4096 Jul  7 03:10 green_intensity
> +-r--r--r--    1 root     root          4096 Jul  7 03:10 green_max_intensity
> +-rw-r--r--    1 root     root          4096 Jul  7 03:10 red_intensity
> +-r--r--r--    1 root     root          4096 Jul  7 03:10 red_max_intensity
> +
> +Multicolor Class Brightness Control
> +===================================
> +The multiclor class framework will calculate each monochrome LEDs intensity.
> +
> +The brightness level for each LED is calculated based on the color LED
> +intensity setting divided by the color LED max intensity setting multiplied by
> +the requested brightness.
> +
> +led_brightness = brightness * <color>_intensity/<color>_max_intensity
> +
> +Example:
> +Three LEDs are present in the group as defined in "Directory Layout Example"
> +within this document.
> +
> +A user first writes the color LED brightness file with the brightness level that
> +is necessary to achieve a blueish violet output from the RGB LED group.
> +
> +echo 138 > /sys/class/leds/rgb:grouped_leds/red_intensity
> +echo 43 > /sys/class/leds/rgb:grouped_leds/green_intensity
> +echo 226 > /sys/class/leds/rgb:grouped_leds/blue_intensity
> +
> +red -
> +       intensity = 138
> +       max_intensity = 255
> +green -
> +       intensity = 43
> +       max_intensity = 255
> +blue -
> +       intensity = 226
> +       max_intensity = 255
> +
> +The user can control the brightness of that RGB group by writing the parent
> +'brightness' control.  Assuming a parent max_brightness of 255 the user may want
> +to dim the LED color group to half.  The user would write a value of 128 to the
> +parent brightness file then the values written to each LED will be adjusted
> +base on this value
> +
> +cat /sys/class/leds/rgb:grouped_leds/max_brightness
> +255
> +echo 128 > /sys/class/leds/rgb:grouped_leds/brightness
> +
> +adjusted_red_value = 128 * 138/255 = 69
> +adjusted_green_value = 128 * 43/255 = 21
> +adjusted_blue_value = 128 * 226/255 = 113
> +
> +Reading the parent brightness file will return the current brightness value of
> +the color LED group.
> +
> +cat /sys/class/leds/rgb:grouped_leds/max_brightness
> +255
> +
> +echo 128 > /sys/class/leds/rgb:grouped_leds/brightness
> +
> +cat /sys/class/leds/rgb:grouped_leds/brightness
> +128
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 4b68520ac251..a1ede89afc9e 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -30,6 +30,16 @@ config LEDS_CLASS_FLASH
>           for the flash related features of a LED device. It can be built
>           as a module.
>
> +config LEDS_CLASS_MULTI_COLOR
> +       tristate "LED Mulit Color LED Class Support"
> +       depends on LEDS_CLASS
> +       help
> +         This option enables the multicolor LED sysfs class in /sys/class/leds.
> +         It wraps LED class and adds multicolor LED specific sysfs attributes
> +         and kernel internal API to it. You'll need this to provide support
> +         for multicolor LEDs that are grouped together. This class is not
> +         intended for single color LEDs. It can be built as a module.
> +
>  config LEDS_BRIGHTNESS_HW_CHANGED
>         bool "LED Class brightness_hw_changed attribute support"
>         depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 2da39e896ce8..841038cfe35b 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -4,6 +4,7 @@
>  obj-$(CONFIG_NEW_LEDS)                 += led-core.o
>  obj-$(CONFIG_LEDS_CLASS)               += led-class.o
>  obj-$(CONFIG_LEDS_CLASS_FLASH)         += led-class-flash.o
> +obj-$(CONFIG_LEDS_CLASS_MULTI_COLOR)   += led-class-multicolor.o
>  obj-$(CONFIG_LEDS_TRIGGERS)            += led-triggers.o
>
>  # LED Platform Drivers
> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
> new file mode 100644
> index 000000000000..89f4bc9e057c
> --- /dev/null
> +++ b/drivers/leds/led-class-multicolor.c
> @@ -0,0 +1,271 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// LED Multi Color class interface
> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> +
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +
> +#include "leds.h"
> +
> +#define INTENSITY_NAME         "_intensity"
> +#define MAX_INTENSITY_NAME     "_max_intensity"
> +
> +int led_mc_calc_brightness(struct led_classdev_mc *mcled_cdev,
> +                           enum led_brightness brightness,
> +                           struct led_mc_color_conversion color_component[])
> +{
> +       struct led_mc_color_entry *priv;
> +       int i = 0;
> +
> +       list_for_each_entry(priv, &mcled_cdev->color_list, list) {
> +               color_component[i].color_id = priv->led_color_id;
> +               color_component[i].brightness = brightness *
> +                                         priv->intensity / priv->max_intensity;
> +               i++;
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(led_mc_calc_brightness);
> +
> +static ssize_t intensity_store(struct device *dev,
> +                               struct device_attribute *intensity_attr,
> +                               const char *buf, size_t size)
> +{
> +       struct led_mc_color_entry *priv = container_of(intensity_attr,
> +                                                   struct led_mc_color_entry,
> +                                                     intensity_attr);
> +       struct led_classdev *led_cdev = priv->mcled_cdev->led_cdev;
> +       unsigned long value;
> +       ssize_t ret;
> +
> +       mutex_lock(&led_cdev->led_access);
> +
> +       ret = kstrtoul(buf, 10, &value);
> +       if (ret)
> +               goto unlock;
> +
> +       if (value > priv->max_intensity) {
> +               ret = -EINVAL;
> +               goto unlock;
> +       }
> +
> +       priv->intensity = value;
> +       ret = size;
> +
> +unlock:
> +       mutex_unlock(&led_cdev->led_access);
> +       return ret;
> +}
> +
> +static ssize_t intensity_show(struct device *dev,
> +                             struct device_attribute *intensity_attr,
> +                             char *buf)
> +{
> +       struct led_mc_color_entry *priv = container_of(intensity_attr,
> +                                                   struct led_mc_color_entry,
> +                                                     intensity_attr);
> +
> +       return sprintf(buf, "%d\n", priv->intensity);
> +}
> +
> +static ssize_t max_intensity_show(struct device *dev,
> +                                  struct device_attribute *max_intensity_attr,
> +                                  char *buf)
> +{
> +       struct led_mc_color_entry *priv = container_of(max_intensity_attr,
> +                                                   struct led_mc_color_entry,
> +                                                     max_intensity_attr);
> +
> +       return sprintf(buf, "%d\n", priv->max_intensity);
> +}
> +
> +static struct attribute *led_color_attrs[] = {
> +       NULL,
> +};
> +
> +static struct attribute_group led_color_group = {
> +       .name = "colors",
> +       .attrs = led_color_attrs,
> +};
> +
> +static int led_multicolor_init_color(struct led_classdev_mc *mcled_cdev,
> +                                    int color_id)
> +{
> +       struct led_classdev *led_cdev = mcled_cdev->led_cdev;
> +       struct led_mc_color_entry *mc_priv;
> +       char *intensity_file_name;
> +       char *max_intensity_file_name;
> +       size_t len;
> +       int ret;
> +
> +       mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv), GFP_KERNEL);
> +       if (!mc_priv)
> +               return -ENOMEM;
> +
> +       mc_priv->led_color_id = color_id;
> +       mc_priv->mcled_cdev = mcled_cdev;
> +
> +       sysfs_attr_init(&mc_priv->intensity_attr.attr);
> +       len = strlen(led_colors[color_id]) + strlen(INTENSITY_NAME) + 1;
> +       intensity_file_name = kzalloc(len, GFP_KERNEL);
> +       if (!intensity_file_name)
> +               return -ENOMEM;
> +
> +       snprintf(intensity_file_name, len, "%s%s",
> +                led_colors[color_id], INTENSITY_NAME);
> +       mc_priv->intensity_attr.attr.name = intensity_file_name;
> +       mc_priv->intensity_attr.attr.mode = 0644;
> +       mc_priv->intensity_attr.store = intensity_store;
> +       mc_priv->intensity_attr.show = intensity_show;
> +       ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
> +                                     &mc_priv->intensity_attr.attr,
> +                                     led_color_group.name);
> +       if (ret)
> +               goto intensity_err_out;
> +
> +       sysfs_attr_init(&mc_priv->max_intensity_attr.attr);
> +       len = strlen(led_colors[color_id]) + strlen(MAX_INTENSITY_NAME) + 1;
> +       max_intensity_file_name = kzalloc(len, GFP_KERNEL);
> +       if (!max_intensity_file_name) {
> +               ret = -ENOMEM;
> +               goto intensity_err_out;
> +       }
> +
> +       snprintf(max_intensity_file_name, len, "%s%s",
> +                led_colors[color_id], MAX_INTENSITY_NAME);
> +       mc_priv->max_intensity_attr.attr.name = max_intensity_file_name;
> +       mc_priv->max_intensity_attr.attr.mode = 0444;
> +       mc_priv->max_intensity_attr.show = max_intensity_show;
> +       ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
> +                                     &mc_priv->max_intensity_attr.attr,
> +                                     led_color_group.name);
> +       if (ret)
> +               goto max_intensity_err_out;
> +
> +       mc_priv->max_intensity = LED_FULL;
> +       list_add_tail(&mc_priv->list, &mcled_cdev->color_list);
> +
> +max_intensity_err_out:
> +       kfree(max_intensity_file_name);
> +intensity_err_out:
> +       kfree(intensity_file_name);
> +       return ret;
> +}
> +
> +static int led_multicolor_init_color_dir(struct led_classdev_mc *mcled_cdev)
> +{
> +       struct led_classdev *led_cdev = mcled_cdev->led_cdev;
> +       int ret;
> +       int i;
> +
> +       ret = sysfs_create_group(&led_cdev->dev->kobj, &led_color_group);
> +       if (ret)
> +               return ret;
> +
> +       for (i = 0; i < LED_COLOR_ID_MAX; i++) {
> +               if (test_bit(i, &mcled_cdev->available_colors)) {
> +                       ret = led_multicolor_init_color(mcled_cdev, i);
> +                       if (ret)
> +                               break;
> +
> +               }
> +       }
> +
> +       return ret;
> +}
> +
> +int led_classdev_multicolor_register_ext(struct device *parent,
> +                                    struct led_classdev_mc *mcled_cdev,
> +                                    struct led_init_data *init_data)
> +{
> +       struct led_classdev *led_cdev;
> +       int ret;
> +
> +       if (!mcled_cdev)
> +               return -EINVAL;
> +
> +       led_cdev = mcled_cdev->led_cdev;
> +       INIT_LIST_HEAD(&mcled_cdev->color_list);
> +
> +       /* Register led class device */
> +       ret = led_classdev_register_ext(parent, led_cdev, init_data);
> +       if (ret)
> +               return ret;
> +
> +       return led_multicolor_init_color_dir(mcled_cdev);
> +}
> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
> +
> +void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev)
> +{
> +       struct led_mc_color_entry *priv, *next;
> +
> +       if (!mcled_cdev)
> +               return;
> +
> +       list_for_each_entry_safe(priv, next, &mcled_cdev->color_list, list)
> +               list_del(&priv->list);
> +
> +       sysfs_remove_group(&mcled_cdev->led_cdev->dev->kobj, &led_color_group);
> +       led_classdev_unregister(mcled_cdev->led_cdev);
> +}
> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_unregister);
> +
> +static void devm_led_classdev_multicolor_release(struct device *dev, void *res)
> +{
> +       led_classdev_multicolor_unregister(*(struct led_classdev_mc **)res);
> +}
> +
> +int devm_led_classdev_multicolor_register_ext(struct device *parent,
> +                                            struct led_classdev_mc *mcled_cdev,
> +                                             struct led_init_data *init_data)
> +{
> +       struct led_classdev_mc **dr;
> +       int ret;
> +
> +       dr = devres_alloc(devm_led_classdev_multicolor_release,
> +                         sizeof(*dr), GFP_KERNEL);
> +       if (!dr)
> +               return -ENOMEM;
> +
> +       ret = led_classdev_multicolor_register(parent, mcled_cdev);
> +       if (ret) {
> +               devres_free(dr);
> +               return ret;
> +       }
> +
> +       *dr = mcled_cdev;
> +       devres_add(parent, dr);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_register_ext);
> +
> +static int devm_led_classdev_multicolor_match(struct device *dev,
> +                                             void *res, void *data)
> +{
> +       struct led_classdev_mc **p = res;
> +
> +       if (WARN_ON(!p || !*p))
> +               return 0;
> +
> +       return *p == data;
> +}
> +
> +void devm_led_classdev_multicolor_unregister(struct device *dev,
> +                                            struct led_classdev_mc *mcled_cdev)
> +{
> +       WARN_ON(devres_release(dev,
> +                              devm_led_classdev_multicolor_release,
> +                              devm_led_classdev_multicolor_match, mcled_cdev));
> +}
> +EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_unregister);
> +
> +MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
> +MODULE_DESCRIPTION("Multi Color LED class interface");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
> new file mode 100644
> index 000000000000..5d0cdca32223
> --- /dev/null
> +++ b/include/linux/led-class-multicolor.h
> @@ -0,0 +1,143 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* LED Multicolor class interface
> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +#ifndef __LINUX_MULTICOLOR_LEDS_H_INCLUDED
> +#define __LINUX_MULTICOLOR_LEDS_H_INCLUDED
> +
> +#include <linux/leds.h>
> +#include <dt-bindings/leds/common.h>
> +
> +struct led_classdev_mc;
> +
> +struct led_mc_color_conversion {
> +       int color_id;
> +       int brightness;
> +       int output_num;
> +};
> +
> +struct led_mc_color_entry {
> +       struct led_classdev_mc *mcled_cdev;
> +
> +       struct device_attribute max_intensity_attr;
> +       struct device_attribute intensity_attr;
> +
> +       enum led_brightness max_intensity;
> +       enum led_brightness intensity;
> +
> +       struct list_head list;
> +
> +       int led_color_id;
> +};
> +
> +struct led_classdev_mc {
> +       /* led class device */
> +       struct led_classdev *led_cdev;
> +       struct list_head color_list;
> +
> +       unsigned long available_colors;
> +       int num_leds;
> +};
> +#ifdef CONFIG_LEDS_CLASS_MULTI_COLOR
> +static inline struct led_classdev_mc *lcdev_to_mccdev(
> +                                               struct led_classdev *lcdev)
> +{
> +       return container_of(lcdev, struct led_classdev_mc, led_cdev);
> +}
> +
> +/**
> + * led_classdev_multicolor_register_ext - register a new object of led_classdev
> + *                                   class with support for multicolor LEDs
> + * @parent: the multicolor LED to register
> + * @mcled_cdev: the led_classdev_mc structure for this device
> + * @init_data: the LED class Multi color device initialization data
> + *
> + * Returns: 0 on success or negative error value on failure
> + */
> +int led_classdev_multicolor_register_ext(struct device *parent,
> +                                           struct led_classdev_mc *mcled_cdev,
> +                                           struct led_init_data *init_data);
> +
> +static inline int led_classdev_multicolor_register(struct device *parent,
> +                                           struct led_classdev_mc *mcled_cdev)
> +{
> +       return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
> +}
> +
> +/**
> + * led_classdev_multicolor_unregister - unregisters an object of led_classdev
> + *                                     class with support for multicolor LEDs
> + * @mcled_cdev: the multicolor LED to unregister
> + *
> + * Unregister a previously registered via led_classdev_multicolor_register
> + * object
> + */
> +void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev);
> +
> +/* Calculate brightness for the monochrome LED cluster */
> +int led_mc_calc_brightness(struct led_classdev_mc *mcled_cdev,
> +                           enum led_brightness brightness,
> +                           struct led_mc_color_conversion color_component[]);
> +
> +int devm_led_classdev_multicolor_register_ext(struct device *parent,
> +                                         struct led_classdev_mc *mcled_cdev,
> +                                         struct led_init_data *init_data);
> +
> +static inline int devm_led_classdev_multicolor_register(struct device *parent,
> +                                    struct led_classdev_mc *mcled_cdev)
> +{
> +       return devm_led_classdev_multicolor_register_ext(parent, mcled_cdev,
> +                                                        NULL);
> +}
> +
> +void devm_led_classdev_multicolor_unregister(struct device *parent,
> +                                           struct led_classdev_mc *mcled_cdev);
> +#else
> +
> +static inline struct led_classdev_mc *lcdev_to_mccdev(
> +                                               struct led_classdev *lcdev)
> +{
> +       return NULL;
> +}
> +
> +static inline int led_classdev_multicolor_register_ext(struct device *parent,
> +                                           struct led_classdev_mc *mcled_cdev,
> +                                           struct led_init_data *init_data)
> +{
> +       return -EINVAL;
> +}
> +
> +static inline int led_classdev_multicolor_register(struct device *parent,
> +                                           struct led_classdev_mc *mcled_cdev)
> +{
> +       return -EINVAL;
> +}
> +
> +static inline void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev) {}
> +
> +static inline int led_mc_calc_brightness(struct led_classdev_mc *mcled_cdev,
> +                                        enum led_brightness brightness,
> +                       struct led_mc_color_conversion color_component[])
> +{
> +       return -EINVAL;
> +}
> +
> +static inline int devm_led_classdev_multicolor_register_ext(struct device *parent,
> +                                         struct led_classdev_mc *mcled_cdev,
> +                                         struct led_init_data *init_data)
> +{
> +       return -EINVAL;
> +}
> +
> +static inline int devm_led_classdev_multicolor_register(struct device *parent,
> +                                    struct led_classdev_mc *mcled_cdev)
> +{
> +       return -EINVAL;
> +}
> +
> +static inline void devm_led_classdev_multicolor_unregister(struct device *parent,
> +                                   struct led_classdev_mc *mcled_cdev) {}
> +
> +#endif /* CONFIG_LEDS_CLASS_MULTI_COLOR */
> +#endif /* __LINUX_MULTICOLOR_LEDS_H_INCLUDED */
> --
> 2.22.0.214.g8dca754b1e
>
