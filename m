Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3860619D965
	for <lists+linux-leds@lfdr.de>; Fri,  3 Apr 2020 16:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390850AbgDCOps (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Apr 2020 10:45:48 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55506 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727431AbgDCOps (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Apr 2020 10:45:48 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 033EjUnH055408;
        Fri, 3 Apr 2020 09:45:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585925130;
        bh=5JzwGKiNgxFsBEx5w7r022jEgeKdfrd5oj7vJSYhqOo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=cnGV/kbfLa2EW7hIA2sU4qL2lUWVk7yjg3D6kFB66EZqvwXmyS3F8xIWjVyQtlfam
         ZXRoiWx2SjLdnxBiEL4JwosLx4tGqVajmWOXmQ/xgL50Odetpf4R0hKZHTWpErucFV
         LeXsC6xFCsRwtFGHN30d+Hm8bCi5ph6T1nKrXfJc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 033EjUFV059934
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 3 Apr 2020 09:45:30 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 3 Apr
 2020 09:45:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 3 Apr 2020 09:45:29 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 033EjTvC008631;
        Fri, 3 Apr 2020 09:45:29 -0500
Subject: Re: [PATCH v19 04/18] leds: multicolor: Introduce a multicolor class
 definition
To:     Randy Dunlap <rdunlap@infradead.org>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200402204311.14998-1-dmurphy@ti.com>
 <20200402204311.14998-5-dmurphy@ti.com>
 <619a1251-d062-b9bf-6752-b867fcaa600b@infradead.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <34b07ce8-6a38-f45c-4624-730f5597f686@ti.com>
Date:   Fri, 3 Apr 2020 09:39:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <619a1251-d062-b9bf-6752-b867fcaa600b@infradead.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Randy

Thanks for the review

On 4/2/20 10:47 PM, Randy Dunlap wrote:
> Hi,
> Here are a few changes for you to consider:
>
> On 4/2/20 1:42 PM, Dan Murphy wrote:
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>>
>> The multi color class groups monochrome LEDs and allows controlling two
>        multicolor
Ack
>
>> aspects of the final combined color: hue and lightness. The former is
>> controlled via <color>_intensity files and the latter is controlled
>> via brightness file.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>
>> diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/leds/leds-class-multicolor.rst
>> new file mode 100644
>> index 000000000000..5bb004999248
>> --- /dev/null
>> +++ b/Documentation/leds/leds-class-multicolor.rst
>> @@ -0,0 +1,95 @@
>> +====================================
>> +Multi Color LED handling under Linux
>     Multicolor
Ack
>
>> +====================================
>> +
>> +Description
>> +===========
>> +The multi color class groups monochrome LEDs and allows controlling two
>         multicolor
Ack
>
>> +aspects of the final combined color: hue and lightness. The former is
>> +controlled via the color_intensity array file and the latter is controlled
>> +via brightness file.
>> +
>> +For more details on hue and lightness notions please refer to
>> +https://en.wikipedia.org/wiki/CIECAM02.
>> +
>> +Multicolor Class Control
>> +========================
>> +The multicolor class presents files that groups the colors as indexes in an
>> +array.  These files are children under the LED parent node created by the
>> +led_class framework.  The led_class framework is documented in led-class.rst
>> +within this documentation directory.
>> +
>> +Each colored LED will be indexed under the color_* files. The order of the
>> +colors are arbitrary the color_index file can be read to determine the color
>> +to index value.
>> +
>> +The color_index file is an array that contains the string list of the colors as
>> +they are defined in each color_* array file.
>> +
>> +The color_intensity is an array that can be read or written to for the
>> +individual color intensities.  All elements within this array must be written in
>> +order for the color LED intensities to be updated.
>> +
>> +The color_max_intensity is an array that can be read to indicate each color LED
>> +maximum intensity value.
>> +
>> +The num_color_leds file returns the total number of color LEDs that are
>> +presented in each color_* array.
>> +
>> +Directory Layout Example
>> +========================
>> +root:/sys/class/leds/multicolor:status# ls -lR
>> +-rw-r--r--    1 root     root          4096 Oct 19 16:16 brightness
>> +-r--r--r--    1 root     root          4096 Oct 19 16:16 color_index
>> +-rw-r--r--    1 root     root          4096 Oct 19 16:16 color_intensity
>> +-r--r--r--    1 root     root          4096 Oct 19 16:16 num_color_leds
>> +
>> +Multicolor Class Brightness Control
>> +===================================
>> +The multiclor class framework will calculate each monochrome LEDs intensity.
>         multicolor
Ack
>
>> +
>> +The brightness level for each LED is calculated based on the color LED
>> +intensity setting divided by the parent max_brightness setting multiplied by
>> +the requested brightness.
>> +
>> +led_brightness = brightness * color_intensity/max_brightness
>> +
>> +Example:
>> +A user first writes the color_intensity file with the brightness levels
>> +that for each LED that is necessary to achieve a blueish violet output from a
> drop first "that".
Ack
>                       that are necessary                                   from an
Ack and NACK the "from an".  It is from a since R is a consonant
>> +RGB LED group.
>> +
>> +cat /sys/class/leds/multicolor:status/color_index
>> +green blue red
>> +
>> +echo 43 226 138 > /sys/class/leds/multicolor:status/color_intensity
>> +
>> +red -
>> +	intensity = 138
>> +	max_brightness = 255
>> +green -
>> +	intensity = 43
>> +	max_brightness = 255
>> +blue -
>> +	intensity = 226
>> +	max_brightness = 255
>> +
>> +The user can control the brightness of that RGB group by writing the parent
>> +'brightness' control.  Assuming a parent max_brightness of 255 the user may want
>> +to dim the LED color group to half.  The user would write a value of 128 to the
>> +parent brightness file then the values written to each LED will be adjusted
>> +base on this value
>                  value.
Ack
>
>> +
>> +cat /sys/class/leds/multicolor:status/max_brightness
>> +255
>> +echo 128 > /sys/class/leds/multicolor:status/brightness
>> +
>> +adjusted_red_value = 128 * 138/255 = 69
>> +adjusted_green_value = 128 * 43/255 = 21
>> +adjusted_blue_value = 128 * 226/255 = 113
>> +
>> +Reading the parent brightness file will return the current brightness value of
>> +the color LED group.
>> +
>> +cat /sys/class/leds/multicolor:status/brightness
>> +128
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index d82f1dea3711..2e4611b25054 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -30,6 +30,16 @@ config LEDS_CLASS_FLASH
>>   	  for the flash related features of a LED device. It can be built
>>   	  as a module.
>>   
>> +config LEDS_CLASS_MULTI_COLOR
>> +	tristate "LED Multi Color LED Class Support"
> 	              Multicolor

Ack

Dan


