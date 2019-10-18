Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDF66DD157
	for <lists+linux-leds@lfdr.de>; Fri, 18 Oct 2019 23:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388054AbfJRVpA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Oct 2019 17:45:00 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36619 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727793AbfJRVo7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Oct 2019 17:44:59 -0400
Received: by mail-wm1-f65.google.com with SMTP id m18so7423060wmc.1;
        Fri, 18 Oct 2019 14:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AzdoI2mzcW1Y3dpjlVKOpFBOGMQfeRPlqppvlgq4qfc=;
        b=QKkxRrBnJ+3QgSLei0RaOxPpUvlhOionyyVfns/7HigkN5EruiWUBKzWxrYSUcP8Yc
         6E8aaNU3EuiB3AhsjRrzrc8+soRGDcxVOe0CMqtuUUvTTUmpWiPlw8GkgaliyNYGYM/L
         f9o3pqcPcfcPLUIcZD7UUjFfa9FIxcG2RE2me4BxwYfqGTNZ5idru1D8tjRE0bMAFRe4
         FiX9UO5Qr24Lml18Bq5XsWMizb41+N3i72LPuDqZnQsi2UsDZkOYWOSbkUF7rKik77t9
         7U0plsg8rcM4dFHoY1W7JYXmg3tp2o/OS0vn+cs3JQZbijOjsEXYuODKDGZxhX2Su8Dv
         KRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=AzdoI2mzcW1Y3dpjlVKOpFBOGMQfeRPlqppvlgq4qfc=;
        b=atTdx8lCAbOoceAzUe+drSpl/zdmIWLDuj1mPrsUApKjilaqLjpHgpxqE9SBDVMXM7
         q6Ox9gGFBgievRGrg2EICmMUyGADK+IioPJ+0bszPiAKuoldH04E6yk5BlN96dN0Jj50
         HxvzozBzIBMoz4qm31wTDWlgo4Cc8b4kbbByC0Ur+AvVUJ1/V4aMoZTPXNL5Oyv/1esD
         uKegs24w7t6MgAtlW1huqrLs18IW+lcDnIqByYwqR9XHfDPSB8z/mcygiQjCX9qPriJB
         8Ye/lxngEiQO2SpJwFlHh+qYACaXQHvU6ihe+b/CLHoZ9e+Yg49gA+xMXRh8Br96zc9D
         youw==
X-Gm-Message-State: APjAAAXyBE0ErX4kaNRty1F215c7CyMcFi4q9UTrPKvGEdwZaNfhIaI+
        i9iFXyHRXv4dPxFfwZk/vm4l12+7
X-Google-Smtp-Source: APXvYqwFnFvEmvcLScSGOnQDcIQd/EmSI6w5qndTRqisA4X003x+Z5rFiAypP/Yp6rUKGq4NWhe5Pw==
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr9630297wml.142.1571435096643;
        Fri, 18 Oct 2019 14:44:56 -0700 (PDT)
Received: from [192.168.1.19] (chp168.neoplus.adsl.tpnet.pl. [83.31.13.168])
        by smtp.gmail.com with ESMTPSA id u68sm8136577wmu.12.2019.10.18.14.44.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Oct 2019 14:44:56 -0700 (PDT)
Subject: Re: [PATCH v14 04/19] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191018122521.6757-1-dmurphy@ti.com>
 <20191018122521.6757-5-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <8a9084d2-184d-fa12-fd29-56bbc74c58b3@gmail.com>
Date:   Fri, 18 Oct 2019 23:44:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018122521.6757-5-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

Thank you for the update.

On 10/18/19 2:25 PM, Dan Murphy wrote:
> Introduce a multicolor class that groups colored LEDs
> within a LED node.
> 
> The multi color class groups monochrome LEDs and allows controlling two
> aspects of the final combined color: hue and lightness. The former is
> controlled via <color>_intensity files and the latter is controlled
> via brightness file.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../ABI/testing/sysfs-class-led-multicolor    |  36 +++
>  Documentation/leds/index.rst                  |   1 +
>  Documentation/leds/leds-class-multicolor.rst  | 100 +++++++
>  drivers/leds/Kconfig                          |  10 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/led-class-multicolor.c           | 271 ++++++++++++++++++
>  include/linux/led-class-multicolor.h          |  97 +++++++
>  7 files changed, 516 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>  create mode 100644 Documentation/leds/leds-class-multicolor.rst
>  create mode 100644 drivers/leds/led-class-multicolor.c
>  create mode 100644 include/linux/led-class-multicolor.h
[...]
>  # LED Platform Drivers
> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
> new file mode 100644
> index 000000000000..453fd8e913e9
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
> +#define INTENSITY_NAME		"_intensity"
> +#define MAX_INTENSITY_NAME	"_max_intensity"
> +
> +int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
> +				 enum led_brightness brightness,
> +			       struct led_mc_color_conversion color_component[])
> +{
> +	struct led_mc_color_entry *priv;
> +	int i = 0;
> +
> +	list_for_each_entry(priv, &mcled_cdev->color_list, list) {
> +		color_component[i].color_id = priv->led_color_id;
> +		color_component[i].brightness = brightness *
> +					  priv->intensity / priv->max_intensity;
> +		i++;
> +	}

For lines in the function above:

s/component/components/

> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(led_mc_calc_color_components);


-- 
Best regards,
Jacek Anaszewski
