Return-Path: <linux-leds+bounces-8656-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8POEJki+M2rAFgYAu9opvQ
	(envelope-from <linux-leds+bounces-8656-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 11:45:44 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 120B069EF86
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 11:45:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Uzt93V0f;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8656-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8656-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12A0730158A3
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 09:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304C13D79E2;
	Thu, 18 Jun 2026 09:45:41 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACDB361DCB
	for <linux-leds@vger.kernel.org>; Thu, 18 Jun 2026 09:45:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781775941; cv=pass; b=L7SSuoD2v93kpzDnDUbrkOqvQZlOwOiNlAd8+MPWjpwWq9LCOZ86triT6IswjtS51B24nNozK4IC4i71/NwvKRS6kYF3QooiEoYhoKXQNM1Hs40YzKZueGx6UCg8tQmeQCI/9E/Gvro6n9wL/6g8z6WD9jebsWnZmUx7IYgz/eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781775941; c=relaxed/simple;
	bh=6WaRfwC9Cd5kM/ixVZ9/4tMUscSveT87eGc4uHnIFFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWdnindhB73R4/hHYyDhuRT2H/hSuAGE8OiiW/hjZfXUj8v4hEepmjUHEo67sLa21YvrPChjo0RtFqttXINwOhESCS4ToY60YS4oDu7BdfZP7SmlW/b3WwgQLV4Szfi4PDpXuMKpGuCVx+/hViPGnSYt0K7XdMNuTFSmXO+xedI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uzt93V0f; arc=pass smtp.client-ip=74.125.82.174
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so996400eec.1
        for <linux-leds@vger.kernel.org>; Thu, 18 Jun 2026 02:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781775939; cv=none;
        d=google.com; s=arc-20240605;
        b=UKRvRl+465ESucr0khDPSqwJVv8qW9ciQL/0p3UVKZ1kL+/BjNcbIZXFF9WOYvwXzE
         oGgA+f0MtGsmEh3+8bfiRJ7f3SdI4ssI7t/J1mPwMRbMRNhj7tAp6VXbV0nvKv42SBE2
         xY0RMbFdZgW4+vrvpNCtl2qHX+wd/a9bA9x86iE2VWqDHPWCoN9JBUjBDtj2jAJdXFYM
         ehVjb8cDJbWtpzTvtHOpq7i/aaba5KkuzEUVgtZJcVXGFpDpi6p6nkLb0aRaxca5cocu
         gtuZ0Qvg478EGKr3YQozsfAg5dSiVd0oXesY4OlcP+RE9OgggLGSi0t97tEctZVuMPw7
         geTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6WaRfwC9Cd5kM/ixVZ9/4tMUscSveT87eGc4uHnIFFc=;
        fh=oyKmXRUI2UZtEXAegSIbqBKkaOCff84gH7ocSW4bWrA=;
        b=IoJz99/6LJy/MJtdFe19o3iaolNlO1l4JcNjMOUTj/qhDFWwBgx1b2mnBwQWY2/IO+
         6t7WyK+8/vB+8o4L1emboBsoqo/GHzTVDgL9u8zKFH8RsBf1Gdw0APCmM6DHu57WDe2J
         YpmmLWXs+D7nBh7DBVtHLreOlYUaHIet370RGQ1LCk59DCoeO4COsC8a7BA1wMWXXXeA
         y3zxN2S7i4kTB9v3NzNB/tyYY1vTyoKg9TGiH4I1R3YHX86qxmu3kS20POligGGWz5vF
         OipLNEGqrTxk0hpuVmbofXEjK/1Rw2Z7o189HpQMwcb8w2HnKhIjY6uovy9WGwZWJsTz
         FlXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781775939; x=1782380739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WaRfwC9Cd5kM/ixVZ9/4tMUscSveT87eGc4uHnIFFc=;
        b=Uzt93V0fxC7tDNJATZGvQ0/4lzHFccitA2lXeDlZHGrEjcIQSKnBrne731repvUD74
         W5/RQ999z+zohFq5ghTCIQ37NQsuSIGYY0w7GbWO2boR/ICn628Ud3Km97QYNVYsdlQh
         L3WDiVHdar50458I8k9cwpal600yaJJ6WmwyL6Caj2IEtbRoER8DJwzCbZz6aFu2NRTj
         S7p8l1304sP6G/XXjZKem+lx4Sv7/NmQFwF2fo+Y3X/0rVop2VS6HvLXzwaLzG/oG+dt
         RB+OQWxVW0ydv6FfKVvvr5dxLAac6XQ83NW2+zi5QZ6YJ6z2dwUrR87uBtWcXJs7rrC7
         BdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781775939; x=1782380739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6WaRfwC9Cd5kM/ixVZ9/4tMUscSveT87eGc4uHnIFFc=;
        b=d23SAXq8H7pZXqILNX7WdkJwyWzQ2D3wSj+lSpGZ5jFIJqqoSFn42L5Zdec3pM+L1I
         4EzXLzUBCoB1RfUtL35X6drVnWAm4NkA3ZUTZF83NSG1I7mgfYdUIHf4WqQJsncmAYzL
         MQncFJtbLW1UXzRhxMJQGyj2hQILfhifXhkIF372+ASLnwqGzAzHgXkuOqv26mXTb9Td
         rtaTSQhnpmHwMjVY2cP19/h9Ms0WgSCEe/zo3+sAyqwhPIy4fjCSS++1cZ7M79vtERdQ
         yHZ8nX2UKerLMI5zpalSwLLfgzExXC7AYQO3Q9G/lC1bFjMtHm4/qJN32TPUO4z03FB6
         qB9g==
X-Forwarded-Encrypted: i=1; AFNElJ968y61pMha9K3/dKqtOBQXvT2t3Ry9PPRNgbmOI7gklFii8JS17NE2vBH/JQ4N/WDIifNw34ZpBCdS@vger.kernel.org
X-Gm-Message-State: AOJu0YywpzTd7AU89kVBTopMAp/d3VZuINWLAsZxPuw8nwx7LzoRk7TE
	8kPL00vtpEIOauB50NcwifFGKoXgKj7DLGRbUhVWAtrypzi1aoUl4sTPKweGoOqmfY+5KZYL8Ld
	ilU1FykJFJ9hi9MS0yZ+wkrp3VgKNjls=
X-Gm-Gg: AfdE7ck0Ve4ENhGRHCC/9PIpfmyP1FuLuHo/4VDh+ekFeaTw/5PGfY1TmTXGypNpPC6
	liqYpmQz6LtcXM2ES9a+KzTTUC4Ydtx2kBYWAmZdevOlvigWBLsr6Seowo0AqS2iVDGxNdTUybU
	cQ99K6fpcZbO2kfRJV/m50ubU4QAs/Bzw0Uc2Xs6SpgIY0I0IMheggG9Bhz5SmURM/Kni2/21zm
	H8TK0ZoaooK/OSy3+ftrHGJg00epyifEg1x5l8ahGkH8KogMaWN5XHndrEW2RLvmNEpsPBTQQ==
X-Received: by 2002:a05:7300:cc0c:b0:2d9:db50:c6a5 with SMTP id
 5a478bee46e88-30bf022da31mr1835449eec.0.1781775938951; Thu, 18 Jun 2026
 02:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528053203.9339-1-clamor95@gmail.com> <20260528053203.9339-5-clamor95@gmail.com>
 <ajDPtOyr8GJYaVYQ@google.com> <CAPVz0n2fnM6zYtP9bCtsY9mcLdce_R+1UPmMo0o4JRgjnhuhKA@mail.gmail.com>
 <ajGyejCSRMhY4G2R@google.com> <CAPVz0n0r-1SXH_dfS9HkQJrF7e-6+O5Me2bPjcscnizmfTfjZg@mail.gmail.com>
In-Reply-To: <CAPVz0n0r-1SXH_dfS9HkQJrF7e-6+O5Me2bPjcscnizmfTfjZg@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 18 Jun 2026 12:45:26 +0300
X-Gm-Features: AVVi8CdfRDGSXHDp2X9UrO1uFXgv2RAPSbOTQtrf0j8x2fqDzF-6zwOjp7eVP4g
Message-ID: <CAPVz0n1E5w6TB2empDF4TgVvMbNDwDRi31rQ4TFj-7voGf_i_g@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:sre@kernel.org,m:ion@agorria.com,m:mirq-linux@rere.qmqm.pl,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-pm@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8656-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qmqm.pl:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 120B069EF86

=D1=87=D1=82, 18 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 12:1=
8 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=81=D1=80, 17 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 00=
:23 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tue, Jun 16, 2026 at 09:25:25AM +0300, Svyatoslav Ryhel wrote:
> > > =D0=B2=D1=82, 16 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=
=BE 07:26 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > >
> > > > Hi Svyatoslav,
> > > >
> > > > On Thu, May 28, 2026 at 08:32:00AM +0300, Svyatoslav Ryhel wrote:
> > > > > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > > >
> > > > > Add support for multimedia top button row of ASUS Transformer's M=
obile
> > > > > Dock keyboard. Driver is made that function keys (F1-F12) are use=
d by
> > > > > default which suits average Linux use better and with pressing
> > > > > ScreenLock + AltGr function keys layout is switched to multimedia=
 keys.
> > > > > Since this only modifies codes sent by asus-ec-keys it doesn't af=
fect
> > > > > normal keyboards at all.
> > > >
> > > > I think using input handler to intercept ScreenLock + AltGr is quit=
e
> > > > awkward. I think this also passes the original key events (unless y=
ou
> > > > make it a filter not a regular handler).
> > > >
> > > > I do not see benefit for reacting to AltGr+ScreenLock on other keyb=
oards
> > > > to activate the special mode on this one. So given the fact that yo=
u
> > > > already mange the data stream when you split it into "serio" ports,
> > > > maybe just intercept this key combo right there and create the inpu=
t
> > > > device and signal input events right there?
> > > >
> > >
> > > Though it seems awkward at a first glance, media keys are integrated
> > > with a standard keyboard in a detachable dock. It is highly unlikely
> > > that media keys will be used with a different keyboard then the one
> > > that is integrated with dock. Additionally, the ScreenLock key has a
> > > code specific to this driver and is not in general use, so even if an=
y
> > > standard keyboard has AltGr but none has ScreenLock specific to this
> > > driver except the dock itself. Handler is also set as observer so it
> > > should not interfere with work of other input devices.
> >
> > I am not concerned about it interfering with other drivers, I am
> > concerned about it unnecessarily connecting to unrelated devices
> > (anything that declares EV_KEY).
> >

I can add check in asus_ec_input_connect() to strictly connect only to
dock keyboard, will this be sufficient?

> > Again, I think having input handler is not appropriate here. I would
> > fold this patch into the patch that introduces the 2 serio ports,
> > enhanced the data stream analysis to detect your key combo, and then
> > report through this new input device. You do not need to have the round
> > trip through atkbd and the new input handler for this.

This sounds like a load of additional work, I would rather remove
layout swapping entirely (even though it is a useful feature) then
rewrite everything from scratch.

> >
>
> I will try with filtering first if you don't mind. If that will not
> work I'll consider folding. Do you have any good examples of handler
> with filter to use as an inspiration? Thank you.
>
> > Thanks.
> >
> > --
> > Dmitry

