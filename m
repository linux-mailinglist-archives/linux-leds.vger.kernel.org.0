Return-Path: <linux-leds+bounces-5202-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4E0B1DA72
	for <lists+linux-leds@lfdr.de>; Thu,  7 Aug 2025 16:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 656157236B3
	for <lists+linux-leds@lfdr.de>; Thu,  7 Aug 2025 14:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6994267B89;
	Thu,  7 Aug 2025 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="pN0VINF+"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D556265CAD;
	Thu,  7 Aug 2025 14:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754578560; cv=pass; b=n/RfB52UNQ6srkDFZ2l1aMHKWTBQ3T6NlKqy4g39veces9eKbEo1Cari3Ue72wNh7xubyil70MBY3JP/lLYl8hpzaci1BpukhCYOBD46EFBDmlDxdt0DbBAUlhsiNfzbgP80sKPrzGPvSj2Lxu9TLJS0Rm/aLD+mCG5tGIRhg9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754578560; c=relaxed/simple;
	bh=4ww/HZCjHc1Mnpp1N1zs/cXAyAtGTswLveFDQ2m3Fjk=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qwEdykbuknj0oQQKbpoPftZh1X6fsnb+izOYcpklJu0YQ4jVNUzTTgE7xnBSEHQNlK0UmacBXi9unTrnUDvZyzN0hiG90oxvCoWXHhdorw5Yvbm0+geE5KhSOTCyIVYfHPJ+hFaj2ejhAGvPAN9tbfOnWP/58gmVVZuCu5DILFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=pN0VINF+; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1754578547; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FD3HRlsVQEuJvghDXw6mBHzb6czFvH7n0Gw5PI/A6Mep9NJTsjg38+M5qz3RxUF7ITHwZbnFRt9bdCnjCwEyjlW7YV9lGwGWrp2PBzyn+saqe9uCWPM+/DKgXa4QsxvM0Sn1LMXWhiNPM+t2Bxv16aqYAYKp1UEc+WVcbrFKPng=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754578547; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JKRdJLGUj9Od4PZ1bJSUD3AJ1d9/oez5hpVVsvtc70M=; 
	b=dF6nGJqZGYlRvyvEuxqSV1huiZCvRkK3DQdHL16MSLF5IQRHXGKJWZJYIuAHq5za49TmSNVHsvONsaw+jTKC6QuFtWiC9IpudDBiRDSq1YJ4pX42HVPZxqTOlOjR9/tvxinMmU+19YAxFpdlSVMQDdkKllUvs3TJ5gX5ggeNjP8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754578547;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=JKRdJLGUj9Od4PZ1bJSUD3AJ1d9/oez5hpVVsvtc70M=;
	b=pN0VINF+OQy6IjFyFEryWKQxXmJDpRrH8MhB+XB/pO63WeYsfioK7rOhRsmHOpYB
	rh60KTI7duy247CE6l/FsqTAH/wFJ5G+YnHs8ni3TlXNOXa1uztLmn3gD+uWt+2YVEE
	tG9IT/218OS/a8tUreX5p6YJpwImvg5Cp0fCdsn0=
Received: by mx.zohomail.com with SMTPS id 1754578544733826.0027839889475;
	Thu, 7 Aug 2025 07:55:44 -0700 (PDT)
Message-ID: <a90584179f4c90cd58c03051280a6dda63f6cc1d.camel@rong.moe>
Subject: Re: [PATCH 2/2] platform/x86: ideapad-laptop: Fully support auto
 kbd backlight
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Ike Panhc <ikepanhc@gmail.com>, "Derek J . Clark"	
 <derekjohn.clark@gmail.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>, 
 "platform-driver-x86@vger.kernel.org"	
 <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, Lee
 Jones	 <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-leds@vger.kernel.org
In-Reply-To: <08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fastmail.com>
References: <20250805140131.284122-1-i@rong.moe>
	 <20250805140131.284122-3-i@rong.moe>
	 <08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 07 Aug 2025 22:50:37 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.1-1 
X-ZohoMailClient: External

Hi Mark,

On Wed, 2025-08-06 at 15:02 -0400, Mark Pearson wrote:
> Hi Rong,
>=20
> On Tue, Aug 5, 2025, at 10:01 AM, Rong Zhang wrote:
> > Currently, the auto brightness mode of keyboard backlight maps to
> > brightness=3D0 in LED classdev. The only method to switch to such a mod=
e
> > is by pressing the manufacturer-defined shortcut (Fn+Space). However, 0
> > is a multiplexed brightness value; writing 0 simply results in the
> > backlight being turned off.
> >=20
> > With brightness processing code decoupled from LED classdev, we can now
> > fully support the auto brightness mode. In this mode, the keyboard
> > backlight is controlled by the EC according to the ambient light sensor
> > (ALS).
> >=20
> > To utilize this, a sysfs node is exposed to the userspace:
> > /sys/class/leds/platform::kbd_backlight/als_enabled. The name is chosen
> > to align with dell-laptop, which provides a similar feature.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> >  .../ABI/testing/sysfs-platform-ideapad-laptop | 12 ++++
> >  drivers/platform/x86/lenovo/ideapad-laptop.c  | 65 ++++++++++++++++++-
> >  2 files changed, 75 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop=
=20
> > b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> > index 5ec0dee9e707..a2b78aa60aaa 100644
> > --- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> > +++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> > @@ -50,3 +50,15 @@ Description:
> >  		Controls whether the "always on USB charging" feature is
> >  		enabled or not. This feature enables charging USB devices
> >  		even if the computer is not turned on.
> > +
> > +What:		/sys/class/leds/platform::kbd_backlight/als_enabled
> > +Date:		July 2025
> > +KernelVersion:	6.17
> > +Contact:	platform-driver-x86@vger.kernel.org
> > +Description:
> > +		This file allows to control the automatic keyboard
> > +		illumination mode on some systems that have an ambient
> > +		light sensor. Write 1 to this file to enable the auto
> > +		mode, 0 to disable it. In this mode, the actual
> > +		brightness level is not available and reading the
> > +		"brightness" file always returns 0.
> > diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c=20
> > b/drivers/platform/x86/lenovo/ideapad-laptop.c
> > index 5014c1d0b633..49f2fc68add4 100644
> > --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> > +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> > @@ -1712,6 +1712,57 @@ static void ideapad_kbd_bl_notify(struct=20
> > ideapad_private *priv)
> >  	ideapad_kbd_bl_notify_known(priv, brightness);
> >  }
> >=20
> > +static ssize_t als_enabled_show(struct device *dev,
> > +				struct device_attribute *attr,
> > +				char *buf)
> > +{
> > +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > +	struct ideapad_private *priv =3D container_of(led_cdev, struct=20
> > ideapad_private, kbd_bl.led);
> > +	int hw_brightness;
> > +
> > +	hw_brightness =3D ideapad_kbd_bl_hw_brightness_get(priv);
> > +	if (hw_brightness < 0)
> > +		return hw_brightness;
> > +
> > +	return sysfs_emit(buf, "%d\n", hw_brightness =3D=3D=20
> > KBD_BL_AUTO_MODE_HW_BRIGHTNESS);
> > +}
> > +
> > +static ssize_t als_enabled_store(struct device *dev,
> > +				 struct device_attribute *attr,
> > +				 const char *buf, size_t count)
> > +{
> > +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > +	struct ideapad_private *priv =3D container_of(led_cdev, struct=20
> > ideapad_private, kbd_bl.led);
> > +	bool state;
> > +	int err;
> > +
> > +	err =3D kstrtobool(buf, &state);
> > +	if (err)
> > +		return err;
> > +
> > +	/*
> > +	 * Auto (ALS) mode uses a predefined HW brightness value. It is
> > +	 * impossible to disable it without setting another brightness value.
> > +	 * Set the brightness to 0 when disabling is requested.
> > +	 */
> > +	err =3D ideapad_kbd_bl_hw_brightness_set(priv, state ?=20
> > KBD_BL_AUTO_MODE_HW_BRIGHTNESS : 0);
> > +	if (err)
> > +		return err;
> > +
> > +	/* Both HW brightness values map to 0 in the LED classdev. */
> > +	ideapad_kbd_bl_notify_known(priv, 0);
> > +
> > +	return count;
> > +}
> > +
> > +static DEVICE_ATTR_RW(als_enabled);
> > +
> > +static struct attribute *ideapad_kbd_bl_als_attrs[] =3D {
> > +	&dev_attr_als_enabled.attr,
> > +	NULL,
> > +};
> > +ATTRIBUTE_GROUPS(ideapad_kbd_bl_als);
> > +
> >  static int ideapad_kbd_bl_init(struct ideapad_private *priv)
> >  {
> >  	int brightness, err;
> > @@ -1722,10 +1773,20 @@ static int ideapad_kbd_bl_init(struct=20
> > ideapad_private *priv)
> >  	if (WARN_ON(priv->kbd_bl.initialized))
> >  		return -EEXIST;
> >=20
> > -	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type)) {
> > +	switch (priv->kbd_bl.type) {
> > +	case KBD_BL_TRISTATE_AUTO:
> > +		/* The sysfs node will be=20
> > /sys/class/leds/platform::kbd_backlight/als_enabled */
> > +		priv->kbd_bl.led.groups =3D ideapad_kbd_bl_als_groups;
> > +		fallthrough;
> > +	case KBD_BL_TRISTATE:
> >  		priv->kbd_bl.led.max_brightness =3D 2;
> > -	} else {
> > +		break;
> > +	case KBD_BL_STANDARD:
> >  		priv->kbd_bl.led.max_brightness =3D 1;
> > +		break;
> > +	default:
> > +		/* This has already been validated by ideapad_check_features(). */
> > +		unreachable();
> >  	}
> >=20
> >  	brightness =3D ideapad_kbd_bl_brightness_get(priv);
> > --=20
> > 2.50.1
>=20
> We're looking to implement this feature on the Thinkpads, so this change =
is timely :)

Whoo, it's good to hear that.

> I did wonder if we should be making changes at the LED class level? Somet=
hing similar to LED_BRIGHT_HW_CHANGED maybe as a way to advertise that auto=
 mode is supported and some hooks to support that in sysfs?

To the best of my knowledge, there is already an ideal model to fit the
auto brightness mode, which is private LED trigger.

To utilize it, these are four pieces of the puzzle:

(1) implement a private LED trigger (see leds-cros_ec and
    leds-turris-omnia, for example)
(2) turn on/off the auto brightness mode when the activate/deactivate
    hooks are called
(3) switch to the private LED trigger/the "none" trigger when such mode
    is turned on/off by the HW (i.e., when Fn+Space is pressed)
(4) notifying the userspace of the HW-triggered LED trigger change

I'd finished (1) and (2) in my early experiments and verified their
functionality. However, I eventually realized the dilemma that pressing
Fn+Space would bring everything into an inconsistent state because of
the lack of (3).

For (3), when the HW turns on the auto brightness mode, we need:

   mutex_lock(&led_cdev->led_access);
  =20
   down_write(&led_cdev->trigger_lock);
   led_trigger_set(led_cdev, <THE PRIVATE LED TRIGGER>);
   up_write(&led_cdev->trigger_lock);
  =20
   mutex_unlock(&led_cdev->led_access);

When off, we need:

   mutex_lock(&led_cdev->led_access);
  =20
   led_trigger_remove(led_cdev);
  =20
   mutex_unlock(&led_cdev->led_access);

I never thought of (4) at that moment. Therefore, I eventually doubted
whether it was worth so much overhead and turned to the method in the
current patch.

