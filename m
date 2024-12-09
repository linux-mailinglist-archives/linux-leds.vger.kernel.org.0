Return-Path: <linux-leds+bounces-3534-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F12DE9E9009
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 11:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B297F2813F3
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 10:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41D1216E02;
	Mon,  9 Dec 2024 10:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h13awTAM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F4414F12D;
	Mon,  9 Dec 2024 10:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733739746; cv=none; b=SFGynou5XDvKzRa6LeMWa7W5BT4swPBGROkIXljc/rdBzxp5QohTFnzjWiZMGDEwl/j6VPDxUgp1WO+4dx8F80wXx+FWaITQnuMD6t7P0TW5mluDbaTXM+3NT/ZnbT66Rzp7siWYdvrEjY0s5biFEekHo87DJ5IHavdTqUzMfOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733739746; c=relaxed/simple;
	bh=psJ6EdfRQDJJZjbhcaypGTvllIk2NcKhIpZ9DYRkbhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EDvLa7QoT8nCly6ZteNYF+gYORos1V9L7rKgGsGP9uSoDjI5Yal7xVnCrTzmky+zdtnk3qN4HfaNdQ59hpasiMH27Cg6mg03VGWmSyLTbUdEVItaf8ilFY0BTdX3zqkv3qGWLgDDtcC4sa38u02aosGnplISI8PmVcIFSARdmlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h13awTAM; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-725dac69699so1137507b3a.0;
        Mon, 09 Dec 2024 02:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733739744; x=1734344544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JK+YHbwbzYxN2fA6jQpylORDnONEVEdYkbUHx87yE3E=;
        b=h13awTAM9LmqTzUAjoKJgZH4iGNPtm/3vMgRCTqJqLGq+1NqbJaclrXgn1h2UOf6JC
         PGNBkGulDqinwnCeW1JMDL1Q+ic4ivebfRWwxGFr/Xjigkf3HHJpogcqPev9lvUZl0yF
         vUU3qEs2MN5IyCbkKX+gttavP2cPl1CwMcI2btFb2RtTIQ4cZ23huvdIn2v0ozlPbuW2
         Z5iex0/wvo+MhGSgB+dbqcY7TA3OT82rAMrYEuHX6yIt04BVRzx6LmtPkKwLTDDsResK
         54VHIF+QunfYIs4Bg/mSFBObDRFUYpYVe0Qb5QpqwZn8yQ5puCOmsU3VMO2j2AEmiJ6b
         u3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733739744; x=1734344544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JK+YHbwbzYxN2fA6jQpylORDnONEVEdYkbUHx87yE3E=;
        b=muPfb6h/Zr9xIwYlUU4G/FFpRy+7+DXUewKztfBvHJS+mhB8T7SY3Aeo7/y9onwDVn
         p8osqfMV/Q/pjjp3LCYudB3vnFSxBX8EQ8AsPPDluaoDYY49p9V+5f7gkthnsh0wSHsm
         18It63aHk7DFRED+QIAWfE85ZqK7rF0R5lrRNaD3PGoHWkFgAJl2xeTIEWOfml7flYmg
         f843Ek1NL7FvS9IWwdoAVswoXixGj8rquxHr3G53LfOX8meW4mg56ZwKhQxHryFQ6xj1
         Gaueq09D0HoLh9y0dUuriXVv1XTfnCCIGTDKmlnez5dNFp5JECBnWl5v5HzEXjGFUb9k
         vpJA==
X-Forwarded-Encrypted: i=1; AJvYcCUrn7MjRoA2CgchGgGlanvZtbOonMSUTzu+outj+EYKAFCCxrBB758vorIlHYb0QgJqPPK3n/TrbRMZ@vger.kernel.org, AJvYcCV88PsI1pP4O8NY4yTXiol9st8DEYJ+oLrdLr5P/SS7m40ttLRoqsBp6p13a/ViSdjHFV1GBr4R5X7ekEuF@vger.kernel.org, AJvYcCX/j13Uy+Kk+BdJ256qbbCnlA9Sk8QlZjPV5xZ3a+YCeNuVjcp7y24398yCq3+XZDqAHxCKCci5AbhKJw==@vger.kernel.org, AJvYcCX9oirflzA8Xc7IEJUKViQlj+5o2mMxqkAlcbDqZ2f3AA7zuE08br0P/Uldo0ioG2OpL6OJdRo+Cr6fi58=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsR1d1hKky2yVTJizFjR8v5D3mtRW5BKlBeNgTTNhX2+LXGbkM
	+UlLoIJIN4nf+roaZao0/snZwbry1UdbE+3zM3sjCPz5d9uFf7HU
X-Gm-Gg: ASbGncvjvOJhxuMAYEzTRM1DbscFrez7D+aHoVwOgvAXIKTlMP7rfkFd4geH55g3PCs
	Vp7RSpUeombUmLc0lMFgi9txK5TXUHvExrbYU1x/yVFY1naCrb/LPBFDQEIBJZv7B1kVO+ed+ZG
	LLO0OMaVCZidU93zC33gLjl+Xzjn9Zi/6Wz3RUXROe5xrXuRfqlAa34SwEOZthuV73OP/+ibAQH
	zOZDnov+V2/g4944Rhgl4tBsetaW/uGbUBGqKfGoAUSF0Ol3gMk3ds0QdSlvRTkmBsq
X-Google-Smtp-Source: AGHT+IGIMaQLW4wct1dsitCDskJol1qDWg2mfuDdPh8GMuIT847eTTcppJMdsxFJj7Ut8lRt0yTYLQ==
X-Received: by 2002:a05:6a00:4fcc:b0:71d:e93e:f542 with SMTP id d2e1a72fcca58-725b820b43fmr19800743b3a.21.1733739744446;
        Mon, 09 Dec 2024 02:22:24 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725d6856bf7sm3620294b3a.192.2024.12.09.02.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 02:22:24 -0800 (PST)
Message-ID: <e06c5d7c-de3c-46ff-b2ee-8ed794577e70@gmail.com>
Date: Mon, 9 Dec 2024 18:22:17 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
	y@krzk-bin.smtp.subspace.kernel.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241207130433.30351-1-towinchenmi@gmail.com>
 <20241207130433.30351-3-towinchenmi@gmail.com>
 <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Krzysztof Kozlowski 於 2024/12/9 下午5:22 寫道:
>> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
>> new file mode 100644
>> index 000000000000..d4bfd74b3129
>> --- /dev/null
>> +++ b/drivers/video/backlight/dwi_bl.c
>> @@ -0,0 +1,124 @@
[...]
>> +
>> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(struct apple_dwi_bl), GFP_KERNEL);
> 
> sizeof(*)

Ack this change as well for v4.

> 
>> +	if (!dwi_bl)
>> +		return -ENOMEM;
[...]

Nick Chan

