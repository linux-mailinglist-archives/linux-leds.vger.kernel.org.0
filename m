Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05DD2B4063
	for <lists+linux-leds@lfdr.de>; Mon, 16 Sep 2019 20:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728985AbfIPSdR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Sep 2019 14:33:17 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45530 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730086AbfIPSdR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Sep 2019 14:33:17 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8GIXBT2024285;
        Mon, 16 Sep 2019 13:33:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568658791;
        bh=/uh3XzfLPxRlyD2osjtAPeq1YBIIpL6KBUPfwdUYWTk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=r7UlKu5213zI2y0xhxFiHA4LGMcV4yLLYVnrEQK3x2a5xV4dS6fnvbUr7uFAkeVgv
         VVYxVnstDMTYooaLq2IU/k+TVtAFsJSi0bRkqy+C8EeNHOJ0XVHPkMr4z8AeAGlLHp
         LJBl6i4MkqvQcP90SOQvswVKuvRm5aD4I+s0QDeE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8GIXBkg048005
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Sep 2019 13:33:11 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 16
 Sep 2019 13:33:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 16 Sep 2019 13:33:09 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GIXB5F082601;
        Mon, 16 Sep 2019 13:33:11 -0500
Subject: Re: [PATCH v5 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <robh+dt@kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190911180115.21035-1-dmurphy@ti.com>
 <20190911180115.21035-7-dmurphy@ti.com>
 <2bfd27cf-6703-48b8-be82-9b36066ef2ed@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <edc6aa22-3a9a-2a99-ccca-1bd3bf07f04b@ti.com>
Date:   Mon, 16 Sep 2019 13:34:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2bfd27cf-6703-48b8-be82-9b36066ef2ed@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 9/15/19 11:20 AM, Jacek Anaszewski wrote:
>
>> +
>> +static int led_multicolor_init_color(struct led_classdev_mc_data *data,
>> +				     struct led_classdev_mc *mcled_cdev,
>> +				     int color_id, int color_index)
>> +{
>> +	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
>> +	struct led_classdev_mc_priv *mc_priv;
>> +	int ret;
>> +
>> +	mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv), GFP_KERNEL);
>> +	if (!mc_priv)
>> +		return -ENOMEM;
>> +
>> +	mc_priv->led_color_id = color_id;
>> +	mc_priv->mcled_cdev = mcled_cdev;
>> +
>> +	data->led_kobj = kobject_create_and_add(led_colors[color_id],
>> +						data->color_kobj);
> No change here since previous version? What prevents you from following
> what has been done for drivers/usb/core/ledtrig-usbport.c?
>
> Use sysfs_create_group() for creating color dir
> and sysfs_add_file_to_group() for adding files to it.

We have nested directories here.  colors is a directory and then the LED 
color is a directory.

So I am not sure how to create a group under another group without the 
colors directory kobj.

Wondering if you know of any examples?

Dan

