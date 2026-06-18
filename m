Return-Path: <linux-leds+bounces-8655-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zOenHIK4M2q+FQYAu9opvQ
	(envelope-from <linux-leds+bounces-8655-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 11:21:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0BE69ECAE
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 11:21:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=svCHfmjW;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8655-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8655-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5AF13077DF6
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 09:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738863DA7C5;
	Thu, 18 Jun 2026 09:19:04 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C963C98B3
	for <linux-leds@vger.kernel.org>; Thu, 18 Jun 2026 09:18:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774343; cv=pass; b=BdJoGU+OVYKsF/BgzVi6abbAqi+GM4FUGLE6wWvqdU8OVXI+lGbGljKDElK71uL2OEcFCAVkJldTRj5ZqPRRRU2WXFmuYzsdidB03RCFfjUk1927KCvxA5YcT35uyj5mzWzUynNV4Or3UVssKB+2neeFs8fvO/JSGje0zcL0sbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774343; c=relaxed/simple;
	bh=iXXS+DdvdpHDISQJAmld4xgdLVhKLH0Jazoj5E1xJKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FhGTZNaQypvYJrfQm6RK6QjBiK/8sd1XBJmtk8aYTZTFSyzXT0HmcdqivSN7ibQ6yaSutMZCQEvaBeCc5nq6eFcvbxjJMeE3zOOI9xMqWURbyBcQ1xpkKKgdTnb/lwlNcm7Qv4ayMb3m4NFqDxm3EBfsJtugNbe4UN1qOe01/2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svCHfmjW; arc=pass smtp.client-ip=74.125.82.178
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so238496eec.0
        for <linux-leds@vger.kernel.org>; Thu, 18 Jun 2026 02:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781774336; cv=none;
        d=google.com; s=arc-20240605;
        b=AC1uz5HCS11YAm8GlHHubfWkeECjjmpkcEK8IEv20DhNJeDAqDk9fz4X47duVggPMS
         OUIN00OxPYHN95geZXsN/3o+lJ6Hv6gyz4vUnvzw1eyzlYvGw4FgVPOtVb1YOLZigX4x
         wbxn89V40TPw15z6ORcy55mD9Xx+rkskNnWl3ogxdniPZO3m95iA8ZLYJVelC2YlcI1a
         iJCQ5JJEiohYFqDQ9vUOXe3nvXHwxet+IkjSTTW6i6kLILdJ9eNZHRxDX38p6sWUF82x
         kt+C00eUqYTqOmHUdbGRwTxBkdw7H+GOEkVGuIofr5SijV5BLIgR8xUyk0I/wIBY4k4O
         84Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iXXS+DdvdpHDISQJAmld4xgdLVhKLH0Jazoj5E1xJKc=;
        fh=cmIiJhyRStcKdGcF4Shqk7AnHA5ml4dv62VRol+hzeE=;
        b=fWE/fahLk/VH6k19XFHatdTXqq3D6ooZ4jcQTSyKPOj31XwkLFiv0i79knphzU04yO
         ZSp/8fnVPDKg9rfVFnyClxDA8XZFZ+PHsjd3GJXX8s2gzFjFdb9h2LPIinaqGXyp0RMa
         uGQsmtLaTmY2t0th902ZuKQPBXtmeVdtiPgsyfDF8JhcgwMq8YBqBnXtyFaiTMT3uBj5
         +PZNAGjpklVXoRvuuHusfY4OJ1CcMns+NGL9xPK24WPb03ns6VT3XlVXsnZLWDRH8WGc
         HhgzhPBeqTsWw4E0n8IFarQru9YCzT33b62JSgWGRpp5vZl9B0GiEAC/UU/jZVI6SaD1
         0gFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781774335; x=1782379135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXXS+DdvdpHDISQJAmld4xgdLVhKLH0Jazoj5E1xJKc=;
        b=svCHfmjWdy9fVHTCYHHVhzuC4EYvs/qch4QmzwA/63gVMZiU4s3jVAoFEM0UM0UmSW
         bwORU+3vBordIGCRTdOLg8jZxH2uuu/qW2lHQLlZkfZzHdoIFvZ0oZQ5sPe3m49HN88e
         9MdPgT9CiKFwv9a3MwADBqK6FuKPdw1A602ShMH/PDErDAtZnXYC3Kh/oPHyu3LIUD+R
         QkV9exODwC7oLGb8Yfj4f1eHMlGLnDyFAX2hvrBrqUtC9A+0ILgsmd9ODY8r6BmUkgUN
         qUW4h/1nc3FNJvMdLzGQN4zQo/tgyYiOf1Hogt0Qnt1uLnORZ3c5h/nAOemQckpgi/jp
         bpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781774336; x=1782379136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iXXS+DdvdpHDISQJAmld4xgdLVhKLH0Jazoj5E1xJKc=;
        b=Ei8zsSEUQ/TyDqnVpydG73+ReXQprUibVVJR/Ng5eEr1GnBQ9e59r6oOo1833llEEr
         xjTz9Q9h4tlLUZxl9Jgx/wa06vnGM/OmUOYVyXYbbx2TiV6ha/pGVEoQWTf85F+lVfcW
         MkRjkINIVunYoIP9X7VKStaT9G5W/rcS+JQZVt8k6DSqhcQeHjPdSvl3wh8BxI2fqHvY
         Pjs0aefvpcIV8xldjktLw4KUACOCNHBDWUPBcUCBLnK1fPaHAoTqJ+0mY50k1brOhHzF
         KbPyvubllhZ2rqFuAg2vfOlQ86O1AA/KSXkptxCpZRl9xdBW7cwQm5tg9LQyNhuXl5zE
         73qQ==
X-Forwarded-Encrypted: i=1; AFNElJ8igeFTT6iM2ier7tRM4Uwcf31+XlLcI+lRHAKMlpo9Gx1hmxf/LGDpK5lwXX34wFc5xVmsTujI54i6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt7sRimT37sGhf46UhYCMrUtaKb+0iyvaN/QeRUbR/4KMjHv3l
	7LzV+bR62EfyvuYk5zFq6a+nmpe/99iUwTEi2whyQV1a2ZbnApfd5krq4+PWGafmifiHe2jJdkV
	PN+OEDlm16nqI4M9Yk1r9ThKM4Uqsdwo=
X-Gm-Gg: AfdE7cnkvKAPZ3nK1bfTcZmVE3Nm5YeCOGUkfS81Uj/lIsWdFmHCB9n4139hQbKmewf
	0y/MVmHIIQ7mDddWLwKAj0JrsjzfYXLDqYuzLA0zqVpnDIEkfryQwIg9QcfBWvBsxp3kfFCKgbG
	iVba5uqCmdm6yWR5Or8m8wsFIwP2sdpocB7lYEtC3uBW/W4NrA3XpnsUbamwHrS9FGnp7kNwYuc
	/YW95XUjh+q4GQHPETwhvekIOwzBSwV4WssREfpGPSmjqx5L2fV3ZKL7G8sCZSBENYuTDKEFQ==
X-Received: by 2002:a05:7300:730b:b0:304:dddb:f8 with SMTP id
 5a478bee46e88-30bca20f8damr5812502eec.35.1781774335449; Thu, 18 Jun 2026
 02:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528053203.9339-1-clamor95@gmail.com> <20260528053203.9339-5-clamor95@gmail.com>
 <ajDPtOyr8GJYaVYQ@google.com> <CAPVz0n2fnM6zYtP9bCtsY9mcLdce_R+1UPmMo0o4JRgjnhuhKA@mail.gmail.com>
 <ajGyejCSRMhY4G2R@google.com>
In-Reply-To: <ajGyejCSRMhY4G2R@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 18 Jun 2026 12:18:42 +0300
X-Gm-Features: AVVi8Cf9TbqQeyGuWNgkeGWahIsHp2X0krUtvBhwls2q1omyQtqvEQF6YkA0rCg
Message-ID: <CAPVz0n0r-1SXH_dfS9HkQJrF7e-6+O5Me2bPjcscnizmfTfjZg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-8655-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qmqm.pl:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF0BE69ECAE

=D1=81=D1=80, 17 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 00:2=
3 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Jun 16, 2026 at 09:25:25AM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 16 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
07:26 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Hi Svyatoslav,
> > >
> > > On Thu, May 28, 2026 at 08:32:00AM +0300, Svyatoslav Ryhel wrote:
> > > > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > >
> > > > Add support for multimedia top button row of ASUS Transformer's Mob=
ile
> > > > Dock keyboard. Driver is made that function keys (F1-F12) are used =
by
> > > > default which suits average Linux use better and with pressing
> > > > ScreenLock + AltGr function keys layout is switched to multimedia k=
eys.
> > > > Since this only modifies codes sent by asus-ec-keys it doesn't affe=
ct
> > > > normal keyboards at all.
> > >
> > > I think using input handler to intercept ScreenLock + AltGr is quite
> > > awkward. I think this also passes the original key events (unless you
> > > make it a filter not a regular handler).
> > >
> > > I do not see benefit for reacting to AltGr+ScreenLock on other keyboa=
rds
> > > to activate the special mode on this one. So given the fact that you
> > > already mange the data stream when you split it into "serio" ports,
> > > maybe just intercept this key combo right there and create the input
> > > device and signal input events right there?
> > >
> >
> > Though it seems awkward at a first glance, media keys are integrated
> > with a standard keyboard in a detachable dock. It is highly unlikely
> > that media keys will be used with a different keyboard then the one
> > that is integrated with dock. Additionally, the ScreenLock key has a
> > code specific to this driver and is not in general use, so even if any
> > standard keyboard has AltGr but none has ScreenLock specific to this
> > driver except the dock itself. Handler is also set as observer so it
> > should not interfere with work of other input devices.
>
> I am not concerned about it interfering with other drivers, I am
> concerned about it unnecessarily connecting to unrelated devices
> (anything that declares EV_KEY).
>
> Again, I think having input handler is not appropriate here. I would
> fold this patch into the patch that introduces the 2 serio ports,
> enhanced the data stream analysis to detect your key combo, and then
> report through this new input device. You do not need to have the round
> trip through atkbd and the new input handler for this.
>

I will try with filtering first if you don't mind. If that will not
work I'll consider folding. Do you have any good examples of handler
with filter to use as an inspiration? Thank you.

> Thanks.
>
> --
> Dmitry

