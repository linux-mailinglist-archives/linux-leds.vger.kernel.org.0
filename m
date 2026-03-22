Return-Path: <linux-leds+bounces-7411-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TEp2E3AQwGmxDQQAu9opvQ
	(envelope-from <linux-leds+bounces-7411-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 22 Mar 2026 16:53:20 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A50592E9D58
	for <lists+linux-leds@lfdr.de>; Sun, 22 Mar 2026 16:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C1B0300A4F3
	for <lists+linux-leds@lfdr.de>; Sun, 22 Mar 2026 15:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5993F19992C;
	Sun, 22 Mar 2026 15:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXW14kgC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB7819D89E
	for <linux-leds@vger.kernel.org>; Sun, 22 Mar 2026 15:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774194797; cv=none; b=h2etahMsg3AJA+Q6Xop6jUECsnwgSYV5gWmvgdkHvj0KQx1+oAXnxQasz5bVFPJfYnlU2h9VJwBDOeK1EH/RsXwuXEAhbNDaoaR84/lsC5rRd3cXwfqI4vWfkCYpjwCClbagJYfNrtvXGnymBTzJyOpZfgRa2RWrHQg+4Jiey6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774194797; c=relaxed/simple;
	bh=ntM1Hzl9NSb9tHpibj8P3zLZ+PNE2WelKmHDB0LSZL8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VMjpDtxtGqoS+YFC3D2MNH0aX49xEgCA++rHANFIbtbrsWXmYzYw3dX6taNbM82GPI9bsHmvNeEw4deMBx3ypsFDATBFPb3ZByrHg30sZOl45ea9e/sDZe6NywMPCZPKMmy3ndRF+O0ipppOV2hIhJEwopJg3a7UM5+tOmiAhbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXW14kgC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so19023345e9.3
        for <linux-leds@vger.kernel.org>; Sun, 22 Mar 2026 08:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774194793; x=1774799593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PHNGU70N9+ja7t2Sr8WmnSEzu+wUwpmxlciBbvqcOsY=;
        b=SXW14kgCT7bogtla+8MvNU5zBgVCqd//qwHG/hw/L2w0FJl3u4ohqyQb34/1gMi83E
         X+1mo1PaxLGsifYGNacuue7+AXryLJ+9u6NW5OSFUDXzd4fF813bGquFKYaMzGtu25/P
         bOwFPkBw8Ol8UvNQgPzV9wtIwrtQwe933SMGJh4v+XSlj4ip1BiJWiXnN4DqUBCk2vAB
         B82QLsbhzr9wo8LM64Uo1pAngFixJ7BV9HhnJ8NCkjTkxwZ9sbdY0+I83aRrFl1zesWZ
         Z67mEjaaxC7x1y3/oS9tSgdXbOqrDF42EIrCgrcyvEgqL0diAWWTGTgUgdFbs1Ox5bkd
         q7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774194793; x=1774799593;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PHNGU70N9+ja7t2Sr8WmnSEzu+wUwpmxlciBbvqcOsY=;
        b=O0m5Dtmxje92wg5hYTh7RgaFc7r9ty3csEy+lmJYqrJvrizHO9EhoohiOcdMgiWRMl
         /68jUmZ0lEJfutcTaIZ5MzmrYLIcwlPr+3SA57JGXqxkxPtGZrJVpj+PQovutokvAw52
         Rs3rdAZCHlQg8NEbF7zlme8ong4pyOmACzzR0M5G4M1AIZhdXg0+XzWkCrniSB15YIsh
         jwqEJ8LdVRPixrFboXpAwlCUSIOHJNYUTRHPCljGmvRoHMRIxqB0wdJYOx2bYaChEGUV
         n2wswquYL1OXr2vldQ74CjTtB37Q05/Xs3HpjQL9/ITeCcFyHdYcTHk9S4gegqvJXAV+
         AYjA==
X-Forwarded-Encrypted: i=1; AJvYcCXlNSql++QLF5rbID0h18XqOnJr2jW6H/niEhKpMBaJHQvKHXwp0ZzszrTsNWEpq+jBCrGLQ+OCHYg2@vger.kernel.org
X-Gm-Message-State: AOJu0YxeJoHBWgVMP/7JtVi/yGjpXYrLrhTIoB7Y0bl71KZuedawt0fY
	UDIP7shdiA6r/kYaIysevJ8uDY92MZxByQy286XfyUHkTN30k0qFRYYP
X-Gm-Gg: ATEYQzy68DIa6hPBhswXOd8TFYA8OzZO1tJ050WVLd3FlMGJx+0L7pa2m4XhSh03Z/2
	MPh8Ug9r8bnhR20u9MYPWNErlfNnxUijjBdOJcvgZUgwbOaYSXffIP9WCWShAUYTSTxk5IrENUw
	kyllfaAaErIkjZk9mEhvnWCCd5YaT8lV83N7utJXcChvbXKdCHkRPc0kYec97oyNfwwDy3bNU1N
	fooVYFbnjKiQxITuFA1KmSRJrGqXLTtLl/L/ABzdsH3/sSnqLJp4AIsJQtOCyanI1IvcHs4onZ1
	Y20HsAtyfRBJVQCCR10DHj9PA12R4iJ5XKug/4jM1HXZudBWPtM9Z6WvTuwDfyp0Mon87YNn0Qt
	4HtnxFZEV/nLjTnctNz7Pw2rztw8c4oNicMPOxzS70vvt89X0IaM35wTwAB7A6ZHfUnwoV5L2b0
	Ql7+XClnVrbPzcH4fm40Zd8bmDqVXDA7S6e/Y=
X-Received: by 2002:a05:600c:3e18:b0:486:fb69:4960 with SMTP id 5b1f17b1804b1-486fee0d56fmr133319905e9.19.1774194792726;
        Sun, 22 Mar 2026 08:53:12 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe68ec05sm324013285e9.0.2026.03.22.08.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 08:53:12 -0700 (PDT)
Message-ID: <e43fc3be-7cee-432b-90cb-7fbc4af2fa68@gmail.com>
Date: Sun, 22 Mar 2026 16:53:10 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [RFC PATCH 1/1] leds: Introduce the multi_max_intensity sysfs
 attribute
To: Armin Wolf <W_Armin@gmx.de>, lee@kernel.org, pavel@kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-leds@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 wse@tuxedocomputers.com, pobrn@protonmail.com
References: <20260314230107.65444-1-W_Armin@gmx.de>
 <20260314230107.65444-2-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20260314230107.65444-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7411-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,vger.kernel.org,tuxedocomputers.com,protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacekanaszewski@gmail.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gmx.de:email]
