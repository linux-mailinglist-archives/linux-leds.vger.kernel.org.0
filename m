Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA0A509CB
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2019 13:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbfFXL3Y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Jun 2019 07:29:24 -0400
Received: from mail-qk1-f170.google.com ([209.85.222.170]:32918 "EHLO
        mail-qk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727525AbfFXL3Y (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Jun 2019 07:29:24 -0400
Received: by mail-qk1-f170.google.com with SMTP id r6so9438788qkc.0;
        Mon, 24 Jun 2019 04:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=E0eNZ8eWkNrVoanWddXgsqoKcDxJgm1MYCzBCpsMuKg=;
        b=UFjYpnasEic+I5++DC18G/vu4RY3tzfJWCh/rqywEHJNLAZK+MzCGvnH9MirUJNLLI
         aBsnO0+bN3nkwzyFyP7ASabiY75viU1HT3rfxKw526PLToPqvSVAQV3Tqcou0CDwHItw
         S6+Hu+ivhZmkydQhmPljS9twkUThsfSv7HH16YH2vQ+zC3GqGN4X/k8zAPG3s6tXVLN7
         ttFHGVIUHATZvIdBdh4gQVgzk+ruOjq8MRMHCk3AcmbObGXM8K/apS6aoOOiNuVusX2H
         tmD/Dcp7oGw5FS/r5b/GqEO5sUYazBjiFGnrjvHrHtzlSUbOEwQ92LisMkFogMIeHmL6
         Qj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=E0eNZ8eWkNrVoanWddXgsqoKcDxJgm1MYCzBCpsMuKg=;
        b=TLdysobBevsA7TBnga2UKDP82n3s6RM4mXb5b1Obw0wxIPzYP63rylRH12XeequBad
         aZnyR3cq7YEbYPn2f9Np7Qz8hqH4u1hfNE+RjfA09suodSYZN1RomfUzhX2r8tmwExTt
         yJYjrT7mY+xhkgMklzJg+0o2uaE2VHouNbQdtTw1bsUHjRiJJp/u0UUM6I5CUI7anxu0
         7yBB8YYjAQfZsKXErVSp+0HTuxs7zWeIW4qheywFC11BVWwGss9fI9hAQC84umPbUAQ5
         7Rx5IfdnwqkoPc8z5UcuVMOEW3b4CsXKcQvblxC6apYPW1oyS55Ddw083hVQKRBUBu0O
         IE9g==
X-Gm-Message-State: APjAAAWpet8ikQwffmbAkx/DTJpZsUn6gvhxHzRQapxtNt80kjBeK+UH
        zSK8utMxtdzZvvw3bWLxAMLPueya/po=
X-Google-Smtp-Source: APXvYqxLljNmQvesdmG9DGIdf/+22fgiaWbWdMNQlisR2ev+25ul2OsqHmLWamvq8jicZoQgq4G/TA==
X-Received: by 2002:a37:ad0f:: with SMTP id f15mr11836253qkm.68.1561375763323;
        Mon, 24 Jun 2019 04:29:23 -0700 (PDT)
Received: from [192.168.1.177] (pool-100-0-123-202.bstnma.fios.verizon.net. [100.0.123.202])
        by smtp.googlemail.com with ESMTPSA id l5sm6291035qte.9.2019.06.24.04.29.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 04:29:22 -0700 (PDT)
Subject: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
To:     Daniel Thompson <daniel.thompson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Peter Bacon <pbacon@psemi.com>
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
 <20181111113053.GF27666@amd> <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
 <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org> <20190621221325.GA2343@amd>
 <20190624102405.gg2lnlw6wmfvjrxu@holly.lan>
From:   Brian Dodge <bdodge09@gmail.com>
Message-ID: <9d590b7b-5477-249e-a482-1fc17d7a106f@gmail.com>
Date:   Mon, 24 Jun 2019 07:29:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190624102405.gg2lnlw6wmfvjrxu@holly.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This sure did fall through the cracks.

I confirmed with the vendor that there are no existing embedded DTS with 
the wrong name(s) in them before submitting this patch.

The new owner of this chip family, pSemi, just wanted me to wrap things 
up and support all of there chips (3) in a single driver and that was 
the extent of the work for me.  Since then the manager of the program 
there has also changed.  I assume they'd still want these changes in for 
completeness.

AFAIK, there were just some quibbles about the copyright date range.  
Can you please help me push these patches in? It'll take me some time to 
get back in to where I left things  since its been so long.  I know its 
a bit messy but the DTS and driver changes need to be together to make 
sense so I couldn't really do an incremental patch sequence.

What is the next step?

Brian

On 6/24/19 6:24 AM, Daniel Thompson wrote:
> On Sat, Jun 22, 2019 at 12:13:25AM +0200, Pavel Machek wrote:
>> Hi!
>>
>>> [Sorry to those receiving this twice... had to dig this out from the
>>> archives and sent it to the lists from the wrong mailer]
>>>
>>> On 27/11/2018 00:44, Brian Dodge wrote:
>>>> Thank you Pavel, that is a good point.
>>>>
>>>> The chip vendor has indicated that there is no reason to maintain the
>>>> old/improper prefix and wishes to go forward (only) with the "arctic"
>>>> prefix and any existing dts files are or will be updated.
>>> Looks like this patch series has fallen into the cracks a little.
>>>
>>> I think I assumed this info would end in the description of patch v2 1/3 (in
>>> order to answer Rob's feedback) and I sat and waited for a respin. On the
>>> other hand... I didn't actually say that explicitly anywhere! So... I'd
>>> recommend a respin perhaps with a small bit of text explaining how the
>>> vendor can state that any existing dts files will be updated. This is a
>>> peripheral device so these strings are probably embedded into OEM
>>> devicetrees rather than exclusively under the control of the vendor.
>> So in next email you give good reason not to apply this :-).
> Afraid so... it was on page 2 of my google search so I did a quick
> search, sent the first mail and then went back to my web browser.
>
> It was at that moment that I decided a quick search wasn't enough and
> decided to got a little deeper!
>
>
> Daniel.
