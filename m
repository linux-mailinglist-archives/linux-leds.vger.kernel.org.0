Return-Path: <linux-leds+bounces-5206-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B41B1EE16
	for <lists+linux-leds@lfdr.de>; Fri,  8 Aug 2025 19:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 042B33AF850
	for <lists+linux-leds@lfdr.de>; Fri,  8 Aug 2025 17:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318971F63CD;
	Fri,  8 Aug 2025 17:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="kOqWJ1Y8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Quyw9z0/"
X-Original-To: linux-leds@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19599199385;
	Fri,  8 Aug 2025 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754675868; cv=none; b=UzX4MVPDWGgBMuwNXM19K4zZgyRAq5E1Eh/JXbzP4i0WDzm9H+5qkDSviBr6MVhdsrWMQVRGw5T2xYoDapUkEhsH6nHJquBypk+kmLZ3EA/4IHmxLZYYf66QkWfzsrWpq6+EGOrGN0o6XG2yUBgUmMEbercYvqQo1kdCkXL5CEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754675868; c=relaxed/simple;
	bh=8iKlhI5u0xJ9MB37arZ80HAolzPQpl0I+f0OsYroVQ0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IhDhk2nrE/rmDbCwo3/TVMS81Xg/w5O63GSW2Gkebzhob7+Hqkn7ikWi9AFEO95xw/eXtUcHaGZPO4CD+nD2yqEcOEntVwrtEreL+rhC8NM544zPg9kygqJEtrfGSNgL3iGdchYut7++vGFZ1P95P6TDKkZYi8nHTGDzs4dsShg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=kOqWJ1Y8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Quyw9z0/; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 10025140006E;
	Fri,  8 Aug 2025 13:57:44 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Fri, 08 Aug 2025 13:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1754675864;
	 x=1754762264; bh=nhAqvx95VHcDJzl9Q2zl81kgw5uBGL9FSKYEYGuW8zI=; b=
	kOqWJ1Y81dWyureM1KTFHgTKabfr35gxxBE0BnXp5vDzkB5QM5EYzfDdS1OCdjRs
	H4oHkD7Z8swq0Jyq4MR/7YJUqXoWMhUQriDFK5KcPzNefV5wLhQ5Zypeym6x7W19
	r3X32RZVVMt6X6lRZ1FIF2c+vrsF+phR4yR+zPf3ICOaUzoZJ/h0E+dcy+LAKlPg
	pufV6Vk+ytC68YgdkaMwqUQGN+ja0qQs/zlvJK3gAmAkaAA1j6Cg+gYwiqiiZREd
	EKOEZlriqjc5/V+F0u9qxgd0gjQ8nzIYLrJ+FIS0vWYn8EAasso3Q/PLwIoTMNUs
	OVOhnHIvITKNPQyKO3SuRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754675864; x=
	1754762264; bh=nhAqvx95VHcDJzl9Q2zl81kgw5uBGL9FSKYEYGuW8zI=; b=Q
	uyw9z0/o5A/aLo9t2ebAz7b9wgGYUPuziXuOBVU8OcSrTfpquRcgyAyYtJxUw47U
	8L9rqJkYrI9FDiSQb8VMGJusrNy/Qe0N1bZtFfFDMHnlmwVfp8qW35v2AADNxK3c
	lmrC1o08HQBgY0suScVZor9nnb+pVfhnIeJkHr6QtuX2sdOXCkt8J8TM0DoF7Toc
	yG463D2CaPAJechHOR+NtintLjaF6HPpmHC7BqJcA96O/ne05jxtn6T7jGQkBriK
	G6d68s40ci0r8c8UFAAaMjUMEASBcoIVVzbMj5MbuITxvI97SmzMYQ/JTDTe/0r0
	lOR8SUrRnhx2ByyC7ujcw==
