Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 009D66C6D5E
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 17:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbjCWQZd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 12:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbjCWQZc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 12:25:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2068DF9;
        Thu, 23 Mar 2023 09:25:30 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FC299A8;
        Thu, 23 Mar 2023 17:25:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679588729;
        bh=wZtMUPdp5g8Lvp0WEwdfQw72f0XMEHo0y/0jQ6CFK38=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=sNPbw8tKLJN/4Snb/3QxVOZ6tttuw8X3IDKmuQfba2f5kpfP/bWOU/LeAYs9G0ETL
         Exe+zpVSoOqY2YwZGJzUCFSjmrh7mGPjRD8ybicTz3tCw59wlkHj3fqc4+RCPjh1sR
         R9nBHgam8Ud69jswhMaFVC6TAGdMGlrzS8/TTWG0=
Message-ID: <85997479-374b-f130-29dc-e713000d4348@ideasonboard.com>
Date:   Thu, 23 Mar 2023 16:25:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        lee@kernel.org, hdegoede@redhat.com, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-7-dan.scally@ideasonboard.com>
 <ZBw2ai0G0XCa1vky@duo.ucw.cz>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 6/8] leds: tps68470: Support the WLED driver
In-Reply-To: <ZBw2ai0G0XCa1vky@duo.ucw.cz>
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

Hi Pavel, thanks for taking a look

On 23/03/2023 11:22, Pavel Machek wrote:
> On Wed 2023-03-22 16:09:24, Daniel Scally wrote:
>> The TPS68470 PMIC provides a third LED driver in addition to the two
>> indicator LEDs. Add support for the WLED. To ensure the LED is active
>> for as long as the kernel instructs it to be we need to re-trigger it
>> periodically to avoid the IC's internal timeouts.
> Wow. No!
>
> If hardware does not wart you to burn the LED, it is not okay to just
> work around that. These are not designed for continuous operation.
>
>> diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
>> index 44df175d25de..abcd3494b1a8 100644
> Fun sha1 hash ;-).


heh yeh

>
>> @@ -52,11 +61,33 @@ enum ctrlb_current {
>>   	CTRLB_16MA	= 3,
>>   };
>>   
>> +/*
>> + * The WLED can operate in different modes, including a Flash and Torch mode. In
>> + * each mode there's a timeout which ranges from a matter of milliseconds to up
>> + * to 13 seconds. We don't want that timeout to apply though because the LED
>> + * should be lit until we say that it should no longer be lit, re-trigger the
>> + * LED periodically to keep it alive.
>> + */
> We don't want the LED to overheat. That takes precedence.
>
> Find out what are the maximum limits for on time at various current
> levels. LED framework should be used for torch mode, with current set
> such that unlimited operation is safe. V4L2 should be used for flash
> mode.


I did it this way because this is how the IC operates on my device whilst it's booted to 
Windows...but I suppose given they don't expose the LED outside of their Hello auth thing they can 
guarantee it's not being lit for too long - I confess that hadn't occurred to me. Anyway; I'll 
update this to re-trigger if the IC is in torch mode within the timeout (which the datasheet 
explicitly says you can do in torch mode; the current is much more heavily limited in that mode) and 
in the flash mode to update the brightness setting to 0 once the timeout expires so it reflects the 
actual state of the LED. Does that sound ok?

>
> BR,
> 										Pavel
