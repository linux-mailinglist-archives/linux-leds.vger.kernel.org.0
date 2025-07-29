Return-Path: <linux-leds+bounces-5154-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F32B146C7
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 05:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB35017AADB
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 03:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A31C21CC49;
	Tue, 29 Jul 2025 03:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEUZkaO7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C788217648;
	Tue, 29 Jul 2025 03:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753759538; cv=none; b=l8mP1UrDOju/UaxBzZ3brYAEdUIiu4jrqt0z8fUa+G/j9oAJSrN2XZamBMo+LQL25oSkHa8O0hRwfoDiQMl+JA8brApuxkNr5NeZ36AfMi5GayFZqVYcydnfjhPoRT5gm5UJwJQfRQolKbw3EKhN7ZlURz+JMjOvTA39mkNOVXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753759538; c=relaxed/simple;
	bh=OFla0Mlmsh3wjN+tGt5cYV/GIFOp7KH80aIZduegpO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NgfU8ITmgtM06PmWi1HfNnA8B3Cp+anruFwlfpZbjFkEROb5HbtRNy98w8iXWGResKTU07fizgM7j1PtOIzxuzn4pVlM5bG2zvuxb8FCiiTawy2qxR/6UGdi4cb7nbqlZ4Oy55T+uT7xAMIP4m3SolfN1W/UQTnellAE3Y27iKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEUZkaO7; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-70736b2ea12so12065686d6.1;
        Mon, 28 Jul 2025 20:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753759535; x=1754364335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbIlBRAqip9v9VzvrBRfzRMelfLWLyATzgaHfrw2TLY=;
        b=nEUZkaO7N4iAieoZ3gkiINarC8pw7PVnHbRfKLENj4YR9Df6IkIwUyS/Rk3Qv825Dt
         D3U9iXptdguyNfx9jErQ3WmCAmiZETm1qs27O5iHtJS44jemIX/FLBxlar4O/ZY9jiO/
         htT0e/xKrTcptYhY3JElEfk9RPHMbd1VO1I84EL0IEiU9rkf1JEgdkfGQoDblzu0hUi5
         rBQqYyjVeu7qGOkzNpcsSA12ALbJgjfmV6oYeR3WPSTUh7qhy/ZUMZJ6KdWTXOL1amYy
         +HJsFdwOfUABCJYyFFYZPccdLd1GgHDm/RWax+Ll7Vh7vzMZ67xrYEX41E+JEp/2Ja7f
         fOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753759535; x=1754364335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbIlBRAqip9v9VzvrBRfzRMelfLWLyATzgaHfrw2TLY=;
        b=vWQ/IvGsZevBTWkafz7yEAyDRbDcQIOR1wqPQDH8kUaAMu9k73AQPDfgsYfjr6OoJP
         aRimKF8WPn0wGBr9XS9F/90hk+Bjh3Lk3FTRRBhnzcvItR62SNJKXxIzMJYSQWgX986H
         jkBnj+/upJVJBMOQDBpz0kh2V5kyusdItLb+0Zz9AUAuq7LQNqx5YAZVEf2DxPhbD88D
         QeVDS0IOxL7vgG7RsVwYpTTYKeZfYNhOwF53btx8XbiWZvu2p3IXKoEKZLtVa2zXy1F8
         Y/3PhAJv4fYaxpDdTeChFvV7nY+J0jpNR0WdgiUnBJQvuj9jVNeUccHH//LiSHzhSWPT
         kJ+g==
