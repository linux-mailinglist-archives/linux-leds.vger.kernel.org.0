Return-Path: <linux-leds+bounces-5227-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21110B28747
	for <lists+linux-leds@lfdr.de>; Fri, 15 Aug 2025 22:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF7541C27ECA
	for <lists+linux-leds@lfdr.de>; Fri, 15 Aug 2025 20:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F672C0F74;
	Fri, 15 Aug 2025 20:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="rm4sVz3Q"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69B02BDC3E;
	Fri, 15 Aug 2025 20:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755290534; cv=pass; b=S2nqJ4B5tB0VfbuvSyQdemKwuTAK4/dQBi7h1o3e1BSlBDxDq0jLzquslYVI6JhQlwr/ugSTIrDOD9n1QRQOINuwmtJuWPpV35lKCyeXjwfJV5cXfSa4jGf9T9QVfmyS5mOGrf5FbC0r6ykZ+XNjgz+WPwsRyyRr4niZ8iAHFkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755290534; c=relaxed/simple;
	bh=A8rPWgk+6FhM3qlSrFPAFvdyvExZe/sw3qcOQVATgAw=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=U50AAc8M4d+w/41QYdogJqK5Tt2WrsJmcJoaPP26jdBk+oeuMYPzUkFWR9TNUL7kbosux4fN6aySThwkn+w0YZmJ8aCFMEeJRqMLHjtWq/c1tUgfaQPCK4k8yQImaiIaGrNIqHlPn8DL5/+TGEOyedE7LiwGCdjbgfxPjEtpnSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=rm4sVz3Q; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1755290517; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m0te/3NH/2qACYSfUsJEzZ3h4jnK7vp76bYuH9P/wjYa1DYGKhZesWn+sprhffT2oWUpEPMcT+nalw+13SGfsJWh2BOALKxJFnTy+4f8Ndth/fAe06vIedgP/nZzAeRyJr53qCEAFPh0gUAzLNzM8+LpMgFSs/vdJ6rV7XDIVlk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755290517; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BFVLLmSCb3ejuYxMMOD5XzM6WldxR2pv0Kx/uk69Wrk=; 
	b=GeXP0EFkFZB9jmchepoA7yDRg9/DiRiyXw3p3p3fddBWZ9YcDFuic6R1wlmrLXNsX2sS1CC5akwmfrdrV8Yb5xWGiE+4U0aH+qT1gG+f62hJ2EFt5xw2WVFf96gxEoAqZQJrSuMyqkbqyvJ1xMj+Eb2SuO4F28KP6znxBPhROOo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755290517;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=BFVLLmSCb3ejuYxMMOD5XzM6WldxR2pv0Kx/uk69Wrk=;
	b=rm4sVz3Q6Wxs0uCzFHQJ3xYBUaA4+74K3CdZ1uU6khV72OIElqlL1cR3rvGzKNYk
	nk1p9LqVgr3wSVu/pVTlFtic3RnMKhKJskVwuLuaL54KEDInmMQqw4F6SwpJIBLI8kS
	vwsUGaDmxDSxy20HtTibFG0myK3qxnY0OncGlG1I=
Received: by mx.zohomail.com with SMTPS id 175529051460026.599473595199242;
	Fri, 15 Aug 2025 13:41:54 -0700 (PDT)
Message-ID: <8a132e7473655ca0119af10339c63beb4df7c201.camel@rong.moe>
Subject: Re: [PATCH 2/2] platform/x86: ideapad-laptop: Fully support auto
 kbd backlight
From: Rong Zhang <i@rong.moe>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Mark
 Pearson	 <mpearson-lenovo@squebb.ca>
Cc: Ike Panhc <ikepanhc@gmail.com>, "Derek J . Clark"
	 <derekjohn.clark@gmail.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
In-Reply-To: <0210f27b-ac6f-4d4a-91cc-6a79eda89d15@app.fastmail.com>
References: <20250805140131.284122-1-i@rong.moe>
			 <20250805140131.284122-3-i@rong.moe>
			 <08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fastmail.com>
			 <a90584179f4c90cd58c03051280a6dda63f6cc1d.camel@rong.moe>
			 <0210f27b-ac6f-4d4a-91cc-6a79eda89d15@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 Aug 2025 04:36:48 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-2 
