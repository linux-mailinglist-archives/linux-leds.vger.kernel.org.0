Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4053DACBB5
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 10:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727551AbfIHI5Z convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Sun, 8 Sep 2019 04:57:25 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:35766 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727207AbfIHI5Z (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 8 Sep 2019 04:57:25 -0400
Received: from oleh.kravchenko.mbp13.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id C27471A20C3D;
        Sun,  8 Sep 2019 11:57:23 +0300 (EEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 1/2] leds: mlxreg: Fix possible buffer overflow
From:   Oleh Kravchenko <oleg@kaa.org.ua>
In-Reply-To: <20190907193612.GA25459@amd>
Date:   Sun, 8 Sep 2019 11:57:18 +0300
Cc:     linux-leds@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <7E9BDCB8-5F65-4919-BC2B-0FFCEF747BD1@kaa.org.ua>
References: <20190903125020.20482-1-oleg@kaa.org.ua>
 <20190903141231.GA8199@amd> <E8C449CE-405A-473F-9A2F-393070C0DA28@kaa.org.ua>
 <20190907193612.GA25459@amd>
To:     Pavel Machek <pavel@ucw.cz>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel,

> 7 вер. 2019 р. о 10:36 пп Pavel Machek <pavel@ucw.cz> написав(ла):
> 
> On Tue 2019-09-03 21:11:30, Oleh Kravchenko wrote:
>> Hi Pavel,
>> 
>> 3 вер. 2019 р. о 17:12 Pavel Machek <pavel@ucw.cz> пише:
>> 
>>>> On Tue 2019-09-03 15:50:19, Oleh Kravchenko wrote:
>>>> Error was detected by PVS-Studio:
>>>> V512 A call of the 'sprintf' function will lead to overflow of
>>>> the buffer 'led_data->led_cdev_name'.
>>> 
>>> Are you sure this is correct fix? Will the name be always properly
>>> null terminated?
>> 
>> snprintf() always terminate string by NULL
> 
> You are right, sorry for the noise.

No problem.
But what about patch? It’s ok for you?
I don’t see any Acked-by or Reviewed-by :-)

> 									Pavel
> 
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

-- 
Best regards,
Oleh Kravchenko

