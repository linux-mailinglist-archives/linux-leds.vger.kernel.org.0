Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3F03E798C
	for <lists+linux-leds@lfdr.de>; Mon, 28 Oct 2019 21:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbfJ1UFC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Oct 2019 16:05:02 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53366 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbfJ1UFB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 28 Oct 2019 16:05:01 -0400
Received: by mail-wm1-f68.google.com with SMTP id n7so262674wmc.3;
        Mon, 28 Oct 2019 13:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ottLUqyZALRCYFAI9iuig5u4VVbM/cmy1/vLfnqd2mE=;
        b=JMsGAdbWG/MpZaTGGjgvjRLCdo1wm18JIteKKiS9cT8R73DRoB+FQJsEdvm1uJzGlG
         MzlG/AUMoXLgQZBPfROZblsRqAWa2Pah7JdflX64Lu46XEKjOdPAHIxutqYKKLrN2pgq
         JjTbIUJspJEfh7uMJxoyPm/4dJd8CZ1WAtF670H0F6iMIMalRusWlVIAd61sxBGbXFgo
         BxVMRdDE7hNHeqyLjBMYd+oJV/lGyqiZD+DWe45hogUtvPvDoaAxnCNuKMR8Y36pnU4A
         uSPSd9aDoLxKdNLCC/CDSfpp8iBwjKDu+zShTlb6YDkHPHlNxiLVDYQtef5A/B+I/+iK
         VnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ottLUqyZALRCYFAI9iuig5u4VVbM/cmy1/vLfnqd2mE=;
        b=gIIQGR8kjlD9hRtzNhMuOitvDKANiISucM+N0KpP7kAwji50rVXSurG7UGmvakV0eG
         iQ8IPKXHaJ7FMbsgRNK+oT2IMpnmj83vr6U5ajhNJnSnZ23eYEIIYH/m1NtNAAAui+ug
         1jYHLlrMKWlBggE1nyiL0fHh6zY78DwLpKyg00FLzdTsy48FwaWrTse5ktsc30OpVyRL
         aKGOl2Ln/fslGoHDY1Q/1Q4277zibPdtEjoRn2aRtHFG86S4vOznJXInDX2NujlIK2mb
         Ah7w/YHlNhPBlIF/BSuFWulcxhrz5GC33igdhK2YDLVpK80t+TmNxhbKyfA+7W1dcGxa
         4Z9Q==
X-Gm-Message-State: APjAAAX7av55jmIUi+XffdTMmwa2MAD6s2eKWdthGBD4xm1bR6+lASXp
        88vL3K7PfyqGScs9OsJsa3SZlMKg
X-Google-Smtp-Source: APXvYqwxukdLORYQ7K1pjUTs15bQ+rtQCvnkCakbERdgaUgCpbLUbVUx3v2hi5r+kfoUFiof3je+sQ==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr898296wmd.104.1572293097446;
        Mon, 28 Oct 2019 13:04:57 -0700 (PDT)
Received: from [192.168.1.19] (chq116.neoplus.adsl.tpnet.pl. [83.31.14.116])
        by smtp.gmail.com with ESMTPSA id r11sm9752000wrx.67.2019.10.28.13.04.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 13:04:56 -0700 (PDT)
Subject: Re: [PATCH v15 04/19] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191028183629.11779-1-dmurphy@ti.com>
 <20191028183629.11779-5-dmurphy@ti.com>
 <6dbd4e43-4832-4f8e-4eb9-8b7c878c270e@gmail.com>
 <5e4ff68d-bb53-d3cd-f1b7-68c418342657@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <df5d8868-d332-6320-b065-29b596fdc855@gmail.com>
