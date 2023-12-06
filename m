Return-Path: <linux-leds+bounces-286-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 932D3807C44
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 00:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D72F281CF7
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 23:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5744A2E408;
	Wed,  6 Dec 2023 23:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="gRFtb60t"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAACA5;
	Wed,  6 Dec 2023 15:23:40 -0800 (PST)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DAF13120066;
	Thu,  7 Dec 2023 02:23:38 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DAF13120066
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1701905018;
	bh=yvF2SZwmurJWRx5PI01s22bdGazI+Cl9Ods81mAJ+cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=gRFtb60t5bsL5nvUky8BoCH+URQtFtrtYW/Wx1T80+tkZhCOdJ4PWWiFk8Ja7ZMDv
	 wGdCVbSxfAL8Qoem68bGTgMOQLZWB8QF0QXwozT3TddTC96o/itKlSQxN4hk0/YcoW
	 pkX9yN1JZt1ci7HdPZvLELlacccYz9I9R2BotZmyJmsWQdOC+YCt0gOyk+HepuZNu6
	 VQh42UrK0kncteKF48yFVl5UFHcjM4zF7hERW9Xdylfk0gKWHaqGinKpuNoNKKaty9
	 FChNOsslIfmvTTW5k8LJE3OpDXYx3/H47PpScKMg+Wg+Yo6eCI6dmQ3Pues281iJj3
	 lH+Xtg4rCUFcQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  7 Dec 2023 02:23:38 +0300 (MSK)
