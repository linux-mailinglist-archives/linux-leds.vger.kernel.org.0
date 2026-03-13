Return-Path: <linux-leds+bounces-7321-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLelGo4btGlLhQAAu9opvQ
	(envelope-from <linux-leds+bounces-7321-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 15:13:34 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B15D284AA9
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 15:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C7F723039349
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 14:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A3A336EF8;
	Fri, 13 Mar 2026 14:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="NvWzR4vc"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A55336897;
	Fri, 13 Mar 2026 14:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410829; cv=pass; b=W7kOttGeu8182otw2kyR0TfsDBbGMiJ0fa7ck2pYBprOMbTFK0tA6bkNPD0zilerUl/zsHy7m3Blboi3FnNCxrW+INX6QhzsQg2DbKOZA5N+fohZsx7j/Gwd+8dWJXRFllZOfaKpx5kAm1AXthbHLtcQXLpFQiHf9KUgqxgOIyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410829; c=relaxed/simple;
	bh=Kbl62KfTBbJUs63U2Ey9/7LsYvg/EQE7Kwc8o2+lCPs=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cHi7E56GgQk01JrTzWE4rclCh+UyCgg00F5HJXMqewlUtjfrmY9os8kc9GU+HUVvgej9BE8VObf18Zg+98ML/DEjQ93BtmFviPK/3SSG5NY8yA6nAqy064GQWTY3pdy/5+RpXsNbvP+EPvdvvmU6v8J9dCXqGO1S+yaD5Bz9rmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=NvWzR4vc; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1773410802; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ASUSC+S1pSfJgf+YZj5ABBQVlBfAy61xnGR69VSKsiX6YZiPUZm1WSiWKLmJg1P14psUH/ASi0ePd5dbGA6R/f7DxpDHLTVNkT5Xj/EG1wayN4OIMSJqKOURsC5dvZF0xQKcx040XCNozxUq9AFSZmIUfOOwjUHN8aAA/6U5tb0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773410802; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sT6YL4SpV5qZLP3xa6B3vMJCpwG/CwIjm3yJriuXNlU=; 
	b=Z7gf+xVQ3FHQAzPhInUwaMcTgk0rEihkV59ccL4BHG2APuhhMkqfY23jxfgelkX6TLUufYlBGTd5VBzJ6GR3c6d/NjQl9zdAW9wer8QoJ3tQTHeyEyhZgH3KezdULvVBkZcZfSC3OdRjXwu3jYUCh5wNSH4BwlrBNipxFFT0mv0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773410802;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=sT6YL4SpV5qZLP3xa6B3vMJCpwG/CwIjm3yJriuXNlU=;
	b=NvWzR4vcPobbzn+QneqFmXmKuCkmJPqTqXrs2NVdCBUOtkdjky7TVmbyh00vm7tf
	lQtJakmdSU4OBMS3G/wjO17nmgWnT0MMQwEQDYSAbwaSfqxz4NMR2Oep+cJgJRmmz7A
	4EaLoh133rbdYP47av6ZTWGDL+h8Mnzve3T9B3iIvCpkJn+qHkIAjXfA5tdartnd+Jj
	grCRiZWftYMXcdO4o0rForlztLa+wJiY7dpuAhOBPa/WOV0YhBSZNUroPAhM0vnMjiP
	hM+khObQLGPDgIxYMsFxX5NkGmaOBIPIw2tblLaRu0d9ReXCj8V1hk6biP+q14zaFap
	RFTfwlU3IQ==
Received: by mx.zohomail.com with SMTPS id 177341080046254.358240267811084;
	Fri, 13 Mar 2026 07:06:40 -0700 (PDT)
Message-ID: <cc4398e1512dceb531ba3bd5dd0d20cf2042bb84.camel@rong.moe>
Subject: Re: [RFC PATCH 1/9] leds: Load trigger modules on-demand if used
 as hw control trigger
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Andrew Lunn <andrew@lunn.ch>,
  Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=	
 <linux@weissschuh.net>, Benson Leung <bleung@chromium.org>, Guenter Roeck	
 <groeck@chromium.org>, Marek =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>, 
 "Derek J . Clark" <derekjohn.clark@gmail.com>, Hans de Goede
 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Ike Panhc <ikepanhc@gmail.com>, Vishnu
 Sankar	 <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	chrome-platform@lists.linux.dev, "platform-driver-x86@vger.kernel.org"	
 <platform-driver-x86@vger.kernel.org>
In-Reply-To: <4e839e55-4daa-45cd-b403-d1d6eae63d8d@app.fastmail.com>
References: <20260227190617.271388-1-i@rong.moe>
	 <20260227190617.271388-2-i@rong.moe>
	 <500dfc4b-ebd7-4637-bed0-130fc571923c@lunn.ch>
	 <b48993998e6e48d4448f8c6dc758f4e260d0f857.camel@rong.moe>
	 <353713de-b121-4e27-a46f-6ca1941888a6@lunn.ch>
	 <8b25e1ea9bff414442fa47475b9c9ac5b29049d7.camel@rong.moe>
	 <60e60c42-f776-424a-a5b4-7286d33175d1@lunn.ch>
	 <d2d321fe39c41ebd896eef63f3909df29f5a1622.camel@rong.moe>
	 <4e839e55-4daa-45cd-b403-d1d6eae63d8d@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Mar 2026 22:01:19 +0800
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7321-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,weissschuh.net,chromium.org,gmail.com,linux.intel.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rong.moe:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kde.org:url,rong.moe:dkim,rong.moe:mid]
X-Rspamd-Queue-Id: 0B15D284AA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark,

