Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC8741C5EA6
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2020 19:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbgEERTg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 May 2020 13:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729199AbgEERTg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 May 2020 13:19:36 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B4FC061A0F;
        Tue,  5 May 2020 10:19:35 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id g10so1989685lfj.13;
        Tue, 05 May 2020 10:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=fN8WwnE2LRlNaf6M77DU0dZatEfeAbfUlEhfB3nkRns=;
        b=ar+YQC5+IzrhOrKTrrxeYt4gi+AFiDPYHMrHdE4YM6SBENqFc/X0mJch+2br09u24E
         WZVB70SwBtqZfVWpSzMOYGg1rlGFYBCp9LVn8RaTDKXJgmDZj7cklL4gA9Ov3emQRwvA
         izQyeHIf8CzcbAIhDZCq9HFAvBo2hBXCNC2/SVR7f5i5F/oDsW1O/Bah8HtLhSU2y7Vf
         U3dER7ZjwMdYmuj2URglq9scPEMEQ6ZVOlqjBsuPx/ZGPvn2gvTgopUXaP4NekIbNRBE
         6KyjZ7QwokC1coozpMxNzczcFhzJLQ2oIdVc7BoAsoVtgnJDSn0P0bCb7lzw7oM1XCYk
         A/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fN8WwnE2LRlNaf6M77DU0dZatEfeAbfUlEhfB3nkRns=;
        b=tXWLLGJxQF7tBBkrNNXPI4iNM4kKZoXrtN3GNJGGuwtnTXaovodPD9KRdz6xKr5CYE
         fuXIESbxs+4XsfssLsqvAbOOKd2s4N+IuoTTs9Rq1X4xvr/15x6w6ipbH8pgpDBwbpqg
         ylatmtzbbv1y/zaeEEySEqIwruyPlbSM3rWlmKB8QVHYVMs6CZ21gss4nEaip1Wee+6c
         BLBH2jPpArUVhyw4oMb4P9YjJ9rvC/NgX6BKPeWiMh+VOugoSSMmUOgC66CU0pSse4DJ
         120pUNfG7Kmy8EjFXnhdciHGtl5uonLBu6X6ZRXOF7LBd5TBT4F/NBlMs+Cz2r+GsuR3
         TfeA==
X-Gm-Message-State: AGi0PuZtcN3Yv4Lvk194TQNj6C5Hjgxx3X9cx7hTd818xJPbUbuZdahl
        bkvy1QLZa59nnA3gwE9nXzk=
X-Google-Smtp-Source: APiQypKsDr/pXwmUHR9eebHAaQ5nZ+uWqcSwO9LcijLmL2O2nr4OqLhlTriiwsBdbnsr4MUqCEuPMA==
X-Received: by 2002:a19:c6c1:: with SMTP id w184mr2354137lff.20.1588699173876;
        Tue, 05 May 2020 10:19:33 -0700 (PDT)
Received: from ?IPv6:2a01:540:22b8:4400:dc3e:d899:ae3f:7683? ([2a01:540:22b8:4400:dc3e:d899:ae3f:7683])
        by smtp.gmail.com with ESMTPSA id b1sm2625832lfb.22.2020.05.05.10.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 10:19:33 -0700 (PDT)
Subject: Re: [PATCH 1/3] leds: add aw2013 driver
To:     Pavel Machek <pavel@ucw.cz>
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20200504162934.4693-1-nikitos.tr@gmail.com>
 <20200504180049.GA5067@duo.ucw.cz>
From:   Nikita Travkin <nikitos.tr@gmail.com>
Message-ID: <acbc956a-6cd8-97ca-545a-07533e43b7b7@gmail.com>
Date:   Tue, 5 May 2020 22:19:31 +0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504180049.GA5067@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