Date:   Mon, 28 Oct 2019 21:04:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5e4ff68d-bb53-d3cd-f1b7-68c418342657@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 10/28/19 8:36 PM, Dan Murphy wrote:
> Jacek
> 
> On 10/28/19 2:22 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> Thank you for the v15.
>>
>> On 10/28/19 7:36 PM, Dan Murphy wrote:
>>> Introduce a multicolor class that groups colored LEDs
>>> within a LED node.
>>>
>>> The multi color class groups monochrome LEDs and allows controlling two
>>> aspects of the final combined color: hue and lightness. The former is
>>> controlled via <color>_intensity files and the latter is controlled
>>> via brightness file.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   .../ABI/testing/sysfs-class-led-multicolor    |  36 +++
>>>   Documentation/leds/index.rst                  |   1 +
>>>   Documentation/leds/leds-class-multicolor.rst  | 100 +++++++
>>>   drivers/leds/Kconfig                          |  10 +
>>>   drivers/leds/Makefile                         |   1 +
>>>   drivers/leds/led-class-multicolor.c           | 271 ++++++++++++++++++
>>>   include/linux/led-class-multicolor.h          | 139 +++++++++
>>>   7 files changed, 558 insertions(+)
>>>   create mode 100644
>>> Documentation/ABI/testing/sysfs-class-led-multicolor
>>>   create mode 100644 Documentation/leds/leds-class-multicolor.rst
>>>   create mode 100644 drivers/leds/led-class-multicolor.c
>>>   create mode 100644 include/linux/led-class-multicolor.h
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor
>>> b/Documentation/ABI/testing/sysfs-class-led-multicolor
>>> new file mode 100644
>>> index 000000000000..3d1f9d726c70
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>>> @@ -0,0 +1,36 @@
>>> +What:        /sys/class/leds/<led>/brightness
>>> +Date:        Sept 2019
>>> +KernelVersion:    5.5
>>> +Contact:    Dan Murphy <dmurphy@ti.com>
>>> +Description:    read/write
>>> +        Writing to this file will update all LEDs within the group to a
>>> +        calculated percentage of what each color LED intensity is set
>>> +        to. The percentage is calculated for each grouped LED via the
>>> +        equation below:
>>> +
>>> +        led_brightness = brightness *
>>> <color>_intensity/<color>_max_intensity
>>> +
>>> +        For additional details please refer to
>>> +        Documentation/leds/leds-class-multicolor.rst.
>>> +
>>> +        The value of the color is from 0 to
>>> +        /sys/class/leds/<led>/max_brightness.
>>> +
>>> +What:        /sys/class/leds/<led>/colors/<color>_intensity
>>> +Date:        Sept 2019
>>> +KernelVersion:    5.5
>>> +Contact:    Dan Murphy <dmurphy@ti.com>
>>> +Description:    read/write
>>> +        The <color>_intensity file is created based on the color
>>> +        defined by the registrar of the class.
>>> +        There is one file per color presented.
>>> +
>>> +        The value of the color is from 0 to
>>> +        /sys/class/leds/<led>/colors/<color>_max_intensity.
>>> +
>>> +What:        /sys/class/leds/<led>/colors/<color>_max_intensity
>>> +Date:        Sept 2019
>>> +KernelVersion:    5.5
>>> +Contact:    Dan Murphy <dmurphy@ti.com>
>>> +Description:    read only
>>> +        Maximum intensity level for the LED color.
>>> diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
>>> index 060f4e485897..bc70c6aa7138 100644
>>> --- a/Documentation/leds/index.rst
>>> +++ b/Documentation/leds/index.rst
>>> @@ -9,6 +9,7 @@ LEDs
>>>        leds-class
>>>      leds-class-flash
>>> +   leds-class-multicolor
>>>      ledtrig-oneshot
>>>      ledtrig-transient
>>>      ledtrig-usbport
>>> diff --git a/Documentation/leds/leds-class-multicolor.rst
>>> b/Documentation/leds/leds-class-multicolor.rst
>>> new file mode 100644
>>> index 000000000000..c8a224cead51
>>> --- /dev/null
>>> +++ b/Documentation/leds/leds-class-multicolor.rst
>>> @@ -0,0 +1,100 @@
>>> +====================================
>>> +Multi Color LED handling under Linux
>>> +====================================
>>> +
>>> +Description
>>> +===========
>>> +The multi color class groups monochrome LEDs and allows controlling two
>>> +aspects of the final combined color: hue and lightness. The former is
>>> +controlled via <color>_intensity files and the latter is controlled
>>> +via brightness file.
>>> +
>>> +For more details on hue and lightness notions please refer to
>>> +https://en.wikipedia.org/wiki/CIECAM02.
>>> +
>>> +Note that intensity files only cache the written value and the actual
>>> +change of hardware state occurs upon writing brightness file. This
>>> +allows for changing many factors of the perceived color in a virtually
>>> +unnoticeable way for the human observer.
>>> +
>>> +Multicolor Class Control
>>> +========================
>>> +The multicolor class presents the LED groups under a directory
>>> called "colors".
>>> +This directory is a child under the LED parent node created by the
>>> led_class
>>> +framework.  The led_class framework is documented in led-class.rst
>>> within this
>>> +documentation directory.
>>> +
>>> +Each colored LED will have two files created under the colors directory
>>> +<color>_intensity and <color>_max_intensity. These files will contain
>>> +one of LED_COLOR_ID_* definitions from the header
>>> +include/dt-bindings/leds/common.h.
>>> +
>>> +Directory Layout Example
>>> +========================
>>> +root:/sys/class/leds/rgb:grouped_leds# ls -lR colors/
>> s/rgb/multicolor/ according to the led_colors[LED_COLOR_ID_MULTI].
> 
> Ack but this probably would not be multicolor either based on LED node
> naming conventions.

