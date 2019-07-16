Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 235516AFAA
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jul 2019 21:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728781AbfGPTSh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Jul 2019 15:18:37 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39663 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbfGPTSh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 16 Jul 2019 15:18:37 -0400
Received: by mail-wm1-f65.google.com with SMTP id u25so9393158wmc.4;
        Tue, 16 Jul 2019 12:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v2mTx1EqMffEGEst9Te19cokm4X5NiDrNxCf2bWm/vw=;
        b=p3xsA1sipzqDAboi2BYPJQZ8gQZWd6WlZ+fqAZb8d/KXf7JbHDFrxeKM2x+8FFQrWG
         T7SMTu4Q5nTf6ebnMvPyssBBXpRfFb4jmz1Q4kBME7ooVKI9GQGyS9+2HWlkjnF5zzCH
         TVdMcJEdKZdxCnjRfFqiUhXLcCTX5+mbb5XgPhoHCKJ5Ku1jAnbkVpwXPaTwj8tsqeTe
         +sCMZFiVOHu7qTcdi2yxk5OfP5s414MH3QUL6vi8tM+Watf3KmsDXJML4uKMYdLeRt4t
         vApIDAHvlZ1jnFUgoJGFn/6d7wG1Secra4e03iSoawKAujjrZxQYNteoXEQ473Vy/kI/
         iCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=v2mTx1EqMffEGEst9Te19cokm4X5NiDrNxCf2bWm/vw=;
        b=VbA0OvrqjbobkJbSpFIKII2vpcpV9jO3aVzDGdWKpiVj5scN4XqovVYAlkf2FJ/1Nt
         ZMj3MzPSqi42A3Ce3jQF4OLTavSWHpjdcuBseVEbvUUzeTrVdajJXQZJrCqATPfaP8dN
         qkAHYPJbTGuCdL/5mErEolJgQUEkHT0MZqfPN3YRPnpcUCzIUyhIPjwR9Hwtb7oyF4Bk
         oieeJzeeKMJIpi7/jjzp7f1OvhonVNylJm2C/meFnRQMbdNjk04pdzbCMpG7xS9tdWlb
         SGFddzuorRI/KSKdKNmX7jTkuh9Xrh34qiZOlS59lgfNt84G6eOIl40p6ACviprAF8LD
         LwKA==
X-Gm-Message-State: APjAAAXmYLtZuTpbeEiYAVxj64kfOf8IoEn9HyyGad0Qlxyxf+l3MTP5
        FDIp0bHoskFLPZgnadWJ7SnmWiNo
X-Google-Smtp-Source: APXvYqxABHNYQJc0Te9kSVXJXnK1B6NRRnV/FJgDDpw5AcNdn/UyGnXwNaE+62zA9aCzIBxIyGIEUg==
X-Received: by 2002:a05:600c:2218:: with SMTP id z24mr31841977wml.84.1563304713081;
        Tue, 16 Jul 2019 12:18:33 -0700 (PDT)
Received: from [192.168.1.19] (chm81.neoplus.adsl.tpnet.pl. [83.31.10.81])
        by smtp.gmail.com with ESMTPSA id s63sm19076896wme.17.2019.07.16.12.18.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 12:18:32 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] documention: leds: Add multicolor class
 documentation
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190701204634.10517-1-dmurphy@ti.com>
 <20190701204634.10517-3-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABtC1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAj4EEwEIACgCGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQJVo39tBQkJZgNMAAoJEL1qUBy3i3wmxLQQAK8QEQ0JqZEv
 5hrxiwT+Qtkx1TULYriK9sYcY9zbi18YxbKB0C4Znh5iP5o7k26WnPGLM+w4qWvTAkHjuAI7
 aBrvb4nGRvE5s14PQ9IHgL7iL3zAAHT1azIZng9dUCCSontB+vQZu1x/Un0lVlVCvsvO7QVt
 hAZUlT3iucNMO0jpCiS3raZkNfab8M+JWP/iplaV0Kn+O7LX3A/RdLmx5ZhuT+zvyHwl2c3K
 T56UHaQnjkuHB2Ytk8HtOjNXGNYnm4nLx3ok3jEN1nWDRV/DeiPn8zz4Zebsp686OH9vvX/0
 R4dk2YEjUCY/S7CbJxXzUnLjboUAGmtTVOu/uJ7y11iS9XEoJ09HEzijQwWctJXLojcTXCFw
 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
 eGGiEQ==
Message-ID: <1049968b-6084-ed21-67bf-ef074c591f0a@gmail.com>
Date:   Tue, 16 Jul 2019 21:18:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190701204634.10517-3-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

Thanks for the update. I have some nits below, please take a look.

