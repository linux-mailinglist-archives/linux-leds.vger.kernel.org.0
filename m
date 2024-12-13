Return-Path: <linux-leds+bounces-3602-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A949F17DD
	for <lists+linux-leds@lfdr.de>; Fri, 13 Dec 2024 22:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 064061668C6
	for <lists+linux-leds@lfdr.de>; Fri, 13 Dec 2024 21:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C9A191F6C;
	Fri, 13 Dec 2024 21:12:29 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ED4188704
	for <linux-leds@vger.kernel.org>; Fri, 13 Dec 2024 21:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734124349; cv=none; b=T7w5vCQUyaTyxL+QjJ+CtwsbtQ++MMvOu9HOBk4vBe+QMyG8m+F3CY6Q0BlFyIpf8nGmRTyHBATl2vB7m+r+DAYHtWVlxu0aMBnilDF/LgF7g9V0UE4hXuZJ+R8OqEJwlt5DoTQvFcsHDMBOWnGkWKvUqc1pVILcMVgth9ojA4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734124349; c=relaxed/simple;
	bh=i7MSvUORILIbIQKYZ0FsHEo8f6eLVvVYLR6saF3x3p8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mo59P11lsBjx/mdVXOUCDmaLl+auw2HcRe6YI8D5bqYH8VREkxpGrWLS9Z9JrQ6Fn/w6TA9WBnUtZ/G8mcxyYH4VD/qb0u5gBLC+SPM7XArW99b/5EgMWOYMk/2fugt73wh43yK0hdbMeowInKCJJUrn1b9L2WfvFostgIivyu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: bizesmtpip4t1734124316th7si9z
X-QQ-Originating-IP: jPqEn8pZ8zoSQ8gwySbX1OXImpj0OTA3fC6ZEMs0Ipk=
Received: from [IPV6:240f:10b:7440:1:a920:fc03 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 14 Dec 2024 05:11:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13607947265060659934
Message-ID: <EF91924B2E892C4C+6a08f801-3ccc-4ccd-a700-c5fc569c11df@radxa.com>
Date: Sat, 14 Dec 2024 06:11:54 +0900
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
 <F60FA21FC28E019E+90aa034b-2edd-435a-a4c4-17910267089d@radxa.com>
 <20241213163540.GB2418536@google.com>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20241213163540.GB2418536@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NWDl/EfWhAWlnijUkvvmRUVZUD+uq+5pv2digAB1oXrBTQlVDU//YLc3
	0G+0Yz5SrTvnUNKaPZ5bLamfLwKs6Q6CqV7TD2CuD1JUA1lAShkNC+8tu2hi+p9oTC6emKd
	sFRG8XKEc9m0mrZDym5tAl3i6vC9WTYDUUXdUkSSGMkHKCqUAAKHGWV6AVK9kf3nIeTKZjE
	VJavPaHaNo3TfKRKSQLPEPYtqCDR37vw5rMhfnNKJ55isRW6zHDOoY++DW1X2M7QZv5E+du
	WKLLZRjiy0ulEOdvqZTnEloNqtIFNf7Gol+E/uVLy2TmQWEU7mLv+tdH5o5pLz02qq/p1JC
	MkquPZzwoLOtwy/o9wppt6Lvjk9iuqI68l+O4juo40RyqCoXUZbGsDFHVLd48ZyKlwCpGQT
	dFzd9E3NHt2gH9AiWp2QBUs9LPGJel22ZY1LP0lfR0tIg2nTi1i0QwRBbtxKYIk131vIk5I
	qDoVvpndPGL6tDDb0LM6MpoZkt2AzX5Q8ZJbDDxdqMidbW8J1tX04Zi+8r3m+bIN2U1vehL
	E1t0L9j4qaxAc3oYps5bVTUUnf9A+QpOs8TXOpuIoo5FwR9cP9QwjsuM6z1WuZQswZ3lQdH
	BuNUh665oKk4V3J/Z6AqznfjRAYtzGVLmyh2qQLhr0KNHUOPxMYN0wYU0YroEswltrXfobL
	fhvBesrYzFuakl3hvPXZDa1sqTDo6ihv8+RUblAOdtNa9CRr1iJChhWxlLhVgVen4TQ8Qx7
	Kmgcshf/7FH8dueHbwjIb31CYKinwxHca0ok15Ll895NZ5lQDy9DseIyAKPrGTqWb4fbdfK
	U96nCgRone/t5AjG4USSDngqu7fcQbqwyXM9g/iu4Ruftv6O+mnht1qbJeqvzw55Urrg9Ue
	8bmzBJeClFaYJ59pGUVHdZqOHaS3stjLK8eABZ2uVNI=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Hi Lee,

On 12/14/24 01:35, Lee Jones wrote:
> On Fri, 13 Dec 2024, FUKAUMI Naoki wrote:
> 
>> Hi,
>>
>> On 12/13/24 04:04, Lee Jones wrote:
>>> On Tue, 10 Dec 2024, FUKAUMI Naoki wrote:
>>>
>>>> Hi,
>>>>
>>>> Could you help me(write good commit message), anyone?
>>>
>>> Surely you know what the changes you authored do and why you authored
>>> them?  Write out a nice description in your first language then use
>>> a free online translation tool to convert it into English.  It doesn't
>>> have to be a novel.  Just describe what you're doing and why it's
>>> needed.
>>
>> I have no knowledge about electrical circuits...
> 
> You must know why you made this change?

I noticed strange behavior on Radxa E25 which have pwm-multicolor.

I compared leds-pwm.c:led_pwm_set() and 
leds-pwm-multicolor.c:led_pwm_mc_set(), and found difference.

Do the same fixed the problem, so I just thought this is correct fix.
No knowledge was required.

Btw, this is enough for me.

  https://lore.kernel.org/linux-leds/d7d930bc-4c82-4272-b2c6-88f7cac5a3e1@chaosfield.at/T/#t

Please ignore my patch. Thank you very much  for your help, and sorry 
for wasting your time.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

