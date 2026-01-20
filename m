Return-Path: <linux-leds+bounces-6678-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA2AD3BE8B
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 05:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 89971359333
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 04:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB663559ED;
	Tue, 20 Jan 2026 04:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqzuRKFl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DC533DECA
	for <linux-leds@vger.kernel.org>; Tue, 20 Jan 2026 04:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768884701; cv=none; b=kNtOzlYUlrOvZCHyz98pQFoHGNDxKTOvRoxsF+DHY/+ICptyUsBZX3yWTcHFG6F1o6oeCODmY+G6RRfy/1SlFStkczAHtZq9oOGtVPVjB3icrm7RUJ2m29DFubYMYIwwHvw3JKu5H+xTlefwFUeh/zkKU5CNlEL8i4AYAucibXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768884701; c=relaxed/simple;
	bh=1EEJTv7saQIJVI1CVFQjCAJAHo6DbFSU2VPyzguN1bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KsdyuzsTPlpcmv9un2aja+dsmmDKsqMF94qLmUdGqG+SbzHwG+Y8rXDtUgdzP2cIzUbxGGRMrtCeorjRdlMIrXLicG4eQm9BKxOIF4BoFYssWK/GgqBVtytoG/CkgFZiBdjdprRc8S4Lgn4iDyOFiX+qu5LhEL8WnQY5rvRB7BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqzuRKFl; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29f102b013fso43337485ad.2
        for <linux-leds@vger.kernel.org>; Mon, 19 Jan 2026 20:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768884699; x=1769489499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CrPpWhLizzqyrVdqRt9DE4t+jE309BmKnkyinv/DH0E=;
        b=iqzuRKFl9G3R2iqQ86K72TNaD9X8a/SXo/S92L4+kJDge2iIL+MAvs9RMJcXvbMM3f
         9J6RYmsmJExgSueKxG6Rs8DkR5arZxN1PsSv5u4bBOtmYzq5W3iPdvnunvQeDIypnnYG
         G9helpFyys+RXh/54tN3sILCWDTZiRtzs1ZoEwiUgSjq3bdCsJgzbBfmC9NXHsdyJfHJ
         Z7E3474IOjefuUi9/fX747xt4ZF3cr8rxpDwbnuS7SNSn+6xW50IIh9nLPQ9hN4LbIh+
         eBs9Uj/GTnpba4eonjL4gvjEPtEfurOnoFI+KSZvO1O2bFch6d3Hh8jxFB+iJs0dob+L
         zP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768884699; x=1769489499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrPpWhLizzqyrVdqRt9DE4t+jE309BmKnkyinv/DH0E=;
        b=hQGylh1ygpHns5LmVTUF4krx6JFuDL6FjBNkeJsh5vRC4U1KGdQhWcQ1jNYaEwLxfK
         9SCKOy4p055CynT4QqwIXBJY2FhheSB8jw35tUq6+04RAnaNIXca0xzMMkYKte+ZYTzZ
         EbxiOZ9de3GDDs0IViV2ek68MyZrzWrJc80Rqb5r0Zq/XOkWAvjQl/qz126JEmoWCpjo
         /9b884Fnd1JNjVxUHt21+GNYwsIWmzu9UjisdBiPRel1ud9z/vHO96YmerhRr/gBaVsn
         A1yw6BZjFD9dewdCV7IE/U2yD/3ReLR7edy41cz6SynLfQNuEygmFXZwsTyVBj5jOoc4
         sLTg==
X-Forwarded-Encrypted: i=1; AJvYcCWuRe0V96CBQ/CgnB70yBTN56hT4P15isrBx6SWOA2nwb6kBCRgcEKMRjwUnJOMqGZ8UecWSGdS8xnj@vger.kernel.org
X-Gm-Message-State: AOJu0YzrZm2Dxf1uxPBYlsM0zR7UUUXqVW534bMnEFerjiODPJ5VYS7S
	bHru0MIFvDZH+XXn0/DhsBL7NkiUJ7c7HcRdkJc7XBfOHVShJD1kADo0
X-Gm-Gg: AZuq6aINk16xUqYSK52FBXIO4HDDHpq0fkF/AmtsvfwQo9FKnxkFzgBU87sRdt/GA/o
	Zp6dzlj63UOHQvLij31acVBmMqV1MeKSD1E8qf66sBKcHr95iX/+vSYeZm2zn8cE93/X0KAsIyO
	OnxbBodrPL5WypTJyBhE4lrd84HcGE+o/6vHkry/3xl6xOKJYTrd8aZ+0s1h4OoO5vaYPoqQ9wb
	ST9LqjcEC2ZnqTaHER1646wGI4l20y+Lrw4AhpvB7AQHrwEXnGc7NY3YYYSzCAD23bJnG8BIcFd
	3GLJ5ltZd211nTvCo5Tsli6O7DVJ9mV4w/Tp2kw/ZNHgiHojhFQRiePP4B/PV/kXQWQMLpR5XEd
	ZbLh+1PnA1OhhEPCrZv3UkIbQoCiUjU+9oPmjh5z3RrvkRi97c4smLu+N9hPwLaH9556f/PJKIw
	sRqrsaWR22kT6poQ9XvFJkhjPTWr/ZT2YJUQ==
