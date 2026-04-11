Return-Path: <linux-leds+bounces-7693-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKdeG8lp2mkx2QgAu9opvQ
	(envelope-from <linux-leds+bounces-7693-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 17:33:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A98D3E0ACD
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 17:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 619E030427EE
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 15:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1309386456;
	Sat, 11 Apr 2026 15:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="fddTkCoH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TyyGgspf"
X-Original-To: linux-leds@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EF3266565;
	Sat, 11 Apr 2026 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775921506; cv=none; b=ZdOab2PKH58nFAg8B8021N7qlrmcjNeTS5ibJN7VDyx8R8MPZaZ5FGdMHBcNllU86ao/uap2Ux9Vc7jzn92EPoicTBR68LJdUfZLf2pnMdVCUHWl6ka4pKjrl0fdQ2kg5KrcJSGlltlDjEMQ+5RcEbBF2JuvxYWiMYI5CvasKhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775921506; c=relaxed/simple;
	bh=3zfExYh/jlCqYlEMfDscKAW2c415tnf37aOCwtbfDm8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=TWXN7wX9JwapYlu46a2+ppf37XvU8qUdwpjZszhDv9NsJvjWfvuBSgHqNwNHUI0/QscryfUOZ/yl6jxEPCcnx1qUCIdrwHif4ETqWA5raw7iN2mAdhpuvM5qf6nIEEKt3gn7D5ZCaqZVmnoiqC8HO7XdT/OK9R79krV17y9cW1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=fddTkCoH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TyyGgspf; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 03E261D00070;
	Sat, 11 Apr 2026 11:31:42 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Sat, 11 Apr 2026 11:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775921502;
	 x=1776007902; bh=fJ8raC5M/6xWKBdtGU0bBF59cK2OLFJLClw37anQkAU=; b=
	fddTkCoHG5MWuskYn6O6oGNnhktSxZxKB3Xwp2CJlleU1wYX/CBok3Aj5vgMkwJ7
	B/lI+Zx55NeOjAIi5Bz5fKss9fmarKgS5kWL5M+wdQbsEY3TBW///y/bfyQcTeKa
	8eZ+34II/ntzQjalVnemCsF88HpGqyJQqpYACU/JW/N/1RFv67S28TZ+BLFL+1NX
	hGunmBE2I/GqADUKzReqnj86qKkggtZzxFL28/3MNGjeW0rpCM6VjzecZ9Et0anL
	B2WeAN20UhdrI4CXLoUi/ky7C/6lFyGma9UWgkHZSCELNM2uMY899VBtjEQj5+vW
	h94KbLGmKT7l3fGDXTLuJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775921502; x=
	1776007902; bh=fJ8raC5M/6xWKBdtGU0bBF59cK2OLFJLClw37anQkAU=; b=T
	yyGgspf9LBTZ9n9BVUJ45GLpYLnNBSJ/KQenP7boWxMgB6cCOXp2bbFZ7JQnQLeU
	diRNXM9wqe4YSBIgjfk8pAlzbcb2jtIcxM8Kr78Tx1Znw1J8mtK/uHAhVaezbYtv
	jLQ873iE7t9bF0+eEjgGe+nlfPAOWg0VeXjLLv1jwacpNtCUT8vtPQh1nyBkJ6Gj
	lLALSy4FHGKy4+JnsRN5LG4PLPQiHn2NunEBrdMfQRlkZmfp5z5oVggxJaMBityi
	f4aGytWvGPAuAAkFeAeD3RJ9z+jcnMJ/WwP6g5jLbHmJp5EQ1CW6U4gv+T9s0FQV
	uDIa1xWbY0Z9uJpcsyOTw==
X-ME-Sender: <xms:XmnaaUzDdpOpZV0Et9IXJ5KxEUlaQpo0aN_OXMtir4dTLwN1s4i6pA>
    <xme:XmnaaTFDpkq6aNv1_zN7uWUO3bprexFouzbcf86FZR7Cs5fd88xKKfYsz3EnRZcj9
    J-pTLFCWdbb3tURd3woQEKXKUJgLIeD0wN_qQ9ESfSEG33Ft8OvD0M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefvdejvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhephefgleekudejuefggfdufeffhffhtefhgeevtdejueet
    leelgffhfeeiffefkedunecuffhomhgrihhnpehkuggvrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghn
    ohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepudekpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopegslhgvuhhnghestghhrhhomhhiuhhmrdhorhhgpdhrtghp
    thhtohepghhrohgvtghksegthhhrohhmihhumhdrohhrghdprhgtphhtthhopeguvghrvg
    hkjhhohhhnrdgtlhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhkvghprghn
    hhgtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvhhishhhnhhuohgtvhesghhmrghilh
    drtghomhdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehkrggsvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvggvsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehprghvvghlsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:XmnaaZbq4al-4VeCH-4ykiIqNBAODUS1QGKdFzey3TX6uixmYM5VlQ>
    <xmx:XmnaaYVcMqjgvnKqU3qONNHlRbQlmQx8HQEad-2N9gi9kZvSPe6Fug>
    <xmx:XmnaaTLs0pI68QJC95oQCODyCiabJ9133Twu9-4T_7fotz1cP64a7w>
    <xmx:XmnaaeHa_jKUZI9e20WPS4QNMsZ4UAtTHoon3BYTeNL7ZTeSLZDHmA>
    <xmx:Xmnaabw5ZwhSSihE9sBugqr3KRDkRnI77nAGCXo8YBeDLI_peyAk_d4S>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 09AE72CE3F93; Sat, 11 Apr 2026 11:31:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Aq-ebexNQroV
Date: Sat, 11 Apr 2026 11:31:21 -0400
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
Message-Id: <7437cc09-7958-4172-aec2-4429cfa98141@app.fastmail.com>
In-Reply-To: <2ac0c46c-805d-4749-a6e0-94b16b104a72@app.fastmail.com>
References: <20260227190617.271388-1-i@rong.moe>
 <20260227190617.271388-2-i@rong.moe>
 <500dfc4b-ebd7-4637-bed0-130fc571923c@lunn.ch>
 <b48993998e6e48d4448f8c6dc758f4e260d0f857.camel@rong.moe>
 <353713de-b121-4e27-a46f-6ca1941888a6@lunn.ch>
 <8b25e1ea9bff414442fa47475b9c9ac5b29049d7.camel@rong.moe>
 <60e60c42-f776-424a-a5b4-7286d33175d1@lunn.ch>
 <d2d321fe39c41ebd896eef63f3909df29f5a1622.camel@rong.moe>
 <4e839e55-4daa-45cd-b403-d1d6eae63d8d@app.fastmail.com>
 <cc4398e1512dceb531ba3bd5dd0d20cf2042bb84.camel@rong.moe>
 <2ac0c46c-805d-4749-a6e0-94b16b104a72@app.fastmail.com>
Subject: Re: [RFC PATCH 1/9] leds: Load trigger modules on-demand if used as hw control
 trigger
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[squebb.ca,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[squebb.ca:s=fm3,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-7693-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,weissschuh.net,chromium.org,gmail.com,linux.intel.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mpearson-lenovo@squebb.ca,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[squebb.ca:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,squebb.ca:dkim,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 3A98D3E0ACD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026, at 3:02 PM, Mark Pearson wrote:
> On Fri, Mar 13, 2026, at 10:01 AM, Rong Zhang wrote:
>> Hi Mark,
>>
>> On Thu, 2026-03-12 at 17:46 -0400, Mark Pearson wrote:
>>>=20
>>> On Thu, Mar 12, 2026, at 2:01 PM, Rong Zhang wrote:
>>> > Hi Andrew,
>>> >=20
>>> > On Wed, 2026-03-11 at 22:29 +0100, Andrew Lunn wrote:
>>> > > > We just can't prevent the EC from responding to the Fn+Space s=
hortcut.
>>> > > > So it's essentially user's choice to switch to the hw control =
trigger
>>> > > > and make it offloaded to hardware (sorry if my cover letter an=
d replies
>>> > > > didn't express this well).
>>> > >=20
>>> > > Do you have any control over the EC?
>>> > >=20
>>> > > You have a two bosses dilemma. You need to eliminate one of the
>>> > > bosses. Either the EC controls the LED, or Linux does. Having bo=
th
>>> > > controlling it is just going to work out badly.
>>> >=20
>>> > I agree that the manufacturers designed the interface poorly :-/
>>> >=20
>>> > I am not affiliated with any laptop manufacturers so I am just spe=
aking
>>> > for myself:
>>> >=20
>>> > IMO the real boss is the user. Both the shortcut (Fn+Space) and the
>>> > ACPI interface are just "message channels" for the EC to know abou=
t the
>>> > user's choice.
>>> >=20
>>> > Being able to press such a shortcut always implies that the user is
>>> > physically in front of the device. In this case it no longer about
>>> > whether Linux or the EC controls the LED, but both should respect
>>> > user's choice. That was why brightness_hw_changed was introduced to
>>> > respect user's choice and pass it to the userspace. So far there h=
as
>>> > been ~10 drivers utilizing the brightness_hw_changed interface.
>>> >=20
>>> I am affiliated with a laptop manufacturer :) Happy to take suggesti=
ons on what should be improved or is missing (can't promise anything but=
 happy to consider it and take it for review).
>>>=20
>>> We can set the brightness, get the status, and the FW sends events w=
hen it changes - all supported on Linux (for Lenovo devices). This looks=
 like a pretty decent API to me. What is it missing?
>>
>> IMO, one missing thing is that there's no approach for the OS to
>> prevent the EC from responding to Fn+Space. Hence no 100% pure softwa=
re
>> control is possible. We end up have a mixed SW + EC control.
>>
>> Another missing thing is that there's no approach for the OS to
>> query/set the ALS-to-brightness curve (or trip points, whatever you
>> call it) of the EC driven auto brightness mode. Therefore, should we
>> have a kernel mode ALS-based software trigger, we would never know if
>> our curve could be offloaded.
>>
>> That being said, I don't think either of these two missing things is a
>> big deal, since most laptops (if not all) are just designed to work
>> like this and I don't think we would have a kernel mode ALS-based
>> software trigger any soon. No 100% pure software control wasn't, isn't
>> and shouldn't be a blocker of using an LED classdev. As I've said,
>> that's exactly why brightness_hw_changed was introduced.
>>
> Got it - thanks for the input.
>
> My personal opinion (not feedback from the FW team)
>  - disabling the FN+spacebar is not a useful feature. It's not exactly=20
> something you would trigger accidentally. I can't think when people=20
> would need to disable it rather than just choosing to not use it.
>  - Programming the curve would be more interesting - but becomes a bit=20
> of a pro-user use case. Happy to suggest it, but it's a nice-to-have=20
> feature IMO.
>
> Agreed that neither of these seem a valid reason to block the implemen=
tation.
>
>>>=20
>>> I don't understand the two bosses issue I'm afraid. The user ('Linux=
' in your description?) tells the EC what it wants the LED to be, and th=
e EC does it. The EC is not a boss.
>>
>> The "user" means the one (i.e., a human) who is using the device. And
>> "message channels" mean:
>>
>> User -> pressing Fn+Space -> EC -> update keyboard backlight
>>
>> User -> LED classdev / manufacturer utilities -> ACPI -> EC -> update
>> keyboard backlight
>>
>> They are all about the user, as a human, tells their intention to the
>> device. Of course there may be some userspace software or kernel
>> trigger blinking the LED, but again, that's still the user's choice a=
nd
>> intention. Hence I don't think EC is a boss either, and the user is t=
he
>> real boss.
>>
> I think we're in agreement :)
>
>>>=20
>>> > >=20
>>> > > > As my previous reply said, it's common that an LED driver can'=
t prevent
>>> > > > hardware from changing its state autonomously. Prior to the
>>> > > > introduction of auto brightness mode, brightness_hw_changed is=
 enough
>>> > > > to handle this. The issue only emerges when recent models star=
t to
>>> > > > provide an auto brightness mode based on the ALS sensor.
>>> > >=20
>>> > > Do you have a software driven brightness mode based on an ALS? W=
hat
>>> > > API do you use to control this? Can you use that API, and accele=
rate
>>> > > it?
>>> >=20
>>> > All devices I've seen implement an EC driven auto brightness mode =
based
>>> > on an ALS.
>>> >=20
>>> > @Mark, do you know any device implementing a software driven auto
>>> > brightness mode?
>>> >=20
>>>=20
>>> I don't - to my knowledge in auto mode it's always driven by the HW/=
FW.
>>
>> Thanks.
>>
>>>=20
>>> If there was a SW approach it would read the sensor and set the brig=
htness to low/medium/high (and not to auto) so I'm struggling to underst=
and the issue here. What am I missing?
>>
>> My understanding of Andrew's words (see also his previous replies) is:
>>
>>    hw control trigger is fundamentally an accelerated (offloaded)
>>    software trigger. Only if there is a software-driven ALS-based
>>    trigger and the curve matches the FW one can we treat the auto
>>    brightness mode as a hw control trigger.
>>
>> But those laptops with an ALS and keyboard backlight are not designed
>> to work like this, and the curve may be very specific to the ALS and
>> the luminance of the keyboard backlight. So I asked you to confirm if
>> there is any device designed to use an software driven auto brightness
>> mode (even under Windows).
>>
>> Hmm, forgot to ask about that... Is there any device comes with ALS-
>> based auto brightness mode but Linux cannot read the the ALS? If such
>> devices exist, the "accelerated software trigger" model is no longer
>> relevant.
>>
> I don't know of any SW driven auto brightness mode.
>
> Afraid I also don't know about reading the ALS. I'll see if I can find=20
> out - but I don't think it's directly important to this series which i=
s=20
> about supporting the new HW automated feature.
> We're not trying to implement an automated SW based control feature=20
> with this series :)
>
>> Also that's why we have private LED triggers -- it's useful when the
>> HW/FW has its own triggering functionality. For example, "cros-ec-led"
>> has a private trigger and declares it as its hw control trigger.
>>
>
> ack
>
>>>=20
>>> > >=20
>>> > > > FYI, desktop environments (e.g., GNOME, KDE) can control the b=
acklight
>>> > > > brightness of keyboards through sliders and heavily depend on
>>> > > > brightness_hw_changed to update the sliders and display OSD on=
ce the
>>> > > > shortcut is pressed.
>>> > >=20
>>> > > Hold up. Terminology problem. I'm a networking guy, i know netwo=
rking
>>> > > terms. By slider, do you mean a software scroll bar sort of thin=
g?=C2=A0
>>> >=20
>>> > Yes. See
>>> > https://blogs.kde.org/2024/09/04/brightness-controls-for-all-your-=
displays/
>>> >=20
>>> > (it was about display backlight but it also showed the keyboard on=
e in
>>> > the same image)
>>> >=20
>>> > > I'm
>>> > > an XFCE users. I can control the display backlight with a slider=
 on
>>> > > the battery charge applet. And i can use Fn F4/F5. I've not seen=
 a
>>> > > software scroll bar for the keyboard backlight, but i think
>>> > > <CTRL><SPC> allows me to change the keyboard backlight.
>>> > >=20
>>> > > So we have a slider, which is purely software, Linux. And we hav=
e key
>>> > > presses, which you are calling shortcut, which the EC acts on, a=
nd
>>> > > might tell Linux, maybe, but not about the key press, but the ac=
tion
>>> > > the EC took because of the key press.
>>> >=20
>>> > "might tell", "maybe"
>>> >=20
>>> > It always tells the OS that the state of keyboard backlight has
>>> > changed.
>>> >=20
>>> > >=20
>>> > > You have some API to the EC to ask it nicely to act on the softw=
are
>>> > > slide, but it is the EC which really controls the LED, not Linux.
>>> > >=20
>>> > > To me a Linux LED is a poor fit for what you want, and i think a
>>> > > trigger is even worse. The problems you have are because the
>>> > > LED+trigger model, plus using the hardware for acceleration, doe=
s not
>>> > > fit with the EC actually controlling the hardware.
>>> > >=20
>>> > > I would suggest you look at the API the EC exports and find a be=
tter
>>> > > model for it.
>>> >=20
>>> > An LED classdev may be unable to perfectly fit this, but nothing is
>>> > perfect and so far it's the best thing we have. It's a fortunate to
>>> > have the LED subsystem. Windows, without a similar interface, ends=
 up
>>> > being filled with disgusting software pre-installed by the
>>> > manufacturer.
>>> >=20
>>>=20
>>> Afraid I don't understand what we are debating here.
>>>=20
>>> Isn't the whole goal of this patch to make it so LED classdev is a b=
etter fit to address missing functionality? Why would switching to somet=
hing else (I have no idea what) be better? Especially given the the keyb=
oard backlight is currently a LED device, and changing that would potent=
ially break things for users.
>>>=20
>>> From my perspective if I could just tear this out and have a Lenovo =
only keyboard_backlight implementation under (for example) /sys/devices/=
thinkpad_acpi it would be so much easier. But I don't think it is the ri=
ght thing to do. My experience is if we define a common approach then al=
l vendors will use it going forward - which is better for the Linux expe=
rience overall.
>>> Or we don't have fully implemented features for Linux users? That's =
kinda sucky.
>>
>> I agreed with you. Just some supplemental information:
>>
>> ideapad-laptop has an custom attribute "fn_lock". This used to be
>> the=C2=A0only way for userspace to turn on/off FnLock. The attribute =
does
>> not support any notification mechanism.
>>
>> Since devices with FnLock also come with an LED indicating the status
>> of FnLock, an LED classdev has been added with a new
>> LED_FUNCTION_FNLOCK macro for dt-bindings and UAPI. See commit
>> 7ab6c64663a0 ("dt-bindings: leds: Add LED_FUNCTION_FNLOCK") and commit
>> 07f48f668fac ("platform/x86: ideapad-laptop: add FnLock LED class
>> device"). Since then, userspace receives notifications through
>> brightness_hw_changed when the user presses Fn+Esc.
>>
>> I think this shows that an LED classdev, as a common interface, has i=
ts
>> vitality even when being used in a very specific use case.
>>
>>>=20
>>> I don't think the two bosses argument is valid (or at least I don't =
understand it). Are there any other critical implementation details that=
 make this a poor choice and will bite us in the long run?
>>>=20
>>> I personally find the implementation more complicated than I origina=
lly expected, but having looked at it and understood better what Rong wa=
s proposing I understand the benefits and I think it works. We're still =
checking it out on Thinkpad to confirm that, but this patch is a RFC so =
I think that's part of the process.
>>>=20
>>> > IMO the presence of brightness_hw_changed proves that an LED class=
dev,
>>> > as long as appropriate interfaces are provided, can work well with=
 such
>>> > hardware. And I don't think there is too much difference between EC
>>> > setting a static brightness value due to a shortcut being pressed =
and
>>> > EC turning on/off the auto brightness mode due to the same shortcu=
t --
>>> > if we can handle the former well, we can also implement a similar
>>> > mechanism for the latter.
>>> >=20
>>> >=20
>>> > Do you have any recommendations for a "better model"?
>>> >=20
>>> > Did you mean do not register LED classdevs at all? This isn't real=
ly
>>> > viable and will break userspace. Some drivers has been using LED
>>> > classdevs for keyboard backlight for over a decade. And many
>>> > `*::kbd_backlight' LEDs rely on brightness_hw_changed, so it's very
>>> > common that we can't take 100% control over EC. LED classdevs and =
EC-
>>> > controlled keyboard backlight have lived in harmony for a long tim=
e.
>>> >=20
>>> > If we still register the keybaord backlight as an LED classdev but=
 use
>>> > a custom attribute to report/set the auto brightness mode. IMO thi=
s is
>>> > even uglier than LED+trigger, as writing to such a non-brightness
>>> > attribute will interfere with the brightness attribute and the act=
ive
>>> > trigger and vice versa. Even if we rule out the EC's action, such
>>> > interference still exists as long as users use the attribute.
>>> >=20
>>> >=20
>>> > As for the software-vs-hardware priority issue, how about adding an
>>> > attribute "hw_change_policy" so that users can select if the softw=
are
>>> > state should be always reimposed to hardware?
>>>=20
>>> Is this needed? When wouldn't this be the case?
>>>=20
>>> If the SW sets a specific brightness that should become the setting.=
 It would override any previous choices and tell the HW that is what is =
wanted now - don't change it (until the user says otherwise).
>>> If we're in auto mode and the HW changes the brightness - it doesn't=
 change the setting from auto mode, just the reported brightness level i=
f queried.
>>
>> My understanding of Andrew's words is:
>>
>>    Linux LED should always be the boss. Tell the HW: don't change it =
*even
>>    if the user presses Fn+Space*. Failing to accomplish this means th=
at we
>>    are in "a two bosses dilemma", hence "a Linux LED is a poor fit for
>>    what you want" and "a trigger is even worse".
>>
>> Since Andrew cares about the software's precedence, the best thing we
>> can do is adding an attribute for users to select their preference. T=
he
>> attribute's default value must not be reimpose, otherwise it breaks
>> existing userspace programs relying on brightness_hw_changed and
>> confuses most users.
>>
>
> For the current HW, the attribute is not going to be supported. There'=
s=20
> no way to disable FN+space as it goes directly to the BIOS (which then=20
> notifies the OS).
>
> I guess the OS can get the notification and then say 'nope - despite=20
> the fact they just pressed the FN + spacebar, they actually don't want=20
> anything to change', and revert the setting to the previous setting.=20
> If the user had to specifically set the attribute to do this it's fine=20
> - but it feels like something that nobody would ever use and a whole=20
> bunch of extra complexity, to me
>
>> But yeah, personally I don't think it's needed either. It's been 9
>> years since the introduction of brightness_hw_changed, and there's no
>> complaint about HW/FW overriding the software configured brightness.
>> After all, it's the user who decides to press the shortcut and asks t=
he
>> EC to change the brightness or turn on/off the auto brightness mode.
>>
>
> I think you and I are both in agreement.=20
>
> Andrew - are you still against the current proposal or have your=20
> concerns been addressed?
>
> How do we proceed on finding something that we can move forward with?
>

Hi maintainers - a gentle nudge on this one. Would like some direction i=
f we can move ahead with the series. If not, what is required?

On our side I know Vishnu has implemented the thinkpad driver using this=
 and confirmed the design works there too.

Would like to get this upstream so we can start working with the user-sp=
ace folk on updating their pieces.

Thanks
Mark

