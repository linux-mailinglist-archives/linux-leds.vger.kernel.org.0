Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A446EE57C
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2019 18:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbfKDREB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Nov 2019 12:04:01 -0500
Received: from mout.gmx.net ([212.227.17.21]:36097 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727861AbfKDREB (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 4 Nov 2019 12:04:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1572887016;
        bh=PI7dAw1uU03KDM2kwW+WwA/xzQ2h0kyFFuuTAXPmP5w=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=jIcuW1V9N/vp0Pp6ApmnBa6GDUV+x38frXo+Cp26LOHZYKBcp2S5r0LsBQtXDK38h
         znyF0vsjXAZYb0K2AXk1Ly37fCzmKUDZzPCYqfhOu0iAzIajKih0YE1E/g3ZOQfeIz
         8mujWGnkg8CwCDyobwRBkx9Njav/7KO8YCRm0EU8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.164] ([37.4.249.112]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N95iR-1hq5fU3Wtz-0164Ln; Mon, 04
 Nov 2019 18:03:35 +0100
Subject: Re: [PATCH] ARM: dts: bcm2837-rpi-cm3: Avoid leds-gpio probing issue
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Eric Anholt <eric@anholt.net>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1570964003-20227-1-git-send-email-wahrenst@gmx.net>
 <20191104090919.GC12355@duo.ucw.cz>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <6426d9b6-8ef1-903a-47fb-6844e29dffdd@gmx.net>
Date:   Mon, 4 Nov 2019 18:03:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104090919.GC12355@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:qX/zG45X4O/oDA29SB1fKSYqUQKAxW6UyeV3mrJ54AmiRk8x42G
 GeCQLS92oaCS6+ejAGhrH5tRSWBnLEEN3i0xwdkQQ2t3NDXvesDw3uP6lql1w4N46tGJa7d
 K+HBDBxJy8NCMO6SiGtGcVy/L2o6kUTUcNDMBZs9UMzNpj4NI6Du3s5GYbITiRLC0oYqImm
 NUONt5iURZ9CFbGoSkZoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AKi8FyK/A4k=:Zv18n1lZNDVxFqawjJrsWx
 3i+KX7zMM/HVqfGvzpMMbf+FVUYJB+4KFcORTlcbHvLDBmwnSYTw5JzEM5VCSr80raPDBv8od
 HzYkSy+Zor2VG8NedKvihSwAokRmJtHeCsaLr0DJKd4C4tCI3qk+oC1brqMwlgKvvHDAROCvX
 x8xybu+M70awLnyZOS/n+zDCgrA2W9M2SLs3a2nzJtbjVEl+HSYsN9yDmRTgjg0hOrf4vb45i
 uu9whvCd6VitDwzncHaBkiIsRk2wi5MT4cnc8FUe4FsvVcyQOewU+0325+d/xyiyyEDgIG2VW
 ZKFNCrzCqFQKi69azL6SWvtGd073+JVt1JX7jLeLiijQ3gO3O4h8hMVxRlwziBJ+84TZ+dKIb
 1zDBZjdeSIrNwJ/E8vLLyyaU4qi0/DWS5KmMp1N+qzMbQSYeG76ObJDUVqZWlv4xDq+jxRROX
 Hu29FVgNApGEq7O6xxuX5yYZ+dNXEGU95UHQ1qTIQmEAmzZlaNa1dXlbwrfJ3UK6SfwaQbFZe
 CeFuhkJFOduxGApViqeo/CGjcJ5n4pQF1Pl31B8voPlu1L+Tq2FuDNFFuxeQFs9Mh4624/2bW
 KMIQnqQRLGH9W46xMzbsl8H5jM86n+6kEQjwSPFhCWLJ/eUAsgndx/WqPKCf/Syhlax5EsKyZ
 9ETxCEkGF10OmX3qLxTGRmvjY+iu+n9b/gKHD6wASLmMsjZEAwwZSPiMgOQ94oZWJ/H+60mSa
 lwVlmVKV895BQQSDQf3A3Z8NZT8ptG4Wld+cYy6MvfjDgsSRpAwqu1lONv07PJJ2HsaoutNAv
 EJruYDJ92hXjYXSZutNFyqbiYck7fk2qR7QdlKFbUX/5JIOElIG0RtuZjnBMaMmXTrNr/ep3h
 LK+O3ZiNFAHqJIW0QY8aLx5kSypTnNRYWHUa0qQW5cvNmY67e3LrcLqjbuR/Mwi6inW4uuBbL
 6AwxF3IvWb4KhCjMTxTKfSEBxPlTpXOBNXSuqyw6dmIe4eJReTHsdmocnKmUhRPIvxH3aSpse
 bHoxVEQBmluuKaor6lpzkfh08B/1nqJt0ZiVcTPjy8VLRwnizoShGHl4DDftBZOfVPXBNFQUi
 JmAtPLfh7Dj0lVqfCNmhEK6qvxEB1AszMAh9hFD9OdWDB+/a+oDM0H6CvxH7jWsh25+dT+yoa
 yIcP/q25izAzqyIzHWIH/mp1G18HK990uhGRVkNMtmWM0sZb8gP7f1v0ORvXviQEo/PFqTAjb
 txLVVfBOOq2FwlAE7lA411ge+6OfqYG7baLUNEQg06vgOyDv1wvr9gFf6+dg=
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

Am 04.11.19 um 10:09 schrieb Pavel Machek:
> On Sun 2019-10-13 12:53:23, Stefan Wahren wrote:
>> bcm2835-rpi.dtsi defines the behavior of the ACT LED, which is available
>> on all Raspberry Pi boards. But there is no driver for this particual
>> GPIO on CM3 in mainline yet, so this node was left incomplete without
>> the actual GPIO definition. Since commit 025bf37725f1 ("gpio: Fix return
>> value mismatch of function gpiod_get_from_of_node()") this causing probe
>> issues of the leds-gpio driver for users of the CM3 dtsi file.
>>
>>   leds-gpio: probe of leds failed with error -2
>>
>> Until we have the necessary GPIO driver hide the ACT node for CM3
>> to avoid this.
>>
>> Reported-by: Fredrik Yhlen <fredrik.yhlen@endian.se>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> Fixes: a54fe8a6cf66 ("ARM: dts: add Raspberry Pi Compute Module 3 and IO board")
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>

thanks but this patch has already been applied.

Can i consider this as a "yes" to my intended question ( Is the behavior
change in leds-gpio desired )?

