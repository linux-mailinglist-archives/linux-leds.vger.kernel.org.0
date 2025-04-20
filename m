Return-Path: <linux-leds+bounces-4512-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19382A947FC
	for <lists+linux-leds@lfdr.de>; Sun, 20 Apr 2025 15:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21EE7170207
	for <lists+linux-leds@lfdr.de>; Sun, 20 Apr 2025 13:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4945D1E98E8;
	Sun, 20 Apr 2025 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="t//J+PRX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-73.smtpout.orange.fr [80.12.242.73])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC9C1CB332;
	Sun, 20 Apr 2025 13:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745155772; cv=none; b=STMAx0Yuhy2YrE+Zkfy3k8lPh7VOdbLz5IitXo3y3MKLC1qQRahgNzxxcNgXn8xCiAz7Wn1bDZE1IoLDoZgQXbP7adnnG90IY5eK9tkH/T0pYttAT5hFq8aBQlApU+12rVR93cdjSupni41J097J/PMEM980oVver+/a0tBI11E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745155772; c=relaxed/simple;
	bh=PcRb4vLeIVgs+hODsyml2Uafst7f0xS4MleR3zZREiY=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=ZjNEN6k4zVDK+HImfoSrRT/yQliQdKl0kx27zMcX4wxXF327xbbFwrcgF96U5sFqpNlFfi0ZG/uywxWJPpJLpmSolu7ENHBMN/ocUX/KZj9OR1jQyDzmn/5XFa0Ot7ndrWJ0XMoPPe4PeLmAHv3wfEIGC4Z9FTVQ5UN/0mQL9s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=t//J+PRX; arc=none smtp.client-ip=80.12.242.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 6UjTu60N15k816UjWuGJEq; Sun, 20 Apr 2025 15:29:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1745155760;
	bh=jYjltECi5YDKwKyj5VL5qpNIaEa30McnrQUxHJBKdS8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=t//J+PRXn14OhvQxuWZr96TclZsScn64qkAYynsgUG+EJL6JfKw2OVcT57RGF8SPd
	 KMgkOfPjrtX9hGGU5COZhZZIwLdwul5XimSDMv4f6Kpm4h49qfc3DC8R1TMCVpwjrv
	 3yG7OAs9cqGJHQR9xwRFXb9iisskKReiETaiFUYXEse3wLTSODuCyuof2jmYxD6/5v
	 Dd5Woemd9Js/moxzKGcaIUBuvlxLb7MtR3Ud4pyQSUvyDm9VhEJWplyCBxlL922Hnn
	 HPFyRjcTzejYynOeWgw4hn9U6qnUE9lKNBD0GgW6IBuT/HbF8E6P39MXty9T0IhMaO
	 iSJoKAMROfKoQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 20 Apr 2025 15:29:20 +0200
X-ME-IP: 90.11.132.44
Message-ID: <688b74ce-3650-418f-82bd-63a5cee080d1@wanadoo.fr>
Date: Sun, 20 Apr 2025 15:29:15 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] leds: add TI/National Semiconductor LP5812 LED
 Driver
References: <20250419184333.56617-1-trannamatk@gmail.com>
 <20250419184333.56617-3-trannamatk@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: trannamatk@gmail.com
Cc: conor+dt@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, pavel@kernel.org, robh@kernel.org
In-Reply-To: <20250419184333.56617-3-trannamatk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 19/04/2025 à 20:43, Nam Tran a écrit :
> The LP5812 is a 4×3 matrix RGB LED driver
> with an autonomous animation engine
> and time-cross-multiplexing (TCM) support for up to 12 LEDs.
> Each LED can be configured through the related registers
> to realize vivid and fancy lighting effects.

...

