Return-Path: <linux-leds+bounces-3596-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3724E9EFE1A
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 22:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E899228873C
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 21:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140F21AF0BF;
	Thu, 12 Dec 2024 21:20:27 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC16D1AAE28
	for <linux-leds@vger.kernel.org>; Thu, 12 Dec 2024 21:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734038427; cv=none; b=h+KcWp4DV7eBOZsUiPgFnSqalPC/bn9j0d5PoW3xh84mUEjOAc6aIkclqzAT/wBDSyu+CXnJ2V+s4JIKbOVDL5DCKuBPx/pA0iMbBrO6Ke1qw2XjD63uzrLhMcn8gTF3DQAdH+p8XFsq2DnSivZ6Xp40Q5+UjsoOagODXMISaDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734038427; c=relaxed/simple;
	bh=3PqQygv5UPnaxpQbleWMfB12fYrnCA/wpZe0JYmu7uU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6yGKY00McsIAKRIe1yYpaCMt5upyOZICcngi8DOPVMFEBC79OJQuw5PjS/aFkqHaRxrXheDzI8H8bNn7JmcgaVvqeXiYAZSeWEXbrIP7Ghh4shsFUjDyEIhZa32/6v+gqSpeh7tKRAm7x8Bv0Dp87AydwvEbpYR3+CrWrGWhH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: bizesmtpip4t1734038392ta5262s
X-QQ-Originating-IP: Y7TJ0cJUozQ+NkWcZp+iJrjddb8cROyz+naivlSq0KE=
Received: from [IPV6:240f:10b:7440:1:3aa0:e3a1 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Dec 2024 05:19:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17130412063070484617
Message-ID: <F60FA21FC28E019E+90aa034b-2edd-435a-a4c4-17910267089d@radxa.com>
Date: Fri, 13 Dec 2024 06:19:50 +0900
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: pwm-multicolor: fix multicolor PWM LED lights up
 without any setting
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
References: <20240816102626.826-1-naoki@radxa.com>
 <20240821161119.GC6858@google.com>
 <A85312FB70235D56+bd5fad03-36bf-4df9-ad44-7f7eaa7b2aa9@radxa.com>
 <7DDC06B563854ED8+65e7204f-76df-4f36-8544-bede36a519fd@radxa.com>
 <303538E55468284B+287412a2-b1dc-45d0-af5d-c33c0c63acc5@radxa.com>
 <20241212190407.GM7139@google.com>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20241212190407.GM7139@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OeFOmPvKThpBU8D/pgZU6DpcB6uD8dGxLQSpWUBCnynCPIkEPpw5ZiWp
	cVdco+qSMuZ04JR4JawMnThNfJwgywSJmfLZ1UB+1RTiv5uxm9xfwuVpdxr5p1vs+pLcv/C
	eaJHItiarYzwWVFt0mCfbNXQ8+DMJJo7XeIK1OJprA36hVVpngk2JtL6tGgbaxK4HIJmnKJ
	CKavm6j013Zx0fvawK2Dq0uF0N44HS8n/mdMpPBNHrKQcZoUjqhXfWlNXLNcXN48afsQ/zM
	tMjsNNaCUj8rxcV7DZIKs4lVWe5aHls0NaroI/eCQBJ8479WrAZe13Zc1m92I+sgd1PROfW
	aXU78VKclio54SMnP9iHXYi6p/yNJQw2v+lG45FSFzVHao2n0ARoHhAYNhm3EGWVoF++8Pd
	kZPiQvbIv27ELd0oWZdpZv1XjvLbWC+nBmsnfyRWab8nj6RlIyEvT7JL8omeC0/XRqnHFzA
	Ex866loVKuhkbLkQ4DeeOyKuMCsQUED0OqG5gGYEBzgPsNfORDC/VaCiBtICkdPeduXwbzZ
	j6xbpTuM2sOnrWs0q0UWvAeb2xWHRAjJytY929mcD7DGsQXOt3cdf54WEg+Ftho8dK71LST
	AH7w/8lNGqKhZ76oFh0NrbqV5XMdEgQyXCerWAKBVJCv4gqL+Um6lRoEvRX0iUnvwpk9vwG
	PgXCg/mYJONKtNHb7hHRZSHtMH6y7+8dLwxNGuT+kUQjzV0zVQrxNyuAmwwMvO8hApFhV16
	vBTcQlnw2mQXwXk7c0oobRA0vNoPl9obuV5xtQGf+xxQg9Kcz+WMWIewg8ouGcfQR/bOB7h
	F2yiiriojhdpIL/3i10P2vOqWP3c+82niUVaQoeg1AsXYqdBg7juL3bDW7trgE8VWtyf6cf
	pH2ZWvmx+M67bWMtt3c1eCRwrO0toMff10WWc0FFxgOSFOuHgsh3MRHjxQz8YQ9w46JBXzK
	qBVwdIYR4H+B6jw==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Hi,

On 12/13/24 04:04, Lee Jones wrote:
> On Tue, 10 Dec 2024, FUKAUMI Naoki wrote:
> 
>> Hi,
>>
>> Could you help me(write good commit message), anyone?
> 
> Surely you know what the changes you authored do and why you authored
> them?  Write out a nice description in your first language then use
> a free online translation tool to convert it into English.  It doesn't
> have to be a novel.  Just describe what you're doing and why it's
> needed.

I have no knowledge about electrical circuits...

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

