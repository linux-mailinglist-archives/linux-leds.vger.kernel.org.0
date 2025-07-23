Return-Path: <linux-leds+bounces-5115-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76570B0F714
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jul 2025 17:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 795543AE204
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jul 2025 15:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A90C1E8324;
	Wed, 23 Jul 2025 15:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9RfqqZR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D20D19CC29;
	Wed, 23 Jul 2025 15:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753284751; cv=none; b=QeIfplHTWjrJFDHCCZcLYAbLmO3bPd9eswhKCHWUwwjJ9zdzV+FgFtPMUkV8odEibG2CmgGbhJgVcMHSu4ohnJ4TMYKE+B0YbjMN4MwiienCuz6fQnCYOX7+jnaDoK/nk03mtkjr/bJcvPJvLZ4G2h43f5/KAmtkJxCVeMb9xok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753284751; c=relaxed/simple;
	bh=HkcngKq7JR/WRYu7csRYIy3MdLYjoZUIv+jpqjw+ctU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BHZtveXXOiJhX94vYGskrkN7vt10LfWDcUCTBy7/ij+Ps8Xaf76utrZHz+Evp5k9HngJtPgg5LBeKBZfh/cfzuzQpxwhxDFcKIc+MiqA8XOfEqxuj/4kQTWHp/Ol/7sRcIgn9oigBhsAloggW2t6ru1gcjUObrR++J5ZLZqHRSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9RfqqZR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234b9dfb842so58908695ad.1;
        Wed, 23 Jul 2025 08:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753284749; x=1753889549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAUZEw7Zyr/dH2MhdiUynRcdRRRh3d/M1xLFRoTpl7c=;
        b=a9RfqqZRF1sptucDzj4hVEV8gKBLGJZqtpl6T7/bq2Mm9Dg2jkKv9xYiXAuOivTag7
         i0UIa2jW5OA7Z+lfbOFC2byM4b/bq3S/Yt3Zc6h5PvVD2f2WcWIiTIwe9iGcKk0oLVJs
         07XMvMP2CnNDiGW04LbKQRMjyRNEP+Ebo4xuQmmvjrcvJcLR0dk+JQou38KnNqMdN874
         7fvctf0RdiDPpXCcgGXiKmnYjvUqhGizF4PIGOAz0G7femsfzEfmCRuFIdZ0hsmd1i4L
         vyJJGDFWAHQs9vXMqgyet9Boq1koqmrLgYc04KjM9FkbRzZw8NQ04WPvBtDsYOI7FV6j
         xTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753284749; x=1753889549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAUZEw7Zyr/dH2MhdiUynRcdRRRh3d/M1xLFRoTpl7c=;
        b=f7+A9lT2U9ouZcq/9VTVI8baU0U9zwEiD/lAnw0h5KfMaVPdZCoPFDcWdDPpeSg+GX
         qzsQgqOBtE9rGV+BdvrjvCbzez44GY1s1bfCyl50vdrVHufFYC5QK//6vAeSbzgYXtsN
         u9Z8fEnxuGoITKDZIBwcyOdFPmd9sRPf2MW9MwTXGYfHDoDux6u3zU0W+FetltkP4zs9
         gM3FvQnuaDdp++zJVmQcIcSe7G8seKcZVbtOw9R8+oUZCYUOAfFyMkbLGkJ5PPnY54ov
         8NOqlL/V8J6r6USMj9JIg5V6QzDmGXznaoKvkVvqH7PHXSgOtxsMaTisZiAIvkVzrhtZ
         /5jg==
X-Forwarded-Encrypted: i=1; AJvYcCUmrknXAqpAKpDW4BCZU58XhEM6uYiacsIT8aEnOTKMVMm+gISxJifO0Q3YENmcgzE95jTLsi5f6GfoFMeb@vger.kernel.org, AJvYcCVbOScDzV5BmbJzKrIuOzkEhogqFotyf5oQbxkJDwywCQ+7TkBPI2/wfXF24VS6ClMaJZKhzB6cNMb8@vger.kernel.org, AJvYcCWLvFk5kE2b9Viwjpu5BhmaZ+8PeCvjGBWeAPOg5eKr1foH6uPU/4fY+cQRnmHepbb5ChfXunTOGUBIVA==@vger.kernel.org, AJvYcCXs5GY62DJGMLvITqU3SSau6PhmxYp6swZ2BBrR/u2P+D4Kgi1NDlsBmLCZuY5jJ0I7dJlsRhMRXTnQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3ORb+9K8FxNEnYDJhiKrcIXnQbN3QNLdKApB2tKG5ykJyk7tY
	7oxuBrOiDhFJbcTaXpcbu+4lNPQnWRo2O8T9L+1ie70EXBmTwBGds5TjJfXfdw==
