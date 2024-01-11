Return-Path: <linux-leds+bounces-587-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A02E82AD39
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 12:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDC5D1F22AF5
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 11:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4389314F88;
	Thu, 11 Jan 2024 11:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UugCewnZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAAD156D0;
	Thu, 11 Jan 2024 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-555f581aed9so6061414a12.3;
        Thu, 11 Jan 2024 03:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704971981; x=1705576781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sSbZYSutlQ3iKg6lGH1O3ekzOz9Hz/fXBF5+RgZv1j0=;
        b=UugCewnZWvNrpnxTgRLEn3O0FZuqHeuSYo3dF0tu79hTYYmJ9dE6E3Fm396b4H8/Em
         hhihUoJ1SLOgtCMSfM0sy5Zaf7shJRoQolcPgPSfBzxNV/shQI/yyHgtbztu1czKxvVK
         BwzCfN9aUA9MSFyTvEQixxFWUs4Bx2Mb5UPspqr9VQ3QjvPWrimj74KNOfk0qSQPtCIP
         jcP4ZhFt8fTyTC80Xl+uk4s/cscxO8tnm8HCvC5I0ELUubl5bPYhPn8QWEKLJJkynazn
         ohPsoi4+vxXAIvuJNIAK8exhkP7kHLFe0LbjfZPlpP/8txIV34A56OIki8G/TUG7UJ/6
         UiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704971981; x=1705576781;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSbZYSutlQ3iKg6lGH1O3ekzOz9Hz/fXBF5+RgZv1j0=;
        b=UGrxINhh7PtsLjRiscXRbnjD6Bppnhv7JIychSiN1KxLQEuwKu4+35Esqctptd+RI4
         t9GQcAst05EJ3pbtAivUBCheSZroyOdUwyiO78GIrxKbJRbVLtqPaEXNALxh0WU3CZAc
         uJepdtZGTeLsOC/BHfvt+GdZv19ZmGNYHbl6XrgbwpoIazJOla38MWShsP+1DmhDUXcM
         2jxmvVXPCPe8mrdxJpU/QRjnP/fcad4ijMpcvFpzvsQbhybCTXpQpQEq5nA9Bkd5IJ1P
         A1NzNe0xF/WLhI8AnSAgxQIPwgiVakDVYgfRhsNIoPYdKn/6koSfO5tj68yHq6Ivfi8o
         kSjA==
X-Gm-Message-State: AOJu0YzxbhtZXU013lqcT3BPP7+jufos6H08lnVgzlplg1MKUHqZdOmf
	95KWoZbrS2s8XpW+7tcJdGk=
X-Google-Smtp-Source: AGHT+IHlubIRyhQvOI60aGnRpIe55nDMK+uaNu8XuQ/dm/7eGcZHRRHmkqZ7zKktwl8yl5+o+EbRog==
X-Received: by 2002:aa7:d341:0:b0:556:c94a:7ca2 with SMTP id m1-20020aa7d341000000b00556c94a7ca2mr544468edr.58.1704971980684;
        Thu, 11 Jan 2024 03:19:40 -0800 (PST)
Received: from ?IPV6:2a01:c23:bc57:a800:4da8:42cb:4e37:553d? (dynamic-2a01-0c23-bc57-a800-4da8-42cb-4e37-553d.c23.pool.telefonica.de. [2a01:c23:bc57:a800:4da8:42cb:4e37:553d])
        by smtp.googlemail.com with ESMTPSA id ez6-20020a056402450600b0055803202e83sm488852edb.67.2024.01.11.03.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 03:19:40 -0800 (PST)
Message-ID: <93709245-a791-4b35-bfb4-258344cf1134@gmail.com>
Date: Thu, 11 Jan 2024 12:19:39 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESUBMIT] leds: trigger: netdev: add core support for hw
 not supporting fallback to LED sw control
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <3fd5184c-3641-4b0b-b59a-f489ec69a6cd@gmail.com>
 <7b6cf0fb-4c77-4088-b87b-5649cfaa697e@gmail.com>
 <20240111084425.GJ7948@google.com>
 <f0838b86-f008-4f14-8910-61b393d0190d@gmail.com>
 <20240111103235.GA1665043@google.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20240111103235.GA1665043@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.01.2024 11:32, Lee Jones wrote:
> On Thu, 11 Jan 2024, Heiner Kallweit wrote:
> 
>> On 11.01.2024 09:44, Lee Jones wrote:
>>> On Sun, 17 Dec 2023, Heiner Kallweit wrote:
>>>
>>>> On 17.12.2023 19:46, Heiner Kallweit wrote:
>>>>> If hw doesn't support sw control of the LED and we switch to a mode
>>>>> not supported by hw, currently we get lots of errors because neither
>>>>> brigthness_set() nor brithness_set_blocking() is set.
>>>>> Deal with this by not falling back to sw control, and return
>>>>> -EOPNOTSUPP to the user. Note that we still store the new mode.
>>>>> This is needed in case an intermediate unsupported mode is necessary
>>>>> to switch from one supported mode to another.
>>>>>
>>>>> Add a comment explaining how a driver for such hw is supposed to behave.
>>>>>
>>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>>> ---
>>>>
>>>> For whatever reason this patch (original version and resubmit) doesn't
>>>> show up on linux-leds patchwork. In netdev patchwork it's visible.
>>>
>>> Never used it.  Do you have a link?
>>>
>> This is the original patch in netdev patchwork
>> https://patchwork.kernel.org/project/netdevbpf/patch/91e9f4c6-d869-45be-be72-ac49a3c3b818@gmail.com/
>>
>> This is my patches in linux-leds patchwork. The one from Dec 6th is missing here.
>> https://patches.linaro.org/project/linux-leds/list/?series=&submitter=6702&state=*&q=&archive=&delegate=
>> However the resubmitted one showed up later.
> 
> AFAIW, that's not the official Patchwork for LEDs.
> 
> And as I say, I don't use it, so I'm not really in a position to comment.
> 
> Do we still have something outstanding?
> 
Thanks for asking. No, that's it for now.


