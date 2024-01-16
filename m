Return-Path: <linux-leds+bounces-607-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D5482EDC5
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jan 2024 12:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CC961F2454C
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jan 2024 11:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EA51B95D;
	Tue, 16 Jan 2024 11:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLohVOwM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD2F1B94D
	for <linux-leds@vger.kernel.org>; Tue, 16 Jan 2024 11:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33761e291c1so5516561f8f.0
        for <linux-leds@vger.kernel.org>; Tue, 16 Jan 2024 03:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705404761; x=1706009561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H3qXSRq538Ovs0cJ4DjzEgwX9/MA2ShIwOsyBWZLwfo=;
        b=OLohVOwMzRKvqKyKS7FYzU50FDusI0aZUhHrFfPm6stFi8DVN614xOkG09I8FWW7IC
         DcK04VLjVNqi0JAxsVEaByYXm6S+Egio2teh3cCpTCUhT2iVUeF7iovU3fMhQUOpAvup
         srKgq0ib3QGpQvnXMSIlvuNxS8waS6o72rYZgAaS2KlONUjQJlHjHFxQxJsrYbe394NU
         zHvUB/YiunP8GZcwLg433NEOfJNZii/vXY2Jl2jo8xb7bb8S9NrYasPMdugBX+/NmW4r
         nMeeP6vB3ojKsFXlL6UFJYWGMNmDTSBR3XRV6h2xH0oQcMIwMhlzaqyytGhHN4XVHBBb
         lI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705404761; x=1706009561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3qXSRq538Ovs0cJ4DjzEgwX9/MA2ShIwOsyBWZLwfo=;
        b=rXMUHSHSPFJzKMKjGBBoBes+R5yLVIRld6K8b5du0FuYMz5wAPrNtuyLDLg+wmbbll
         IOcmWQlWeYh0RVPt2JSNpdCAUUZDVIKwmOascYbBADqPz54DV/hxSU2HBMFQN8lsm5v+
         1hzwbq+dNO68xP9dtKuc0rNcbJRzN1AchOX1fQuLSJ/KcN2K2nZPt23kC22gxy+UMngy
         cQnYk6vh+X4Dcs/UlbXdCR6+EVbKEGCseLv4iO+gZbNwFmZD6s/8dzxyswzIoIi8g2rQ
         SfM4vF9jb4tcwNV7mpeDHjZEFf4D9Qr1qs5ts8LmBnodKPD1l0gyb7G9GYr2lHUTSWO5
         83HQ==
X-Gm-Message-State: AOJu0YwvQovVhz0iKEbwgRdDJ9ZwpupJEXCsGtnb1OPoZ37NtA0aW3+W
	rDcJ0A56O7MLEwqbcmV2vKc=
X-Google-Smtp-Source: AGHT+IEzwljUnYQSGUikOZhsDCOxW8CGZd1MVbduv6KWGlntPEwmj5ZyFUn+Qo8nE75Q0kdeWyuVIw==
X-Received: by 2002:a05:600c:358b:b0:40e:4560:6cf5 with SMTP id p11-20020a05600c358b00b0040e45606cf5mr3792246wmq.25.1705404760641;
        Tue, 16 Jan 2024 03:32:40 -0800 (PST)
Received: from ?IPV6:2a01:c22:73ee:f700:d8a3:e1c3:569e:b92c? (dynamic-2a01-0c22-73ee-f700-d8a3-e1c3-569e-b92c.c22.pool.telefonica.de. [2a01:c22:73ee:f700:d8a3:e1c3:569e:b92c])
        by smtp.googlemail.com with ESMTPSA id fm23-20020a05600c0c1700b0040e612aa673sm18911223wmb.17.2024.01.16.03.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 03:32:40 -0800 (PST)
Message-ID: <b7e2062d-f8ee-448c-952d-7af6f2abd210@gmail.com>
Date: Tue, 16 Jan 2024 12:32:39 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: trigger: audio: Set module alias for module
 auto-loading
To: Krzysztof Kozlowski <krzk@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
References: <4574bfb1-5156-46d4-90f5-4d6477b248b8@gmail.com>
 <e8b7b746-5089-4b16-8aae-b0403abcd97e@kernel.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <e8b7b746-5089-4b16-8aae-b0403abcd97e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 11:22, Krzysztof Kozlowski wrote:
> On 15/01/2024 22:36, Heiner Kallweit wrote:
>> Few drivers (e.g. under platform/x86) have these triggers as default
>> trigger. So add alias information to allow module auto-loading.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/leds/trigger/ledtrig-audio.c | 2 ++
> 
> You already sent it few days ago, so:
> 1. This is v2 (missing proper patch prefix)
> 2. You need changelog under ---.
> 
Oh, indeed. My bad. There's no change, so please disregard
the resubmit.

> Best regards,
> Krzysztof
> 
Heiner