On Thu, 2026-03-12 at 17:46 -0400, Mark Pearson wrote:
>=20
> On Thu, Mar 12, 2026, at 2:01 PM, Rong Zhang wrote:
> > Hi Andrew,
> >=20
> > On Wed, 2026-03-11 at 22:29 +0100, Andrew Lunn wrote:
> > > > We just can't prevent the EC from responding to the Fn+Space shortc=
ut.
> > > > So it's essentially user's choice to switch to the hw control trigg=
er
> > > > and make it offloaded to hardware (sorry if my cover letter and rep=
lies
> > > > didn't express this well).
> > >=20
> > > Do you have any control over the EC?
> > >=20
> > > You have a two bosses dilemma. You need to eliminate one of the
> > > bosses. Either the EC controls the LED, or Linux does. Having both
> > > controlling it is just going to work out badly.
> >=20
> > I agree that the manufacturers designed the interface poorly :-/
> >=20
> > I am not affiliated with any laptop manufacturers so I am just speaking
> > for myself:
> >=20
> > IMO the real boss is the user. Both the shortcut (Fn+Space) and the
> > ACPI interface are just "message channels" for the EC to know about the
> > user's choice.
> >=20
> > Being able to press such a shortcut always implies that the user is
> > physically in front of the device. In this case it no longer about
> > whether Linux or the EC controls the LED, but both should respect
> > user's choice. That was why brightness_hw_changed was introduced to
> > respect user's choice and pass it to the userspace. So far there has
> > been ~10 drivers utilizing the brightness_hw_changed interface.
> >=20
> I am affiliated with a laptop manufacturer :) Happy to take suggestions o=
n what should be improved or is missing (can't promise anything but happy t=
o consider it and take it for review).
>=20
> We can set the brightness, get the status, and the FW sends events when i=
t changes - all supported on Linux (for Lenovo devices). This looks like a =
pretty decent API to me. What is it missing?

IMO, one missing thing is that there's no approach for the OS to
prevent the EC from responding to Fn+Space. Hence no 100% pure software
control is possible. We end up have a mixed SW + EC control.

Another missing thing is that there's no approach for the OS to
query/set the ALS-to-brightness curve (or trip points, whatever you
call it) of the EC driven auto brightness mode. Therefore, should we
have a kernel mode ALS-based software trigger, we would never know if
our curve could be offloaded.

That being said, I don't think either of these two missing things is a
big deal, since most laptops (if not all) are just designed to work
like this and I don't think we would have a kernel mode ALS-based
software trigger any soon. No 100% pure software control wasn't, isn't
and shouldn't be a blocker of using an LED classdev. As I've said,
that's exactly why brightness_hw_changed was introduced.

>=20
> I don't understand the two bosses issue I'm afraid. The user ('Linux' in =
your description?) tells the EC what it wants the LED to be, and the EC doe=
s it. The EC is not a boss.

The "user" means the one (i.e., a human) who is using the device. And
"message channels" mean:

User -> pressing Fn+Space -> EC -> update keyboard backlight

User -> LED classdev / manufacturer utilities -> ACPI -> EC -> update
keyboard backlight

They are all about the user, as a human, tells their intention to the
device. Of course there may be some userspace software or kernel
trigger blinking the LED, but again, that's still the user's choice and
intention. Hence I don't think EC is a boss either, and the user is the
real boss.

>=20
> > >=20
> > > > As my previous reply said, it's common that an LED driver can't pre=
vent
> > > > hardware from changing its state autonomously. Prior to the
> > > > introduction of auto brightness mode, brightness_hw_changed is enou=
gh
> > > > to handle this. The issue only emerges when recent models start to
> > > > provide an auto brightness mode based on the ALS sensor.
> > >=20
> > > Do you have a software driven brightness mode based on an ALS? What
> > > API do you use to control this? Can you use that API, and accelerate
> > > it?
> >=20
> > All devices I've seen implement an EC driven auto brightness mode based
> > on an ALS.
> >=20
> > @Mark, do you know any device implementing a software driven auto
> > brightness mode?
> >=20
>=20
> I don't - to my knowledge in auto mode it's always driven by the HW/FW.

Thanks.

>=20
> If there was a SW approach it would read the sensor and set the brightnes=
s to low/medium/high (and not to auto) so I'm struggling to understand the =
issue here. What am I missing?

My understanding of Andrew's words (see also his previous replies) is:

   hw control trigger is fundamentally an accelerated (offloaded)
   software trigger. Only if there is a software-driven ALS-based
   trigger and the curve matches the FW one can we treat the auto
   brightness mode as a hw control trigger.

But those laptops with an ALS and keyboard backlight are not designed
to work like this, and the curve may be very specific to the ALS and
the luminance of the keyboard backlight. So I asked you to confirm if
there is any device designed to use an software driven auto brightness
mode (even under Windows).

Hmm, forgot to ask about that... Is there any device comes with ALS-
based auto brightness mode but Linux cannot read the the ALS? If such
devices exist, the "accelerated software trigger" model is no longer
relevant.

Also that's why we have private LED triggers -- it's useful when the
HW/FW has its own triggering functionality. For example, "cros-ec-led"
has a private trigger and declares it as its hw control trigger.

>=20
> > >=20
> > > > FYI, desktop environments (e.g., GNOME, KDE) can control the backli=
ght
> > > > brightness of keyboards through sliders and heavily depend on
> > > > brightness_hw_changed to update the sliders and display OSD once th=
e
> > > > shortcut is pressed.
> > >=20
> > > Hold up. Terminology problem. I'm a networking guy, i know networking
> > > terms. By slider, do you mean a software scroll bar sort of thing?=C2=
=A0
> >=20
> > Yes. See
> > https://blogs.kde.org/2024/09/04/brightness-controls-for-all-your-displ=
ays/
> >=20
> > (it was about display backlight but it also showed the keyboard one in
> > the same image)
> >=20
> > > I'm
> > > an XFCE users. I can control the display backlight with a slider on
> > > the battery charge applet. And i can use Fn F4/F5. I've not seen a
> > > software scroll bar for the keyboard backlight, but i think
> > > <CTRL><SPC> allows me to change the keyboard backlight.
> > >=20
> > > So we have a slider, which is purely software, Linux. And we have key
> > > presses, which you are calling shortcut, which the EC acts on, and
> > > might tell Linux, maybe, but not about the key press, but the action
> > > the EC took because of the key press.
> >=20
> > "might tell", "maybe"
> >=20
> > It always tells the OS that the state of keyboard backlight has
> > changed.
> >=20
> > >=20
> > > You have some API to the EC to ask it nicely to act on the software
> > > slide, but it is the EC which really controls the LED, not Linux.
> > >=20
> > > To me a Linux LED is a poor fit for what you want, and i think a
> > > trigger is even worse. The problems you have are because the
> > > LED+trigger model, plus using the hardware for acceleration, does not
> > > fit with the EC actually controlling the hardware.
> > >=20
> > > I would suggest you look at the API the EC exports and find a better
> > > model for it.
> >=20
> > An LED classdev may be unable to perfectly fit this, but nothing is
> > perfect and so far it's the best thing we have. It's a fortunate to
> > have the LED subsystem. Windows, without a similar interface, ends up
> > being filled with disgusting software pre-installed by the
> > manufacturer.
> >=20
>=20
> Afraid I don't understand what we are debating here.
>=20
> Isn't the whole goal of this patch to make it so LED classdev is a better=
 fit to address missing functionality? Why would switching to something els=
e (I have no idea what) be better? Especially given the the keyboard backli=
ght is currently a LED device, and changing that would potentially break th=
ings for users.
>=20
> From my perspective if I could just tear this out and have a Lenovo only =
keyboard_backlight implementation under (for example) /sys/devices/thinkpad=
_acpi it would be so much easier. But I don't think it is the right thing t=
o do. My experience is if we define a common approach then all vendors will=
 use it going forward - which is better for the Linux experience overall.