X-ZohoMailClient: External

Hi All,

On Fri, 2025-08-08 at 13:57 -0400, Mark Pearson wrote:
> Thanks Rong,
>=20
> On Thu, Aug 7, 2025, at 10:50 AM, Rong Zhang wrote:
> > Hi Mark,
> >=20
> > On Wed, 2025-08-06 at 15:02 -0400, Mark Pearson wrote:
> > > Hi Rong,
> > >=20
> > > On Tue, Aug 5, 2025, at 10:01 AM, Rong Zhang wrote:
> > > > Currently, the auto brightness mode of keyboard backlight maps to
> > > > brightness=3D0 in LED classdev. The only method to switch to such a=
 mode
> > > > is by pressing the manufacturer-defined shortcut (Fn+Space). Howeve=
r, 0
> > > > is a multiplexed brightness value; writing 0 simply results in the
> > > > backlight being turned off.
> > > >=20
> > > > With brightness processing code decoupled from LED classdev, we can=
 now
> > > > fully support the auto brightness mode. In this mode, the keyboard
> > > > backlight is controlled by the EC according to the ambient light se=
nsor
> > > > (ALS).
> > > >=20
> > > > To utilize this, a sysfs node is exposed to the userspace:
> > > > /sys/class/leds/platform::kbd_backlight/als_enabled. The name is ch=
osen
> > > > to align with dell-laptop, which provides a similar feature.
> > > >=20
> > > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > > ---
> > > >  .../ABI/testing/sysfs-platform-ideapad-laptop | 12 ++++
> > > >  drivers/platform/x86/lenovo/ideapad-laptop.c  | 65 +++++++++++++++=
+++-
> > > >  2 files changed, 75 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-lapto=
p=20
> > > > b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> > > > index 5ec0dee9e707..a2b78aa60aaa 100644
> > > > --- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> > > > +++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> > > > @@ -50,3 +50,15 @@ Description:
> > > >  		Controls whether the "always on USB charging" feature is
> > > >  		enabled or not. This feature enables charging USB devices
> > > >  		even if the computer is not turned on.
> > > > +
> > > > +What:		/sys/class/leds/platform::kbd_backlight/als_enabled
> > > > +Date:		July 2025
> > > > +KernelVersion:	6.17
> > > > +Contact:	platform-driver-x86@vger.kernel.org
> > > > +Description:
> > > > +		This file allows to control the automatic keyboard
> > > > +		illumination mode on some systems that have an ambient
> > > > +		light sensor. Write 1 to this file to enable the auto
> > > > +		mode, 0 to disable it. In this mode, the actual
> > > > +		brightness level is not available and reading the
> > > > +		"brightness" file always returns 0.
> > > > diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c=20
> > > > b/drivers/platform/x86/lenovo/ideapad-laptop.c
> > > > index 5014c1d0b633..49f2fc68add4 100644
> > > > --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> > > > +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> > > > @@ -1712,6 +1712,57 @@ static void ideapad_kbd_bl_notify(struct=20
> > > > ideapad_private *priv)
> > > >  	ideapad_kbd_bl_notify_known(priv, brightness);
> > > >  }
> > > >=20
> > > > +static ssize_t als_enabled_show(struct device *dev,
> > > > +				struct device_attribute *attr,
> > > > +				char *buf)
> > > > +{
> > > > +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > > > +	struct ideapad_private *priv =3D container_of(led_cdev, struct=
=20
> > > > ideapad_private, kbd_bl.led);
> > > > +	int hw_brightness;
> > > > +
> > > > +	hw_brightness =3D ideapad_kbd_bl_hw_brightness_get(priv);
> > > > +	if (hw_brightness < 0)
> > > > +		return hw_brightness;
> > > > +
> > > > +	return sysfs_emit(buf, "%d\n", hw_brightness =3D=3D=20
> > > > KBD_BL_AUTO_MODE_HW_BRIGHTNESS);
> > > > +}
> > > > +
> > > > +static ssize_t als_enabled_store(struct device *dev,
> > > > +				 struct device_attribute *attr,
> > > > +				 const char *buf, size_t count)
> > > > +{
> > > > +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > > > +	struct ideapad_private *priv =3D container_of(led_cdev, struct=
=20
> > > > ideapad_private, kbd_bl.led);
> > > > +	bool state;
> > > > +	int err;
> > > > +
> > > > +	err =3D kstrtobool(buf, &state);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	/*
> > > > +	 * Auto (ALS) mode uses a predefined HW brightness value. It is
> > > > +	 * impossible to disable it without setting another brightness va=
lue.
> > > > +	 * Set the brightness to 0 when disabling is requested.
> > > > +	 */
> > > > +	err =3D ideapad_kbd_bl_hw_brightness_set(priv, state ?=20
> > > > KBD_BL_AUTO_MODE_HW_BRIGHTNESS : 0);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	/* Both HW brightness values map to 0 in the LED classdev. */
> > > > +	ideapad_kbd_bl_notify_known(priv, 0);
> > > > +
> > > > +	return count;
> > > > +}
> > > > +
> > > > +static DEVICE_ATTR_RW(als_enabled);
> > > > +
> > > > +static struct attribute *ideapad_kbd_bl_als_attrs[] =3D {
> > > > +	&dev_attr_als_enabled.attr,
> > > > +	NULL,
> > > > +};
> > > > +ATTRIBUTE_GROUPS(ideapad_kbd_bl_als);
> > > > +
> > > >  static int ideapad_kbd_bl_init(struct ideapad_private *priv)
> > > >  {
> > > >  	int brightness, err;
> > > > @@ -1722,10 +1773,20 @@ static int ideapad_kbd_bl_init(struct=20
> > > > ideapad_private *priv)
> > > >  	if (WARN_ON(priv->kbd_bl.initialized))
> > > >  		return -EEXIST;
> > > >=20
> > > > -	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type)) {
> > > > +	switch (priv->kbd_bl.type) {
> > > > +	case KBD_BL_TRISTATE_AUTO:
> > > > +		/* The sysfs node will be=20
> > > > /sys/class/leds/platform::kbd_backlight/als_enabled */
> > > > +		priv->kbd_bl.led.groups =3D ideapad_kbd_bl_als_groups;
> > > > +		fallthrough;
> > > > +	case KBD_BL_TRISTATE:
> > > >  		priv->kbd_bl.led.max_brightness =3D 2;
> > > > -	} else {
> > > > +		break;
> > > > +	case KBD_BL_STANDARD:
> > > >  		priv->kbd_bl.led.max_brightness =3D 1;
> > > > +		break;
> > > > +	default:
> > > > +		/* This has already been validated by ideapad_check_features(). =
*/
> > > > +		unreachable();
> > > >  	}
> > > >=20
> > > >  	brightness =3D ideapad_kbd_bl_brightness_get(priv);
> > > > --=20
> > > > 2.50.1
> > >=20
> > > We're looking to implement this feature on the Thinkpads, so this cha=
nge is timely :)
> >=20
> > Whoo, it's good to hear that.
> >=20
> > > I did wonder if we should be making changes at the LED class level? S=
omething similar to LED_BRIGHT_HW_CHANGED maybe as a way to advertise that =
auto mode is supported and some hooks to support that in sysfs?
> >=20
> > To the best of my knowledge, there is already an ideal model to fit the
> > auto brightness mode, which is private LED trigger.
> >=20
> > To utilize it, these are four pieces of the puzzle:
> >=20
> > (1) implement a private LED trigger (see leds-cros_ec and
> >     leds-turris-omnia, for example)
> > (2) turn on/off the auto brightness mode when the activate/deactivate
> >     hooks are called
> > (3) switch to the private LED trigger/the "none" trigger when such mode
> >     is turned on/off by the HW (i.e., when Fn+Space is pressed)
> > (4) notifying the userspace of the HW-triggered LED trigger change
> >=20
> > I'd finished (1) and (2) in my early experiments and verified their
> > functionality. However, I eventually realized the dilemma that pressing
> > Fn+Space would bring everything into an inconsistent state because of
> > the lack of (3).
> >=20
> > For (3), when the HW turns on the auto brightness mode, we need:
> >=20
> >    mutex_lock(&led_cdev->led_access);
> >  =20
> >    down_write(&led_cdev->trigger_lock);
> >    led_trigger_set(led_cdev, <THE PRIVATE LED TRIGGER>);
> >    up_write(&led_cdev->trigger_lock);
> >  =20
> >    mutex_unlock(&led_cdev->led_access);
> >=20
> > When off, we need:
> >=20
> >    mutex_lock(&led_cdev->led_access);
> >  =20
> >    led_trigger_remove(led_cdev);
> >  =20
> >    mutex_unlock(&led_cdev->led_access);

