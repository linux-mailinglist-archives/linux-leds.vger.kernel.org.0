Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A376819CEEC
	for <lists+linux-leds@lfdr.de>; Fri,  3 Apr 2020 05:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390351AbgDCDrX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 Apr 2020 23:47:23 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37722 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389477AbgDCDrX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 Apr 2020 23:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=MC7QyMtyes4jEFiP5SdvGBopLA7Z/TrE3NACV0pccFQ=; b=OMtrqVldmU/GcLt/XFI4ez9e60
        DLlFtQwLpSLQAy/yZR8NvxC2pdWNRrAMZywTGuAEQrLpWOCzAuZ//TbCkbpTfprEZ+wW11HhCvvs0
        d3d4FhoX9BrRSWBJ2SZEvCeGD6FmUqMdhzfT5o1ArxzAGgYFUiF39QkH87KtX5q0oJgrZ5lGacTC+
        S1ISMF/8kX29XVAhpb6bWfYLCIBJn7KdM4lCL6ZrOIxUfbPSb+vjK+TPBW45xFIaZ4lz3DJ5lp+0I
        X+B/UheiwbLZ313uSH64dHVvMax4m8g4invRLP2Nij56/x40e7Gw8qm/PD6T/ldIXqcNav+98bBZJ
        6HGgzN9g==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jKDIf-0002wr-BP; Fri, 03 Apr 2020 03:47:21 +0000
Subject: Re: [PATCH v19 04/18] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200402204311.14998-1-dmurphy@ti.com>
 <20200402204311.14998-5-dmurphy@ti.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <619a1251-d062-b9bf-6752-b867fcaa600b@infradead.org>
Date:   Thu, 2 Apr 2020 20:47:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402204311.14998-5-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,
Here are a few changes for you to consider:

On 4/2/20 1:42 PM, Dan Murphy wrote:
> Introduce a multicolor class that groups colored LEDs
> within a LED node.
> 
> The multi color class groups monochrome LEDs and allows controlling two

      multicolor

> aspects of the final combined color: hue and lightness. The former is
> controlled via <color>_intensity files and the latter is controlled
> via brightness file.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---


> diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/leds/leds-class-multicolor.rst
> new file mode 100644
> index 000000000000..5bb004999248
> --- /dev/null
> +++ b/Documentation/leds/leds-class-multicolor.rst
> @@ -0,0 +1,95 @@
> +====================================
> +Multi Color LED handling under Linux

   Multicolor

> +====================================
> +
> +Description
> +===========
> +The multi color class groups monochrome LEDs and allows controlling two

       multicolor

> +aspects of the final combined color: hue and lightness. The former is
> +controlled via the color_intensity array file and the latter is controlled
> +via brightness file.
> +
> +For more details on hue and lightness notions please refer to
> +https://en.wikipedia.org/wiki/CIECAM02.
> +
> +Multicolor Class Control
> +========================
> +The multicolor class presents files that groups the colors as indexes in an
> +array.  These files are children under the LED parent node created by the
> +led_class framework.  The led_class framework is documented in led-class.rst
> +within this documentation directory.
> +
> +Each colored LED will be indexed under the color_* files. The order of the
> +colors are arbitrary the color_index file can be read to determine the color
> +to index value.
> +
> +The color_index file is an array that contains the string list of the colors as
> +they are defined in each color_* array file.
> +
> +The color_intensity is an array that can be read or written to for the
> +individual color intensities.  All elements within this array must be written in
> +order for the color LED intensities to be updated.
> +
> +The color_max_intensity is an array that can be read to indicate each color LED
> +maximum intensity value.
> +
> +The num_color_leds file returns the total number of color LEDs that are
> +presented in each color_* array.
> +
> +Directory Layout Example
> +========================
> +root:/sys/class/leds/multicolor:status# ls -lR
> +-rw-r--r--    1 root     root          4096 Oct 19 16:16 brightness
> +-r--r--r--    1 root     root          4096 Oct 19 16:16 color_index
> +-rw-r--r--    1 root     root          4096 Oct 19 16:16 color_intensity
> +-r--r--r--    1 root     root          4096 Oct 19 16:16 num_color_leds
> +
> +Multicolor Class Brightness Control
> +===================================
> +The multiclor class framework will calculate each monochrome LEDs intensity.

       multicolor

> +
> +The brightness level for each LED is calculated based on the color LED
> +intensity setting divided by the parent max_brightness setting multiplied by
> +the requested brightness.
> +
> +led_brightness = brightness * color_intensity/max_brightness
> +
> +Example:
> +A user first writes the color_intensity file with the brightness levels
> +that for each LED that is necessary to achieve a blueish violet output from a

drop first "that".
                     that are necessary                                   from an

> +RGB LED group.
> +
> +cat /sys/class/leds/multicolor:status/color_index
> +green blue red
> +
> +echo 43 226 138 > /sys/class/leds/multicolor:status/color_intensity
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
> +The user can control the brightness of that RGB group by writing the parent
> +'brightness' control.  Assuming a parent max_brightness of 255 the user may want
> +to dim the LED color group to half.  The user would write a value of 128 to the
> +parent brightness file then the values written to each LED will be adjusted
> +base on this value

                value.

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
> +the color LED group.
> +
> +cat /sys/class/leds/multicolor:status/brightness
> +128
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index d82f1dea3711..2e4611b25054 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -30,6 +30,16 @@ config LEDS_CLASS_FLASH
>  	  for the flash related features of a LED device. It can be built
>  	  as a module.
>  
> +config LEDS_CLASS_MULTI_COLOR
> +	tristate "LED Multi Color LED Class Support"

	              Multicolor

> +	depends on LEDS_CLASS
> +	help
> +	  This option enables the multicolor LED sysfs class in /sys/class/leds.
> +	  It wraps LED class and adds multicolor LED specific sysfs attributes
> +	  and kernel internal API to it. You'll need this to provide support
> +	  for multicolor LEDs that are grouped together. This class is not
> +	  intended for single color LEDs. It can be built as a module.
> +
>  config LEDS_BRIGHTNESS_HW_CHANGED
>  	bool "LED Class brightness_hw_changed attribute support"
>  	depends on LEDS_CLASS


thanks.
-- 
~Randy

