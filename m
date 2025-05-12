Return-Path: <linux-leds+bounces-4620-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75125AB42EF
	for <lists+linux-leds@lfdr.de>; Mon, 12 May 2025 20:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72593188DCB1
	for <lists+linux-leds@lfdr.de>; Mon, 12 May 2025 18:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FFE29A313;
	Mon, 12 May 2025 18:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkPMOGuT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBD023C4E7;
	Mon, 12 May 2025 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747073410; cv=none; b=oFW5zP1mAN8oAz8WsvJfiLMu7NBWHAsNUs/fQ1nQ+K1dp/ph16wHB0MbyOr6Rx18lRwUC7fyGHNzbuQdyU5As2DVrjieVNEY0YUC1tmSgShsPWhbZ92z8VI89SeFPVCYpJydIQdkPJYchpIIHkPcktG50M6QxUox/BAREwM424Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747073410; c=relaxed/simple;
	bh=uFUaSVYNAvXIYAUNz+Rx/NPSaWzGUE/AKMdPflMdRX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GC5EOWXJiTK1MoNPnRdhpX+ajEEp63TfTLgv8YjannDxubk/6McI0ymvHWNnxrxn410HBnmWerR5nMu6DyKsVB6CrlZa/+QDog+9ZkjM0kLxDLQGPdDWfSWbiQEjgSILRQj3KcgHukEOcqCidf4i/BUBrLTXJuKuB6LmeaTx3yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkPMOGuT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad24677aaf6so242798366b.2;
        Mon, 12 May 2025 11:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747073406; x=1747678206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZmBBbW75s2tlX7b8l6/8ObAx8ZWM6smBqykkodUDjYg=;
        b=fkPMOGuTPO+VnZhJWW+v1co8w5t7ZUxNi/kjz+bMbSHWtT0+Aby66U4jDa8mcG5fz0
         2zP79ZxTzhB/r4qTmx3PgFf/3gZoI8R4vBLgzjJnzZ9orLtkf2CO6FieiQNW207iG7cb
         9Hq4jHVVGlEXQEYwmyQSCtyRMWMqrhpViIq640LmzBZNPy7bUJcksPcbjLNUPVISfTzl
         I0MGhNf7FEwjIG5WVIeYvjHT4hYNEMNEnvvMOjGr+wMSJuZD/HtpdkccLH+EjRxa2e/N
         lUooAhtRPwD0c2R5JwqJFCY1NIUiZT9SPO3AuHlw4/Wtbe+zhQRwsALjzwpFTY1xF1Vs
         Pc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073406; x=1747678206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmBBbW75s2tlX7b8l6/8ObAx8ZWM6smBqykkodUDjYg=;
        b=G4qFiCWoDRK5ZW7rBiXuygafjZVxYTfRas8CEQKVaD4zq6jnN/l9hfaTohorGzLIFG
         jN6OOEbdbw41YrEm15QuRYhM5kfTQU+i1BzxD12OBMfLhoCSeL/rW3SYoJGRWe+Z1JHI
         zZ6C/osnHqk6rL2Vh4ADVTRZUbicQadfq0ijDyWn0hwjkGH33QMEIsJ9321IN+SYnqUc
         Ho+YIgrKS0XJuJIVzEX9ZQUcGIg1tUK3rrs1XxU0SBO6fM9C0zh8EyolT6hOoth/09LY
         cw1wEMkDKkEHwxMXLZVx6aO4F5pAR4K4cfV4WwxxZkbgg03fj2OuKDo1qVQO6qKv/CPN
         OaNw==
X-Forwarded-Encrypted: i=1; AJvYcCWm2eSN2DZ/7Q+w3DR2XUGVo7uUL7aPTjFKJ3bV+JRXVurze2I/r7Ub4ZPnp8/+AqPTFCC2z3iK8X6NMok=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoXJVcViLl9kOYZl8uYy6aeG8hYT5pyrsQNIhMlra2ZRzWngd5
	SyLhN7Tb9S3TBSC7rzTpe4lVsvatWX7/ZnyxiWBLE557pE5YmnHx
