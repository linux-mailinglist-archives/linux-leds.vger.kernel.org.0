Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47F38ACBD8
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 11:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbfIHJq2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Sun, 8 Sep 2019 05:46:28 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:39244 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727207AbfIHJq2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 8 Sep 2019 05:46:28 -0400
Received: from oleh.kravchenko.mbp13.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id B3CCE1A2027F;
        Sun,  8 Sep 2019 12:46:26 +0300 (EEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] led: triggers: Fix NULL dereference in led_trigger_set()
 error handling
From:   Oleh Kravchenko <oleg@kaa.org.ua>
In-Reply-To: <20190905133233.GF3093@kadam>
Date:   Sun, 8 Sep 2019 12:46:21 +0300
Cc:     =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <351E367B-8964-4A4D-A4CF-94EDE3B3B2FA@kaa.org.ua>
References: <20190905095728.GA26005@mwanda>
 <20190905120626.hyegecmy6hf5lvhj@pengutronix.de>
 <BC1CA967-2B9F-44A4-A1A9-FD9C6E874991@kaa.org.ua>
 <20190905133233.GF3093@kadam>
To:     Dan Carpenter <dan.carpenter@oracle.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Dan,

> 5 вер. 2019 р. о 4:32 пп Dan Carpenter <dan.carpenter@oracle.com> написав(ла):
> 
> On Thu, Sep 05, 2019 at 03:23:21PM +0300, Oleh Kravchenko wrote:
>> Let me summarize the chronology of the last activities below:
>> 1. I have sent the patch for the bugs that I have found by static analyzer at PVS-Studio
>>    Date: Wed, 4 Sep 2019 00:18:19 +0300
>>    https://www.spinics.net/lists/linux-leds/msg13181.html
>> 
>> 2. At 5 Sep 2019 12:57:19 +0300 Time Dan Cartpen has sent the patch with the same proposal
>> 3. Uwe Kleine-König started to discuss his results of review by asking Dan on how he was found it.
>> 
>> Would you mine if you will keep me as a Original author of this patch based on fact 1?
> 
> Heh.
> 
> No, I didn't steal your patch.  :P  I am the author of the Smatch static
> analysis tool and mostly fix things found by Smatch.  I don't use other
> static analysis tools except to do a final QC of my patches.
> 

Thanks!
I didn’t know this tool. Will take a look on it.

By the way, you can use PVS-Studio freely
https://www.viva64.com/en/b/0600/
They provide free license for open source projects.

> It's super common for people to send duplicate fixes when it's based on
> static analysis.  Most of the static analysis people hang out on
> kernel-janitors so we don't send duplicate patches.  For a while people
> were getting annoyed by all the duplicates but now they accept it as
> their punishment for introducing a bug in the first place.
> 

No problem.
We all doing good things!

> Anyway, the rule for kernel development is that normally the first
> person's patch goes in, so we will take your patch.
> 

I think next time you will take a look at mail list before sending patches ;-)

> regards,
> dan carpenter
> 

P.S.:
resent because was in non plain-text format. 

-- 
Best regards,
Oleh Kravchenko

