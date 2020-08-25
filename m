Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01B8C2513D0
	for <lists+linux-leds@lfdr.de>; Tue, 25 Aug 2020 10:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgHYIHT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Aug 2020 04:07:19 -0400
Received: from m12-18.163.com ([220.181.12.18]:46137 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbgHYIHO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 25 Aug 2020 04:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=zMFqi
        tvmokU7WJOHKlhJDoojMhKyDKyoilWEUYA3xEs=; b=IX7F62HeJ0itCSLv5HTN0
        IEZ+TPmC2vi89ze1LJVB7Jk6pcnFwnsIVjLkdQIsHVmY/Shm/ecEG30by8lW5fMc
        JVxTMUvxOHWd439Q8DhgNgw7YnekM/9QBg0crq/InGn2SpRFfX/3qnJOdt9uQBLc
        qO+jS0/riQIkC4J/MnUqj4=
Received: from [192.168.1.166] (unknown [58.33.102.45])
        by smtp14 (Coremail) with SMTP id EsCowAC3ErdGxkRfdL9eKw--.56621S2;
        Tue, 25 Aug 2020 16:05:27 +0800 (CST)
Subject: Re: [PATCH v2 2/2] leds: Add an optional property named 'sdb-gpios'
To:     Rob Herring <robh@kernel.org>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200808033731.15695-1-von81@163.com>
 <20200808033731.15695-2-von81@163.com> <20200824222154.GA3421740@bogus>
From:   Grant Feng <von81@163.com>
Message-ID: <d0ae6853-94a7-ca4e-61f1-e5119efa41bf@163.com>
Date:   Tue, 25 Aug 2020 16:05:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200824222154.GA3421740@bogus>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: EsCowAC3ErdGxkRfdL9eKw--.56621S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyUCr47AF13WF1fWF1xKrg_yoW8Xr4Upr
        s2kF10yF9IqFy7K3yjva4UJryUZa18AF4UKF4kXFyrG3WDuFySq3yIkrn8W3WUXrWxuay0
        vFsYgFW8Cr1UA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b7Xo7UUUUU=
X-Originating-IP: [58.33.102.45]
X-CM-SenderInfo: xyrqmii6rwjhhfrp/xtbBLQeLOlziZJTFsAAAsg
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 2020-08-25 6:21, Rob Herring wrote:
> On Sat, Aug 08, 2020 at 11:37:31AM +0800, Grant Feng wrote:
>> The chip enters hardware shutdown when the SDB pin is pulled low.
>> The chip releases hardware shutdown when the SDB pin is pulled high.
>>
>> Signed-off-by: Grant Feng <von81@163.com>
>> ---
>>   Documentation/devicetree/bindings/leds/leds-is31fl319x.txt | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl319x.txt b/Documentation/devicetree/bindings/leds/leds-is31fl319x.txt
>> index fc2603484544..e8bef4be57dc 100644
>> --- a/Documentation/devicetree/bindings/leds/leds-is31fl319x.txt
>> +++ b/Documentation/devicetree/bindings/leds/leds-is31fl319x.txt
>> @@ -16,6 +16,7 @@ Optional properties:
>>   - audio-gain-db : audio gain selection for external analog modulation input.
>>   	Valid values: 0 - 21, step by 3 (rounded down)
>>   	Default: 0
>> +- sdb-gpios : Specifier of the GPIO connected to SDB pin.
> We normally use 'shutdown-gpios' for a shutdown GPIO.
Thanks for the review.
>>   
>>   Each led is represented as a sub-node of the issi,is31fl319x device.
>>   There can be less leds subnodes than the chip can support but not more.
>> @@ -44,6 +45,7 @@ fancy_leds: leds@65 {
>>   	#address-cells = <1>;
>>   	#size-cells = <0>;
>>   	reg = <0x65>;
>> +	sdb-gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
>>   
>>   	red_aux: led@1 {
>>   		label = "red:aux";
>> -- 
>> 2.17.1
>>
>>