X-Gm-Gg: ASbGnctsJHPwBLT3MND++kewqaotE2ClnAESHRUPbW4O+tPNtYArD2MfxSvObI28RSg
	xCTYFsWDP5QlS5q5eF4k7FtPXBhgv0j+V6gaj16LY7TJIIA4NHGKfOV9i9EuR4JS9lCGcKVManN
	6XWjtohIOB+fC/6mPJ7b+tSstGN6mRrxtFA9zipObtMeOKIv94z5UEbO8ymlB1B06wZSw8g6cSz
	yxqxub0HkuNeBQ2zb4XP4zImrjwTri6ZpJFogEXU/rixTZaP5ZBrSfWGZGAwLYpDVuSTQNmiKhn
	l2xUIlPrwi108DYh7DOFPSp1RUuIB80n60fkiMkDGnsXSXGdp0f0b35cYpunpLTmVBQ0xtlGXcS
	yl5V6OSuT8/ECoSBfSueSQyc6oyW4R/aO+JZcZaCwVYTs
X-Google-Smtp-Source: AGHT+IHzrpP4vCfo3NRU61rWRBd8ZxUejRAEZpPjSFan9to0J9MpkOLFyF9oSRFuO4QjpYtIahwrQg==
X-Received: by 2002:a17:903:2444:b0:23f:8d6a:8e45 with SMTP id d9443c01a7336-23f98140a01mr53243475ad.4.1753284748542;
        Wed, 23 Jul 2025 08:32:28 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.118.149.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3fcbsm99273685ad.48.2025.07.23.08.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 08:32:28 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org,
	krzk+dt@kernel.org
Cc: pavel@kernel.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v11 2/4] leds: add basic support for TI/National Semiconductor LP5812 LED Driver
Date: Wed, 23 Jul 2025 22:32:21 +0700
Message-Id: <20250723153221.96289-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <0c7e171d-056d-4c00-a30b-0fd39e25bf4c@kernel.org>
References: <0c7e171d-056d-4c00-a30b-0fd39e25bf4c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Jul 2025, Krzysztof Kozlowski wrote:

