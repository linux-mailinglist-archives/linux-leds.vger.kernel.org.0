Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC4EC96590
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2019 17:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730582AbfHTPwE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Aug 2019 11:52:04 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48870 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729975AbfHTPwE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Aug 2019 11:52:04 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7KFpsoJ045457;
        Tue, 20 Aug 2019 10:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566316314;
        bh=mQmSNLiAv7WjKYdDgBHw/fTkrXppz3KpCW7IMW2zTlk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=IxyZsOWY2xz4tqMMdjkUH6AF732j0pa642USEgsIU3MigwDJMEK0oIKnwp31YyXum
         gL6fnc6iHTvyvt8cvuSVvrvGhfr+lnuivglkOkSfA/Bi1cvwdF5A40STfuIp2jjGPQ
         62nb12zB65wEzbuX8ubKSkCX62eqkhnV/K9p7VY8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7KFps2u076566
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Aug 2019 10:51:54 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 10:51:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 10:51:53 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7KFprlX123421;
        Tue, 20 Aug 2019 10:51:53 -0500
Subject: Re: [PATCH v2 4/4] leds: lm3532: Add full scale current configuration
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <tony@atomide.com>, <sre@kernel.org>,
        <nekit1000@gmail.com>, <mpartap@gmx.net>, <merlijn@wizzup.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190813181154.6614-1-dmurphy@ti.com>
 <20190813181154.6614-4-dmurphy@ti.com> <20190819105519.GG21072@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <1f4efd9f-8234-161a-2c05-c5bae2720207@ti.com>
Date:   Tue, 20 Aug 2019 10:51:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819105519.GG21072@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

Thanks for the review

On 8/19/19 5:55 AM, Pavel Machek wrote:
> Hi!
>
>> Allow the full scale current to be configured at init.
>> Valid rangles are 5mA->29.8mA.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> @@ -121,6 +125,7 @@ struct lm3532_als_data {
>>    * @mode - Mode of the LED string
>>    * @ctrl_brt_pointer - Zone target register that controls the sink
>>    * @num_leds - Number of LED strings are supported in this array
>> + * @full_scale_current - The full-scale current setting for the current sink.
>>    * @led_strings - The LED strings supported in this array
>>    * @label - LED label
>>    */
>> @@ -130,8 +135,9 @@ struct lm3532_led {
>>   
>>   	int control_bank;
>>   	int mode;
>> -	int ctrl_brt_pointer;
>>   	int num_leds;
>> +	int ctrl_brt_pointer;
>> +	int full_scale_current;
>>   	u32 led_strings[LM3532_MAX_CONTROL_BANKS];
>>   	char label[LED_MAX_NAME_SIZE];
>>   };
> No need to move ctrl_brt_pointer... to keep order consistent with docs.

OK I will reset the patches and get rid of that change.  I think this 
got moved when I applied the v1 patch.


>> +		fs_current_val = led->full_scale_current - LM3532_FS_CURR_MIN /
>> +				 LM3532_FS_CURR_STEP;
> The computation is wrong ... needs () AFAICT.

Hmm. Doesn't order of operations take precedence?

I will add the () unless checkpatch cribs about them

Dan


>
> Best regards,
> 									Pavel
