Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0981123E47
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2019 19:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390154AbfETRTH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 May 2019 13:19:07 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:43473 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733201AbfETRTH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 20 May 2019 13:19:07 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id C23A0238276A;
        Mon, 20 May 2019 19:19:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1558372744;
        bh=kxIJG27u7eVKtYS4db3xT3wLRcFHn7Lvz4p6qFUlz+I=; l=1593;
        h=Subject:To:From;
        b=wDxdv7u4l7MyCgkBom+hx+EOAgwngc3f+IEhC+oFKOCFiDrViMV44j0uJs2TAO/Wr
         K5/zGrMyMpCjLghNlFZYrF6qz7KmxxvjnDbAdrsaSpzIYzQxbZZJwlpxYRj6NQGIp1
         JLEwqFsGfkJ7lEVd+eTScYOtuGnd1uopjj2LoDfA=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=oss@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add binding for spi-byte LED.
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190513193307.11591-1-oss@c-mauderer.de>
 <20190519212501.GC31403@amd>
From:   Christian Mauderer <oss@c-mauderer.de>
Message-ID: <1850ba07-2c0c-2624-4ff3-fd507e49439f@c-mauderer.de>
Date:   Mon, 20 May 2019 19:19:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190519212501.GC31403@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <155837274415.37172.7452360277010363700@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 19/05/2019 23:25, Pavel Machek wrote:
> Hi!
> 
>> From: Christian Mauderer <oss@c-mauderer.de>
>>
>> This patch adds the binding documentation for a simple SPI based LED
>> controller which use only one byte for setting the brightness.
>>
>> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
>> ---
> 
>> diff --git a/Documentation/devicetree/bindings/leds/leds-spi-byte.txt b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>> new file mode 100644
>> index 000000000000..28b6b2d9091e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>> @@ -0,0 +1,44 @@
>> +* Single Byte SPI LED Device Driver.
> 
>> +The driver can be used for controllers with a very simple SPI protocol:
>> +- one LED is controlled by a single byte on MOSI
>> +- the value of the byte gives the brightness between two values (lowest to
>> +  highest)
>> +- no return value is necessary (no MISO signal)
> 
> I'd expect this file to be named acb-spi-led.txt, or something, and
> talk about that u-controller, not its device driver -- as devicetree
> binding describes hardware, not driver.
> 
> But you already have an ack from rob, so...
> 									Pavel
> 									

So basically it would have been better to move the description that I
added to the c-file as "supported devices" in the device tree file?

With both commits already acked: Rob and Pavel: Should I change that?

If you both say yes, I would rename the file in the binding like
suggested and move the detailed protocol description from the driver to
the binding.

Best regards

Christian