> On 14/07/2025 19:23, Nam Tran wrote:
> >> +static int lp5812_parse_led(struct device_node *np,
> > +			    struct lp5812_led_config *cfg,
> > +			    int led_index)
> > +{
> > +	int num_colors = 0, ret;
> > +
> > +	of_property_read_string(np, "label", &cfg[led_index].name);
> > +
> > +	ret = of_property_read_u32(np, "reg", &cfg[led_index].chan_nr);
> 
> You mix code for probe with code for regular operation. This is not
> expected and confusing. All functions related to probe must be before
> the probe function is defined.

I will restructured the code to move all probe-related helpers above the
lp5812_probe() function.

> > +
> > +static struct lp5812_led *lp5812_dev_to_led(struct device *dev)
> > +{
> > +	struct led_classdev *cdev = dev_get_drvdata(dev);
> > +	const char *name = dev->platform_data;
> > +
> > +	if (strcmp(name, LP5812_SC_LED) == 0)
> > +		return container_of(cdev, struct lp5812_led, cdev);
> > +
> > +	return container_of((struct led_classdev_mc *)cdev, struct lp5812_led, mc_cdev);
> 
> 
> No, just pass correct pointer to platform data, no need with strcmp and
> then different container of...

I will remove the string-based `platform_data` handling and now store a direct
pointer to `struct lp5812_led` in `dev->platform_data`.
This allows simplifying `lp5812_dev_to_led()` without the need for `strcmp()`
or multiple `container_of()` usages.

> > +static int lp5812_init_led(struct lp5812_led *led, struct lp5812_chip *chip, int chan)
> > +{
> > +	struct device *dev = &chip->client->dev;
> > +	struct mc_subled *mc_led_info;
> > +	struct led_classdev *led_cdev;
> > +	int i, ret = 0;
> > +
> > +	if (chip->led_config[chan].name) {
> > +		led->cdev.name = chip->led_config[chan].name;
> > +	} else {
> > +		led->cdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s:channel%d",
> > +						chip->label ? : chip->client->name, chan);
> > +		if (!led->cdev.name)
> > +			return -ENOMEM;
> > +	}
> > +
> > +	if (!chip->led_config[chan].is_sc_led) {
> > +		mc_led_info = devm_kcalloc(dev,
> > +					   chip->led_config[chan].num_colors,
> > +					   sizeof(*mc_led_info), GFP_KERNEL);
> > +		if (!mc_led_info)
> > +			return -ENOMEM;
> > +
> > +		led_cdev = &led->mc_cdev.led_cdev;
> > +		led_cdev->name = led->cdev.name;
> > +		led_cdev->brightness_set_blocking = lp5812_set_mc_brightness;
> > +		led->mc_cdev.num_colors = chip->led_config[chan].num_colors;
> > +		for (i = 0; i < led->mc_cdev.num_colors; i++) {
> > +			mc_led_info[i].color_index =
> > +				chip->led_config[chan].color_id[i];
> > +			mc_led_info[i].channel =
> > +					chip->led_config[chan].led_id[i];
> > +		}
> > +
> > +		led->mc_cdev.subled_info = mc_led_info;
> > +	} else {
> > +		led->cdev.brightness_set_blocking = lp5812_set_brightness;
> > +	}
> > +
> > +	led->cdev.groups = lp5812_led_groups;
> > +	led->chan_nr = chan;
> > +
> > +	if (chip->led_config[chan].is_sc_led) {
> > +		ret = devm_led_classdev_register(dev, &led->cdev);
> > +		if (ret == 0) {
> > +			led->cdev.dev->platform_data = devm_kstrdup(dev, LP5812_SC_LED, GFP_KERNEL);
> > +			if (!led->cdev.dev->platform_data)
> > +				return -ENOMEM;
> > +		}
> > +	} else {
> > +		ret = devm_led_classdev_multicolor_register(dev, &led->mc_cdev);
> > +		if (ret == 0) {
> > +			led->mc_cdev.led_cdev.dev->platform_data =
> > +				devm_kstrdup(dev, LP5812_MC_LED, GFP_KERNEL);
> > +			if (!led->mc_cdev.led_cdev.dev->platform_data)
> > +				return -ENOMEM;
> > +
> > +			ret = sysfs_create_groups(&led->mc_cdev.led_cdev.dev->kobj,
> > +						  lp5812_led_groups);
> > +			if (ret)
> > +				dev_err(dev, "sysfs_create_groups failed\n");
> > +		}
> > +	}
> > +
> > +	if (ret) {
> > +		dev_err(dev, "led register err: %d\n", ret);
> 
> Why are you printing same error multiple times?

I will remove the redundant error message at the end of `lp5812_init_led()`
to avoid double-printing.
Now only the specific failure points log detailed errors.

> > +static int lp5812_probe(struct i2c_client *client)
> > +{
> > +	struct lp5812_chip *chip;
> > +	const struct i2c_device_id *id = i2c_client_get_device_id(client);
> > +	struct device_node *np = dev_of_node(&client->dev);
> > +	struct lp5812_led *led;
> > +	int ret;
> > +
> > +	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> > +	if (!chip)
> > +		return -ENOMEM;
> > +
> > +	chip->cfg = i2c_get_match_data(client);
> > +
> > +	if (np) {
> > +		ret = lp5812_of_populate_pdata(&client->dev, np, chip);
> > +		if (ret)
> > +			goto err_init;
> > +	} else {
> > +		return dev_err_probe(&client->dev, -EINVAL, "No platform data\n");
> 
> This is confusing syntax. Expected is:
> if (!missing something)
> 	return -EINVAL

I will update it.

> The other problem is that you claim this can match and bind without OF,
> but here you say it is a requirement. So either this code is wrong or
> your I2C ID table should be removed.

I will update the probe logic for clarity and removed the i2c_device_id table
and .id_table field.

> > +	led = devm_kcalloc(&client->dev, chip->num_channels, sizeof(*led), GFP_KERNEL);
> > +	if (!led)
> > +		return -ENOMEM;
> > +
> > +	chip->client = client;
> > +
> > +	mutex_init(&chip->lock);
> > +
> > +	i2c_set_clientdata(client, led);
> > +
> > +	ret = lp5812_init_device(chip);
> > +	if (ret)
> > +		goto err_init;
> > +
> > +	dev_info(&client->dev, "%s Programmable led chip found\n", id->name);
> 
> Drop. You have only one device type (look at your binding), so you
> cannot "find" devices.

I will drop it.

> > +static void lp5812_remove(struct i2c_client *client)
> > +{
> > +	struct lp5812_led *led = i2c_get_clientdata(client);
> > +
> > +	lp5812_unregister_sysfs(led, led->chip);
> > +	lp5812_deinit_device(led->chip);
> > +
> > +	dev_info(&client->dev, "Removed driver\n");
> 
> No, drop, useless.

I will remove it.

Thank you for your thorough review and helpful suggestions.

Best regards,
Nam Tran

