Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44E35B41A6
	for <lists+linux-leds@lfdr.de>; Mon, 16 Sep 2019 22:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbfIPUST (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Sep 2019 16:18:19 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38610 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728003AbfIPUST (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Sep 2019 16:18:19 -0400
Received: by mail-wr1-f65.google.com with SMTP id l11so773078wrx.5;
        Mon, 16 Sep 2019 13:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xelTtxQZNwUHjKI4djBQXcsmyeU/4Lfzkk0E8IqczKA=;
        b=L8VzfxsqHQ8LcrCqNVEWoPzMvYKROKLYU/J8tGhPijGQhyCO9BBrfr72WIL9HPeYwo
         qzFAjUFT7z/91no63Cf2rMMHKb7zFTsFbRqpNvqB1iUnnHW/5pzllQFBru36mL252oXZ
         dGe6+ifSvDtuKPvrX097jah+28NzIZMeATbwTYreHA+y4IsDo/j1F1ZcHMn2uu6A03eR
         ++RamHOyCNdpDt7w0ypnhrtSuoxCdowILD+EiH0kvOYAcX1rHrflzwMNd8Lna/LdDmMV
         93Wo4+14Hv3UPtTxxnUL7uDnZ6+ZsqYPdp4uB4HlR4+H1YS9QXiFMFq1oERMGJzSuSss
         fn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xelTtxQZNwUHjKI4djBQXcsmyeU/4Lfzkk0E8IqczKA=;
        b=Dxl5Plz1YAwG+a8TnnsH9L6InfoxJNjr4l+B5dSLDq0ApnJJTAkNUYQWmsIZjQmtuM
         jKHoVjCSvnMZMeyrJrcxi2W17Tg+zc3g2N3EBlDh7TpaSO+2/JiCVChf9m4oXda/KL7p
         e9qDDgu8CAPqOrKpWjEZjnjpreGN2pIdzCCprVn4mQajwXVh/gBaR6Rxj+eQsMgXeNTA
         OfrSSOkXg+WQsXkdNESUAS3unvS8Mxd4VzM7pJVcqCoxmzG5/R/gC2uKryf6QecQ5S5B
         lTfzNuO5y39/LIKoTvj7UKuMZwja3peqerWuhmQvM3+tFIQplanKKvrYJ4GKOohCLSGi
         4GAA==
X-Gm-Message-State: APjAAAUTmni1Owi5TVkFoUNwRtnhErxmHvM6hV/+xSiKKh4XZucmx9Ul
        Aah6HcMneMfWhx2btdqMnSYcxYQ3
X-Google-Smtp-Source: APXvYqz35KSANFy1K7cjmog1aUsHShUSOPyVP5JNXlDOsnGpAKbSxjaYZmR2blryXIRlNualQROPcQ==
X-Received: by 2002:a5d:5403:: with SMTP id g3mr121808wrv.338.1568665096013;
        Mon, 16 Sep 2019 13:18:16 -0700 (PDT)
Received: from [192.168.1.19] (bgp90.neoplus.adsl.tpnet.pl. [83.28.79.90])
        by smtp.gmail.com with ESMTPSA id n17sm7835wrp.37.2019.09.16.13.18.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Sep 2019 13:18:15 -0700 (PDT)
Subject: Re: [PATCH v5 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     robh+dt@kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190911180115.21035-1-dmurphy@ti.com>
 <20190911180115.21035-7-dmurphy@ti.com>
 <2bfd27cf-6703-48b8-be82-9b36066ef2ed@gmail.com>
 <edc6aa22-3a9a-2a99-ccca-1bd3bf07f04b@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <43f810ed-f477-1c8e-5f96-ba2c5ef824eb@gmail.com>
Date:   Mon, 16 Sep 2019 22:18:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <edc6aa22-3a9a-2a99-ccca-1bd3bf07f04b@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/16/19 8:34 PM, Dan Murphy wrote:
> Jacek
> 
> On 9/15/19 11:20 AM, Jacek Anaszewski wrote:
>>
>>> +
>>> +static int led_multicolor_init_color(struct led_classdev_mc_data *data,
>>> +                     struct led_classdev_mc *mcled_cdev,
>>> +                     int color_id, int color_index)
>>> +{
>>> +    struct led_classdev *led_cdev = mcled_cdev->led_cdev;
>>> +    struct led_classdev_mc_priv *mc_priv;
>>> +    int ret;
>>> +
>>> +    mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv),
>>> GFP_KERNEL);
>>> +    if (!mc_priv)
>>> +        return -ENOMEM;
>>> +
>>> +    mc_priv->led_color_id = color_id;
>>> +    mc_priv->mcled_cdev = mcled_cdev;
>>> +
>>> +    data->led_kobj = kobject_create_and_add(led_colors[color_id],
>>> +                        data->color_kobj);
>> No change here since previous version? What prevents you from following
>> what has been done for drivers/usb/core/ledtrig-usbport.c?
>>
>> Use sysfs_create_group() for creating color dir
>> and sysfs_add_file_to_group() for adding files to it.
> 
> We have nested directories here.  colors is a directory and then the LED
> color is a directory.
> 
> So I am not sure how to create a group under another group without the
> colors directory kobj.
> 
> Wondering if you know of any examples?

Hmm, that indeed seems not to be allowed. kobject_create_and_add()
seems to be the only solution to achieve nested directories.
Nonetheless we will have to first justify the need for that to Greg.

-- 
Best regards,
Jacek Anaszewski
