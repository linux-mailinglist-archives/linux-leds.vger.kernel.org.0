Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72556B6D07
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 21:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387488AbfIRT4N (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 15:56:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:55316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731973AbfIRT4N (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 18 Sep 2019 15:56:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1DC00222D0;
        Wed, 18 Sep 2019 19:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568836572;
        bh=4eU6w+0ThXpMTuRvqqyQ15DzuRIOjSwyvXAY1ONPr98=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wmNtcKSjeKP6ZbuPYRGX306NgCz5nagpS0NBjWJQXOwIOCXy7M4B2dJSRU+9d0Qv5
         WRq8vxmBTG7BW3dK31f+mVsxdi7PQyjw6T8tpfS2OXCgcnlU3vcTOc7/QNU16oboHf
         ERDWbCzyKMQc5zU9Ar1ITlaQZK1kktdORBVIx9Hc=
Date:   Wed, 18 Sep 2019 21:56:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/9] leds: multicolor: Introduce a multicolor class
 definition
Message-ID: <20190918195610.GC2020317@kroah.com>
References: <20190917175937.13872-1-dmurphy@ti.com>
 <20190917175937.13872-6-dmurphy@ti.com>
 <f5cf1fa4-c891-744c-6fa9-4b166b64f463@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5cf1fa4-c891-744c-6fa9-4b166b64f463@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Sep 18, 2019 at 12:09:12PM -0500, Dan Murphy wrote:
> Greg
> 
> <snip>
> 
> > +static int led_multicolor_init_color(struct led_classdev_mc_data *data,
> > +				     struct led_classdev_mc *mcled_cdev,
> > +				     int color_id, int color_index)
> > +{
> > +	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
> > +	struct led_mc_color_entry *mc_priv;
> > +	int ret;
> > +
> > +	mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv), GFP_KERNEL);
> > +	if (!mc_priv)
> > +		return -ENOMEM;
> > +
> > +	mc_priv->led_color_id = color_id;
> > +	mc_priv->mcled_cdev = mcled_cdev;
> > +
> > +	led_color_group.name = led_colors[color_id];
> > +	ret = sysfs_create_group(data->color_kobj, &led_color_group);
> > +	if (ret)
> > +		return ret;
> > +
> > +	sysfs_attr_init(&mc_priv->intensity_attr.attr);
> > +	mc_priv->intensity_attr.attr.name = "intensity";
> > +	mc_priv->intensity_attr.attr.mode = 666;
> > +	mc_priv->intensity_attr.store = intensity_store;
> > +	mc_priv->intensity_attr.show = intensity_show;
> > +	ret = sysfs_add_file_to_group(data->color_kobj,
> > +				      &mc_priv->intensity_attr.attr,
> > +				      led_color_group.name);
> > +	if (ret)
> > +		return ret;
> > +
> > +	sysfs_attr_init(&mc_priv->max_intensity_attr.attr);
> > +	mc_priv->max_intensity_attr.attr.name = "max_intensity";
> > +	mc_priv->max_intensity_attr.attr.mode = 444;
> > +	mc_priv->max_intensity_attr.show = max_intensity_show;
> > +	ret = sysfs_add_file_to_group(data->color_kobj,
> > +				      &mc_priv->max_intensity_attr.attr,
> > +				      led_color_group.name);
> > +	if (ret)
> > +		goto err_out;
> > +
> > +	mc_priv->max_intensity = LED_FULL;
> > +	list_add_tail(&mc_priv->list, &data->color_list);
> > +
> > +err_out:
> > +	return ret;
> > +}
> > +
> > +static int led_multicolor_init_color_dir(struct led_classdev_mc_data *data,
> > +					 struct led_classdev_mc *mcled_cdev)
> > +{
> > +	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
> > +	u32 color_id;
> > +	int ret;
> > +	int i, j = 0;
> > +
> > +	data->color_kobj = kobject_create_and_add("colors",
> > +						  &led_cdev->dev->kobj);
> 
> We need some guidance here on how to properly create sub directories more
> then 1 level deep.

Short answer, don't.

Long answer, use a 'struct device' but ONLY IF YOU KNOW WHAT YOU ARE
DOING!

Follow the short answer please.

> In short under the LED class device parent directory we want to create a
> directory called "colors".

Ok, that's simple.

> Under that directory we want to create a directory corresponding to the
> monochrome LED color.

Why?

> Under that directory we have the files to for intensity and max_intensity
> for the monochrome LED.

Why not just have colors/monochrome_intensity and
colors/monochrome_max_intensity as your files in the colors/ directory?

> We can use the LED class kobject to create the colors directory using the
> sysfs calls but the issue comes when creating the LED color directory.

Yes.

> We don't have a kobj for colors to associate those directories to. 

And you shouldn't :)

> The only API we see to use the kobject_create_and_add which then gives
> us the colors directory kobj.

Don't do that, you will break userspace code hard if you do that.

NEVER put a raw kobject after a 'struct device' in the sysfs tree if you
expect normal userspace libraries to be able to understand what is going
on.  That's why this is "hard", you are not supposed to be doing it.

> So the directory structure would look like this which is explained in this
> patch https://lore.kernel.org/patchwork/patch/1128444/
> 
> Directory Layout Example
> ========================
> root:/sys/class/leds/rgb:grouped_leds# ls -lR colors/
> colors/:
> drwxr-xr-x    2 root     root             0 Jun 28 20:21 blue
> rwxr-xr-x    2 root     root             0 Jun 28 20:21 green
> drwxr-xr-x    2 root     root             0 Jun 28 20:21 red
> 
> colors/blue:
> -rw-------    1 root     root          4096 Jun 28 20:21 intensity
> -r--------    1 root     root          4096 Jun 28 20:27 max_intensity
> +colors/green:
> -rw-------    1 root     root          4096 Jun 28 20:22 intensity
> -r--------    1 root     root          4096 Jun 28 20:27 max_intensity
> 
> colors/red:
> -rw-------    1 root     root          4096 Jun 28 20:21 intensity
> -r--------    1 root     root          4096 Jun 28 20:27 max_intensity


No, just add blue, green, red to the prefix of those files and all
should be fine.  Don't try to get fancy and use subdirs, that way lies
madness.

> I have reviewed your example code and read your blogs and papers on the
> subject but nothing really talks about sub-sub directories.

Because you shouldn't do it, I didn't think I had to describe everything
you should not do :)

> Now if this is a no-no in the kernel that is fine we can adjust but Jacek
> wanted to get your opinon/guidance on this topic.

Yes, don't do it.

did I say it enough times?  :)

thanks,

greg k-h
