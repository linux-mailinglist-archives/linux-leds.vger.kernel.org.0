Return-Path: <linux-leds+bounces-6626-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FAFD169C4
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 05:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32F4930198B1
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 04:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668212DFA31;
	Tue, 13 Jan 2026 04:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuVJsQA3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1599120459A
	for <linux-leds@vger.kernel.org>; Tue, 13 Jan 2026 04:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768279532; cv=none; b=i/NLTJySQYXBvgB7EHC7ciFT00EIKgIkGYbtoXpGoByjGibVA+3h3R/GX9RDyVrph44dz9mhyclT6g3Ef1v8HagN9HzugEqH0B5pa8p5tqYSR/Ca9y78flVA8Uf1szSYSNSXbcUPyNyJNHsiMvVkZ1tV7gJ8rWRsbET3q4Eyk78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768279532; c=relaxed/simple;
	bh=cN1lliBDvJ2161XpgMqnGbtxFjb3awzneHzXZEap+mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kLIKQt4MEeGm1koGAYEJgbkjWzWHTz/t2PMusJg63fvClsU6fT+tBkN+5PG0ZT4qyYTD631hVs6PYxk1kEAjHhbluRwxE1GvK2F/udbfxy1q98G6j+os/G28lIEG6gY51o+1YEBP7rVU6q9+pjOIyjmMZuDpb+4DSirLsN1Hfo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuVJsQA3; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81f4e36512aso1878384b3a.3
        for <linux-leds@vger.kernel.org>; Mon, 12 Jan 2026 20:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768279530; x=1768884330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iy6S9q8/CD1KaKEpgdKuwKLpEadDje8AFP0pfPr3/5I=;
        b=YuVJsQA3Res31y46H78DBm8nL4DRqWkA0OnGcC8aMdPhc7SJgxNz+xh0jWdwp1tTpc
         IKU42eIgHvAmQVhRpj7/TmvHBpDSVJNMNJWujPh6/AC8Qr8fM9J7lalJs60RnF5eazUR
         lnBIlSvxLbwdS8P53zapTA7P/7RqIajhv/pOzfScahgdayojMH2t0IVCQertgK1lZPc7
         tqR4dcwE9UBJawy/MpSB9o6R6Ljy3pryxPV3BrUUeNNvCLdKF+6g8bgTP5nRZK1XsAsY
         9JchQB/IE5Ptnhd45oT4PM4daLNm4ykcT6yskaVhvlkm8d6QKzOBgcPkLagSIL2HST3B
         G0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768279530; x=1768884330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iy6S9q8/CD1KaKEpgdKuwKLpEadDje8AFP0pfPr3/5I=;
        b=XWFKGQyWOg+lMskb/y5OD4huIYDDBUHQlju+u7WXaxvhE0JjN6VA/Dm1gEp/yhFGeP
         iUidjprPe2ksm0id1BFknKkaCtrNj0P8O9XNgtyAJ+umzO0vOEeD7TPCxHtKqQM6rNkD
         i2WEhUMU4CPS/6sXiFOwvnMvA9jPIlGkOyyY/kB8PgtTxGrE5wzgoSBgQk2cKUIKQpv0
         pxTNN+4sqbxkcN9qTUscsDgtYCIe6EoSROHnqfticdE7KwMUW4En7h2xts5SL6sAAyM8
         XuDmZPTfX14wNh6pUoLPbdhPxvuiQCDFqjAiPxBs3qGfQ+LMvkuHkfaFkjw6h8fHNu1/
         40cw==
X-Forwarded-Encrypted: i=1; AJvYcCUZrRSLzc0su355W8JVKLnScWrA8t9m3rwRopF1zqat94V3pVqbzf8fn8p6dovkKc8PqKDW+1iUuCP8@vger.kernel.org
X-Gm-Message-State: AOJu0YxSb8EvYZQfZJUypixXKfjLoVIVxI8Z401NbQm+XUeJK05FVZ+n
	RNX2MQdUT7zNaamvet2jxdIEIkTQscDunJZoS/+8lTKc81q9esn2q021
X-Gm-Gg: AY/fxX75VN0Z+4RXPb2FHzc3KKRvMPJ7G7W+mLQAMYgT1n9RqoR9JWo1r6AnYl2Qf45
	EGSYnrDvl1OcGzEGgF7nfAay18n5uS2sdHDHYX8BqzK2TDh5qOD+uG8hqdhAo9FBq1qvF4M0d88
	0VMqeutyiHzZ+gyGBIPcEm050Py2d2aw/76lj+BJtTWOdlQpM/KYlRBfqnQ2cJ9Rkhi6qnw4HqJ
	nbIqMZquSpMS5ug7XtlltimTHwlK1dHTmBtRLKORjhNn+tZ57LcF2+hN6R2QWaTBqYu9aUAuZFu
	f/xmQs13zzs53Z8uNZeH5hMJtaDSVRmcDUWc/I/316+HWrhUC43WQ5PnVjnm1lAfRWykmSya14B
	mddHLuHwGxcubiCjY6hYEePGv4+mUUl1f6f+Iyq05TiLAjGso4IbxrxrYMg5ZVREqLNQsYQvGM+
	HudnvJ0Q5S/mV7F9P3FTFRJ746QRmdI3S4ag==
X-Google-Smtp-Source: AGHT+IFqbGus3DZt4vurEFth5/Rb5XoyKQRcXgMFVDwspPX6ajf+F0/ZgCzEPgnpPLFp0Bu5b44dew==
X-Received: by 2002:a05:6a00:438a:b0:81f:4ce8:d641 with SMTP id d2e1a72fcca58-81f4ce8f745mr5760972b3a.37.1768279530424;
        Mon, 12 Jan 2026 20:45:30 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f36f88f4bsm8338351b3a.36.2026.01.12.20.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 20:45:29 -0800 (PST)
Message-ID: <c182df66-8503-49cf-8d1d-7da17214b843@gmail.com>
Date: Tue, 13 Jan 2026 10:15:53 +0530
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
To: Daniel Thompson <daniel@riscstar.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-2-tessolveupstream@gmail.com>
 <aVuKdAyXfWLs-WJI@aspen.lan>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <aVuKdAyXfWLs-WJI@aspen.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05-01-2026 15:25, Daniel Thompson wrote:
> On Mon, Jan 05, 2026 at 02:21:19PM +0530, Sudarshan Shetty wrote:
>> Update the gpio-backlight binding to support configurations that require
>> more than one GPIO for enabling/disabling the backlight.
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  .../bindings/leds/backlight/gpio-backlight.yaml      | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>> index 584030b6b0b9..1483ce4a3480 100644
>> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>> @@ -17,7 +17,8 @@ properties:
>>
>>    gpios:
>>      description: The gpio that is used for enabling/disabling the backlight.
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
> 
> Why 2?
> 

In the current design, the LVDS panel has a single backlight that
is controlled by two GPIOs. Initially, It described as two separate 
backlight devices using the same gpio-backlight driver, since the 
existing driver supports only one GPIO per instance.

So the maintainer suggested to extend the gpio-backlight driver 
and bindings to support multiple GPIOs.
https://lore.kernel.org/all/q63bdon55app4gb2il5e7skyc6z2amcnaiqbqlhen7arkxphtb@3jejbelji2ti/
> 
> Daniel.