After some careful consideration, I propose a new API for this:

static int __led_trigger_set(struct led_classdev *led_cdev, struct led_trig=
ger *trig,
			     bool hw_triggered)
{
	[...]
	if (led_cdev->trigger) {
	[...]
		if (trig || !hw_triggered)
			led_set_brightness(led_cdev, LED_OFF);
	}
	[...]
}

int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig=
)
{
	return __led_trigger_set(led_cdev, trig, false);
}

void led_trigger_notify_hw_control_changed(struct led_classdev *led_cdev, b=
ool activate)
{
	/* Callers are expected to acquire led_cdev->led_access first. */
	/* Hold led_cdev->trigger_lock, release when finish. */

	hc_trig =3D /* Search for the trigger named after led_cdev->hw_control_tri=
gger. */

	/* We have 6 possible situations to handle: */

	/* Hardware just activated hw control mode, while "none" is active */
	if (activate && !led_cdev->trigger)
		__led_trigger_set(led_cdev, hc_trig, true);

	/* Hardware just deactivated hw control mode, while hc_trig is active */
	else if (!activate && led_cdev->trigger =3D=3D hc_trig)
		__led_trigger_set(led_cdev, NULL, true);

	/* Hardware just activated hw control mode, while hc_trig is active */
	/* Hardware just activated hw control mode, while another trigger is activ=
e */
	/* Hardware just deactivated hw control mode, while "none" is active */
	/* Hardware just deactivated hw control mode, while another trigger is act=
ive */
}

