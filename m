Return-Path: <linux-leds+bounces-7319-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGArBtw0s2ntSwAAu9opvQ
	(envelope-from <linux-leds+bounces-7319-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 22:49:16 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 184BB27A4A9
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 22:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A53C33040AD9
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 21:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BED835DA49;
	Thu, 12 Mar 2026 21:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="jl+q5uzo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="01AQMSSf"
X-Original-To: linux-leds@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2609038B152;
	Thu, 12 Mar 2026 21:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351985; cv=none; b=WlmfWzbAQ56xq4pzdKF6kWCmizDtltgHXeGn2yaX880WC6ILoVRSJARjSDPZSpI2I+5/dY43eExCV6NhU+vl1R4d+OdBaLm52Rzq2T9RKgeRCONgRWPFD9SRFsT0ay4ihzYfCRnclE5yh8jeMqVizUc7TLYspfq88Tec+K//vUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351985; c=relaxed/simple;
	bh=CFwAfzB9Id9vJawmfUlHW+WNYj2Lc/gWnaTJV4yupmY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VJRh+tNMfxjRO34vyTJwnW7jqeMFgLkyjYWmAj25/aUvbxFlln7Nqg1bJbuc/u4fJW71hFMZgXPXmZCJpkQuhvHsu9oGGo52UhR3MSCv7PqZwTWr81G94bedxqyWwFKbMcUJGjhXwpmmmZS13L1Ltlg1YynWSbwRxrXIHIWqwV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=jl+q5uzo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=01AQMSSf; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3B024140027B;
	Thu, 12 Mar 2026 17:46:22 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Thu, 12 Mar 2026 17:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1773351982;
	 x=1773438382; bh=CFwAfzB9Id9vJawmfUlHW+WNYj2Lc/gWnaTJV4yupmY=; b=
	jl+q5uzoNAuXYG3zaYGiQAjjbLuSeZ2/ZX5km6pgmgjINnuzehjugZ9XocfWgDtF
	tFz2Ub4KOFjDNj0JxuqxMq87RPuD5L52BfB25COCg6vwNFQCMK5J8SlSOP5nmCfL
	VFPRNnNa9cQ0KLsbW2UZiqcOEO6VX6klu1LdbSmfw3Neoj8meR3SPURHnYCRUsZQ
	BMOF8FzEEQz3bJEFGJZdsWHGyjz/bAK65RwDF9jWWRHJL7nG0EyjxmpOUg/DSHRS
	fzr/yEZ/NEPYenRXqJQgKSPowILwXlgK6kmCHPb6c4SSCHW8QesurlfizQ+4tHzV
	DSwClYfrzw/ycHjffZra3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773351982; x=
	1773438382; bh=CFwAfzB9Id9vJawmfUlHW+WNYj2Lc/gWnaTJV4yupmY=; b=0
	1AQMSSfVJAiDGJ6FWWAr8SGR9Um1dRC2nHKvt64mNfa9lzTS3D+EirIlOp7pbu6a
	dxwupgFKvXyc+6i2CCxu8QN4ZWICz+F8jth+hEX3g3trF6MAua4LFfVgI3UcWYcf
	JWrxTw+QXq+p1YyfYWEkBdgLWURLTgjIPAp1UjSy8g5pwqAtwxLk7u1LWuoayi45
	fLZ+D1Oh3i0K/dq9BXStdNYFJ0WXYJwT2r2mTWDCkSC1WDX2/b9BIZwbvqULKg0p
	FIscDFPBG7WuwYcXZf8CrS/2iSFxVFBcD6WvNsnUAsN9ewd9ZTM6nCMpGVHRWOtg
	72HH11EztwVHxwaSOTbiQ==
X-ME-Sender: <xms:LTSzaT3HxtuyB62pE6cJN5X9ljDrtCYDLmjbCH2v-l7enZ69iVxXbg>
    <xme:LTSzac52bphNApxFjrT41uN19-ms02adQm1AVhtDpnZ8cUMGmb5jhJh31YvyOmo7l
    Q2zy1Pe0KRKFu9sYvrJ-SzLCJvMSogJ8Ht-xymCOSjHMlxt25TrnaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkeejkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpeehgfelkedujeeugffgudeffffhhfethfegvedtjeeu
    teellefghfefiefffeekudenucffohhmrghinhepkhguvgdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgv
    nhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopedukedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepsghlvghunhhgsegthhhrohhmihhumhdrohhrghdprhgt
    phhtthhopehgrhhovggtkhestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohepuggvrh
    gvkhhjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehikhgvphgr
    nhhhtgesghhmrghilhdrtghomhdprhgtphhtthhopehvihhshhhnuhhotghvsehgmhgrih
    hlrdgtohhmpdhrtghpthhtohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepkhgrsggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepphgrvhgvlheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:LTSzaWc3Njl25lKk4pel4aXHASIdVsDH84U2J9OPgc1YcR9lFok6BQ>
    <xmx:LTSzaYLXxnqz2UBmg5fnxkLS_jAD_FA-fhvDFlmO3JjLJrIBPFdNpQ>
    <xmx:LTSzaeuXxmkWzo6I8uCm7ZTIB1q0AOE8UlABRhUaI5QDTgPdm3YAgQ>
    <xmx:LTSzaaYuk2FTYoq9nBx6EQMqd3xsnDWbPuSIV-B23OLOWM6Z5lPsEQ>
    <xmx:LjSzaYmG5yu5-jgwRFaobjvYqeTV7PIWP02x6wzK4ZV7lQ35N6XGIuj9>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 316782CE0078; Thu, 12 Mar 2026 17:46:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Aq-ebexNQroV
Date: Thu, 12 Mar 2026 17:46:00 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Andrew Lunn" <andrew@lunn.ch>,
 "Lee Jones" <lee@kernel.org>
Cc: "Pavel Machek" <pavel@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Benson Leung" <bleung@chromium.org>, "Guenter Roeck" <groeck@chromium.org>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Ike Panhc" <ikepanhc@gmail.com>, "Vishnu Sankar" <vishnuocv@gmail.com>,
 "Vishnu Sankar" <vsankar@lenovo.com>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <4e839e55-4daa-45cd-b403-d1d6eae63d8d@app.fastmail.com>
In-Reply-To: <d2d321fe39c41ebd896eef63f3909df29f5a1622.camel@rong.moe>
References: <20260227190617.271388-1-i@rong.moe>
 <20260227190617.271388-2-i@rong.moe>
 <500dfc4b-ebd7-4637-bed0-130fc571923c@lunn.ch>
 <b48993998e6e48d4448f8c6dc758f4e260d0f857.camel@rong.moe>
 <353713de-b121-4e27-a46f-6ca1941888a6@lunn.ch>
 <8b25e1ea9bff414442fa47475b9c9ac5b29049d7.camel@rong.moe>
 <60e60c42-f776-424a-a5b4-7286d33175d1@lunn.ch>
 <d2d321fe39c41ebd896eef63f3909df29f5a1622.camel@rong.moe>
Subject: Re: [RFC PATCH 1/9] leds: Load trigger modules on-demand if used as hw control
 trigger
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.15 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[squebb.ca:s=fm2,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-7319-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[squebb.ca];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,weissschuh.net,chromium.org,gmail.com,linux.intel.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mpearson-lenovo@squebb.ca,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[squebb.ca:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 184BB27A4A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On Thu, Mar 12, 2026, at 2:01 PM, Rong Zhang wrote:
> Hi Andrew,
>
> On Wed, 2026-03-11 at 22:29 +0100, Andrew Lunn wrote:
>> > We just can't prevent the EC from responding to the Fn+Space shortc=
ut.
>> > So it's essentially user's choice to switch to the hw control trigg=
er
>> > and make it offloaded to hardware (sorry if my cover letter and rep=
lies
>> > didn't express this well).
>>=20
>> Do you have any control over the EC?
>>=20
>> You have a two bosses dilemma. You need to eliminate one of the
>> bosses. Either the EC controls the LED, or Linux does. Having both
>> controlling it is just going to work out badly.
>
> I agree that the manufacturers designed the interface poorly :-/
>
> I am not affiliated with any laptop manufacturers so I am just speaking
> for myself:
>
> IMO the real boss is the user. Both the shortcut (Fn+Space) and the
> ACPI interface are just "message channels" for the EC to know about the
> user's choice.
>
> Being able to press such a shortcut always implies that the user is
> physically in front of the device. In this case it no longer about
> whether Linux or the EC controls the LED, but both should respect
> user's choice. That was why brightness_hw_changed was introduced to
> respect user's choice and pass it to the userspace. So far there has
> been ~10 drivers utilizing the brightness_hw_changed interface.
>
I am affiliated with a laptop manufacturer :) Happy to take suggestions =
on what should be improved or is missing (can't promise anything but hap=
py to consider it and take it for review).

We can set the brightness, get the status, and the FW sends events when =
it changes - all supported on Linux (for Lenovo devices). This looks lik=
e a pretty decent API to me. What is it missing?

I don't understand the two bosses issue I'm afraid. The user ('Linux' in=
 your description?) tells the EC what it wants the LED to be, and the EC=
 does it. The EC is not a boss.

>>=20
>> > As my previous reply said, it's common that an LED driver can't pre=
vent
>> > hardware from changing its state autonomously. Prior to the
>> > introduction of auto brightness mode, brightness_hw_changed is enou=
gh
>> > to handle this. The issue only emerges when recent models start to
>> > provide an auto brightness mode based on the ALS sensor.
>>=20
>> Do you have a software driven brightness mode based on an ALS? What
>> API do you use to control this? Can you use that API, and accelerate
>> it?
>
> All devices I've seen implement an EC driven auto brightness mode based
> on an ALS.
>
> @Mark, do you know any device implementing a software driven auto
> brightness mode?
>

I don't - to my knowledge in auto mode it's always driven by the HW/FW.

If there was a SW approach it would read the sensor and set the brightne=
ss to low/medium/high (and not to auto) so I'm struggling to understand =
the issue here. What am I missing?

>>=20
>> > FYI, desktop environments (e.g., GNOME, KDE) can control the backli=
ght
>> > brightness of keyboards through sliders and heavily depend on
>> > brightness_hw_changed to update the sliders and display OSD once the
>> > shortcut is pressed.
>>=20
>> Hold up. Terminology problem. I'm a networking guy, i know networking
>> terms. By slider, do you mean a software scroll bar sort of thing?=C2=A0
>
> Yes. See
> https://blogs.kde.org/2024/09/04/brightness-controls-for-all-your-disp=
lays/
>
> (it was about display backlight but it also showed the keyboard one in
> the same image)
>
>> I'm
>> an XFCE users. I can control the display backlight with a slider on
>> the battery charge applet. And i can use Fn F4/F5. I've not seen a
>> software scroll bar for the keyboard backlight, but i think
>> <CTRL><SPC> allows me to change the keyboard backlight.
>>=20
>> So we have a slider, which is purely software, Linux. And we have key
>> presses, which you are calling shortcut, which the EC acts on, and
>> might tell Linux, maybe, but not about the key press, but the action
>> the EC took because of the key press.
>
> "might tell", "maybe"
>
> It always tells the OS that the state of keyboard backlight has
> changed.
>
>>=20
>> You have some API to the EC to ask it nicely to act on the software
>> slide, but it is the EC which really controls the LED, not Linux.
>>=20
>> To me a Linux LED is a poor fit for what you want, and i think a
>> trigger is even worse. The problems you have are because the
>> LED+trigger model, plus using the hardware for acceleration, does not
>> fit with the EC actually controlling the hardware.
>>=20
>> I would suggest you look at the API the EC exports and find a better
>> model for it.
>
> An LED classdev may be unable to perfectly fit this, but nothing is
> perfect and so far it's the best thing we have. It's a fortunate to
> have the LED subsystem. Windows, without a similar interface, ends up
> being filled with disgusting software pre-installed by the
> manufacturer.
>

Afraid I don't understand what we are debating here.

Isn't the whole goal of this patch to make it so LED classdev is a bette=
r fit to address missing functionality? Why would switching to something=
 else (I have no idea what) be better? Especially given the the keyboard=
 backlight is currently a LED device, and changing that would potentiall=
y break things for users.

From my perspective if I could just tear this out and have a Lenovo only=
 keyboard_backlight implementation under (for example) /sys/devices/thin=
kpad_acpi it would be so much easier. But I don't think it is the right =
thing to do. My experience is if we define a common approach then all ve=
ndors will use it going forward - which is better for the Linux experien=
ce overall.
Or we don't have fully implemented features for Linux users? That's kind=
a sucky.

I don't think the two bosses argument is valid (or at least I don't unde=
rstand it). Are there any other critical implementation details that mak=
e this a poor choice and will bite us in the long run?

I personally find the implementation more complicated than I originally =
expected, but having looked at it and understood better what Rong was pr=
oposing I understand the benefits and I think it works. We're still chec=
king it out on Thinkpad to confirm that, but this patch is a RFC so I th=
ink that's part of the process.

> IMO the presence of brightness_hw_changed proves that an LED classdev,
> as long as appropriate interfaces are provided, can work well with such
> hardware. And I don't think there is too much difference between EC
> setting a static brightness value due to a shortcut being pressed and
> EC turning on/off the auto brightness mode due to the same shortcut --
> if we can handle the former well, we can also implement a similar
> mechanism for the latter.
>
>
> Do you have any recommendations for a "better model"?
>
> Did you mean do not register LED classdevs at all? This isn't really
> viable and will break userspace. Some drivers has been using LED
> classdevs for keyboard backlight for over a decade. And many
> `*::kbd_backlight' LEDs rely on brightness_hw_changed, so it's very
> common that we can't take 100% control over EC. LED classdevs and EC-
> controlled keyboard backlight have lived in harmony for a long time.
>
> If we still register the keybaord backlight as an LED classdev but use
> a custom attribute to report/set the auto brightness mode. IMO this is
> even uglier than LED+trigger, as writing to such a non-brightness
> attribute will interfere with the brightness attribute and the active
> trigger and vice versa. Even if we rule out the EC's action, such
> interference still exists as long as users use the attribute.
>
>
> As for the software-vs-hardware priority issue, how about adding an
> attribute "hw_change_policy" so that users can select if the software
> state should be always reimposed to hardware?

Is this needed? When wouldn't this be the case?

If the SW sets a specific brightness that should become the setting. It =
would override any previous choices and tell the HW that is what is want=
ed now - don't change it (until the user says otherwise).
If we're in auto mode and the HW changes the brightness - it doesn't cha=
nge the setting from auto mode, just the reported brightness level if qu=
eried.

>
> - If the policy is reimpose, calling
> led_trigger_notify_hw_control_changed() or
> led_classdev_notify_brightness_hw_changed() results in the software
> state to be reimposed to the hardware and no event should reach
> userspace.
>
> - Otherwise calling led_trigger_notify_hw_control_changed() or
> led_classdev_notify_brightness_hw_changed() updates software state and
> notifies userspace.
>
I feel like I'm missing something here - but it's been a long day :(

Mark

