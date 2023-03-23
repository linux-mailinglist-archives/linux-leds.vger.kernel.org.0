Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD1076C652F
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 11:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbjCWKfS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 06:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbjCWKen (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 06:34:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22813A87F;
        Thu, 23 Mar 2023 03:31:12 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8540810B;
        Thu, 23 Mar 2023 11:31:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679567469;
        bh=jxtqNEGFOVWMOQ2HspI4fGFkckP44VUEPSce4ZVL5gA=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=IbBuiQq4cB1sQZCBchQYcIKRGA+6zNi5WFNeoDqkDdkzrVbfZ289nH0aSyh+wxn4l
         Cc5zdnKpG6A3sxBK1WYXYfeDAD35ZbNEVJKYxgUbfxyjAA55yaT9klwYk4t/hO/A+1
         OzEFtLG6NI+bkx8z6f3aOFigf+FDy9tN2Ap7lDa8=
Message-ID: <ebd90301-bc84-3810-3633-041978b8056d@ideasonboard.com>
Date:   Thu, 23 Mar 2023 10:31:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-9-dan.scally@ideasonboard.com>
 <ed161532-1f4b-74b2-1391-95d06e4c8200@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 8/8] platform/x86: int3472: Define LED lookup data for MS
 Surface Go
In-Reply-To: <ed161532-1f4b-74b2-1391-95d06e4c8200@redhat.com>
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

Hi Hans

On 22/03/2023 17:34, Hans de Goede wrote:
> Hi,
>
> On 3/22/23 17:09, Daniel Scally wrote:
>> Add LED lookup data to tps68470_board_data.c for the Microsoft
>> Surface Go line of devices.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>   .../x86/intel/int3472/tps68470_board_data.c    | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>> index 0d46a238b630..e2c53319e112 100644
>> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>> @@ -157,10 +157,27 @@ static const struct tps68470_led_platform_data surface_go_tps68470_led_pdata = {
>>   	.wledctl_disled2 = false,
>>   };
>>   
>> +static struct tps68470_led_lookups surface_go_tps68470_led_lookups = {
>> +	.n_lookups = 2,
>> +	.lookup_table = {
>> +		{
>> +			.provider = "tps68470-iled_a::indicator",
>> +			.dev_id = "i2c-INT347A:00",
>> +			.con_id = "privacy-led",
>> +		},
>> +		{
>> +			.provider = "tps68470-wled::indicator",
>> +			.dev_id = "i2c-INT347E:00",
>> +			.con_id = "privacy-led",
>> +		},
> So this feels wrong to me in 2 ways:
>
> 1. It is abusing .con_id = "privacy-led" to enable the WLED
>
> 2. You are not activating the front privacy LED for the IR projector. I have noticed on IPU6 devices that the _DSM listing GPIOs for the discrete INT3472 device lists a privacy-LED GPIO for the IR sensor too, which I so far have been guessing activates the actual privacy-LED. As I'm typing this I'm wondering if instead this is doing the same hack as you are doing here ?


Oh interesting; on IPU3 devices with the discrete INT3472 the IR cameras don't seem to have an LED 
GPIO in _DSM so we're not sure how to turn them on yet. I also have a Pro7 which is an IPU4 device, 
but that has the same problem as on the IPU3 ones - there's no privacy-led GPIO defined in _DSM and 
the _ON method for the camera's _PR0 resource just prints "PR Not Supported"...so we don't know how 
to use those yet. So interesting that the IPU6 ones work differently.


>
> Regardless I think it would be best to turn on the front privacy LED when the IR camera is used too, right ?


That does make a certain amount of sense yes - My only thought would be that this would be difficult 
to replicate to platforms that use _only_ discrete versions of the INT3472, because each sensor 
depends on a separate INT3472, so there wouldn't be an obvious way to automatically assign the 
privacy LED for the user facing camera to the IR camera since we couldn't use the board data method 
below. It might be surmountable using the location information in DSDT to decide whether it's on the 
same face as another camera which DOES have a privacy LED maybe...

>
> IMHO this should look like this (with either the media-core or the driver consuming "ir-led"):


The general principle of moving the IR led away from being treated as a privacy LED is ok by me - 
I'll work on that.

>
> static struct tps68470_led_lookups surface_go_tps68470_led_lookups = {
> 	.n_lookups = 3,
> 	.lookup_table = {
> 		{
> 			.provider = "tps68470-iled_a::indicator",
> 			.dev_id = "i2c-INT347A:00",
> 			.con_id = "privacy-led",
> 		},
> 		{
> 			/* Use regular front-sensor privacy LED for ir-sensor too */
> 			.provider = "INT33BE_00::privacy_led",
> 			.dev_id = "i2c-INT347E:00",
> 			.con_id = "privacy-led",
> 		},
> 		{
> 			.provider = "tps68470-wled::indicator",
> 			.dev_id = "i2c-INT347E:00",
> 			.con_id = "ir-led",
> 		},
> 	}
>
> Regards,
>
> Hans
>
>
