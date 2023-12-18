Return-Path: <linux-leds+bounces-441-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F309681708A
	for <lists+linux-leds@lfdr.de>; Mon, 18 Dec 2023 14:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FD621F2215C
	for <lists+linux-leds@lfdr.de>; Mon, 18 Dec 2023 13:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42225129ED0;
	Mon, 18 Dec 2023 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="DSuPVkoZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC568129EC6;
	Mon, 18 Dec 2023 13:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 24864120002;
	Mon, 18 Dec 2023 16:26:32 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 24864120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1702905992;
	bh=hEKEWxV96Sppv23+lUv1cXH/VDIdkynH55REibS5m+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=DSuPVkoZOiwDglNg6opkAzQYO9j5AbMHfvo8QoJ3yQPwBf0xMJ4XDVF6sIT5Liw+O
	 FOmdxhHbwZXZKCA+BbeQh7yYEW9OnPElzLEL0LcwLu+H+4HNdKDSNKW8nLvqiQ+FnW
	 JLvXkheWuEt1gKaoNuRpTfADZd1A97rkWDnsg7IU6wCYwoZmTuj6bszWAWsvcppMNS
	 MWfrg4lc5FR3H3o13kBE8aMmyn4HTBya9uWt9o0dudCcqrqAr6P3jLZP8tJ7vFUzzv
	 Q4kHDdGaUkzOpanwds6Bp4FLZuxR2s6MRD0blxkRfIH2kP6u87oKBCSVdYicUWw6AU
	 PG9feifyoQcMQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 18 Dec 2023 16:26:31 +0300 (MSK)
Received: from [192.168.1.143] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 18 Dec 2023 16:26:30 +0300
Message-ID: <d160443b-b973-4162-9900-95c04e62cd65@salutedevices.com>
Date: Mon, 18 Dec 2023 16:26:30 +0300
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] locking: introduce devm_mutex_init
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Waiman Long
	<longman@redhat.com>, "andy.shevchenko@gmail.com"
	<andy.shevchenko@gmail.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "lee@kernel.org"
	<lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"will@kernel.org" <will@kernel.org>, "boqun.feng@gmail.com"
	<boqun.feng@gmail.com>, "nikitos.tr@gmail.com" <nikitos.tr@gmail.com>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"kernel@salutedevices.com" <kernel@salutedevices.com>
References: <20231214173614.2820929-1-gnstark@salutedevices.com>
 <20231214173614.2820929-3-gnstark@salutedevices.com>
 <5c10f66c-3fd8-4861-994b-13e71c24f10a@redhat.com>
 <b158ca2b-7300-4ad0-82b8-e1442d267734@csgroup.eu>
 <300d2131-87ef-48c1-b162-dcef0d8d5722@redhat.com>
 <5ef8a83a-5dfd-4038-851e-c730d5f1b6f3@csgroup.eu>
 <1e5907f2-c794-4ee2-8abc-b45831cca5bb@salutedevices.com>
 <0a81e53d-f837-486c-8b0b-7a3c62853be7@csgroup.eu>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <0a81e53d-f837-486c-8b0b-7a3c62853be7@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 182174 [Dec 18 2023]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;elixir.bootlin.com:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/12/18 11:26:00
X-KSMG-LinksScanning: Clean, bases: 2023/12/18 11:26:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/18 10:59:00 #22677376
X-KSMG-AntiVirus-Status: Clean, skipped

Hello Christophe


On 12/17/23 12:31, Christophe Leroy wrote:

...
>>>>>>> ---
>>>>>>>      include/linux/mutex.h        | 23 +++++++++++++++++++++++
>>>>>>>      kernel/locking/mutex-debug.c | 22 ++++++++++++++++++++++
>>>>>>>      2 files changed, 45 insertions(+)
>>>>>>>
>>>>>>> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
>>>>>>> index a33aa9eb9fc3..ebd03ff1ef66 100644
>>>>>>> --- a/include/linux/mutex.h
>>>>>>> +++ b/include/linux/mutex.h
>>>>>>> @@ -21,6 +21,8 @@
>>>>>>>      #include <linux/debug_locks.h>
>>>>>>>      #include <linux/cleanup.h>
>>>>>>> +struct device;
>>>>>>> +
>>>>>>>      #ifdef CONFIG_DEBUG_LOCK_ALLOC
>>>>>>>      # define __DEP_MAP_MUTEX_INITIALIZER(lockname)            \
>>>>>>>              , .dep_map = {                    \
>>>>>>> @@ -127,6 +129,20 @@ extern void __mutex_init(struct mutex *lock,
>>>>>>> const char *name,
>>>>>>>       */
>>>>>>>      extern bool mutex_is_locked(struct mutex *lock);
>>>>>>> +#ifdef CONFIG_DEBUG_MUTEXES
>>>>>>> +
>>>>>>> +int devm_mutex_init(struct device *dev, struct mutex *lock);
>>>>>> Please add "extern" to the function declaration to be consistent with
>>>>>> other functional declarations in mutex.h.
>>>>> 'extern' is pointless and deprecated on function prototypes. Already
>>>>> having some is not a good reason to add new ones, errors from the past
>>>>> should be avoided nowadays. With time they should all disappear so
>>>>> don't
>>>>> add new ones.
>>>> Yes, "extern" is optional. It is just a suggestion and I am going to
>>>> argue about that.
>>>
>>> FWIW, note that when you perform a strict check with checkpatch.pl, you
>>> get a warning for that:
>>>
>>> $ ./scripts/checkpatch.pl --strict -g HEAD
>>> CHECK: extern prototypes should be avoided in .h files
>>> #56: FILE: include/linux/mutex.h:131:
>>> +extern int devm_mutex_init(struct device *dev, struct mutex *lock);
>>>
>>> total: 0 errors, 0 warnings, 1 checks, 99 lines checked
>>
>> This is ambiguous situation about extern. It's deprecated and useless on
>> one hand but harmless. And those externs will not disappear by themself
>> - it'll be one patch that clean them all at once (in one header at
>> least) so one more extern will not alter the overall picture.
> 
> That kind of cleanup patch bomb is a nightmare for backporting, so if it
> happens one day it should be as light as possible, hence the importance
> to not add new ones and remove existing one everytime you modify or move
> a line including it for whatever reason.
> 
>>
>> On the other hand if we manage to place devm_mutex_init near
>> mutex_destroy then we'll have:
>>
>> int devm_mutex_init(struct device *dev, struct mutex *lock);
>> extern void mutex_destroy(struct mutex *lock);
> 
> I sent you an alternative proposal that avoids duplication of the static
> inline version of devm_mutex_init(). If you agree with it just take it
> into your series and that question will vanish.

Thanks for that patch by the way. The only comment is that moving 
mutex_destroy
should be done in a separate patch IMO.
Waiman Long proposed such a refactoring here:
https://lore.kernel.org/lkml/20231216013656.1382213-2-longman@redhat.com/T/

With this patch adding devm_mutex_init would be straightforward.

>>
>> and it raises questions and does not look very nice.
> 
> If you look at linux/mm.h there are plenty of them anyway, so why do
> different ? For an exemple look at
> https://elixir.bootlin.com/linux/v6.7-rc4/source/include/linux/mm.h#L2372
Oh, I see. Ok, I don't have any more arguments against removing extern.
We'll see what mutex.h maintainers decide.

> 
> Christophe

-- 
Best regards
George

