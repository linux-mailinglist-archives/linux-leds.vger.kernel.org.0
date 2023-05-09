Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5539A6FC22D
	for <lists+linux-leds@lfdr.de>; Tue,  9 May 2023 10:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbjEII7i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 9 May 2023 04:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234811AbjEII7h (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 9 May 2023 04:59:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB172119
        for <linux-leds@vger.kernel.org>; Tue,  9 May 2023 01:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683622730;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jpJ9q3xp1jwtZfMH60gHFWXnmsyIJXbmgNpkCyP+bvo=;
        b=d1aCOC4p0Bc2cx3wbByvKRRsICWAEoeUjCb1OyyIXRCdIHZAp8L7SgDmGZ3xu4N67roESw
        00egT17fLjgWSYvQM2O84FsAzaladi0pdPCVjpnn9SXZ22/loYnfApX4ocwUjiQuqbbeMA
        EoDlmLgZvgUy2yXJnMPqDRmPnkfYE3s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-yQanPBuUMF-l4bCGdDfBcA-1; Tue, 09 May 2023 04:58:48 -0400
X-MC-Unique: yQanPBuUMF-l4bCGdDfBcA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9532170e7d3so536707166b.0
        for <linux-leds@vger.kernel.org>; Tue, 09 May 2023 01:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683622728; x=1686214728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jpJ9q3xp1jwtZfMH60gHFWXnmsyIJXbmgNpkCyP+bvo=;
        b=PTXqJrCw/BbGUWVYgVMBt5U954QMTVTUepJcWBIB8ZGBUUHiuJcVGIhwMF6OtY7/eo
         StsOMC/uolEHLXnR4Rh1R4bm71o1Eep/9lM7y6y+PHhdpuHl+cQHU+xwyQ8uBS9DJIUW
         jInkQgvhTiJRnxmFbs2JNjRtpb7UxcujUsfo0HVHG2DfmuHzeGmBZh1Qx3LWnb1ROyLt
         6JBgqiLXyM6gT1mIR5OY3TH/UAD0ldwVSB+a3rbMFsPSJczj676mnDVElUWTiRdeGAv6
         ZlkFJbhpnMOWFoRJb+GLNAKReGQMbsvl0auSzckqvK5WiSfmKKWjx0+yEx1LcTE07p4l
         IFFw==
X-Gm-Message-State: AC+VfDzTqi32MIz0Z5zMLYAH3NDLdaMPbDetgbrcMSdxMWPeOY9rEh+P
        J345I8EI4sH58XueHj2fdu+vtDSjrJLRzP3MPsCots0+VVi/7BQ09sbMta3qyxFr6KwKRagvGbN
        yYnokLrDfDAWlSpvXcm8rMQ==
X-Received: by 2002:a17:907:3f9e:b0:966:54ac:17d7 with SMTP id hr30-20020a1709073f9e00b0096654ac17d7mr6840122ejc.76.1683622727765;
        Tue, 09 May 2023 01:58:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5wz5lG8+tP13jmzyW67EJ6PSt1riSG7lQ9WfFfiXCfPvpN1wfhkF4XDfuKk050p0ndQJbkZQ==
X-Received: by 2002:a17:907:3f9e:b0:966:54ac:17d7 with SMTP id hr30-20020a1709073f9e00b0096654ac17d7mr6840108ejc.76.1683622727447;
        Tue, 09 May 2023 01:58:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kt18-20020a170906aad200b00965cd3a037fsm1048256ejb.112.2023.05.09.01.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 01:58:47 -0700 (PDT)
Message-ID: <ffefad9c-30e5-811e-045c-9ad399066c95@redhat.com>
Date:   Tue, 9 May 2023 10:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/4] Fix oops about sleeping in led_trigger_blink()
Content-Language: en-US, nl
To:     Lee Jones <lee@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-leds@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>
References: <20230412215855.593541-1-hdegoede@redhat.com>
 <20230420113653.GD970483@google.com>
 <9ba72334-6c3a-e8cd-0692-b30278c4a88d@redhat.com>
 <20230420135635.GE996918@google.com>
 <bce6c285-60a7-d7ca-d9ea-202f3ef63d4d@redhat.com>
 <20230426143439.GQ50521@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230426143439.GQ50521@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Lee,

On 4/26/23 16:34, Lee Jones wrote:
> On Tue, 25 Apr 2023, Hans de Goede wrote:
> 
>> Hi Lee,
>>
>> On 4/20/23 15:56, Lee Jones wrote:
>>> On Thu, 20 Apr 2023, Hans de Goede wrote:
>>>
>>>> Hi Lee,
>>>>
>>>> On 4/20/23 13:36, Lee Jones wrote:
>>>>> On Wed, 12 Apr 2023, Hans de Goede wrote:
>>>>>
>>>>>> Hi All,
>>>>>>
>>>>>> Here is a patch series to fix an oops about sleeping in led_trigger_blink()
>>>>>> + one other small bugfix.
>>>>>>
>>>>>> Patches 1-3 should arguably have a:
>>>>>>
>>>>>> Fixes: 0b9536c95709 ("leds: Add ability to blink via simple trigger")
>>>>>>
>>>>>> tag, but Fixes tags tend to lead to patches getting automatically added
>>>>>> to the stable series and I would prefer to see this series get some
>>>>>> significant testing time in mainline first, so I have chosen to omit
>>>>>> the tag.
>>>>>
>>>>> With subjects with the word "fix" in it, they will be hoovered up by the
>>>>> Stable auto-picker anyway.
>>>>
>>>> Ok, in that case patch 3 should have:
>>>>
>>>> Fixes: 0b9536c95709 ("leds: Add ability to blink via simple trigger")
>>>>
>>>> Patches 1-2 are more preparation patches for this. Patch 2 does
>>>> fix another race, but I'm not sure we ever hit that.
>>>>
>>>> Can you add the fixes tag while merging these, or do you
>>>> want a v2 of this series ?
>>>
>>> I'm holding out for either a Pavel review or some Tested-by's suggested
>>> by Jacek.
>>
>> Hmm, ok. I have asked Yauhen to give this a test since they have hit
>> the oops/backtrace fixed by path 3/4 while testing the new leds-cht-wcove
>> driver too.
>>
>> But Yauhen has the same hw as me (I have already tested this on
>> 3 different laptop models).
>>
>> Note that Jacek did already give his Reviewed-by:
>>
>> Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>>
>> I think the bug this fixes was never an issue before because only
>> very few triggers use regular blinking (rather then one-shot
>> blinking which always uses the sw-blink implementation).
>>
>> To hit this you need to use one of the few triggers which
>> actually use regular-blinking in combination with a
>> driver which supports hw-blinking and where its blink_set
>> callbavck may sleep. It looks to me like no-one has hit
>> this combination before. Which is why there are no bug reports
>> for the issue and which also is why finding testers is going
>> to be tricky.
>>
>> I think that the best thing to do here is add this series to -next
>> early in the upcoming cycle, so that it gets the maximum testing
>> time possible in -next.
> 
> Agree.  Let's revisit this once the merge-window closes.

The merge-window has closed now, and Yauhen has given their tested-by:

Tested-by: Yauhen Kharuzhy <jekhor@gmail.com>

Lee, can you merge this now please so that this gets the maximum
possible time for testing in linux-next ?

Regards,

Hans

