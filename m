Return-Path: <linux-leds+bounces-4324-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B59A694D4
	for <lists+linux-leds@lfdr.de>; Wed, 19 Mar 2025 17:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F4973A5272
	for <lists+linux-leds@lfdr.de>; Wed, 19 Mar 2025 16:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06491DE3AE;
	Wed, 19 Mar 2025 16:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="HHzhz4au"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274B51DE89C;
	Wed, 19 Mar 2025 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742401535; cv=none; b=Y0EnewU5+pCU18ppwiGKQwvci9sPXMinAdi8sHYMBQPWKpSsaBZjDJ9fslfeIFS3LjlqIq5/XEWnqZ6bC6NSrqpI/ZSCk4s5/T47YxHb8WFd8pstbRDtlDHfMJU1XkAI+Fkikn0bFqN66vlMGF63NTNSovPDNlsUjJ3TKMvEWNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742401535; c=relaxed/simple;
	bh=zKiobP2hmOBXYMn5j5zuAnZcQ7VT7oB3a67mgERxZ+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EuNlAm1XVyWpyx3Ps/12mSAP0oolxS9m56ZlkypmDUGfDcrezCMtg5OMo437PHuS7xLQwUDZki+6CWwpbahaD/7Wq41qqY+BuCZsZrhDomHcwLt2dKNnsqBeWWS8yMlDkI8hgTSPGC8CvvmPtMjXDC+eWHu1rYzYMFKJvWjZr1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=HHzhz4au; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lX8YsY5jRiFngBKXnH10duTwRpUJww1JCDeLMhQjXnY=; b=HHzhz4auCF6qEkDVePSWFB91mT
	nnh8XO00s7i1d4IJJd1F7EgW1mbdtRlsY0TAp5i2+XJ8Em+z0apzdHBercJJ+6awhmgFsT9OPqsqS
	S2kFRiNcTogwKOcNrroAefNMhjUKBFSf69uWPdSHloT/towfZgekG3brEE3oLgX6uAZA=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:57302 helo=[192.168.0.218])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1tuwEL-00HYlk-DS; Wed, 19 Mar 2025 17:25:22 +0100
Message-ID: <9a470dfd-8d7b-4529-b54b-289754b9eed6@emfend.at>
Date: Wed, 19 Mar 2025 17:25:18 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] leds: tps6131x: add support for Texas Instruments
 TPS6131X flash LED driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 bsp-development.geo@leica-geosystems.com
References: <20250318-leds-tps6131x-v2-0-bc09c7a50b2e@emfend.at>
 <20250318-leds-tps6131x-v2-2-bc09c7a50b2e@emfend.at>
 <20250319-tall-ruddy-flamingo-a12fcc@krzk-bin>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <20250319-tall-ruddy-flamingo-a12fcc@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hi Krzysztof,

thank you very much for your review!

