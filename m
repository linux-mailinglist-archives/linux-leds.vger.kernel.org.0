Return-Path: <linux-leds+bounces-7316-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKfcBsEAs2mQRQAAu9opvQ
	(envelope-from <linux-leds+bounces-7316-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 19:06:57 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FB9276FF9
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 19:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60EAF305DD52
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 18:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45993FEB27;
	Thu, 12 Mar 2026 18:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="cvudioi/"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFA93EF66B;
	Thu, 12 Mar 2026 18:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773338805; cv=pass; b=mlMc+2d8CR0VvTN9C/w8iH4TlU6iBhab2ieb9ZsIRotM4J9d8knUYu2Uqe2e1/3vIynS8NXMj0k0STsFwKMGpRHMKnTslLgGM6XwRejEZxDJEZWDGoollK8tnXZ101i2uMlkdTiShkM+LZS/KP+t/0fzjXw3EZOCnPWf7etFM00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773338805; c=relaxed/simple;
	bh=ol++v5VK3UZFY+M5fv08Ur0c9M8H8+/uUzQ1TBacf5w=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MacvxgGgPzkIhfzHSNIGTN30TNnyw31C995pfS2IrKwisz486WPhUZznm+S3rVpcoF4HjPwFNy1vVqvbEvYXn8AvcAxj8DGIAvXFt15bS/W3EBmHlcfehRuSdUSXimR9lXgCa5yKobwLIorFoKxTPWAJHm/PY9lbLUHQQaVZe+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=cvudioi/; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1773338776; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PITOFhpfvOiw3FLjIDocqjadtL/A91lLuiGtXSlk7Gs1/UpqQIPZ8nSrMg1GLxhs/GPAItoDa5JnyddVK3pHlqQ4Gg3jEFW5L9bWLV3XV4W8rfJPdCJtf5vzIN7L1vwsCcG90IDSxgvuz3GkzZIa2IlDbPLfecJFYIvIMkPv+kE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773338776; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=c+mPd9aYy4Qf2xRIE1k7vKEf+HVZBoFcovi/fpON17g=; 
	b=DIJNjfkhMNBbsawwuvcdqh9cHYoD1pwiNte8aWfcjUkf7C8u4O4moNTKgzezjx+9fM7pXyNJGX7qNAQ2Y3I4mKckqAMzRxAe+evSeSivAYylT4oQB8ls654G9NCuj0/CUtIvj+7lqs20dphrIVX1oMHLCGBKzzS6uXe3PW0H4fo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773338776;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=c+mPd9aYy4Qf2xRIE1k7vKEf+HVZBoFcovi/fpON17g=;
	b=cvudioi/E/hfd/8mg6SEsqqesopl9Y74xhvtCyP4zvlnMg/YAZzR+jPs+rMSjff8
	zsarjd8GAZSpdldhyUJ24vjLAD0sOytE/THTvq/oWseu8MA934IT7w/oJDsRtMtCobJ
	g/sQHqwp4URzCuZRYfx1MgKtPqU8VJbHRLumwt/ydjhgETYyUki0e/GLBSi74VI7+T2
	5hkTq/0QLYhbsClYqQjh0nb2p3I/xmcx7cq3XHboVa3ktxjPqYm447SvoGG/UsFUkE3
	2ax920uQxMuDzpJmM1fGqg8dx3BurbyDeJLtwdqhAPuJNZSOEAF5ru0CQNdetZWObX6
	KjyliI2Idg==
Received: by mx.zohomail.com with SMTPS id 1773338773792527.3477460497177;
	Thu, 12 Mar 2026 11:06:13 -0700 (PDT)
Message-ID: <d2d321fe39c41ebd896eef63f3909df29f5a1622.camel@rong.moe>
Subject: Re: [RFC PATCH 1/9] leds: Load trigger modules on-demand if used
 as hw control trigger
From: Rong Zhang <i@rong.moe>
To: Andrew Lunn <andrew@lunn.ch>, Mark Pearson <mpearson-lenovo@squebb.ca>,
  Lee Jones <lee@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?=	 <linux@weissschuh.net>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck	 <groeck@chromium.org>, Marek
 =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,  "Derek J. Clark"
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>, Ike Panhc
 <ikepanhc@gmail.com>, Vishnu Sankar	 <vishnuocv@gmail.com>,
 vsankar@lenovo.com, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org
In-Reply-To: <60e60c42-f776-424a-a5b4-7286d33175d1@lunn.ch>
References: <20260227190617.271388-1-i@rong.moe>
		 <20260227190617.271388-2-i@rong.moe>
		 <500dfc4b-ebd7-4637-bed0-130fc571923c@lunn.ch>
		 <b48993998e6e48d4448f8c6dc758f4e260d0f857.camel@rong.moe>
		 <353713de-b121-4e27-a46f-6ca1941888a6@lunn.ch>
		 <8b25e1ea9bff414442fa47475b9c9ac5b29049d7.camel@rong.moe>
		 <60e60c42-f776-424a-a5b4-7286d33175d1@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Mar 2026 02:01:07 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7316-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,weissschuh.net,chromium.org,gmail.com,linux.intel.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[rong.moe:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kde.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C2FB9276FF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrew,

On Wed, 2026-03-11 at 22:29 +0100, Andrew Lunn wrote:
> > We just can't prevent the EC from responding to the Fn+Space shortcut.
> > So it's essentially user's choice to switch to the hw control trigger
> > and make it offloaded to hardware (sorry if my cover letter and replies
> > didn't express this well).
>=20
> Do you have any control over the EC?
>=20
> You have a two bosses dilemma. You need to eliminate one of the
> bosses. Either the EC controls the LED, or Linux does. Having both
> controlling it is just going to work out badly.

I agree that the manufacturers designed the interface poorly :-/

I am not affiliated with any laptop manufacturers so I am just speaking
for myself:

IMO the real boss is the user. Both the shortcut (Fn+Space) and the
ACPI interface are just "message channels" for the EC to know about the
user's choice.

Being able to press such a shortcut always implies that the user is
physically in front of the device. In this case it no longer about
whether Linux or the EC controls the LED, but both should respect
user's choice. That was why brightness_hw_changed was introduced to
respect user's choice and pass it to the userspace. So far there has
been ~10 drivers utilizing the brightness_hw_changed interface.

>=20
> > As my previous reply said, it's common that an LED driver can't prevent
> > hardware from changing its state autonomously. Prior to the
> > introduction of auto brightness mode, brightness_hw_changed is enough
> > to handle this. The issue only emerges when recent models start to
> > provide an auto brightness mode based on the ALS sensor.
>=20
> Do you have a software driven brightness mode based on an ALS? What
> API do you use to control this? Can you use that API, and accelerate
> it?

All devices I've seen implement an EC driven auto brightness mode based
on an ALS.

@Mark, do you know any device implementing a software driven auto
brightness mode?

>=20
> > FYI, desktop environments (e.g., GNOME, KDE) can control the backlight
> > brightness of keyboards through sliders and heavily depend on
> > brightness_hw_changed to update the sliders and display OSD once the
> > shortcut is pressed.
>=20
> Hold up. Terminology problem. I'm a networking guy, i know networking
> terms. By slider, do you mean a software scroll bar sort of thing?=C2=A0

Yes. See
https://blogs.kde.org/2024/09/04/brightness-controls-for-all-your-displays/

(it was about display backlight but it also showed the keyboard one in
the same image)

> I'm
> an XFCE users. I can control the display backlight with a slider on
> the battery charge applet. And i can use Fn F4/F5. I've not seen a
> software scroll bar for the keyboard backlight, but i think
> <CTRL><SPC> allows me to change the keyboard backlight.
>=20
> So we have a slider, which is purely software, Linux. And we have key
> presses, which you are calling shortcut, which the EC acts on, and
> might tell Linux, maybe, but not about the key press, but the action
> the EC took because of the key press.

"might tell", "maybe"

It always tells the OS that the state of keyboard backlight has
changed.

>=20
> You have some API to the EC to ask it nicely to act on the software
> slide, but it is the EC which really controls the LED, not Linux.
>=20
> To me a Linux LED is a poor fit for what you want, and i think a
> trigger is even worse. The problems you have are because the
> LED+trigger model, plus using the hardware for acceleration, does not
> fit with the EC actually controlling the hardware.
>=20
> I would suggest you look at the API the EC exports and find a better
> model for it.

An LED classdev may be unable to perfectly fit this, but nothing is
perfect and so far it's the best thing we have. It's a fortunate to
have the LED subsystem. Windows, without a similar interface, ends up
being filled with disgusting software pre-installed by the
manufacturer.

IMO the presence of brightness_hw_changed proves that an LED classdev,
as long as appropriate interfaces are provided, can work well with such
hardware. And I don't think there is too much difference between EC
setting a static brightness value due to a shortcut being pressed and
EC turning on/off the auto brightness mode due to the same shortcut --
if we can handle the former well, we can also implement a similar
mechanism for the latter.


Do you have any recommendations for a "better model"?

Did you mean do not register LED classdevs at all? This isn't really
viable and will break userspace. Some drivers has been using LED
classdevs for keyboard backlight for over a decade. And many
`*::kbd_backlight' LEDs rely on brightness_hw_changed, so it's very
common that we can't take 100% control over EC. LED classdevs and EC-
controlled keyboard backlight have lived in harmony for a long time.

If we still register the keybaord backlight as an LED classdev but use
a custom attribute to report/set the auto brightness mode. IMO this is
even uglier than LED+trigger, as writing to such a non-brightness
attribute will interfere with the brightness attribute and the active
trigger and vice versa. Even if we rule out the EC's action, such
interference still exists as long as users use the attribute.


As for the software-vs-hardware priority issue, how about adding an
attribute "hw_change_policy" so that users can select if the software
state should be always reimposed to hardware?

- If the policy is reimpose, calling
led_trigger_notify_hw_control_changed() or
led_classdev_notify_brightness_hw_changed() results in the software
state to be reimposed to the hardware and no event should reach
userspace.

- Otherwise calling led_trigger_notify_hw_control_changed() or
led_classdev_notify_brightness_hw_changed() updates software state and
notifies userspace.

Thanks,
Rong

>=20
> 	Andrew