X-ME-Sender: <xms:lzqWaDhVyCzHoQRU0lyV4hl0j4z7_vqcZRNWvn94GdgL03XGcADetw>
    <xme:lzqWaAC1cnW7cLan1OezDCM-9MOTjQdAbrdadezSJzmE9Eli-W8TGjtIRB4RvRPku
    8RDv6SLjUxZujUGvq0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdeggeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpeekuedtjedvueffhfeigefhfedvtdelueeigeefuedt
    ueevkeegfffhlefgudeifeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrgh
    dpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnh
    gspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghr
    vghkjhhohhhnrdgtlhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhkvghprg
    hnhhgtsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrnhhsgheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrvh
    gvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnhes
    lhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisehrohhnghdrmhhovgdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhlvggushesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:lzqWaK7iVea1YVn9KMFOAJ7LiIEkVpuqjhOtAr7DObkHj6Fwl1SW5g>
    <xmx:lzqWaMgb8A-b_mP3xYHoYxQ1OP8gXMK0NivKj-wmE-73dKgalz8lpQ>
    <xmx:lzqWaA5XdoXrPuUeLY_1ksqc8Ahq9XEHzqx8WjTrmlfCuiKPRnyZew>
    <xmx:lzqWaBHATFqO03DIaA6oILWpv1jT84xqTMq9RF7QKsWDKkUWNKuR4g>
    <xmx:mDqWaFfE9Ij4Yw6qt6CvuoYP1W5JnqYLMZ2oL4j6zw3Xx8qftkWQki3e>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 988B52CE0071; Fri,  8 Aug 2025 13:57:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T64782356407e243d
Date: Fri, 08 Aug 2025 13:57:19 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>
Cc: "Ike Panhc" <ikepanhc@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hansg@kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "Lee Jones" <lee@kernel.org>,
 "Pavel Machek" <pavel@kernel.org>, linux-leds@vger.kernel.org
Message-Id: <0210f27b-ac6f-4d4a-91cc-6a79eda89d15@app.fastmail.com>
In-Reply-To: <a90584179f4c90cd58c03051280a6dda63f6cc1d.camel@rong.moe>
References: <20250805140131.284122-1-i@rong.moe>
 <20250805140131.284122-3-i@rong.moe>
 <08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fastmail.com>
 <a90584179f4c90cd58c03051280a6dda63f6cc1d.camel@rong.moe>
Subject: Re: [PATCH 2/2] platform/x86: ideapad-laptop: Fully support auto kbd backlight
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks Rong,

On Thu, Aug 7, 2025, at 10:50 AM, Rong Zhang wrote:
> Hi Mark,
>
> On Wed, 2025-08-06 at 15:02 -0400, Mark Pearson wrote:
>> Hi Rong,
>>=20
>> On Tue, Aug 5, 2025, at 10:01 AM, Rong Zhang wrote:
>> > Currently, the auto brightness mode of keyboard backlight maps to
>> > brightness=3D0 in LED classdev. The only method to switch to such a=
 mode
>> > is by pressing the manufacturer-defined shortcut (Fn+Space). Howeve=
r, 0
>> > is a multiplexed brightness value; writing 0 simply results in the
>> > backlight being turned off.
>> >=20
>> > With brightness processing code decoupled from LED classdev, we can=
 now
