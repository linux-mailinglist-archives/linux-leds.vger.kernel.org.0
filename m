Return-Path: <linux-leds+bounces-5141-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 069D5B12D27
	for <lists+linux-leds@lfdr.de>; Sun, 27 Jul 2025 01:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A0467A27D5
	for <lists+linux-leds@lfdr.de>; Sat, 26 Jul 2025 23:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4C7230BCC;
	Sat, 26 Jul 2025 23:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ABXLpmMm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5D4157493;
	Sat, 26 Jul 2025 23:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753574357; cv=none; b=khBk1HXyKnVtj5Yhi26UKtAn0ztrnrBIuoMfV8YFe6AWCUmRAPH6Tw50qbPEych9bx1O6975A5grTgLzAP39Ma/9vzxXkp1fq/vRoXfHdxOWcuiXmcJhPJqSod1nDPfb9pJFPJPsgI9gMJVMeVVPxcOrAZHMaHTr4FgIsqPBF+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753574357; c=relaxed/simple;
	bh=4y/9ozgEa3vSBMySss7FQqmMUasRvEv12Ly0KW39cIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kooz+irvqeD/RZfTOKi4jLVQLsbntPhm7EaDKuFda+A8Atid5wlUha+jf8dsOWcnqVIBa3aWjxxaCGi1XZdKTYbp+JPE2KDP2nLUoV14YSyh2+YViJSsx0PFdUiSeFBKeZ8EdhjYYSspwdxdoqa8kpVvjjoesnwRc7bcMIObUEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ABXLpmMm; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1753574343; x=1754179143; i=w_armin@gmx.de;
	bh=3adfUmGJAQTDsg8dc9ZFK5gg80YQKxwU2G23G6030r4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ABXLpmMmIYsZq7GPeNAJvSo3TC0naKaxqpwqVA0ZrQWcJLR3jMTb50xFWEwyoowp
	 2hRQHSB0Ncg7UVG5om7xeK3AglVYWZviSOLsPPIAkV05cTj1kzwDrpEMMkJ0DWUsy
	 +4qRurbs+hV2KTSjy7X6YrbFY1rLENgrPmzvOdj32zfEzQFRIYjWHUqjwFP5AxPOv
	 AsVIZwuxs+iMe76NLjd00Rsbj91S+7SinhjhDPA74CXHX8zilM2/b6dSYuzrqghSG
	 kLWbzYDPXRVw6q3PsyL/KhQpsxe6c26U3C9QUswkE2nnRMSYeO9R9MsepW0Mgow75
	 yuhqwxVJMYEVUiL/rg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1ps8-1ui0eV02jQ-005zCg; Sun, 27
 Jul 2025 01:59:03 +0200
Message-ID: <eac46383-c54c-419e-b63e-c2fd003f2b6c@gmx.de>
Date: Sun, 27 Jul 2025 01:58:59 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] platform/x86: (ayn-ec) Add RGB Interface
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 David Box <david.e.box@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 Lee Jones <lee@kernel.org>, pavel@kernel.org, linux-leds@vger.kernel.org
References: <20250726204041.516440-1-derekjohn.clark@gmail.com>
 <20250726204041.516440-4-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250726204041.516440-4-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mUU4qwtZ46dBJwKkU34I7QItx1iiS8jag0jb0eoEMLct4PtaLJN
 4QpbdtwJ5CeZrC94DjPFZZX9LXuu81SIsh24DWK62Iar5jhIrl/yDNbsj+QB0aMA0l9jlc6
 o729zik57HsMMtqfZaTsnyKmdc54o8EkMSkS3rG3yaum37poBFN9prp18viI4V2hbO4e/pf
 IexYvv12OY5TbmEExivCw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dw/Rf/keMT4=;b9CXhyejac/faLZU0jeLlYoScp3
 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
 hCe7XvLKwQR7lZ9ubxYAryk=

Am 26.07.25 um 22:40 schrieb Derek J. Clark:

