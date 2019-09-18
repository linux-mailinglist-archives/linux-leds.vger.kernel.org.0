Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8706B68A3
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 19:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729361AbfIRRGt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 13:06:49 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46346 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbfIRRGt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Sep 2019 13:06:49 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IH6iPq120554;
        Wed, 18 Sep 2019 12:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568826404;
        bh=uJVcOB+ch38YNMZP4f1rNkBv5jy24fM/dgvduX4wNqs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=lrjHapFy0Xjxm7F/eUB9mlxvptcXK8XzN2gbibV2r9SuxErIIHyA0mS3XYaHggLws
         7CFXvQ0uxxjco0xex8PJ2NJbzxVpbLNorlzm3BrEhRW/hvDGt83GgUU6MYpYgTy+NC
         ycxXTwO7YdgRBDBPeEzd1Hqh5GSqGDdvf9/24OEo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8IH6iSt029052
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Sep 2019 12:06:44 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 18
 Sep 2019 12:06:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 18 Sep 2019 12:06:41 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IH6iBw084821;
        Wed, 18 Sep 2019 12:06:44 -0500
Subject: Re: [PATCH v6 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190917175937.13872-1-dmurphy@ti.com>
 <20190917175937.13872-6-dmurphy@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f5cf1fa4-c891-744c-6fa9-4b166b64f463@ti.com>
Date:   Wed, 18 Sep 2019 12:09:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917175937.13872-6-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Greg

<snip>

> +static int led_multicolor_init_color(struct led_classdev_mc_data *data,
> +				     struct led_classdev_mc *mcled_cdev,
> +				     int color_id, int color_index)
> +{
> +	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
> +	struct led_mc_color_entry *mc_priv;
> +	int ret;
> +
> +	mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv), GFP_KERNEL);
> +	if (!mc_priv)
> +		return -ENOMEM;
> +
> +	mc_priv->led_color_id = color_id;
> +	mc_priv->mcled_cdev = mcled_cdev;
> +
> +	led_color_group.name = led_colors[color_id];
> +	ret = sysfs_create_group(data->color_kobj, &led_color_group);
> +	if (ret)
> +		return ret;
> +
> +	sysfs_attr_init(&mc_priv->intensity_attr.attr);
> +	mc_priv->intensity_attr.attr.name = "intensity";
> +	mc_priv->intensity_attr.attr.mode = 666;
> +	mc_priv->intensity_attr.store = intensity_store;
> +	mc_priv->intensity_attr.show = intensity_show;
> +	ret = sysfs_add_file_to_group(data->color_kobj,
> +				      &mc_priv->intensity_attr.attr,
> +				      led_color_group.name);
> +	if (ret)
> +		return ret;
> +
> +	sysfs_attr_init(&mc_priv->max_intensity_attr.attr);
> +	mc_priv->max_intensity_attr.attr.name = "max_intensity";
> +	mc_priv->max_intensity_attr.attr.mode = 444;
> +	mc_priv->max_intensity_attr.show = max_intensity_show;
> +	ret = sysfs_add_file_to_group(data->color_kobj,
> +				      &mc_priv->max_intensity_attr.attr,
> +				      led_color_group.name);
> +	if (ret)
> +		goto err_out;
> +
> +	mc_priv->max_intensity = LED_FULL;
> +	list_add_tail(&mc_priv->list, &data->color_list);
> +
> +err_out:
> +	return ret;
> +}
> +
> +static int led_multicolor_init_color_dir(struct led_classdev_mc_data *data,
> +					 struct led_classdev_mc *mcled_cdev)
> +{
> +	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
> +	u32 color_id;
> +	int ret;
> +	int i, j = 0;
> +
> +	data->color_kobj = kobject_create_and_add("colors",
> +						  &led_cdev->dev->kobj);

We need some guidance here on how to properly create sub directories 
more then 1 level deep.

In short under the LED class device parent directory we want to create a 
directory called "colors".

Under that directory we want to create a directory corresponding to the 
monochrome LED color.
Under that directory we have the files to for intensity and 
max_intensity for the monochrome LED.

We can use the LED class kobject to create the colors directory using 
the sysfs calls but the issue comes when creating the LED color 
directory.  We don't have a kobj for colors to associate those 
directories to.  The only API we see to use the kobject_create_and_add 
which then gives us the colors directory kobj.

So the directory structure would look like this which is explained in 
this patch https://lore.kernel.org/patchwork/patch/1128444/

Directory Layout Example
========================
root:/sys/class/leds/rgb:grouped_leds# ls -lR colors/
colors/:
drwxr-xr-x    2 root     root             0 Jun 28 20:21 blue
rwxr-xr-x    2 root     root             0 Jun 28 20:21 green
drwxr-xr-x    2 root     root             0 Jun 28 20:21 red

colors/blue:
-rw-------    1 root     root          4096 Jun 28 20:21 intensity
-r--------    1 root     root          4096 Jun 28 20:27 max_intensity
+colors/green:
-rw-------    1 root     root          4096 Jun 28 20:22 intensity
-r--------    1 root     root          4096 Jun 28 20:27 max_intensity

colors/red:
-rw-------    1 root     root          4096 Jun 28 20:21 intensity
-r--------    1 root     root          4096 Jun 28 20:27 max_intensity

I have reviewed your example code and read your blogs and papers on the 
subject but nothing really talks about sub-sub directories.

Now if this is a no-no in the kernel that is fine we can adjust but 
Jacek wanted to get your opinon/guidance on this topic.

Dan

<snip>
