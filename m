Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32F66449EC1
	for <lists+linux-leds@lfdr.de>; Mon,  8 Nov 2021 23:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240786AbhKHWv7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Nov 2021 17:51:59 -0500
Received: from phobos.denx.de ([85.214.62.61]:37942 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233784AbhKHWv4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 8 Nov 2021 17:51:56 -0500
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DECC2838CB;
        Mon,  8 Nov 2021 23:49:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1636411750;
        bh=s/LcuXr3FmnV7ab1ALF7iL3CnFw4dXcM0MhNOAY6CvU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Qyaz5iRtlDdppkfdoCm4b8IBpm6/lYAJKkUqN8aUaU5YrA228SeIRZGhR5Tr1H9GZ
         fVr62GQr2+v9XD+0ZmhHZSJn6nP28jS5W7febqrp0Mm4++sAYoUmkFU0eGZONTX4Zg
         vNBRGiIR30wKmECvNlgfhP87RpwQiGyaqdSKNCb7IQYSQLwWa2vXUTuxgFAR8Nko2W
         bxlYA7axnGCHoulWD5BYNxyGXS9UPvrchSw4dFiK3NYjBUF33p04i/VDMXg0H66NFT
         jc2Q72uBdOkAT6LC0iIOjQEaakA7pumB41gaRhxbepCFfc/SJ3AoSypbcBinrCc0LA
         jh5/9ekiRGZUQ==
Subject: Re: [PATCH 1/2] dt-bindings: leds: Document none trigger
To:     Rob Herring <robh@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        devicetree@vger.kernel.org
References: <20211024002358.225750-1-marex@denx.de>
 <20211024084135.GB32488@duo.ucw.cz>
 <e3ea7f1d-662c-32ef-4d3d-62972af699b6@denx.de>
 <YYljmDDXH5zvBgjC@robh.at.kernel.org>
From:   Marek Vasut <marex@denx.de>
Message-ID: <b99715e7-4bf8-26e4-a081-6d434ce4ec06@denx.de>
Date:   Mon, 8 Nov 2021 23:49:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYljmDDXH5zvBgjC@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/8/21 6:51 PM, Rob Herring wrote:
> On Sun, Oct 24, 2021 at 08:05:55PM +0200, Marek Vasut wrote:
>> On 10/24/21 10:41 AM, Pavel Machek wrote:
>>> Hi!
>>>
>>>> There is a trigger called "none" which triggers never, add it to the
>>>> list of valid trigger values.
>>>
>>> We can do this, but is it useful? If you avoid putting trigger
>>> property, it will do the same thing.
>>
>> It's not that simple. If you have a DT which specifies a trigger type and a
>> DTO which overrides that trigger type, then the DTO cannot remove the
>> trigger from the base DT, it has to set trigger type to "none". So I believe
>> there is a valid use case for existence of the "none" type.
> 
> Sounds like an incorrect partitioning of base and overlays IMO.

Note that you might not have control over the base DT.

> There's also already /delete-property/ directive though I'm not sure if
> that's supported in overlays.

How do you encode /delete-property/ into the DT overlay blob .dtbo ?
I thought that /delete-property/ and /delete-node/ was a DTC directive 
and the DT blob has no way to represent either ?