> Adds an EC controlled LED Multicolor Class Device for controlling the
> RGB rings around the joysticks.
>
> The EC provides a single register for each of the colors red, green, and
> blue, as well as a mode switching register. The EC accepts values
> [0-255] for all colors. There are two available effects: breathe, which =
is
> the default when the device is started, and monocolor. When resuming fro=
m
> sleep the user selected effect will be overwritten by the EC, so the
> driver retains the last setting and resets on resume. When setting a
> color, each color register is set before a final "write" code is sent to
> the device. The EC may briefly reflect the "write" code when writing, bu=
t
> quickly changes to the "monocolor" value once complete. The driver
> interprets both of these values as "monocolor" in _show to simplify the
> sysfs exposed to the user.
>
> Two custom attributes are added to the standard LED parent device:
> effect, a RW file descriptor used to set the effect, and effect_index,
> which enumerates the available valid options.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>   drivers/platform/x86/Kconfig  |   3 +
>   drivers/platform/x86/ayn-ec.c | 285 ++++++++++++++++++++++++++++++++++
>   2 files changed, 288 insertions(+)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 4819bfcffb6b..85dfb88cca6f 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -308,6 +308,9 @@ config AYN_EC
>   	tristate "AYN x86 devices EC platform control"
>   	depends on ACPI
>   	depends on HWMON
> +	depends on NEW_LEDS
> +	select LEDS_CLASS
> +	select LEDS_CLASS_MULTICOLOR
>   	help
>   	  This is a driver for AYN and Tectoy x86 handheld devices. It provid=
es
>   	  temperature monitoring, manual fan speed control, fan curve control=
,
> diff --git a/drivers/platform/x86/ayn-ec.c b/drivers/platform/x86/ayn-ec=
.c
> index 466cc33adcb0..25f748d7db18 100644
> --- a/drivers/platform/x86/ayn-ec.c
> +++ b/drivers/platform/x86/ayn-ec.c
> @@ -28,6 +28,8 @@
>   #include <linux/hwmon.h>
>   #include <linux/init.h>
>   #include <linux/kernel.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/leds.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/sysfs.h>
> @@ -68,6 +70,16 @@
>   #define AYN_SENSOR_PROC_TEMP_REG	0x09 /* CPU Core */
>   #define AYN_SENSOR_VCORE_TEMP_REG	0x08 /* vCore */
>  =20
> +/* EC Controlled RGB registers */
> +#define AYN_LED_MC_RED_REG	0xB0 /* Range 0x00-0xFF */
> +#define AYN_LED_MC_GREEN_REG	0xB1 /* Range 0x00-0xFF */
> +#define AYN_LED_MC_BLUE_REG	0xB2 /* Range 0x00-0xFF */
> +#define AYN_RGB_EFFECT_REG	0xB3
> +
> +/* RGB effect modes */
> +#define AYN_RGB_EFFECT_BREATHE		0x00
> +#define AYN_RGB_EFFECT_MONOCOLOR	0x55
> +#define AYN_RGB_EFFECT_WRITE		0xAA
>  =20
>   /* Handle ACPI lock mechanism */
>   #define ACPI_LOCK_DELAY_MS 500
> @@ -86,7 +98,9 @@ int ayn_pwm_curve_registers[10] =3D {
>   };
>  =20
>   struct ayn_device {
> +	struct led_classdev *led_cdev;
>   	u32 ayn_lock; /* ACPI EC Lock */
> +	u8 rgb_effect;
>   } drvdata;
>  =20
>   struct thermal_sensor {
> @@ -103,6 +117,33 @@ static struct thermal_sensor thermal_sensors[] =3D =
{
>   	{}
>   };
>  =20
> +#define DEVICE_ATTR_RW_NAMED(_name, _attrname)               \
> +	struct device_attribute dev_attr_##_name =3D {         \
> +		.attr =3D { .name =3D _attrname, .mode =3D 0644 }, \
> +		.show =3D _name##_show,                        \
> +		.store =3D _name##_store,                      \
> +	}
> +
> +#define DEVICE_ATTR_RO_NAMED(_name, _attrname)               \
> +	struct device_attribute dev_attr_##_name =3D {         \
> +		.attr =3D { .name =3D _attrname, .mode =3D 0444 }, \
> +		.show =3D _name##_show,                        \
> +	}

Please use DEVICE_ATTR_RW()/DEVICE_ATTR_RO() directly.

> +
> +/* Handle ACPI lock mechanism */
> +#define ACPI_LOCK_DELAY_MS 500

You already defined ACPI_LOCK_DELAY_MS earlier, please remove.

> +
> +/* RGB effect values */
> +enum RGB_EFFECT_OPTION {
> +	BREATHE,
> +	MONOCOLOR,
> +};
> +
> +static const char *const RGB_EFFECT_TEXT[] =3D {
> +	[BREATHE] =3D "breathe",
> +	[MONOCOLOR] =3D "monocolor",
> +};

No capslock for variables please.