> Hi!
>
>> +#define AW2013_NAME "aw2013"
> That's.... not really useful define. Make it NAME? Drop it?
Will drop it as well as (unnecessary) lines it is used in.
>> +#define AW2013_TIME_STEP 130
> I'd add comment with /* units */.
Will add.
>> +#define STATE_OFF 0
>> +#define STATE_KEEP 1
>> +#define STATE_ON 2
> We should add enum into core for this...
>
>> +static int aw2013_chip_init(struct aw2013 *chip)
>> +{
>> +	int i, ret;
>> +
>> +	ret = regmap_write(chip->regmap, AW2013_GCR, AW2013_GCR_ENABLE);
>> +	if (ret) {
>> +		dev_err(&chip->client->dev, "Failed to enable the chip: %d\n",
>> +			ret);
>> +		goto error;
>> +	}
>> +
>> +	for (i = 0; i < chip->num_leds; i++) {
>> +		ret = regmap_update_bits(chip->regmap,
>> +					 AW2013_LCFG(chip->leds[i].num),
>> +					 AW2013_LCFG_IMAX_MASK,
>> +					 chip->leds[i].imax);
>> +		if (ret) {
>> +			dev_err(&chip->client->dev,
>> +				"Failed to set maximum current for led %d: %d\n",
>> +				chip->leds[i].num, ret);
>> +			goto error;
>> +		}
>> +	}
>> +
>> +error:
>> +	return ret;
>> +}
> No need for goto if you are just returning.
Will change it.
>> +static bool aw2013_chip_in_use(struct aw2013 *chip)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < chip->num_leds; i++)
>> +		if (chip->leds[i].cdev.brightness)
>> +			return true;
>> +
>> +	return false;
>> +}
> How is this going to interact with ledstate == KEEP?
>
>> +static int aw2013_brightness_set(struct led_classdev *cdev,
>> +				 enum led_brightness brightness)
>> +{
>> +	struct aw2013_led *led = container_of(cdev, struct aw2013_led, cdev);
>> +	int ret, num;
>> +
>> +	mutex_lock(&led->chip->mutex);
>> +
>> +	if (aw2013_chip_in_use(led->chip)) {
>> +		ret = aw2013_chip_enable(led->chip);
>> +		if (ret)
>> +			return ret;
>> +	}
> You are returning with mutex held.
Will fix.
>> +	/* Never on - just set to off */
>> +	if (!*delay_on)
>> +		return aw2013_brightness_set(&led->cdev, LED_OFF);
>> +
>> +	/* Never off - just set to brightness */
>> +	if (!*delay_off)
>> +		return aw2013_brightness_set(&led->cdev, led->cdev.brightness);
> Is this dance neccessary? Should we do it in the core somewhere?
Right now blink_set() can be called with either delay_on or delay_off
being zero.

Passing zero into calculations I do later will result in garbage so
I'm trying to avoid it.

Core could probably handle situation where both are zero (This way
default values will be shared across all drivers) and if only
delay_on is zero it could disable led and the blink mode. (As if
brightness was set to 0)
In case where only delay_off is zero it's a bit more complicated
since driver should disable blinking but leave led on if it was
blinking already.

That also means that my current solution is a bit broken since changing
delay_off to zero while led is already blinking will call brightness_set
without clearing the mode bit so the led will still blink.

For now I will fix that and leave all those checks in place.
>> +		} else {
>> +			led->imax = 1; // 5mA
>> +			dev_info(&client->dev,
>> +				 "DT property led-max-microamp is missing!\n");
>> +		}
> Lets remove the exclamation mark.
Will do.
>> +		led->num = source;
>> +		led->chip = chip;
>> +		led->fwnode = of_fwnode_handle(child);
>> +
>> +		if (!of_property_read_string(child, "default-state", &str)) {
>> +			if (!strcmp(str, "on"))
>> +				led->default_state = STATE_ON;
>> +			else if (!strcmp(str, "keep"))
>> +				led->default_state = STATE_KEEP;
>> +			else
>> +				led->default_state = STATE_OFF;
>> +		}
> We should really have something in core for this. Should we support
> arbitrary brightness there?
Not sure if there is good dt property for that.
>> +static void aw2013_read_current_state(struct aw2013 *chip)
>> +{
>> +	int i, led_on;
>> +
>> +	regmap_read(chip->regmap, AW2013_LCTR, &led_on);
>> +
>> +	for (i = 0; i < chip->num_leds; i++) {
>> +		if (!(led_on & AW2013_LCTR_LE(chip->leds[i].num))) {
>> +			chip->leds[i].cdev.brightness = LED_OFF;
>> +			continue;
>> +		}
>> +		regmap_read(chip->regmap, AW2013_REG_PWM(chip->leds[i].num),
>> +			    &chip->leds[i].cdev.brightness);
>> +	}
>> +}
>> +
>> +static void aw2013_init_default_state(struct aw2013_led *led)
>> +{
>> +	switch (led->default_state) {
>> +	case STATE_ON:
>> +		led->cdev.brightness = LED_FULL;
>> +		break;
>> +	case STATE_OFF:
>> +		led->cdev.brightness = LED_OFF;
>> +	} /* On keep - just set brightness that was retrieved previously */
>> +
>> +	aw2013_brightness_set(&led->cdev, led->cdev.brightness);
>> +}
> Aha; I guess this makes "keeping" the state to work. Do you really
> need that functionality?
I don't need that. On some theoretical device the chip could be
enabled by bootloader but I consider that unlikely. I can drop
support for keeping state. It would be then easier to get rid of
"default_state" and "fwnode" in device struct. Should I?
>
> Pretty nice driver, thanks.
>
> 									Pavel
