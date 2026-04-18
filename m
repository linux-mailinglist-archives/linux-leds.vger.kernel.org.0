Return-Path: <linux-leds+bounces-7769-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEQpDMZx42nLGwEAu9opvQ
	(envelope-from <linux-leds+bounces-7769-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 18 Apr 2026 13:57:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9774E42108C
	for <lists+linux-leds@lfdr.de>; Sat, 18 Apr 2026 13:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DFC2302E865
	for <lists+linux-leds@lfdr.de>; Sat, 18 Apr 2026 11:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B071834C12B;
	Sat, 18 Apr 2026 11:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="aHiOYQ+W"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B75327C09;
	Sat, 18 Apr 2026 11:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776513475; cv=pass; b=EDXJQwTt+LzeZNDrpGBOwqExZwpDdSnb7VCrqlyeBVZEx3NRgslMUNXtr1H6rbZcntTBeluxkkOqmgr1w2lE2HCBdka+2bJmUus9KMvQDfiQvMmK2KDpwWXI0m+1vmyDAsH2O8Y0nzm6gzDY/wF7zIqs7n8Xk4ZusHxSIMAE64E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776513475; c=relaxed/simple;
	bh=lVPZ60Nd9rJQ4/Fh1p4eBhqxLKAV1diK5qfNYRes+E0=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=J1pV/KL8cEpXUgdbvS7bOzy0Ip1bEsq7C4Vn+vzGTdMwM+M6kmOUDPfO5GwAoisgk5GkG6XFB8GHerncbI4GKaQbuNqvoacOE0YLjUgqLu8/zY2dgeeTxxGnP7fcWJh1lNTCN/LQZ9tVd+76xKnh++HJzGM4/Hnf+pIDgsUxPV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=aHiOYQ+W; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1776513450; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NSQZ7GrcOYFZe3tsk4y1CrVIDXHGchBSH9tvghd3+8Y4GZvJooZX/OfJz6B0uY1k5qET0PEFpYAG8RuwQ17fLy+H3ZEtNviJa6dWyCdiOaAiXduJLbISJ4W9V90MKD56xZ/rm6GLIt4+jR35F5YCPEkoCZ2hPKm0TZFfmv0JMcw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776513450; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8Y/pfwtq8kovQtFX6BwkjS9tBEsvrSMPwA7x8TdE3eQ=; 
	b=c48I/PbpeQNPtQOlIqkrkfskZOk3EA1wt2wtRpNoFWbe9QevIAAPp/TqNuzEgsO4KJyF8+9hvMVADU0XmjXUG1JaNVMA5pzQk7qdtAWkP1D/dkOZfRV+oADM2SMuiBpBq6Qr9vjAkNfjEmheO70+t7Gsh0VmdCo5RRdbOpAPy8E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776513450;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=8Y/pfwtq8kovQtFX6BwkjS9tBEsvrSMPwA7x8TdE3eQ=;
	b=aHiOYQ+WHRpsS11OFjmk8P4ikKCegpppjfccI3DqWB4xP7RSTgdiF+Zaoe++Nx9S
	9X0QJK83ZhYMmqfHrMcBB1sou7SKOqk2DMtzUgZifS3j192BX0qlg3iAuSc4Lc1wK85
	nAzCjFrTYk3i3EK3gs6NpRRTvgklnSkK0NmJaoeUQdyg0IBrpIfEfc8f5Xfph4RmpAt
	YNtSQO/YQqrFYvcoxBAVo0FwQR3ZSFUX1XeTvNmC1HeNOgmfo9Wdj2TonB/Wyc1SbNh
	StxQFD/5Os1IX8LDc0bX+L35xl6b64pCjcBQSVXuWjIwqOgDgXgfzMBXDXLGlpVg3Ck
	BeWaKbO3Hw==
Received: by mx.zohomail.com with SMTPS id 1776513447676502.2420835260647;
	Sat, 18 Apr 2026 04:57:27 -0700 (PDT)
Message-ID: <0b3afed83b586334d97251c3238d146169907cd9.camel@rong.moe>
Subject: Re: [RFC PATCH 1/9] leds: Load trigger modules on-demand if used
 as hw control trigger
From: Rong Zhang <i@rong.moe>
To: Andrew Lunn <andrew@lunn.ch>, Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?=	 <linux@weissschuh.net>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck	 <groeck@chromium.org>, Marek
 =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,  "Derek J . Clark"
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>, Ike Panhc
 <ikepanhc@gmail.com>, Vishnu Sankar	 <vishnuocv@gmail.com>, Vishnu Sankar
 <vsankar@lenovo.com>, 	linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, 	chrome-platform@lists.linux.dev,
 "platform-driver-x86@vger.kernel.org"	 <platform-driver-x86@vger.kernel.org>
In-Reply-To: <6697bb96-6ae7-4cff-b218-2aa099977dc9@lunn.ch>
References: <500dfc4b-ebd7-4637-bed0-130fc571923c@lunn.ch>
	 <b48993998e6e48d4448f8c6dc758f4e260d0f857.camel@rong.moe>
	 <353713de-b121-4e27-a46f-6ca1941888a6@lunn.ch>
	 <8b25e1ea9bff414442fa47475b9c9ac5b29049d7.camel@rong.moe>
	 <60e60c42-f776-424a-a5b4-7286d33175d1@lunn.ch>
	 <d2d321fe39c41ebd896eef63f3909df29f5a1622.camel@rong.moe>
	 <4e839e55-4daa-45cd-b403-d1d6eae63d8d@app.fastmail.com>
	 <cc4398e1512dceb531ba3bd5dd0d20cf2042bb84.camel@rong.moe>
	 <2ac0c46c-805d-4749-a6e0-94b16b104a72@app.fastmail.com>
	 <7437cc09-7958-4172-aec2-4429cfa98141@app.fastmail.com>
	 <6697bb96-6ae7-4cff-b218-2aa099977dc9@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Apr 2026 19:52:19 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7769-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rong.moe:dkim,rong.moe:mid]