Received: from [192.168.1.127] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 7 Dec 2023 02:23:38 +0300
Message-ID: <2a68534b-9e64-4d6e-8a49-eeab0889841b@salutedevices.com>
Date: Thu, 7 Dec 2023 02:24:03 +0300
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Hans de Goede
	<hdegoede@redhat.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "lee@kernel.org"
	<lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "jic23@kernel.org"
	<jic23@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, Waiman
 Long <longman@redhat.com>, <mingo@redhat.com>, <will@kernel.org>,
	<boqun.feng@gmail.com>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"kernel@salutedevices.com" <kernel@salutedevices.com>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
 <17a9fede-30e8-4cd5-ae02-fe34e11f5c20@csgroup.eu>
 <be693688-2e82-4e1a-9ead-cf1513ee637b@csgroup.eu>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <be693688-2e82-4e1a-9ead-cf1513ee637b@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181917 [Dec 06 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 5 0.3.5 98d108ddd984cca1d7e65e595eac546a62b0144b, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, aka.ms:7.1.1;lore.kernel.org:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;salutedevices.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/12/06 22:45:00
X-KSMG-LinksScanning: Clean, bases: 2023/12/06 22:45:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/06 20:57:00 #22623256
X-KSMG-AntiVirus-Status: Clean, skipped

Hello Christophe

On 12/7/23 01:37, Christophe Leroy wrote:
> 
> 
> Le 06/12/2023 à 23:14, Christophe Leroy a écrit :
>>
>>
>> Le 06/12/2023 à 19:58, George Stark a écrit :
>>> [Vous ne recevez pas souvent de courriers de
>>> gnstark@salutedevices.com. Découvrez pourquoi ceci est important à
>>> https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Hello Hans
>>>
>>> Thanks for the review.
>>>
>>> On 12/6/23 18:01, Hans de Goede wrote:
>>>> Hi George,
>>>>
>>>> On 12/4/23 19:05, George Stark wrote:
>>>>> Using of devm API leads to certain order of releasing resources.
>>>>> So all dependent resources which are not devm-wrapped should be deleted
>>>>> with respect to devm-release order. Mutex is one of such objects that
>>>>> often is bound to other resources and has no own devm wrapping.
>>>>> Since mutex_destroy() actually does nothing in non-debug builds
>>>>> frequently calling mutex_destroy() is just ignored which is safe for
>>>>> now
>>>>> but wrong formally and can lead to a problem if mutex_destroy() is
>>>>> extended so introduce devm_mutex_init().
>>>>>
>>>>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>>>>> ---
>>>>>    include/linux/devm-helpers.h | 18 ++++++++++++++++++
>>>>>    1 file changed, 18 insertions(+)
>>>>>
>>>>> diff --git a/include/linux/devm-helpers.h
>>>>> b/include/linux/devm-helpers.h
>>>>> index 74891802200d..2f56e476776f 100644
>>>>> --- a/include/linux/devm-helpers.h
>>>>> +++ b/include/linux/devm-helpers.h
>>>>> @@ -76,4 +76,22 @@ static inline int devm_work_autocancel(struct
>>>>> device *dev,
>>>>>       return devm_add_action(dev, devm_work_drop, w);
>>>>>    }
>>>>>
>>>>> +static inline void devm_mutex_release(void *res)
>>>>> +{
>>>>> +    mutex_destroy(res);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * devm_mutex_init - Resource-managed mutex initialization
>>>>> + * @dev:    Device which lifetime work is bound to
>>>>> + * @lock:   Pointer to a mutex
>>>>> + *
>>>>> + * Initialize mutex which is automatically destroyed when driver is
>>>>> detached.
>>>>> + */
>>>>> +static inline int devm_mutex_init(struct device *dev, struct mutex
>>>>> *lock)
>>>>> +{
>>>>> +    mutex_init(lock);
>>>>> +    return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>>>>> +}
>>>>> +
>>>>>    #endif
>>>>
>>>> mutex_destroy() only actually does anything if CONFIG_DEBUG_MUTEXES
>>>> is set, otherwise it is an empty inline-stub.
>>>>
>>>> Adding a devres resource to the device just to call an empty inline
>>>> stub which is a no-op seems like a waste of resources. IMHO it
>>>> would be better to change this to:
>>>>
>>>> static inline int devm_mutex_init(struct device *dev, struct mutex
>>>> *lock)
>>>> {
>>>>        mutex_init(lock);
>>>> #ifdef CONFIG_DEBUG_MUTEXES
>>>>        return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>>>> #else
>>>>        return 0;
>>>> #endif
>>>> }
>>>>
>>>> To avoid the unnecessary devres allocation when
>>>> CONFIG_DEBUG_MUTEXES is not set.
>>>
>>> Honestly saying I don't like unnecessary devres allocation either but
>>> the proposed approach has its own price:
>>>
>>> 1) we'll have more than one place with branching if mutex_destroy is
>>> empty or not using  indirect condition. If suddenly mutex_destroy is
>>> extended for non-debug code (in upstream branch or e.g. by someone for
>>> local debug) than there'll be a problem.
>>>
>>> 2) If mutex_destroy is empty or not depends on CONFIG_PREEMPT_RT option
>>> too. When CONFIG_PREEMPT_RT is on mutex_destroy is always empty.
>>>
>>> As I see it only the mutex interface (mutex.h) has to say definitely if
>>> mutex_destroy must be called. Probably we could add some define to
>>> include/linux/mutex.h,like IS_MUTEX_DESTROY_REQUIRED and declare it near
>>> mutex_destroy definition itself.
>>>
>>> I tried to put devm_mutex_init itself in mutex.h and it could've helped
>>> too but it's not the place for devm API.
>>>
>>
>> What do you mean by "it's not the place for devm API" ?
>>
>> If you do a 'grep devm_ include/linux/' you'll find devm_ functions in
>> almost 100 .h files. Why wouldn't mutex.h be the place for
>> devm_mutex_init() ?
mutex.h's maintainers believe so.

https://lore.kernel.org/lkml/070c174c-057a-46de-ae8e-836e9e20eceb@salutedevices.com/T/#mb42e1d7760816b0cedd3130e08f29690496b5ac2
> 
> Looking at it closer, I have the feeling that you want to do similar to
> devm_gpio_request() in linux/gpio.h :
> 
> In linux/mutex.h, add a prototype for devm_mutex_init() when
> CONFIG_DEBUG_MUTEXES is defined and an empty static inline otherwise.
> Then define devm_mutex_init() in kernel/locking/mutex-debug.c

Yes, this would be almost perfect decision. BTW just as in linux/gpio.h
we wouldn't have to include whole "linux/device.h" into mutex.h, only 
add forward declaration of struct device;

> 
> Wouldn't that work ?
> 
> Christophe

-- 
Best regards
George

