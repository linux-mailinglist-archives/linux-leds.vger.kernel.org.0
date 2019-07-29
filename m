Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C55179A39
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2019 22:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729295AbfG2Uq4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Jul 2019 16:46:56 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38883 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729079AbfG2Uq4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jul 2019 16:46:56 -0400
Received: by mail-wm1-f68.google.com with SMTP id s15so33304675wmj.3;
        Mon, 29 Jul 2019 13:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KRJOdYspkea3ctcgfyL4vkSaMvPUbA3jB1qwHSVBZHI=;
        b=iqN6GVuk9n9YK8Hc3Uy7Wnz1A8Ufu6NBu+nWTNVfLVAPzKbT1HuvQITJFAPvv7siRt
         5df28Q3payr+XqJZNpa8lTMbpTraKhUXpKtKOLH+DZ7ZwaFOVFfXLVs2f15nBSEjWuwU
         rs/AcAjdmKVITMs50LvsyLv6kqgKCGYOMxLjtYDoEr4GFR5J29jSkD+zC8PKAXasWRKM
         ngLgl3CZGmhkxyiM65H6IYY0U8a3y3dgDJ+YLaH6q4qUZsMIHy8wLokMGj15Mk3BnvEJ
         CdFmS0ZNzEpI8ZRS+LCgHmB8WUp8yzQx7kvgaDgUseDmYJmqA8gAZ2jpctQJayBe2UvO
         ke+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=KRJOdYspkea3ctcgfyL4vkSaMvPUbA3jB1qwHSVBZHI=;
        b=eDLibrd6ZMHV/9YoZXTNo9n5zpjAsZysUm1Ihsiwyz5hcvrG6kUB/Lula3T70x/xSb
         qqmkf9D/Szjil9U0gReLghNwYVEfajHBFDZSdMuM89rZ9cJxQMQ6pYuQS64Y2IHeUMEw
         BnMLgBuc/L2XzcwHOO9BbgdH1VG206vgsd/tN8FtIBeiuRY+2redH01FtGHj3fvQSwng
         4YeLe/7lSP9UmKSP5tvOd/5ciOO6FVbf8IGHOStmVxhJEvQ5cbrxtfEe7Be8ZFY3Rt9l
         UKmraeYbdh5muHa+KHDYZwBhPjLkO0VnuNljbsmXefkx05KppGsKd1TUhS/HJgK2uN5v
         p6Sw==
X-Gm-Message-State: APjAAAVmIK40oIE68AfBgUkC+rdcVS6D/A4S7Eh8E5zx/J1VZGofoDXr
        kfWEr4f6S4cfO/Ct/mEaykOBezLJ
X-Google-Smtp-Source: APXvYqw7ffFcrjgMGuy3P4p+E0xgTvURlXmVvAs6uqp+u5/UEpf0lvzSYLQht63Bq/VP2RIT7bG1vw==
X-Received: by 2002:a1c:a8c9:: with SMTP id r192mr103805639wme.43.1564433212415;
        Mon, 29 Jul 2019 13:46:52 -0700 (PDT)
Received: from [192.168.1.19] (civ151.neoplus.adsl.tpnet.pl. [83.31.45.151])
        by smtp.gmail.com with ESMTPSA id s10sm47415435wrt.49.2019.07.29.13.46.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 13:46:51 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 2/9] documention: leds: Add multicolor class
 documentation
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190725182818.29556-1-dmurphy@ti.com>
 <20190725182818.29556-3-dmurphy@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <bdbe95b0-83c8-53a6-1be0-1a8f43a0810c@gmail.com>
Date:   Mon, 29 Jul 2019 22:46:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725182818.29556-3-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

Now we will need this in rst format. It doesn't involve
much tweaking to the txt, but some details like links
to other documents can be enhanced.

I've also come across an issue of lack of line break after listed quoted
strings but I don't see such occurrence here. There might be still
some other quirks emerging after translating rst to html format.

Please check Documentation/doc-guide/sphinx.rst for starter.

On 7/25/19 8:28 PM, Dan Murphy wrote:
> Add the support documentation on the multicolor LED framework.
> This document defines the directores and file generated by the

s/directores/directories/

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
> index 000000000000..3b354e523660
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

Similarly as in 1/9 please refer to the document with available LED
colors and mention that required color should be added if it is
missing.

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
> +echo "80 00 80" > color_mix
> +
> +The order of the monochrome LEDs are determined during multicolor class
> +registration and will not change unless unregistered and re-registered.
> +
> +Other example with amber monochrome LED:
> +blue - color_id = 0
> +amber - color_id = 1
> +
> +In this exampe blue is at ID 0 and amber ID is 1 so the user would write

s/exampe/example/

> +echo "<blue> <amber>" > color_mix
> +
> +echo "38 80" > color_mix
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
> +led_brightness = requested_value * led_color_intensity/led_color_max_intensity
> +
> +Example:
> +Three LEDs are present in the group as defined in "Directory Layout Example"
> +within this document.
> +
> +A user first writes the color LED brightness file with the brightness level that
> +is necessary to achieve a blueish violet output from the RGB LED group.
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

s/base/based/

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

But I'd skip the three above examples - they are trivial and this part
of the interface works identically as the current LED class interface.

> +128
> +
> +
> 

-- 
Best regards,
Jacek Anaszewski


