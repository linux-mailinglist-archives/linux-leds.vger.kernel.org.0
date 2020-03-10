Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6287E180A1D
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2020 22:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgCJVPX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Mar 2020 17:15:23 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50813 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgCJVPW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Mar 2020 17:15:22 -0400
Received: by mail-wm1-f66.google.com with SMTP id a5so3029649wmb.0;
        Tue, 10 Mar 2020 14:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/ZnsOZ0uslw0PDCZAah9EOrGZehIeeGg1H7EizaJUL0=;
        b=u8iuMw0zK9Ir8hDMfDosF1lrkWsR57nLHpGGtGffZduM480Cw2jiQjCn4CuzvfXxzr
         KEIvEUZCGhHZMeUkbmGMTBU2euo51VPjJOawuC7R7s3V8ME/rHtNRgchww1wMPVK8Rt/
         yVO/SVxnFgtbh3/s+SY4QfuhFmEZbXsZPXzYMX2XSX/doa4Ml9cuZpK0Pk80q1n5AprJ
         X0sppP1fdeWS+SJKW+XBHeDt/5NvyLiKXo8ifyc/pYaR5fmTX7XZsGymnjZV1Yz85NHs
         Rv0k35RaaS+3Tf1ZfJA3X7jnoGbfA4KWu1GFpwJbCORlLuI3/z4NVx0X6WxDvDKXOiEk
         m/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/ZnsOZ0uslw0PDCZAah9EOrGZehIeeGg1H7EizaJUL0=;
        b=D0N6c36F/scTo18vubCbBAXprgWe9pj2+OQTyuGDhS16yI+czNef0QjGKTl4UCpQDa
         EmcCNKMpnHTeOaTMgviH4tieSwSa6gEFLU7MSvjn1U2Lgd4437+V/IEmPSlFOjP7oA0s
         90cqcgoasyFwe3zk4m8kwWagSHwepenAxcu7jNCxxw5Zgznhgf0NcLj+26R6XPr0YR09
         AWhcO/nMusulkeH5uQhdjU08lpyfjiBeUmsaqXNnZCqNmTQSakOSK3mY3ipcKM08Io3N
         JRqlG7H0QlI+XdqTyxah3Z+YGwBI6a0ujxq/O1dXAZjF8XXqvUJ1g+E63EuDoHSFxWWg
         b1zg==
X-Gm-Message-State: ANhLgQ0hknxkvSqCXyT0XKJLR1fw/svdCRJ37QL0cCb/OtmTnRIViGea
        iLV0DfuW9WWhZjLdYG+XUG4hIjy2
X-Google-Smtp-Source: ADFU+vsz8SBPytW5RyJPQg4B1fc9rLm++tm13PMCT8H/fHRArtiJorGXQ5nfeCc4NN/xwhKhCFRI0Q==
X-Received: by 2002:a7b:c3d1:: with SMTP id t17mr3889890wmj.27.1583874917335;
        Tue, 10 Mar 2020 14:15:17 -0700 (PDT)
Received: from [192.168.1.23] (afan71.neoplus.adsl.tpnet.pl. [95.49.13.71])
        by smtp.gmail.com with ESMTPSA id s2sm5472193wmj.15.2020.03.10.14.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 14:15:16 -0700 (PDT)
Subject: Re: [PATCH v2] leds: pwm: add support for default-state device
 property
To:     Denis Osterland-Heim <denis.osterland@diehl.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20200310123126.4709-1-Denis.Osterland@diehl.com>
 <4c16da22994de29c2fbb23c877d55685bcbf8993.camel@diehl.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ccb718b2-d0e5-20d8-f30a-95f8f31a10ef@gmail.com>
Date:   Tue, 10 Mar 2020 22:15:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4c16da22994de29c2fbb23c877d55685bcbf8993.camel@diehl.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Denis,

Thank you for the update. Please find my remarks below.

