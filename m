Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03277CE0CF
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2019 13:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbfJGLtX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Oct 2019 07:49:23 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40926 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727514AbfJGLtX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Oct 2019 07:49:23 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97BnGP1014702;
        Mon, 7 Oct 2019 06:49:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570448956;
        bh=NvbPrOaJMuM3jS9S5I2o0RPYZiGNQegARG9spbNLan8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=sbQ2wz7QKcRudbCl6BKM2rHW/cmFNfGXFzSWxPCA4jmyJaaLhYwztzNeKAzPArsJo
         Lx/DDh5jPoLLHmXBgJzEgHPO4VtfnWEBY04Umy78vSsQl5PWwesUy9sPPjXzFKuAWM
         mAn4XaoUWBqC6blXD9tggeQxBI7fOaGK1aZhFtCI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97BnGl2038592
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 06:49:16 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 06:49:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 06:49:14 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97BnGX4012117;
        Mon, 7 Oct 2019 06:49:16 -0500
Subject: Re: [PATCH v10 04/16] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191001145620.11123-1-dmurphy@ti.com>
 <20191001145620.11123-5-dmurphy@ti.com>
 <8c00d678-48e0-bb2b-a18f-39247eff7fe2@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <87782950-d6aa-bda9-5894-a737ccdbcef9@ti.com>
Date:   Mon, 7 Oct 2019 06:51:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8c00d678-48e0-bb2b-a18f-39247eff7fe2@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

Thanks for the review

