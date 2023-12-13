Return-Path: <linux-leds+bounces-263-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E0A8069BB
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 09:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC3501F21506
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 08:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90F7199BE;
	Wed,  6 Dec 2023 08:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="vxN5p6jE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5E9C3;
	Wed,  6 Dec 2023 00:36:38 -0800 (PST)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 60DDF120060;
	Wed,  6 Dec 2023 11:36:37 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 60DDF120060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1701851797;
	bh=PztdEW0xhmNig1Jf/KpOL61YyUiWvUZMISRC9osi97g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=vxN5p6jEcJJJiAqh3IdaPqNDQVRAmeTFUEksSk91Wl0/v0i99W8+GCqTnwum1mueZ
	 9iKNqcBjBs2+JGw+v9j6r8QLS3p6r9b8m/hW/JLS4sDZ4QsRiBP9Szkwql0yiAKUud
	 YeyDL9+G2U3qH6b4GSnT363OJkrsUY3EAcnH/FZmbSgyb/7zoZYP6zVU5AarSNcMu/
	 W3Drw/Q+HTjsdoylnmWhJWAXXl+0evDD79GkKdJX/Bxhq2ZRxl3MPdhbN7NznSYqyt
	 GUM+z8prfN6/UXY4m0Xhs0QjryNvr/OlAWAvWmAUpIpwLOEupQVz1Zn4dnWl/Ibin/
	 eNIA3Ox5aj3ew==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  6 Dec 2023 11:36:37 +0300 (MSK)
Received: from [192.168.1.127] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 6 Dec 2023 11:36:36 +0300
Message-ID: <a74781ec-97e8-4bd6-8d3c-7f828a7db281@salutedevices.com>
Date: Wed, 6 Dec 2023 11:37:02 +0300
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] leds: aw2013: unlock mutex before destroying it
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "pavel@ucw.cz"
	<pavel@ucw.cz>, "lee@kernel.org" <lee@kernel.org>, "vadimp@nvidia.com"
	<vadimp@nvidia.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "hdegoede@redhat.com"
	<hdegoede@redhat.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "jic23@kernel.org"
	<jic23@kernel.org>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"kernel@salutedevices.com" <kernel@salutedevices.com>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-3-gnstark@salutedevices.com>
 <eab990d8-9b08-4019-95c6-c71786081236@csgroup.eu>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <eab990d8-9b08-4019-95c6-c71786081236@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181886 [Dec 06 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 5 0.3.5 98d108ddd984cca1d7e65e595eac546a62b0144b, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/06 07:39:00 #22618292
X-KSMG-AntiVirus-Status: Clean, skipped

Hello Christophe

Thanks for the review

On 12/5/23 02:09, Christophe Leroy wrote:
> 
> 
> Le 04/12/2023 à 19:05, George Stark a écrit :
>> In the probe() callback in case of error mutex is destroyed being locked
>> which is not allowed so unlock the mute before destroying.
> 
> Should there be a fixes: tag ? For instance on 59ea3c9faf32 ("leds: add
> aw2013 driver") ?
Ack

> 
>>
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>> ---
>>    drivers/leds/leds-aw2013.c | 1 +
>>    1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
>> index 59765640b70f..c2bc0782c0cd 100644
>> --- a/drivers/leds/leds-aw2013.c
>> +++ b/drivers/leds/leds-aw2013.c
>> @@ -397,6 +397,7 @@ static int aw2013_probe(struct i2c_client *client)
>>    	regulator_disable(chip->vcc_regulator);
>>    
>>    error:
>> +	mutex_unlock(&chip->mutex);
>>    	mutex_destroy(&chip->mutex);
>>    	return ret;
>>    }

-- 
Best regards
George

