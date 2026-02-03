Return-Path: <linux-leds+bounces-6831-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K4GDgYkgmnPPgMAu9opvQ
	(envelope-from <linux-leds+bounces-6831-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 03 Feb 2026 17:36:22 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF7FDC113
	for <lists+linux-leds@lfdr.de>; Tue, 03 Feb 2026 17:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F97C30576E5
	for <lists+linux-leds@lfdr.de>; Tue,  3 Feb 2026 16:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008AD34F475;
	Tue,  3 Feb 2026 16:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hcbm8xyI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BCD3D1CA3
	for <linux-leds@vger.kernel.org>; Tue,  3 Feb 2026 16:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770136107; cv=pass; b=mtic5et6DvF6lqfEe6cKK+33xYOvTildkml3X6AaP0z0b+W5ugp//5OAYagSZyh+1/9G4xtQZaUmv7GKLwav6TReHMoq5RjIsYglJO1Oo7G3VAwEh/Qqr53sq8Gwg3sYqt0ie4AP7H2jh1DO0aHHB8wLOhdz65ADJWmX1RnUoMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770136107; c=relaxed/simple;
	bh=fXSdM/tph+CQ0hSdypd+WHNN70gFwJDk5S/Zwg+BMGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/lZm27RIuSBjVt6UnJesl5Y9WlYMUr3Eye2iJGEyDJEWvVzbXYTVyug6rkRjtcu3UE3ockMfM75J49661Tow8XrMzC5dixGsYkH6uEyzCCwn/XlgJgZwLPWbBAbz1Kkl+6TynQFELq7s+XP7Zik/t1DfzT1+/JCmSAeEYlnW/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hcbm8xyI; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso49836185e9.0
        for <linux-leds@vger.kernel.org>; Tue, 03 Feb 2026 08:28:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770136104; cv=none;
        d=google.com; s=arc-20240605;
        b=TW+JPtZkRzjIEDP5Gek5sJ+WPPm9RCqHtM1Ia1hC2+A71dtK5omeK/GM+aLNE6TOiv
         8ywRLEn1IHSDjR9hNRUuACKbiWgZ9iQ9aR+ozoi0t33uNQMu8RBTLaNyP7yAkNxLZK6v
         ZyBBGHdgBzrSF+WGdDE0vFEd8woGgOs/AeGaSFCbhoBy6O2dvecmORldmu62wD1NzXCL
         VpMt4tSDqYHJFxOSz6VXIP8ltFuRhDbLg4tcs1dkOqUxex6o16GBQ9bNTzYIh+JCld15
         LxD7QIB/qMxs40P0CYskxUmQmmsJabqn8dg9LW4hwm7/rOMSKtvcune1xYBp/AqlCy0O
         Kw+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gRDaphbKaaiBTQfNJABzc/bHdMK4aRKibRK4EZa3oTc=;
        fh=YYXgiVsqhVZb3j/axOku9w0Ub616GHIpcQgJ089IaT8=;
        b=fpEZtA6/hsyC9bpVElC2rBd5R6hu6oiQJiADcJzvWdLc5wGo7Pd6FLwrjDrhNjUBav
         h3ODuEYQlcB4HgS/u8S7bX5ImAuKGCIeRseNPYdUCGAuIBkxDb2e56Lo/pRx5KiZGxoF
         0876QfTIg1BMa4THEmloSAYDnRzNGIt3Xzh8Pzy3JVzMyEhCSOrsIhs0VlEFrnoltUm9
         ZNDsq7icpT4bpYVUN44u3c/VeZs3lZItuGwZkpVfYEcidH+GSyK9phRKF8YIN6w90QoQ
         A6ECd5GxA5PiHQ6T1f2PTb8bdrtvcD2SnUR0DDrAOSD10fPhOg2XJfDmhFGKMSFYkTDf
         uaoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770136104; x=1770740904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRDaphbKaaiBTQfNJABzc/bHdMK4aRKibRK4EZa3oTc=;
        b=Hcbm8xyItJ7T//WYCVBSa+eAv5LUDufCmbSIr9/0EatuyOo/AosxsDdhj0awaik0lU
         HTZXFjQn7DhpDgu+K0Iz0mk0vqNO67pD1S92IS6NN2QCdfDY3T41asrGQqh4K4yhA48v
         STzrDQae4Nm7c4rTYcRvxl7NbIqZgN0gCqQs0ejELh1klRYalpIMgakz0jJxejEQ5l58
         z7rQM0PvIs4DrVB51oSKlh+Fc74uQdN4pTbqKVfXIZOg0Su5gX9mFCFKfYRIGOh2VyQ4
         BAu7K0EVSgIquiKYGhAbquLZH4T3kTh1UyU4XneTt3hrBoJ5Hcy5TwPEc5K/ZFTpdwtR
         jJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770136104; x=1770740904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gRDaphbKaaiBTQfNJABzc/bHdMK4aRKibRK4EZa3oTc=;
        b=Q6bVOjS8c9RIXSHfRZSeW2I66XH2wZdORw2iHF/qNP95wVFY5g6KlwgTwM8WrwbsMI
         aUGeKfy/Ub7AZhPsz4HkldVB0v6vpN07u3r9jFUaVBV/3I5RpHVFtdzqu5sX0OrCpKAL
         QgF4YDGtkJDu746tyPwKKkR2UAWFBu/VEmlNHEM8MU+s2GBhTtR1InORRF6T8nk+p78E
         huOIZXq4YLKAXT/HtlcU/BPj8wQOgUz3495rbLpPiF8UydXdnMCCTQEthvDLpjNOB9Za
         AuH48hapG+F9t+qFXJQLbfTs20SrP68dy0tdSHglCNh3skMIQ2v49384UYGw9jaCMjbN
         iPnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMBfWUHcESK4tjOSxoaxXV8OEZ3l+4Vl/ONHwJGr0igRm1yk8WD5aYtNNz7DdR/hTPp/8MhMD6/Mkq@vger.kernel.org
X-Gm-Message-State: AOJu0YzBCDEarF6vnHxYcFhrLfFZPkpwm1FTKZbr7FlRlG6Mgz2PkFnH
	kihMCFLncNJdTqFwmeWgEGW2UFP1votL52Y5dNyx6G4yIobIPNHBi1N9EEdwfmqwkhKJF4sg1e9
	EMAJmygaHI/RXE2qslV5C8/Rv5PW+63wF/O2m
X-Gm-Gg: AZuq6aJ8iJwMQjYh/gfi7NGzjgthcTLuIo6LZUQOS2GvFqnsGvI1aqxyCm3zl+S6ETb
	kT+KzbslPASqF0z4+EfdjmLThJlBKIsq4swBDAAZ17eX/wz+Ym5SypCOI83mXDaDg2NjFUTwKng
	mPk/J3CrCOzPyhcg7Tge+giJOONsRr8s5T6q7BTrEz6cBMc8AKo3W1MQmJBJhzcC7MSMxHRzOJz
	dqNH6aooYtlSStd7Jfth1RdcDbua+qVyDH1Fs32lq8FPX0zg6UXS49mzYKHqXa/BZ6qEJtm
X-Received: by 2002:a05:600c:8505:b0:47e:e970:b4e4 with SMTP id
 5b1f17b1804b1-4830e983855mr2996525e9.29.1770136104240; Tue, 03 Feb 2026
 08:28:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201104343.79231-1-clamor95@gmail.com> <20260201104343.79231-3-clamor95@gmail.com>
 <2026020350-unrevised-humming-7a42@gregkh> <CAPVz0n35NkEXjur-oJhW6Yxwme_KMLdYCnRAtjHEWSPEVrSUXQ@mail.gmail.com>
 <2026020346-ashamed-campfire-b483@gregkh>
In-Reply-To: <2026020346-ashamed-campfire-b483@gregkh>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 3 Feb 2026 18:28:11 +0200
X-Gm-Features: AZwV_QhcrxqiNzZ8cC3BM6w2wrqMyFc9v-0naWUEm2SUwORm6CXF_qwNkbtlMVY
Message-ID: <CAPVz0n2HmLwdif5ry+y56LB8Gpwh2o9_gJ7K2jhcZVR=rPgfPA@mail.gmail.com>
Subject: Re: [PATCH v1 2/9] misc: Support Asus Transformer's EC access device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sebastian Reichel <sre@kernel.org>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6831-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arndb.de,rere.qmqm.pl,agorria.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linuxfoundation.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EAF7FDC113
X-Rspamd-Action: no action

=D0=B2=D1=82, 3 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:00 Greg =
Kroah-Hartman <gregkh@linuxfoundation.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 03, 2026 at 01:54:58PM +0200, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 3 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:41 G=
reg Kroah-Hartman <gregkh@linuxfoundation.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, Feb 01, 2026 at 12:43:36PM +0200, Svyatoslav Ryhel wrote:
> > > > --- /dev/null
> > > > +++ b/drivers/misc/asus-dockram.c
> > > > @@ -0,0 +1,327 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > +/*
> > > > + * ASUS EC: DockRAM
> > > > + */
> > > > +
> > > > +#include <linux/device.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/mfd/asus-ec.h>
> > > > +#include <linux/mod_devicetable.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/mutex.h>
> > > > +#include <linux/slab.h>
> > > > +#include <linux/string.h>
> > > > +#include <linux/sysfs.h>
> > > > +#include <linux/types.h>
> > > > +#include <linux/unaligned.h>
> > > > +
> > > > +struct dockram_ec_data {
> > > > +     struct mutex ctl_lock; /* prevent simultaneous access */
> > > > +     char ctl_data[DOCKRAM_ENTRY_BUFSIZE];
> > > > +};
> > > > +
> > > > +int asus_dockram_read(struct i2c_client *client, int reg, char *bu=
f)
> > > > +{
> > > > +     int rc;
> > > > +
> > > > +     memset(buf, 0, DOCKRAM_ENTRY_BUFSIZE);
> > > > +     rc =3D i2c_smbus_read_i2c_block_data(client, reg, DOCKRAM_ENT=
RY_BUFSIZE, buf);
> > > > +     if (rc < 0)
> > > > +             return rc;
> > > > +
> > > > +     if (buf[0] > DOCKRAM_ENTRY_SIZE) {
> > > > +             dev_err(&client->dev, "bad data len; buffer: %*ph; rc=
: %d\n",
> > > > +                     DOCKRAM_ENTRY_BUFSIZE, buf, rc);
> > > > +             return -EPROTO;
> > > > +     }
> > > > +
> > > > +     dev_dbg(&client->dev, "got data; buffer: %*ph; rc: %d\n",
> > > > +             DOCKRAM_ENTRY_BUFSIZE, buf, rc);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(asus_dockram_read);
> > >
> > > No documentation for these new public symbols?
> > >
> >
> > These functions are mainly used in communication between the dockram
> > device, asus-ec and its subdevices. Export is used here because all
> > mentioned devices can be built as modules. I can add descriptions of
> > functions into header if needed, but they should never be used outside
> > of dockram-EC complex. Same applies to 2 export functions in the EC
> > MFD.
>
> Then you should properly document this :)
>
> > > > +static BIN_ATTR_RW(dockram, DOCKRAM_ENTRIES * DOCKRAM_ENTRY_SIZE);
> > > > +static DEVICE_ATTR_RW(control_reg);
> > >
> > > You did not document your new sysfs files in Documentation/ABI/ which=
 is
> > > required.
> > >
> > > Also, why do you need a brand new user/kernel api at all?  Who is goi=
ng
> > > to use this and for what?
> > >
> >
> > These api were used mainly for debugging/logging purposes and descend
> > from original downstream EC driver. I can both add documentation into
> > ABI or remove them if that is absolutely necessary.
>
> Debugging should not be in sysfs, please put this type of stuff into
> debugfs instead if you really need it.
>

There is no similar way to handle BIN_ATTR_RW in the debugfs (), may I
preserve  dockram_read/write with __maybe_unused instead of removing
them? I will add comment with explanation

> thanks,
>
> greg k-h

