Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF163AA303
	for <lists+linux-leds@lfdr.de>; Thu,  5 Sep 2019 14:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731199AbfIEMXc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Thu, 5 Sep 2019 08:23:32 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:33106 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726498AbfIEMXb (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 5 Sep 2019 08:23:31 -0400
Received: from [10.0.18.247] (unknown [95.164.50.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id B2A271A24447;
        Thu,  5 Sep 2019 15:23:28 +0300 (EEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] led: triggers: Fix NULL dereference in led_trigger_set()
 error handling
From:   Oleh Kravchenko <oleg@kaa.org.ua>
In-Reply-To: <20190905120626.hyegecmy6hf5lvhj@pengutronix.de>
Date:   Thu, 5 Sep 2019 15:23:21 +0300
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <BC1CA967-2B9F-44A4-A1A9-FD9C6E874991@kaa.org.ua>
References: <20190905095728.GA26005@mwanda>
 <20190905120626.hyegecmy6hf5lvhj@pengutronix.de>
To:     =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Jacek,

> 5 вер. 2019 р. о 3:06 пп Uwe Kleine-König <u.kleine-koenig@pengutronix.de> написав(ла):
> 
> Hello,
> 
> On Thu, Sep 05, 2019 at 12:57:28PM +0300, Dan Carpenter wrote:
>> The problem is we set "led_cdev->trigger = NULL;" and then dereference
>> it when we call write_lock_irqsave():
>> 
>> 	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
>>                            ^^^^^^^^^^^^^^^^^
>> 
>> Fixes: 2282e125a406 ("leds: triggers: let struct led_trigger::activate() return an error code")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Obviously right. Thanks for catching.
> 
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Did you find this at runtime or by using some static checker?

Let me summarize the chronology of the last activities below:
1. I have sent the patch for the bugs that I have found by static analyzer at PVS-Studio
    Date: Wed, 4 Sep 2019 00:18:19 +0300
    https://www.spinics.net/lists/linux-leds/msg13181.html

2. At 5 Sep 2019 12:57:19 +0300 Time Dan Cartpen has sent the patch with the same proposal
3. Uwe Kleine-König started to discuss his results of review by asking Dan on how he was found it.

Would you mine if you will keep me as a Original author of this patch based on fact 1?

Best regards,
Oleh Kravchenko

> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |

