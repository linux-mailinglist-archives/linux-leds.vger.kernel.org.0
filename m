Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 531719D6D6
	for <lists+linux-leds@lfdr.de>; Mon, 26 Aug 2019 21:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729722AbfHZTey (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 26 Aug 2019 15:34:54 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39006 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729201AbfHZTex (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 26 Aug 2019 15:34:53 -0400
Received: by mail-wm1-f66.google.com with SMTP id i63so615083wmg.4;
        Mon, 26 Aug 2019 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QkdlqMsC5a/i4Uri7THbPzRWtoDxe6v2yJ+K7ZTNvk0=;
        b=nQmcIl8K4+xOY/ps+ZVrM/Lw2YqlsqnLkCtP/bkQ7EbnY+b9agcTzLUyqUB7uaMHWi
         NurOSjbkrrTYCMojglN2EJ4y6+Ytz/h8OFRrLF2mt5fAzInBYqCmuVoFyjsIv+2qfDCI
         LdnZnevD9+j2/P8Twb+JL01S+muKnd98T3MGLDebDSOtHda+vINchzBsJhYjI53uROIV
         4FQB7h7hVpStWjXbTmo72W7MJ3Jy4Mh02jUZfF7Oj/Y8gmtAEj5kOxlIgLoDESoafIXo
         fcZVsh9XAm5kSiktcpu0cyP5otVojV2HuP8ukrOYsPyEMRTbDLKhOsD9s7k041rHG2SE
         CtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QkdlqMsC5a/i4Uri7THbPzRWtoDxe6v2yJ+K7ZTNvk0=;
        b=B9aFwrKIuLdpCRswVhf0tqAAqXqAbOoY371TFqtJPIX8wqpdtIWicEE5yOWpYSE2Wy
         /AaItB7jAUKP3sjvNxkj7eabRxVKpdScegeqyjF2Ybplwjtq4OjclLGWktxmZipLJpGt
         JfJot9h4S1YcPhfNFGqTJN+dPfw7x3KfvVazng3s+TStGEAocT+3/hfw1L7c5BQXhqyK
         ZDD4KnUjWMIVLZW82yL6Ym2vptb7Dgj3mlU6jQ+LON77J+IG0HbuJiXFSAXAgeRRLFSh
         8d+uYeiHTw5lsC5vuA403GQZcq5KbePE53Oi3LprCR554N/GZiykwXfzJahl6/BLrDh6
         B7QA==
X-Gm-Message-State: APjAAAUlwsKsjrQzsPOmhItlbn2wrAtGhiGk5NKpH1NtTf8oI2rW+Yxo
        b4Orh59gSwUpqyI66KCg6UMwdh6W
X-Google-Smtp-Source: APXvYqw4UaDOvVDhg8onVzeY8Rpsic7xgsu9QhdXCTExNkBDP52Zy5u6LFuH9X5ZWj4TFnRBWyfY/g==
X-Received: by 2002:a7b:c091:: with SMTP id r17mr17248571wmh.74.1566848090317;
        Mon, 26 Aug 2019 12:34:50 -0700 (PDT)
Received: from [192.168.1.19] (coo134.neoplus.adsl.tpnet.pl. [83.31.194.134])
        by smtp.gmail.com with ESMTPSA id m7sm1054857wmi.18.2019.08.26.12.34.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 12:34:49 -0700 (PDT)
Subject: Re: [PATCH] leds: ti-lmu-common: Fix coccinelle issue in TI LMU
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190823195523.20950-1-dmurphy@ti.com>
 <4a1872e8-89a5-4bc4-6aa4-bcadbc48697a@gmail.com>
 <de1bb95d-d5ca-6f8f-e758-b03479091f99@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <48fc16c5-9f43-e5c3-e756-514f9f3eb254@gmail.com>
Date:   Mon, 26 Aug 2019 21:34:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <de1bb95d-d5ca-6f8f-e758-b03479091f99@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 8/26/19 4:53 PM, Dan Murphy wrote:
> Jacek
> 
> On 8/24/19 10:18 AM, Jacek Anaszewski wrote:
>> Hi Dan,
>>
>> Thank you for the patch.
>>
>> On 8/23/19 9:55 PM, Dan Murphy wrote:
>>> Fix the coccinelle issues found in the TI LMU common code
>>>
>>> drivers/leds/leds-ti-lmu-common.c:97:20-29: WARNING: Unsigned
>>> expression compared with zero: ramp_down < 0
>>> drivers/leds/leds-ti-lmu-common.c:97:5-12: WARNING: Unsigned
>>> expression compared with zero: ramp_up < 0
>> Wouldn't it make more sense to remove those pointless checks?
>> Clearly a correct index of an array cannot be negative.
>> Looking at the code I would make more int -> unsigned int conversions:
>>
>> - ramp_table should be unsigned int
>> - ti_lmu_common_convert_ramp_to_index should return unsigned int
>>
> Yeah I was going to just remove the code but when I was writing the
> original code my intent was
> 
> to extend the ramp call to allow other TI LMU driver to pass in the
> device specific ramp table.
> 
> But since I don't currently have any devices on my plate that require
> that I can just remove the code as well

You don't need to remove, just do the conversions I proposed.
Unless it introduces some other problems I am currently not aware of.

-- 
Best regards,
Jacek Anaszewski