X-Received: by 2002:a17:902:f788:b0:29e:9387:f2b7 with SMTP id d9443c01a7336-2a7188577d1mr133191665ad.11.1768884699087;
        Mon, 19 Jan 2026 20:51:39 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fd35esm107003535ad.81.2026.01.19.20.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 20:51:38 -0800 (PST)
Message-ID: <ec7b7af7-1343-4988-b783-9ce9b045c8ae@gmail.com>
Date: Tue, 20 Jan 2026 10:22:02 +0530
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] backlight: gpio: add support for multiple GPIOs
 for backlight control
To: Daniel Thompson <daniel@riscstar.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-3-tessolveupstream@gmail.com>
 <aVuN7zVUWJ1qsVh8@aspen.lan> <1fedb7d7-3a30-4f0f-961f-09613f2a95d0@gmail.com>
 <aWe-QA_grqNwnE4n@aspen.lan>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <aWe-QA_grqNwnE4n@aspen.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14-01-2026 21:33, Daniel Thompson wrote:
> On Tue, Jan 13, 2026 at 12:47:26PM +0530, tessolveupstream@gmail.com wrote:
>>
>>
>> On 05-01-2026 15:39, Daniel Thompson wrote:
>>> On Mon, Jan 05, 2026 at 02:21:20PM +0530, Sudarshan Shetty wrote:
>>>> Extend the gpio-backlight driver to handle multiple GPIOs instead of a
>>>> single one. This allows panels that require driving several enable pins
>>>> to be controlled by the backlight framework.
>>>>
>>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>>>> ---
>>>>  drivers/video/backlight/gpio_backlight.c | 61 +++++++++++++++++-------
>>>>  1 file changed, 45 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
>>>> index 728a546904b0..037e1c111e48 100644
>>>> --- a/drivers/video/backlight/gpio_backlight.c
>>>> +++ b/drivers/video/backlight/gpio_backlight.c
>>>> @@ -17,14 +17,18 @@
>>>>
>>>>  struct gpio_backlight {
>>>>  	struct device *dev;
>>>> -	struct gpio_desc *gpiod;
>>>> +	struct gpio_desc **gpiods;
>>>> +	unsigned int num_gpios;
>>>
>>> Why not use struct gpio_descs for this?
>>>
>>> Once you do that, then most of the gbl->num_gpios loops can be replaced with
>>> calls to the array based accessors.
>>>
>>
>> Based on your feedback, I have updated the implementation to use
>> struct gpio_descs and array-based accessors, as recommended like
>> below:
>>
>> git diff drivers/video/backlight/gpio_backlight.c
>> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
>> index 037e1c111e48..e99d7a9dc670 100644
>> --- a/drivers/video/backlight/gpio_backlight.c
>> +++ b/drivers/video/backlight/gpio_backlight.c
>> @@ -14,22 +14,37 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/property.h>
>>  #include <linux/slab.h>
>> +#include <linux/bitmap.h>
>>
>>  struct gpio_backlight {
>>         struct device *dev;
>> -       struct gpio_desc **gpiods;
>> +       struct gpio_descs *gpiods;
>>         unsigned int num_gpios;
>>  };
>>
>>  static int gpio_backlight_update_status(struct backlight_device *bl)
>>  {
>>         struct gpio_backlight *gbl = bl_get_data(bl);
>> -       unsigned int i;
>> +       unsigned int n = gbl->num_gpios;
>>         int br = backlight_get_brightness(bl);
>> +       unsigned long *value_bitmap;
>> +       int words = BITS_TO_LONGS(n);
>> +
>> +       value_bitmap = kcalloc(words, sizeof(unsigned long), GFP_KERNEL);
> 
> Not sure you need a kcalloc() here. If you want to support more than 32
> GPIOs then you can pre-allocate space with a devm_kcalloc() in the probe
> method rather than reallocate every time it is used.
> 
> To be honest I don't really mind putting a hard limit on the maximum
> gpl->num_gpios (so you can just use a local variable) and having no
> allocation at all.
>

Thanks for the suggestion. I addressed the kcalloc() concern by 
moving the bitmap allocation to probe using devm_kcalloc() as 
below:

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 0eb42d8bf1d9..7af5dc4f0315 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -19,32 +19,25 @@
 struct gpio_backlight {
        struct device *dev;
        struct gpio_descs *gpiods;
-       unsigned int num_gpios;
+       unsigned long *bitmap;
 };

 static int gpio_backlight_update_status(struct backlight_device *bl)
 {
        struct gpio_backlight *gbl = bl_get_data(bl);
-       unsigned int n = gbl->num_gpios;
+       unsigned int n = gbl->gpiods->ndescs;
        int br = backlight_get_brightness(bl);
-       unsigned long *value_bitmap;
-       int words = BITS_TO_LONGS(n);
-
-       value_bitmap = kcalloc(words, sizeof(unsigned long), GFP_KERNEL);
-       if (!value_bitmap)
-               return -ENOMEM;

        if (br)
-               bitmap_fill(value_bitmap, n);
+               bitmap_fill(gbl->bitmap, n);
        else
-               bitmap_zero(value_bitmap, n);
+               bitmap_zero(gbl->bitmap, n);

-       gpiod_set_array_value_cansleep(gbl->gpiods->ndescs,
+       gpiod_set_array_value_cansleep(n,
                                       gbl->gpiods->desc,
                                       gbl->gpiods->info,
-                                      value_bitmap);
+                                      gbl->bitmap);

-       kfree(value_bitmap);
        return 0;
 }

@@ -67,22 +60,25 @@ static int gpio_backlight_probe(struct platform_device *pdev)
        struct device *dev = &pdev->dev;
        struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
        struct device_node *of_node = dev->of_node;
-       struct backlight_properties props;
+       struct backlight_properties props = { };
        struct backlight_device *bl;
        struct gpio_backlight *gbl;
-       int ret, init_brightness, def_value;
-       unsigned int i;
+       bool def_value;
+       enum gpiod_flags flags;
+       unsigned int n;
+       int words;

-       gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
-       if (gbl == NULL)
+       gbl = devm_kcalloc(dev, 1, sizeof(*gbl), GFP_KERNEL);
+       if (!gbl)
                return -ENOMEM;

        if (pdata)
                gbl->dev = pdata->dev;

        def_value = device_property_read_bool(dev, "default-on");
-
-       gbl->gpiods = devm_gpiod_get_array(dev, NULL, GPIOD_ASIS);
+       flags = def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
+
+       gbl->gpiods = devm_gpiod_get_array(dev, NULL, flags);
        if (IS_ERR(gbl->gpiods)) {
                if (PTR_ERR(gbl->gpiods) == -ENODEV)
                        return dev_err_probe(dev, -EINVAL,
@@ -90,12 +86,17 @@ static int gpio_backlight_probe(struct platform_device *pdev)
                return PTR_ERR(gbl->gpiods);
        }

-       gbl->num_gpios = gbl->gpiods->ndescs;
-       if (gbl->num_gpios == 0)
+       n = gbl->gpiods->ndescs;
+       if (!n)
                return dev_err_probe(dev, -EINVAL,
-                       "The gpios parameter is missing or invalid\n");
+                       "No GPIOs provided\n");
+
+       words = BITS_TO_LONGS(n);
+       gbl->bitmap = devm_kcalloc(dev, words, sizeof(unsigned long),
+                                  GFP_KERNEL);
+       if (!gbl->bitmap)
+               return -ENOMEM;

-       memset(&props, 0, sizeof(props));
        props.type = BACKLIGHT_RAW;
        props.max_brightness = 1;
        bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
@@ -106,50 +107,19 @@ static int gpio_backlight_probe(struct platform_device *pdev)
        }

        /* Set the initial power state */
-       if (!of_node || !of_node->phandle) {
+       if (!of_node || !of_node->phandle)
                /* Not booted with device tree or no phandle link to the node */
                bl->props.power = def_value ? BACKLIGHT_POWER_ON
                                                    : BACKLIGHT_POWER_OFF;
-       } else {
-               bool all_high = true;
-               unsigned long *value_bitmap;
-               int words = BITS_TO_LONGS(gbl->num_gpios);
-
-               value_bitmap = kcalloc(words, sizeof(unsigned long),
-                                      GFP_KERNEL);
-               if (!value_bitmap)
-                       return -ENOMEM;
-
-               ret = gpiod_get_array_value_cansleep(gbl->gpiods->ndescs,
-                                                    gbl->gpiods->desc,
-                                                    gbl->gpiods->info,
-                                                    value_bitmap);
-               if (ret) {
-                       kfree(value_bitmap);
-                       return dev_err_probe(dev, ret,
-                               "failed to read initial gpio values\n");
-               }
-
-               all_high = bitmap_full(value_bitmap, gbl->num_gpios);
-
-               kfree(value_bitmap);
-               bl->props.power =
-                       all_high ? BACKLIGHT_POWER_ON :  BACKLIGHT_POWER_OFF;
-       }
-
-       bl->props.brightness = 1;
-
-       init_brightness = backlight_get_brightness(bl);
+       else if (gpiod_get_value_cansleep(gbl->gpiods->desc[0]) == 0)
+               bl->props.power = BACKLIGHT_POWER_OFF;
+       else
+               bl->props.power = BACKLIGHT_POWER_ON;

-       for (i = 0; i < gbl->num_gpios; i++) {
-               ret = gpiod_direction_output(gbl->gpiods->desc[i],
-                                            init_brightness);
-               if (ret)
-                       return dev_err_probe(dev, ret,
-                                       "failed to set gpio %u direction\n",
-                                       i);
-       }
+       bl->props.brightness = def_value ? 1 : 0;

+       gpio_backlight_update_status(bl);
+
        platform_set_drvdata(pdev, bl);
        return 0;
 }

Kindly confirm whether this approach aligns with your 
expectations.
 
> 
>> Could you please share your thoughts on whether this approach
>> aligns with your expectations?
> 
> Looks like it is going in the right direction, yes.
> 
> 
> Daniel.


