Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E90A1A2EC6
	for <lists+linux-leds@lfdr.de>; Thu,  9 Apr 2020 07:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgDIFZj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Apr 2020 01:25:39 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41678 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgDIFZi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Apr 2020 01:25:38 -0400
Received: by mail-lf1-f68.google.com with SMTP id z23so6932440lfh.8;
        Wed, 08 Apr 2020 22:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2EObYKcxXOo14ZEAFGp5CKeao58VtZX0sdCTJBkCdS0=;
        b=l7TFWvGigna/uLL1qcqX6tb44ooCXWtYdeTpJUHU/lYgISjJG74xCoQ9NoTFl/J9oz
         YqWptBgWww9khde7HO+hRWgCom9FrHtPIeOQtw7o83bp96n3IRhAM9kfGhcfpkIauZ3J
         jFIEtQtTkjhnLX1ZiM2OXvtJu+q82VaBUrg0r4o8TIejPev7GmSMLZB1/NIxpH+/aOVa
         gl9nEu8rWtrDKlvUOEfvioBpZt2kW6gCo0sO+g2iOTIQgy7GNaoZABTgy8RaN74kluVJ
         kkvAwsfc+Mz1BKu5oeFYRD43Qo9cPeM5QJtCeJ4F/lrbNdM4+v8eOsw1RfVLuDs7urqr
         WxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2EObYKcxXOo14ZEAFGp5CKeao58VtZX0sdCTJBkCdS0=;
        b=Ubc+DbYtw0dyBkOAb/BpXwDhp0JYQ0y3zx4WcG16xs0EvywIG5DjoiH9pyWv6NpL8h
         vXp5zNoNLk2M5Z07e8138SmaNVIRpr9W9GRSZQtHkvNFB+EzfrAk2yQU2Dj/uNKhfNCG
         zVUHjBYUADYdrgR24J87NH/T/6idQUqY6+XCywZp8bX6P3xebVSp2tfIx1E6HF1C6nxj
         FPII1yMFBZW2nE+jwcos0kxO9XX/Mj2y1Cj1RoOPeaVWX7t0y3MxdMahT3Ndpt+dNeSN
         PbFQgLgrYrarUdNCCpFw5BJroqanYWWIxc+p3JOqbQdJ3pb/COEMRThlTQuazw8MqEMi
         Vuug==
X-Gm-Message-State: AGi0Puay4pT+UabA7q4cK/W23pq1wRaW6owll4QkGIvwvmAGX2t8Y7gC
        XqTmau7HAP6N5nve1XovDDMtH/Aw
X-Google-Smtp-Source: APiQypJuRLQoxr1HZkyHjcWx26UEhVK/1CxcfEE08CwWCHMcP0PgqzSTSlgWPi4c5z7T0pSfzqYfFQ==
X-Received: by 2002:a05:6512:1046:: with SMTP id c6mr6728040lfb.115.1586409936621;
        Wed, 08 Apr 2020 22:25:36 -0700 (PDT)
Received: from Vesas-MacBook-Pro.local (87-100-247-140.bb.dnainternet.fi. [87.100.247.140])
        by smtp.googlemail.com with ESMTPSA id m18sm330883lfj.10.2020.04.08.22.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 22:25:35 -0700 (PDT)
Subject: Re: [PATCH v19 04/18] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200402204311.14998-1-dmurphy@ti.com>
 <20200402204311.14998-5-dmurphy@ti.com>
From:   =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Message-ID: <78a577ba-667e-804a-b59f-6cc442adb4eb@gmail.com>
Date:   Thu, 9 Apr 2020 08:25:34 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402204311.14998-5-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 2.4.2020 23.42, Dan Murphy wrote:
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
>   .../ABI/testing/sysfs-class-led-multicolor    |  42 ++++
>   Documentation/leds/index.rst                  |   1 +
>   Documentation/leds/leds-class-multicolor.rst  |  95 ++++++++
>   drivers/leds/Kconfig                          |  10 +
>   drivers/leds/Makefile                         |   1 +
>   drivers/leds/led-class-multicolor.c           | 206 ++++++++++++++++++
>   include/linux/led-class-multicolor.h          | 121 ++++++++++
>   7 files changed, 476 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>   create mode 100644 Documentation/leds/leds-class-multicolor.rst
>   create mode 100644 drivers/leds/led-class-multicolor.c
>   create mode 100644 include/linux/led-class-multicolor.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
> new file mode 100644
> index 000000000000..1f50324d24fd
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -0,0 +1,42 @@
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
> +		led_brightness = brightness * color_intensity/max_brightness
> +
> +		For additional details please refer to
> +		Documentation/leds/leds-class-multicolor.rst.
> +
> +		The value of the color is from 0 to
> +		/sys/class/leds/<led>/max_brightness.
> +
> +What:		/sys/class/leds/<led>/color_index
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read
> +		The color_index array, when read, will output the LED colors
> +		by name as they are indexed in the color_intensity array.
> +
> +What:		/sys/class/leds/<led>/num_colors
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read
> +		The num_colors indicates the number of LEDs defined in the
> +		color_intensity and color_index arrays.
> +
> +What:		/sys/class/leds/<led>/color_intensity
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		Intensity level for the LED color within the array.
> +		The intensities for each color must be entered based on the
> +		color_index array.

For what it is worth --

I see that this interface covers our use cases and I assume that GPIO 
LED and PWM LED drivers can be implemented for this after this set is 
integrated.

Thanks,
Vesa Jääskeläinen
