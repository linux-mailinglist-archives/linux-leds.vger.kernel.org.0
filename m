Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92E277527E0
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jul 2023 17:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbjGMP7b (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Jul 2023 11:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbjGMP72 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Jul 2023 11:59:28 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A7B1BEB;
        Thu, 13 Jul 2023 08:59:26 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 00CC58689F;
        Thu, 13 Jul 2023 17:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1689263964;
        bh=tOolxknPxQvQ4vpUPx6iwgdAIemp7VcNNITUTqUutJ8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=IVDDsLFLLAvH1kHmy5t7GCnBzvRMaj1l3WXW3UdVWlh324eMbpZV7fLwg5YgUdWfP
         G4U8qgZiplwdwgHW7kwZC0N7qYt5BOVCc9lRnsXg/He3NPOdcoqSa65TQf1xOyM/N9
         HRadFV2/CfO4/RhliGSJ6sz4jwTw02q1ITKyggYntiePkC6kS+uKKvkSBWY2bIYSwO
         jgMR+Y9jhhl/Xo+q30vS1jOpk7VSIkN+ONZaDDJrVrWLiQQZR/qUYSQrib1pzwCWXI
         FwaqlR39YogIiUy2tTLmBSNdaubLn4sQSr31MNj7iTNveM//M6089ZsHAUtM0lc6A6
         czAW5RQ/KIPiQ==
Message-ID: <8f9b207e-7936-1e3b-673c-6a19cd565366@denx.de>
Date:   Thu, 13 Jul 2023 17:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/2] leds: pca995x: Add support for PCA995X chips
Content-Language: en-US
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org,
        Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
References: <20230705231326.232356-1-marex@denx.de>
 <20230705231326.232356-2-marex@denx.de> <20230713140759.GD10768@google.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230713140759.GD10768@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/13/23 16:07, Lee Jones wrote:

[...]

>> +#define PCA995X_LDRX_MASK	0x3	/* 2 bits per output state control */
>> +
>> +#define PCA995X_MODE_1_CFG	0x00	/* Auto-increment disabled. Normal mode */
> 
> Is this not the reset value?

The chip may not be power-cycled on reboot, so this register is not 
necessarily 0x0.

>> +#define PCA995X_IREFALL_CFG	0x7F	/* Half of max current gain multiplier */
> 
> PCA995X_IREFALL_FULL_CFG	0xFF
> PCA995X_IREFALL_HALF_CFG	(PCA995X_IREFALL_MAX_CFG / 2)
> 
> ?
> 
>> +#define PCA995X_MAX_OUTPUTS	16	/* Supported outputs */
> 
> The define nomenclature is clear enough.
> 
>> +#define ldev_to_led(c)	container_of(c, struct pca995x_led, ldev)
>> +
>> +struct pca995x_led {
>> +	unsigned int led_no;
>> +	struct led_classdev ldev;
>> +	struct pca995x_chip *chip;
>> +};
>> +
>> +struct pca995x_chip {
>> +	struct regmap *regmap;
>> +	struct pca995x_led leds[PCA995X_MAX_OUTPUTS];
>> +	int btype;
>> +};
> 
> It's weird to have 2 structs reference each other.
> 
> This should not be allowed:
> 
> pca995x_led->pca995x_chip->pca995x_led->pca995x_chip->pca995x_led->pca995x_chip
> 
> Some implementation of container_of() should do the trick.

container_of() wouldn't work here because struct pca995x_chip contains 
array of LEDs .

The structure layout is taken from:
8325642d2757e ("leds: bd2606mvv: Driver for the Rohm 6 Channel i2c LED 
driver")

>> +static int pca995x_brightness_set(struct led_classdev *led_cdev,
>> +				  enum led_brightness brightness)
>> +{
>> +	struct pca995x_led *led = ldev_to_led(led_cdev);
>> +	struct pca995x_chip *chip = led->chip;
>> +	u8 ledout_addr, pwmout_addr;
>> +	int shift, ret;
>> +
>> +	pwmout_addr = (chip->btype ? PCA9955B_PWM0 : PCA9952_PWM0) + led->led_no;
> 
> All this btype stuff is a little crazy and totally not scalable.

That's right, but until NXP changes the register layout again, this 
should be sufficient to support the entire 995x line up.

>> +	ledout_addr = PCA995X_LEDOUT0 + (led->led_no / 4);
>> +	shift = 2 * (led->led_no % 4);
> 
> Why 2 and 4?  I suggest that they are defined.
> 
>> +	switch (brightness) {
>> +	case LED_FULL:
> 
> https://elixir.bootlin.com/linux/latest/source/include/linux/leds.h#L32

LED_HALF is just PWM (default) mode, set to half duty cycle .

>> +		return regmap_update_bits(chip->regmap, ledout_addr,
>> +					  PCA995X_LDRX_MASK << shift,
>> +					  PCA995X_LED_ON << shift);
>> +	case LED_OFF:
>> +		return regmap_update_bits(chip->regmap, ledout_addr,
>> +					  PCA995X_LDRX_MASK << shift, 0);
>> +	default:
> 
> Are there no invalid values here?

Not to my knowledge, this should be 0..255 clamped by 
ldev.max_brightness further down.

>> +	/* Disable LED all-call address and set normal mode */
>> +	ret = regmap_write(chip->regmap, PCA995X_MODE1, PCA995X_MODE_1_CFG);
> 
> The formatting of "MODE1" and "MODE_1" is making me twitch!
> 
> Is this how they are referenced in the datasheet?

It's called MODE1 in datasheet, fixed.

>> +	if (ret)
>> +		return ret;
>> +
>> +	/* IREF Output current value for all LEDn outputs */
>> +	return regmap_write(chip->regmap,
>> +			    btype ? PCA9955B_IREFALL : PCA9952_IREFALL,
>> +			    PCA995X_IREFALL_CFG);
>> +}
>> +
>> +static const struct i2c_device_id pca995x_id[] = {
>> +	{ "pca9952", .driver_data = (kernel_ulong_t)0 /* non-B chip */ },
> 
> Defines at least please.
> 
> Are you sure these are the only 2 types of chip this driver will
> support?

No, I cannot predict the future or how NXP will or won't change the 
register layout of it. When it cames, we can deal with that.

[...]

The rest is addressed in V4.
