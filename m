Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5686E4175
	for <lists+linux-leds@lfdr.de>; Mon, 17 Apr 2023 09:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbjDQHmW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Mon, 17 Apr 2023 03:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjDQHmN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Apr 2023 03:42:13 -0400
X-Greylist: delayed 1356 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 17 Apr 2023 00:41:41 PDT
Received: from mxout70.expurgate.net (mxout70.expurgate.net [91.198.224.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD629D
        for <linux-leds@vger.kernel.org>; Mon, 17 Apr 2023 00:41:41 -0700 (PDT)
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <prvs=148517ce4e=fe@dev.tdt.de>)
        id 1poJ8b-00098H-5l; Mon, 17 Apr 2023 09:18:57 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1poJ8Z-000RKx-IZ; Mon, 17 Apr 2023 09:18:56 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id 4DBBF240049;
        Mon, 17 Apr 2023 09:18:55 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id D7999240040;
        Mon, 17 Apr 2023 09:18:54 +0200 (CEST)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
        by mail.dev.tdt.de (Postfix) with ESMTP id 6F82220FF8;
        Mon, 17 Apr 2023 09:18:54 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date:   Mon, 17 Apr 2023 09:18:54 +0200
From:   Florian Eckert <fe@dev.tdt.de>
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: trigger/tty: Use led_set_brightness_nosleep() to
 set brightness
In-Reply-To: <20230414164853.3668229-1-u.kleine-koenig@pengutronix.de>
References: <20230414164853.3668229-1-u.kleine-koenig@pengutronix.de>
Message-ID: <7b0c3ef0092ad6c19e592d4514e1c76f@dev.tdt.de>
X-Sender: fe@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Content-Transfer-Encoding: 8BIT
X-purgate: clean
X-purgate-ID: 151534::1681715936-527E49F5-0891430F/0/0
X-purgate-type: clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Uwe,

On 2023-04-14 18:48, Uwe Kleine-König wrote:
> After commit ba8a86e4dadb ("leds: trigger/tty: Use
> led_set_brightness_sync() from workqueue") this is the second try to
> pick the right function to set the LED brightness from a trigger.
> 
> led_set_brightness_sync() has the problem that it doesn't work for LEDs
> without a .brightness_set_blocking() callback. This is (among others)
> the case for LEDs connected to non-sleeping GPIOs.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> after a few (non-public and public) reports that the tty trigger 
> doesn't
> work and Jacek pointed out in
> https://lore.kernel.org/all/ad4a1069-72c6-a431-336f-ed78a57a1ba0@gmail.com/#t
> that led_set_brightness_nosleep() is the right function, here comes a
> patch to actually implement that.
> 
> Does this justify a Fixes line? In that case that would be:
> 
> 	Fixes: ba8a86e4dadb ("leds: trigger/tty: Use
> led_set_brightness_sync() from workqueue")
> 
> (As ba8a86e4dadb declares to be a fix for fd4a641ac88f ("leds: trigger:
> implement a tty trigger") I think a further reference to fd4a641ac88f
> isn't necesary.)
> 
> Best regards
> Uwe
> 
>  drivers/leds/trigger/ledtrig-tty.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-tty.c
> b/drivers/leds/trigger/ledtrig-tty.c
> index f62db7e520b5..c8bbdeac93b9 100644
> --- a/drivers/leds/trigger/ledtrig-tty.c
> +++ b/drivers/leds/trigger/ledtrig-tty.c
> @@ -1,11 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0
> 
>  #include <linux/delay.h>
> -#include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/tty.h>
>  #include <uapi/linux/serial.h>
> +#include "../leds.h"
> 
>  struct ledtrig_tty_data {
>  	struct led_classdev *led_cdev;
> @@ -122,12 +122,12 @@ static void ledtrig_tty_work(struct work_struct 
> *work)
> 
>  	if (icount.rx != trigger_data->rx ||
>  	    icount.tx != trigger_data->tx) {
> -		led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
> +		led_set_brightness_nosleep(trigger_data->led_cdev, LED_ON);
> 
>  		trigger_data->rx = icount.rx;
>  		trigger_data->tx = icount.tx;
>  	} else {
> -		led_set_brightness_sync(trigger_data->led_cdev, LED_OFF);
> +		led_set_brightness_nosleep(trigger_data->led_cdev, LED_OFF);
>  	}
> 
>  out:
> 
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6

Tested-By: Florian Eckert <fe@dev.tdt.de>
