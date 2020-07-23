Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2600222B842
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 22:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgGWU5s (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 16:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgGWU5s (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2020 16:57:48 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38966C0619D3
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2020 13:57:48 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id rk21so7854644ejb.2
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2020 13:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MlA/d8/glf9NgkF5AsbAkMG9N/DsDYVi/SAVfDuPuks=;
        b=ZxRNmkXcthZgjPkccYnA5LTAeqqdxx16Hzbc5ejJz9/pwWQa6lCb/346DJfV5L+0Kr
         4oiSU6bSC4TAWPfRW/bBCX4i9R/G0gx+rXwimPi/G5vGk05IjtYxx+2SN6QERYsof0PY
         qHs8BChgeNv4ciY4fb3I5hMPXgIBxVd4DhLP9xu8oz9Wgw6jcmiwzTo4xrEBgqX7IKCW
         EBs7IOHwaolzsjMGvpfzX1Ll3i9hRkbjxRMfOzbnG7HVGhpvvf7U3WzvuRRzgk0ht8Y2
         PZjHfnNxhHgYbhPCX5dtmtChHkS+KUn5lJdAmnSQCzSz4tcJbIa12wSDvBdWwctU6kSY
         HmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MlA/d8/glf9NgkF5AsbAkMG9N/DsDYVi/SAVfDuPuks=;
        b=L5f6e+xz84XaRSulzlwcnbeWXoA+zGcZtyGv+3YY/GeZdLJlvZV3rdR5Y0fSMB9ACi
         ff1c3v+XKIhurl1lVi2iEKaRPt7/zV7CgH3VnMq9RdPjpViiuAluMZ5zabxFro2xStDc
         YIyEbRcvLoBVRKgMuU4/mh665EvAFAJn68NPSum9VB4d7ezceVy+U1BXzOE6aMBCsKOi
         1OCliHoTQuXaK9fdQtYSK2j/nGBYWzBJ1aigiOcfb1fKKgSfK0fQQopg2k6OoUf2PC+Z
         eV6H4fbHo/dneE1LdBZM0kxndPGUCwTTijhACIxRQPtTYrY/6kxsNR9dZj76+8LGfPyp
         av8g==
X-Gm-Message-State: AOAM530Fgx/3QZBqJcK0gvcph7sQ4vqrgNBTAAJnvteVF+5t/HBDYzZM
        4bWt0swQGzHF4f34054Jp0k=
X-Google-Smtp-Source: ABdhPJwclbz9CKOw7UMvM9DWo+/ZRgMz7/ua4EzG9+JqJCrVoXKCeUz+dAqp3qsn7X11gPa+wJxEZA==
X-Received: by 2002:a17:906:ca4c:: with SMTP id jx12mr2145856ejb.231.1595537866874;
        Thu, 23 Jul 2020 13:57:46 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a882:7627:8b01:53ad? ([2a01:110f:b59:fd00:a882:7627:8b01:53ad])
        by smtp.gmail.com with ESMTPSA id m6sm2718053ejq.85.2020.07.23.13.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 13:57:46 -0700 (PDT)
Subject: Re: [PATCH] leds: add orange color
To:     Pavel Machek <pavel@ucw.cz>
Cc:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
References: <20200723125751.4045-1-marek.behun@nic.cz>
 <20200723193908.GA26165@amd> <57981a86-dd1b-09ee-8035-4c84d4c990df@gmail.com>
 <30b1f173-c687-9fe2-92bd-fc53f776cb77@gmail.com>
 <20200723201657.nb5dm2aqmjnizmpq@duo.ucw.cz>
 <8b36be51-3a75-458d-4fed-d730621e1547@gmail.com>
 <20200723203953.iijldzbnfqh36mex@duo.ucw.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <854ee2f0-4dd1-b665-f216-bff33ab3b571@gmail.com>
Date:   Thu, 23 Jul 2020 22:57:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723203953.iijldzbnfqh36mex@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/23/20 10:39 PM, Pavel Machek wrote:
> Hi!
> 
>>>>>>> Many network devices have LEDs with green and orange color, instead of
>>>>>>> green and yellow.
>>>>>>
>>>>>> Is it likely that we see device having both yellow and orange LEDs?
>>>>>
>>>>> Why should we?
>>>>
>>>> This question actually refers to the below sentence...
>>>>
>>>>>> I'd simply lie and say those LEDs are yellow...
>>>>
>>>> So, why do you think we should strive to limit the number
>>>> of color definitions?
>>>
>>> Because there's infinitely many colors :-). And programmers are bad at
>>> differentiating them. You can't really tell wavelength of light by
>>> looking at it.
>>>
>>> I mean.. yes, maybe we can add orange, pink, green-blue, violet,
>>> ... white at different temperatures ...
>>>
>>> It will be rather long list.
>>
>> I think that we should allow setting the LED color name after
>> what manufacturer claims it is.
> 
> Well, someone can try to compile list of common colors, and convince
> me that this list is good enough...

It is not necessary, we can add colors as the need arises.

> ...but really, unless there's device where there are leds of
> yellow/orange color... it may be easier to keep the current list.

Yellow has been available since the inception of the led_colors array,
so if we have that, then why we should not have orange?

> IOW "are we solving real problem by introducing orange color"?

Yes, we allow to accurately describe LEDs available
on the market.

And reversing the question - are we solving real problem by
preventing introduction of orange color?

-- 
Best regards,
Jacek Anaszewski
