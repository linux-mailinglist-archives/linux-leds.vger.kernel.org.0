Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 474396EE397
	for <lists+linux-leds@lfdr.de>; Tue, 25 Apr 2023 16:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233725AbjDYOE6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Apr 2023 10:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234070AbjDYOE5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Apr 2023 10:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2184210A
        for <linux-leds@vger.kernel.org>; Tue, 25 Apr 2023 07:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682431450;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EPQ+aZ2sW1R1Pm8AVWUGXu1yd14S2HDVdTV3O0XQWiY=;
        b=QJlo5hfwURCiZx2SBKeJGofHfw9Z5JxcFXvTkbPSFeuAmcOPibD0tsVxjVbMubnhmQDMsi
        mWRcejbWFaAJnEZVErUxRR3+B3EAYIvzXTD7TIZRbFMYyR8qW5yuT4Nv68OpzCitjZcQHp
        WKANyugkwCx3tpDaPSCYj/dm8kgYBZM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-URanCQ4cM4awJyVD27nKYA-1; Tue, 25 Apr 2023 10:03:58 -0400
X-MC-Unique: URanCQ4cM4awJyVD27nKYA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94ec76d7a26so535372266b.1
        for <linux-leds@vger.kernel.org>; Tue, 25 Apr 2023 07:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682431434; x=1685023434;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPQ+aZ2sW1R1Pm8AVWUGXu1yd14S2HDVdTV3O0XQWiY=;
        b=B+BIlwpgOHRtVWX2AGmbVB/8/1kgyR5nLXKkm1NxFJN28jdWQClRWyQyVcJYhqPBra
         ZgoO1iGh9gcxVJES4KxpeGNNoROv+9nhz2At+Ib0U62kvfWgBl7EyHRrCvL6JhT5T0z8
         zBhHkYcI1GdvtaGv646Xo6CqM5lgHCP7sLJCLdSK/KJfaWLb06yW9FqOMRk54hMTxGJd
         rBr7Qb/MzmKUKe0X70g2Ov7aiiwk/k2MEMvysws0uNTxBuaNYoR6l0+qPyIxNcRFjSAK
         hof0EtNk+Gu8hN0/83XzE2T6h8U9FkjYNwdM/zcwR838umL+0MfG3H02L/+eluxxF6hf
         Q9jw==
X-Gm-Message-State: AAQBX9fpjYT9/2Bhjms77jl3BIkww/DaivcSH1J3GTuJu2uJCW14q6Uf
        c0VcE4juKRRenoDJpTsrK9WMkzXl3bAgYk7rjP1j6MIyiaHn0yn6WLKkwBl8sMCdFAYQUwWJWJn
        BC3Gh94B1e7r4KNY+HhKaoA==
X-Received: by 2002:a17:906:7c41:b0:956:fdb6:bc77 with SMTP id g1-20020a1709067c4100b00956fdb6bc77mr12878834ejp.30.1682431434371;
        Tue, 25 Apr 2023 07:03:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zc4YdKUR/TAy4cFXuLdb/aeLn1txnka6RU+bVIQo43sRzNaDllZyLeEJU0aNotarb0WK36wQ==
X-Received: by 2002:a17:906:7c41:b0:956:fdb6:bc77 with SMTP id g1-20020a1709067c4100b00956fdb6bc77mr12878810ejp.30.1682431434082;
        Tue, 25 Apr 2023 07:03:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id hy12-20020a1709068a6c00b0094f09cd4658sm6897246ejc.71.2023.04.25.07.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 07:03:53 -0700 (PDT)
Message-ID: <bce6c285-60a7-d7ca-d9ea-202f3ef63d4d@redhat.com>
Date:   Tue, 25 Apr 2023 16:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/4] Fix oops about sleeping in led_trigger_blink()
Content-Language: en-US
To:     Lee Jones <lee@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-leds@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>
References: <20230412215855.593541-1-hdegoede@redhat.com>
 <20230420113653.GD970483@google.com>
 <9ba72334-6c3a-e8cd-0692-b30278c4a88d@redhat.com>
 <20230420135635.GE996918@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230420135635.GE996918@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Lee,

On 4/20/23 15:56, Lee Jones wrote:
> On Thu, 20 Apr 2023, Hans de Goede wrote:
> 
>> Hi Lee,
>>
>> On 4/20/23 13:36, Lee Jones wrote:
>>> On Wed, 12 Apr 2023, Hans de Goede wrote:
>>>
>>>> Hi All,
>>>>
>>>> Here is a patch series to fix an oops about sleeping in led_trigger_blink()
>>>> + one other small bugfix.
>>>>
>>>> Patches 1-3 should arguably have a:
>>>>
>>>> Fixes: 0b9536c95709 ("leds: Add ability to blink via simple trigger")
>>>>
>>>> tag, but Fixes tags tend to lead to patches getting automatically added
>>>> to the stable series and I would prefer to see this series get some
>>>> significant testing time in mainline first, so I have chosen to omit
>>>> the tag.
>>>
>>> With subjects with the word "fix" in it, they will be hoovered up by the
>>> Stable auto-picker anyway.
>>
>> Ok, in that case patch 3 should have:
>>
>> Fixes: 0b9536c95709 ("leds: Add ability to blink via simple trigger")
>>
>> Patches 1-2 are more preparation patches for this. Patch 2 does
>> fix another race, but I'm not sure we ever hit that.
>>
>> Can you add the fixes tag while merging these, or do you
>> want a v2 of this series ?
> 
> I'm holding out for either a Pavel review or some Tested-by's suggested
> by Jacek.

Hmm, ok. I have asked Yauhen to give this a test since they have hit
the oops/backtrace fixed by path 3/4 while testing the new leds-cht-wcove
driver too.

But Yauhen has the same hw as me (I have already tested this on
3 different laptop models).

Note that Jacek did already give his Reviewed-by:

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

I think the bug this fixes was never an issue before because only
very few triggers use regular blinking (rather then one-shot
blinking which always uses the sw-blink implementation).

To hit this you need to use one of the few triggers which
actually use regular-blinking in combination with a
driver which supports hw-blinking and where its blink_set
callbavck may sleep. It looks to me like no-one has hit
this combination before. Which is why there are no bug reports
for the issue and which also is why finding testers is going
to be tricky.

I think that the best thing to do here is add this series to -next
early in the upcoming cycle, so that it gets the maximum testing
time possible in -next.

Regards,

Hans