void led_trigger_notify_hw_control_changed_fast(struct led_classdev *led_cd=
ev,
						struct led_trigger *hc_trig, bool activate)
{
	/*
	 * LED drivers with private trigger may call this, eliminating the need
	 * to search for hc_trig. Everything else is the same as
	 * led_trigger_notify_hw_control_changed.
	 */
}

I will send an RFC patchset for this when ready (probably in the next
week). For now, let me explain the new API:

1. If a keyboard is capable of adjusting its backlight automatically
according to ALS, a private trigger can excellently represent this
capability. However, most keyboards with auto backlight can also switch
it on and off upon user input, making the activation state of such
private triggers meaningless noise. This is a major blocker. If we
provide an API for HW-triggered LED trigger transition, I expect
various (future or existing) drivers for keyboards/laptops can adopt
it.

2. When HW deactivates hw control mode on its own, it may choose a
specific brightness instead of simply turning off the LED. We must keep
it unchanged, or else brightness cycling will be broken. In the case of
my ThinkBook, pressing Fn+Space cycles the keyboard backlight in the
following order: auto =3D> low =3D> high =3D> off =3D> auto. @Mark, how is =
the
case for IdeaPad/ThinkPad?

3. Only "hc_trig <=3D> none" transition is possible. Should we also
reactivate the current trigger if it is neither hw control trigger nor
"none"?

4. The API are void functions, since LED drivers are always responsible
for participating in the (de)activation sequence of hw control mode and
should collect enough information about the current status during their
participation.

5. The LED driver needs to be able to handle the activation sequence
even if the hardware is currently under hw control mode, and vice
versa. This shouldn't be a big problem since I suppose most LED
hardware is capable of entering/leaving hw control mode idempotently.
In case any driver needs it, the new API doesn't touch
led_cdev->led_access so that LED drivers can protect their housekeeping
work, preparing for the idempotence.

