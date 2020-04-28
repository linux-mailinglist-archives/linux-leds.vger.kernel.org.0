Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92C41BCDAB
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2020 22:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgD1Usq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Apr 2020 16:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726291AbgD1Usp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 28 Apr 2020 16:48:45 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01448C03C1AC;
        Tue, 28 Apr 2020 13:48:43 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r26so278980wmh.0;
        Tue, 28 Apr 2020 13:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XwdmMo6xEUkPoCaUbqlDTDu1OAjC6g1Ogq8QsQp8oHQ=;
        b=Biy30TyhxLqt5jJWG9wvsonITA0AMdgIvZyldiX9NODmWv3Gz411f1RNl1lx46SyiP
         hcLkyt3NHOwCbdAQ49lAI3cmq3oMJxojErKN8lo4f0B50YpYNjLgv9dAdA+2QxPquYeb
         /DxwlHJ4gUt+HjvmHsni3kl0I8U6i8JxOAPdjOQ5JBCyMk69CarofDgLRLSuyeY7W4MX
         zJSkhOTqpLKliHaljmkUW+BJIl4x+UIP90mZ0bQzvh5z0PTBq8hODXDlUGWgz73+qAXe
         Lus7BuZHgzNv7R994EAWDDZYgrFL5ZCS4rXoG8gY6YeiJgPOofIDLSkl9K5EyZybfVVj
         06WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XwdmMo6xEUkPoCaUbqlDTDu1OAjC6g1Ogq8QsQp8oHQ=;
        b=cfzRUUrVfhzgxwFxatGKu5QH8m3umKhoiWvAnZ9pLt5dNMmo6Z7+t3ycc/A8sIGFpK
         6xz6s7PLqpFkH4A/hBPJ2lRBOAGmmU4lEFef86SGd/ZE7exyHujwBKGDvzP5MHyI4Jv2
         3iFqgF3OzvaZLtbPFEtGYgembyzoYp7nsX6AeTStGRl04BV+tf+IfafYc0zxHEqet/s8
         +7v/7l9XGApq1o96LkZ0Nrn1BN2TH7aZ6XjFsIAqBYZsyf/xZ+YLlQxeSLSfyk50WIyR
         3EpcfLEYmyJk1ryJn/A634cO9EBO1FOen0+E5AP48dWrF12BilooUuJpAlWiD/3eplyv
         lPdw==
X-Gm-Message-State: AGi0PuacjoqVAgwmttZJDY0VA0aXSNM/fNPURLi46i1K1JxVBGK2SNWd
        V7Mny8zG3TTha4cXFwH+Tf0gtn0hb7Q=
X-Google-Smtp-Source: APiQypLzF4e15bBi6Mqo4f2XT5Ha2mKq098qJ0WCpAhRW9mS/kjcM91RrBTpGdL/mv8dnoolL12QFw==
X-Received: by 2002:a7b:cf23:: with SMTP id m3mr6422827wmg.36.1588106922173;
        Tue, 28 Apr 2020 13:48:42 -0700 (PDT)
Received: from [192.168.1.23] (afcs235.neoplus.adsl.tpnet.pl. [95.49.70.235])
        by smtp.gmail.com with ESMTPSA id u3sm26645652wrt.93.2020.04.28.13.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 13:48:41 -0700 (PDT)
Subject: Re: [PATCH v21 02/16] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200428160338.2793-1-dmurphy@ti.com>
 <20200428160338.2793-3-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <a53e0074-26a1-2b55-896c-e5bfff8d24ba@gmail.com>
Date:   Tue, 28 Apr 2020 22:48:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428160338.2793-3-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

Thanks for the update.

