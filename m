Return-Path: <linux-leds+bounces-2413-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A1094A1ED
	for <lists+linux-leds@lfdr.de>; Wed,  7 Aug 2024 09:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21FB81C22345
	for <lists+linux-leds@lfdr.de>; Wed,  7 Aug 2024 07:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43741C57AC;
	Wed,  7 Aug 2024 07:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="uLqmODtD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9010D22EE5;
	Wed,  7 Aug 2024 07:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723016620; cv=none; b=pA0+mOgV1sqzPpZ8KcRASO9iLTPeyYfCG/PB39NE+YK2W+kCp24KNF11TK5E7E65M1oVVbQBoYQ6UdO0HK4BNT5GS+bynsgj6w5h3MNJzBn4iQeMxZHK61UZ+uSbkInNAH8TE5HssvrIqJ40Bd73WMp+JvWH38Ia01Vw08Ruj7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723016620; c=relaxed/simple;
	bh=C473E+7IZ1gSOyp3PAeQS+FofLKrvJuakaB3oCdMbEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyjOaMd0AHhVfPfgoH3g3yTgcWFsermOEvU+GhPNHoOnHskXDJJw6mfzVV3oFpzEXZDHmID9zOdoJ2iVex68/FQYzjLJF3cJdMih5xB+V3eFtnEjlphlQqmYFkB5RInR8SMjNcpqkFcA7URS/CyNWoNrKe/ZI/H5VjHM3QzkR1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=uLqmODtD; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bbJFs9v6zxIArbbJFsXyN1; Wed, 07 Aug 2024 09:42:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1723016539;
	bh=063alyCWuXCYe4xcQbRpJjXEItRwdvW6xyXqbzbbO9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=uLqmODtD/aSM1EJVZ0FQjceh9p3RQSAb8LqWROe7YjbxEqxNFSMV9/t6r9iy91FmV
	 jfd8MSNCUKMojd+AOXXYWvOuxohCvsoIdQwaAVq78ve53dxyDW1c3krT0ehv+ofYtu
	 Li03Lv83XmckFjgdTQwHIEzDs7RVP6XCLKjnB5pH6ttXsH1pQlZ/LL927STyl7AZ0l
	 aK+0/w5BJoqxzoPGB+RifAvUXqfEu8I2bwflZjJh0UvF1ri/L6Vjyn5AGDbR+ewyRY
	 MUpc6ZAUrZW7qXnvx0I3xxzZvKOU/8AkS7x8kPPwWiHSIWk9DRsGEVOlZYbW5DwaHP
	 XZXLnWosRiDjQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 07 Aug 2024 09:42:19 +0200
X-ME-IP: 90.11.132.44
Message-ID: <08eb6104-1af2-4e9a-b303-ffb9b21ef9db@wanadoo.fr>
Date: Wed, 7 Aug 2024 09:42:11 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/1] platform/x86: Add wmi driver for Casper Excalibur
 laptops
To: =?UTF-8?Q?Mustafa_Ek=C5=9Fi?= <mustafa.eskieksi@gmail.com>,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
 pavel@ucw.cz, lee@kernel.org, linux-leds@vger.kernel.org,
 rishitbansal0@gmail.com, bahaku@elrant.team,
 carlosmiguelferreira.2003@gmail.com, alviro.iskandar@gnuweeb.org,
 ammarfaizi2@gnuweeb.org, bedirhan_kurt22@erdogan.edu.tr
References: <20240806205001.191551-1-mustafa.eskieksi@gmail.com>
 <20240806205001.191551-2-mustafa.eskieksi@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240806205001.191551-2-mustafa.eskieksi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 06/08/2024 à 22:50, Mustafa Ekşi a écrit :
> This wmi driver supports changing Casper Excalibur laptops' keyboard
> backlight brightness and color, reading fan speeds and changing power
> profiles. Multicolor led device is used for backlight, platform_profile
> for power management and hwmon for fan speeds. It supports both old (10th
> gen or older) and new (11th gen or newer) laptops. It uses x86_match_cpu
> to check if the laptop is old or new.
> 
> Signed-off-by: Mustafa Ekşi <mustafa.eskieksi@gmail.com>
> ---

Hi,

a few nitpicks below, should there be a v8.


> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index e1b14294706..639509f9afa 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
>   obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
>   obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
>   obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
> +obj-$(CONFIG_CASPER_WMI)		+= casper-wmi.o

Maybe, this could be alphabetically sorted?

>   
>   # Acer
>   obj-$(CONFIG_ACERHDF)		+= acerhdf.o