6. I am not very familiar with ledtrig-netdev. In my glance, it always
checks the HW state and initializes its options accordingly on
activation, so it is apparently non-idempotent. I think this is not a
big deal since there shouldn't be any NIC that would switch hw control
state for its LED on its own.

> > I never thought of (4) at that moment. Therefore, I eventually doubted
> > whether it was worth so much overhead and turned to the method in the
> > current patch.
> >=20
> > Think twice now, I think it is worth implementing (1)-(3) as long as
> > (4) can be addressed. I just found that both led_trigger_set() and
> > led_trigger_remove() send a uevent once the trigger is changed [1], and
> > verified this using `udevadm monitor'. We have collected all four
> > pieces of the puzzle, hooray!
> >=20
> > If you are OK with the private LED trigger approach, I will adopt it in
> > [PATCH v2].
> >=20
> > [1]: commit 52c47742f79d ("leds: triggers: send uevent when changing
> > triggers")
> >=20
> I'm not a LED expert, but your proposal (including details below) looks s=
ensible to me.

I will first incorporate this patch into the RFC patch mentioned above
to provide a reference usage and demonstrate the simplicity of this API
in use. When the discussion is settled, I will submit them separately.

> > > I know it would be more work, but I'm guessing this is going to be a =
common feature across multiple vendors it might need doing at a common laye=
r.
> >=20
> > CC'ing LED class maintainers.
> >=20
> excellent idea :)
>=20
> > Private LED triggers currently have two users: leds-cros_ec and leds-
> > turris-omnia. Their private triggers are respectively named "chromeos-
> > auto" and "omnia-mcu".
> >=20
> > I agree that this is going to be a common feature. A generic name for
> > such a feature helps userspace [2] identify it. What about introducing
> > a namespace for private LED triggers, so that we can name these
> > triggers like "hw-driven:driver-specific-name"?
> >=20
> > [2]: AFAIK, KDE Plasma already includes kbd_backlight in its battery
> > panel (Plasma 5) or brightness panel (Plasma 6).

When designing the above API, I realized that such a simple naming
trick has inherent flaws: it doesn't make sense for dual-role triggers.

The "netdev" trigger is either a software trigger or a hardware-driven
trigger, depending on the underlying LED hardware and trigger options.
It has an attribute "offloaded" for its dual-role capability.

Thus, I propose a read-only attribute "trigger_may_offload". It is
exposed when led_cdev->hw_control_trigger is defined. Its value depends
on the state of the hw control trigger:

- Offloaded: "[hw_control_trigger]"
- Active but not offloaded: "<hw_control_trigger>"
- Inactive: "hw_control_trigger"

In this way, it perfectly answers two questions (Which trigger? What is
its state?) from userspace at once. It can also be easily extended if
we (unfortunately) meet some HW with more than one possible hw control
trigger.

A new method led_trigger->offloaded() also needs to be introduced to
make the attribute useful. This should be easy.

I will send another RFC patchset for this when ready. This should be
independent of the one for led_trigger_notify_hw_control_changed since
their functionalities are orthogonal.

> > > As a note - on the Thinkpads we've had to look at getting the correct=
 Intel ISH firmware loaded (and we're working on getting that upstream to l=
inux-firmware). Is that needed on the Ideapads for the feature to work well=
 or not?
> >=20
> > My device (ThinkBook 14 G7+ ASP) has an AMD Ryzen CPU, so the answer
> > about Intel ISH firmware is apparent :P
> >=20
> Ah...yeah - that won't apply.
>=20
> > It has two sensor hubs [3]. The ALS sensor is under the AMD Sensor
> > Fusion Hub (SFH). The auto brightness mode=C2=A0requires the amd_sfh dr=
iver
> > to be loaded to work properly, but does *not* need the kernel to load
> > the firmware. More details below.
> >=20
> > * AMD Sensor Fusion Hub 1.1 (1022:164a, driver: amd_sfh -> hid-sensor-
> > hub):
> > `` amd_sfh registers=C2=A0a standard HID sensor hub virtual device, whi=
ch is
> > then used by hid-sensor-hub.
> > `` Checking the source code of amd_sfh,=C2=A0it doesn't use the firmwar=
e
> > subsystem, so SFH1.1 seems to have the firmware built into the
> > platform.
> > `` Firmware version: 0xb000026.
> >=20
> > -- Ambient Light Sensor (ALS, driver: hid-sensor-als):
> > ``` hid-sensor-als registers an IIO device. It can be monitored via
> > iio-sensor-proxy [4].
> > ``` The EC can't collect data from it until amd_sfh is loaded. Manually
> > unloading (rmmod) amd_sfh also breaks the data availability.
> >=20
> > * Ideapad HID sensor hub (IDEA5003/048D:5003, driver: i2c-hid-acpi
> > -> hid-sensor-hub):
> > `` No IIO sensor is registered because all HID Usages used to pass
> > sensor values are vendor-specific.
> > `` The only way to monitor it is HIDRAW.
> >=20
> > -- Human Presence Detection sensor (HPD, driver: hid-sensor-custom):
> > ``` sensor-model=3DBIOMETRIC_HUMAN_DETECTION
> > ``` friendly-name=3DAMS_TMF882X HOD V2010 Sensor
> > ``` sensor-description=3D2.4 HOR0.0.19
> > ``` The EC uses it to wake the device from S0ix (s2idle) on human
> > approach.
> > ``` I've managed to figure out how to parse its reports to get the
> > distance between the human body=C2=A0and the device, as well as its
> > confidence.
> >=20
> > -- Unknown sensor (driver: hid-sensor-custom):
> > ``` sensor-model=3DLENOVO
> > ``` friendly-name=3DLenovo AMS_HPD V0302 Sensor
> > ``` sensor-manufacturer=3DLENOVO
> > ``` It reports an increasing number periodically.
> >=20
> > -- Unknown sensor (driver: hid-sensor-custom):
> > ``` sensor-model=3DLenovo Customized Gest
> > ``` friendly-name=3DLenovo AMS_GESTRUE V0209 Sensor
> > ``` sensor-manufacturer=3DLENOVO
> > ``` It never sends any HID report.
> >=20
> I'll double check if/when we have any of this on the Thinkpads...I don't =
think we do, but I'm sure we will at some point.
>=20
> > [3]: Maybe this is a workaround so that the EC can collect data from
> > the HPD sensor in S0ix, otherwise this is so weird to have two separate
> > sensor hubs since AMD SFH also supports HPD sensors. But the wake-on-
> > human-presence feature is already weird anyway - my device wakes itself
> > when I am napping at the desk :-/ Zzz...
> > [4]: https://gitlab.freedesktop.org/hadess/iio-sensor-proxy
> >=20
> > I will just stop here as this somehow becomes off-topic. If you need
> > more information about my device (or if you can provide some
> > information for me, big thanks \o/), feel free to email me in private.
> >=20

Hi Mark,

> As side notes
>  - we are looking at the HPD stuff too...but that's a topic for another t=
hread ;)

So glad to hear that. I definitely want to write a driver for IDEA5003
sensor hub, but due to the lack of documentation and time, I put it
aside for the time being.

>  - If your system is waking itself - try the AMD debug tool (https://git.=
kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug-tools.git) and you mi=
ght be able to figure out which device is waking you up.
> I'll discuss the sensorhubs with the AMD folk too to get their input - I'=
m a bit behind on that. I'll ping you off thread if we can do something the=
re (and feel free to directly nag me if I don't send anything in the next c=
ouple of weeks...it's a bit hectic right now)

Thanks for your information. I had done some tests with amd-debug-tools
before, so I knew the wakeup interrupt was from EC due to=C2=A0the wake-on-
human-presence feature. I've disabled it somehow with Lenovo BaiYing[1]
and it's persistent. I didn't mention these in the previous reply
because I thought these were just trivial details. But again, thanks
for your information.

[1]: I suppose writing 0 to
/sys/bus/acpi/devices/IDEA5003:00/physical_node/0018:048D:5003.0002/HID
-SENSOR-*/enable_sensor can achieve the same effect.

> Thanks for all the details
> Mark

Thanks,
Rong

