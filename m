Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6813123CB
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2019 23:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbfEBVCy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 May 2019 17:02:54 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38551 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfEBVCx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 May 2019 17:02:53 -0400
Received: by mail-lf1-f65.google.com with SMTP id v1so2939353lfg.5;
        Thu, 02 May 2019 14:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6crve4IlZrMXLSDasE9kaBscaqPspzUe9E6mxdE0XW4=;
        b=GnjKc88ToLkLdpRtAJpGY0N1EGQIkV0iKM+zml2yJTcEk9SIN+y00yToVUqXH2PUNl
         fAQjnI63F3GGiG4oaA7dOZwDKWZfPxSVaEhdDKSOxTrDWtrcntS9wV7he+kNJDczGKn8
         25oasK9cMTTxusxutKqiTRFmWyxcdgsESpAx2F57vrgh/mhQuJ8RhgU4uKBvMPDbCe7t
         xi3KCFNOqNpTbqqnd8cexQgPTvhlkVRNQ8sKAODRhqK8/hkabHcrYPUrVKnDl5T4Fx82
         wt1JQwfgY2EC0wxRXJp447FDtXeNUhBTe4tOyicj4l9lAIi3wKw3NLiC/siF4FneKk02
         5k5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6crve4IlZrMXLSDasE9kaBscaqPspzUe9E6mxdE0XW4=;
        b=gFPW/V5ALPfUim7SYgxRxht2LPTpVh2U8cxU4okzqoSY93D2kNnbg/5mpC+wOI2bIb
         bWJE7MRMmusu3A2f3dwV9YYEr6IOOPP3OmF5OBP83ACsz4z10QEISLqzbFmQA8K52EcH
         SKJRpOLl02/blKctAqHNCkA1M8ktrjoyK8Nn9czzmY7PyRJrMROtofGDZfQ5YtVfgCKI
         PcX4HU8mbIJ33EzJvhq447tgJi4aIhuf+tfFEGwBeY8SKoKZRMxw83nozz2zxDt24acx
         rGvBth8HoDFAOCJvw2Go7Hz6tw4WMdzfCULjTVoACqT+p7LHenSvgJr5dI6m7LkDLcTe
         RRjg==
X-Gm-Message-State: APjAAAXWcQ6hWoq2VLET4tTqi/7t2ZBKh648vUmv4iSH+pTum3lx0rRp
        tgZ+3wPEH46KSfMxCbkQSyB/PcX6
X-Google-Smtp-Source: APXvYqwDRJHbEhrYAs31zwL43P+4BUb4FJyM6/7+sYKxTRBkhqg4195WfE/XVbPy/+xgC3wgVQA0VA==
X-Received: by 2002:ac2:485a:: with SMTP id 26mr3125406lfy.23.1556830971999;
        Thu, 02 May 2019 14:02:51 -0700 (PDT)
Received: from [192.168.1.19] (chq152.neoplus.adsl.tpnet.pl. [83.31.14.152])
        by smtp.gmail.com with ESMTPSA id k15sm18049lje.21.2019.05.02.14.02.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 14:02:51 -0700 (PDT)
Subject: Re: [PATCH] leds: avoid races with workqueue
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, ibm-acpi@hmh.eng.br,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, stable@kernel.org
References: <20190427193411.GA9709@amd>
 <2578a614-beb9-1c9d-9f74-208a8a7ab64f@gmail.com> <20190427223207.GA3585@amd>
 <d2373c8b-5c66-c875-16c7-0c5a93470793@gmail.com> <20190429152259.GB10501@amd>
 <36e1fdd7-a220-4b0d-d558-829f522b0841@gmail.com> <20190501183600.GA20452@amd>
 <9337b5fb-0ff8-9925-29e6-a781884af861@gmail.com> <20190502191321.GB4845@amd>
 <62a99fe8-5c61-c681-3f9d-54e0a27a63d2@gmail.com> <20190502200606.GC4845@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <564697f8-ad02-6933-56e8-b3b19053d63d@gmail.com>
Date:   Thu, 2 May 2019 23:02:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502200606.GC4845@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/2/19 10:06 PM, Pavel Machek wrote:
> On Thu 2019-05-02 21:28:06, Jacek Anaszewski wrote:
>> On 5/2/19 9:13 PM, Pavel Machek wrote:
>>> Hi!
>>>
>>>>>>> +++ b/drivers/leds/led-class.c
>>>>>>> @@ -57,6 +57,7 @@ static ssize_t brightness_store(struct device *dev,
>>>>>>>   	if (state == LED_OFF)
>>>>>>>   		led_trigger_remove(led_cdev);
>>>>>>>   	led_set_brightness(led_cdev, state);
>>>>>>> +	flush_work(&led_cdev->set_brightness_work);
>>>>>>
>>>>>> Is this really required here? It creates non-uniform brightness
>>>>>> setting behavior depending on whether it is set from sysfs or
>>>>>> by in-kernel call to led_set_brightness().
>>>>>
>>>>> This fixes the echo 0 > brightness; echo 1 > brightness. It has to be
>>>>> at a place where we can sleep.
>>>>>
>>>>> If you have better idea, it is welcome, but it would be good to fix
>>>>> the bug.
>>>>
>>>> Currently not, so I applied the patch in this shape.
>>>
>>> Thanks!
>>>
>>> This is actually something that makes sense for stable.. perhaps the
>>> bots can pick it up.
>>
>> I was thinking of it, but finally decided to submit this patch
>> to linux-stable when it will prove not having side effects.
>>
>> But if you think it is ready for stable then I can add
>> relevant "Fixes" tag. Do you think that below will be an appropriate
>> base to refer to?
>>
>> Fixes 1afcadfcd184 ("leds: core: Use set_brightness_work for the blocking
>> op")
> 
> Yes, that looks right. If you can add fixes: and cc: stable tags, the
> rest should happen automagically.

Cc: stable@kernel.org is exactly for what it claims - sending a copy
to that list.

"Fixes:" seems to be always enough for the bots to pick a patch.

Tag added.

-- 
Best regards,
Jacek Anaszewski