> Or we don't have fully implemented features for Linux users? That's kinda=
 sucky.

I agreed with you. Just some supplemental information:

ideapad-laptop has an custom attribute "fn_lock". This used to be
the=C2=A0only way for userspace to turn on/off FnLock. The attribute does
not support any notification mechanism.

Since devices with FnLock also come with an LED indicating the status
of FnLock, an LED classdev has been added with a new
LED_FUNCTION_FNLOCK macro for dt-bindings and UAPI. See commit
7ab6c64663a0 ("dt-bindings: leds: Add LED_FUNCTION_FNLOCK") and commit
07f48f668fac ("platform/x86: ideapad-laptop: add FnLock LED class
device"). Since then, userspace receives notifications through
brightness_hw_changed when the user presses Fn+Esc.

I think this shows that an LED classdev, as a common interface, has its
vitality even when being used in a very specific use case.

>=20
> I don't think the two bosses argument is valid (or at least I don't under=
stand it). Are there any other critical implementation details that make th=
is a poor choice and will bite us in the long run?
>=20
> I personally find the implementation more complicated than I originally e=
xpected, but having looked at it and understood better what Rong was propos=
ing I understand the benefits and I think it works. We're still checking it=
 out on Thinkpad to confirm that, but this patch is a RFC so I think that's=
 part of the process.
>=20
> > IMO the presence of brightness_hw_changed proves that an LED classdev,
> > as long as appropriate interfaces are provided, can work well with such
> > hardware. And I don't think there is too much difference between EC
> > setting a static brightness value due to a shortcut being pressed and
> > EC turning on/off the auto brightness mode due to the same shortcut --
> > if we can handle the former well, we can also implement a similar
> > mechanism for the latter.
> >=20
> >=20
> > Do you have any recommendations for a "better model"?
> >=20
> > Did you mean do not register LED classdevs at all? This isn't really
> > viable and will break userspace. Some drivers has been using LED
> > classdevs for keyboard backlight for over a decade. And many
> > `*::kbd_backlight' LEDs rely on brightness_hw_changed, so it's very
> > common that we can't take 100% control over EC. LED classdevs and EC-
> > controlled keyboard backlight have lived in harmony for a long time.
> >=20
> > If we still register the keybaord backlight as an LED classdev but use
> > a custom attribute to report/set the auto brightness mode. IMO this is
> > even uglier than LED+trigger, as writing to such a non-brightness
> > attribute will interfere with the brightness attribute and the active
> > trigger and vice versa. Even if we rule out the EC's action, such
> > interference still exists as long as users use the attribute.
> >=20
> >=20
> > As for the software-vs-hardware priority issue, how about adding an
> > attribute "hw_change_policy" so that users can select if the software
> > state should be always reimposed to hardware?
>=20
> Is this needed? When wouldn't this be the case?
>=20
> If the SW sets a specific brightness that should become the setting. It w=
ould override any previous choices and tell the HW that is what is wanted n=
ow - don't change it (until the user says otherwise).
> If we're in auto mode and the HW changes the brightness - it doesn't chan=
ge the setting from auto mode, just the reported brightness level if querie=
d.

My understanding of Andrew's words is:

   Linux LED should always be the boss. Tell the HW: don't change it *even
   if the user presses Fn+Space*. Failing to accomplish this means that we
   are in "a two bosses dilemma", hence "a Linux LED is a poor fit for
   what you want" and "a trigger is even worse".

Since Andrew cares about the software's precedence, the best thing we
can do is adding an attribute for users to select their preference. The
attribute's default value must not be reimpose, otherwise it breaks
existing userspace programs relying on brightness_hw_changed and
confuses most users.

But yeah, personally I don't think it's needed either. It's been 9
years since the introduction of brightness_hw_changed, and there's no
complaint about HW/FW overriding the software configured brightness.
After all, it's the user who decides to press the shortcut and asks the
EC to change the brightness or turn on/off the auto brightness mode.

Thanks,
Rong

>=20
> >=20
> > - If the policy is reimpose, calling
> > led_trigger_notify_hw_control_changed() or
> > led_classdev_notify_brightness_hw_changed() results in the software
> > state to be reimposed to the hardware and no event should reach
> > userspace.
> >=20
> > - Otherwise calling led_trigger_notify_hw_control_changed() or
> > led_classdev_notify_brightness_hw_changed() updates software state and
> > notifies userspace.
> >=20
> I feel like I'm missing something here - but it's been a long day :(
>=20
> Mark

