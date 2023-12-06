Return-Path: <linux-leds+bounces-280-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFB380783F
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 19:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC29A28214D
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 18:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B0A39FF5;
	Wed,  6 Dec 2023 18:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="vjoGeMqQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885F8135;
	Wed,  6 Dec 2023 10:57:56 -0800 (PST)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2655710008B;
	Wed,  6 Dec 2023 21:57:54 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2655710008B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1701889074;
	bh=NpLezAFU20p4lA7RI8RTAGPwTi4pPAE1O8kaflmrNRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=vjoGeMqQYKof9wKSyhrKFmyRPNzz1k2CemNQ7cMCCih1In9i6AN6Tx++T0YQnPB6q
	 ZJcRO/q731yRGju+EjlcvFBlj/q4QJmUNMunyTPO00S7dWcIgvL+39/SbVafexP8vv
	 4/XUwTgil6H5GSotFbj+LdaoV0J4vQW4Cn8y6LSsxDTqBhL4ofbZUizB09pQ1jNNLF
	 8kRN7st0f6hBqVdfCYxtoCWwJZN7XdSydsI/TLj84dguXFY106D7hUDH/NaOVTNgHf
	 a+PiLuDS8sUf1dfNvXDO1d1Oytdmkv/pgeYcCvew5yhqkqNY0vB2uPNv1JuyLMy5RT
	 mOul8+KdBfMNA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  6 Dec 2023 21:57:53 +0300 (MSK)
Received: from [192.168.1.127] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 6 Dec 2023 21:57:53 +0300
Message-ID: <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
Date: Wed, 6 Dec 2023 21:58:18 +0300
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
To: Hans de Goede <hdegoede@redhat.com>, <pavel@ucw.cz>, <lee@kernel.org>,
	<vadimp@nvidia.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <mazziesaccount@gmail.com>,
	<andy.shevchenko@gmail.com>, <jic23@kernel.org>, <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <kernel@salutedevices.com>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
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
X-KSMG-AntiSpam-Info: LuaCore: 5 0.3.5 98d108ddd984cca1d7e65e595eac546a62b0144b, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/06 17:41:00 #22621737
X-KSMG-AntiVirus-Status: Clean, skipped


Hello Hans

Thanks for the review.

On 12/6/23 18:01, Hans de Goede wrote:
> Hi George,
> 
> On 12/4/23 19:05, George Stark wrote:
>> Using of devm API leads to certain order of releasing resources.
>> So all dependent resources which are not devm-wrapped should be deleted
>> with respect to devm-release order. Mutex is one of such objects that
>> often is bound to other resources and has no own devm wrapping.
>> Since mutex_destroy() actually does nothing in non-debug builds
>> frequently calling mutex_destroy() is just ignored which is safe for now
>> but wrong formally and can lead to a problem if mutex_destroy() is
>> extended so introduce devm_mutex_init().
>>
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>> ---
>>   include/linux/devm-helpers.h | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
>> index 74891802200d..2f56e476776f 100644
>> --- a/include/linux/devm-helpers.h
>> +++ b/include/linux/devm-helpers.h
>> @@ -76,4 +76,22 @@ static inline int devm_work_autocancel(struct device *dev,
>>   	return devm_add_action(dev, devm_work_drop, w);
>>   }
>>   
>> +static inline void devm_mutex_release(void *res)
>> +{
>> +	mutex_destroy(res);
>> +}
>> +
>> +/**
>> + * devm_mutex_init - Resource-managed mutex initialization
>> + * @dev:	Device which lifetime work is bound to
>> + * @lock:	Pointer to a mutex
>> + *
>> + * Initialize mutex which is automatically destroyed when driver is detached.
>> + */
>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>> +{
>> +	mutex_init(lock);
>> +	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>> +}
>> +
>>   #endif
> 
> mutex_destroy() only actually does anything if CONFIG_DEBUG_MUTEXES
> is set, otherwise it is an empty inline-stub.
> 
> Adding a devres resource to the device just to call an empty inline
> stub which is a no-op seems like a waste of resources. IMHO it
> would be better to change this to:
> 
> static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
> {
> 	mutex_init(lock);
> #ifdef CONFIG_DEBUG_MUTEXES
> 	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
> #else
> 	return 0;
> #endif
> }
> 
> To avoid the unnecessary devres allocation when
> CONFIG_DEBUG_MUTEXES is not set.

Honestly saying I don't like unnecessary devres allocation either but 
the proposed approach has its own price:

1) we'll have more than one place with branching if mutex_destroy is 
empty or not using  indirect condition. If suddenly mutex_destroy is 
extended for non-debug code (in upstream branch or e.g. by someone for 
local debug) than there'll be a problem.

2) If mutex_destroy is empty or not depends on CONFIG_PREEMPT_RT option 
too. When CONFIG_PREEMPT_RT is on mutex_destroy is always empty.

As I see it only the mutex interface (mutex.h) has to say definitely if 
mutex_destroy must be called. Probably we could add some define to 
include/linux/mutex.h,like IS_MUTEX_DESTROY_REQUIRED and declare it near 
mutex_destroy definition itself.

I tried to put devm_mutex_init itself in mutex.h and it could've helped 
too but it's not the place for devm API.

> 
> Regards,
> 
> Hans
> 
> 
> 
> 

-- 
Best regards
George

