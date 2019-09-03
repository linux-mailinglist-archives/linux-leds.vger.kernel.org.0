Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1189A724A
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2019 20:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbfICSLi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Tue, 3 Sep 2019 14:11:38 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:48732 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728065AbfICSLh (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 3 Sep 2019 14:11:37 -0400
Received: from [192.168.202.232] (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 7A13B1A24464;
        Tue,  3 Sep 2019 21:11:35 +0300 (EEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/2] leds: mlxreg: Fix possible buffer overflow
From:   Oleh Kravchenko <oleg@kaa.org.ua>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <20190903141231.GA8199@amd>
Date:   Tue, 3 Sep 2019 21:11:30 +0300
Cc:     linux-leds@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <E8C449CE-405A-473F-9A2F-393070C0DA28@kaa.org.ua>
References: <20190903125020.20482-1-oleg@kaa.org.ua> <20190903141231.GA8199@amd>
To:     Pavel Machek <pavel@ucw.cz>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

3 вер. 2019 р. о 17:12 Pavel Machek <pavel@ucw.cz> пише:

>> On Tue 2019-09-03 15:50:19, Oleh Kravchenko wrote:
>> Error was detected by PVS-Studio:
>> V512 A call of the 'sprintf' function will lead to overflow of
>> the buffer 'led_data->led_cdev_name'.
> 
> Are you sure this is correct fix? Will the name be always properly
> null terminated?

snprintf() always terminate string by NULL

>                                    Pavel
> 
>> +++ b/drivers/leds/leds-mlxreg.c
>> @@ -228,8 +228,8 @@ static int mlxreg_led_config(struct mlxreg_led_priv_data *priv)
>>            brightness = LED_OFF;
>>            led_data->base_color = MLXREG_LED_GREEN_SOLID;
>>        }
>> -        sprintf(led_data->led_cdev_name, "%s:%s", "mlxreg",
>> -            data->label);
>> +        snprintf(led_data->led_cdev_name, sizeof(led_data->led_cdev_name),
>> +             "mlxreg:%s", data->label);
>>        led_cdev->name = led_data->led_cdev_name;
>>        led_cdev->brightness = brightness;
>>        led_cdev->max_brightness = LED_ON;
> 
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

--
Best regards,
Oleh Kravchenko
