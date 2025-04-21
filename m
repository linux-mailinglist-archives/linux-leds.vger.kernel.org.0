Return-Path: <linux-leds+bounces-4513-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3739EA94AB2
	for <lists+linux-leds@lfdr.de>; Mon, 21 Apr 2025 04:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20E4D3A7DF2
	for <lists+linux-leds@lfdr.de>; Mon, 21 Apr 2025 02:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75B92561D4;
	Mon, 21 Apr 2025 02:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlBcDT2s"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0959B36D;
	Mon, 21 Apr 2025 02:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745202119; cv=none; b=nWnpz5ksbpI7YQG/y5xRJTRI0Pqn/taHHHwO/uecOWAGE7T9pIOQ+uGn5Cfw6fk+krGerRp0Q82zvcFnAPCnakt9qCl5PcMyP+yyKSOobGOJA5H1SkON57RyiC92tYm9UEBdEvZ4bmRR/3+rhcogFXW5jVe3JSXItm52yzucCto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745202119; c=relaxed/simple;
	bh=IWFblIe3/6OY5oH5EpUBxXEcBt3vfgN6Iyfy+xfVs7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZbuomDRr6xR2kGySnbOU8i5XW7FnFg9rlsQDJoljTOoOsiX/c3NNzQ66CYcT03Je/fMvC3Ln5rzPvU6nTXvgJ907lIxuZUYryVzzHSIU9GjAh5N6H2UUWcsTL6ZhRkXeEki27jG6HBm+6VNtLChCoRSdlcMfZeJZ+lNTKf3Fol4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlBcDT2s; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so2609101a91.2;
        Sun, 20 Apr 2025 19:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745202117; x=1745806917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8q5pUeCMzG/ddfIfWNOb//UZiwCQX40QXzjzCXdrVU8=;
        b=dlBcDT2shG8hT6bLIWshmJ4MOSeK1ZeliJ3pz6bN5RwzvbSKFgMGRBIxrFJt402Cuo
         HwJzhvZt055H2OsjrwNqT+bZ6ybxTNw+X9RFekNTkRae8VqfTWnGd48f0db4hGuKJR5j
         0hLwVv6OmR/UgUQAAPoVxSzVT/y7N06upzu0+S3FczhPDIvLHaOkr4Fhf16ACByX4DrC
         qP9zRG+7UCg5WLqHmTlkbI5nAvJUs9RHe72hGZncWj2E+qy+D+9+ft6R2E+dE+U+ECU1
         EaWDq2HNUgqLubR85+vzQw+TI+ctjNpt3tl9VXcvmWUvP76okFHBL4uyYxQN5K/YV+Ql
         rrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745202117; x=1745806917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8q5pUeCMzG/ddfIfWNOb//UZiwCQX40QXzjzCXdrVU8=;
        b=ONNCBVBRjt6pQpqAtXsUVzhWDZIiXf5RaDrLO5eV8hDZmZrvhAJArUK4M4LT4/DzCd
         mNS02j7iwLX8G4gxzI7LLVRvbS807ekFaV1gkr5wUT4Jp4fcJDYLg6NX4vtcedvi4VZM
         UQBwnQGgvsQq+niLIEpA9H1btEzm3sZ1Tl+TrLTem7sssuhHQXyDlGVPNzqB5AbfhJne
         DcpywxcLsh1PMw1KsZtqTUGPuv70PuZecMhfBzQBIrorLUcIq/HnZsr5WBHTtL3tjx8W
         E7aTG7W0VMTIsxgBvpxOfU9rsV84C6zqPjokEXJTRoDTKOKM4IJfLxExRmHYDlrfMoBv
         9/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUHUdh6NBYnbxxTchMf8jzX2TynqeCYTv+poss2V7+s7eaoJW0yyviBs4nCXpznE3xEdbctcEDRZGO1@vger.kernel.org, AJvYcCWgXcy82zMYM9uwOisPkVXyT8Pv4YSQ4k+pc9XPW6TewIBddDARwIX3etNMb8wRWrxP/BtVdWHrXwQZQw==@vger.kernel.org, AJvYcCWh8eEoRdSnfQOTsSDOr0nT9ZzC6tbNxR7+oWCfRXCOY7NyUNh7kPTnTGXJfyMKP24K3acgMnAxPRW1YlPL@vger.kernel.org
