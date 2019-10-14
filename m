Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0C32D605B
	for <lists+linux-leds@lfdr.de>; Mon, 14 Oct 2019 12:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731517AbfJNKiF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Oct 2019 06:38:05 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:32924 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731249AbfJNKiF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Oct 2019 06:38:05 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9EAbtDU005926;
        Mon, 14 Oct 2019 05:37:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571049475;
        bh=2TKdF4XZsAi3cmbNxmwvJlAMNLqUp9nQSOsq0fzDzFU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=L7h8UGPzbB7kzMy5Je17fC1cYeqUlfyihdetkST2Pl71DRU8dqIEE0R7z8zlRT6qU
         lDQ3zaKO9dxLPgUZVpJkTf6YaVZFB1RLrAFrfSNqYKxk2XewFZnIYpjmQFKt2AnILG
         H7uFcryA8ovkvXu1mg1YX38DZDFj/AS1CIh8gTbA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9EAbtkl007537
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 14 Oct 2019 05:37:55 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 14
 Oct 2019 05:37:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 14 Oct 2019 05:37:49 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9EAbrc5100478;
        Mon, 14 Oct 2019 05:37:53 -0500
Subject: Re: [PATCH] leds: tlc591xx: update the maximum brightness
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>
References: <20190923100250.22326-1-jjhiblot@ti.com>
 <91864098-a6e8-e275-4b07-e4bb15469f78@gmail.com> <20191013114508.GI5653@amd>
 <844845d6-01fe-50c4-94cd-e19ce8a5d060@gmail.com>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <e551e3ea-5b75-9b6e-d898-b4516a090c54@ti.com>
Date:   Mon, 14 Oct 2019 12:37:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <844845d6-01fe-50c4-94cd-e19ce8a5d060@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 13/10/2019 18:36, Jacek Anaszewski wrote:
> On 10/13/19 1:45 PM, Pavel Machek wrote:
>> Hi!
>>
>>>> @@ -112,11 +113,11 @@ tlc591xx_brightness_set(struct led_classdev *led_cdev,
>>>>   	struct tlc591xx_priv *priv = led->priv;
>>>>   	int err;
>>>>   
>>>> -	switch (brightness) {
>>>> +	switch ((int)brightness) {
>>>>   	case 0:
>> Can we get a rid of the cast here? Do we need to move away from the
>> enum for the brightness?
> I at first also wanted to ask for dropping the cast but first tried
> to do it myself. Then I found out compiler (or sparse, I don't recall
> exactly) complains about TLC591XX_MAX_BRIGHTNESS not being a value of
> enum led_brighteess type. That's the reason for the cast Jean added,
> I presume.

Indeed that cast is to fix the warning.

JJ

>>> Added tag:
>>>
>>> Fixes: e370d010a5fe ("leds: tlc591xx: Driver for the TI 8/16 Channel i2c
>>> LED driver")
>>>
>>> and applied to the for-5.5 branch.
>> Actually, careful with the Fixes tag. -stable people will want to
>> apply it, and it may not be a good idea in this case. Maximum
>> brightness of 256 is pretty unusual, so I'd call this "a bit risky".
> I entirely disagree. Not seeing anything risky in that since
> max_brightness is also initialized to this value. If userspace properly
> uses the ABI, then it will be safe.
>
>> Best regards,
>> 									Pavel
>>