On 4/28/20 6:03 PM, Dan Murphy wrote:
> Introduce a multicolor class that groups colored LEDs
> within a LED node.
> 
> The multi color class groups monochrome LEDs and allows controlling two
> aspects of the final combined color: hue and lightness. The former is
> controlled via the intensity file and the latter is controlled
> via brightness file.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   .../ABI/testing/sysfs-class-led-multicolor    |  34 +++
>   Documentation/leds/index.rst                  |   1 +
>   Documentation/leds/leds-class-multicolor.rst  |  88 ++++++++
>   MAINTAINERS                                   |   8 +
>   drivers/leds/Kconfig                          |  10 +
>   drivers/leds/Makefile                         |   1 +
>   drivers/leds/led-class-multicolor.c           | 210 ++++++++++++++++++
>   include/linux/led-class-multicolor.h          | 121 ++++++++++
>   8 files changed, 473 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>   create mode 100644 Documentation/leds/leds-class-multicolor.rst
>   create mode 100644 drivers/leds/led-class-multicolor.c
>   create mode 100644 include/linux/led-class-multicolor.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
> new file mode 100644
> index 000000000000..7d33a82a4b07
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -0,0 +1,34 @@
> +What:		/sys/class/leds/<led>/brightness
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		Writing to this file will update all LEDs within the group to a
> +		calculated percentage of what each color LED intensity is set
> +		to. The percentage is calculated for each grouped LED via the
> +		equation below:
> +
> +		led_brightness = brightness * multi_intensity/max_brightness
> +
> +		For additional details please refer to
> +		Documentation/leds/leds-class-multicolor.rst.
> +
> +		The value of the color is from 0 to
> +		/sys/class/leds/<led>/max_brightness.
> +
> +What:		/sys/class/leds/<led>/multi_index
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read
> +		The multi_index array, when read, will output the LED colors
> +		by name as they are indexed in the multi_intensity file.
> +
> +What:		/sys/class/leds/<led>/multi_intensity
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		Intensity level for the LED color within the array.
> +		The intensities for each color must be entered based on the
> +		multi_index array.
> diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
> index 060f4e485897..bc70c6aa7138 100644
> --- a/Documentation/leds/index.rst
> +++ b/Documentation/leds/index.rst
> @@ -9,6 +9,7 @@ LEDs
>   
>      leds-class
>      leds-class-flash
> +   leds-class-multicolor
>      ledtrig-oneshot
>      ledtrig-transient
>      ledtrig-usbport
> diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/leds/leds-class-multicolor.rst
> new file mode 100644
> index 000000000000..7e4907a5c87b
> --- /dev/null
> +++ b/Documentation/leds/leds-class-multicolor.rst
> @@ -0,0 +1,88 @@
> +====================================
> +MultiColor LED handling under Linux
> +====================================
> +
> +Description
> +===========
> +The multicolor class groups monochrome LEDs and allows controlling two
> +aspects of the final combined color: hue and lightness. The former is
> +controlled via the multi_intensity array file and the latter is controlled
> +via brightness file.
> +
> +Multicolor Class Control
> +========================
> +The multicolor class presents files that groups the colors as indexes in an
> +array.  These files are children under the LED parent node created by the
> +led_class framework.  The led_class framework is documented in led-class.rst
> +within this documentation directory.
> +
> +Each colored LED will be indexed under the multi_* files. The order of the
> +colors will be arbitrary. The multi_index file can be read to determine the
> +color name to indexed value.
> +
> +The multi_index file is an array that contains the string list of the colors as
> +they are defined in each multi_* array file.
> +
> +The multi_intensity is an array that can be read or written to for the
> +individual color intensities.  All elements within this array must be written in
> +order for the color LED intensities to be updated.
> +
> +The num_multi_leds file returns the total number of LEDs that are presented in
> +each multi_* array.

It is no longer present in this version.

> +
> +Directory Layout Example
> +========================
> +root:/sys/class/leds/multicolor:status# ls -lR
> +-rw-r--r--    1 root     root          4096 Oct 19 16:16 brightness
> +-r--r--r--    1 root     root          4096 Oct 19 16:16 multi_index
> +-rw-r--r--    1 root     root          4096 Oct 19 16:16 multi_intensity

What about max_brightness?

> +
> +Multicolor Class Brightness Control
> +===================================
> +The multicolor class framework will calculate each monochrome LEDs intensity.
> +
> +The brightness level for each LED is calculated based on the color LED
> +intensity setting divided by the parent max_brightness setting multiplied by

Parent is counter-intuitive in this case. I'd call it global.

> +the requested brightness.
> +
> +led_brightness = brightness * multi_intensity/max_brightness
> +
> +Example:
> +A user first writes the multi_intensity file with the brightness levels
> +for each LED that are necessary to achieve a certain color output from a
> +multicolor LED group.
> +
> +cat /sys/class/leds/multicolor:status/multi_index
> +green blue red
> +
> +echo 43 226 138 > /sys/class/leds/multicolor:status/multi_intensity
> +
> +red -
> +	intensity = 138
> +	max_brightness = 255
> +green -
> +	intensity = 43
> +	max_brightness = 255
> +blue -
> +	intensity = 226
> +	max_brightness = 255
> +
> +The user can control the brightness of that multicolor LED group by writing the
> +parent 'brightness' control.  Assuming a max_brightness of 255 the user

s/parent/global/

> +may want to dim the LED color group to half.  The user would write a value of
> +128 to the parent brightness file then the values written to each LED will be

Ditto.

> +adjusted base on this value.
> +
> +cat /sys/class/leds/multicolor:status/max_brightness
> +255
> +echo 128 > /sys/class/leds/multicolor:status/brightness
> +
> +adjusted_red_value = 128 * 138/255 = 69
> +adjusted_green_value = 128 * 43/255 = 21
> +adjusted_blue_value = 128 * 226/255 = 113
> +
> +Reading the parent brightness file will return the current brightness value of

Ditto.

-- 
Best regards,
Jacek Anaszewski