...

> +static int casper_platform_profile_register(struct casper_drv *drv)
> +{
> +	int ret = 0;

Nitpick: No need to init.

> +
> +	drv->handler.profile_get = casper_platform_profile_get;
> +	drv->handler.profile_set = casper_platform_profile_set;
> +
> +	set_bit(PLATFORM_PROFILE_LOW_POWER, drv->handler.choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED, drv->handler.choices);
> +	if (!drv->quirk_applied->new_power_scheme)
> +		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> +			drv->handler.choices);
> +	set_bit(PLATFORM_PROFILE_PERFORMANCE, drv->handler.choices);
> +
> +	ret = platform_profile_register(&drv->handler);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(&drv->wdev->dev, casper_pp_remove,
> +				       NULL);
> +	if (ret)
> +		platform_profile_remove();
> +
> +	return ret;
> +}
> +
> +static int casper_multicolor_register(struct casper_drv *drv)
> +{
> +	int ret = 0;

Nitpick: No need to init.

> +
> +	drv->leds = devm_kcalloc(&drv->wdev->dev,
> +		CASPER_LED_COUNT, sizeof(*drv->leds), GFP_KERNEL);
> +	if (!drv->leds)
> +		return -ENOMEM;
> +
> +	for (size_t i = 0; i < CASPER_LED_COUNT; i++) {
> +		for (size_t j = 0; j < 3; j++) {
> +			drv->leds[i].subleds[j] = (struct mc_subled) {
> +				.color_index = LED_COLOR_ID_RED + j,
> +				.brightness = 255,
> +				.intensity = 255
> +			};
> +		}
> +		drv->leds[i].mc_led = (struct led_classdev_mc){
> +			.led_cdev = {
> +				.name = zone_names[i],
> +				.brightness = 0,
> +				.max_brightness = 2,
> +				.brightness_set = &set_casper_brightness,
> +				.brightness_get = &get_casper_brightness,
> +				.color = LED_COLOR_ID_MULTI,
> +			},
> +			.num_colors = 3,
> +			.subled_info = drv->leds[i].subleds
> +		};
> +
> +		ret = devm_led_classdev_multicolor_register(&drv->wdev->dev,
> +							&drv->leds[i].mc_led);
> +		if (ret)
> +			return -ENODEV;
> +	}
> +
> +	// Setting leds to the default color
> +	ret = casper_set(drv, CASPER_SET_LED, CASPER_ALL_KEYBOARD_LEDS,
> +			 CASPER_DEFAULT_COLOR);
> +	if (ret)
> +		return ret;
> +
> +	ret = casper_set(drv, CASPER_SET_LED, CASPER_CORNER_LEDS,
> +			 CASPER_DEFAULT_COLOR);
> +	return ret;
> +}
> +
> +static int casper_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct casper_quirk_entry *pp_quirk;
> +	const struct dmi_system_id *dmi_id;
> +	const struct x86_cpu_id *gen_id;
> +	struct device *hwmon_dev;
> +	struct casper_drv *drv;
> +	int ret;
> +
> +	drv = devm_kzalloc(&wdev->dev, sizeof(*drv), GFP_KERNEL);
> +	if (!drv)
> +		return -ENOMEM;
> +
> +	drv->wdev = wdev;
> +	dev_set_drvdata(&wdev->dev, drv);
> +
> +	gen_id = x86_match_cpu(casper_gen);
> +	if (!gen_id)
> +		return -ENODEV;
> +
> +	drv->quirk_applied = (struct casper_quirk_entry *)gen_id->driver_data;
> +
> +	dmi_id = dmi_first_match(casper_quirks);
> +	if (!dmi_id)
> +		return -ENODEV;
> +
> +	pp_quirk = (struct casper_quirk_entry *)dmi_id->driver_data;
> +	drv->quirk_applied->no_power_profiles = pp_quirk->no_power_profiles;
> +
> +	mutex_init(&drv->mutex);

No need to call mutex_init() if devm_mutex_init() is used as well.

> +	ret = devm_mutex_init(&wdev->dev, &drv->mutex);
> +	if (ret)
> +		return ret;
> +
> +	ret = casper_multicolor_register(drv);
> +	if (ret)
> +		return ret;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&wdev->dev,
> +						"casper_wmi", wdev,
> +						&casper_wmi_hwmon_chip_info,
> +						NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	if (!drv->quirk_applied->no_power_profiles) {
> +		ret = casper_platform_profile_register(drv);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

...

CJ


