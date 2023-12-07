Return-Path: <linux-leds+bounces-287-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE9807D46
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 01:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A57052822CF
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 00:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495CA1FDA;
	Thu,  7 Dec 2023 00:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="eLBzwGt4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E27918D;
	Wed,  6 Dec 2023 16:37:38 -0800 (PST)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id BA85C10008B;
	Thu,  7 Dec 2023 03:37:34 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BA85C10008B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1701909454;
	bh=w3ig8HKr+ZAmPCXvY9qhVRQJzEehR0Y+0PRlMyi2i8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=eLBzwGt4ngbfxSOwCf/mdIDH532HyZ+Dfsz4r8glt+X+82Tq08VDM3SeS4s6DGgL4
	 6A2kldEpUR9n+LBo47HxHCqLq2nubuNzHk59kMNi6r+yNUGgphXBiRzV6vcHIhhXkq
	 CoVhHfRq4lwGZ55oAMAzloqGgZ+Z4uEjcYBHWMuQV91HreSyFjiWpD37pzTeQS0sft
	 xH6LGuoLX6EsyykwMXKjX5JV5plcqr7XLSLwrZI+v/5NnMe23l1LUTMe2s+W2llf1K
	 RyFjwthX8eZNqJZuTSbVkLBkqDTTI/MCtIwJ9UvB7+1sV+TgDihvzslR1EHWba/WAo
	 17yrUDStnM57w==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  7 Dec 2023 03:37:34 +0300 (MSK)
Received: from [192.168.1.127] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 7 Dec 2023 03:37:34 +0300
Message-ID: <75368bdb-b54e-4e15-a3c0-89b920e5e729@salutedevices.com>
Date: Thu, 7 Dec 2023 03:37:59 +0300
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Content-Language: en-US
To: Waiman Long <longman@redhat.com>, Hans de Goede <hdegoede@redhat.com>,
	<pavel@ucw.cz>, <lee@kernel.org>, <vadimp@nvidia.com>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<mazziesaccount@gmail.com>, <andy.shevchenko@gmail.com>, <jic23@kernel.org>,
	<peterz@infradead.org>, <boqun.feng@gmail.com>, <will@kernel.org>,
	<mingo@redhat.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <kernel@salutedevices.com>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
 <580ecff0-b335-4cc0-b928-a99fe73741ca@redhat.com>
 <469f44fb-2371-4b3b-bc1c-d09ec35a5ec8@redhat.com>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <469f44fb-2371-4b3b-bc1c-d09ec35a5ec8@redhat.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 5 0.3.5 98d108ddd984cca1d7e65e595eac546a62b0144b, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/06 22:56:00 #22625610
X-KSMG-AntiVirus-Status: Clean, skipped

Hello Waiman

Thanks for the review.

On 12/7/23 00:02, Waiman Long wrote:
> On 12/6/23 14:55, Hans de Goede wrote:
>> Hi,
>>
>> On 12/6/23 19:58, George Stark wrote:
>>> Hello Hans
>>>
>>> Thanks for the review.
>>>
>>> On 12/6/23 18:01, Hans de Goede wrote:
>>>> Hi George,
>>>>
...
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
>>>>      mutex_init(lock);
>>>> #ifdef CONFIG_DEBUG_MUTEXES
>>>>      return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>>>> #else
>>>>      return 0;
>>>> #endif
>>>> }
>>>>
>>>> To avoid the unnecessary devres allocation when
>>>> CONFIG_DEBUG_MUTEXES is not set.
>>> Honestly saying I don't like unnecessary devres allocation either but 
>>> the proposed approach has its own price:
>>>
>>> 1) we'll have more than one place with branching if mutex_destroy is 
>>> empty or not using  indirect condition. If suddenly mutex_destroy is 
>>> extended for non-debug code (in upstream branch or e.g. by someone 
>>> for local debug) than there'll be a problem.
>>>
>>> 2) If mutex_destroy is empty or not depends on CONFIG_PREEMPT_RT 
>>> option too. When CONFIG_PREEMPT_RT is on mutex_destroy is always empty.
>>>
>>> As I see it only the mutex interface (mutex.h) has to say definitely 
>>> if mutex_destroy must be called. Probably we could add some define to 
>>> include/linux/mutex.h,like IS_MUTEX_DESTROY_REQUIRED and declare it 
>>> near mutex_destroy definition itself.
>> That (a  IS_MUTEX_DESTROY_REQUIRED define) is an interesting idea. 
>> Lets s>
>>>> Adding a devres resource to the device just to call an empty inline
>>>> stub which is a no-op seems like a waste of resources. IMHO it
>>>> would be better to change this to:
>>>>
>>>> static inline int devm_mutex_init(struct device *dev, struct mutex 
>>>> *lock)
>>>> {
>>>>      mutex_init(lock);
>>>> #ifdef CONFIG_DEBUG_MUTEXES
>>>>      return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>>>> #else
>>>>      return 0;
>>>> #endif
>>>> }
>>>>ee for v3 if the mutex maintainers will accept that and if not 
>> then I guess we will just need to live with the unnecessary devres 
>> allocation.
> 
> The purpose of calling mutex_destroy() is to mark a mutex as being 
> destroyed so that any subsequent call to mutex_lock/unlock will cause a 
> warning to be printed when CONFIG_DEBUG_MUTEXES is defined. I would not 
> say that mutex_destroy() is required. Rather it is a nice to have for 
> catching programming error.

This is quite understandable but probably mutex_destroy() is not the 
best name for an optional API. Questions are asked over and over again
if it can be safely ignored taking into account that it could be 
extended in the future. Every maintainer makes decision on that question
in his own way and it leads to inconsistency.

devm_mutex_init could take responsibility for calling/dropping 
mutex_destroy() on its own.


> Cheers,
> Longman
> 

-- 
Best regards
George