> +static int lp5812_init_dev_config(struct lp5812_chip *chip,
> +		const char *drive_mode, int rm_led_sysfs);
> +
> +static struct drive_mode_led_map chip_leds_map[] = {

I think this could be const.

> +	{
> +		"direct_mode",
> +		(const char *[]){LED0, LED1, LED2, LED3, NULL}
> +	},

...

> +static int lp5812_get_phase_align(struct lp5812_chip *chip, int led_number,
> +		int *phase_align_val)
> +{
> +	int ret;
> +	int bit_pos;
> +	u16 reg;
> +	u8 reg_val;
> +
> +	reg = DEV_CONFIG7 + (led_number / 4);
> +	bit_pos = (led_number % 4) * 2;
> +
> +	ret = lp5812_read(chip, reg, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	*phase_align_val = (reg_val >> bit_pos) & 0x03;
> +
> +	return ret;
> +}
> +
> +static int lp5812_get_led_mode(struct lp5812_chip *chip,
> +		int led_number, enum control_mode *mode)
> +{
> +	int ret = 0;

In several function, sometimes ret is initialized, sometimes it is not.
See lp5812_get_led_mode() and lp5812_get_phase_align() just above.

This could be done in a more consistent way.

> +	u16 reg;
> +	u8 reg_val;
> +
> +	if (led_number < 0x8)
> +		reg = DEV_CONFIG3;
> +	else
> +		reg = DEV_CONFIG4;
> +
> +	ret = lp5812_read(chip, reg, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	*mode = (reg_val & (1 << (led_number % 8))) ? AUTONOMOUS : MANUAL;
> +
> +	return 0;
> +}

...

> +static void set_mix_sel_led(struct lp5812_chip *chip, int mix_sel_led)
> +{

Maybe init the 4 values at 0 first, then set to 1 only what is needed 
below? This would save a few lines of code.

> +	if (mix_sel_led == 0) {
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 1;
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 0;
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 0;
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 0;
> +	}
> +	if (mix_sel_led == 1) {
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 0;
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 1;
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 0;
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 0;
> +	}
> +	if (mix_sel_led == 2) {
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 0;
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 0;
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 1;
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 0;
> +	}
> +	if (mix_sel_led == 3) {
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 0;
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 0;
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 0;
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 1;
> +	}
> +}

...

> +static ssize_t dev_config_show(struct device *dev,
> +		struct device_attribute *attr,
> +		char *buf)
> +{

The whole function could be simplified with sysfs_emit_at().
This avoids temp buffer, malloc/free and some copies.

See led_auto_animation_show() below.

> +	int i;
> +	int num_drive_mode;
> +	char *mode_info;
> +	char *total_str;
> +	size_t total_length;
> +	char *const_str = "\nPlease select below valid drive mode:\n";
> +	char *const_ex_str = "For Ex: echo tcmscan:1:0 > dev_config\n";
> +	int ret = 0;
> +	struct lp5812_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
> +
> +	/* get drive mode and scan order */
> +	mutex_lock(&chip->lock);
> +	ret = lp5812_get_drive_mode_scan_order(chip);
> +	mutex_unlock(&chip->lock);
> +	if (ret)
> +		return -EIO;
> +
> +	mode_info = parse_dev_config_info(chip);
> +	if (!mode_info)
> +		return -ENOMEM;
> +
> +	num_drive_mode = ARRAY_SIZE(chip_leds_map);
> +	total_length = strlen(mode_info) + strlen(const_str) +
> +			strlen(const_ex_str) + 1;
> +	for (i = 0; i < num_drive_mode; ++i) {
> +		total_length += strlen(chip_leds_map[i].drive_mode) +
> +					strlen("\n");
> +	}
> +
> +	total_str = kmalloc(total_length, GFP_KERNEL);
> +	if (!total_str)
> +		return -ENOMEM;
> +
> +	sprintf(total_str, "%s%s%s", mode_info, const_str, const_ex_str);
> +	for (i = 0; i < num_drive_mode; ++i) {
> +		strcat(total_str, chip_leds_map[i].drive_mode);
> +		strcat(total_str, "\n");
> +	}
> +
> +	ret = sysfs_emit(buf, "%s", total_str);
> +	kfree(mode_info);
> +	kfree(total_str);
> +
> +	return ret;
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

Space missing after the , ?

> +		time_name_array[start_pause], stop_pause_time,
> +		time_name_array[stop_pause], led_playback_time,
> +		led_playback_time_arr[playback_time]);
> +	}
> +	strcat(tmp_str, usage);
> +	mutex_unlock(&chip->lock);
> +	return sysfs_emit(buf, "%s\n", tmp_str);
> +
> +out:
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}

In order to have it more readable (IMHO), use less buffers, make less 
copies, reduce code duplication and reduce the locking section, maybe 
something like (un-tested):

static ssize_t led_auto_animation_show(struct kobject *kobj,
		struct kobj_attribute *attr, char *buf)
{
	int aeu_selection, playback_time, start_pause, stop_pause;
	struct lp5812_led *led = to_lp5812_led(kobj);
	struct lp5812_chip *chip = led->priv;
	int pos = 0;
	int ret;

	mutex_lock(&chip->lock);
	ret = led_get_autonomous_animation_config(led);
	if (ret) {
		ret = -EIO;
		goto out;
	}

	/* parse config and feedback to userspace */
	aeu_selection = led->led_playback.s_led_playback.aeu_selection;
	playback_time = led->led_playback.s_led_playback.led_playback_time;
	start_pause = led->start_stop_pause_time.s_time.second;
	stop_pause = led->start_stop_pause_time.s_time.first;

	mutex_unlock(&chip->lock);

	pos += sysfs_emit_at(buf, pos, "AEU Select: ");
	if (aeu_selection == ONLY_AEU1)
		pos += sysfs_emit_at(buf, pos, "Only use AEU1");
	else if (aeu_selection == AEU1_AEU2)
		pos += sysfs_emit_at(buf, pos, "Use AEU1 and AEU2");
	else
		pos += sysfs_emit_at(buf, pos, "Use AEU1, AEU2 and AEU3");

	pos += sysfs_emit_at(buf, pos, "; Start pause time: %s",
			     time_name_array[start_pause]);
	pos += sysfs_emit_at(buf, pos, "; Start pause time: %s",
			     time_name_array[start_pause]);
	pos += sysfs_emit_at(buf, pos, "; LED Playback time: %s",
			     led_playback_time_arr[playback_time]);

	pos += sysfs_emit_at(buf, pos, "\n");
	pos += sysfs_emit_at(buf, pos, "Command usage: echo (aeu number):(start 
pause time):(stop pause time):(playback time) > autonomous_animation\n");

	return pos;

out:
	mutex_unlock(&chip->lock);
	return ret;
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

Maybe unlock here, to simplify code and be consistent with some other 
functions above? (led_pwm_dimming_scale_show(), ...)

Several other show/store function could be slightly simplified the same way.

> +	if (ret != 0) {
> +		mutex_unlock(&chip->lock);
> +		return -EIO;
> +	}
> +	mutex_unlock(&chip->lock);
> +
> +	return sysfs_emit(buf, "%d\n", val);
> +}

...

> +struct lp5812_led {
> +	struct kobject                        kobj;
> +	struct lp5812_chip                    *priv;
> +	struct attribute_group                attr_group;
> +	int                                   enable;
> +	enum control_mode                     mode;
> +	enum dimming_type                     dimming_type;
> +	u8                                    lod_lsd;
> +	u8                                    auto_pwm;
> +	u8                                    aep_status;
> +	u16                                   anim_base_addr;
> +	int                                   led_number; /* start from 0 */
> +	int                                   is_sysfs_created;
> +	const char                            *led_name;
> +
> +	union led_playback                    led_playback;
> +	union time                            start_stop_pause_time;
> +
> +	int                                   total_aeu;

What is the need to keeping it here?
It is set to MAX_AEU. Why not just use it directly?

If needed for future use, maybe, 'aeu' below should be a flex array?

> +	struct anim_engine_unit               aeu[MAX_AEU];
> +};
> +
> +struct lp5812_chip {
> +	struct i2c_client                     *i2c_cl;
> +	struct mutex                          lock; /* Protects access to device registers */
> +	struct device                         *dev;
> +	struct attribute_group                attr_group;
> +	const struct lp5812_specific_regs     *regs;
> +	const struct drive_mode_led_map       *chip_leds_map;
> +	enum device_command                   command;
> +	int                                   total_leds;

What is the need to keeping it here?
It is set to MAX_LEDS. Why not just use it directly?

If needed for future use, maybe, 'leds' below should be a flex array?

> +	union scan_order                      u_scan_order;
> +	union drive_mode_info                 u_drive_mode;
> +
> +	struct lp5812_led                     leds[MAX_LEDS]; /* MAX 16 LEDs */

This comment looks useless, IMHO.

> +};
> +
> +#endif /*_LEDS_LP5812_H_*/


