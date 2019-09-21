Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD14B9DD5
	for <lists+linux-leds@lfdr.de>; Sat, 21 Sep 2019 14:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405591AbfIUM2Z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Sep 2019 08:28:25 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33428 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405509AbfIUM2Y (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Sep 2019 08:28:24 -0400
Received: by mail-wr1-f68.google.com with SMTP id b9so9388475wrs.0;
        Sat, 21 Sep 2019 05:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qY++H/6bC+crAOcHGOjbvUQJCImSpPgL+H6ie/AS2M0=;
        b=OLartO1p61zM6BGKC/lSrAFaS8NJjJv6aqBvnUKEZb5m+RPMB57UBXms5TeCmhhNQP
         wlSWPB6DBREN+q4ziS1wS89IRmo3KuYBIs+g8tOuQALXcsIEzTNi5LydyhLW/BOjOjV/
         6iVBgJJvAt1eQIos6FVmUeW8fd1Lcb1J76XaN622N8I3w0BRUicVvhoABNa6VNqOI38w
         kZe6sTZ720PpK6fXhyhrGBs3rf5xZgue25cXxKeGro61JRQlgqc9tM1B1KeyfoGoT7fW
         Q9GGDhg3yJlU0raA6MRczXdRtaka52ZTFXAvjkO61dD/CZE5kTcS0RgsB7pM3ByDidjA
         Bapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=qY++H/6bC+crAOcHGOjbvUQJCImSpPgL+H6ie/AS2M0=;
        b=iQxFPqcoxF8SyWSC/Mcm8Ixs+/L6KxBZY5VLEPvpkHkfbtCRL7AOUPoQWFeosv+SWP
         7o/NGKxkgbd91DXXT+NeWB51bXLR5s5iqA74fHyDT1E5Z01ZactJJlA9SkRvPK93ttw/
         Tjwhe5GdbCqB0LnVT8AkF+zOkbD5u+W3GRRvIT/hXMDHKR0D3rKuiijcAuhNQ05OqVgW
         xjsXh85knWfe2qfvWP+/2IlLXtIfyu/lYEv5uNPlSlP2tw2Wz5fQ5RU/X/EZv5Tu389/
         5y4FSsOoldYjd+sQNccihTsiRWdbY2AvasyWLsvTXV/EeQirrrLoV7R9QJcNAqIFMus5
         1Oyw==
X-Gm-Message-State: APjAAAXu4kAmsI8dBEaMe37S4xpmNusyvwyixiPci99dwt90dMMpuRdh
        UjS1oMrAa/IvW4Ec3STxqurx6dBO
X-Google-Smtp-Source: APXvYqw4JmhH8n17AGVEdlP3/4vXo0XQPnBKsq2tn7jiSFVF7ZUxNn2sATqCiyaLVF9aMyvxbJpM2A==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr16290099wrj.269.1569068899136;
        Sat, 21 Sep 2019 05:28:19 -0700 (PDT)
Received: from [192.168.1.19] (blb134.neoplus.adsl.tpnet.pl. [83.28.195.134])
        by smtp.gmail.com with ESMTPSA id z6sm4088909wro.16.2019.09.21.05.28.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 05:28:18 -0700 (PDT)
Subject: Re: [PATCH v8 2/9] documention: leds: Add multicolor class
 documentation
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190920174139.30079-1-dmurphy@ti.com>
 <20190920174139.30079-3-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2f2d40d7-aa4f-a38d-19a7-425a111adb64@gmail.com>
Date:   Sat, 21 Sep 2019 14:28:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190920174139.30079-3-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 9/20/19 7:41 PM, Dan Murphy wrote:
> Add the support documentation on the multicolor LED framework.
> This document defines the directores and file generated by the

Now there will be one directory created.

Apart from that - all documentation should go in the same patch
as the feature being added. So patches 1,2 and 3 should be melded
together.

> multicolor framework.  It also documents usage.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  Documentation/leds/index.rst                 |  1 +
>  Documentation/leds/leds-class-multicolor.rst | 91 ++++++++++++++++++++
>  2 files changed, 92 insertions(+)
>  create mode 100644 Documentation/leds/leds-class-multicolor.rst
> 
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
> index 000000000000..063c9a411a1d
> --- /dev/null
> +++ b/Documentation/leds/leds-class-multicolor.rst
> @@ -0,0 +1,91 @@
> +====================================
> +Multi Color LED handling under Linux
> +====================================
> +
> +Description
> +===========
> +There are varying monochrome LED colors available for application.  These
> +LEDs can be used as a single use case LED or can be mixed with other color
> +LEDs to produce the full spectrum of color.  

I'd say it won't be the most frequent use case. We can expect rather
compound RGB, RGBA[UV] etc. LED elements being connected to iouts of
multi color LED controllers like LP50xx. TI mentions RGB LEDs in its
application notes for instance. I'd mention that in the first place
and leave what you have above as another use case.

> Color LEDs that are grouped
> +can be presented under a single LED node with individual color control.

Let's skip "with individual color control". This is rather a means for
keeping backward compatibility. Main goal of the MC class is multi color
control. We can elaborate on how individual control can be achieved,
namely one needs to set brightness to max and then can use
the whole 0-<color>_max_intensity intensity scale for given iout.
But his can be implied from the information provided below.

> +The multicolor class groups these LEDs and allows dynamically setting the value

What does "dynamically" stand for here? I assume you thought of altering
colors without changing global brightness, but now it is not the case.

> +of a single LED or setting the intensity values of the LEDs in the group and
> +updating the LEDs virtually simultaneously.

I propose below instead of the above three lines:

The multi color class groups these LEDs and allows controlling two
aspects of the final combined color: hue and lightness. The former is
controlled via <color>_intensity files and the latter is controlled
via brightness file.

For more details on hue and lightness notions please refer to
https://en.wikipedia.org/wiki/CIECAM02.

Note that intensity files only cache the written value and the actual
change of hardware state occurs upon writing brightness file. This
allows for changing many factors of the perceived color in a virtually
unnoticeable way for the human observer.

> +Multicolor Class Control
> +========================
> +The multicolor class presents the LED groups under a directory called "colors".
> +This directory is a child under the LED parent node created by the led_class
> +framework.  The led_class framework is documented in led-class.rst within this
> +documentation directory.
> +
> +Each colored LED will have two files created under the colors directory
> +<led_color>_intensity and <led_color>_max_intensity. These files will contain

s/led_color/color/

> +one of LED_COLOR_ID_* definitions from the header
> +include/dt-bindings/leds/common.h.
> +
> +Directory Layout Example
> +========================
> +root:/sys/class/leds/rgb:grouped_leds# ls -lR colors/
> +-rw-rwxr-- 1 root root 4096 Jul 7 03:10 red_max_intensity
> +--w--wx-w- 1 root root 4096 Jul 7 03:10 red_intensity
> +-rw-rwxr-- 1 root root 4096 Jul 7 03:10 green_max_intensity
> +--w--wx-w- 1 root root 4096 Jul 7 03:10 green_intensity
> +-rw-rwxr-- 1 root root 4096 Jul 7 03:10 blue_max_intensity
> +--w--wx-w- 1 root root 4096 Jul 7 03:10 blue_intensity
> +
> +Multicolor Class Brightness Control
> +===================================
> +The multiclor class framework will calculate each monochrome LEDs intensity.
> +
> +The brightness level for each LED is calculated based on the color LED
> +intensity setting divided by the color LED max intensity setting multiplied by
> +the requested value.

s/value/brightness/

> +
> +led_brightness = requested_value * led_color_intensity/led_color_max_intensity

led_brightness = brightness * <color>_intensity/<color>_max_intensity

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
> +cat /sys/class/leds/rgb:grouped_leds/max_brightness

s/max_brightness/brightness/

> +128
> 

-- 
Best regards,
Jacek Anaszewski