X-Rspamd-Queue-Id: A50592E9D58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Armin,

On 3/15/26 12:01 AM, Armin Wolf wrote:
> Some multicolor LEDs support global brightness control in hardware,
> meaning that the maximum intensity of the color components is not
> connected to the maximum global brightness. Such LEDs cannot be
> described properly by the current multicolor LED class interface,
> because it assumes that the maximum intensity of each color component
> is described by the maximum global brightness of the LED.
> 
> Fix this by introducing a new sysfs attribute called
> "multi_max_intensity" holding the maximum intensity values for the
> color components of a multicolor LED class device. Drivers can use
> the new max_intensity field inside struct mc_subled to tell the
> multicolor LED class code about those values. Intensity values written
> by userspace applications will be limited to this maximum value.
> 
> Drivers for multicolor LEDs that do not support global brightness
> control in hardware might still want to use the maximum global LED
> brightness supplied via devicetree as the maximum intensity of each
> individual color component. Such drivers should set max_intensity
> to LED_USE_MAX_BRIGHTNESS so that the multicolor LED core can act

Since LED_USE_MAX_BRIGHTNESS value is 0, then I propose not to touch
the drivers which we want to stick to the default max_intensity,
unless they don't initialize their mc_subled structs to 0, or don't
use struct initialization list, which in case the property is omitted,
initializes it to 0.