On 3/10/20 4:19 PM, Denis Osterland-Heim wrote:
> Hi,
> 
> should be
> In-Reply-To: <20200309082218.13263-1-Denis.Osterland@diehl.com>
> instead of
> Reply-To: <20200309082218.13263-1-Denis.Osterland@diehl.com>
> 
> Sorry
> 
> Am Dienstag, den 10.03.2020, 13:47 +0100 schrieb Denis Osterland-Heim:
>> This patch adds support for "default-state" devicetree property, which
>> allows to defer pwm init to first use of led.
>>
>> This allows to configure the PWM early in bootloader to let the LED
>> blink until an application in Linux userspace set something different.
>>
>> Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
>> ---
>> v1->v2:
>>   - use default-state = "keep", as suggested by Jacek Anaszewski
>>   - calc initial brightness with PWM state from device
>>
>>  .../devicetree/bindings/leds/leds-pwm.txt     |  2 ++
>>  drivers/leds/leds-pwm.c                       | 33 +++++++++++++++++--
>>  include/linux/leds_pwm.h                      |  1 +
>>  3 files changed, 33 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/Documentation/devicetree/bindings/leds/leds-pwm.txt
>> index 6c6583c35f2f..d0f489680594 100644
>> --- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
>> +++ b/Documentation/devicetree/bindings/leds/leds-pwm.txt
>> @@ -19,6 +19,8 @@ LED sub-node properties:
>>    see Documentation/devicetree/bindings/leds/common.txt
>>  - linux,default-trigger :  (optional)
>>    see Documentation/devicetree/bindings/leds/common.txt
>> +- default-state : (optional)
>> +  see Documentation/devicetree/bindings/leds/common.yaml
>>  
>>  Example:
>>  
>> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
>> index 8b6965a563e9..92726c2e43ba 100644
>> --- a/drivers/leds/leds-pwm.c
>> +++ b/drivers/leds/leds-pwm.c
>> @@ -75,7 +75,8 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>>  	led_data->active_low = led->active_low;
>>  	led_data->cdev.name = led->name;
>>  	led_data->cdev.default_trigger = led->default_trigger;
>> -	led_data->cdev.brightness = LED_OFF;
>> +	ret = led->default_state == LEDS_GPIO_DEFSTATE_ON;

ret is for return value and it should not be used for anything
else just because it is at hand. Also LEDS_GPIO* definitions have
nothing to do with pwm leds. This is legacy because default-state
property was primarily specific to leds-gpio bindings and only
later was made common.

Please introduce corresponding LEDS_PWM definitions, but in leds-pwm.c.

>> +	led_data->cdev.brightness = ret ? led->max_brightness : LED_OFF;

Instead of above two changes I'd add below:

if (led->default_state == LEDS_PWM_DEFSTATE_ON) {
	led_data->cdev.brightness = led->max_brightness;
} else if (led->default_state == LEDS_PWM_DEFSTATE_KEEP)) {
	// here put what you're adding below, but please use
	// pwm_get_state() instead of accessing ops directly
}

LED_OFF case is covered by kzalloc() in led_pwm_probe().

