Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94AA61BAE18
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 21:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgD0Tjm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 15:39:42 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45970 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgD0Tjm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 15:39:42 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03RJda6S096439;
        Mon, 27 Apr 2020 14:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588016376;
        bh=HINJHiVpFvuio0yrVgUBXnCKct71XOyVMRZH21XcGSY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Jahvzoou2Iy0O92GIZiQYIFGxJn0nlokcVQqOlx8r6SqEeZPfWO4fLOYMKAVBGRZg
         aWoCkDEXke/wqhq39aFOsoIg6YOtF+qXSvmppQWvew7PH8Jf5oXn1N/zuQxY6CfoRZ
         716fHdB1FTbktf5U7hYZqIVxXtcRqmgnSPF1+cWQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03RJdaF7090451
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Apr 2020 14:39:36 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 27
 Apr 2020 14:39:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 27 Apr 2020 14:39:36 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RJdaIQ117900;
        Mon, 27 Apr 2020 14:39:36 -0500
Subject: Re: [PATCH v20 03/17] leds: multicolor: Introduce a multicolor class
 definition
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-4-dmurphy@ti.com> <20200425202306.GA23926@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <80e20291-0ff2-87e6-8f93-2f37f588b148@ti.com>
Date:   Mon, 27 Apr 2020 14:33:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200425202306.GA23926@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 4/25/20 3:23 PM, Pavel Machek wrote:
> Hi!
>
> ting/sysfs-class-led-multicolor
>> new file mode 100644
>> index 000000000000..ada0dbecfeab
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> @@ -0,0 +1,42 @@
>> +What:		/sys/class/leds/<led>/multi_led_index
>> +Date:		March 2020
>> +KernelVersion:	5.8
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read
>> +		The multi_led_index array, when read, will output the LED colors
>> +		by name as they are indexed in the multi_led_intensity file.
> Can we make it multi_index? We are already in leds directory, and it
> is a bit shorter.
Ack
>> +What:		/sys/class/leds/<led>/num_multi_leds
>> +Date:		March 2020
>> +KernelVersion:	5.8
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read
>> +		The num_multi_leds indicates the number of LEDs defined in the
>> +		multi_led_intensity and multi_led_index files.
> Please drop this one.
Ack
>> +What:		/sys/class/leds/<led>/multi_led_intensity
>> +Date:		March 2020
>> +KernelVersion:	5.8
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read/write
>> +		Intensity level for the LED color within the array.
>> +		The intensities for each color must be entered based on the
>> +		multi_led_index array.
> And let this one be multi_intensity.
Ack
>> +For more details on hue and lightness notions please refer to
>> +https://en.wikipedia.org/wiki/CIECAM02.
> I'd drop this reference. multi_intensity file controls both hue and
> saturation AFAICT.
Ack
>> +Example:
>> +A user first writes the multi_led_intensity file with the brightness levels
>> +for each LED that are necessary to achieve a blueish violet output from a
>> +multicolor LED group.
> I don't believe we can guarantee that. 255/255/255 will produce
> different colors on different hardware (not white), and 43/226/138
> will also produce different colors.

I changed it to be a bit more ambiguous.


> ...
>
>> +cat /sys/class/leds/multicolor:status/multi_led_index
>> +green blue red
> Hmm. We should really make sure LEDs are ordered as "red green
> blue". Yes, userspace should support any order, but...

Ordering is not guaranteed since it is based on the DT ordering. I don't 
think we can mandate that these LEDs be put in order in the DT.

Besides the framework and the device driver do not care what color is 
where only the user space needs to care.  The FW and device driver only 
care about the brightness, intensity and channel.