X-Rspamd-Queue-Id: 9774E42108C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrew,

On Sat, 2026-04-11 at 22:42 +0200, Andrew Lunn wrote:
> > Hi maintainers - a gentle nudge on this one. Would like some
> > direction if we can move ahead with the series. If not, what is
> > required?
> =C2=A0
>=20
>=20
>=20
> > On our side I know Vishnu has implemented the thinkpad driver using
> > this and confirmed the design works there too.
> =C2=A0
>=20
>=20
>=20
> > Would like to get this upstream so we can start working with the
> > user-space folk on updating their pieces.
>=20
> I'm not the Maintainer here, so i would not be too unhappy if i was
> ignored.
>=20
> I've had some time to think about this. I guess you are going to go
> with a Linux LED, whatever. With that assumption in place, a trigger
> makes sense. But i think it needs to be a special sort of trigger, and
> a special sort of LED.
>=20
> This is not a general purpose LED, which is a basic assumption for
> Linux LEDs. You cannot make it blink for netdev packets, shift lock,
> heartbeat, etc, because Linux does not control it, the EC does. Linux
> can ask the EC to set it to some state, but the EC might change it,
> and notify Linux afterwards. That is not the normal behaviour of a
> Linux LED.
>=20
> Also, it does not make sense to allow the trigger to be bound to any
> other LED.
>=20
> The trigger and the LED are tightly bound together. So i would put
> them in the same driver. There are triggers which live outside of
> drivers/leds/trigger/. So it is not a problem it lives somewhere
> else. It also solves the ordering problem you had, getting the trigger
> registered. Since it lives in the same driver as the LED, you know it
> is registered, you do it before registering the LED.
>=20
> I think you need some additional logic in the core. This LED must have
> this trigger. I would look at using the is_visible() attribute
> callback to make the trigger file in sysfs invisible for this LED, so
> it cannot be changed. I would somehow get this trigger attached to the
> LED when it is created. The trigger_relevant() call needs to be
> extended so that you cannot attach this trigger to any other LED.

I think I understand your points better now.

Though my PATCH 9/9 already used a private trigger for ideapad-laptop, I
will further restrict the led_trigger_notify_hw_control_changed()
interface (PATCH 7/9) to private triggers only when I resubmit this.

Does it make sense to you?

Thanks,
Rong

>=20
> I would also think about naming. The behaviour is i guess specific to
> X86 laptops? Do Apple laptops have the same behaviour? What about
> Snapdragon X Series laptops? Chromebooks? USB keyboards? What about
> things like the Unihertz Titan 2?
>=20
> Somebody in the future might produce a generic solution. Linux
> controls the LED. The Linux input system gets the key presses and
> sends them to the trigger. You can bind an iio ambient sensor to the
> trigger, etc. So you should leave the name space open for other
> implementations.
>=20
> 	 Andrew

