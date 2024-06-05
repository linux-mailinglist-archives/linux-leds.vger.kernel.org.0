Return-Path: <linux-leds+bounces-1838-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B2C8FCEB4
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jun 2024 15:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C0601F2A8AF
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jun 2024 13:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF6C194ACF;
	Wed,  5 Jun 2024 12:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OA9DBeUF"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174A9194AD2;
	Wed,  5 Jun 2024 12:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717591113; cv=none; b=KENiydhrZkxIUz6Yexc7Wwplwt50y+Qiggt5RDEH7kCLRuPLniNUz7gOBfZPC4kbyCqhrZwmm70Gf0UJd0qgYNqaDE+ls9DYy9itchztna+9ZxUFeh/JGYNr0B2czdIsumXcFQzKJYW7xABX2utcHfYE7RbDuTYNZ/RUvEM0eNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717591113; c=relaxed/simple;
	bh=OZqt79NIznVK5rDUjkXmFWcs7qa57I4kBdPkWA3QT98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jyb/MqSKpUgYXFCx7/h9bW0L1M0YMOnCsxfBTRS00iemcFc8m9WzH2GL4fEoOZgM7wH+4T29MakHOA2sWekvBHx1m0ayR/2J/H21mcXQ6tF6LYenEiYB/DwUu0vTo63Ylu0FR1Q4bg2o5RvH4zTYxNoJ3LGHqL0HtKsf+zZ5Ays=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OA9DBeUF; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 522D040005;
	Wed,  5 Jun 2024 12:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717591108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HC2LJJX8rGplsD63NKz4WoTxZkBCqV9UIbb2yiQeS1A=;
	b=OA9DBeUFNvchW82o8Mm8XZx60vtOdpgRftwE5EnTEr4jw8aVzW1Rq+eMXDJ1E1UINRAeRF
	2yODc0kF+I4ZqmNu9IP5E1mZx1YVI1oCxBMZGaDk/qxF7s5m7AIMFnLAKA0DPmLQ6tXiaK
	qeQ1zM0s0VwAV8tUKdlbDtVYqTISafzLTT4be2xTzq5WidwlYMEFz+RhNqVRj3Ge68ReAc
	DNWFyHQ9nmKvDcY1+d4rXEB2SMWq96d1MdEytN10KMNpKXm5MvD9jMGbTc08BD2l4BXZM2
	dBnyI5m9py8xMQkhTpPi7OqaXKjvqAPeaFyMS5kb59zOpf9w0U1+9XNBUJjhOg==
Message-ID: <ca4dfe4f-a375-4905-b0bd-c4dddb507c23@bootlin.com>
Date: Wed, 5 Jun 2024 14:38:27 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] leds: pca9532: Use PWM1 for hardware blinking
To: Lee Jones <lee@kernel.org>
Cc: Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, herve.codina@bootlin.com,
 christophercordahi@nanometrics.ca
References: <20240527125940.155260-1-bastien.curutchet@bootlin.com>
 <20240527125940.155260-2-bastien.curutchet@bootlin.com>
 <20240531145523.GN1005600@google.com>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <20240531145523.GN1005600@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: bastien.curutchet@bootlin.com

Hi Lee,

Thank you for the feedback, I'll send a V2 iteration that corrects all 
the points you mentioned.

Best regards,
Bastien

On 5/31/24 16:55, Lee Jones wrote:
> On Mon, 27 May 2024, Bastien Curutchet wrote:
> 
>> PSC0/PWM0 are used by all leds for brightness and blinking. This causes
> 
> LEDs everywhere please.
> 
>> conflicts when you set a brightness of a new led while an other one is
>> already using PWM0 for blinking.
>>
>> Use PSC1/PWM1 for blinking.
>> Check that no other led is already blinking with a different PSC1/PWM1
>> configuration to avoid conflict.
>>
>> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
>> ---
>>   drivers/leds/leds-pca9532.c | 49 ++++++++++++++++++++++++++++++-------
>>   1 file changed, 40 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
>> index bf8bb8fc007c..c210608ad336 100644
>> --- a/drivers/leds/leds-pca9532.c
>> +++ b/drivers/leds/leds-pca9532.c
>> @@ -191,29 +191,60 @@ static int pca9532_set_brightness(struct led_classdev *led_cdev,
>>   	return err;
>>   }
>>   
>> +static int pca9532_update_hw_blink(struct pca9532_led *led,
>> +				   unsigned long delay_on, unsigned long delay_off)
>> +{
>> +	struct pca9532_data *data = i2c_get_clientdata(led->client);
>> +	unsigned int psc;
>> +	int i;
>> +
>> +	/* Look for others leds that already use PWM1 */
>> +	for (i = 0; i < data->chip_info->num_leds; i++) {
>> +		struct pca9532_led *other = &data->leds[i];
>> +
>> +		if (other == led)
>> +			continue;
> 
> Don't bunch things up please - new line here.
> 
>> +		if (other->state == PCA9532_PWM1) {
>> +			if (other->ldev.blink_delay_on != delay_on ||
>> +			    other->ldev.blink_delay_off != delay_off) {
>> +				dev_dbg(&led->client->dev,
>> +					"HW can handle only one blink configuration at a time\n");
>> +				return -EINVAL;
>> +			}
>> +		}
>> +	}
>> +
>> +	psc = ((delay_on + delay_off) * 152 - 1) / 1000;
> 
> What are these funny magic numbers?  Define them please.
> 
>> +	if (psc > 255) {
> 
> And this.
> 
>> +		dev_dbg(&led->client->dev, "Blink period too long to be handled by hardware\n");
> 
> If you're returning an error, this should be dev_err().
> 
>> +		return -EINVAL;
>> +	}
>> +
>> +	data->psc[1] = psc;
> 
> Can we define these indexes please?
> 
>> +	data->pwm[1] = (delay_on * 255) / (delay_on + delay_off);
>> +
>> +	return pca9532_setpwm(data->client, 1);
>> +}
>> +
>>   static int pca9532_set_blink(struct led_classdev *led_cdev,
>>   	unsigned long *delay_on, unsigned long *delay_off)
>>   {
>>   	struct pca9532_led *led = ldev_to_led(led_cdev);
>>   	struct i2c_client *client = led->client;
>> -	int psc;
>> -	int err = 0;
>> +	struct pca9532_data *data = i2c_get_clientdata(client);
> 
> Did you build this with W=1?  This looks unused.
> 
>> +	int err;
>>   
>>   	if (*delay_on == 0 && *delay_off == 0) {
>>   		/* led subsystem ask us for a blink rate */
>>   		*delay_on = 1000;
>>   		*delay_off = 1000;
>>   	}
>> -	if (*delay_on != *delay_off || *delay_on > 1690 || *delay_on < 6)
>> -		return -EINVAL;
>>   
>> -	/* Thecus specific: only use PSC/PWM 0 */
>> -	psc = (*delay_on * 152-1)/1000;
>> -	err = pca9532_calcpwm(client, 0, psc, led_cdev->brightness);
>> +	led->state = PCA9532_PWM1;
>> +	err = pca9532_update_hw_blink(led, *delay_on, *delay_off);
>>   	if (err)
>>   		return err;
>> -	if (led->state == PCA9532_PWM0)
>> -		pca9532_setpwm(led->client, 0);
>> +
>>   	pca9532_setled(led);
>>   
>>   	return 0;
>> -- 
>> 2.44.0
>>
> 