Think twice now, I think it is worth implementing (1)-(3) as long as
(4) can be addressed. I just found that both led_trigger_set() and
led_trigger_remove() send a uevent once the trigger is changed [1], and
verified this using `udevadm monitor'. We have collected all four
pieces of the puzzle, hooray!

If you are OK with the private LED trigger approach, I will adopt it in
[PATCH v2].

[1]: commit 52c47742f79d ("leds: triggers: send uevent when changing
triggers")

> I know it would be more work, but I'm guessing this is going to be a comm=
on feature across multiple vendors it might need doing at a common layer.

CC'ing LED class maintainers.

Private LED triggers currently have two users: leds-cros_ec and leds-
turris-omnia. Their private triggers are respectively named "chromeos-
auto" and "omnia-mcu".

I agree that this is going to be a common feature. A generic name for
such a feature helps userspace [2] identify it. What about introducing
a namespace for private LED triggers, so that we can name these
triggers like "hw-driven:driver-specific-name"?

[2]: AFAIK, KDE Plasma already includes kbd_backlight in its battery
panel (Plasma 5) or brightness panel (Plasma 6).

> As a note - on the Thinkpads we've had to look at getting the correct Int=
el ISH firmware loaded (and we're working on getting that upstream to linux=
-firmware). Is that needed on the Ideapads for the feature to work well or =
not?

My device (ThinkBook 14 G7+ ASP) has an AMD Ryzen CPU, so the answer
about Intel ISH firmware is apparent :P

It has two sensor hubs [3]. The ALS sensor is under the AMD Sensor
Fusion Hub (SFH). The auto brightness mode=C2=A0requires the amd_sfh driver
to be loaded to work properly, but does *not* need the kernel to load
the firmware. More details below.

* AMD Sensor Fusion Hub 1.1 (1022:164a, driver: amd_sfh -> hid-sensor-
hub):
`` amd_sfh registers=C2=A0a standard HID sensor hub virtual device, which i=
s
then used by hid-sensor-hub.
`` Checking the source code of amd_sfh,=C2=A0it doesn't use the firmware
subsystem, so SFH1.1 seems to have the firmware built into the
platform.
`` Firmware version: 0xb000026.

-- Ambient Light Sensor (ALS, driver: hid-sensor-als):
``` hid-sensor-als registers an IIO device. It can be monitored via
iio-sensor-proxy [4].
``` The EC can't collect data from it until amd_sfh is loaded. Manually
unloading (rmmod) amd_sfh also breaks the data availability.

* Ideapad HID sensor hub (IDEA5003/048D:5003, driver: i2c-hid-acpi
-> hid-sensor-hub):
`` No IIO sensor is registered because all HID Usages used to pass
sensor values are vendor-specific.
`` The only way to monitor it is HIDRAW.

-- Human Presence Detection sensor (HPD, driver: hid-sensor-custom):
``` sensor-model=3DBIOMETRIC_HUMAN_DETECTION
``` friendly-name=3DAMS_TMF882X HOD V2010 Sensor
``` sensor-description=3D2.4 HOR0.0.19
``` The EC uses it to wake the device from S0ix (s2idle) on human
approach.
``` I've managed to figure out how to parse its reports to get the
distance between the human body=C2=A0and the device, as well as its
confidence.

-- Unknown sensor (driver: hid-sensor-custom):
``` sensor-model=3DLENOVO
``` friendly-name=3DLenovo AMS_HPD V0302 Sensor
``` sensor-manufacturer=3DLENOVO
``` It reports an increasing number periodically.

-- Unknown sensor (driver: hid-sensor-custom):
``` sensor-model=3DLenovo Customized Gest
``` friendly-name=3DLenovo AMS_GESTRUE V0209 Sensor
``` sensor-manufacturer=3DLENOVO
``` It never sends any HID report.

[3]: Maybe this is a workaround so that the EC can collect data from
the HPD sensor in S0ix, otherwise this is so weird to have two separate
sensor hubs since AMD SFH also supports HPD sensors. But the wake-on-
human-presence feature is already weird anyway - my device wakes itself
when I am napping at the desk :-/ Zzz...
[4]: https://gitlab.freedesktop.org/hadess/iio-sensor-proxy

I will just stop here as this somehow becomes off-topic. If you need
more information about my device (or if you can provide some
information for me, big thanks \o/), feel free to email me in private.

> Mark

Thanks,
Rong

