Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF96FAA130
	for <lists+linux-leds@lfdr.de>; Thu,  5 Sep 2019 13:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731717AbfIELWJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Thu, 5 Sep 2019 07:22:09 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:56865 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731338AbfIELWI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 5 Sep 2019 07:22:08 -0400
Received: from [10.0.18.247] (unknown [95.164.50.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id CF53D1A2444F;
        Thu,  5 Sep 2019 14:22:06 +0300 (EEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] led: triggers: Fix NULL dereference in led_trigger_set()
 error handling
From:   Oleh Kravchenko <oleg@kaa.org.ua>
In-Reply-To: <20190905095728.GA26005@mwanda>
Date:   Thu, 5 Sep 2019 14:22:00 +0300
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <1BD74E2A-2DB7-4B1C-A281-3E1E1488DCBB@kaa.org.ua>
References: <20190905095728.GA26005@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Dan,
If you amend my patch, please keep my Signed-of-by.

> 5 вер. 2019 р. о 12:57 пп Dan Carpenter <dan.carpenter@oracle.com> написав(ла):
> 
> The problem is we set "led_cdev->trigger = NULL;" and then dereference
> it when we call write_lock_irqsave():
> 
> 	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
>                            ^^^^^^^^^^^^^^^^^
> 
> Fixes: 2282e125a406 ("leds: triggers: let struct led_trigger::activate() return an error code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> drivers/leds/led-triggers.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index eff1bda8b520..13cea227277c 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -167,12 +167,12 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
> 		trig->deactivate(led_cdev);
> err_activate:
> 
> -	led_cdev->trigger = NULL;
> -	led_cdev->trigger_data = NULL;
> 	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
> 	list_del(&led_cdev->trig_list);
> 	write_unlock_irqrestore(&led_cdev->trigger->leddev_list_lock, flags);
> +	led_cdev->trigger = NULL;
> +	led_cdev->trigger_data = NULL;
> 	led_set_brightness(led_cdev, LED_OFF);
> 	kfree(event);
> 
> 	return ret;
> -- 
> 2.20.1
> 