X-Forwarded-Encrypted: i=1; AJvYcCUdWR5ta1eg5wvsE/E/cz1DPCG4WkNYYP6z+S8AVf51ikIqhMsU0GlmsyWCA8fPplJtVaMm8QYtvTflFENtUdfvBZ8Gag==@vger.kernel.org, AJvYcCVPms3eBQRCRVZjn5ZhX5lVyzA00licYDf5F88QqDMFSweZa/GORYw36swwmTsJuePmcw7hNmMc0+Y=@vger.kernel.org, AJvYcCWTTU/ziuO2NDEjAC7GHCRP858YSdyFFAk33yOiraGOzjcJ/QyiNSIjtD6YwDG+OIAZKcltDrOkc4llpg==@vger.kernel.org, AJvYcCXYUPITPhKbJZQvpq67JuAIBRiuHtndAYAAG2lno0ydUQQWu6kZGOw/TtAAfZ1ZqNLiWzixVKIYgaqPt18=@vger.kernel.org, AJvYcCXwnzqFafSgd1LaZKViNROuabsiLGCbHZhWA9GIhJTN1jHq2x6qrzdKUhLNxcE8whxJOJ5cvIag0CL/uKxj@vger.kernel.org
X-Gm-Message-State: AOJu0YxlJ3Exusk07lHmv8GtqZRVck4DIH/ugubFLmmBSzYkDdCc7kiy
	1U/6kfFUWxyPc+Ke0twp/4iWrJ3n2IpUa9700Jn+yBP00l++cHQ9x+r9pA9DowKD3SUMO3QsOUf
	ehs4jZJ4L8PENDqdS/Od4brp46Ul70pw=
X-Gm-Gg: ASbGncvogzeHY6N9aux5X9t+2902g7/uWl4VMJiyOFq6oWI+nAa16vWeYnwSruqfeH2
	9hyvgBnQFy7B3HQhczrGa/l+t1FxGMOCmLyJRG+DrUVRPsBXJXJ/RUq5fGpU55a4o4fYLeLu5yg
	i8tAI81erYk4SqXoTyXv3nJ+lzqX6ctwJB0dEGOfW/ybYxyHXCwGvsf8xHzO827a93bIp2JTF0v
	DdL2B3s
X-Google-Smtp-Source: AGHT+IF28oeQ5EC3SvmeQ7s1YAG7oH88F359RBBpmvHYa3VzX/vX7Yx4sGBcoGJaQf2PjB2Wy+U/fwyC5xN5sNZpO/E=
X-Received: by 2002:a05:6214:2a45:b0:704:f94e:b5d8 with SMTP id
 6a1803df08f44-707205ec6famr173957776d6.48.1753759534954; Mon, 28 Jul 2025
 20:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726204041.516440-1-derekjohn.clark@gmail.com>
 <20250726204041.516440-4-derekjohn.clark@gmail.com> <eac46383-c54c-419e-b63e-c2fd003f2b6c@gmx.de>
In-Reply-To: <eac46383-c54c-419e-b63e-c2fd003f2b6c@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Mon, 28 Jul 2025 20:25:24 -0700
X-Gm-Features: Ac12FXzRGm2dkGImgF6tRhAvDMmxDasHtizaX7JrYqNNj37mTsJda3JLX7_LgR0
Message-ID: <CAFqHKT=YRoSsThEbqXLPHR_1M3=zRHw9f758JKm++7TfN8ZWKA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] platform/x86: (ayn-ec) Add RGB Interface
To: Armin Wolf <W_Armin@gmx.de>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Alok Tiwari <alok.a.tiwari@oracle.com>, David Box <david.e.box@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, pavel@kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 4:59=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 26.07.25 um 22:40 schrieb Derek J. Clark:
>
> > Adds an EC controlled LED Multicolor Class Device for controlling the
> > RGB rings around the joysticks.
> >
> > The EC provides a single register for each of the colors red, green, an=
d
> > blue, as well as a mode switching register. The EC accepts values
> > [0-255] for all colors. There are two available effects: breathe, which=
 is