X-Gm-Message-State: AOJu0YzJPmcwaKs8m8pER6W5OIl3uEk4IvQzFjBcL0NULtaTFQuzFGIh
	nfrLHU6VMZ3if8j8TSSCHk5m1xPyMmP0s5ShLpzRMP950jADNUJa
X-Gm-Gg: ASbGnctdS2xm/H8l5br2Gr2+q9AhHsI5BdCFH6BKgGJz0tj+EFj7kCvzEHuTU08mSzp
	Tc3fg/Iaq3XMDGr4S/O+JKewYCT87yGY/c0kHJ6+KrgeBkkOU4qYlOoFYWBs3W8AUtTcu+ptEn+
	tCDeWK+q8VwHls85dHh3hKaH0KVW226RqYh1hLhgXf8eiFudWRmvI+e7q5Gs8IJ6tacaIp4hoyI
	6FJwPecfJmEhYFonr+PcLmGzw1jfEY8H5UybucG4o1pebIPljRM9AeOJJBaniVw0eS9Hn9JZsUK
	Al5CchSb5PI5IcHLiP7gzQWs41c/jn8f8/xBUUQHQxlKIEUYh1TGVQ==
X-Google-Smtp-Source: AGHT+IFTnTM5WxBFhzMnREMYCdwCs+MgHzP/5L30V5OEOL1URJA+Hq2T7QAqMoH69V8CmzgH0KoTMA==
X-Received: by 2002:a17:90b:3a4e:b0:301:1d9f:4ba2 with SMTP id 98e67ed59e1d1-3087bbbd12cmr14056217a91.28.1745202117018;
        Sun, 20 Apr 2025 19:21:57 -0700 (PDT)
