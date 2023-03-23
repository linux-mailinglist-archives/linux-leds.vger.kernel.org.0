Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 037C46C60F6
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 08:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbjCWHnV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 03:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjCWHnU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 03:43:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D12310CE;
        Thu, 23 Mar 2023 00:43:19 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 371C29CA;
        Thu, 23 Mar 2023 08:43:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679557397;
        bh=I8gBOA993itXUZ5HgqdIP8McLe/2OFfqrLepYlH5zd4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Ho8clKoBOno7F5l7mRMXcNeJfMRg8Vv4maXxm728jM2ZVx7yjCQi8ZaCH7WfXUzVh
         uoiypEqpl+fYxV1jL85u+NLFbhT8QfCe8JhW/5kMd3LAJTC+ZambgwDs9qifrbFjdF
         OQqck6i4uW+euaByZjeoXpekVreI4YW0NsGegyGc=
Message-ID: <14b8e3e2-1a29-04c7-18a1-0eda82ec97fa@ideasonboard.com>
Date:   Thu, 23 Mar 2023 07:43:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 5/8] leds: tps68470: Refactor tps68470_brightness_get()
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-6-dan.scally@ideasonboard.com>
 <15dfc66b-83f7-4abf-1bc3-3bd9a2666aa1@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <15dfc66b-83f7-4abf-1bc3-3bd9a2666aa1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Morning Hans

On 22/03/2023 17:22, Hans de Goede wrote:
> Hi,
>
> On 3/22/23 17:09, Daniel Scally wrote:
>> We want to extend tps68470_brightness_get() to be usable with the
>> other LEDs supplied by the IC; refactor it to make that easier.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>   drivers/leds/leds-tps68470.c | 17 +++++++++--------
>>   1 file changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
>> index d2060fe4259d..44df175d25de 100644
>> --- a/drivers/leds/leds-tps68470.c
>> +++ b/drivers/leds/leds-tps68470.c
>> @@ -77,23 +77,24 @@ static enum led_brightness tps68470_brightness_get(struct led_classdev *led_cdev
>>   	int ret = 0;
>>   	int value = 0;
>>   
>> -	ret =  regmap_read(regmap, TPS68470_REG_ILEDCTL, &value);
>> -	if (ret)
>> -		return dev_err_probe(led_cdev->dev, -EINVAL, "failed on reading register\n");
>> -
>>   	switch (led->led_id) {
>>   	case TPS68470_ILED_A:
>> -		value = value & TPS68470_ILEDCTL_ENA;
>> -		break;
>>   	case TPS68470_ILED_B:
>> -		value = value & TPS68470_ILEDCTL_ENB;
>> +		ret =  regmap_read(regmap, TPS68470_REG_ILEDCTL, &value);
>> +		if (ret)
>> +			return dev_err_probe(led_cdev->dev, ret,
>> +					     "failed to read LED status\n");
> I realize this is a pre-existing problem, but I don't think we should
> be using dev_err_probe() in functions which are used outside the probe()
> path?


I had thought that this was being encouraged because of the standard formatting, but actually now I 
re-read the comment's function it's just "OK to use in .probe() even if it can't return 
-EPROBE_DEFER". My bad; I'll fix it.

>
> So maybe fix this up while at it and make this:
>
> 		if (ret) {
> 			dev_err(led_cdev->dev, ""failed to read LED status: %d\n", ret);
> 			return ret;
> 		}
>
>> +
>> +		value &= led->led_id == TPS68470_ILED_A ? TPS68470_ILEDCTL_ENA :
>> +					TPS68470_ILEDCTL_ENB;
>>   		break;
>> +	default:
>> +		return dev_err_probe(led_cdev->dev, -EINVAL, "invalid LED ID\n");
> idem.


idem? Sorry, I'm not following here.

>
> With those fixed:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> Regards,
>
> Hans
>
>
>
>>   	}
>>   
>>   	return value ? LED_ON : LED_OFF;
>>   }
>>   
>> -
>>   static int tps68470_ledb_current_init(struct platform_device *pdev,
>>   				      struct tps68470_device *tps68470)
>>   {
