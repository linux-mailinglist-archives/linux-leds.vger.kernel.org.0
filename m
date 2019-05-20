Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5982420E
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2019 22:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbfETUWx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 May 2019 16:22:53 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:42125 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725601AbfETUWx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 20 May 2019 16:22:53 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id 0B3A8238274F;
        Mon, 20 May 2019 22:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1558383771;
        bh=2xmSXtEnwV/n5ZpGUhtornq8eO64bo93MsQ8UFlWxSM=; l=2438;
        h=Subject:To:From;
        b=OusKKBR57cog9wTWGLZ5/doUeqpVagX+/qOoR3Q9hcBU5t3+aoAJL01z6tDGVSwlV
         esKrj5f1LEPSzuzd7PD2HRiOC63laQpWgBBlodXQBpEoV0L1YUYekiUVr0CSFivZEi
         91ab/mXWGp2ASXlWLoTYCkgAJenvxOOy/uWO8KKc=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=oss@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add binding for spi-byte LED.
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190513193307.11591-1-oss@c-mauderer.de>
 <20190519212501.GC31403@amd>
 <1850ba07-2c0c-2624-4ff3-fd507e49439f@c-mauderer.de>
 <99283573-2711-08b6-b95e-27732c175bb4@gmail.com>
From:   Christian Mauderer <oss@c-mauderer.de>
Message-ID: <b2315969-eef3-ad08-7551-c25a54049b28@c-mauderer.de>
Date:   Mon, 20 May 2019 22:22:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <99283573-2711-08b6-b95e-27732c175bb4@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <155838377135.51259.5421918138714938503@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Jacek, Pavel, Rob, Dan and everyone who I might have missed,

thanks for the great feedback, the patience while reviewing my patches
and for accepting it.

Although it needed a longer discussion than I expected (partially due to
my rush creating new versions at the beginning) it was a quite positive
experience and I'm quite ready to repeat it if some other opportunity
arises.

Best regards

Christian

On 20/05/2019 22:15, Jacek Anaszewski wrote:
> Hi Christian,
> 
> On 5/20/19 7:19 PM, Christian Mauderer wrote:
>> On 19/05/2019 23:25, Pavel Machek wrote:
>>> Hi!
>>>
>>>> From: Christian Mauderer <oss@c-mauderer.de>
>>>>
>>>> This patch adds the binding documentation for a simple SPI based LED
>>>> controller which use only one byte for setting the brightness.
>>>>
>>>> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
>>>> ---
>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>>>> b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>>>> new file mode 100644
>>>> index 000000000000..28b6b2d9091e
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>>>> @@ -0,0 +1,44 @@
>>>> +* Single Byte SPI LED Device Driver.
>>>
>>>> +The driver can be used for controllers with a very simple SPI
>>>> protocol:
>>>> +- one LED is controlled by a single byte on MOSI
>>>> +- the value of the byte gives the brightness between two values
>>>> (lowest to
>>>> +  highest)
>>>> +- no return value is necessary (no MISO signal)
>>>
>>> I'd expect this file to be named acb-spi-led.txt, or something, and
>>> talk about that u-controller, not its device driver -- as devicetree
>>> binding describes hardware, not driver.
>>>
>>> But you already have an ack from rob, so...
>>>                                     Pavel
>>>                                    
>>
>> So basically it would have been better to move the description that I
>> added to the c-file as "supported devices" in the device tree file?
>>
>> With both commits already acked: Rob and Pavel: Should I change that?
>>
>> If you both say yes, I would rename the file in the binding like
>> suggested and move the detailed protocol description from the driver to
>> the binding.
> 
> Let's not ramble on it. It is good as is.
> 
> Patch set applied to the for-next branch of linux-leds.git.
> 
> Thank you for your work.
> 