> +
>   static bool lock_global_acpi_lock(void)
>   {
>   	return ACPI_SUCCESS(acpi_acquire_global_lock(ACPI_LOCK_DELAY_MS,
> @@ -528,10 +569,253 @@ static struct attribute *ayn_sensors_attrs[] =3D =
{
>  =20
>   ATTRIBUTE_GROUPS(ayn_sensors);
>  =20
> +/**
> + * rgb_effect_write() - Set the RGB effect stored in drvdata.rgb_effect=
.
> + */
> +static int rgb_effect_write(void)
> +{
> +	return write_to_ec(AYN_RGB_EFFECT_REG, drvdata.rgb_effect);
> +};
> +
> +/**
> + * rgb_effect_read() - Read the RGB effect and store it in drvdata.rgb_=
effect.
> + */
> +static int rgb_effect_read(void)
> +{
> +	int ret;
> +	long effect;
> +
> +	ret =3D read_from_ec(AYN_RGB_EFFECT_REG, 1, &effect);
> +	if (ret)
> +		return ret;
> +
> +	switch (effect) {
> +	case AYN_RGB_EFFECT_WRITE:
> +	case AYN_RGB_EFFECT_MONOCOLOR:
> +		drvdata.rgb_effect =3D AYN_RGB_EFFECT_WRITE;
> +		break;
> +	default:
> +		drvdata.rgb_effect =3D AYN_RGB_EFFECT_BREATHE;

You will need some locking around rgb_effect.

> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * rgb_effect_store() - Store the given RGB effect and set it.
> + *
> + * @dev: parent device of the given attribute.
> + * @attr: The attribute to write to.
> + * @buf: Input value string from sysfs write.
> + * @count: The number of bytes written.
> + *
> + * Return: The number of bytes written, or an error.
> + */
> +static ssize_t rgb_effect_store(struct device *dev,
> +				struct device_attribute *attr, const char *buf,
> +				size_t count)
> +{
> +	int ret;
> +
> +	ret =3D sysfs_match_string(RGB_EFFECT_TEXT, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret)
> +		drvdata.rgb_effect =3D AYN_RGB_EFFECT_WRITE;
> +	else
> +		drvdata.rgb_effect =3D AYN_RGB_EFFECT_BREATHE;
> +
> +	ret =3D rgb_effect_write();
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +};
> +
> +/**
> + * rgb_effect_show() - Read the current RGB effect.
> + *
> + * @dev: parent device of the given attribute.
> + * @attr: The attribute to read.
> + * @buf: Buffer to read to.
> + *
> + * Return: The number of bytes read, or an error.
> + */
> +static ssize_t rgb_effect_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	int ret, i;
> +
> +	ret =3D rgb_effect_read();
> +	if (ret)
> +		return ret;
> +
> +	switch (drvdata.rgb_effect) {
> +	case AYN_RGB_EFFECT_WRITE:
> +	case AYN_RGB_EFFECT_MONOCOLOR:
> +		i =3D MONOCOLOR;
> +		break;
> +	default:
> +		i =3D BREATHE;
> +		break;
> +	}
> +
> +	return sysfs_emit(buf, "%s\n", RGB_EFFECT_TEXT[i]);
> +};
> +
> +static DEVICE_ATTR_RW_NAMED(rgb_effect, "effect");
> +
> +/**
> + * rgb_effect_show() - Display the RGB effects available.
> + *
> + * @dev: parent device of the given attribute.
> + * @attr: The attribute to read.
> + * @buf: Buffer to read to.
> + *
> + * Return: The number of bytes read, or an error.
> + */
> +static ssize_t rgb_effect_index_show(struct device *dev,
> +				     struct device_attribute *attr, char *buf)
> +{
> +	size_t count =3D 0;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(RGB_EFFECT_TEXT); i++)
> +		count +=3D sysfs_emit_at(buf, count, "%s ", RGB_EFFECT_TEXT[i]);
> +
> +	buf[count - 1] =3D '\n';
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RO_NAMED(rgb_effect_index, "effect_index");

We might need to coordinate this with the LED subsystem maintainer. I CCed=
 him so that he can
voice his opinion about those sysfs attributes. Personally i would move th=
ose attributes below
the platform device.

> +
> +/**
> + * ayn_led_mc_brightness_set() - Write the brightness for the RGB LED.
> + *
> + * @led_cdev: Parent LED device for the led_classdev_mc.
> + * @brightness: Brightness value to write [0-255].
> + */
> +static void ayn_led_mc_brightness_set(struct led_classdev *led_cdev,
> +				      enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *led_cdev_mc =3D lcdev_to_mccdev(led_cdev);
> +	struct mc_subled s_led;
> +	int i, ret, val;
> +
> +	switch (drvdata.rgb_effect) {
> +	case AYN_RGB_EFFECT_WRITE:
> +	case AYN_RGB_EFFECT_MONOCOLOR:
> +		break;
> +	case AYN_RGB_EFFECT_BREATHE:
> +		return;
> +	}

This might confuse uses when they switch back to monocolor mode. I suggest=
 that
you write the RGB values regardless of the currently selected effect.

> +
> +	led_cdev->brightness =3D brightness;
> +	for (i =3D 0; i < led_cdev_mc->num_colors; i++) {
> +		s_led =3D led_cdev_mc->subled_info[i];
> +		val =3D brightness * s_led.intensity / led_cdev->max_brightness;

Please check if you can use led_mc_calc_color_components() instead.

> +		ret =3D write_to_ec(s_led.channel, val);
> +		if (ret) {
> +			dev_err(led_cdev->dev,
> +				"Error setting brightness:  %d\n", ret);
> +			return;
> +		}
> +	}
> +
> +	/* Must write mode again to change to set color */
> +	write_to_ec(AYN_RGB_EFFECT_REG, AYN_RGB_EFFECT_WRITE);
> +};
> +
> +/**
> + * ayn_led_mc_brightness_get() - Get the brightness for the RGB LED.
> + *
> + * @led_cdev: Parent LED device for the led_classdev_mc.
> + *
> + * Return: Current brightness.
> + */
> +static enum led_brightness ayn_led_mc_brightness_get(struct led_classde=
v *led_cdev)
> +{
> +	return led_cdev->brightness;
> +};

This looks strange, are you sure that you have to provide this callback?

> +
> +static struct attribute *ayn_led_mc_attrs[] =3D {
> +	&dev_attr_rgb_effect.attr,
> +	&dev_attr_rgb_effect_index.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group ayn_led_mc_group =3D {
> +	.attrs =3D ayn_led_mc_attrs,
> +};
> +
> +struct mc_subled ayn_led_mc_subled_info[] =3D {
> +	{
> +		.color_index =3D LED_COLOR_ID_RED,
> +		.brightness =3D 0,
> +		.intensity =3D 0,
> +		.channel =3D AYN_LED_MC_RED_REG,
> +	},
> +	{
> +		.color_index =3D LED_COLOR_ID_GREEN,
> +		.brightness =3D 0,
> +		.intensity =3D 0,
> +		.channel =3D AYN_LED_MC_GREEN_REG,
> +	},
> +	{
> +		.color_index =3D LED_COLOR_ID_BLUE,
> +		.brightness =3D 0,
> +		.intensity =3D 0,
> +		.channel =3D AYN_LED_MC_BLUE_REG,
> +	},
> +};

Please initialize the intensity fields with the current RGB register value=
s
during probe. Also please declare the array as static.

> +
> +struct led_classdev_mc ayn_led_mc =3D {
> +	.led_cdev =3D {
> +		.name =3D "ayn:rgb:joystick_rings",
> +		.brightness =3D 0,

Does the EC support some kind of "RGB off" state? If not then please initi=
alize the brightness field
with 0 if the RGB value during probe is not 0x000000 and 255 otherwise. Al=
so please declare the LED device
as static.

> +		.max_brightness =3D 255,
> +		.brightness_set =3D ayn_led_mc_brightness_set,
> +		.brightness_get =3D ayn_led_mc_brightness_get,
> +		.color =3D LED_COLOR_ID_RGB,
> +	},
> +	.num_colors =3D ARRAY_SIZE(ayn_led_mc_subled_info),
> +	.subled_info =3D ayn_led_mc_subled_info,
> +};

Should the LED be disabled during suspend? If yes then please set the LED_=
CORE_SUSPENDRESUME flag on the LED device.

> +
> +static int ayn_ec_resume(struct platform_device *pdev)
> +{
> +	struct led_classdev *led_cdev =3D drvdata.led_cdev;
> +	int ret;
> +
> +	ret =3D rgb_effect_write();
> +	if (ret)
> +		return ret;
> +
> +	ayn_led_mc_brightness_set(led_cdev, led_cdev->brightness);
> +
> +	return 0;
> +}

Using regmap would make this much easier.

> +
>   static int ayn_ec_probe(struct platform_device *pdev)
>   {
>   	struct device *dev =3D &pdev->dev;
>   	struct device *hwdev;
> +	int ret;
> +
> +	ret =3D devm_led_classdev_multicolor_register(dev, &ayn_led_mc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_device_add_group(ayn_led_mc.led_cdev.dev, &ayn_led_mc_gro=
up);
> +	if (ret)
> +		return ret;
> +
> +	drvdata.led_cdev =3D &ayn_led_mc.led_cdev;
> +	ret =3D rgb_effect_read();
> +	if (ret)
> +		return ret;
>  =20
>   	hwdev =3D devm_hwmon_device_register_with_info(dev, "aynec", NULL,
>   						     &ayn_ec_chip_info,
> @@ -544,6 +828,7 @@ static struct platform_driver ayn_ec_driver =3D {
>   		.name =3D "ayn-ec",
>   	},
>   	.probe =3D ayn_ec_probe,
> +	.resume =3D ayn_ec_resume,

Please do not use the legacy PM callback, instead use DEFINE_SIMPLE_DEV_PM=
_OPS() and the driver.pm field.

Thanks,
Armin Wolf

>   };
>  =20
>   static struct platform_device *ayn_ec_device;

