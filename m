Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D9EBE6BB
	for <lists+linux-leds@lfdr.de>; Wed, 25 Sep 2019 22:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393410AbfIYU7A (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Sep 2019 16:59:00 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42158 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391186AbfIYU6L (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Sep 2019 16:58:11 -0400
Received: by mail-wr1-f67.google.com with SMTP id n14so8477010wrw.9;
        Wed, 25 Sep 2019 13:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pL5Kc0NlGnIb389zdco7K9QqzHeNpg6hhNCiJJ7T6jI=;
        b=j8Q/C6SsGFLpc/BkrupSEqjtOlasusxAwalJGEibzc0YK/l64AgqTFyVqVmLLcuaco
         CaJgSG3d3sTKyS0OvBYKfFho2K5f16DOjbk36mSWUGjDIWGUblgXaK9xKWNZnMjMyXug
         7pExat52GwdVuLUiVQdoi3Rq8Ik79ZiZqXKLs84edAIPSNYu7HMomGWo63VN07ukym0H
         MC5xc9yuj3ghMQy1JTekKgty2vNbyLkXjoGvGAcIQXPGsG+pp6Aae0G8PO82AaoHEIyr
         A5ENDubDZwA/A5jiuVY9ivKXxOvQcckB+M1OVc1k0zTTPo0wbRavDcWH98G+dzG8F1Bv
         LtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=pL5Kc0NlGnIb389zdco7K9QqzHeNpg6hhNCiJJ7T6jI=;
        b=h+QTCx138xBxF4UlDNn7Zz0Bp4Y7DHyF5ynUMp5qcqlkE41+HGAVD0BpUsGD+GDGQD
         ZHvQklMkEwN2hKpQNRY1ruZONwzhcHZuocuRRBI7hivl1Nl3QzjbwA6rtPgkbEpq9HP6
         InExN/c0x8dcw7jYcRbz69tAIZ+N4o6YBa1opGWu9XKzCu5S55D1exW2YBHvV6LXrv92
         Hwf95t252MnFsCcR4p+3b+QWgaQgH5Lm7W/yd6g/+dbKc4GmVOo4Tge4zxJeFdoM5jJh
         i2t/nUzMp4hzveZ6fa/to4mn38umTCx2sxzbGUq1zyaNcvVmMUKpcJQbqy2m2akU+FkT
         6HVg==
X-Gm-Message-State: APjAAAVDDO0us+xDfk2wQ5rN7VJOa71tZxjTYXvw7ZCqJ51dQP94czD2
        7HFUGhogVuYXZtPoPZGvKv0=
X-Google-Smtp-Source: APXvYqze8PHe4zXJMwESKWqNqAgcTn5eCoFfVZJ6LhGtALDoEAQ+zB0qhtMDEv/rflXlWUta9I+NwQ==
X-Received: by 2002:a5d:6647:: with SMTP id f7mr228017wrw.170.1569445087371;
        Wed, 25 Sep 2019 13:58:07 -0700 (PDT)
Received: from [192.168.1.19] (bfw9.neoplus.adsl.tpnet.pl. [83.28.60.9])
        by smtp.gmail.com with ESMTPSA id q124sm409419wma.5.2019.09.25.13.58.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 13:58:06 -0700 (PDT)
Subject: Re: [PATCH v9 01/15] leds: multicolor: Add sysfs interface definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, shawnguo@kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>
References: <20190925174616.3714-1-dmurphy@ti.com>
 <20190925174616.3714-2-dmurphy@ti.com>
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
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAlgEEwEIAEICGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQkJZgNMFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAl05/9sC
 GQEACgkQvWpQHLeLfCarMQ/9FN/WqJdN2tf6xkP0RFyS4ft0sT04zkOCFfOMxs8mZ+KZoMU+
 X3a+fEppDL7xgRFpHyGaEel7lSi1eqtzsqZ5JiHbDS1Ht1G8TtATb8q8id68qeSeW2mfzaLQ
 98NPELGfUXFoUqUQkG5z2p92UrGF4Muj1vOIW93pwvE4uDpNsl+jriwHomLtjIUoZtIRjGfZ
 RCyUQI0vi5LYzXCebuzAjGD7Jh2YAp7fDGrv3qTq8sX+DUJ4H/+I8PiL+jXKkEeppqIhlBJJ
 l4WcgggMu3c2uljYDuqRYghte33BXyCPAocfO2/sN+yJRUTVuRFlOxUk4srz/W8SQDwOAwtK
 V7TzdyF1/jOGBxWwS13EjMb4u3XwPMzcPlEQNdIqz76NFmJ99xYEvgkAmFmRioxuBTRv8Fs1
 c1jQ00WWJ5vezqY6lccdDroPalXWeFzfPjIhKbV3LAYTlqv0It75GW9+0TBhPqdTM15DrCVX
 B7Ues7UnD5FBtWwewTnwr+cu8te449VDMzN2I+a9YKJ1s6uZmzh5HnuKn6tAfGyQh8MujSOM
 lZrNHrRsIsLXOjeGVa84Qk/watEcOoyQ7d+YaVosU0OCZl0GldvbGp1z2u8cd2N/HJ7dAgFh
 Q7dtGXmdXpt2WKQvTvQXhIrCWVQErNYbDZDD2V0TZtlPBaZP4fkUDkvH+Sy5Ag0EVaN9oQEQ
 AMPNymBNoCWc13U6qOztXrIKBVsLGZXq/yOaR2n7gFbFACD0TU7XuH2UcnwvNR+uQFwSrRqa
 EczX2V6iIy2CITXKg5Yvg12yn09gTmafuoIyKoU16XvC3aZQQ2Bn3LO2sRP0j/NuMD9GlO37
 pHCVRpI2DPxFE39TMm1PLbHnDG8+lZql+dpNwWw8dDaRgyXx2Le542CcTBT52VCeeWDtqd2M
 wOr4LioYlfGfAqmwcwucBdTEBUxklQaOR3VbJQx6ntI2oDOBlNGvjnVDzZe+iREd5l40l+Oj
 TaiWvBGXkv6OI+wx5TFPp+BM6ATU+6UzFRTUWbj+LqVA/JMqYHQp04Y4H5GtjbHCa8abRvBw
 IKEvpwTyWZlfXPtp8gRlNmxYn6gQlTyEZAWodXwE7CE+KxNnq7bPHeLvrSn8bLNK682PoTGr
 0Y00bguYLfyvEwuDYek1/h9YSXtHaCR3CEj4LU1B561G1j7FVaeYbX9bKBAoy/GxAW8J5O1n
 mmw7FnkSHuwO/QDe0COoO0QZ620Cf9IBWYHW4m2M2yh5981lUaiMcNM2kPgsJFYloFo2XGn6
 lWU9BrWjEoNDhHZtF+yaPEuwjZo6x/3E2Tu3E5Jj0VpVcE9U1Zq/fquDY79l2RJn5ENogOs5
 +Pi0GjVpEYQVWfm0PTCxNPOzOzGR4QB3BNFvABEBAAGJAiUEGAEIAA8FAlWjfaECGwwFCQlm
 AYAACgkQvWpQHLeLfCZqGxAAlWBWVvjU6xj70GwengiqYZwmW1i8gfS4TNibQT/KRq0zkBnE
 wgKwXRbVoW38pYVuGa5x/JDQMJDrLAJ0wrCOS3XxbSHCWOl/k2ZD9OaxUeXq6N+OmGTzfrYv
 PUvWS1Hy04q9AD1dIaMNruZQmvnRfkOk2UDncDIg0166/NTHiYI09H5mpWGpHn/2aT6dmpVw
 uoM9/rHlF5s5qAAo95tZ0QW2BtIceG9/rbYlL57waSMPF49awvwLQX5RhWoF8mPS5LsBrXXK
 hmizIsn40tLbi2RtWjzDWgZYitqmmqijeCnDvISN4qJ/nCLO4DjiSGs59w5HR+l0nwePDhOC
 A4RYZqS1e2Clx1VSkDXFpL3egabcIsqK7CZ6a21r8lXVpo4RnMlQsmXZTnRx4SajFvX7PrRg
 /02C811fLfh2r5O5if8sKQ6BKKlHpuuioqfj/w9z3B0aQ71e4n1zNJBO1kcdznikPLAbr7jG
 gkBUXT1yJiwpTfRQr5y2Uo12IJsKxohnNFVYtK8X/R6S0deKPjrZWvAkllgIPcHjMi2Va8yw
 KTj/JgcpUO5KN906Pf7ywZISe7Kbcc/qnE0YjPPSqFOvoeZvHe6EZCMW9+xZsaipvlqpByQV
 UHnVg09K9YFvjUBsBPdC8ef6YwgfR9o6AnPmxl0oMUIXkCCC5c99fzJY/k+JAq0EGAEIACAW
 IQS/HfwKVo8F95V1cJC9alAct4t8JgUCWwqKhgIbAgCBCRC9alAct4t8JnYgBBkWCAAdFiEE
 FMMcSshOZf56bfAEYhBsURv0pdsFAlsKioYACgkQYhBsURv0pdvELgD/U+y3/hsz0bIjMQJY
 0LLxM/rFY9Vz1L43+lQHXjL3MPsA/1lNm5sailsY7aFBVJxAzTa8ZAGWBdVaGo6KCvimDB8G
 7joP/jx+oGOmdRogs7mG//H+w9DTnBfPpnfkeiiokGYo/+huWO5V0Ac9tTqZeFc//t/YuYJn
 wWvS0Rx+KL0fT3eh9BQo47uF4yDiZIiWLNh4Agpup1MUSVsz4MjD0lW6ghtnLcGlIgoVHW0v
 tPW1m9jATYyJSOG/MC1iDrcYcp9uVYn5tKfkEeQNspuG6iSfS0q3tajPKnT1nJxMTxVOD2RW
 EIGfaV9Scrou92VD/eC+/8INRsiWS93j3hOKIAV5XRNINFqtzkagPYAP8r6wksjSjh01fSTB
 p5zxjfsIwWDDzDrqgzwv83CvrLXRV3OlG1DNUDYA52qJr47paH5QMWmHW5TNuoBX8qb6RW/H
 M3DzPgT+l+r1pPjMPfvL1t7civZUoPuNzoyFpQRj6TvWi2bGGMQKryeYksXG2zi2+avMFnLe
 lOxGdUZ7jn1SJ6Abba5WL3VrXCP+TUE6bZLgfw8kYa8QSXP3ysyeMI0topHFntBZ8a0KXBNs
 qqFCBWmTHXfwsfW0VgBmRtPO7eXVBybjJ1VXKR2RZxwSq/GoNXh/yrRXQxbcpZ+QP3/Tttsb
 FdKciZ4u3ts+5UwYra0BRuvb51RiZR2wRNnUeBnXWagJVTlG7RHBO/2jJOE6wrcdCMjs0Iiw
 PNWmiVoZA930TvHA5UeGENxdGqo2MvMdRJ54YaIR
Message-ID: <bf3bb1dd-4647-ea9e-784b-e5062afa73d5@gmail.com>
Date:   Wed, 25 Sep 2019 22:58:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190925174616.3714-2-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the v9.

This patch should me melded with 5/15.

On 9/25/19 7:46 PM, Dan Murphy wrote:
> Add a documentation of LED Multicolor LED class specific
> sysfs attributes.
> 
> Add multicolor framework class documentation describing the
> usage of the files created.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../ABI/testing/sysfs-class-led-multicolor    | 35 +++++++
>  Documentation/leds/index.rst                  |  1 +
>  Documentation/leds/leds-class-multicolor.rst  | 96 +++++++++++++++++++
>  3 files changed, 132 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>  create mode 100644 Documentation/leds/leds-class-multicolor.rst
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
> new file mode 100644
> index 000000000000..65cb43de26e6
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -0,0 +1,35 @@
> +What:		/sys/class/leds/<led>/brightness
> +Date:		Sept 2019
> +KernelVersion:	5.5
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		Writing to this file will update all LEDs within the group to a
> +		calculated percentage of what each color LED intensity is set
> +		to. The percentage is calculated via the equation below:
> +
> +		led_brightness = brightness * <color>_intensity/<color>_max_intensity
> +
> +		For additional details please refer to
> +		Documentation/leds/leds-class-multicolor.rst.
> +
> +		The value of the color is from 0 to
> +		/sys/class/leds/<led>/max_brightness.
> +
> +What:		/sys/class/leds/<led>/colors/<color>_intensity
> +Date:		Sept 2019
> +KernelVersion:	5.5
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		The <color>_intensity file is created based on the color
> +		defined by the registrar of the class.
> +		There is one file per color presented.
> +
> +		The value of the color is from 0 to
> +		/sys/class/leds/<led>/colors/<color>_max_intensity.
> +
> +What:		/sys/class/leds/<led>/colors/<color>_max_intensity
> +Date:		Sept 2019
> +KernelVersion:	5.5
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read only
> +		Maximum intensity level for the LED color.
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
> index 000000000000..87a1588d7619
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
> +cat /sys/class/leds/rgb:grouped_leds/brightness
> +128
> 

-- 
Best regards,
Jacek Anaszewski
