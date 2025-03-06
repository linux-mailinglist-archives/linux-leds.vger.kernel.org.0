Return-Path: <linux-leds+bounces-4178-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF97A55620
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 20:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96BD81605F8
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 19:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2B326D5A7;
	Thu,  6 Mar 2025 19:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="A3lXl5tt"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D2825A2B5;
	Thu,  6 Mar 2025 19:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741287785; cv=none; b=fPgAMex//r5w1xeNlxkRJBXnG5V1jP3zsH8UT7XqRm5kd4gDludRAWpTMJRKn8nz/GlvkIBAxXVg4pbLFJLazqHp3bzjbXC5Ma57CS7muqciGe87R9J5XWF/biOTo3J1cU0BbvbehQNV48XemLdoTG40eguUqZz49MmVfQ4euDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741287785; c=relaxed/simple;
	bh=kj5Vmw4cKQN/TQ8VqYNYKR0rJdxfE93ognsDe1M3Pfo=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=bu4sHwZIYDV6mhHdtDeQem2d6MpTdQZoPghz1e+kcALmAbk5IfEsNxvljL9H0I+XCT4IQSGXNP8fBc/8VeWm/c7pY2x0+7wO7JlMRhG36xUsyoZImJiJQ1n1lPi7tDs7c+hD289TXf01fvHvQhI/YeJ2xB3UAlLKBuRo1gufhBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=A3lXl5tt; arc=none smtp.client-ip=80.12.242.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id qGLut4db0nwqeqGLxtYKJ1; Thu, 06 Mar 2025 19:53:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1741287234;
	bh=yHhGP/Jm26P5uwbDPOENf49unxj+shHxyBA4UaYTmg0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=A3lXl5ttdRliA8u3heg1nxTFfnbcfzmZAqrviLjz+wZT7ZQ280NqTrvStqzG9QwWC
	 +U5EdOw7ARIB+kvkQe5IzqnqwihoI6xPmZ4yEwDYF0L5/BroNobYKagD44W6cBjJ2O
	 fGw5PGUJSZwzGX18h6bE//RwvsqaaIOMBuVvpGAJUw3FyWcp8EcJNO6DQgljwOAWpx
	 mM8h8PVK77wa5FqUGG5f9tALK8/2xHIIiCgfu5u4mSK/i7viwRYmdooeRPrpPmmwQX
	 19mdRHwv8bJhHKcIXFuHzvSyE+I6Of+8t0tys9q2c+52kZmIstqp/RMgGmqjb7LIpm
	 PJETLfqstm/Uw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 06 Mar 2025 19:53:54 +0100
X-ME-IP: 90.11.132.44
Message-ID: <50dab2fb-27ad-4a29-8af9-a0f07098cec2@wanadoo.fr>
Date: Thu, 6 Mar 2025 19:53:49 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] leds: add new LED driver for TI LP5812
References: <20250306172126.24667-1-trannamatk@gmail.com>
 <20250306172126.24667-4-trannamatk@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: trannamatk@gmail.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 lee@kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 pavel@kernel.org, robh@kernel.org
In-Reply-To: <20250306172126.24667-4-trannamatk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 06/03/2025 à 18:21, Nam Tran a écrit :
> The chip can drive LED matrix 4x3.
> This driver enables LED control via I2C.
> 
> The driver is implemented in two parts:
> - Core driver logic in leds-lp5812.c
> - Common support functions in leds-lp5812-common.c
> 
> Signed-off-by: Nam Tran <trannamatk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

A few comments/nitpicks.

Some of them can be applied in several places, I've not spotted all of 
them, but you get the idea.

Hoping, this will help to clean the code and help other reviewers.