On 10/6/19 10:23 AM, Jacek Anaszewski wrote:
> Dan,
>
> Thank you for the update.
>
> On 10/1/19 4:56 PM, Dan Murphy wrote:
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>>
>> The multi color class groups monochrome LEDs and allows controlling two
>> aspects of the final combined color: hue and lightness. The former is
>> controlled via <color>_intensity files and the latter is controlled
>> via brightness file.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../ABI/testing/sysfs-class-led-multicolor    |  35 +++
>>   Documentation/leds/index.rst                  |   1 +
>>   Documentation/leds/leds-class-multicolor.rst  |  96 +++++++
>>   drivers/leds/Kconfig                          |  10 +
>>   drivers/leds/Makefile                         |   1 +
>>   drivers/leds/led-class-multicolor.c           | 268 ++++++++++++++++++
>>   include/linux/led-class-multicolor.h          |  88 ++++++
>>   7 files changed, 499 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>>   create mode 100644 Documentation/leds/leds-class-multicolor.rst
>>   create mode 100644 drivers/leds/led-class-multicolor.c
>>   create mode 100644 include/linux/led-class-multicolor.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> new file mode 100644
>> index 000000000000..65cb43de26e6
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> @@ -0,0 +1,35 @@
>> +What:		/sys/class/leds/<led>/brightness
>> +Date:		Sept 2019
>> +KernelVersion:	5.5
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read/write
>> +		Writing to this file will update all LEDs within the group to a
>> +		calculated percentage of what each color LED intensity is set
>> +		to. The percentage is calculated via the equation below:
>> +
>> +		led_brightness = brightness * <color>_intensity/<color>_max_intensity
>> +
>> +		For additional details please refer to
>> +		Documentation/leds/leds-class-multicolor.rst.
>> +
>> +		The value of the color is from 0 to
>> +		/sys/class/leds/<led>/max_brightness.
>> +
>> +What:		/sys/class/leds/<led>/colors/<color>_intensity
>> +Date:		Sept 2019
>> +KernelVersion:	5.5
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read/write
>> +		The <color>_intensity file is created based on the color
>> +		defined by the registrar of the class.
>> +		There is one file per color presented.
>> +
>> +		The value of the color is from 0 to
>> +		/sys/class/leds/<led>/colors/<color>_max_intensity.
>> +
>> +What:		/sys/class/leds/<led>/colors/<color>_max_intensity
>> +Date:		Sept 2019
>> +KernelVersion:	5.5
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read only
>> +		Maximum intensity level for the LED color.
>> diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
>> index 060f4e485897..bc70c6aa7138 100644
>> --- a/Documentation/leds/index.rst
>> +++ b/Documentation/leds/index.rst
>> @@ -9,6 +9,7 @@ LEDs
>>   
>>      leds-class
>>      leds-class-flash
>> +   leds-class-multicolor
>>      ledtrig-oneshot
>>      ledtrig-transient
>>      ledtrig-usbport
>> diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/leds/leds-class-multicolor.rst
>> new file mode 100644
>> index 000000000000..87a1588d7619
>> --- /dev/null
>> +++ b/Documentation/leds/leds-class-multicolor.rst
>> @@ -0,0 +1,96 @@
>> +====================================
>> +Multi Color LED handling under Linux
>> +====================================
>> +
>> +Description
>> +===========
>> +The multi color class groups monochrome LEDs and allows controlling two
>> +aspects of the final combined color: hue and lightness. The former is
>> +controlled via <color>_intensity files and the latter is controlled
>> +via brightness file.
>> +
>> +For more details on hue and lightness notions please refer to
>> +https://en.wikipedia.org/wiki/CIECAM02.
>> +
>> +Note that intensity files only cache the written value and the actual
>> +change of hardware state occurs upon writing brightness file. This
>> +allows for changing many factors of the perceived color in a virtually
>> +unnoticeable way for the human observer.
>> +
>> +Multicolor Class Control
>> +========================
>> +The multicolor class presents the LED groups under a directory called "colors".
>> +This directory is a child under the LED parent node created by the led_class
>> +framework.  The led_class framework is documented in led-class.rst within this
>> +documentation directory.
>> +
>> +Each colored LED will have two files created under the colors directory
>> +<color>_intensity and <color>_max_intensity. These files will contain
>> +one of LED_COLOR_ID_* definitions from the header
>> +include/dt-bindings/leds/common.h.
>> +
>> +Directory Layout Example
>> +========================
>> +root:/sys/class/leds/rgb:grouped_leds# ls -lR colors/
>> +-rw-rwxr-- 1 root root 4096 Jul 7 03:10 red_max_intensity
>> +--w--wx-w- 1 root root 4096 Jul 7 03:10 red_intensity
>> +-rw-rwxr-- 1 root root 4096 Jul 7 03:10 green_max_intensity
>> +--w--wx-w- 1 root root 4096 Jul 7 03:10 green_intensity
>> +-rw-rwxr-- 1 root root 4096 Jul 7 03:10 blue_max_intensity
>> +--w--wx-w- 1 root root 4096 Jul 7 03:10 blue_intensity
> Now when you have fixed file permissions in LED mc core the
> 'ls -l' should report them correctly, so this needs to be
> updated.

ACK


> [...]
>> +int devm_led_classdev_multicolor_register(struct device *parent,
>> +					  struct led_classdev_mc *mcled_cdev)
>> +{
>> +	struct led_classdev_mc **dr;
>> +	int ret;
>> +
>> +	dr = devres_alloc(devm_led_classdev_multicolor_release,
>> +			  sizeof(*dr), GFP_KERNEL);
>> +	if (!dr)
>> +		return -ENOMEM;
>> +
>> +	ret = led_classdev_multicolor_register(parent, mcled_cdev);
>> +	if (ret) {
>> +		devres_free(dr);
>> +		return ret;
>> +	}
>> +
>> +	*dr = mcled_cdev;
>> +	devres_add(parent, dr);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_register);
>> +
>> +static int devm_led_classdev_multicolor_match(struct device *dev,
>> +					      void *res, void *data)
>> +{
>> +	struct mcled_cdev **p = res;
> s/mcled_cdev/led_classdev_mc/

ACK.  Fixed in v11

Dan


>> +
>> +	if (WARN_ON(!p || !*p))
>> +		return 0;
>> +
>> +	return *p == data;
>> +}
>> +
> [...]
