Return-Path: <linux-leds+bounces-5155-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AEAB1471D
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 06:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF3E6189F0EF
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 04:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FE4207E1D;
	Tue, 29 Jul 2025 04:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="TAP8RbxS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F813FB31;
	Tue, 29 Jul 2025 04:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753762713; cv=none; b=jkpQoc3fd30LQ8OPG/tgkgUSxG00XYCFSswsw+mCf2auyYVpXsnwTTLO2nX+oTZl6bjW+ueL2laM05aUSzPuX7XWf+Vfz+0i01omZkn+npc8jDYe6nU+2XkIyUv87YykxoilNioph1GX2kyDBvhalEvRfWkqHoW6CXrpkK1bTdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753762713; c=relaxed/simple;
	bh=wMxMjRgZGpEHt52bJGR3O4Vc7I4/a3NClozDNxSz7Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uhhP5TdhFuv836unjwqF3uRrXqGspjMi7JRfLpo+0TrXxRwNRN426ynulABJe2tQf3zzi1NuQbEcrQw0mZ6apBW5vc21GUmVS4frYb00QkRY9JKMsLeLHe7R+sTikIpYlN+z0K03QwTz7SyVW2CodaMOtZywtpjUmrVWwsTX7yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=TAP8RbxS; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1753762707; x=1754367507; i=w_armin@gmx.de;
	bh=Q+xrvUHw3K60Ca166ldJnDXuIyW9HGgC5mYINfMpxow=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=TAP8RbxSbG3+8RPxPrWU/6fNaAjvD3eesDo79i8H46L8jbhJIxIq3po97k9f5JYC
	 aATKiqy76WqbnKygjTQ3vGhBQ5/iTAeVtIAsmHo/HwY5OCcM0PSOjqXETcqe/9xxC
	 Z52EgRINkqOLMHitAd6IKmagfZDctezQ9wesYcumpHpP0GX+3oDQvQwerv3bEapPg
	 sGIUsnocg8mOs5J4JFWdzEhLTnGXFBsMcXMPXO602K9rtj7NpFImgIMWDsN4dlvz0
	 VlnJlt4Mh2T8x7QHGR2OSeF9hH3UeTnDOpcoOSvVxef1Lj+Ms2VPEuJWnT8vqdGDB
	 tyjHdbUV+9MgyW918w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVN6j-1v8tnA2ETv-00QKHs; Tue, 29
 Jul 2025 06:18:27 +0200
Message-ID: <86888be2-3920-4232-9335-d411625bd8fd@gmx.de>
Date: Tue, 29 Jul 2025 06:18:24 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] platform/x86: (ayn-ec) Add RGB Interface
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Alok Tiwari <alok.a.tiwari@oracle.com>,
 David Box <david.e.box@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 Lee Jones <lee@kernel.org>, pavel@kernel.org, linux-leds@vger.kernel.org
References: <20250726204041.516440-1-derekjohn.clark@gmail.com>
 <20250726204041.516440-4-derekjohn.clark@gmail.com>
 <eac46383-c54c-419e-b63e-c2fd003f2b6c@gmx.de>
 <CAFqHKT=YRoSsThEbqXLPHR_1M3=zRHw9f758JKm++7TfN8ZWKA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAFqHKT=YRoSsThEbqXLPHR_1M3=zRHw9f758JKm++7TfN8ZWKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o9lL6hYmj/7hNnqgE8+fIIktFG8ptaNNAHSIig9hoFjGXiMsLiW
 ONtViWlaGiseFDr+w5e07sOD4nekiH4kkqgFt1H6AVLPoC16rCSd073ybYpKIkcE4CQO3u0
 SKsxZvoI2oW7h6fSttEU9mv/uQzf2yrjpUu8z6pX3kdWaDMLtlfQU1/vch8TPaNMWgIRV9Y
 t6Tg9xbY1ie+RCajFlr0w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:20lKSaqgBIc=;gnqqNP/8LVeglGV9ycHbNIQZxrF
 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

Am 29.07.25 um 05:25 schrieb Derek John Clark:

> On Sat, Jul 26, 2025 at 4:59=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Am 26.07.25 um 22:40 schrieb Derek J. Clark:
>>
>>> Adds an EC controlled LED Multicolor Class Device for controlling the
>>> RGB rings around the joysticks.
>>>
>>> The EC provides a single register for each of the colors red, green, a=
nd
>>> blue, as well as a mode switching register. The EC accepts values
>>> [0-255] for all colors. There are two available effects: breathe, whic=
h is
>>> the default when the device is started, and monocolor. When resuming f=
rom
>>> sleep the user selected effect will be overwritten by the EC, so the
>>> driver retains the last setting and resets on resume. When setting a
>>> color, each color register is set before a final "write" code is sent =
to
>>> the device. The EC may briefly reflect the "write" code when writing, =
but
>>> quickly changes to the "monocolor" value once complete. The driver
>>> interprets both of these values as "monocolor" in _show to simplify th=
e
>>> sysfs exposed to the user.
>>>
>>> Two custom attributes are added to the standard LED parent device:
>>> effect, a RW file descriptor used to set the effect, and effect_index,
>>> which enumerates the available valid options.
>>>
>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>> ---
>>>    drivers/platform/x86/Kconfig  |   3 +
>>>    drivers/platform/x86/ayn-ec.c | 285 +++++++++++++++++++++++++++++++=
+++
>>>    2 files changed, 288 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconf=
ig
>>> index 4819bfcffb6b..85dfb88cca6f 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -308,6 +308,9 @@ config AYN_EC
>>>        tristate "AYN x86 devices EC platform control"
>>>        depends on ACPI
>>>        depends on HWMON
>>> +     depends on NEW_LEDS
>>> +     select LEDS_CLASS
>>> +     select LEDS_CLASS_MULTICOLOR
>>>        help
>>>          This is a driver for AYN and Tectoy x86 handheld devices. It =
provides
>>>          temperature monitoring, manual fan speed control, fan curve c=
ontrol,
>>> diff --git a/drivers/platform/x86/ayn-ec.c b/drivers/platform/x86/ayn-=
ec.c
>>> index 466cc33adcb0..25f748d7db18 100644
>>> --- a/drivers/platform/x86/ayn-ec.c
>>> +++ b/drivers/platform/x86/ayn-ec.c
>>> @@ -28,6 +28,8 @@
>>>    #include <linux/hwmon.h>
>>>    #include <linux/init.h>
>>>    #include <linux/kernel.h>
>>> +#include <linux/led-class-multicolor.h>
>>> +#include <linux/leds.h>
>>>    #include <linux/module.h>
>>>    #include <linux/platform_device.h>
>>>    #include <linux/sysfs.h>
>>> @@ -68,6 +70,16 @@
>>>    #define AYN_SENSOR_PROC_TEMP_REG    0x09 /* CPU Core */
>>>    #define AYN_SENSOR_VCORE_TEMP_REG   0x08 /* vCore */
>>>
>>> +/* EC Controlled RGB registers */
>>> +#define AYN_LED_MC_RED_REG   0xB0 /* Range 0x00-0xFF */
>>> +#define AYN_LED_MC_GREEN_REG 0xB1 /* Range 0x00-0xFF */
>>> +#define AYN_LED_MC_BLUE_REG  0xB2 /* Range 0x00-0xFF */
>>> +#define AYN_RGB_EFFECT_REG   0xB3
>>> +
>>> +/* RGB effect modes */
>>> +#define AYN_RGB_EFFECT_BREATHE               0x00
>>> +#define AYN_RGB_EFFECT_MONOCOLOR     0x55
>>> +#define AYN_RGB_EFFECT_WRITE         0xAA
>>>
>>>    /* Handle ACPI lock mechanism */
>>>    #define ACPI_LOCK_DELAY_MS 500
>>> @@ -86,7 +98,9 @@ int ayn_pwm_curve_registers[10] =3D {
>>>    };
>>>
>>>    struct ayn_device {
>>> +     struct led_classdev *led_cdev;
>>>        u32 ayn_lock; /* ACPI EC Lock */
>>> +     u8 rgb_effect;
>>>    } drvdata;
>>>
>>>    struct thermal_sensor {
>>> @@ -103,6 +117,33 @@ static struct thermal_sensor thermal_sensors[] =
=3D {
>>>        {}
>>>    };
>>>
>>> +#define DEVICE_ATTR_RW_NAMED(_name, _attrname)               \
>>> +     struct device_attribute dev_attr_##_name =3D {         \
>>> +             .attr =3D { .name =3D _attrname, .mode =3D 0644 }, \
>>> +             .show =3D _name##_show,                        \
>>> +             .store =3D _name##_store,                      \
>>> +     }
>>> +
>>> +#define DEVICE_ATTR_RO_NAMED(_name, _attrname)               \
>>> +     struct device_attribute dev_attr_##_name =3D {         \
>>> +             .attr =3D { .name =3D _attrname, .mode =3D 0444 }, \
>>> +             .show =3D _name##_show,                        \
>>> +     }
>> Please use DEVICE_ATTR_RW()/DEVICE_ATTR_RO() directly.
>>
>>> +
>>> +/* Handle ACPI lock mechanism */
>>> +#define ACPI_LOCK_DELAY_MS 500
>> You already defined ACPI_LOCK_DELAY_MS earlier, please remove.
>>
>>> +
>>> +/* RGB effect values */
>>> +enum RGB_EFFECT_OPTION {
>>> +     BREATHE,
>>> +     MONOCOLOR,
>>> +};
>>> +
>>> +static const char *const RGB_EFFECT_TEXT[] =3D {
>>> +     [BREATHE] =3D "breathe",
>>> +     [MONOCOLOR] =3D "monocolor",
>>> +};
>> No capslock for variables please.
>>
>>> +
>>>    static bool lock_global_acpi_lock(void)
>>>    {
>>>        return ACPI_SUCCESS(acpi_acquire_global_lock(ACPI_LOCK_DELAY_MS=
,
>>> @@ -528,10 +569,253 @@ static struct attribute *ayn_sensors_attrs[] =
=3D {
>>>
>>>    ATTRIBUTE_GROUPS(ayn_sensors);
>>>
>>> +/**
>>> + * rgb_effect_write() - Set the RGB effect stored in drvdata.rgb_effe=
ct.
>>> + */
>>> +static int rgb_effect_write(void)
>>> +{
>>> +     return write_to_ec(AYN_RGB_EFFECT_REG, drvdata.rgb_effect);
>>> +};
>>> +
>>> +/**
>>> + * rgb_effect_read() - Read the RGB effect and store it in drvdata.rg=
b_effect.
>>> + */
>>> +static int rgb_effect_read(void)
>>> +{
>>> +     int ret;
>>> +     long effect;
>>> +
>>> +     ret =3D read_from_ec(AYN_RGB_EFFECT_REG, 1, &effect);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     switch (effect) {
>>> +     case AYN_RGB_EFFECT_WRITE:
>>> +     case AYN_RGB_EFFECT_MONOCOLOR:
>>> +             drvdata.rgb_effect =3D AYN_RGB_EFFECT_WRITE;
>>> +             break;
>>> +     default:
>>> +             drvdata.rgb_effect =3D AYN_RGB_EFFECT_BREATHE;
>> You will need some locking around rgb_effect.
>>
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +/**
>>> + * rgb_effect_store() - Store the given RGB effect and set it.
>>> + *
>>> + * @dev: parent device of the given attribute.
>>> + * @attr: The attribute to write to.
>>> + * @buf: Input value string from sysfs write.
>>> + * @count: The number of bytes written.
>>> + *
>>> + * Return: The number of bytes written, or an error.
>>> + */
>>> +static ssize_t rgb_effect_store(struct device *dev,
>>> +                             struct device_attribute *attr, const cha=
r *buf,
>>> +                             size_t count)
>>> +{
>>> +     int ret;
>>> +
>>> +     ret =3D sysfs_match_string(RGB_EFFECT_TEXT, buf);
>>> +     if (ret < 0)
>>> +             return ret;
>>> +
>>> +     if (ret)
>>> +             drvdata.rgb_effect =3D AYN_RGB_EFFECT_WRITE;
>>> +     else
>>> +             drvdata.rgb_effect =3D AYN_RGB_EFFECT_BREATHE;
>>> +
>>> +     ret =3D rgb_effect_write();
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     return count;
>>> +};
>>> +
>>> +/**
>>> + * rgb_effect_show() - Read the current RGB effect.
>>> + *
>>> + * @dev: parent device of the given attribute.
>>> + * @attr: The attribute to read.
>>> + * @buf: Buffer to read to.
>>> + *
>>> + * Return: The number of bytes read, or an error.
>>> + */
>>> +static ssize_t rgb_effect_show(struct device *dev,
>>> +                            struct device_attribute *attr, char *buf)
>>> +{
>>> +     int ret, i;
>>> +
>>> +     ret =3D rgb_effect_read();
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     switch (drvdata.rgb_effect) {
>>> +     case AYN_RGB_EFFECT_WRITE:
>>> +     case AYN_RGB_EFFECT_MONOCOLOR:
>>> +             i =3D MONOCOLOR;
>>> +             break;
>>> +     default:
>>> +             i =3D BREATHE;
>>> +             break;
>>> +     }
>>> +
>>> +     return sysfs_emit(buf, "%s\n", RGB_EFFECT_TEXT[i]);
>>> +};
>>> +
>>> +static DEVICE_ATTR_RW_NAMED(rgb_effect, "effect");
>>> +
>>> +/**
>>> + * rgb_effect_show() - Display the RGB effects available.
>>> + *
>>> + * @dev: parent device of the given attribute.
>>> + * @attr: The attribute to read.
>>> + * @buf: Buffer to read to.
>>> + *
>>> + * Return: The number of bytes read, or an error.
>>> + */
>>> +static ssize_t rgb_effect_index_show(struct device *dev,
>>> +                                  struct device_attribute *attr, char=
 *buf)
>>> +{
>>> +     size_t count =3D 0;
>>> +     unsigned int i;
>>> +
>>> +     for (i =3D 0; i < ARRAY_SIZE(RGB_EFFECT_TEXT); i++)
>>> +             count +=3D sysfs_emit_at(buf, count, "%s ", RGB_EFFECT_T=
EXT[i]);
>>> +
>>> +     buf[count - 1] =3D '\n';
>>> +
>>> +     return count;
>>> +}
>>> +
>>> +static DEVICE_ATTR_RO_NAMED(rgb_effect_index, "effect_index");
>> We might need to coordinate this with the LED subsystem maintainer. I C=
Ced him so that he can
>> voice his opinion about those sysfs attributes. Personally i would move=
 those attributes below
>> the platform device.
>>
> The main reason I added them to the LED interface is to make writing
> udev rules more intuitive. Quite a few folks using the DKMS version of
> this driver just want to set a specific color on boot (usually off).
> IMO it makes logical sense that all the settings related to the LEDs
> would be on the LED device. I'll wait for the response from your CC
> before sending a v4.
>
>>> +
>>> +/**
>>> + * ayn_led_mc_brightness_set() - Write the brightness for the RGB LED=
.
>>> + *
>>> + * @led_cdev: Parent LED device for the led_classdev_mc.
>>> + * @brightness: Brightness value to write [0-255].
>>> + */
>>> +static void ayn_led_mc_brightness_set(struct led_classdev *led_cdev,
>>> +                                   enum led_brightness brightness)
>>> +{
>>> +     struct led_classdev_mc *led_cdev_mc =3D lcdev_to_mccdev(led_cdev=
);
>>> +     struct mc_subled s_led;
>>> +     int i, ret, val;
>>> +
>>> +     switch (drvdata.rgb_effect) {
>>> +     case AYN_RGB_EFFECT_WRITE:
>>> +     case AYN_RGB_EFFECT_MONOCOLOR:
>>> +             break;
>>> +     case AYN_RGB_EFFECT_BREATHE:
>>> +             return;
>>> +     }
>> This might confuse uses when they switch back to monocolor mode. I sugg=
est that
>> you write the RGB values regardless of the currently selected effect.
>>
> I'll test if this interferes with breathe mode. I wrote this driver a
> couple years ago as a DKMS module so I don't remember immediately if I
> had to add this mitigation to prevent switching to monocolor if the
> multi_index or brightness was written to. If that does turn out to be
> the case, should I cache the latest write until monocolor is set?

In such a case i think led_sysfs_disable()/led_sysfs_enable() should be ca=
lled
to signal userspace applications that the LED cannot currently be accessed=
.

>>> +
>>> +     led_cdev->brightness =3D brightness;
>>> +     for (i =3D 0; i < led_cdev_mc->num_colors; i++) {
>>> +             s_led =3D led_cdev_mc->subled_info[i];
>>> +             val =3D brightness * s_led.intensity / led_cdev->max_bri=
ghtness;
>> Please check if you can use led_mc_calc_color_components() instead.
>>
>>> +             ret =3D write_to_ec(s_led.channel, val);
>>> +             if (ret) {
>>> +                     dev_err(led_cdev->dev,
>>> +                             "Error setting brightness:  %d\n", ret);
>>> +                     return;
>>> +             }
>>> +     }
>>> +
>>> +     /* Must write mode again to change to set color */
>>> +     write_to_ec(AYN_RGB_EFFECT_REG, AYN_RGB_EFFECT_WRITE);
>>> +};
>>> +
>>> +/**
>>> + * ayn_led_mc_brightness_get() - Get the brightness for the RGB LED.
>>> + *
>>> + * @led_cdev: Parent LED device for the led_classdev_mc.
>>> + *
>>> + * Return: Current brightness.
>>> + */
>>> +static enum led_brightness ayn_led_mc_brightness_get(struct led_class=
dev *led_cdev)
>>> +{
>>> +     return led_cdev->brightness;
>>> +};
>> This looks strange, are you sure that you have to provide this callback=
?
> Hmm, maybe not.
>
>>> +
>>> +static struct attribute *ayn_led_mc_attrs[] =3D {
>>> +     &dev_attr_rgb_effect.attr,
>>> +     &dev_attr_rgb_effect_index.attr,
>>> +     NULL,
>>> +};
>>> +
>>> +static struct attribute_group ayn_led_mc_group =3D {
>>> +     .attrs =3D ayn_led_mc_attrs,
>>> +};
>>> +
>>> +struct mc_subled ayn_led_mc_subled_info[] =3D {
>>> +     {
>>> +             .color_index =3D LED_COLOR_ID_RED,
>>> +             .brightness =3D 0,
>>> +             .intensity =3D 0,
>>> +             .channel =3D AYN_LED_MC_RED_REG,
>>> +     },
>>> +     {
>>> +             .color_index =3D LED_COLOR_ID_GREEN,
>>> +             .brightness =3D 0,
>>> +             .intensity =3D 0,
>>> +             .channel =3D AYN_LED_MC_GREEN_REG,
>>> +     },
>>> +     {
>>> +             .color_index =3D LED_COLOR_ID_BLUE,
>>> +             .brightness =3D 0,
>>> +             .intensity =3D 0,
>>> +             .channel =3D AYN_LED_MC_BLUE_REG,
>>> +     },
>>> +};
>> Please initialize the intensity fields with the current RGB register va=
lues
>> during probe. Also please declare the array as static.
>>
> Good idea, thanks.
>
>>> +
>>> +struct led_classdev_mc ayn_led_mc =3D {
>>> +     .led_cdev =3D {
>>> +             .name =3D "ayn:rgb:joystick_rings",
>>> +             .brightness =3D 0,
>> Does the EC support some kind of "RGB off" state? If not then please in=
itialize the brightness field
>> with 0 if the RGB value during probe is not 0x000000 and 255 otherwise.=
 Also please declare the LED device
>> as static.
>>
> Off is done by setting all color registers to 0. Simple enough to add.
> I'm thinking something like:
>
> if (red || green || blue)
>          led_cdev.brightness =3D 255;
> else
>          led_cdev.brightness =3D 0;

Looks good.

>>> +             .max_brightness =3D 255,
>>> +             .brightness_set =3D ayn_led_mc_brightness_set,
>>> +             .brightness_get =3D ayn_led_mc_brightness_get,
>>> +             .color =3D LED_COLOR_ID_RGB,
>>> +     },
>>> +     .num_colors =3D ARRAY_SIZE(ayn_led_mc_subled_info),
>>> +     .subled_info =3D ayn_led_mc_subled_info,
>>> +};
>> Should the LED be disabled during suspend? If yes then please set the L=
ED_CORE_SUSPENDRESUME flag on the LED device.
>>
> The EC takes over during suspend and switches back to breathe mode.
> Resume exists to return to user settings.

I see, in this case the LED core should indeed not perform any suspend/res=
ume handling by itself.

Thanks,
Armin Wolf

>>> +
>>> +static int ayn_ec_resume(struct platform_device *pdev)
>>> +{
>>> +     struct led_classdev *led_cdev =3D drvdata.led_cdev;
>>> +     int ret;
>>> +
>>> +     ret =3D rgb_effect_write();
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ayn_led_mc_brightness_set(led_cdev, led_cdev->brightness);
>>> +
>>> +     return 0;
>>> +}
>> Using regmap would make this much easier.
>>
>>> +
>>>    static int ayn_ec_probe(struct platform_device *pdev)
>>>    {
>>>        struct device *dev =3D &pdev->dev;
>>>        struct device *hwdev;
>>> +     int ret;
>>> +
>>> +     ret =3D devm_led_classdev_multicolor_register(dev, &ayn_led_mc);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret =3D devm_device_add_group(ayn_led_mc.led_cdev.dev, &ayn_led_=
mc_group);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     drvdata.led_cdev =3D &ayn_led_mc.led_cdev;
>>> +     ret =3D rgb_effect_read();
>>> +     if (ret)
>>> +             return ret;
>>>
>>>        hwdev =3D devm_hwmon_device_register_with_info(dev, "aynec", NU=
LL,
>>>                                                     &ayn_ec_chip_info,
>>> @@ -544,6 +828,7 @@ static struct platform_driver ayn_ec_driver =3D {
>>>                .name =3D "ayn-ec",
>>>        },
>>>        .probe =3D ayn_ec_probe,
>>> +     .resume =3D ayn_ec_resume,
>> Please do not use the legacy PM callback, instead use DEFINE_SIMPLE_DEV=
_PM_OPS() and the driver.pm field.
>>
> Okay, I wasn't aware of the newer callbacks. I'll look them up.
>
> Thanks,
> Derek
>
>> Thanks,
>> Armin Wolf
>>
>>>    };
>>>
>>>    static struct platform_device *ayn_ec_device;