Why? We still have LED color section in the LED name pattern.
And for multicolor LEDs this would make sense.

>>> +-rw-r--r--    1 root     root          4096 Jul  7 03:10 blue_intensity
>>> +-r--r--r--    1 root     root          4096 Jul  7 03:10
>>> blue_max_intensity
>>> +-rw-r--r--    1 root     root          4096 Jul  7 03:10
>>> green_intensity
>>> +-r--r--r--    1 root     root          4096 Jul  7 03:10
>>> green_max_intensity
>>> +-rw-r--r--    1 root     root          4096 Jul  7 03:10 red_intensity
>>> +-r--r--r--    1 root     root          4096 Jul  7 03:10
>>> red_max_intensity
>>> +
>> [...]
>>> +static int led_multicolor_init_color(struct led_classdev_mc
>>> *mcled_cdev,
>>> +                     int color_id)
>>> +{
>>> +    struct led_classdev *led_cdev = mcled_cdev->led_cdev;
>>> +    struct led_mc_color_entry *mc_priv;
>>> +    char *intensity_file_name;
>>> +    char *max_intensity_file_name;
>>> +    size_t len;
>>> +    int ret;
>>> +
>>> +    mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv),
>>> GFP_KERNEL);
>>> +    if (!mc_priv)
>>> +        return -ENOMEM;
>>> +
>>> +    mc_priv->led_color_id = color_id;
>>> +    mc_priv->mcled_cdev = mcled_cdev;
>>> +
>>> +    sysfs_attr_init(&mc_priv->intensity_attr.attr);
>>> +    len = strlen(led_colors[color_id]) + strlen(INTENSITY_NAME) + 1;
>>> +    intensity_file_name = kzalloc(len, GFP_KERNEL);
>>> +    if (!intensity_file_name)
>>> +        return -ENOMEM;
>>> +
>>> +    snprintf(intensity_file_name, len, "%s%s",
>>> +         led_colors[color_id], INTENSITY_NAME);
>>> +    mc_priv->intensity_attr.attr.name = intensity_file_name;
>>> +    mc_priv->intensity_attr.attr.mode = 0644;
>>> +    mc_priv->intensity_attr.store = intensity_store;
>>> +    mc_priv->intensity_attr.show = intensity_show;
>>> +    ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
>>> +                      &mc_priv->intensity_attr.attr,
>>> +                      led_color_group.name);
>>> +    if (ret)
>>> +        goto intensity_err_out;
>>> +
>>> +    sysfs_attr_init(&mc_priv->max_intensity_attr.attr);
>>> +    len = strlen(led_colors[color_id]) + strlen(MAX_INTENSITY_NAME)
>>> + 1;
>>> +    max_intensity_file_name = kzalloc(len, GFP_KERNEL);
>>> +    if (!max_intensity_file_name) {
>>> +        ret = -ENOMEM;
>>> +        goto intensity_err_out;
>>> +    }
>>> +
>>> +    snprintf(max_intensity_file_name, len, "%s%s",
>>> +         led_colors[color_id], MAX_INTENSITY_NAME);
>>> +    mc_priv->max_intensity_attr.attr.name = max_intensity_file_name;
>>> +    mc_priv->max_intensity_attr.attr.mode = 0444;
>>> +    mc_priv->max_intensity_attr.show = max_intensity_show;
>>> +    ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
>>> +                      &mc_priv->max_intensity_attr.attr,
>>> +                      led_color_group.name);
>>> +    if (ret)
>>> +        goto max_intensity_err_out;
>>> +
>>> +    mc_priv->max_intensity = LED_FULL;
>>> +    list_add_tail(&mc_priv->list, &mcled_cdev->color_list);
>> I still would prefer dynamically allocated array here. Also there are
>> things I would see differently in the patch 13/19 as already discussed.
>>
>> Nonetheless I am giving my preliminary ack for this series just to
>> give a hint to others to join the review.
>>
> Replies were given on the 13/19 patch.

AFAIR they referred to channel mapping but my request related to
replacing list with array was rather more general. We simply don't
need a list for fixed set of colors.

-- 
Best regards,
Jacek Anaszewski