> accordingly.
> 
> Compile-tested only.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   .../ABI/testing/sysfs-class-led-multicolor    | 16 +++++++--
>   Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++++-
>   drivers/hid/hid-lg-g15.c                      |  3 ++
>   drivers/hid/hid-playstation.c                 |  3 ++
>   drivers/leds/flash/leds-mt6360.c              |  8 ++---
>   drivers/leds/led-class-multicolor.c           | 36 +++++++++++++++++--
>   drivers/leds/leds-blinkm.c                    |  3 ++
>   drivers/leds/leds-cros_ec.c                   |  1 +
>   drivers/leds/leds-lp50xx.c                    |  1 +
>   drivers/leds/leds-lp55xx-common.c             |  7 ++--
>   drivers/leds/leds-max77705.c                  |  1 +
>   drivers/leds/leds-sun50i-a100.c               |  3 ++
>   drivers/leds/leds-turris-omnia.c              |  1 +
>   drivers/leds/rgb/leds-group-multicolor.c      |  1 +
>   drivers/leds/rgb/leds-ktd202x.c               |  1 +
>   drivers/leds/rgb/leds-lp5812.c                |  1 +
>   drivers/leds/rgb/leds-mt6370-rgb.c            |  8 ++---
>   drivers/leds/rgb/leds-ncp5623.c               |  4 +--
>   drivers/leds/rgb/leds-pwm-multicolor.c        |  1 +
>   drivers/leds/rgb/leds-qcom-lpg.c              |  1 +
>   drivers/platform/x86/silicom-platform.c       | 30 ++++++++++++++++
>   drivers/platform/x86/uniwill/uniwill-acpi.c   |  4 +--
>   include/linux/led-class-multicolor.h          | 32 ++++++++++++++++-
>   23 files changed, 164 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
> index 16fc827b10cb..fbd95c5003e2 100644
> --- a/Documentation/ABI/testing/sysfs-class-led-multicolor
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -17,8 +17,20 @@ KernelVersion:	5.9
>   Contact:	Dan Murphy <dmurphy@ti.com>
>   Description:	read/write
>   		This file contains array of integers. Order of components is
> -		described by the multi_index array. The maximum intensity should
> -		not exceed /sys/class/leds/<led>/max_brightness.
> +		described by the multi_index array.
> +		For additional details please refer to
> +		Documentation/leds/leds-class-multicolor.rst.

Why not to refer to the newly introduced multi_max_intensity file here
instead?

