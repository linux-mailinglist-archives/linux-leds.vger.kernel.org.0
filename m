Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B07AA73EE
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2019 21:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbfICTqk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Tue, 3 Sep 2019 15:46:40 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:55317 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbfICTqk (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 3 Sep 2019 15:46:40 -0400
Received: from oleh.kravchenko.mbp13.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id BC2BB1A24468;
        Tue,  3 Sep 2019 22:46:36 +0300 (EEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 2/2] leds: ns2: Fix wrong boolean expression
From:   Oleh Kravchenko <oleg@kaa.org.ua>
In-Reply-To: <20190903185006.GA10875@amd>
Date:   Tue, 3 Sep 2019 22:46:32 +0300
Cc:     linux-leds@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <4B55F03E-03C9-44BA-A4CB-AADA29FC4271@kaa.org.ua>
References: <20190903125020.20482-1-oleg@kaa.org.ua>
 <20190903125020.20482-2-oleg@kaa.org.ua> <20190903141241.GB8199@amd>
 <e7384bf0-dc94-f678-5aaa-e936b27f1650@kaa.org.ua>
 <20190903185006.GA10875@amd>
To:     Pavel Machek <pavel@ucw.cz>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel,

> On Sep 3, 2019, at 9:50 PM, Pavel Machek <pavel@ucw.cz> wrote:
> 
> On Tue 2019-09-03 19:00:21, Oleh Kravchenko wrote:
>> Hello Pavel,
>> 
>> 03.09.19 17:12, Pavel Machek пише:
>>> On Tue 2019-09-03 15:50:20, Oleh Kravchenko wrote:
>>>> Error was detected by PVS-Studio:
>>>> V792 The '__gpio_cansleep' function located to the right of
>>>> the operator '|' will be called regardless of the value of
>>>> the left operand. Perhaps, it is better to use '||'.
>>> 1st: original code is not wrong
>> 
>> '|' is bitwise operation, if it really means *OR* then should be '||' -
>> led_dat->can_sleep is bool.
> 
> I see that || would be more natural. But | also works.
> 
>>> 2nd: you are introducing a bug
>> 
>> No, because if GPIOs *slow* can sleep and GPIO *cmd* can't sleep
>> it will call gpio_set_value_cansleep() for both.
> 
> If just one of them can sleep, can_sleep will be 0, and bad things
> will happen, right?

With current code if just one of them can sleep, can_sleep will be not zero (!= 0).
And bad things will happen.

> 
> 
>>>> @@ -205,7 +205,7 @@ create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
>>>> 	led_dat->cdev.groups = ns2_led_groups;
>>>> 	led_dat->cmd = template->cmd;
>>>> 	led_dat->slow = template->slow;
>>>> -	led_dat->can_sleep = gpio_cansleep(led_dat->cmd) |
>>>> +	led_dat->can_sleep = gpio_cansleep(led_dat->cmd) &&
>>>> 				gpio_cansleep(led_dat->slow);
>>>> 	if (led_dat->can_sleep)
>>>> 		led_dat->cdev.brightness_set_blocking = ns2_led_set_blocking;
> 
> Best regards,
> 									Pavel
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

