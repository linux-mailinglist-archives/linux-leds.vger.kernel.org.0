Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21D819F4A6
	for <lists+linux-leds@lfdr.de>; Tue, 27 Aug 2019 23:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfH0VCX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Aug 2019 17:02:23 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36844 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbfH0VCX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Aug 2019 17:02:23 -0400
Received: by mail-wm1-f68.google.com with SMTP id p13so284633wmh.1;
        Tue, 27 Aug 2019 14:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LYnBmNFm/AVJ/ogCESBihbknRq6ODHDlLJ5Za9H92/M=;
        b=UmChool4DH3Va70ZGeqC8JNdidvWiuO/nHaFXAT1HrEDpHB9zXL1IZpyzcFXnxZEn0
         EXXIsyDDd1Cp8GoSwIiXDQ2FixEW+Fkqi6gFYOEK7p7UZbl2zMRstgy4bTBXwnumXaXn
         KpMPgjpR3oM8k8aEUTVG/SS36LLA95NT0PNn2a5G7+opuIBnENsleGGP1vbK2jVH2CMT
         H4/2AIsIZUPF+EBsWz5zw8Gxa29VLVmpqwPgpW938JHYUtlLIZBMPg5B0fMEu6arGr/9
         EewKVP5vXRNq+yAJlsWtfaKqvItg1xBMni2M6xH5+xi17sL/QLT7uxHvF6/8n8YEPk/e
         5qZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LYnBmNFm/AVJ/ogCESBihbknRq6ODHDlLJ5Za9H92/M=;
        b=koYaQ8/gFD9sfFZp7cF8erNwYFm1jC0ucAGg9VUHmVYpcbW0MQIbCPj5rI5oQ2NIM/
         me9UmSCH0QnDduX9bNq1eAwx/57JtcI9Pi0CPka/83k5GIfSkdBQhq9FeUQLsSRe8wHE
         P9sJG5HkrOG3rTwlY9ntJS9EguH7TnK8g33PjmSNQsyfj67+3a195vexYAk/9hG4x9b6
         pn0Qj2h34n0Y519KKWu1Cif+6m6/hmI4KhKFWxcI56ekiLtkmFFaMSKxs363SZ6Ob+EG
         SSaa9/iGEWr6mYMbboePOhnNZIEpNdGtUVADRw3VbVIWE+SosRQdNXFncwP8PM2sFD25
         rQ6w==
X-Gm-Message-State: APjAAAVDArUzk301KS7MWuFaZtaVMyvgciiON428cxoN2GmuRWuTdSiQ
        mkNn8PkYR/q2wB+rXBEzlK6HJJb9
X-Google-Smtp-Source: APXvYqwEnVAkClYUBMXp1YvaiT495jh9omLvI8TCbkUc0Uz+5XX6JhEAqMWOuQ5jyWBR4pZfXMLHbA==
X-Received: by 2002:a1c:4d06:: with SMTP id o6mr526942wmh.43.1566939739832;
        Tue, 27 Aug 2019 14:02:19 -0700 (PDT)
Received: from [192.168.1.19] (ckl27.neoplus.adsl.tpnet.pl. [83.31.87.27])
        by smtp.gmail.com with ESMTPSA id w8sm6285886wmc.1.2019.08.27.14.02.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 14:02:19 -0700 (PDT)
Subject: Re: [PATCH] leds: ti-lmu-common: Fix coccinelle issue in TI LMU
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190823195523.20950-1-dmurphy@ti.com>
 <4a1872e8-89a5-4bc4-6aa4-bcadbc48697a@gmail.com>
 <de1bb95d-d5ca-6f8f-e758-b03479091f99@ti.com>
 <48fc16c5-9f43-e5c3-e756-514f9f3eb254@gmail.com>
 <12746d3e-e658-5ce6-5231-33005a74e549@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <f36eac2f-6643-c4f3-2b73-45f147b019a7@gmail.com>
Date:   Tue, 27 Aug 2019 23:02:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <12746d3e-e658-5ce6-5231-33005a74e549@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 8/27/19 3:37 PM, Dan Murphy wrote:
> Jacek
> 
> On 8/26/19 2:34 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 8/26/19 4:53 PM, Dan Murphy wrote:
>>> Jacek
>>>
>>> On 8/24/19 10:18 AM, Jacek Anaszewski wrote:
>>>> Hi Dan,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On 8/23/19 9:55 PM, Dan Murphy wrote:
>>>>> Fix the coccinelle issues found in the TI LMU common code
>>>>>
>>>>> drivers/leds/leds-ti-lmu-common.c:97:20-29: WARNING: Unsigned
>>>>> expression compared with zero: ramp_down < 0
>>>>> drivers/leds/leds-ti-lmu-common.c:97:5-12: WARNING: Unsigned
>>>>> expression compared with zero: ramp_up < 0
>>>> Wouldn't it make more sense to remove those pointless checks?
>>>> Clearly a correct index of an array cannot be negative.
>>>> Looking at the code I would make more int -> unsigned int conversions:
>>>>
>>>> - ramp_table should be unsigned int
>>>> - ti_lmu_common_convert_ramp_to_index should return unsigned int
>>>>
>>> Yeah I was going to just remove the code but when I was writing the
>>> original code my intent was
>>>
>>> to extend the ramp call to allow other TI LMU driver to pass in the
>>> device specific ramp table.
>>>
>>> But since I don't currently have any devices on my plate that require
>>> that I can just remove the code as well
>> You don't need to remove, just do the conversions I proposed.
>> Unless it introduces some other problems I am currently not aware of.
>>
> Well just converting those two would/did not fix the issue.

I implicitly assumed that you'd just drop the check since it
would make no sense to check unsigned int for being lower than 0.

And I propose to not return any error code from
ti_lmu_common_convert_ramp_to_index(), just make sure inside it
you return sane value. Ramp should, well, ramp.

> 
> But actually there is only 1 possibility that could happen if the
> convert function returns -EINVAL
> 
> So the check should be
> 
> if (ramp_up == -EINVAL || ramp_down == -EINVAL)
> 
> Because ramp_up/down should never be less then zero otherwise.
> 
> Dan
> 
> 
> 

-- 
Best regards,
Jacek Anaszewski