> +
> +What:		/sys/class/leds/<led>/multi_max_intensity
> +Date:		March 2026
> +KernelVersion:	7.1
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:	read
> +		This file contains an array of integers describing the maximum
> +		intensity value for each intensity component. Writing intensity
> +		values larger than the maximum value of a given component will
> +		result in those values being clamped.
>   
>   		For additional details please refer to
>   		Documentation/leds/leds-class-multicolor.rst.
> diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/leds/leds-class-multicolor.rst
> index c6b47b4093c4..8f42f10078ad 100644
> --- a/Documentation/leds/leds-class-multicolor.rst
> +++ b/Documentation/leds/leds-class-multicolor.rst
> @@ -25,10 +25,14 @@ color name to indexed value.
>   The ``multi_index`` file is an array that contains the string list of the colors as
>   they are defined in each ``multi_*`` array file.
>   
> -The ``multi_intensity`` is an array that can be read or written to for the
> +The ``multi_intensity`` file is an array that can be read or written to for the
>   individual color intensities.  All elements within this array must be written in
>   order for the color LED intensities to be updated.
>   
> +The ``multi_max_intensity`` file is an array that contains the maximum intensity
> +value supported by each color intensity. Intensity values above this will be
> +automatically clamped into the supported range.
> +
>   Directory Layout Example
>   ========================
>   .. code-block:: console
> @@ -38,6 +42,7 @@ Directory Layout Example
>       -r--r--r--    1 root     root          4096 Oct 19 16:16 max_brightness
>       -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_index
>       -rw-r--r--    1 root     root          4096 Oct 19 16:16 multi_intensity
> +    -r--r--r--    1 root     root          4096 OCt 19 16:16 multi_max_intensity
>   
>   ..
>   
> @@ -104,3 +109,17 @@ the color LED group.
>       128
>   
>   ..
> +
> +Writing intensity values larger than the maximum specified in ``multi_max_intensity``
> +will result in those values being clamped into the supported range.
> +
> +.. code-block:: console
> +
> +   # cat /sys/class/leds/multicolor:status/multi_max_intensity
> +   255 255 255
> +
> +   # echo 512 512 512 > /sys/class/leds/multicolor:status/multi_intensity
> +   # cat /sys/class/leds/multicolor:status/multi_intensity
> +   255 255 255
> +
> +..
> diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
> index 1a88bc44ada4..227f50b21c06 100644
> --- a/drivers/hid/hid-lg-g15.c
> +++ b/drivers/hid/hid-lg-g15.c
> @@ -975,14 +975,17 @@ static void lg_g15_setup_led_rgb(struct lg_g15_data *g15, int index)
>   		case LED_COLOR_ID_RED:
>   			subled_info[i].color_index = LED_COLOR_ID_RED;
>   			subled_info[i].intensity = gled->red;
> +			subled_info[i].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   			break;
>   		case LED_COLOR_ID_GREEN:
>   			subled_info[i].color_index = LED_COLOR_ID_GREEN;
>   			subled_info[i].intensity = gled->green;
> +			subled_info[i].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   			break;
>   		case LED_COLOR_ID_BLUE:
>   			subled_info[i].color_index = LED_COLOR_ID_BLUE;
>   			subled_info[i].intensity = gled->blue;
> +			subled_info[i].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   			break;
>   		}
>   		subled_info[i].channel = i;
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index 3c0db8f93c82..a6de4dd49750 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -874,8 +874,11 @@ static int ps_lightbar_register(struct ps_device *ps_dev, struct led_classdev_mc
>   		return -ENOMEM;
>   
>   	mc_led_info[0].color_index = LED_COLOR_ID_RED;
> +	mc_led_info[0].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   	mc_led_info[1].color_index = LED_COLOR_ID_GREEN;
> +	mc_led_info[1].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   	mc_led_info[2].color_index = LED_COLOR_ID_BLUE;
> +	mc_led_info[2].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   
>   	lightbar_mc_dev->subled_info = mc_led_info;
>   	lightbar_mc_dev->num_colors = 3;
> diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
> index 462a902f54e0..f0331cbec6aa 100644
> --- a/drivers/leds/flash/leds-mt6360.c
> +++ b/drivers/leds/flash/leds-mt6360.c
> @@ -100,7 +100,7 @@ static int mt6360_mc_brightness_set(struct led_classdev *lcdev,
>   	struct led_classdev_mc *mccdev = lcdev_to_mccdev(lcdev);
>   	struct mt6360_led *led = container_of(mccdev, struct mt6360_led, mc);
>   	struct mt6360_priv *priv = led->priv;
> -	u32 real_bright, enable_mask = 0, enable = 0;
> +	u32 enable_mask = 0, enable = 0;
>   	int i, ret;
>   
>   	mutex_lock(&priv->lock);
> @@ -110,14 +110,13 @@ static int mt6360_mc_brightness_set(struct led_classdev *lcdev,
>   	for (i = 0; i < mccdev->num_colors; i++) {
>   		struct mc_subled *subled = mccdev->subled_info + i;
>   
> -		real_bright = min(lcdev->max_brightness, subled->brightness);
>   		ret = regmap_update_bits(priv->regmap, MT6360_REG_ISNK(i),
> -					 MT6360_ISNK_MASK, real_bright);
> +					 MT6360_ISNK_MASK, subled->brightness);
>   		if (ret)
>   			goto out;
>   
>   		enable_mask |= MT6360_ISNK_ENMASK(subled->channel);
> -		if (real_bright)
> +		if (subled->brightness)
>   			enable |= MT6360_ISNK_ENMASK(subled->channel);
>   	}
>   
> @@ -660,6 +659,7 @@ static int mt6360_init_isnk_properties(struct mt6360_led *led,
>   			priv->leds_active |= BIT(reg);
>   			sub_led[num_color].color_index = color;
>   			sub_led[num_color].channel = reg;
> +			sub_led[num_color].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   			num_color++;
>   		}
>   
> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
> index 6b671f3f9c61..72323e825331 100644
> --- a/drivers/leds/led-class-multicolor.c
> +++ b/drivers/leds/led-class-multicolor.c
> @@ -7,6 +7,7 @@
>   #include <linux/init.h>
>   #include <linux/led-class-multicolor.h>
>   #include <linux/math.h>
> +#include <linux/minmax.h>
>   #include <linux/module.h>
>   #include <linux/slab.h>
>   #include <linux/uaccess.h>
> @@ -27,6 +28,30 @@ int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>   }
>   EXPORT_SYMBOL_GPL(led_mc_calc_color_components);
>   
> +static ssize_t multi_max_intensity_show(struct device *dev,
> +					struct device_attribute *intensity_attr, char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
> +	unsigned int max_intensity;
> +	int len = 0;
> +	int i;
> +
> +	for (i = 0; i < mcled_cdev->num_colors; i++) {
> +		max_intensity = mcled_cdev->subled_info[i].max_intensity;
> +		if (max_intensity == LED_USE_MAX_BRIGHTNESS)
> +			max_intensity = led_cdev->max_brightness;
> +
> +		len += sprintf(buf + len, "%u", max_intensity);
> +		if (i < mcled_cdev->num_colors - 1)
> +			len += sprintf(buf + len, " ");
> +	}
> +
> +	buf[len++] = '\n';
> +	return len;
> +}
> +static DEVICE_ATTR_RO(multi_max_intensity);
> +
>   static ssize_t multi_intensity_store(struct device *dev,
>   				struct device_attribute *intensity_attr,
>   				const char *buf, size_t size)
> @@ -35,6 +60,7 @@ static ssize_t multi_intensity_store(struct device *dev,
>   	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
>   	int nrchars, offset = 0;
>   	unsigned int intensity_value[LED_COLOR_ID_MAX];
> +	unsigned int max_intensity;
>   	int i;
>   	ssize_t ret;
>   
> @@ -56,8 +82,13 @@ static ssize_t multi_intensity_store(struct device *dev,
>   		goto err_out;
>   	}
>   
> -	for (i = 0; i < mcled_cdev->num_colors; i++)
> -		mcled_cdev->subled_info[i].intensity = intensity_value[i];
> +	for (i = 0; i < mcled_cdev->num_colors; i++) {
> +		max_intensity = mcled_cdev->subled_info[i].max_intensity;
> +		if (max_intensity == LED_USE_MAX_BRIGHTNESS)
> +			max_intensity = led_cdev->max_brightness;
> +
> +		mcled_cdev->subled_info[i].intensity = min(intensity_value[i], max_intensity);
> +	}
>   
>   	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
>   		led_set_brightness(led_cdev, led_cdev->brightness);
> @@ -111,6 +142,7 @@ static ssize_t multi_index_show(struct device *dev,
>   static DEVICE_ATTR_RO(multi_index);
>   
>   static struct attribute *led_multicolor_attrs[] = {
> +	&dev_attr_multi_max_intensity.attr,
>   	&dev_attr_multi_intensity.attr,
>   	&dev_attr_multi_index.attr,
>   	NULL,
> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
> index 577497b9d426..7d1140767c76 100644
> --- a/drivers/leds/leds-blinkm.c
> +++ b/drivers/leds/leds-blinkm.c
> @@ -694,8 +694,11 @@ static int register_multicolor(struct i2c_client *client, struct blinkm_data *da
>   		return -ENOMEM;
>   
>   	mc_led_info[RED].color_index = LED_COLOR_ID_RED;
> +	mc_led_info[RED].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   	mc_led_info[GREEN].color_index = LED_COLOR_ID_GREEN;
> +	mc_led_info[GREEN].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   	mc_led_info[BLUE].color_index = LED_COLOR_ID_BLUE;
> +	mc_led_info[BLUE].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   
>   	mc_led->cdev.mcled_cdev.subled_info = mc_led_info;
>   	mc_led->cdev.mcled_cdev.num_colors = NUM_LEDS;
> diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
> index bea3cc3fbfd2..b891471812ff 100644
> --- a/drivers/leds/leds-cros_ec.c
> +++ b/drivers/leds/leds-cros_ec.c
> @@ -202,6 +202,7 @@ static int cros_ec_led_probe_one(struct device *dev, struct cros_ec_device *cros
>   			continue;
>   
>   		subleds[subled].color_index = cros_ec_led_to_linux_id[i];
> +		subleds[subled].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   		if (subled == 0)
>   			subleds[subled].intensity = 100;
>   		subled++;
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index e2a9c8592953..69c3550f1a31 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -525,6 +525,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>   			}
>   
>   			mc_led_info[multi_index].color_index = color_id;
> +			mc_led_info[multi_index].max_intensity = 255;
>   			num_colors++;
>   		}
>   
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index ea131177de96..f637e74e8780 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -495,10 +495,9 @@ static int lp55xx_init_led(struct lp55xx_led *led,
>   		led_cdev->brightness_set_blocking = lp55xx_set_mc_brightness;
>   		led->mc_cdev.num_colors = pdata->led_config[chan].num_colors;
>   		for (i = 0; i < led->mc_cdev.num_colors; i++) {
> -			mc_led_info[i].color_index =
> -				pdata->led_config[chan].color_id[i];
> -			mc_led_info[i].channel =
> -					pdata->led_config[chan].output_num[i];
> +			mc_led_info[i].color_index = pdata->led_config[chan].color_id[i];
> +			mc_led_info[i].channel = pdata->led_config[chan].output_num[i];
> +			mc_led_info[i].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   		}
>   
>   		led->mc_cdev.subled_info = mc_led_info;
> diff --git a/drivers/leds/leds-max77705.c b/drivers/leds/leds-max77705.c
> index 1e2054c1bf80..bd2c078b42f3 100644
> --- a/drivers/leds/leds-max77705.c
> +++ b/drivers/leds/leds-max77705.c
> @@ -149,6 +149,7 @@ static int max77705_parse_subled(struct device *dev, struct fwnode_handle *np,
>   				     "failed to parse \"color\" of %pOF\n", np);
>   
>   	info->color_index = color;
> +	info->max_intensity = LED_USE_MAX_BRIGHTNESS;
>   
>   	return 0;
>   }
> diff --git a/drivers/leds/leds-sun50i-a100.c b/drivers/leds/leds-sun50i-a100.c
> index 2c9bd360ab81..6e77cbcb8b54 100644
> --- a/drivers/leds/leds-sun50i-a100.c
> +++ b/drivers/leds/leds-sun50i-a100.c
> @@ -504,10 +504,13 @@ static int sun50i_a100_ledc_probe(struct platform_device *pdev)
>   		fwnode_property_read_u32(child, "reg", &led->addr);
>   
>   		led->subled_info[0].color_index = LED_COLOR_ID_RED;
> +		led->subled_info[0].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   		led->subled_info[0].channel = 0;
>   		led->subled_info[1].color_index = LED_COLOR_ID_GREEN;
> +		led->subled_info[1].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   		led->subled_info[1].channel = 1;
>   		led->subled_info[2].color_index = LED_COLOR_ID_BLUE;
> +		led->subled_info[2].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   		led->subled_info[2].channel = 2;
>   
>   		led->mc_cdev.num_colors = ARRAY_SIZE(led->subled_info);
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> index 25ee5c1eb820..fc41891fe971 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -233,6 +233,7 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
>   	/* Initial color is white */
>   	for (int i = 0; i < OMNIA_LED_NUM_CHANNELS; ++i) {
>   		led->subled_info[i].intensity = 255;
> +		led->subled_info[i].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   		led->subled_info[i].brightness = 255;
>   		led->subled_info[i].channel = i;
>   	}
> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
> index 548c7dd63ba1..c472ccbd506e 100644
> --- a/drivers/leds/rgb/leds-group-multicolor.c
> +++ b/drivers/leds/rgb/leds-group-multicolor.c
> @@ -111,6 +111,7 @@ static int leds_gmc_probe(struct platform_device *pdev)
>   
>   		/* Configure the LED intensity to its maximum */
>   		subled[i].intensity = max_brightness;
> +		subled[i].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   	}
>   
>   	/* Initialise the multicolor's LED class device */
> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
> index e4f0f25a5e45..4b054175b3b5 100644
> --- a/drivers/leds/rgb/leds-ktd202x.c
> +++ b/drivers/leds/rgb/leds-ktd202x.c
> @@ -423,6 +423,7 @@ static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct fwnode_handle *fwn
>   		info[i].color_index = mono_color;
>   		info[i].channel = reg;
>   		info[i].intensity = KTD202X_MAX_BRIGHTNESS;
> +		info[i].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   		i++;
>   	}
>   
> diff --git a/drivers/leds/rgb/leds-lp5812.c b/drivers/leds/rgb/leds-lp5812.c
> index ce6d703641e8..61fa8df493fb 100644
> --- a/drivers/leds/rgb/leds-lp5812.c
> +++ b/drivers/leds/rgb/leds-lp5812.c
> @@ -353,6 +353,7 @@ static int lp5812_init_led(struct lp5812_led *led, struct lp5812_chip *chip, int
>   		for (i = 0; i < led->mc_cdev.num_colors; i++) {
>   			mc_led_info[i].color_index = chip->led_config[chan].color_id[i];
>   			mc_led_info[i].channel = chip->led_config[chan].led_id[i];
> +			mc_led_info[i].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   		}
>   
>   		led->mc_cdev.subled_info = mc_led_info;
> diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
> index c5927d0eb830..ea11ca9d3326 100644
> --- a/drivers/leds/rgb/leds-mt6370-rgb.c
> +++ b/drivers/leds/rgb/leds-mt6370-rgb.c
> @@ -437,10 +437,7 @@ static int mt6370_mc_brightness_set(struct led_classdev *lcdev, enum led_brightn
>   	disable = enable;
>   
>   	for (i = 0; i < mccdev->num_colors; i++) {
> -		u32 brightness;
> -
>   		subled = mccdev->subled_info + i;
> -		brightness = min(subled->brightness, lcdev->max_brightness);
>   		disable &= ~MT6370_CHEN_BIT(subled->channel);
>   
>   		if (level == 0) {
> @@ -453,14 +450,14 @@ static int mt6370_mc_brightness_set(struct led_classdev *lcdev, enum led_brightn
>   			continue;
>   		}
>   
> -		if (brightness == 0) {
> +		if (subled->brightness == 0) {
>   			enable &= ~MT6370_CHEN_BIT(subled->channel);
>   			continue;
>   		}
>   
>   		enable |= MT6370_CHEN_BIT(subled->channel);
>   
> -		ret = mt6370_set_led_brightness(priv, subled->channel, brightness);
> +		ret = mt6370_set_led_brightness(priv, subled->channel, subled->brightness);
>   		if (ret)
>   			goto out_unlock;
>   	}
> @@ -742,6 +739,7 @@ static int mt6370_assign_multicolor_info(struct device *dev, struct mt6370_led *
>   		sub_led[num_color].color_index = color;
>   		sub_led[num_color].channel = reg;
>   		sub_led[num_color].intensity = 0;
> +		sub_led[num_color].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   		num_color++;
>   	}
>   
> diff --git a/drivers/leds/rgb/leds-ncp5623.c b/drivers/leds/rgb/leds-ncp5623.c
> index 85d6be6fff2b..f2528f06507d 100644
> --- a/drivers/leds/rgb/leds-ncp5623.c
> +++ b/drivers/leds/rgb/leds-ncp5623.c
> @@ -56,8 +56,7 @@ static int ncp5623_brightness_set(struct led_classdev *cdev,
>   	for (int i = 0; i < mc_cdev->num_colors; i++) {
>   		ret = ncp5623_write(ncp->client,
>   				    NCP5623_PWM_REG(mc_cdev->subled_info[i].channel),
> -				    min(mc_cdev->subled_info[i].intensity,
> -					NCP5623_MAX_BRIGHTNESS));
> +				    mc_cdev->subled_info[i].intensity);
>   		if (ret)
>   			return ret;
>   	}
> @@ -190,6 +189,7 @@ static int ncp5623_probe(struct i2c_client *client)
>   			goto release_led_node;
>   
>   		subled_info[ncp->mc_dev.num_colors].channel = reg;
> +		subled_info[ncp->mc_dev.num_colors].max_intensity = NCP5623_MAX_BRIGHTNESS;
>   		subled_info[ncp->mc_dev.num_colors++].color_index = color_index;
>   	}
>   
> diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
> index e0d7d3c9215c..578e67dcc881 100644
> --- a/drivers/leds/rgb/leds-pwm-multicolor.c
> +++ b/drivers/leds/rgb/leds-pwm-multicolor.c
> @@ -95,6 +95,7 @@ static int iterate_subleds(struct device *dev, struct pwm_mc_led *priv,
>   		}
>   
>   		subled[priv->mc_cdev.num_colors].color_index = color;
> +		subled[priv->mc_cdev.num_colors].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   		priv->mc_cdev.num_colors++;
>   	}
>   
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index f6061c47f863..390dcbe1cd18 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1411,6 +1411,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
>   
>   			info[i].color_index = led->channels[i]->color;
>   			info[i].intensity = 0;
> +			info[i].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   			i++;
>   		}
>   
> diff --git a/drivers/platform/x86/silicom-platform.c b/drivers/platform/x86/silicom-platform.c
> index 266f7bc5e416..5ed115b7dc01 100644
> --- a/drivers/platform/x86/silicom-platform.c
> +++ b/drivers/platform/x86/silicom-platform.c
> @@ -283,18 +283,21 @@ static struct mc_subled plat_0222_wan_mc_subled_info[] __initdata = {
>   		.color_index = LED_COLOR_ID_WHITE,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0c, 7),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_YELLOW,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0c, 6),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_RED,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0c, 5),
>   	},
>   };
> @@ -304,18 +307,21 @@ static struct mc_subled plat_0222_sys_mc_subled_info[] __initdata = {
>   		.color_index = LED_COLOR_ID_WHITE,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0c, 4),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_AMBER,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0c, 3),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_RED,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0c, 2),
>   	},
>   };
> @@ -325,24 +331,28 @@ static struct mc_subled plat_0222_stat1_mc_subled_info[] __initdata = {
>   		.color_index = LED_COLOR_ID_RED,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0c, 1),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_GREEN,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0c, 0),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_BLUE,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0d, 7),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_YELLOW,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0d, 6),
>   	},
>   };
> @@ -352,24 +362,28 @@ static struct mc_subled plat_0222_stat2_mc_subled_info[] __initdata = {
>   		.color_index = LED_COLOR_ID_RED,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0d, 5),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_GREEN,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0d, 4),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_BLUE,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0d, 3),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_YELLOW,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0d, 2),
>   	},
>   };
> @@ -379,24 +393,28 @@ static struct mc_subled plat_0222_stat3_mc_subled_info[] __initdata = {
>   		.color_index = LED_COLOR_ID_RED,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0d, 1),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_GREEN,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0d, 0),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_BLUE,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0e, 1),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_YELLOW,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x0e, 0),
>   	},
>   };
> @@ -497,24 +515,28 @@ static struct mc_subled cordoba_fp_left_mc_subled_info[] __initdata = {
>   		.color_index = LED_COLOR_ID_RED,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x08, 6),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_GREEN,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x08, 5),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_BLUE,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x09, 7),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_AMBER,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x09, 4),
>   	},
>   };
> @@ -524,24 +546,28 @@ static struct mc_subled cordoba_fp_center_mc_subled_info[] __initdata = {
>   		.color_index = LED_COLOR_ID_RED,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x08, 7),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_GREEN,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x08, 4),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_BLUE,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x08, 3),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_AMBER,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x09, 6),
>   	},
>   };
> @@ -551,24 +577,28 @@ static struct mc_subled cordoba_fp_right_mc_subled_info[] __initdata = {
>   		.color_index = LED_COLOR_ID_RED,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x08, 2),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_GREEN,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x08, 1),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_BLUE,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x08, 0),
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_AMBER,
>   		.brightness = 1,
>   		.intensity = 0,
> +		.max_intensity = LED_USE_MAX_BRIGHTNESS,
>   		.channel = OFFSET_BIT_TO_CHANNEL(0x09, 5),
>   	},
>   };
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index fee93537aa43..9468a93f7a59 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -1082,8 +1082,7 @@ static int uniwill_led_brightness_set(struct led_classdev *led_cdev, enum led_br
>   	guard(mutex)(&data->led_lock);
>   
>   	for (int i = 0; i < LED_CHANNELS; i++) {
> -		/* Prevent the brightness values from overflowing */
> -		value = min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].brightness);
> +		value = data->led_mc_subled_info[i].brightness;
>   		ret = regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], value);
>   		if (ret < 0)
>   			return ret;
> @@ -1182,6 +1181,7 @@ static int uniwill_led_init(struct uniwill_data *data)
>   			return ret;
>   
>   		data->led_mc_subled_info[i].intensity = value;
> +		data->led_mc_subled_info[i].max_intensity = LED_USE_MAX_BRIGHTNESS;
>   		data->led_mc_subled_info[i].channel = i;
>   	}
>   
> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
> index db9f34c6736e..67ac0ac0fd54 100644
> --- a/include/linux/led-class-multicolor.h
> +++ b/include/linux/led-class-multicolor.h
> @@ -9,10 +9,33 @@
>   #include <linux/leds.h>
>   #include <dt-bindings/leds/common.h>
>   
> +#define LED_USE_MAX_BRIGHTNESS 0
> +
> +/**
> + * struct mc_subled - Color component description.
> + * @color_index: Color ID.
> + * @brightness: Scaled intensity.
> + * @intensity: Current intensity.
> + * @max_intensity: Maximum supported intensity value.
> + * @channel: Channel index.
> + *
> + * Describes a color component of a multicolor LED. Many multicolor LEDs
> + * do no support gobal brightness control in hardware, so they use
> + * the brightness field in connection with led_mc_calc_color_components()
> + * to perform the intensity scaling in software.
> + * Such drivers should set max_intensity to LED_USE_MAX_BRIGHTNESS

I'd just mention here that the field needs to be left initialized to 0,
to let the LED subsystem to adjust it to max_brightness. Note that in
case of max_brightness we allow for the same - if it is 0, then
led-class.c adjusts it to legacy LED_FULL (255).


> + * to signal the multicolor LED core that the maximum global brightness of the
> + * LED class device should be used for limiting incoming intensity values.
> + *
> + * Multicolor LEDs that do support global brightness control in hardware
> + * should instead set max_intensity to the maximum intensity value supported
> + * by the hardware for a given color component.
> + */
>   struct mc_subled {
>   	unsigned int color_index;
>   	unsigned int brightness;
>   	unsigned int intensity;
> +	unsigned int max_intensity;
>   	unsigned int channel;
>   };
>   
> @@ -53,7 +76,14 @@ int led_classdev_multicolor_register_ext(struct device *parent,
>    */
>   void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev);
>   
> -/* Calculate brightness for the monochrome LED cluster */
> +/**
> + * led_mc_calc_color_components() - Calculate brightness for the monochrome LED cluster.

It does not calculate brightness for the whole LED cluster, but for each
sub-LED individually. Brightness of the whole cluster can be deemed a
lightness of the multicolor LED, and the blend of the color components
can be deemed its hue.

In this case I'd document it as "Calculates brightness values for the
LEDs of the monochrome LED cluster".

> + * @mcled_cdev - Multicolor LED class device of the LED cluster.
> + * @led_brightness - Global brightness of the LED cluster.
> + *
> + * Calculates the brightness values for each color component of a monochrome LED cluster,
> + * see Documentation/leds/leds-class-multicolor.rst for details.
> + */
>   int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>   				 enum led_brightness brightness);
>   

-- 
Best regards,
Jacek Anaszewski