>>  	led_data->cdev.max_brightness = led->max_brightness;
>>  	led_data->cdev.flags = LED_CORE_SUSPENDRESUME;
>>  
>> @@ -97,7 +98,8 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>>  	 * FIXME: pwm_apply_args() should be removed when switching to the
>>  	 * atomic PWM API.
>>  	 */
>> -	pwm_apply_args(led_data->pwm);
>> +	if (led->default_state != LEDS_GPIO_DEFSTATE_KEEP)
>> +		pwm_apply_args(led_data->pwm);
>>  
>>  	pwm_get_args(led_data->pwm, &pargs);
>>  
>> @@ -105,10 +107,23 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>>  	if (!led_data->period && (led->pwm_period_ns > 0))
>>  		led_data->period = led->pwm_period_ns;
>>  
>> +	if (led->default_state == LEDS_GPIO_DEFSTATE_KEEP) {
>> +		uint64_t brightness;
>> +		struct pwm_device *pwm = led_data->pwm;
>> +		struct pwm_state state;
>> +
>> +		pwm->chip->ops->get_state(pwm->chip, pwm, &state);
>> +		brightness = led->max_brightness * state.duty_cycle;
>> +		do_div(brightness, state.period);
>> +		led_data->cdev.brightness = (enum led_brightness)brightness;
>> +	}
>> +
>>  	ret = devm_led_classdev_register(dev, &led_data->cdev);
>>  	if (ret == 0) {
>>  		priv->num_leds++;
>> -		led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
>> +		if (led->default_state != LEDS_GPIO_DEFSTATE_KEEP)
>> +			led_pwm_set(&led_data->cdev,
>> +					led_data->cdev.brightness);
>>  	} else {
>>  		dev_err(dev, "failed to register PWM led for %s: %d\n",
>>  			led->name, ret);
>> @@ -126,6 +141,8 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
>>  	memset(&led, 0, sizeof(led));
>>  
>>  	device_for_each_child_node(dev, fwnode) {
>> +		const char *state = NULL;
>> +
>>  		ret = fwnode_property_read_string(fwnode, "label", &led.name);
>>  		if (ret && is_of_node(fwnode))
>>  			led.name = to_of_node(fwnode)->name;
>> @@ -143,6 +160,16 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
>>  		fwnode_property_read_u32(fwnode, "max-brightness",
>>  					 &led.max_brightness);
>>  
>> +		if (!fwnode_property_read_string(fwnode, "default-state",
>> +						 &state)) {
>> +			if (!strcmp(state, "keep"))
>> +				led.default_state = LEDS_GPIO_DEFSTATE_KEEP;
>> +			else if (!strcmp(state, "on"))
>> +				led.default_state = LEDS_GPIO_DEFSTATE_ON;
>> +			else
>> +				led.default_state = LEDS_GPIO_DEFSTATE_OFF;
>> +		}
>> +
>>  		ret = led_pwm_add(dev, priv, &led, fwnode);
>>  		if (ret) {
>>  			fwnode_handle_put(fwnode);
>> diff --git a/include/linux/leds_pwm.h b/include/linux/leds_pwm.h
>> index 93d101d28943..c9ef9012913d 100644
>> --- a/include/linux/leds_pwm.h
>> +++ b/include/linux/leds_pwm.h
>> @@ -10,6 +10,7 @@ struct led_pwm {
>>  	const char	*default_trigger;
>>  	unsigned	pwm_id __deprecated;
>>  	u8 		active_low;
>> +	u8		default_state;
>>  	unsigned 	max_brightness;
>>  	unsigned	pwm_period_ns;
>>  };
> 
> 
> Diehl Connectivity Solutions GmbH
> Geschäftsführung: Horst Leonberger
> Sitz der Gesellschaft: Nürnberg - Registergericht: Amtsgericht
> Nürnberg: HRB 32315
> ___________________________________________________________________________________________________
> 
> Der Inhalt der vorstehenden E-Mail ist nicht rechtlich bindend. Diese E-Mail enthaelt vertrauliche und/oder rechtlich geschuetzte Informationen.
> Informieren Sie uns bitte, wenn Sie diese E-Mail faelschlicherweise erhalten haben. Bitte loeschen Sie in diesem Fall die Nachricht.
> Jede unerlaubte Form der Reproduktion, Bekanntgabe, Aenderung, Verteilung und/oder Publikation dieser E-Mail ist strengstens untersagt.
> - Informationen zum Datenschutz, insbesondere zu Ihren Rechten, erhalten Sie unter https://www.diehl.com/group/de/transparenz-und-informationspflichten/
> 
> The contents of the above mentioned e-mail is not legally binding. This e-mail contains confidential and/or legally protected information. Please inform us if you have received this e-mail by
> mistake and delete it in such a case. Each unauthorized reproduction, disclosure, alteration, distribution and/or publication of this e-mail is strictly prohibited. 
> - For general information on data protection and your respective rights please visit https://www.diehl.com/group/en/transparency-and-information-obligations/
> 

-- 
Best regards,
Jacek Anaszewski
