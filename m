Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB502D53B2
	for <lists+linux-leds@lfdr.de>; Thu, 10 Dec 2020 07:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729637AbgLJGP4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Dec 2020 01:15:56 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:9860 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728264AbgLJGPx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Dec 2020 01:15:53 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cs3Xn5DBMz7C9l;
        Thu, 10 Dec 2020 14:14:33 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.9) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Dec 2020
 14:14:58 +0800
Subject: Re: [PATCH 1/1] dt-bindings: leds: add onboard LED triggers of
 96Boards
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Darshak Patel <darshak.patel@einfochips.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Guodong Xu <guodong.xu@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>
References: <20201210031203.1901-1-thunder.leizhen@huawei.com>
 <20201210033157.GA6466@thinkpad>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <704f703c-7ed9-6302-60df-7708d0633af0@huawei.com>
Date:   Thu, 10 Dec 2020 14:14:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201210033157.GA6466@thinkpad>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 2020/12/10 11:31, Manivannan Sadhasivam wrote:
> Hi,
> 
> On Thu, Dec 10, 2020 at 11:12:03AM +0800, Zhen Lei wrote:
>> For all 96Boards, the following standard is used for onboard LEDs.
>>
>> green:user1  default-trigger: heartbeat
>> green:user2  default-trigger: mmc0/disk-activity(onboard-storage)
>> green:user3  default-trigger: mmc1 (SD-card)
>> green:user4  default-trigger: none, panic-indicator
>> yellow:wlan  default-trigger: phy0tx
>> blue:bt      default-trigger: hci0-power
>>
>> Link to 96Boards CE Specification: https://linaro.co/ce-specification
>>
> 
> This is just a board configuration and there is absolutely no need to document
> this in common LED binding. But if your intention is to document the missing
No, I don't think so. The common just means the property linux,default-trigger
is common, but not it values. This can be proved by counter-proving：none of
the triggerrs currently defined in common.yaml is used by 96Boards.

> triggers, then you should look at the patch I submitted long ago.

I'm just trying to eliminate the warnings related to Hisilicon that YAML detected.
So I didn't pay attention to other missing triggers.

> 
> https://lore.kernel.org/patchwork/patch/1146359/
> 
> Maybe I should resubmit it again in YAML format. (thanks for reminding me :P)

Yes, I hope that you will resubmit it. After all, these false positives are
entirely due to YAML's failure to list all triggers. The DTS itself is fine.

By the way, the description of this patch I copied from your patch：
953d9f390365 arm64: dts: rockchip: Add on-board LED support on rk3399-rock960

That's why I Cc to you.

> 
> Thanks,
> Mani
> 
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> Cc: Darshak Patel <darshak.patel@einfochips.com>
>> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Dong Aisheng <aisheng.dong@nxp.com>
>> Cc: Guodong Xu <guodong.xu@linaro.org>
>> Cc: Wei Xu <xuwei5@hisilicon.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> Cc: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Heiko Stuebner <heiko@sntech.de>
>> ---
>>  Documentation/devicetree/bindings/leds/common.yaml | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
>> index f1211e7045f12f3..525752d6c5c84fd 100644
>> --- a/Documentation/devicetree/bindings/leds/common.yaml
>> +++ b/Documentation/devicetree/bindings/leds/common.yaml
>> @@ -97,6 +97,16 @@ properties:
>>          # LED alters the brightness for the specified duration with one software
>>          # timer (requires "led-pattern" property)
>>        - pattern
>> +        #For all 96Boards, Green, disk-activity(onboard-storage)
>> +      - mmc0
>> +        #For all 96Boards, Green, SD-card
>> +      - mmc1
>> +        #For all 96Boards, Green, panic-indicator
>> +      - none
>> +        #For all 96Boards, Yellow, WiFi activity LED
>> +      - phy0tx
>> +        #For all 96Boards, Blue, Bluetooth activity LED
>> +      - hci0-power
>>  
>>    led-pattern:
>>      description: |
>> -- 
>> 1.8.3
>>
>>
> 
> .
> 