X-Gm-Gg: ASbGncux+zuWgVlUBrf7y8xba/VKGR747V1cGiei9jzHyHECK39NKjHbAj+KkDrjnmL
	T/FyDJO+dJXWkJShOcFL91LkXL35VFPEsO9M2lBboJNg2zg/+ViNFbJFp8NJxDYKyX2ftpGAEVZ
	kQoEQdyb649q38+xapZDesMCAXqI1BYz3f0abeCmh1JeW7tpwCaCgl+OoJq5mENqPWrGaWa1fKO
	6G0RDTo+v0iizl+W4/23RjNzFevJmNtPcZ580dyX1dRM8bQ+9WSdiIJkU7rf36p9hQwst1RYXqA
	T+B/QyY+VlobT52mkAjed91njlzgw7pCAjP49jwiWjAh+4ZkfiqUsgxpBfNXQY5t
X-Google-Smtp-Source: AGHT+IHPlyAlfrTqN1w3LVNPrQcr8DnOtPZtyVS9h3hXu/7aJDgKkYIIkXZJU+QeSspXhQoWh6PZ0Q==
X-Received: by 2002:a17:907:9453:b0:aca:a3da:80b8 with SMTP id a640c23a62f3a-ad21917d128mr1642453866b.55.1747073406421;
        Mon, 12 May 2025 11:10:06 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad24085b44fsm391903966b.149.2025.05.12.11.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:10:05 -0700 (PDT)
Message-ID: <0bf10848-0fa2-438a-92dc-6d3b29760b64@gmail.com>
Date: Mon, 12 May 2025 20:10:04 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct
 multi_index
To: Johan Adolfsson <Johan.Adolfsson@axis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kernel <Kernel@axis.com>
References: <20250506-led-fix-v1-1-56a39b55a7fc@axis.com>
 <62a74e0e-f5a1-40b5-a855-6e9bd620cbd5@gmail.com>
 <PAWPR02MB92814A311B18A6FD8A448D249B97A@PAWPR02MB9281.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <PAWPR02MB92814A311B18A6FD8A448D249B97A@PAWPR02MB9281.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/25 12:59, Johan Adolfsson wrote:
> 
> From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Sent: Saturday, May 10, 2025 17:32
> To: Johan Adolfsson; Lee Jones; Pavel Machek
> Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; Kernel
> Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct multi_index
> 
>> Hi Johan,
>>
>> On 5/6/25 12:39, Johan Adolfsson wrote:
>>> mc_subled used for multi_index needs well defined array indexes,
>>> to guarantee the desired result, optionally use reg for that.
>>>
>>> If devicetree child nodes is processed in random or reverse order
>>> you may end up with multi_index "blue green red" instead of the expected
>>> "red green blue".
>>> If user space apps uses multi_index to deduce how to control the leds
>>> they would most likely be broken without this patch if devicetree
>>> processing is reversed (which it appears to be).
>>
>> Are you trying to solve some real problem that occurred to you?
> 
> Yes! Since the subled is indexed by the processing order, it gets reversed if devicetree processing is reversed
> (which I understand is a "feature"), so instead of "red green blue" I would get "blue green red" in the multi_index file without this patch.
> The mapping to the hardware does not match that, so writing "255 0 0" to multi_intensity will give me red and not blue.

You are expected to write intensities to the multi_intensity file
according to the order of colors listed in multi_index file.

>> The order of DT nodes parsing is not a problem here - we save
>> color index in subled_info to be able to figure out which color
>> is on which position. This information can be retrieved in sysfs
>> by reading multi_index file.
> 
> Maybe the bug is somewhere else in the leds-lp50xx if that is supposed to work,
> but I still think it's a good thing to be able to get the expected order in the multi_index file.

Please make sure you read Documentation/leds/leds-class-multicolor.rst.
There is no such term as "expected order in the multi_index file".
The framework is called multicolor, not rgb. The order of colors does
not need to be RGB.

-- 
Best regards,
Jacek Anaszewski