>
>> +The user can control the brightness of that multicolor LED group by writing the
>> +parent 'brightness' control.  Assuming a parent max_brightness of 255 the user
> delete "parent", twice?
Ack
>
>
>> +	for (i = 0; i < mcled_cdev->num_colors; i++)
>> +		mcled_cdev->multicolor_info[i].color_brightness = brightness *
>> +					  mcled_cdev->multicolor_info[i].color_led_intensity /
>> +					  led_cdev->max_brightness;
> It would be good to get this under ~80 characters. Perhaps shorter
> identifiers would help... shortening multicolor_ to mc_?
ACK
>> +static ssize_t multi_led_intensity_store(struct device *dev,
>> +				struct device_attribute *intensity_attr,
>> +				const char *buf, size_t size)
>> +{
>> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
>> +	int nrchars, offset = 0;
>> +	int intensity_value[LED_COLOR_ID_MAX];
>> +	int i;
>> +	ssize_t ret;
>> +
>> +	mutex_lock(&led_cdev->led_access);
>> +
>> +	for (i = 0; i < mcled_cdev->num_colors; i++) {
>> +		ret = sscanf(buf + offset, "%i%n",
>> +			     &intensity_value[i], &nrchars);
>> +		if (ret != 1) {
>> +			dev_err(led_cdev->dev,
> dev_dbg, at most. It is user-triggerable.
ACK
>> +				"Incorrect number of LEDs expected %i values intensity was not applied\n",
>> +				mcled_cdev->num_colors);
>> +			goto err_out;
> Should not we return -ERRNO to userspace on error?
ACK
>
>> +		}
>> +		offset += nrchars;
>> +	}
> This checks for "not enough" intensities. Do we need check for "too
> many" intensities?

We ignore anything greater then mcled_cdev->num_colors.  So if this is 
set to 3 we only read the first 3 values.

So we cannot read more then what is set by the DT.

>
>> +static ssize_t multi_led_intensity_show(struct device *dev,
>> +			      struct device_attribute *intensity_attr,
>> +			      char *buf)
>> +{
>> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
>> +	int len = 0;
>> +	int i;
>> +
>> +	for (i = 0; i < mcled_cdev->num_colors; i++)
>> +		len += sprintf(buf + len, "%d ",
>> +			    mcled_cdev->multicolor_info[i].color_led_intensity);
>> +
>> +	len += sprintf(buf + len, "%s", "\n");
> This will result in extra " " before end of line.
>
> Please don't use "%s", "\n" to add single character. "\n" would be enough.
Ack changed to just sprintf(buf + len, "\n");
>
>> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
>> +	int len = 0;
>> +	int index;
>> +	int i;
>> +
>> +	for (i = 0; i < mcled_cdev->num_colors; i++) {
>> +		index = mcled_cdev->multicolor_info[i].color_index;
>> +		len += sprintf(buf + len, "%s ", led_colors[index]);
>> +	}
>> +
>> +	len += sprintf(buf + len, "%s", "\n");
> Same here.
Same as above
>> +int led_classdev_multicolor_register_ext(struct device *parent,
>> +				     struct led_classdev_mc *mcled_cdev,
>> +				     struct led_init_data *init_data)
>> +{
>> +	struct led_classdev *led_cdev;
>> +
>> +	if (!mcled_cdev)
>> +		return -EINVAL;
>> +
>> +	if (!mcled_cdev->num_colors)
>> +		return -EINVAL;
> if (num_colors > max)... ?
ACK
>> +#ifndef __LINUX_MULTICOLOR_LEDS_H_INCLUDED
>> +#define __LINUX_MULTICOLOR_LEDS_H_INCLUDED
> Usual style is "_LINUX_MULTICOLOR_LEDS_H".
Ack
>> +#else
>> +
>> +static inline  int led_classdev_multicolor_register_ext(struct device *parent,
> double space after "inline".
Ack
>> +					    struct led_classdev_mc *mcled_cdev,
>> +					    struct led_init_data *init_data)
>> +{
>> +	return -EINVAL;
>> +}
> Do we need to include these stubs? I guess it is okay to have them,
> OTOH I'd expect drivers to depend on MULTICOLOR being available...

Jacek Answered this.

Dan


> Best regards,
> 									Pavel
