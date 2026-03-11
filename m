Return-Path: <linux-leds+bounces-7305-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBw+DHzGsWkFFQAAu9opvQ
	(envelope-from <linux-leds+bounces-7305-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 20:46:04 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E874269965
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 20:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F193301E3FD
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 19:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15233347FD3;
	Wed, 11 Mar 2026 19:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="RS3iwcq4"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8EB375ADB;
	Wed, 11 Mar 2026 19:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773258280; cv=pass; b=dY924b+7uyX4FU4ZVSNtDE6279AwFVXoctogbLz46rZFl6YVHn9x2ioF6FqIPpGpezwAHoox+ueqyvwuFqM7Td34aGw0UEotMj5uF6LPSN5pNeXzdTLX7Z2wNo1Qxp2RRtoBQE2moLa5P8WELlGMaeugzNGNOdPTIuOECVZNPx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773258280; c=relaxed/simple;
	bh=958TNq7//FJcKBydaFa22d0cdVHSy3o4Y4bNc2SuLCs=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fw4xT5qP+9t46qex1P5UbA0qXDV5km/gbbMbpO+50Or1VZYGQ19zbNs/YhmWPtbD80p2p3WKY5M4oZ7VVbVMG/aqO5OTWP/fzUaHwD7ygpCJ5t3Bq175kOb9f5QWANqY8Mjveo1L+SA87BOXaZORKgIkTJYBcsneZC0v+196U+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=RS3iwcq4; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1773258253; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jqmKXROFKmy4d0Tb3XAfwRpvZjcyUJoflh0MhHYVQVX2/e9wn46w4TSm3UAh0a96/wCTm+BWwH8dOwbPhFEUqNMcdGvsY4DqHhDykMFpnp4CJjXFAoZgJqcsck0RLlxGvucSI6PQkQyqhr5QgJ3a+T4qBvvU8o/zol5kTfI1rqo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773258253; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=k9rdG+F3NV7wP5qVdZ0rIjcM+u7vAoa6XGgTNQE6hOI=; 
	b=O+CF5omuBikJEdJ/qNS0TjWICTQyFkpQeHCk+GAeiQzEMtiYI3nPdI/tNJU1kIAtdKmI7iccOLaaPCxmoEB8vlqk3aka1CT7UIc9A/593zaJY5rGuD1kMsgTO/NLSOBOdj7sPPIMaWA79RF+Y2+r7VfNOlsODz2tTaC8PT8M7vk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773258253;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=k9rdG+F3NV7wP5qVdZ0rIjcM+u7vAoa6XGgTNQE6hOI=;
	b=RS3iwcq4TeXXwWByopoNW4wjOQiYwyC5EMvNWANt6UidAAXioa09wNaAzXqZ4XAZ
	WxYrFpc8HKco+nqrmnXDXM7h2r3z6mjkoZfjZt+7vjQC/cEPIXTVPu6Yr6aeg4O4z44
	CxwI7Zgt99S2pJ0MsTlT1i/Ey+UmW1aUE1HNMMxffxhBhlCChtC6nPrrJlLX5lqX952
	TX9XLOyXbupJ7bwSmFU6QfuvOxep0rlfM0Zy3ZgC+gMac0pCTJqk3tUCDJvl46WOnVw
	VP6OVa/AIZSG2/aGT2/b+xGV5u/fqS/epIjRR/nhrLsmGamb2bf2QntTuL6DQvjx347
	5NM5Qf2Qkg==
Received: by mx.zohomail.com with SMTPS id 1773258250590348.31088157360216;
	Wed, 11 Mar 2026 12:44:10 -0700 (PDT)
Message-ID: <8b25e1ea9bff414442fa47475b9c9ac5b29049d7.camel@rong.moe>
Subject: Re: [RFC PATCH 1/9] leds: Load trigger modules on-demand if used
 as hw control trigger
From: Rong Zhang <i@rong.moe>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?=	 <linux@weissschuh.net>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck	 <groeck@chromium.org>, Marek
 =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,  Mark Pearson
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Ike Panhc <ikepanhc@gmail.com>, Vishnu
 Sankar	 <vishnuocv@gmail.com>, vsankar@lenovo.com,
 linux-kernel@vger.kernel.org, 	linux-leds@vger.kernel.org,
 chrome-platform@lists.linux.dev, 	platform-driver-x86@vger.kernel.org
In-Reply-To: <353713de-b121-4e27-a46f-6ca1941888a6@lunn.ch>
References: <20260227190617.271388-1-i@rong.moe>
	 <20260227190617.271388-2-i@rong.moe>
	 <500dfc4b-ebd7-4637-bed0-130fc571923c@lunn.ch>
	 <b48993998e6e48d4448f8c6dc758f4e260d0f857.camel@rong.moe>
	 <353713de-b121-4e27-a46f-6ca1941888a6@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Mar 2026 03:39:04 +0800
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7305-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[rong.moe:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rong.moe:dkim,rong.moe:mid]
X-Rspamd-Queue-Id: 5E874269965
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrew,

On Wed, 2026-03-11 at 19:44 +0100, Andrew Lunn wrote:
> > While I agree that the current policy makes its own sense and works
> > well on most devices, it leads to out-of-sync software states on recent
> > laptops.
> >=20
> > When the LED's hardware autonomously put itself into hw control mode,
> > it is offloaded to the hardware per se -- we *can't* prevent this from
> > happening.
>=20
> If you cannot control the hardware, why are you trying to control the
> hardware?

We can control the hardware. We can set brightness, enable or disable
auto mode freely.

We just can't prevent the EC from responding to the Fn+Space shortcut.
So it's essentially user's choice to switch to the hw control trigger
and make it offloaded to hardware (sorry if my cover letter and replies
didn't express this well).

>=20
> > The series is about how to update software state to reflect the
> > hardware state change. Blindly keeping the software state despite the
> > hardware state is hardly meaningful and makes software out-of-sync.
>=20
> Since you cannot control the hardware, just don't register the
> LED. That gives a truer picture. Something else than Linux is
> controlling it.

As my previous reply said, it's common that an LED driver can't prevent
hardware from changing its state autonomously. Prior to the
introduction of auto brightness mode, brightness_hw_changed is enough
to handle this. The issue only emerges when recent models start to
provide an auto brightness mode based on the ALS sensor.

>=20
> Do you get a notification when that something else takes control? ACPI
> event or something?

Yes, and the event is used in the series to change software state.

> If you do, can just re-impose the software state
> back on the hardware.
>=20
> > As shown above, this series doesn't change the LED's hardware state and
> > it just updates the software state to notify user about that. If you'd
> > like to enforce software state's priority, we would have to explicitly
> > undo the hardware state change immediately after the LED's hardware has
> > autonomously activated/deactivated hw control mode.
>=20
> Yes, if you decide Linux is driving the hardware, the Linux state
> should always be imposed back on the hardware. Just consider it flaky
> hardware which needs hitting over the head every so often to make
> work.

I don't think we should re-impose the software state back on the
hardware. We never do this for brightness and decided to introduce
brightness_hw_changed. That's should also applies to hw control
trigger.

Moreover, re-imposing the software state breaks the shortcut by
changing the brightness cycle from

  1 =3D> 2 =3D> 0 =3D> auto =3D> 1 ...

to

  1 =3D> 2 =3D> 0 =3D> (auto =3D> 0) =3D> (auto =3D> 0) =3D> ...

>=20
> But maybe we should take a step back here. What are your real use
> cases here? Why do you want Linux to control this hardware, when
> something else already is controlling it? Is /sys/class/led even the
> right API? That will depend on what your use cases are.

FYI, desktop environments (e.g., GNOME, KDE) can control the backlight
brightness of keyboards through sliders and heavily depend on
brightness_hw_changed to update the sliders and display OSD once the
shortcut is pressed. This matches the experience on Windows, where
utilities from manufacturers provide brightness sliders and display
OSD.

The shortcut itself doesn't send any keyboard events to the OS. Ths OS
only sees an event notifying that keyboard backlight has changed. We
want the event of turning on/off auto brightness reaches userspace like
what brightness_hw_changed does for brightness changes. Also we don't
want the auto brightness mode to have interference to other triggers or
the brightness attribute and vice versa, so making it a hw control
trigger is an approach to make them mutually exclusive.

Thanks,
Rong

>=20
> 	Andrew

