Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5D3E794E
	for <lists+linux-leds@lfdr.de>; Mon, 28 Oct 2019 20:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731302AbfJ1Thk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Oct 2019 15:37:40 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46314 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731026AbfJ1Thk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 28 Oct 2019 15:37:40 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9SJbZVZ038320;
        Mon, 28 Oct 2019 14:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572291455;
        bh=cbtTrRaSsCfpjI7gQwPoHhlE0M1uLY2FHqk1RGO2A4E=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=QvcWnIHqS9uIJ0fUroBIsza9B8AqUA2nOGavgxAwsNzplWHfRby5iEtkTRNO3cy1N
         /8hI8QcGdRvSc2FIAaeL3r9c5RXVaNOteq/BKL9QsSo/WIoxV3wufUfeRlR6MojLfM
         nrpxaFYp9ZqWAu6j8Htj0rSMlnxuLQaJsbAilYlE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9SJbZmx035081
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 28 Oct 2019 14:37:35 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 28
 Oct 2019 14:37:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 28 Oct 2019 14:37:23 -0500
Received: from [10.250.35.43] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SJbY2l097943;
        Mon, 28 Oct 2019 14:37:34 -0500
Subject: Re: [PATCH v15 04/19] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191028183629.11779-1-dmurphy@ti.com>
 <20191028183629.11779-5-dmurphy@ti.com>
 <6dbd4e43-4832-4f8e-4eb9-8b7c878c270e@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <5e4ff68d-bb53-d3cd-f1b7-68c418342657@ti.com>
Date:   Mon, 28 Oct 2019 14:36:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6dbd4e43-4832-4f8e-4eb9-8b7c878c270e@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/28/19 2:22 PM, Jacek Anaszewski wrote:
> Dan,
>
> Thank you for the v15.
>
> On 10/28/19 7:36 PM, Dan Murphy wrote:
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
>>   .../ABI/testing/sysfs-class-led-multicolor    |  36 +++
>>   Documentation/leds/index.rst                  |   1 +
>>   Documentation/leds/leds-class-multicolor.rst  | 100 +++++++
>>   drivers/leds/Kconfig                          |  10 +
>>   drivers/leds/Makefile                         |   1 +
>>   drivers/leds/led-class-multicolor.c           | 271 ++++++++++++++++++
>>   include/linux/led-class-multicolor.h          | 139 +++++++++
>>   7 files changed, 558 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>>   create mode 100644 Documentation/leds/leds-class-multicolor.rst
>>   create mode 100644 drivers/leds/led-class-multicolor.c
>>   create mode 100644 include/linux/led-class-multicolor.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> new file mode 100644
>> index 000000000000..3d1f9d726c70
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> @@ -0,0 +1,36 @@
>> +What:		/sys/class/leds/<led>/brightness
>> +Date:		Sept 2019
>> +KernelVersion:	5.5
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read/write
>> +		Writing to this file will update all LEDs within the group to a
>> +		calculated percentage of what each color LED intensity is set
>> +		to. The percentage is calculated for each grouped LED via the
>> +		equation below:
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
>> index 000000000000..c8a224cead51
>> --- /dev/null
>> +++ b/Documentation/leds/leds-class-multicolor.rst
>> @@ -0,0 +1,100 @@
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
> s/rgb/multicolor/ according to the led_colors[LED_COLOR_ID_MULTI].

Ack but this probably would not be multicolor either based on LED node 
naming conventions.


>> +-rw-r--r--    1 root     root          4096 Jul  7 03:10 blue_intensity
>> +-r--r--r--    1 root     root          4096 Jul  7 03:10 blue_max_intensity
>> +-rw-r--r--    1 root     root          4096 Jul  7 03:10 green_intensity
>> +-r--r--r--    1 root     root          4096 Jul  7 03:10 green_max_intensity
>> +-rw-r--r--    1 root     root          4096 Jul  7 03:10 red_intensity
>> +-r--r--r--    1 root     root          4096 Jul  7 03:10 red_max_intensity
>> +
> [...]
>> +static int led_multicolor_init_color(struct led_classdev_mc *mcled_cdev,
>> +				     int color_id)
>> +{
>> +	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
>> +	struct led_mc_color_entry *mc_priv;
>> +	char *intensity_file_name;
>> +	char *max_intensity_file_name;
>> +	size_t len;
>> +	int ret;
>> +
>> +	mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv), GFP_KERNEL);
>> +	if (!mc_priv)
>> +		return -ENOMEM;
>> +
>> +	mc_priv->led_color_id = color_id;
>> +	mc_priv->mcled_cdev = mcled_cdev;
>> +
>> +	sysfs_attr_init(&mc_priv->intensity_attr.attr);
>> +	len = strlen(led_colors[color_id]) + strlen(INTENSITY_NAME) + 1;
>> +	intensity_file_name = kzalloc(len, GFP_KERNEL);
>> +	if (!intensity_file_name)
>> +		return -ENOMEM;
>> +
>> +	snprintf(intensity_file_name, len, "%s%s",
>> +		 led_colors[color_id], INTENSITY_NAME);
>> +	mc_priv->intensity_attr.attr.name = intensity_file_name;
>> +	mc_priv->intensity_attr.attr.mode = 0644;
>> +	mc_priv->intensity_attr.store = intensity_store;
>> +	mc_priv->intensity_attr.show = intensity_show;
>> +	ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
>> +				      &mc_priv->intensity_attr.attr,
>> +				      led_color_group.name);
>> +	if (ret)
>> +		goto intensity_err_out;
>> +
>> +	sysfs_attr_init(&mc_priv->max_intensity_attr.attr);
>> +	len = strlen(led_colors[color_id]) + strlen(MAX_INTENSITY_NAME) + 1;
>> +	max_intensity_file_name = kzalloc(len, GFP_KERNEL);
>> +	if (!max_intensity_file_name) {
>> +		ret = -ENOMEM;
>> +		goto intensity_err_out;
>> +	}
>> +
>> +	snprintf(max_intensity_file_name, len, "%s%s",
>> +		 led_colors[color_id], MAX_INTENSITY_NAME);
>> +	mc_priv->max_intensity_attr.attr.name = max_intensity_file_name;
>> +	mc_priv->max_intensity_attr.attr.mode = 0444;
>> +	mc_priv->max_intensity_attr.show = max_intensity_show;
>> +	ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
>> +				      &mc_priv->max_intensity_attr.attr,
>> +				      led_color_group.name);
>> +	if (ret)
>> +		goto max_intensity_err_out;
>> +
>> +	mc_priv->max_intensity = LED_FULL;
>> +	list_add_tail(&mc_priv->list, &mcled_cdev->color_list);
> I still would prefer dynamically allocated array here. Also there are
> things I would see differently in the patch 13/19 as already discussed.
>
> Nonetheless I am giving my preliminary ack for this series just to
> give a hint to others to join the review.
>
Replies were given on the 13/19 patch.

Dan