> > the default when the device is started, and monocolor. When resuming fr=
om
> > sleep the user selected effect will be overwritten by the EC, so the
> > driver retains the last setting and resets on resume. When setting a
> > color, each color register is set before a final "write" code is sent t=
o
> > the device. The EC may briefly reflect the "write" code when writing, b=
ut
> > quickly changes to the "monocolor" value once complete. The driver
> > interprets both of these values as "monocolor" in _show to simplify the
> > sysfs exposed to the user.
> >
> > Two custom attributes are added to the standard LED parent device:
> > effect, a RW file descriptor used to set the effect, and effect_index,
> > which enumerates the available valid options.
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> >   drivers/platform/x86/Kconfig  |   3 +
> >   drivers/platform/x86/ayn-ec.c | 285 +++++++++++++++++++++++++++++++++=
+
> >   2 files changed, 288 insertions(+)
> >
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
> > index 4819bfcffb6b..85dfb88cca6f 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -308,6 +308,9 @@ config AYN_EC
> >       tristate "AYN x86 devices EC platform control"
> >       depends on ACPI
> >       depends on HWMON
> > +     depends on NEW_LEDS
> > +     select LEDS_CLASS
> > +     select LEDS_CLASS_MULTICOLOR
> >       help
> >         This is a driver for AYN and Tectoy x86 handheld devices. It pr=
ovides
> >         temperature monitoring, manual fan speed control, fan curve con=
trol,
> > diff --git a/drivers/platform/x86/ayn-ec.c b/drivers/platform/x86/ayn-e=
c.c
> > index 466cc33adcb0..25f748d7db18 100644
> > --- a/drivers/platform/x86/ayn-ec.c
> > +++ b/drivers/platform/x86/ayn-ec.c
> > @@ -28,6 +28,8 @@
> >   #include <linux/hwmon.h>
> >   #include <linux/init.h>
> >   #include <linux/kernel.h>
> > +#include <linux/led-class-multicolor.h>
> > +#include <linux/leds.h>
> >   #include <linux/module.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/sysfs.h>
> > @@ -68,6 +70,16 @@
> >   #define AYN_SENSOR_PROC_TEMP_REG    0x09 /* CPU Core */
> >   #define AYN_SENSOR_VCORE_TEMP_REG   0x08 /* vCore */
> >
> > +/* EC Controlled RGB registers */
> > +#define AYN_LED_MC_RED_REG   0xB0 /* Range 0x00-0xFF */
> > +#define AYN_LED_MC_GREEN_REG 0xB1 /* Range 0x00-0xFF */
> > +#define AYN_LED_MC_BLUE_REG  0xB2 /* Range 0x00-0xFF */
> > +#define AYN_RGB_EFFECT_REG   0xB3
> > +
> > +/* RGB effect modes */
> > +#define AYN_RGB_EFFECT_BREATHE               0x00
> > +#define AYN_RGB_EFFECT_MONOCOLOR     0x55
> > +#define AYN_RGB_EFFECT_WRITE         0xAA
> >
> >   /* Handle ACPI lock mechanism */
> >   #define ACPI_LOCK_DELAY_MS 500
> > @@ -86,7 +98,9 @@ int ayn_pwm_curve_registers[10] =3D {
> >   };
> >
> >   struct ayn_device {
> > +     struct led_classdev *led_cdev;
> >       u32 ayn_lock; /* ACPI EC Lock */
> > +     u8 rgb_effect;
> >   } drvdata;
> >
> >   struct thermal_sensor {
> > @@ -103,6 +117,33 @@ static struct thermal_sensor thermal_sensors[] =3D=
 {
> >       {}
> >   };
> >
> > +#define DEVICE_ATTR_RW_NAMED(_name, _attrname)               \
> > +     struct device_attribute dev_attr_##_name =3D {         \
> > +             .attr =3D { .name =3D _attrname, .mode =3D 0644 }, \
> > +             .show =3D _name##_show,                        \
> > +             .store =3D _name##_store,                      \
> > +     }
> > +
> > +#define DEVICE_ATTR_RO_NAMED(_name, _attrname)               \
> > +     struct device_attribute dev_attr_##_name =3D {         \
> > +             .attr =3D { .name =3D _attrname, .mode =3D 0444 }, \
> > +             .show =3D _name##_show,                        \
> > +     }
>
> Please use DEVICE_ATTR_RW()/DEVICE_ATTR_RO() directly.
>
> > +
> > +/* Handle ACPI lock mechanism */
> > +#define ACPI_LOCK_DELAY_MS 500
>
> You already defined ACPI_LOCK_DELAY_MS earlier, please remove.
>
> > +
> > +/* RGB effect values */
> > +enum RGB_EFFECT_OPTION {
> > +     BREATHE,
> > +     MONOCOLOR,
> > +};
> > +
> > +static const char *const RGB_EFFECT_TEXT[] =3D {
> > +     [BREATHE] =3D "breathe",
> > +     [MONOCOLOR] =3D "monocolor",
> > +};
>
> No capslock for variables please.
>
> > +
> >   static bool lock_global_acpi_lock(void)
> >   {
> >       return ACPI_SUCCESS(acpi_acquire_global_lock(ACPI_LOCK_DELAY_MS,
> > @@ -528,10 +569,253 @@ static struct attribute *ayn_sensors_attrs[] =3D=
 {
> >
> >   ATTRIBUTE_GROUPS(ayn_sensors);
> >
> > +/**
> > + * rgb_effect_write() - Set the RGB effect stored in drvdata.rgb_effec=
t.
> > + */
> > +static int rgb_effect_write(void)
> > +{
> > +     return write_to_ec(AYN_RGB_EFFECT_REG, drvdata.rgb_effect);
> > +};
> > +
> > +/**
> > + * rgb_effect_read() - Read the RGB effect and store it in drvdata.rgb=
_effect.
> > + */
> > +static int rgb_effect_read(void)
> > +{
> > +     int ret;
> > +     long effect;
> > +
> > +     ret =3D read_from_ec(AYN_RGB_EFFECT_REG, 1, &effect);
> > +     if (ret)
> > +             return ret;
> > +
> > +     switch (effect) {
> > +     case AYN_RGB_EFFECT_WRITE:
> > +     case AYN_RGB_EFFECT_MONOCOLOR:
> > +             drvdata.rgb_effect =3D AYN_RGB_EFFECT_WRITE;
> > +             break;
> > +     default:
> > +             drvdata.rgb_effect =3D AYN_RGB_EFFECT_BREATHE;
>
> You will need some locking around rgb_effect.
>
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * rgb_effect_store() - Store the given RGB effect and set it.
> > + *
> > + * @dev: parent device of the given attribute.
> > + * @attr: The attribute to write to.
> > + * @buf: Input value string from sysfs write.
> > + * @count: The number of bytes written.
> > + *
> > + * Return: The number of bytes written, or an error.
> > + */
> > +static ssize_t rgb_effect_store(struct device *dev,
> > +                             struct device_attribute *attr, const char=
 *buf,
> > +                             size_t count)
> > +{
> > +     int ret;
> > +
> > +     ret =3D sysfs_match_string(RGB_EFFECT_TEXT, buf);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (ret)
> > +             drvdata.rgb_effect =3D AYN_RGB_EFFECT_WRITE;
> > +     else
> > +             drvdata.rgb_effect =3D AYN_RGB_EFFECT_BREATHE;
> > +
> > +     ret =3D rgb_effect_write();
> > +     if (ret)
> > +             return ret;
> > +
> > +     return count;
> > +};
> > +
> > +/**
> > + * rgb_effect_show() - Read the current RGB effect.
> > + *
> > + * @dev: parent device of the given attribute.
> > + * @attr: The attribute to read.
> > + * @buf: Buffer to read to.
> > + *
> > + * Return: The number of bytes read, or an error.
> > + */
> > +static ssize_t rgb_effect_show(struct device *dev,
> > +                            struct device_attribute *attr, char *buf)
> > +{
> > +     int ret, i;
> > +
> > +     ret =3D rgb_effect_read();
> > +     if (ret)
> > +             return ret;
> > +
> > +     switch (drvdata.rgb_effect) {
> > +     case AYN_RGB_EFFECT_WRITE:
> > +     case AYN_RGB_EFFECT_MONOCOLOR:
> > +             i =3D MONOCOLOR;
> > +             break;
> > +     default:
> > +             i =3D BREATHE;
> > +             break;
> > +     }
> > +
> > +     return sysfs_emit(buf, "%s\n", RGB_EFFECT_TEXT[i]);
> > +};
> > +
> > +static DEVICE_ATTR_RW_NAMED(rgb_effect, "effect");
> > +
> > +/**
> > + * rgb_effect_show() - Display the RGB effects available.
> > + *
> > + * @dev: parent device of the given attribute.
> > + * @attr: The attribute to read.
> > + * @buf: Buffer to read to.
> > + *
> > + * Return: The number of bytes read, or an error.
> > + */
> > +static ssize_t rgb_effect_index_show(struct device *dev,
> > +                                  struct device_attribute *attr, char =
*buf)
> > +{
> > +     size_t count =3D 0;
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(RGB_EFFECT_TEXT); i++)
> > +             count +=3D sysfs_emit_at(buf, count, "%s ", RGB_EFFECT_TE=
XT[i]);
> > +
> > +     buf[count - 1] =3D '\n';
> > +
> > +     return count;
> > +}
> > +
> > +static DEVICE_ATTR_RO_NAMED(rgb_effect_index, "effect_index");
>
> We might need to coordinate this with the LED subsystem maintainer. I CCe=
d him so that he can
> voice his opinion about those sysfs attributes. Personally i would move t=
hose attributes below
> the platform device.
>

The main reason I added them to the LED interface is to make writing
udev rules more intuitive. Quite a few folks using the DKMS version of
this driver just want to set a specific color on boot (usually off).
IMO it makes logical sense that all the settings related to the LEDs
would be on the LED device. I'll wait for the response from your CC
before sending a v4.

> > +
> > +/**
> > + * ayn_led_mc_brightness_set() - Write the brightness for the RGB LED.
> > + *
> > + * @led_cdev: Parent LED device for the led_classdev_mc.
> > + * @brightness: Brightness value to write [0-255].
> > + */
> > +static void ayn_led_mc_brightness_set(struct led_classdev *led_cdev,
> > +                                   enum led_brightness brightness)
> > +{
> > +     struct led_classdev_mc *led_cdev_mc =3D lcdev_to_mccdev(led_cdev)=
;
> > +     struct mc_subled s_led;
> > +     int i, ret, val;
> > +
> > +     switch (drvdata.rgb_effect) {
> > +     case AYN_RGB_EFFECT_WRITE:
> > +     case AYN_RGB_EFFECT_MONOCOLOR:
> > +             break;
> > +     case AYN_RGB_EFFECT_BREATHE:
> > +             return;
> > +     }
>
> This might confuse uses when they switch back to monocolor mode. I sugges=
t that
> you write the RGB values regardless of the currently selected effect.
>

I'll test if this interferes with breathe mode. I wrote this driver a
couple years ago as a DKMS module so I don't remember immediately if I
had to add this mitigation to prevent switching to monocolor if the
multi_index or brightness was written to. If that does turn out to be
the case, should I cache the latest write until monocolor is set?

> > +
> > +     led_cdev->brightness =3D brightness;
> > +     for (i =3D 0; i < led_cdev_mc->num_colors; i++) {
> > +             s_led =3D led_cdev_mc->subled_info[i];
> > +             val =3D brightness * s_led.intensity / led_cdev->max_brig=
htness;
>
> Please check if you can use led_mc_calc_color_components() instead.
>
> > +             ret =3D write_to_ec(s_led.channel, val);
> > +             if (ret) {
> > +                     dev_err(led_cdev->dev,
> > +                             "Error setting brightness:  %d\n", ret);
> > +                     return;
> > +             }
> > +     }
> > +
> > +     /* Must write mode again to change to set color */
> > +     write_to_ec(AYN_RGB_EFFECT_REG, AYN_RGB_EFFECT_WRITE);
> > +};
> > +
> > +/**
> > + * ayn_led_mc_brightness_get() - Get the brightness for the RGB LED.
> > + *
> > + * @led_cdev: Parent LED device for the led_classdev_mc.
> > + *
> > + * Return: Current brightness.
> > + */
> > +static enum led_brightness ayn_led_mc_brightness_get(struct led_classd=
ev *led_cdev)
> > +{
> > +     return led_cdev->brightness;
> > +};
>
> This looks strange, are you sure that you have to provide this callback?

Hmm, maybe not.

> > +
> > +static struct attribute *ayn_led_mc_attrs[] =3D {
> > +     &dev_attr_rgb_effect.attr,
> > +     &dev_attr_rgb_effect_index.attr,
> > +     NULL,
> > +};
> > +
> > +static struct attribute_group ayn_led_mc_group =3D {
> > +     .attrs =3D ayn_led_mc_attrs,
> > +};
> > +
> > +struct mc_subled ayn_led_mc_subled_info[] =3D {
> > +     {
> > +             .color_index =3D LED_COLOR_ID_RED,
> > +             .brightness =3D 0,
> > +             .intensity =3D 0,
> > +             .channel =3D AYN_LED_MC_RED_REG,
> > +     },
> > +     {
> > +             .color_index =3D LED_COLOR_ID_GREEN,
> > +             .brightness =3D 0,
> > +             .intensity =3D 0,
> > +             .channel =3D AYN_LED_MC_GREEN_REG,
> > +     },
> > +     {
> > +             .color_index =3D LED_COLOR_ID_BLUE,
> > +             .brightness =3D 0,
> > +             .intensity =3D 0,
> > +             .channel =3D AYN_LED_MC_BLUE_REG,
> > +     },
> > +};
>
> Please initialize the intensity fields with the current RGB register valu=
es
> during probe. Also please declare the array as static.
>

Good idea, thanks.

> > +
> > +struct led_classdev_mc ayn_led_mc =3D {
> > +     .led_cdev =3D {
> > +             .name =3D "ayn:rgb:joystick_rings",
> > +             .brightness =3D 0,
>
> Does the EC support some kind of "RGB off" state? If not then please init=
ialize the brightness field
> with 0 if the RGB value during probe is not 0x000000 and 255 otherwise. A=
lso please declare the LED device
> as static.
>

Off is done by setting all color registers to 0. Simple enough to add.
I'm thinking something like:

if (red || green || blue)
        led_cdev.brightness =3D 255;
else
        led_cdev.brightness =3D 0;

> > +             .max_brightness =3D 255,
> > +             .brightness_set =3D ayn_led_mc_brightness_set,
> > +             .brightness_get =3D ayn_led_mc_brightness_get,
> > +             .color =3D LED_COLOR_ID_RGB,
> > +     },
> > +     .num_colors =3D ARRAY_SIZE(ayn_led_mc_subled_info),
> > +     .subled_info =3D ayn_led_mc_subled_info,
> > +};
>
> Should the LED be disabled during suspend? If yes then please set the LED=
_CORE_SUSPENDRESUME flag on the LED device.
>

The EC takes over during suspend and switches back to breathe mode.
Resume exists to return to user settings.

> > +
> > +static int ayn_ec_resume(struct platform_device *pdev)
> > +{
> > +     struct led_classdev *led_cdev =3D drvdata.led_cdev;
> > +     int ret;
> > +
> > +     ret =3D rgb_effect_write();
> > +     if (ret)
> > +             return ret;
> > +
> > +     ayn_led_mc_brightness_set(led_cdev, led_cdev->brightness);
> > +
> > +     return 0;
> > +}
>
> Using regmap would make this much easier.
>
> > +
> >   static int ayn_ec_probe(struct platform_device *pdev)
> >   {
> >       struct device *dev =3D &pdev->dev;
> >       struct device *hwdev;
> > +     int ret;
> > +
> > +     ret =3D devm_led_classdev_multicolor_register(dev, &ayn_led_mc);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D devm_device_add_group(ayn_led_mc.led_cdev.dev, &ayn_led_m=
c_group);
> > +     if (ret)
> > +             return ret;
> > +
> > +     drvdata.led_cdev =3D &ayn_led_mc.led_cdev;
> > +     ret =3D rgb_effect_read();
> > +     if (ret)
> > +             return ret;
> >
> >       hwdev =3D devm_hwmon_device_register_with_info(dev, "aynec", NULL=
,
> >                                                    &ayn_ec_chip_info,
> > @@ -544,6 +828,7 @@ static struct platform_driver ayn_ec_driver =3D {
> >               .name =3D "ayn-ec",
> >       },
> >       .probe =3D ayn_ec_probe,
> > +     .resume =3D ayn_ec_resume,
>
> Please do not use the legacy PM callback, instead use DEFINE_SIMPLE_DEV_P=
M_OPS() and the driver.pm field.
>

Okay, I wasn't aware of the newer callbacks. I'll look them up.

Thanks,
Derek

> Thanks,
> Armin Wolf
>
> >   };
> >
> >   static struct platform_device *ayn_ec_device;