On 7/1/19 10:46 PM, Dan Murphy wrote:
> Add the support documentation on the multicolor LED framework.
> This document defines the directores and file generated by the
> multicolor framework.  It also documents usage.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  Documentation/leds/leds-class-multicolor.txt | 152 +++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 Documentation/leds/leds-class-multicolor.txt
> 
> diff --git a/Documentation/leds/leds-class-multicolor.txt b/Documentation/leds/leds-class-multicolor.txt
> new file mode 100644
> index 000000000000..01175288502e
> --- /dev/null
> +++ b/Documentation/leds/leds-class-multicolor.txt
> @@ -0,0 +1,152 @@
> +
> +Multi Color LED handling under Linux
> +=================================================
> +
> +Author: Dan Murphy <dmurphy@ti.com>
> +
> +Description
> +-----------
> +There are varying monochrome LED colors available for application.  These
> +LEDs can be used as a single use case LED or can be mixed with other color
> +LEDs to produce the full spectrum of color.  Color LEDs that are grouped
> +can be presented under a single LED node with individual color control.
> +The multicolor class groups these LEDs and allows dynamically setting the value
> +of a single LED or setting the intensity values of the LEDs in the group and
> +updating the LEDs virtually simultaneously.
> +
> +Multicolor Class Control
> +-------------------------
> +The multicolor class presents the LED groups under a directory called "colors".
> +This directory is a child under the LED parent node created by the led_class
> +framework.  The led_class framework is documented in led-class.txt within this
> +documentation directory.
> +
> +Each colored LED is given its own directory.  These directories can be, but not
> +limited to red, green, blue, white, amber, yellow and violet.  Under these
> +directories the intensity and max_intensity files are presented for each LED.
> +
> +
> +Directory Layout Example
> +------------------------
> +root:/sys/class/leds/rgb:grouped_leds# ls -lR colors/
> +colors/:
> +drwxr-xr-x    2 root     root             0 Jun 28 20:21 blue
> +drwxr-xr-x    2 root     root             0 Jun 28 20:21 green
> +drwxr-xr-x    2 root     root             0 Jun 28 20:21 red
> +-rw-------    1 root     root          4096 Jun 28 20:21 color_mix
> +
> +colors/blue:
> +-rw-------    1 root     root          4096 Jun 28 20:21 intensity
> +-r--------    1 root     root          4096 Jun 28 20:27 max_intensity
> +-r--------    1 root     root          4096 Jun 28 20:21 color_id
> +
> +colors/green:
> +-rw-------    1 root     root          4096 Jun 28 20:22 intensity
> +-r--------    1 root     root          4096 Jun 28 20:27 max_intensity
> +-r--------    1 root     root          4096 Jun 28 20:21 color_id
> +
> +colors/red:
> +-rw-------    1 root     root          4096 Jun 28 20:21 intensity
> +-r--------    1 root     root          4096 Jun 28 20:27 max_intensity
> +-r--------    1 root     root          4096 Jun 28 20:21 color_id
> +
> +Multicolor Color Mixing
> +-----------------------
> +Multicolor monochrome LEDs intensity can be modified and mixed to produce a
> +varying array of colors.  The color_mix file gives the user the ability to write
> +all the monochrome LEDs registered in the directory with a single call.
> +To create a specific color from monochrome LEDs the color_mix file needs to be
> +written with each color's intensity.  The order in which the monochrome LEDs
> +should be written is based on the colors color_id.
> +
> +For example:
> +cat /sys/class/leds/rgb:grouped_leds/red/color_id
> +0
> +cat /sys/class/leds/rgb:grouped_leds/green/color_id
> +1
> +cat /sys/class/leds/rgb:grouped_leds/blue/color_id
> +2
> +
> +red - color_id = 0
> +green - color_id = 1
> +blue - color_id = 2
> +
> +These id's are the order in which to write the color_mix file.
> +
> +echo "<red> <green> <blue>" > color_mix
> +
> +echo "0x80 0x00 0x80" > color_mix
> +
> +The order of the monochrome LEDs are determined during multicolor class
> +registration and will not change unless unregistered and re-registered.
> +
> +Other example with amber monochrome LED:
> +blue - color_id = 0
> +amber - color_id = 1
> +
> +In this exampe blue is at ID 0 and amber ID is 1 so the user would write
> +echo "<blue> <amber>" > color_mix
> +
> +echo "0x38 0x80" > color_mix
> +
> +If a single monochrome LED needs to be modified then the user would write the
> +colors/<color>/intensity file.
> +
> +
> +Multicolor Class Brightness Control
> +-----------------------------------
> +The multiclor class framework will calculate each monochrome LEDs intensity.
> +
> +The brightness level for each LED is calculated based on the color LED
> +intensity setting divided by the color LED max intensity setting multiplied by
> +the requested value.
> +
> +led_brightness = requested_value*(led_color_intensity/led_color_max_intensity)

Please drop parentheses here as pointed out before in the code review.

> +
> +Example:
> +Three LEDs are present in the group as defined in "Directory Layout Example"
> +within this document.
> +
> +A user first writes the color LED brightness file with the brightness level that
> +is neccesary to achieve a blueish violet output from the RGB LED group.
> +
> +echo 138 > /sys/class/leds/rgb:grouped_leds/red/intensity
> +echo 43 > /sys/class/leds/rgb:grouped_leds/green/intensity
> +echo 226 > /sys/class/leds/rgb:grouped_leds/blue/intensity
> +
> +red -
> +	intensity = 138
> +	max_intensity = 255
> +green -
> +	intensity = 43
> +	max_intensity = 255
> +blue -
> +	intensity = 226
> +	max_intensity = 255
> +
> +The user can control the brightness of that RGB group by writing the parent
> +'brightness' control.  Assuming a parent max_brightness of 255 the user may want
> +to dim the LED color group to half.  The user would write a value of 128 to the
> +parent brightness file then the values written to each LED will be adjusted
> +base on this value

We probably need to state here that any amendment to color intensity
values resets brightness to its max value.

> +cat /sys/class/leds/rgb:grouped_leds/max_brightness
> +255
> +echo 128 > /sys/class/leds/rgb:grouped_leds/brightness
> +
> +adjusted_red_value = 128 * (138/255) = 69
> +adjusted_green_value = 128 * (43/255) = 21
> +adjusted_blue_value = 128 * (226/255) = 113

Drop parentheses.

> +
> +Reading the parent brightness file will return the current brightness value of
> +the color LED group.
> +
> +cat /sys/class/leds/rgb:grouped_leds/max_brightness
> +255
> +
> +echo 128 > /sys/class/leds/rgb:grouped_leds/brightness
> +
> +cat /sys/class/leds/rgb:grouped_leds/max_brightness
> +128
> +
> +
> 

-- 
Best regards,
Jacek Anaszewski
