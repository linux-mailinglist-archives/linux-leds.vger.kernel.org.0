Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1B8016BCC
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2019 21:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbfEGTzw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 15:55:52 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38655 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfEGTzv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 May 2019 15:55:51 -0400
Received: by mail-wr1-f66.google.com with SMTP id v11so3845691wru.5
        for <linux-leds@vger.kernel.org>; Tue, 07 May 2019 12:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d739L0RQc2pk/WKHDureBWLkGEZvUGwbja7yn5QAniE=;
        b=D2juqNkfSx5c4mwBxCdGTzCCYN6pbkyFUz+Etnl/aZkHUU1oFmM6qrJqRo+9IgLaHr
         o1M11s5f5BPndPdB0zlPzXtPELiJ9UlUCNcK1LhJrKqWHbN0k5Co1uK3Cesb5T8g4RHb
         Cj04B1UHlmqnW8NjsNgDKmbdHlplg2rZbe6cAfLlEhWQNOhxlcTRc8QQJfLlfue4iZ7y
         wXyevRbI+NlDJmExL0vVtcLV9aUcBCsz1JT6nTpLn14+VhWc1rxyCQNV5q6qUg83vq6m
         WL/1GZB280lislB9RGFicfggsquaicXXa4LN5yDdMgbOnMg2GHw6W/92jPVM9Ti4e111
         Lqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d739L0RQc2pk/WKHDureBWLkGEZvUGwbja7yn5QAniE=;
        b=RYxMt7hl0UmRFl9GvCP78fZ12PX5wXhxeg0Aetjy1LLsO8b46KoND/5pNymP97WUyy
         vJ10mpT2q4XgRl7hYdSOuqOfsM4g/P0ru9660rF5ZhCSuqTTbPp0G9zmJtr94AtieJ+Q
         y1RHtvnb9chFVL7fpyE+1/5lOWP5fhMa6IBYTB1K9FWIlP2fZ3X5nfE9dz3yyPPsKUrj
         p+PIslKEdNdw1Lm5WYPRBbmwZxN/d90TDnnobhLTdKyNXKgHKM7TvJ7SuPNs0bi+RBtu
         axIHf6Uln2zbW0J/GwI6XYNqBIPYFSuCLlVPsr1uepN9cuwGw4fqXkZmP+M9gb183Qnh
         a5Qg==
X-Gm-Message-State: APjAAAXO8N1v9wz7xhTSNENlIMHZ3HNyY/N5ry8eERNpa742/03rtwDU
        /b6oTBK5fKyDejoGNHX36ZEQM702
X-Google-Smtp-Source: APXvYqzfHQ1aPje9y0PkvrhIhPOnaMhcH3nF+yyEG2jkvS3cShg2pmUZeCttcuVSWtX6AcaLUL/yhA==
X-Received: by 2002:a5d:698b:: with SMTP id g11mr23505206wru.65.1557258949530;
        Tue, 07 May 2019 12:55:49 -0700 (PDT)
Received: from [192.168.1.19] (bgw158.neoplus.adsl.tpnet.pl. [83.28.86.158])
        by smtp.gmail.com with ESMTPSA id a4sm4634wmf.45.2019.05.07.12.55.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 12:55:48 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] LMU Common code intro
To:     Dan Murphy <dmurphy@ti.com>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org
References: <20190430191730.19450-1-dmurphy@ti.com>
 <34088323-9b40-7dea-5449-6a01bb721c00@gmail.com>
 <8166c0c1-facf-14da-7c71-5bc5a3cc23f7@gmail.com>
 <bc5756ac-b383-dac3-4a45-c0ace03ce9ec@gmail.com>
 <bf6768b6-2795-5904-15e1-75109a694fcd@ti.com>
 <2f786e83-0776-9bcb-a485-6e03c8db87ce@gmail.com>
 <c3a8be67-a3c3-60d3-aeed-4ef36f72f164@ti.com>
 <0b23f5f2-5352-c281-62e2-8286584bc63c@gmail.com>
 <10771435-f8ca-deb8-bdce-648e5adab7c6@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <b92897da-c21e-4ce3-80cb-cd8add667113@gmail.com>
Date:   Tue, 7 May 2019 21:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <10771435-f8ca-deb8-bdce-648e5adab7c6@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 5/7/19 9:49 PM, Dan Murphy wrote:
> Jacek
> 
> On 5/7/19 2:47 PM, Jacek Anaszewski wrote:
>> On 5/7/19 9:29 PM, Dan Murphy wrote:
>>> Jacek
>>>
>>> On 5/7/19 2:13 PM, Jacek Anaszewski wrote:
>>>> On 5/7/19 9:06 PM, Dan Murphy wrote:
>>>>> I have posted v4 with requested corrections plus I have an additional patchset that is based off of this patch set
>>>>> for the LM36274.
>>>>
>>>> Yes, I've seen it but it was quite late. Let it receive
>>>> fair testing.
>>>>
>>>
>>> OK do you want me to combine both patchsets?  Or leave them separated?
>>
>> If that one for LM36274 still applies cleanly there is no need
>> to resend.
>>
> 
> It did not.  There were conflicts with the file name change as well as the Kconfig rearrangement

So please send only the update of this patch. No need to resend
the "[PATCH v4 0/7] LMU Rework" patch set.

-- 
Best regards,
Jacek Anaszewski