Received: from localhost.localdomain ([116.106.98.75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087dee33b7sm5341946a91.8.2025.04.20.19.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 19:21:56 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: christophe.jaillet@wanadoo.fr
Cc: pavel@kernel.org,
	lee@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] leds: add TI/National Semiconductor LP5812 LED Driver
Date: Mon, 21 Apr 2025 09:21:29 +0700
Message-Id: <20250421022129.3384-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <688b74ce-3650-418f-82bd-63a5cee080d1@wanadoo.fr>
References: <688b74ce-3650-418f-82bd-63a5cee080d1@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 20 Apr 2025, Christophe JAILLET wrote:

> Le 19/04/2025 à 20:43, Nam Tran a écrit :
> > The LP5812 is a 4×3 matrix RGB LED driver
> > with an autonomous animation engine
> > and time-cross-multiplexing (TCM) support for up to 12 LEDs.
> > Each LED can be configured through the related registers
> > to realize vivid and fancy lighting effects.
> 
> ...
> 
> > +static int lp5812_init_dev_config(struct lp5812_chip *chip,
> > +		const char *drive_mode, int rm_led_sysfs);
> > +
> > +static struct drive_mode_led_map chip_leds_map[] = {
> 
> I think this could be const.

I’ll update chip_leds_map to be const.

> > +static int lp5812_get_phase_align(struct lp5812_chip *chip, int led_number,
> > +		int *phase_align_val)
> > +{
> > +	int ret;
> > +	int bit_pos;
> > +	u16 reg;
> > +	u8 reg_val;
> > +
> > +	reg = DEV_CONFIG7 + (led_number / 4);
> > +	bit_pos = (led_number % 4) * 2;
> > +
> > +	ret = lp5812_read(chip, reg, &reg_val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*phase_align_val = (reg_val >> bit_pos) & 0x03;
> > +
> > +	return ret;
> > +}
> > +
> > +static int lp5812_get_led_mode(struct lp5812_chip *chip,
> > +		int led_number, enum control_mode *mode)
> > +{
> > +	int ret = 0;
> 
> In several function, sometimes ret is initialized, sometimes it is not.
> See lp5812_get_led_mode() and lp5812_get_phase_align() just above.

Agreed, I’ll go through and update these functions to follow a consistent pattern.

> > +static void set_mix_sel_led(struct lp5812_chip *chip, int mix_sel_led)
> > +{
> 
> Maybe init the 4 values at 0 first, then set to 1 only what is needed 
> below? This would save a few lines of code.
> 
> > +	if (mix_sel_led == 0) {
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 1;
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 0;
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 0;
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 0;
> > +	}
> > +	if (mix_sel_led == 1) {
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 0;
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 1;
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 0;
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 0;
> > +	}
> > +	if (mix_sel_led == 2) {
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 0;
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 0;
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 1;
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 0;
> > +	}
> > +	if (mix_sel_led == 3) {
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 0;
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 0;
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 0;
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 1;
> > +	}
> > +}

Yep, that’s a cleaner approach. I’ll update it accordingly.

> > +static ssize_t dev_config_show(struct device *dev,
> > +		struct device_attribute *attr,
> > +		char *buf)
> > +{
> 
> The whole function could be simplified with sysfs_emit_at().
> This avoids temp buffer, malloc/free and some copies.
> 
> See led_auto_animation_show() below.
> 
> > +	int i;
> > +	int num_drive_mode;
> > +	char *mode_info;
> > +	char *total_str;
> > +	size_t total_length;
> > +	char *const_str = "\nPlease select below valid drive mode:\n";
> > +	char *const_ex_str = "For Ex: echo tcmscan:1:0 > dev_config\n";
> > +	int ret = 0;
> > +	struct lp5812_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
> > +
> > +	/* get drive mode and scan order */
> > +	mutex_lock(&chip->lock);
> > +	ret = lp5812_get_drive_mode_scan_order(chip);
> > +	mutex_unlock(&chip->lock);
> > +	if (ret)
> > +		return -EIO;
> > +
> > +	mode_info = parse_dev_config_info(chip);
> > +	if (!mode_info)
> > +		return -ENOMEM;
> > +
> > +	num_drive_mode = ARRAY_SIZE(chip_leds_map);
> > +	total_length = strlen(mode_info) + strlen(const_str) +
> > +			strlen(const_ex_str) + 1;
> > +	for (i = 0; i < num_drive_mode; ++i) {
> > +		total_length += strlen(chip_leds_map[i].drive_mode) +
> > +					strlen("\n");
> > +	}
> > +
> > +	total_str = kmalloc(total_length, GFP_KERNEL);
> > +	if (!total_str)
> > +		return -ENOMEM;
> > +
> > +	sprintf(total_str, "%s%s%s", mode_info, const_str, const_ex_str);
> > +	for (i = 0; i < num_drive_mode; ++i) {
> > +		strcat(total_str, chip_leds_map[i].drive_mode);
> > +		strcat(total_str, "\n");
> > +	}
> > +
> > +	ret = sysfs_emit(buf, "%s", total_str);
> > +	kfree(mode_info);
> > +	kfree(total_str);
> > +
> > +	return ret;
> > +}

...

> In order to have it more readable (IMHO), use less buffers, make less 
> copies, reduce code duplication and reduce the locking section, maybe 
> something like (un-tested):
> 
> static ssize_t led_auto_animation_show(struct kobject *kobj,
> 		struct kobj_attribute *attr, char *buf)
> {
> 	int aeu_selection, playback_time, start_pause, stop_pause;
> 	struct lp5812_led *led = to_lp5812_led(kobj);
> 	struct lp5812_chip *chip = led->priv;
> 	int pos = 0;
> 	int ret;
> 
> 	mutex_lock(&chip->lock);
> 	ret = led_get_autonomous_animation_config(led);
> 	if (ret) {
> 		ret = -EIO;
> 		goto out;
> 	}
> 
> 	/* parse config and feedback to userspace */
> 	aeu_selection = led->led_playback.s_led_playback.aeu_selection;
> 	playback_time = led->led_playback.s_led_playback.led_playback_time;
> 	start_pause = led->start_stop_pause_time.s_time.second;
> 	stop_pause = led->start_stop_pause_time.s_time.first;
> 
> 	mutex_unlock(&chip->lock);
> 
> 	pos += sysfs_emit_at(buf, pos, "AEU Select: ");
> 	if (aeu_selection == ONLY_AEU1)
> 		pos += sysfs_emit_at(buf, pos, "Only use AEU1");
> 	else if (aeu_selection == AEU1_AEU2)
> 		pos += sysfs_emit_at(buf, pos, "Use AEU1 and AEU2");
> 	else
> 		pos += sysfs_emit_at(buf, pos, "Use AEU1, AEU2 and AEU3");
> 
> 	pos += sysfs_emit_at(buf, pos, "; Start pause time: %s",
> 			     time_name_array[start_pause]);
> 	pos += sysfs_emit_at(buf, pos, "; Start pause time: %s",
> 			     time_name_array[start_pause]);
> 	pos += sysfs_emit_at(buf, pos, "; LED Playback time: %s",
> 			     led_playback_time_arr[playback_time]);
> 
> 	pos += sysfs_emit_at(buf, pos, "\n");
> 	pos += sysfs_emit_at(buf, pos, "Command usage: echo (aeu number):(start 
> pause time):(stop pause time):(playback time) > autonomous_animation\n");
> 
> 	return pos;
> 
> out:
> 	mutex_unlock(&chip->lock);
> 	return ret;
> }

Great point! I'll refactor these functions as suggested.

> > +static ssize_t aeu_playback_time_show(struct kobject *kobj,
> > +		struct kobj_attribute *attr, char *buf)
> > +{
> > +	int ret = 0;
> > +	u8 val = 0;
> > +	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
> > +	struct lp5812_chip *chip = aeu->led->priv;
> > +
> > +	mutex_lock(&chip->lock);
> > +	ret = led_aeu_playback_time_get_val(aeu, &val);
> 
> Maybe unlock here, to simplify code and be consistent with some other 
> functions above? (led_pwm_dimming_scale_show(), ...)
> 
> Several other show/store function could be slightly simplified the same way.
> 
> > +	if (ret != 0) {
> > +		mutex_unlock(&chip->lock);
> > +		return -EIO;
> > +	}
> > +	mutex_unlock(&chip->lock);
> > +
> > +	return sysfs_emit(buf, "%d\n", val);
> > +}

Agreed, I’ll unlock earlier to simplify the code and maintain consistency with other functions.

> > +struct lp5812_led {
> > +	struct kobject                        kobj;
> > +	struct lp5812_chip                    *priv;
> > +	struct attribute_group                attr_group;
> > +	int                                   enable;
> > +	enum control_mode                     mode;
> > +	enum dimming_type                     dimming_type;
> > +	u8                                    lod_lsd;
> > +	u8                                    auto_pwm;
> > +	u8                                    aep_status;
> > +	u16                                   anim_base_addr;
> > +	int                                   led_number; /* start from 0 */
> > +	int                                   is_sysfs_created;
> > +	const char                            *led_name;
> > +
> > +	union led_playback                    led_playback;
> > +	union time                            start_stop_pause_time;
> > +
> > +	int                                   total_aeu;
> 
> What is the need to keeping it here?
> It is set to MAX_AEU. Why not just use it directly?
> 
> If needed for future use, maybe, 'aeu' below should be a flex array?
> 
> > +	struct anim_engine_unit               aeu[MAX_AEU];
> > +};
> > +
> > +struct lp5812_chip {
> > +	struct i2c_client                     *i2c_cl;
> > +	struct mutex                          lock; /* Protects access to device registers */
> > +	struct device                         *dev;
> > +	struct attribute_group                attr_group;
> > +	const struct lp5812_specific_regs     *regs;
> > +	const struct drive_mode_led_map       *chip_leds_map;
> > +	enum device_command                   command;
> > +	int                                   total_leds;
> 
> What is the need to keeping it here?
> It is set to MAX_LEDS. Why not just use it directly?
> 
> If needed for future use, maybe, 'leds' below should be a flex array?

You're right — since total_aeu and total_leds are always set to MAX_AEU and MAX_LEDS, respectively,
there's no need to store them separately. I'll remove those fields and use the constants directly.

We'll keep the static arrays as-is, given the fixed hardware limits.

Thanks for the helpful comments!

Best regards,
Nam Tran