Am 19.03.2025 um 10:03 schrieb Krzysztof Kozlowski:
> On Tue, Mar 18, 2025 at 08:28:58AM +0100, Matthias Fend wrote:
>> +
>> +static int tps6131x_reset_chip(struct tps6131x *tps6131x)
>> +{
>> +	int ret;
>> +
>> +	if (IS_ERR_OR_NULL(tps6131x->reset_gpio)) {
> 
> No, only check for non-null, see comment in probe().

ACK

> 
>> +		ret = regmap_update_bits(tps6131x->regmap, TPS6131X_REG_0, TPS6131X_REG_0_RESET,
>> +					 TPS6131X_REG_0_RESET);
>> +		if (ret)
>> +			return ret;
>> +
>> +		fsleep(100);
>> +
>> +		ret = regmap_update_bits(tps6131x->regmap, TPS6131X_REG_0, TPS6131X_REG_0_RESET, 0);
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		gpiod_set_value_cansleep(tps6131x->reset_gpio, 1);
>> +		fsleep(10);
>> +		gpiod_set_value_cansleep(tps6131x->reset_gpio, 0);
>> +		fsleep(100);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int tps6131x_init_chip(struct tps6131x *tps6131x)
>> +{
>> +	u32 reg4, reg5, reg6;
>> +	int ret;
>> +
>> +	reg4 = tps6131x->valley_current_limit ? TPS6131X_REG_4_ILIM : 0;
>> +	ret = regmap_write(tps6131x->regmap, TPS6131X_REG_4, reg4);
>> +	if (ret)
>> +		return ret;
>> +
>> +	reg5 = TPS6131X_REG_5_ENPSM | TPS6131X_REG_5_STSTRB1_DIR | TPS6131X_REG_5_GPIOTYPE;
>> +	if (tps6131x->chan1_en)
>> +		reg5 |= TPS6131X_REG_5_ENLED1;
>> +
>> +	if (tps6131x->chan2_en)
>> +		reg5 |= TPS6131X_REG_5_ENLED2;
>> +
>> +	if (tps6131x->chan3_en)
>> +		reg5 |= TPS6131X_REG_5_ENLED3;
>> +	ret = regmap_write(tps6131x->regmap, TPS6131X_REG_5, reg5);
>> +	if (ret)
>> +		return ret;
>> +
>> +	reg6 = TPS6131X_REG_6_ENTS;
>> +	ret = regmap_write(tps6131x->regmap, TPS6131X_REG_6, reg6);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int tps6131x_set_mode(struct tps6131x *tps6131x, enum tps6131x_mode mode, bool force)
>> +{
>> +	u8 val;
>> +
>> +	val = mode << TPS6131X_REG_1_MODE_SHIFT;
>> +
>> +	return regmap_update_bits_base(tps6131x->regmap, TPS6131X_REG_1, TPS6131X_REG_1_MODE, val,
>> +				       NULL, false, force);
>> +}
>> +
>> +static void tps6131x_torch_refresh_handler(struct work_struct *work)
>> +{
>> +	struct tps6131x *tps6131x = container_of(work, struct tps6131x, torch_refresh_work.work);
>> +
>> +	guard(mutex)(&tps6131x->lock);
>> +
>> +	tps6131x_set_mode(tps6131x, TPS6131X_MODE_TORCH, true);
>> +
>> +	schedule_delayed_work(&tps6131x->torch_refresh_work,
>> +			      TPS6131X_TORCH_REFRESH_INTERVAL_JIFFIES);
>> +}
>> +
>> +static int tps6131x_brightness_set(struct led_classdev *cdev, enum led_brightness brightness)
>> +{
>> +	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(cdev);
>> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
>> +	u32 num_chans;
>> +	u32 steps_chan13, steps_chan2;
>> +	u32 steps_remaining;
>> +	u8 reg0;
>> +	int ret;
>> +
>> +	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
>> +
>> +	guard(mutex)(&tps6131x->lock);
>> +
>> +	/*
>> +	 * The brightness parameter uses the number of current steps as the unit (not the current
>> +	 * value itself). Since the reported step size can vary depending on the configuration,
>> +	 * this value must be converted into actual register steps.
>> +	 */
>> +	steps_remaining = (brightness * tps6131x->step_torch_current_ma) / TPS6131X_TORCH_STEP_I_MA;
>> +
>> +	num_chans = tps6131x->chan1_en + tps6131x->chan2_en + tps6131x->chan3_en;
>> +
>> +	/*
>> +	 * The currents are distributed as evenly as possible across the activated channels.
>> +	 * Since channels 1 and 3 share the same register setting, they always use the same current
>> +	 * value. Channel 2 supports higher currents and thus takes over the remaining additional
>> +	 * portion that cannot be covered by the other channels.
>> +	 */
>> +	steps_chan13 = min_t(u32, steps_remaining / num_chans,
>> +			     TPS6131X_TORCH_MAX_I_CHAN13_MA / TPS6131X_TORCH_STEP_I_MA);
>> +	if (tps6131x->chan1_en)
>> +		steps_remaining -= steps_chan13;
>> +	if (tps6131x->chan3_en)
>> +		steps_remaining -= steps_chan13;
>> +
>> +	steps_chan2 = min_t(u32, steps_remaining,
>> +			    TPS6131X_TORCH_MAX_I_CHAN2_MA / TPS6131X_TORCH_STEP_I_MA);
>> +
>> +	reg0 = (steps_chan13 << TPS6131X_REG_0_DCLC13_SHIFT) |
>> +	       (steps_chan2 << TPS6131X_REG_0_DCLC2_SHIFT);
> 
> Looks like guard should start here... or you are not synchronizing
> hardware access but more.

I just found it clearer to have the lock at the beginning.
But of course, I can easily move the lock to this position.

> 
>> +	ret = regmap_update_bits(tps6131x->regmap, TPS6131X_REG_0,
>> +				 TPS6131X_REG_0_DCLC13 | TPS6131X_REG_0_DCLC2, reg0);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = tps6131x_set_mode(tps6131x, brightness ? TPS6131X_MODE_TORCH : TPS6131X_MODE_SHUTDOWN,
>> +				true);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/*
>> +	 * In order to use both the flash and the video light functions purely via the I2C
>> +	 * interface, STRB1 must be low. If STRB1 is low, then the video light watchdog timer
>> +	 * is also active, which puts the device into the shutdown state after around 13 seconds.
>> +	 * To prevent this, the mode must be refreshed within the watchdog timeout.
>> +	 */
>> +	if (brightness)
>> +		schedule_delayed_work(&tps6131x->torch_refresh_work,
>> +				      TPS6131X_TORCH_REFRESH_INTERVAL_JIFFIES);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tps6131x_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
>> +{
>> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
>> +	int ret;
>> +
>> +	guard(mutex)(&tps6131x->lock);
>> +
>> +	ret = tps6131x_set_mode(tps6131x, state ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
>> +				true);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (state) {
>> +		ret = regmap_update_bits_base(tps6131x->regmap, TPS6131X_REG_3, TPS6131X_REG_3_SFT,
>> +					      TPS6131X_REG_3_SFT, NULL, false, true);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	ret = regmap_update_bits_base(tps6131x->regmap, TPS6131X_REG_3, TPS6131X_REG_3_SFT, 0, NULL,
>> +				      false, true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int tps6131x_flash_brightness_set(struct led_classdev_flash *fled_cdev, u32 brightness)
>> +{
>> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
>> +	u32 num_chans;
>> +	u32 steps_chan13, steps_chan2;
>> +	u32 steps_remaining;
>> +	int ret;
>> +
>> +	guard(mutex)(&tps6131x->lock);
>> +
>> +	steps_remaining = brightness / TPS6131X_FLASH_STEP_I_MA;
>> +	num_chans = tps6131x->chan1_en + tps6131x->chan2_en + tps6131x->chan3_en;
>> +	steps_chan13 = min_t(u32, steps_remaining / num_chans,
>> +			     TPS6131X_FLASH_MAX_I_CHAN13_MA / TPS6131X_FLASH_STEP_I_MA);
>> +	if (tps6131x->chan1_en)
>> +		steps_remaining -= steps_chan13;
>> +	if (tps6131x->chan3_en)
>> +		steps_remaining -= steps_chan13;
>> +	steps_chan2 = min_t(u32, steps_remaining,
>> +			    TPS6131X_FLASH_MAX_I_CHAN2_MA / TPS6131X_FLASH_STEP_I_MA);
>> +
> 
> Same here

ACK

> 
>> +	ret = regmap_update_bits(tps6131x->regmap, TPS6131X_REG_2, TPS6131X_REG_2_FC13,
>> +				 steps_chan13 << TPS6131X_REG_2_FC13_SHIFT);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = regmap_update_bits(tps6131x->regmap, TPS6131X_REG_1, TPS6131X_REG_1_FC2,
>> +				 steps_chan2 << TPS6131X_REG_1_FC2_SHIFT);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	fled_cdev->brightness.val = brightness;
>> +
>> +	return 0;
>> +}
>> +
>> +static int tps6131x_flash_timeout_set(struct led_classdev_flash *fled_cdev, u32 timeout_us)
>> +{
>> +	const struct tps6131x_timer_config *timer_config;
>> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
>> +	u8 reg3;
>> +	int ret;
>> +
>> +	guard(mutex)(&tps6131x->lock);
>> +
>> +	timer_config = tps6131x_find_closest_timer_config(timeout_us);
>> +
>> +	reg3 = timer_config->val << TPS6131X_REG_3_STIM_SHIFT;
>> +	if (timer_config->range)
>> +		reg3 |= TPS6131X_REG_3_SELSTIM_TO;
>> +
>> +	ret = regmap_update_bits(tps6131x->regmap, TPS6131X_REG_3,
>> +				 TPS6131X_REG_3_STIM | TPS6131X_REG_3_SELSTIM_TO, reg3);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	fled_cdev->timeout.val = timer_config->time_us;
>> +
>> +	return 0;
>> +}
>> +
>> +static int tps6131x_strobe_get(struct led_classdev_flash *fled_cdev, bool *state)
>> +{
>> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
>> +	unsigned int reg3;
>> +	int ret;
>> +
>> +	guard(mutex)(&tps6131x->lock);
>> +
>> +	ret = regmap_read_bypassed(tps6131x->regmap, TPS6131X_REG_3, &reg3);
>> +	if (ret)
>> +		return ret;
>> +
>> +	*state = !!(reg3 & TPS6131X_REG_3_SFT);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tps6131x_flash_fault_get(struct led_classdev_flash *fled_cdev, u32 *fault)
>> +{
>> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
>> +	unsigned int reg3, reg4, reg6;
>> +	int ret;
>> +
>> +	*fault = 0;
>> +
> 
> Why no lock here?

The individual regmap operations are already protected by the internal 
lock. If reading from a register has no other problematic effects on the 
overall function, then no additional lock is needed.

I noticed that the lock in tps6131x_strobe_get() is no longer needed. 
I'll removed that as well.

> 
>> +	ret = regmap_read_bypassed(tps6131x->regmap, TPS6131X_REG_3, &reg3);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = regmap_read_bypassed(tps6131x->regmap, TPS6131X_REG_4, &reg4);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = regmap_read_bypassed(tps6131x->regmap, TPS6131X_REG_6, &reg6);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (reg3 & TPS6131X_REG_3_HPFL)
>> +		*fault |= LED_FAULT_SHORT_CIRCUIT;
>> +
>> +	if (reg3 & TPS6131X_REG_3_SELSTIM_TO)
>> +		*fault |= LED_FAULT_TIMEOUT;
>> +
>> +	if (reg4 & TPS6131X_REG_4_HOTDIE_HI)
>> +		*fault |= LED_FAULT_OVER_TEMPERATURE;
>> +
>> +	if (reg6 & (TPS6131X_REG_6_LEDHOT | TPS6131X_REG_6_LEDWARN))
>> +		*fault |= LED_FAULT_LED_OVER_TEMPERATURE;
>> +
>> +	if (!(reg6 & TPS6131X_REG_6_LEDHDR))
>> +		*fault |= LED_FAULT_UNDER_VOLTAGE;
>> +
>> +	if (reg6 & TPS6131X_REG_6_LEDHOT) {
>> +		ret = regmap_update_bits_base(tps6131x->regmap, TPS6131X_REG_6,
>> +					      TPS6131X_REG_6_LEDHOT, 0, NULL, false, true);
> 
> And this is not locked?

The read modify write operation is protected by regmap. Since this 
operation does not interact with any other functions, no lock is needed 
here.

> 
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
> 
> ...
> 
>> +
>> +static int tps6131x_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, bool enable)
>> +{
>> +	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
>> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
>> +
>> +	guard(mutex)(&tps6131x->lock);
>> +
>> +	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
>> +				 false);
>> +}
>> +
>> +static const struct v4l2_flash_ops tps6131x_v4l2_flash_ops = {
>> +	.external_strobe_set = tps6131x_flash_external_strobe_set,
>> +};
>> +
>> +static int tps6131x_v4l2_setup(struct tps6131x *tps6131x)
>> +{
>> +	struct v4l2_flash_config v4l2_cfg = { 0 };
>> +	struct led_flash_setting *intensity = &v4l2_cfg.intensity;
>> +
>> +	if (!IS_BUILTIN(CONFIG_V4L2_FLASH_LED_CLASS))
> 
> Why builtin? That's a tristate, so I don't get why driver and v4l flash
> cannot be modules. You wanted REACHABLE probably... but then it is
> anyway discouraged practice leading to runtime debugging. So actually
> you want CONFIG_V4L2_FLASH_LED_CLASS || !CONFIG_V4L2_FLASH_LED_CLASS
> dependency.

Okay, I'll add 'depends on V4L2_FLASH_LED_CLASS || 
!V4L2_FLASH_LED_CLASS' to the Kconfig entry and do the check in the 
driver like this:
   if (!IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS))
     return 0;

Is this solution okay for you?

> 
> See Kconfig description.
> 
>> +		return 0;
>> +
>> +	intensity->min = tps6131x->step_torch_current_ma;
>> +	intensity->max = tps6131x->max_torch_current_ma;
>> +	intensity->step = tps6131x->step_torch_current_ma;
>> +	intensity->val = intensity->min;
>> +
>> +	strscpy(v4l2_cfg.dev_name, tps6131x->fled_cdev.led_cdev.dev->kobj.name,
>> +		sizeof(v4l2_cfg.dev_name));
>> +
>> +	v4l2_cfg.has_external_strobe = true;
>> +	v4l2_cfg.flash_faults = LED_FAULT_TIMEOUT | LED_FAULT_OVER_TEMPERATURE |
>> +				LED_FAULT_SHORT_CIRCUIT | LED_FAULT_UNDER_VOLTAGE |
>> +				LED_FAULT_LED_OVER_TEMPERATURE;
>> +
>> +	tps6131x->v4l2_flash = v4l2_flash_init(tps6131x->dev, tps6131x->led_node,
>> +					       &tps6131x->fled_cdev, &tps6131x_v4l2_flash_ops,
>> +					       &v4l2_cfg);
>> +	if (IS_ERR(tps6131x->v4l2_flash)) {
>> +		dev_err(tps6131x->dev, "Failed to initialize v4l2 flash LED\n");
>> +		return PTR_ERR(tps6131x->v4l2_flash);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int tps6131x_probe(struct i2c_client *client)
>> +{
>> +	struct tps6131x *tps6131x;
>> +	int ret;
>> +
>> +	tps6131x = devm_kzalloc(&client->dev, sizeof(*tps6131x), GFP_KERNEL);
>> +	if (!tps6131x)
>> +		return -ENOMEM;
>> +
>> +	tps6131x->dev = &client->dev;
>> +	i2c_set_clientdata(client, tps6131x);
>> +	mutex_init(&tps6131x->lock);
>> +	INIT_DELAYED_WORK(&tps6131x->torch_refresh_work, tps6131x_torch_refresh_handler);
>> +
>> +	ret = tps6131x_parse_node(tps6131x);
>> +	if (ret)
>> +		return -ENODEV;
>> +
>> +	tps6131x->regmap = devm_regmap_init_i2c(client, &tps6131x_regmap);
>> +	if (IS_ERR(tps6131x->regmap)) {
>> +		ret = PTR_ERR(tps6131x->regmap);
>> +		dev_err(&client->dev, "Failed to allocate register map\n");
>> +		return ret;
> 
> Syntax is:
> 
> return dev_err_probe

Of course. ACK

> 
>> +	}
>> +
>> +	tps6131x->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
> 
> You should handle IS_ERR

ACK

Thanks!
  ~Matthias

> 
> 
> Best regards,
> Krzysztof
> 