>> > fully support the auto brightness mode. In this mode, the keyboard
>> > backlight is controlled by the EC according to the ambient light se=
nsor
>> > (ALS).
>> >=20
>> > To utilize this, a sysfs node is exposed to the userspace:
>> > /sys/class/leds/platform::kbd_backlight/als_enabled. The name is ch=
osen
>> > to align with dell-laptop, which provides a similar feature.
>> >=20
>> > Signed-off-by: Rong Zhang <i@rong.moe>
>> > ---
>> >  .../ABI/testing/sysfs-platform-ideapad-laptop | 12 ++++
>> >  drivers/platform/x86/lenovo/ideapad-laptop.c  | 65 +++++++++++++++=
+++-
>> >  2 files changed, 75 insertions(+), 2 deletions(-)
>> >=20
>> > diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-lapto=
p=20
>> > b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
>> > index 5ec0dee9e707..a2b78aa60aaa 100644
>> > --- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
>> > +++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
>> > @@ -50,3 +50,15 @@ Description:
>> >  		Controls whether the "always on USB charging" feature is
>> >  		enabled or not. This feature enables charging USB devices
>> >  		even if the computer is not turned on.
>> > +
>> > +What:		/sys/class/leds/platform::kbd_backlight/als_enabled
>> > +Date:		July 2025
>> > +KernelVersion:	6.17
>> > +Contact:	platform-driver-x86@vger.kernel.org
>> > +Description:
>> > +		This file allows to control the automatic keyboard
>> > +		illumination mode on some systems that have an ambient
>> > +		light sensor. Write 1 to this file to enable the auto
>> > +		mode, 0 to disable it. In this mode, the actual
>> > +		brightness level is not available and reading the
>> > +		"brightness" file always returns 0.
>> > diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c=20
>> > b/drivers/platform/x86/lenovo/ideapad-laptop.c
>> > index 5014c1d0b633..49f2fc68add4 100644
>> > --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
>> > +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
>> > @@ -1712,6 +1712,57 @@ static void ideapad_kbd_bl_notify(struct=20
>> > ideapad_private *priv)
>> >  	ideapad_kbd_bl_notify_known(priv, brightness);
>> >  }
>> >=20
>> > +static ssize_t als_enabled_show(struct device *dev,
>> > +				struct device_attribute *attr,
>> > +				char *buf)
>> > +{
>> > +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>> > +	struct ideapad_private *priv =3D container_of(led_cdev, struct=20
>> > ideapad_private, kbd_bl.led);
>> > +	int hw_brightness;
>> > +
>> > +	hw_brightness =3D ideapad_kbd_bl_hw_brightness_get(priv);
>> > +	if (hw_brightness < 0)
>> > +		return hw_brightness;
>> > +
>> > +	return sysfs_emit(buf, "%d\n", hw_brightness =3D=3D=20
>> > KBD_BL_AUTO_MODE_HW_BRIGHTNESS);
>> > +}
>> > +
>> > +static ssize_t als_enabled_store(struct device *dev,
>> > +				 struct device_attribute *attr,
>> > +				 const char *buf, size_t count)
>> > +{
>> > +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>> > +	struct ideapad_private *priv =3D container_of(led_cdev, struct=20
>> > ideapad_private, kbd_bl.led);
>> > +	bool state;
>> > +	int err;
>> > +
>> > +	err =3D kstrtobool(buf, &state);
>> > +	if (err)
>> > +		return err;
>> > +
>> > +	/*
>> > +	 * Auto (ALS) mode uses a predefined HW brightness value. It is
>> > +	 * impossible to disable it without setting another brightness va=
lue.
>> > +	 * Set the brightness to 0 when disabling is requested.
>> > +	 */
>> > +	err =3D ideapad_kbd_bl_hw_brightness_set(priv, state ?=20
>> > KBD_BL_AUTO_MODE_HW_BRIGHTNESS : 0);
>> > +	if (err)
>> > +		return err;
>> > +
>> > +	/* Both HW brightness values map to 0 in the LED classdev. */
>> > +	ideapad_kbd_bl_notify_known(priv, 0);
>> > +
>> > +	return count;
>> > +}
>> > +
>> > +static DEVICE_ATTR_RW(als_enabled);
>> > +
>> > +static struct attribute *ideapad_kbd_bl_als_attrs[] =3D {
>> > +	&dev_attr_als_enabled.attr,
>> > +	NULL,
>> > +};
>> > +ATTRIBUTE_GROUPS(ideapad_kbd_bl_als);
>> > +
>> >  static int ideapad_kbd_bl_init(struct ideapad_private *priv)
>> >  {
>> >  	int brightness, err;
>> > @@ -1722,10 +1773,20 @@ static int ideapad_kbd_bl_init(struct=20
>> > ideapad_private *priv)
>> >  	if (WARN_ON(priv->kbd_bl.initialized))
>> >  		return -EEXIST;
>> >=20
>> > -	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type)) {
>> > +	switch (priv->kbd_bl.type) {
>> > +	case KBD_BL_TRISTATE_AUTO:
>> > +		/* The sysfs node will be=20
>> > /sys/class/leds/platform::kbd_backlight/als_enabled */
>> > +		priv->kbd_bl.led.groups =3D ideapad_kbd_bl_als_groups;
>> > +		fallthrough;
>> > +	case KBD_BL_TRISTATE:
>> >  		priv->kbd_bl.led.max_brightness =3D 2;
>> > -	} else {
>> > +		break;
>> > +	case KBD_BL_STANDARD:
>> >  		priv->kbd_bl.led.max_brightness =3D 1;
>> > +		break;
>> > +	default:
>> > +		/* This has already been validated by ideapad_check_features(). =
*/
>> > +		unreachable();
>> >  	}
>> >=20
>> >  	brightness =3D ideapad_kbd_bl_brightness_get(priv);
>> > --=20
>> > 2.50.1
>>=20
>> We're looking to implement this feature on the Thinkpads, so this cha=
nge is timely :)
>
> Whoo, it's good to hear that.
>
>> I did wonder if we should be making changes at the LED class level? S=
omething similar to LED_BRIGHT_HW_CHANGED maybe as a way to advertise th=
at auto mode is supported and some hooks to support that in sysfs?
>
> To the best of my knowledge, there is already an ideal model to fit the
> auto brightness mode, which is private LED trigger.
>
> To utilize it, these are four pieces of the puzzle:
>
> (1) implement a private LED trigger (see leds-cros_ec and
>     leds-turris-omnia, for example)
> (2) turn on/off the auto brightness mode when the activate/deactivate
>     hooks are called
> (3) switch to the private LED trigger/the "none" trigger when such mode
>     is turned on/off by the HW (i.e., when Fn+Space is pressed)
> (4) notifying the userspace of the HW-triggered LED trigger change
>
> I'd finished (1) and (2) in my early experiments and verified their
> functionality. However, I eventually realized the dilemma that pressing
> Fn+Space would bring everything into an inconsistent state because of
> the lack of (3).
>
> For (3), when the HW turns on the auto brightness mode, we need:
>
>    mutex_lock(&led_cdev->led_access);
>  =20
>    down_write(&led_cdev->trigger_lock);
>    led_trigger_set(led_cdev, <THE PRIVATE LED TRIGGER>);
>    up_write(&led_cdev->trigger_lock);
>  =20
>    mutex_unlock(&led_cdev->led_access);
>
> When off, we need:
>
>    mutex_lock(&led_cdev->led_access);
>  =20
>    led_trigger_remove(led_cdev);
>  =20
>    mutex_unlock(&led_cdev->led_access);
>
> I never thought of (4) at that moment. Therefore, I eventually doubted
> whether it was worth so much overhead and turned to the method in the
> current patch.
>
> Think twice now, I think it is worth implementing (1)-(3) as long as
> (4) can be addressed. I just found that both led_trigger_set() and
> led_trigger_remove() send a uevent once the trigger is changed [1], and
> verified this using `udevadm monitor'. We have collected all four
> pieces of the puzzle, hooray!
>
> If you are OK with the private LED trigger approach, I will adopt it in
> [PATCH v2].
>
> [1]: commit 52c47742f79d ("leds: triggers: send uevent when changing
> triggers")
>
I'm not a LED expert, but your proposal (including details below) looks =
sensible to me.

>> I know it would be more work, but I'm guessing this is going to be a =
common feature across multiple vendors it might need doing at a common l=
ayer.
>
> CC'ing LED class maintainers.
>
excellent idea :)

> Private LED triggers currently have two users: leds-cros_ec and leds-
> turris-omnia. Their private triggers are respectively named "chromeos-
> auto" and "omnia-mcu".
>
> I agree that this is going to be a common feature. A generic name for
> such a feature helps userspace [2] identify it. What about introducing
> a namespace for private LED triggers, so that we can name these
> triggers like "hw-driven:driver-specific-name"?
>
> [2]: AFAIK, KDE Plasma already includes kbd_backlight in its battery
> panel (Plasma 5) or brightness panel (Plasma 6).
>
>> As a note - on the Thinkpads we've had to look at getting the correct=
 Intel ISH firmware loaded (and we're working on getting that upstream t=
o linux-firmware). Is that needed on the Ideapads for the feature to wor=
k well or not?
>
> My device (ThinkBook 14 G7+ ASP) has an AMD Ryzen CPU, so the answer
> about Intel ISH firmware is apparent :P
>
Ah...yeah - that won't apply.

> It has two sensor hubs [3]. The ALS sensor is under the AMD Sensor
> Fusion Hub (SFH). The auto brightness mode=C2=A0requires the amd_sfh d=
river
> to be loaded to work properly, but does *not* need the kernel to load
> the firmware. More details below.
>
> * AMD Sensor Fusion Hub 1.1 (1022:164a, driver: amd_sfh -> hid-sensor-
> hub):
> `` amd_sfh registers=C2=A0a standard HID sensor hub virtual device, wh=
ich is
> then used by hid-sensor-hub.
> `` Checking the source code of amd_sfh,=C2=A0it doesn't use the firmwa=
re
> subsystem, so SFH1.1 seems to have the firmware built into the
> platform.
> `` Firmware version: 0xb000026.
>
> -- Ambient Light Sensor (ALS, driver: hid-sensor-als):
> ``` hid-sensor-als registers an IIO device. It can be monitored via
> iio-sensor-proxy [4].
> ``` The EC can't collect data from it until amd_sfh is loaded. Manually
> unloading (rmmod) amd_sfh also breaks the data availability.
>
> * Ideapad HID sensor hub (IDEA5003/048D:5003, driver: i2c-hid-acpi
> -> hid-sensor-hub):
> `` No IIO sensor is registered because all HID Usages used to pass
> sensor values are vendor-specific.
> `` The only way to monitor it is HIDRAW.
>
> -- Human Presence Detection sensor (HPD, driver: hid-sensor-custom):
> ``` sensor-model=3DBIOMETRIC_HUMAN_DETECTION
> ``` friendly-name=3DAMS_TMF882X HOD V2010 Sensor
> ``` sensor-description=3D2.4 HOR0.0.19
> ``` The EC uses it to wake the device from S0ix (s2idle) on human
> approach.
> ``` I've managed to figure out how to parse its reports to get the
> distance between the human body=C2=A0and the device, as well as its
> confidence.
>
> -- Unknown sensor (driver: hid-sensor-custom):
> ``` sensor-model=3DLENOVO
> ``` friendly-name=3DLenovo AMS_HPD V0302 Sensor
> ``` sensor-manufacturer=3DLENOVO
> ``` It reports an increasing number periodically.
>
> -- Unknown sensor (driver: hid-sensor-custom):
> ``` sensor-model=3DLenovo Customized Gest
> ``` friendly-name=3DLenovo AMS_GESTRUE V0209 Sensor
> ``` sensor-manufacturer=3DLENOVO
> ``` It never sends any HID report.
>
I'll double check if/when we have any of this on the Thinkpads...I don't=
 think we do, but I'm sure we will at some point.

> [3]: Maybe this is a workaround so that the EC can collect data from
> the HPD sensor in S0ix, otherwise this is so weird to have two separate
> sensor hubs since AMD SFH also supports HPD sensors. But the wake-on-
> human-presence feature is already weird anyway - my device wakes itself
> when I am napping at the desk :-/ Zzz...
> [4]: https://gitlab.freedesktop.org/hadess/iio-sensor-proxy
>
> I will just stop here as this somehow becomes off-topic. If you need
> more information about my device (or if you can provide some
> information for me, big thanks \o/), feel free to email me in private.
>
As side notes
 - we are looking at the HPD stuff too...but that's a topic for another =
thread ;)
 - If your system is waking itself - try the AMD debug tool (https://git=
.kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug-tools.git) and yo=
u might be able to figure out which device is waking you up.
I'll discuss the sensorhubs with the AMD folk too to get their input - I=
'm a bit behind on that. I'll ping you off thread if we can do something=
 there (and feel free to directly nag me if I don't send anything in the=
 next couple of weeks...it's a bit hectic right now)

Thanks for all the details
Mark

