Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45D5479A2D
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2019 22:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729401AbfG2Upi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Jul 2019 16:45:38 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39792 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729251AbfG2Upi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jul 2019 16:45:38 -0400
Received: by mail-wr1-f68.google.com with SMTP id x4so10137233wrt.6;
        Mon, 29 Jul 2019 13:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fHrVmBmXM9ent2oAgdN9aOhrqmaMG/FwznnZQjH8PRw=;
        b=gngnD7GZNzDoH/t6BeAgnzyKTnSoxV/e1y+RXGmc2B0tTwpVTbZOGrn0vXLRlNX2fj
         WqwhdVGpgaC+eUbf+jVWTjVLUVXYIZUlwhW64df02at6TH8kTMhFO1+AIot10irODlnl
         pb+mgUFCXpLX7Tl2CdIn7bRx5cPf4wjhpqCnom4CHjF4SGVTAxFTJ/p/cJ40YReMqM94
         r5EgAcOD1/dH/HF6wk3JzNvy6kbMApOMB1EQFpqrRFN2XU6i1gSyD9cRN4L9DI5ll99f
         ISL9F4G06pPFod9eWWVLWtDlllWqaRsXMMtsVaLpSUnqevZ6Wy1cTG1cNHde25cY1CO4
         Tzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fHrVmBmXM9ent2oAgdN9aOhrqmaMG/FwznnZQjH8PRw=;
        b=H1I3uMprpKwKrY+s6RfBC3SnHjrw2ZlwDbreA3o1saNEbLviQZXXKYDkk/G9BV3utO
         IscIIilM9nw3xVLKorN/cxNn8rCE5cFM6Qfo/Ks9bnJ+vvp8fL7p5KtAM9CZTjs3b6Gf
         UdbqolAnhRrh1DYTcsYqKn7RYWb+0Z8qXNdcWcW58WYC359nM9Dr+sior4SZ7sVQLp5+
         C6qCrQ+4Sr4DtTdOhF3et9UBFR2UJlx1Kt3lon4GH53g95Wp1kjxZx/sgVxgE2Q0jpAT
         OCtS9Q1ChA06sPORGoAIJ0Cfzdiivb2l9khVbZ+fsLaDWMZgqf72ZJPT36t2adM8IuBA
         Dd1w==
X-Gm-Message-State: APjAAAW6IMvYZBntSbFGLzGHzTIZ86FMROTNSlFk/FRlcMfDIr+ZLDam
        RNQtR6ecWaky0O+jLNbBl3ICBD+r
X-Google-Smtp-Source: APXvYqxnNYMAFwfWFhB8/RM02M0oKd4KHOOF49OJHurO/S1lorg+MbLoB1PJF6E+7ofg5RT/rysojQ==
X-Received: by 2002:adf:dd8e:: with SMTP id x14mr120235553wrl.344.1564433134065;
        Mon, 29 Jul 2019 13:45:34 -0700 (PDT)
Received: from [192.168.1.19] (civ151.neoplus.adsl.tpnet.pl. [83.31.45.151])
        by smtp.gmail.com with ESMTPSA id p14sm50315077wrx.17.2019.07.29.13.45.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 13:45:33 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 1/9] leds: multicolor: Add sysfs interface definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190725182818.29556-1-dmurphy@ti.com>
 <20190725182818.29556-2-dmurphy@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c451847b-d08e-19a2-281c-70ba46cff29a@gmail.com>
Date:   Mon, 29 Jul 2019 22:45:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725182818.29556-2-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the v4.

I have a bunch of comments below. Please take a look.

On 7/25/19 8:28 PM, Dan Murphy wrote:
> Add a documentation of LED Multicolor LED class specific
> sysfs attributes.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../ABI/testing/sysfs-class-led-multicolor    | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
> new file mode 100644
> index 000000000000..59839f0eae76
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -0,0 +1,67 @@
> +What:		/sys/class/leds/<led>/brightness
> +Date:		Sept 2019
> +KernelVersion:	TBD
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		The multicolor class will redirect the device drivers call back
> +		function for brightness control to the multicolor class
> +		brightness control function.
> +
> +		Writing to this file will update all LEDs within the group to a
> +		calculated percentage of what each color LED in the group is set
> +		to.  Please refer to the leds-class-multicolor.txt in the
> +		Documentation directory for a complete description.

Instead of redirecting the reader to led-class-multicolor.txt I'd prefer
to have at least the formula to calculate the colors laid out here.
Aside of that - it is more helpful to have a full path to the referenced
file.

> +
> +		The value of the color is from 0 to
> +		/sys/class/leds/<led>/max_brightness.
> +
> +What:		/sys/class/leds/<led>/colors/color_mix
> +Date:		Sept 2019
> +KernelVersion:	TBD
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		The color_mix file allows writing all registered multicolor LEDs
> +		virtually at the same time.  The value(s) written to this file

I'd drop parentheses form "value(s)". Multi color LED class device is
supposed to always have more then one LED. And if I understand it
correctly we have to pass intensities of all colors supported by LED
multicolor class device here, even we're changing single one.

> +		contain the intensity values for each multicolor LED within
> +		the colors directory.  The color indexes are reported in the
> +		color_id file as defined in this document.

This is a bit misleading. It sounds as if single color_id file would be
reporting more than one index.

> +		Please refer to the leds-class-multicolor.txt in the
> +		Documentation directory for a complete description.

Here, similarly as for brightness, I would prefer to have complete
documentation of this file.

How about:

The values written to this file should contain the intensity values of
each multicolor LED within the colors directory. The index of given
color is reported by the color_id file present in colors/<color>
directory. The index determines the position in the sequence of
intensities on which the related intensity should be passed to this
file.

And here we could have the examples from leds-class-multicolor.txt.

> +
> +What:		/sys/class/leds/<led>/colors/<led_color>/color_id
> +Date:		Sept 2019
> +KernelVersion:	TBD
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read only
> +		This file when read will return the index of the color in the
> +		color_mix.
> +		Please refer to the leds-class-multicolor.txt in the
> +		Documentation directory for a complete description.
> +
> +What:		/sys/class/leds/<led>/colors/<led_color>/intensity
> +Date:		Sept 2019
> +KernelVersion:	TBD
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		The led_color directory is dynamically created based on the
> +		colors defined by the registrar of the class.
> +		The led_color can be but not limited to red, green, blue,
> +		white, amber, yellow and violet.  Drivers can also declare a

Instead of this vague sentence about the available colors I propose to
maintain the list of supported colors in leds-class.rst or in a separate
file and keep it in sync with the led_colors array. Then we could refer
to that file here.

> +		LED color for presentation.  There is one directory per color

I'd not let drivers define their custom colors. It would entail issues
related to lack of generic LED_COLOR_ID and DT parsing failure.

> +		presented.  The brightness file is created under each
> +		led_color directory and controls the individual LED color
> +		setting.
> +
> +		The value of the color is from 0 to
> +		/sys/class/leds/<led>/colors/<led_color>/max_intensity.
> +
> +What:		/sys/class/leds/<led>/colors/<led_color>/max_intensity
> +Date:		Sept 2019
> +KernelVersion:	TBD
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read only
> +		Maximum intensity level for the LED color, default is
> +		255 (LED_FULL).
> +
> +		If the LED does not support different intensity levels, this
> +		should be 1.
> 

-- 
Best regards,
Jacek Anaszewski