> +
> +static ssize_t led_mode_store(struct kobject *kobj,
> +		struct kobj_attribute *attr, const char *buf, size_t count)
> +{
> +	int val, ret;
> +	struct lp5812_led *led = to_lp5812_led(kobj);
> +	struct lp5812_chip *chip = led->priv;
> +
> +	if (sysfs_streq(buf, "manual")) {
> +		/* Remove AEU sysfs interface for current led in manual mode */
> +		aeu_remove_multi_sysfs_groups(led);
> +		val = 0;

Maybe use AUTONOMOUS or MANUAL directly.

> +	} else if (sysfs_streq(buf, "autonomous")) {
> +		val = 1;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&chip->lock);
> +	ret = lp5812_set_led_mode(chip, led->led_number,
> +			val ? AUTONOMOUS : MANUAL);
> +	if (ret) {
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +	ret = aeu_create_multi_sysfs_groups(led);
> +	if (ret) {
> +		dev_err(chip->dev, "aeu_create_multi_sysfs_groups() failed\n");
> +		goto out;
> +	}
> +
> +	mutex_unlock(&chip->lock);
> +	return count;
> +out:
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}

...

> +static ssize_t led_manual_pwm_store(struct kobject *kobj,
> +		struct kobj_attribute *attr, const char *buf, size_t count)
> +{
> +	int manual_pwm;
> +	int ret;
> +	struct lp5812_led *led = to_lp5812_led(kobj);
> +	struct lp5812_chip *chip = led->priv;
> +
> +	ret = kstrtoint(buf, 0, &manual_pwm);
> +	if (ret)
> +		return ret;
> +
> +	if (manual_pwm < 0 || manual_pwm > 255)
> +		return -EINVAL; /* Invalid argument */

Useless comment (here and in several other places)

> +
> +	/* set to hardware */
> +	mutex_lock(&chip->lock);
> +	if (lp5812_manual_dc_pwm_control(chip, led->led_number,
> +		manual_pwm, PWM)) {
> +		mutex_unlock(&chip->lock);
> +		return -EIO;
> +	}
> +	mutex_unlock(&chip->lock);
> +
> +	return count;
> +}

...

> +static ssize_t led_auto_dc_store(struct kobject *kobj,
> +		struct kobj_attribute *attr, const char *buf, size_t count)
> +{
> +	int auto_dc;
> +	int ret;
> +	struct lp5812_led *led = to_lp5812_led(kobj);
> +	struct lp5812_chip *chip = led->priv;
> +
> +	ret = kstrtoint(buf, 0, &auto_dc);
> +	if (ret)
> +		return ret;
> +
> +	if (auto_dc < 0 || auto_dc > 255)
> +		return -EINVAL; /* Invalid argument */

Useless comment

> +
> +	/* set to hardware */
> +	mutex_lock(&chip->lock);
> +	if (lp5812_autonomous_dc_pwm_control(chip, led->led_number,
> +			auto_dc, ANALOG)) {
> +		mutex_unlock(&chip->lock);
> +		return -EIO;
> +	}
> +	mutex_unlock(&chip->lock);
> +
> +	return count;
> +}

...

> +static int parse_autonomous_animation_config(struct lp5812_led *led,
> +		const char *user_buf)
> +{
> +	int ret;
> +	int i;
> +	char *str;
> +	char *sub_str;
> +	int aeu_select, start_pause_time, stop_pause_time, led_playback_time;
> +
> +	str = kmalloc(strlen(user_buf) + 1, GFP_KERNEL);

kstrdup()?

> +	if (!str)
> +		return -ENOMEM;
> +	strscpy(str, user_buf, strlen(user_buf) + 1);
> +
> +	/* parse aeu_select */
> +	sub_str = strsep(&str, ":");
> +	ret = kstrtoint(sub_str, 0, &aeu_select);
> +	if (ret)
> +		return ret;
> +	if (aeu_select < 1 || aeu_select > 3)
> +		return -EINVAL;
> +
> +	aeu_remove_multi_sysfs_groups(led);
> +
> +	for (i = 0; i < aeu_select; i++)
> +		aeu_create_sysfs_group(&led->aeu[i]);
> +	led->led_playback.s_led_playback.aeu_selection = aeu_select - 1;
> +
> +	/* parse start_pause_time */
> +	sub_str = strsep(&str, ":");
> +	if (sub_str) {
> +		ret = kstrtoint(sub_str, 0, &start_pause_time);
> +		if (ret)
> +			return ret;
> +		if (start_pause_time < 0 || start_pause_time > 15)
> +			return -EINVAL;
> +		led->start_stop_pause_time.s_time.second = start_pause_time;
> +	} else {
> +		led->start_stop_pause_time.s_time.second = 15;
> +	}
> +
> +	/* parse stop_pause_time */
> +	sub_str = strsep(&str, ":");
> +	if (sub_str) {
> +		ret = kstrtoint(sub_str, 0, &stop_pause_time);
> +		if (ret)
> +			return ret;
> +		if (stop_pause_time < 0 || stop_pause_time > 15)
> +			return -EINVAL;
> +		led->start_stop_pause_time.s_time.first = stop_pause_time;
> +	} else {
> +		led->start_stop_pause_time.s_time.first = 15;
> +	}
> +
> +	/* parse led_playback_time */
> +	sub_str = strsep(&str, ":");
> +	if (sub_str) {
> +		ret = kstrtoint(sub_str, 0, &led_playback_time);
> +		if (ret)
> +			return ret;
> +		if (led_playback_time < 0 || led_playback_time > 15)
> +			return -EINVAL;
> +		led->led_playback.s_led_playback.led_playback_time =
> +			led_playback_time;
> +	} else {
> +		led->led_playback.s_led_playback.led_playback_time = 15;
> +	}
> +
> +	return 0;
> +}

...

> +static ssize_t led_auto_animation_show(struct kobject *kobj,
> +		struct kobj_attribute *attr, char *buf)
> +{
> +	int ret;
> +	char tmp_str[256] = {};
> +	char usage[128] = {};
> +	char *aeu_select = "AEU Select: ";
> +	char *start_pause_time = "Start pause time: ";
> +	char *stop_pause_time = "; Stop pause time: ";
> +	char *led_playback_time = "; LED Playback time: ";
> +	int aeu_selection, playback_time, start_pause, stop_pause;
> +	struct lp5812_led *led = to_lp5812_led(kobj);
> +	struct lp5812_chip *chip = led->priv;
> +
> +	sprintf(usage, "%s%s",
> +	"Command usage: echo (aeu number):(start pause time):",
> +	"(stop pause time):(playback time) > autonomous_animation");
> +
> +	mutex_lock(&chip->lock);
> +	ret = led_get_autonomous_animation_config(led);
> +	if (ret) {
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +	/* parse config and feedback to userspace */
> +	aeu_selection = led->led_playback.s_led_playback.aeu_selection;
> +	playback_time = led->led_playback.s_led_playback.led_playback_time;
> +	start_pause = led->start_stop_pause_time.s_time.second;
> +	stop_pause = led->start_stop_pause_time.s_time.first;
> +	if (aeu_selection == ONLY_AEU1) {
> +		sprintf(tmp_str, "%s%s%s%s%s%s%s%s\n", aeu_select,

Maybe add a least 1 tab for all this parameters, to improve readability?

> +		"Only use AEU1; ", start_pause_time,
> +		time_name_array[start_pause], stop_pause_time,
> +		time_name_array[stop_pause], led_playback_time,
> +		led_playback_time_arr[playback_time]);
> +	} else if (aeu_selection == AEU1_AEU2) {
> +		sprintf(tmp_str, "%s%s%s%s%s%s%s%s\n", aeu_select,
> +		"Use AEU1 and AEU2; ", start_pause_time,
> +		time_name_array[start_pause], stop_pause_time,
> +		time_name_array[stop_pause], led_playback_time,
> +		led_playback_time_arr[playback_time]);
> +	} else {
> +		sprintf(tmp_str, "%s%s%s%s%s%s%s%s\n", aeu_select,
> +		"Use AEU1,AEU2 and AEU3; ", start_pause_time,
> +		time_name_array[start_pause], stop_pause_time,
> +		time_name_array[stop_pause], led_playback_time,
> +		led_playback_time_arr[playback_time]);
> +	}
> +	strcat(tmp_str, usage);
> +	mutex_unlock(&chip->lock);
> +	return sprintf(buf, "%s\n", tmp_str);
> +
> +out:
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}

...

> +static ssize_t led_pwm_dimming_scale_store(struct kobject *kobj,
> +		struct kobj_attribute *attr, const char *buf, size_t count)
> +{
> +	int val, ret;
> +	struct lp5812_led *led = to_lp5812_led(kobj);
> +	struct lp5812_chip *chip = led->priv;
> +
> +	if (sysfs_streq(buf, "linear"))
> +		val = 0;

Maybe use directly LINEAR or EXPONENTIAL to simplify the code?

> +	else if (sysfs_streq(buf, "exponential"))
> +		val = 1;
> +	else
> +		return -EINVAL;
> +
> +	mutex_lock(&chip->lock);
> +	ret = lp5812_set_pwm_dimming_scale(chip, led->led_number,
> +			val ? EXPONENTIAL : LINEAR);
> +	mutex_unlock(&chip->lock);
> +	if (ret)
> +		return -EIO;
> +
> +	return count;
> +}

...

> +static struct attribute *led_kobj_attributes[] = {
> +	&kobj_attr_enable.attr,
> +	&kobj_attr_mode.attr,
> +	&kobj_attr_manual_dc.attr,
> +	&kobj_attr_manual_pwm.attr,
> +	&kobj_attr_autonomous_dc.attr,
> +	&kobj_attr_autonomous_animation.attr,
> +	&kobj_attr_lod_lsd.attr,
> +	&kobj_attr_auto_pwm_val.attr,
> +	&kobj_attr_aep_status.attr,
> +	&kobj_attr_pwm_phase_align.attr,
> +	&kobj_attr_pwm_dimming_scale.attr,
> +	NULL,

Nitpick: unneeded comma after a terminator

> +};

...

> +static ssize_t aeu_pwm4_store(struct kobject *kobj,
> +		struct kobj_attribute *attr, const char *buf, size_t count)
> +{
> +	int val = 0;
> +	int ret = 0;
> +	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
> +	struct lp5812_chip *chip = aeu->led->priv;
> +
> +	ret = kstrtoint(buf, 0, &val);
> +	if (ret)
> +		return -EINVAL;
> +	if (val < 0 || val > 255)
> +		return -EINVAL; /* Invalid argument */

This comment is not really useful.

> +
> +	mutex_lock(&chip->lock);
> +	ret = led_aeu_pwm_set_val(aeu, val, PWM4);
> +	if (ret != 0) {
> +		mutex_unlock(&chip->lock);
> +		return -EIO;
> +	}
> +	mutex_unlock(&chip->lock);
> +
> +	return count;
> +}
> +
> +static ssize_t aeu_pwm4_show(struct kobject *kobj,
> +		struct kobj_attribute *attr, char *buf)
> +{
> +	int ret = 0;
> +	u8 val = 0;
> +	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
> +	struct lp5812_chip *chip = aeu->led->priv;
> +
> +	mutex_lock(&chip->lock);
> +	ret = led_aeu_pwm_get_val(aeu, &val, PWM4);
> +	mutex_unlock(&chip->lock);
> +	if (ret)
> +		return -EIO;
> +
> +	return sprintf(buf, "%d\n", val);
> +

Maybe the core of aeu_pwm|14]_store() and aeu_pwm[14]_show() could be 
implemented only once, with an additional parameter for PWx?

}

...

> +static ssize_t aeu_playback_time_show(struct kobject *kobj,
> +		struct kobj_attribute *attr, char *buf)
> +{
> +	int ret = 0;
> +	u8 val = 0;
> +	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
> +	struct lp5812_chip *chip = aeu->led->priv;
> +
> +	mutex_lock(&chip->lock);
> +	ret = led_aeu_playback_time_get_val(aeu, &val);
> +	if (ret != 0) {
> +		mutex_unlock(&chip->lock);
> +		return -EIO;
> +	}
> +	mutex_unlock(&chip->lock);
> +
> +	return sprintf(buf, "%d\n", val);

sysfs_emit? (here and in mayne places)

> +}
> +
> +static LP5812_KOBJ_ATTR_RW(pwm1, aeu_pwm1_show, aeu_pwm1_store);
> +static LP5812_KOBJ_ATTR_RW(pwm2, aeu_pwm2_show, aeu_pwm2_store);
> +static LP5812_KOBJ_ATTR_RW(pwm3, aeu_pwm3_show, aeu_pwm3_store);
> +static LP5812_KOBJ_ATTR_RW(pwm4, aeu_pwm4_show, aeu_pwm4_store);
> +static LP5812_KOBJ_ATTR_RW(pwm5, aeu_pwm5_show, aeu_pwm5_store);
> +static LP5812_KOBJ_ATTR_RW(slope_time_t1, aeu_slope_time_t1_show,
> +		aeu_slope_time_t1_store);
> +static LP5812_KOBJ_ATTR_RW(slope_time_t2, aeu_slope_time_t2_show,
> +		aeu_slope_time_t2_store);
> +static LP5812_KOBJ_ATTR_RW(slope_time_t3, aeu_slope_time_t3_show,
> +		aeu_slope_time_t3_store);
> +static LP5812_KOBJ_ATTR_RW(slope_time_t4, aeu_slope_time_t4_show,
> +		aeu_slope_time_t4_store);
> +static LP5812_KOBJ_ATTR_RW(playback_time, aeu_playback_time_show,
> +		aeu_playback_time_store);
> +
> +static struct attribute *aeu_kobj_attributes[] = {
> +	&kobj_attr_pwm1.attr,
> +	&kobj_attr_pwm2.attr,
> +	&kobj_attr_pwm3.attr,
> +	&kobj_attr_pwm4.attr,
> +	&kobj_attr_pwm5.attr,
> +	&kobj_attr_slope_time_t1.attr,
> +	&kobj_attr_slope_time_t2.attr,
> +	&kobj_attr_slope_time_t3.attr,
> +	&kobj_attr_slope_time_t4.attr,
> +	&kobj_attr_playback_time.attr,
> +	NULL,

Nitpick: unneeded comma after a terminator

> +};
> +
> +static void aeu_init_properties(struct lp5812_led *led)
> +{
> +	int i;
> +
> +	for (i = 0; i < MAX_AEU; i++) {
> +		led->aeu[i].aeu_name = aeu_name_array[i];
> +		led->aeu[i].aeu_number = i + 1;
> +		led->aeu[i].led = led;
> +		led->aeu[i].enabled = 0;
> +		led->aeu[i].attr_group.attrs = aeu_kobj_attributes;
> +		kobject_init(&led->aeu[i].kobj, &aeu_ktype);
> +	}
> +}
> +
> +static int lp5812_probe(struct i2c_client *client)
> +{
> +	struct lp5812_chip *chip;
> +	int i;
> +	int ret;
> +	u8 val;
> +
> +	chip = devm_kzalloc(&client->dev, sizeof(struct lp5812_chip),
> +			GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +	mutex_init(&chip->lock);
> +	chip->i2c_cl = client;
> +	chip->dev = &client->dev;
> +	chip->regs = &regs;
> +	chip->command = NONE;
> +	chip->total_leds = MAX_LEDS;
> +	chip->attr_group.name = "lp5812_chip_setup";
> +	chip->attr_group.attrs = lp5812_chip_attributes;
> +	chip->chip_leds_map = chip_leds_map;
> +	chip->u_drive_mode.drive_mode_val = 0x10;
> +	chip->u_scan_order.scan_order_val = 0x00;
> +
> +	/* initialize property for each led */
> +	for (i = 0; i < MAX_LEDS; i++) {
> +		chip->leds[i].led_name = led_name_array[i];
> +		chip->leds[i].led_number = i;
> +		chip->leds[i].anim_base_addr = anim_base_addr_array[i];
> +		chip->leds[i].enable = 0; /* LED disable as default */
> +		chip->leds[i].mode = MANUAL; /* manual mode as default */
> +		chip->leds[i].priv = chip;
> +		chip->leds[i].total_aeu = MAX_AEU;
> +		chip->leds[i].led_playback.led_playback_val = 0;
> +		chip->leds[i].start_stop_pause_time.time_val = 0;
> +		/* sysfs for this led not be created */
> +		chip->leds[i].is_sysfs_created = 0;
> +		chip->leds[i].attr_group.attrs = led_kobj_attributes;
> +		kobject_init(&chip->leds[i].kobj, &led_ktype);
> +
> +		/* init animation engine unit properties */
> +		aeu_init_properties(&chip->leds[i]);
> +
> +		/* set autonomous animation config as default for all LEDs */
> +		led_set_autonomous_animation_config(&chip->leds[i]);
> +	}
> +
> +	i2c_set_clientdata(client, chip);
> +
> +	ret = sysfs_create_group(&chip->dev->kobj, &chip->attr_group);
> +	if (ret) {
> +		dev_err(chip->dev, "sysfs_create_group failed\n");

Maybe return dev_err_probe?

> +		return ret;
> +	}
> +
> +	ret = lp5812_init_dev_config(chip, "tcmscan:4:0:1:2:3", 0);
> +	if (ret) {
> +		dev_err(chip->dev, "%s: lp5812_init_dev_config failed\n",
> +			__func__);

Maybe return dev_err_probe?

> +		return ret;
> +	}
> +	/* initialize lp5812 chip */

Nitpick: this comment is not really useful, IMHO, the line just after 
should be enough

> +	ret = lp5812_initialize(chip);

Missing error handling?

> +
> +	/* code to verify i2c read/write ok or not */
> +	lp5812_read(chip, (u16)DEV_CONFIG2, &val);
> +
> +	lp5812_write(chip, (u16)LED_A1_AUTO_BASE_ADRR, 0x14);
> +	lp5812_read(chip, (u16)LED_A1_AUTO_BASE_ADRR, &val);
> +	/* End code to verify i2c read/write*/
> +
> +	return 0;
> +}
> +
> +static void lp5812_remove(struct i2c_client *client)
> +{
> +	struct lp5812_chip *chip = i2c_get_clientdata(client);
> +
> +	mutex_destroy(&chip->lock);
> +	leds_remove_existed_sysfs(chip);
> +	sysfs_remove_group(&chip->dev->kobj, &chip->attr_group);
> +
> +	/* Disable all Leds */

Nitpick: this comment is not really useful, IMHI, the line just after 
should be enough

> +	lp5812_disable_all_leds(chip);
> +
> +	/* Disable lp5812 device */
> +	lp5812_enable_disable(chip, 0);
> +}
> +
> +static const struct i2c_device_id lp5812_id[] = {
> +	{ "lp5812", 0 },

Nitpick: unneeded explicit 0

> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, lp5812_id);
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id of_lp5812_match[] = {
> +	{ .compatible = "ti,lp5812", },
> +	{/* NULL */},

Nitpick: unneeded comma after a terminator

> +};
> +
> +MODULE_DEVICE_TABLE(of, of_lp5812_match);
> +#endif
> +
> +static struct i2c_driver lp5812_driver = {
> +	.driver = {
> +		.name   = "lp5812",
> +		.of_match_table = of_match_ptr(of_lp5812_match),
> +	},
> +	.probe          = lp5812_probe,
> +	.remove         = lp5812_remove,
> +	.id_table       = lp5812_id,
> +};
> +
> +module_i2c_driver(lp5812_driver);
> +
> +MODULE_DESCRIPTION("Texas Instruments LP5812 LED Driver");
> +MODULE_AUTHOR("Jared Zhou");
> +MODULE_LICENSE("GPL");


