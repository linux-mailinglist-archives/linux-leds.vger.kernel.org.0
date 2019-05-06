Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0838115040
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 17:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfEFPaE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 11:30:04 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:51497 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726520AbfEFPaE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 11:30:04 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id 89797238321C;
        Mon,  6 May 2019 17:29:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1557156600;
        bh=Apm5Pqo7KzNBmbTUtI4907tXkIKI5APU0UQP18XhlBY=; l=1197;
        h=Subject:To:From;
        b=v4I2x86mAZrVJ/DDAQdN3vpS6C95X6EWkvWfls1SJDz1nGxGss0zJiDuIO8fJn5ll
         iz/gAivvYVbz1zS8rN5dbbG4gRwSlIiO6iiP5DRZTuGpDNiBRkCQK+HoKZq3Tl/4BS
         nkah0Fp0W6eclkmnw9uhYDy6wtQTKxW9BTapFWl4=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=oss@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
Subject: Re: [PATCH v3 2/2] leds: spi-byte: add single byte SPI LED driver
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <20190505200022.32209-2-oss@c-mauderer.de>
 <8c150278-4bf6-4202-998e-4d82a2a3cd3c@ti.com>
 <3f0d7a10-a67e-a2c2-98fe-a487493b8f2c@c-mauderer.de>
 <fb0bc2a0-1311-3a45-04db-5cddcba48392@ti.com> <20190506151500.GA6221@amd>
From:   Christian Mauderer <oss@c-mauderer.de>
Message-ID: <3de252f0-de98-bec2-b233-8be1d38a4671@c-mauderer.de>
Date:   Mon, 6 May 2019 17:29:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506151500.GA6221@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <155715659987.131028.8572111890407710116@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 06/05/2019 17:15, Pavel Machek wrote:
> Hi!
> 
>>> Of course it would have been possible to make it a lot more universal by
>>> for example adding a prefix, a bit mask or other word lengths. But that
>>> would have added a lot of complexity without any actual application.
>>>
>>
>> I have to disagree here.  If this is supposed to be a universal SPI byte driver that
>> needs special handling then it is either needs to be created in a universal way or needs to be made
>> target specific.
>>
> 
> Let him be. The driver is good.
> 
> If some hardware needs more flexibility, we add it.
> 
> No need to have 1000 releases of everything.
> 
> 									Pavel
> 

Hello Pavel,

thanks for the support.

It's a pure hobby project so I have the time to add useful features or
to improve the description to make it clear what the drivers intention
is. So if we find a more useful set of features it's a good idea to
discuss it.

By the way: Although I haven't written a Linux driver yet it's not my
first open source project. So I know that there can be a lot of
different opinions and sometimes a lot of revisions. So no big risk of
scaring me away.

Best regards

Christian
