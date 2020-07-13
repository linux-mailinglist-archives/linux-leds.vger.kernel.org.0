Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD41F21D74B
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 15:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729914AbgGMNey (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 09:34:54 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47326 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729805AbgGMNey (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2020 09:34:54 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06DDYicE008834;
        Mon, 13 Jul 2020 08:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594647284;
        bh=luXMMPErLS31mqgSXoK+p/1sP1jJ1sb3mbiOyr1b5Iw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=V7s0ufhyzBePXtngza29y1zjt/bPy+SxICXzO3SIp/JiqaZvESJnK65MR6szglv6x
         ofpljnczLz7ECHvFNUUOtnGXjVpSVOL6KlP2fZS/2g8bn8c5lHRfEsJwJ2+myQwdnM
         zi6JTCSw9uP/Le5B0x4KroCCwZSvZnklT/Km4o4A=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06DDYiYm066629
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 Jul 2020 08:34:44 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 13
 Jul 2020 08:34:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 13 Jul 2020 08:34:43 -0500
Received: from [10.250.32.229] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06DDYh1h042399;
        Mon, 13 Jul 2020 08:34:43 -0500
Subject: Re: [PATCH v29 03/16] leds: multicolor: Introduce a multicolor class
 definition
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200622185919.2131-1-dmurphy@ti.com>
 <20200622185919.2131-4-dmurphy@ti.com> <20200711155734.GA21726@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <ab537d8d-00e3-fcad-d530-264ffeccdf30@ti.com>
Date:   Mon, 13 Jul 2020 08:34:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200711155734.GA21726@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

Thanks for the review

On 7/11/20 10:57 AM, Pavel Machek wrote:
> Hi!
>
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>> +What:		/sys/class/leds/<led>/multi_intensity
>> +Date:		March 2020
>> +KernelVersion:	5.8
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read/write
>> +		Intensity level for the LED color within an array of integers.
> ? "This file contains array of integers".
OK
>
>> +		The intensities for each color must be entered based on the
>> +		multi_index array.
> This does not make sense to me. "Order of components is described by
> the multi_index array"?
>
>> The max_intensity should not exceed
> "max_intensity" -> "maximum intensity"?
OK
>
>> +		/sys/class/leds/<led>/max_brightness.
>> +Multicolor Class Brightness Control
>> +===================================
>> +The multicolor class framework will calculate each monochrome LEDs intensity.
> ?
This is redundant and will be removed.
>
>> +static ssize_t multi_intensity_store(struct device *dev,
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
>> +			dev_dbg(led_cdev->dev,
>> +				"Incorrect number of LEDs expected %i values intensity was not applied\n",
>> +				mcled_cdev->num_colors);
>> +			ret = -EINVAL;
>> +			goto err_out;
>> +		}
>> +		offset += nrchars;
>> +	}
>> +
>> +	/* account for the space at the end of the buffer */
>> +	offset++;
> space? I'd expect \n there. And it would be good to verify it is
> indeed \n, so that for example "0 0 0b" is not accepted.
It is a new line the comment is incorrect I can remove the comment or 
update the comment to account for the new line
> Please remove the dev_dbg()s that can be triggered by userspace. We
> don't want users spamming the logs.
Removed
>
>> +static ssize_t multi_intensity_show(struct device *dev,
>> +			      struct device_attribute *intensity_attr,
>> +			      char *buf)
>> +{
>> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
>> +	int len = 0;
>> +	int i;
>> +
>> +	for (i = 0; i < mcled_cdev->num_colors; i++) {
>> +		len += sprintf(buf + len, "%d",
>> +			       mcled_cdev->subled_info[i].intensity);
>> +		len += sprintf(buf + len, " ");
> We should not really put " " before newline.

OK I will fix that.


>> +static ssize_t multi_index_show(struct device *dev,
>> +			      struct device_attribute *multi_index_attr,
>> +			      char *buf)
>> +{
>> +	for (i = 0; i < mcled_cdev->num_colors; i++) {
>> +		index = mcled_cdev->subled_info[i].color_index;
>> +		len += sprintf(buf + len, "%s", led_colors[index]);
>> +		len += sprintf(buf + len, " ");
>> +	}
> We should not really put " " before newline.
>
>> +{
>> +	struct led_classdev *led_cdev;
>> +
>> +	if (!mcled_cdev)
>> +		return -EINVAL;
>> +
>> +	if (!mcled_cdev->num_colors)
>> +		return -EINVAL;
> It is plain int, so you may want to check for <= 0? Or maybe make it
> unsigned?

ok


>> +MODULE_LICENSE("GPL v2");
> If your legal department allows that, GPL v2+ would be preffered
> (globally).

OK


>
>> +struct mc_subled {
>> +	int color_index;
>> +	int brightness;
>> +	int intensity;
>> +	int channel;
>> +};
>> +
>> +struct led_classdev_mc {
>> +	/* led class device */
>> +	struct led_classdev led_cdev;
>> +	int num_colors;
>> +
>> +	struct mc_subled *subled_info;
>> +};
> Would some "unsigned"s make sense here to cut number of corner cases?

I made these unsigned.

Dan

>
> Best regards,
> 									Pavel
