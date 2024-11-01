Return-Path: <linux-leds+bounces-3230-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0469B94A1
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 16:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3B78282154
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 15:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E5A1C5798;
	Fri,  1 Nov 2024 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="MOaSnPjw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A5425634;
	Fri,  1 Nov 2024 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730475775; cv=none; b=Lsfh/2QImPSk0qzDs03GkFT+gb3loCMaKEC9Pwnu7a6zDqBxO7DrDMe1ekaPQZSLzZbseIfwVhJOYiguW0GLlm+b/JW0h6tjYfykzyIkDCSmvyBnsqzKzx8YeHRsNttsQWVLvSmrk82GX0/kWeKS8D1Po10+1Xphdlb6sIXFGzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730475775; c=relaxed/simple;
	bh=e2RIMkxPzI4fgD86ODFquo5MfMVtY6+e/BHyT0tUnVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=abkhtR/vmi/BLW0+J1pXsmZGsGEF6u1gyPjFW7NlcgXWTulT989CgSjIqBiY5PD6uI3ntgQ++QfBeqIxvYl8OEuaZDLoj2p1eePd1HthVJe4rRteB3z9mKNCebNtnRu6DpOg0Ul3EWatY4WPru34pqs9ECTDXi5Yjo3tshGpnws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=MOaSnPjw; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4E7BB120019;
	Fri,  1 Nov 2024 18:42:29 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4E7BB120019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1730475749;
	bh=++GLuDudYgupqyL0+wip7nEuzoF4sv5Ujk/jbnUCDIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=MOaSnPjw8ycOcScy5hWFOiTbjmNq9d6VuCaKVjCmtYgWaT3saY1A5dp7U1cAgzPd2
	 KKw0DTsT1aW4NcQOeZ7nPf8HyasRyA0SOH4L35NVyH5v1EK7z33nv4uSn6JAYS+vYx
	 M1knP/XFeZteLarhljWFP2BUb/SJwCd+Wa6s8uMfRjc/JALgOtQlAQljpjJ5mbSD7i
	 9aAXRaR+vF5LUShd8wbygbVVRVTQIU+coQtg0lOS3x+0SGHog77WselrzbnGAVYSIq
	 RX22R2Qo/9zZgH120d1KTfDZcUjou+Pd/AkaYD1gEWeCZuyk+TNqGHojweMwX2cimK
	 RIHcB4z9YGMCQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri,  1 Nov 2024 18:42:29 +0300 (MSK)
Message-ID: <e37f23e6-f471-4061-b346-4b082f37060d@salutedevices.com>
Date: Fri, 1 Nov 2024 18:42:28 +0300
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] leds: pwm: Add optional DT property
 default-brightness
To: Lee Jones <lee@kernel.org>
CC: <pavel@ucw.cz>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-leds@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>
References: <20241015151410.2158102-1-gnstark@salutedevices.com>
 <20241015151410.2158102-3-gnstark@salutedevices.com>
 <20241031143250.GH10824@google.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20241031143250.GH10824@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188909 [Nov 01 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/01 12:35:00 #26800049
X-KSMG-AntiVirus-Status: Clean, skipped

Hello Lee

Thanks for the review!

On 10/31/24 17:32, Lee Jones wrote:
> On Tue, 15 Oct 2024, George Stark wrote:
> 
>> When probing if default LED state is on then default brightness will be
>> applied instead of max brightness.
>>
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>> ---
>>   drivers/leds/leds-pwm.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
>> index 7961dca0db2f..514fc8ca3e80 100644
>> --- a/drivers/leds/leds-pwm.c
>> +++ b/drivers/leds/leds-pwm.c
>> @@ -65,7 +65,8 @@ static int led_pwm_set(struct led_classdev *led_cdev,
>>   
>>   __attribute__((nonnull))
>>   static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>> -		       struct led_pwm *led, struct fwnode_handle *fwnode)
>> +		       struct led_pwm *led, struct fwnode_handle *fwnode,
>> +		       unsigned int default_brightness)
>>   {
>>   	struct led_pwm_data *led_data = &priv->leds[priv->num_leds];
>>   	struct led_init_data init_data = { .fwnode = fwnode };
>> @@ -104,7 +105,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>>   	/* set brightness */
>>   	switch (led->default_state) {
>>   	case LEDS_DEFSTATE_ON:
>> -		led_data->cdev.brightness = led->max_brightness;
>> +		led_data->cdev.brightness = default_brightness;
>>   		break;
>>   	case LEDS_DEFSTATE_KEEP:
>>   		{
>> @@ -141,6 +142,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>>   static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
>>   {
>>   	struct led_pwm led;
>> +	unsigned int default_brightness;
>>   	int ret;
>>   
>>   	device_for_each_child_node_scoped(dev, fwnode) {
>> @@ -160,7 +162,12 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
>>   
>>   		led.default_state = led_init_default_state_get(fwnode);
>>   
>> -		ret = led_pwm_add(dev, priv, &led, fwnode);
>> +		ret = fwnode_property_read_u32(fwnode, "default-brightness",
>> +					       &default_brightness);
>> +		if (ret < 0 || default_brightness > led.max_brightness)
>> +			default_brightness = led.max_brightness;
>> +
>> +		ret = led_pwm_add(dev, priv, &led, fwnode, default_brightness);
> 
> This creates a lot more hopping around than is necessary.
> 
> Since led_pwm_add() already has access to the fwnode, why not look up
> the property in there instead, thus massively simplifying things.

I looked up the new property here to be near to
led_init_default_state_get (both props are from the same group) and
led_pwm_add is big enough already. And you're absolutely right that the
patch can be optimized. Please take a look at the v2

> 
> 
>>   		if (ret)
>>   			return ret;
>>   	}
>> -- 
>> 2.25.1
>>
> 

-- 
Best regards
George

