Return-Path: <linux-leds+bounces-8237-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FKRBYIaDmpT6AUAu9opvQ
	(envelope-from <linux-leds+bounces-8237-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 22:33:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D629599C20
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 22:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BDB034D861F
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 17:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FF53C6A5C;
	Wed, 20 May 2026 17:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAkANWxY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EF93EC2DB
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 17:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297922; cv=pass; b=spwkZ1R7Vbh6c4PHnhXUGoJSrBKkvrPv+QBtMVPlpVhMdf79CSTC35jXWHR2hmwdrEHUaUuARaX5/glZSzh2LZVU931wSAy9x6NC4CAJBAGibh79J9EDgiZCDDjalKxatU+cCzpMxmtLwJC7rXoVt8BHprFCMwM11pCa0CYYJVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297922; c=relaxed/simple;
	bh=W2Zmr4LzjuX8U/fTumYg4RTnYzSgBW2304Rq62FECyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jC7zXB6agPxC0cNEkxuQ0Uerb1O5o+P567SvkdSRFg4SKXOU3jxIYd8Apd10qXrciXxDucAex6l1aDsNh9UKWz0JIav6vh/cHmgbvMq6Zb1291gzAFovzkeNx6ZxBDRFKvzsik++tyQHgO2GJ39qkxHmRWPBtgWOmIJ8HvrobMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAkANWxY; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f0ad52830cso6636517eec.1
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 10:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779297920; cv=none;
        d=google.com; s=arc-20240605;
        b=jAnUa+uy8OuFSRTBW/Cz6QdXRnhruN3n5PfVoZ1lMBLqpjfmwsvKTkgsK0VtaF97zg
         YndIol3GBVJaxNbgksC524xA8vLBM7+BmcnTpp/ihDtRl51NJZuITupcI6azQI208KGm
         nkIm/yc2095sx/VkYtTTFIj0+k8xWvLh0M9GqQvO1EnXwsYfERGFFK9tqIm0/SPCHVJp
         UQE0Y+unte8/bon7ED5C7ZlicbHl5Hr8LADqoU5bpmheVeQ78CF+siTMben0nh6vf4pL
         2/BEoa8F22rmdqYw2oLhdSwnht+IlIz63aKM/GUwUBkAsVZo+ublDJICqp7wTOUwdDsT
         0P8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pTJ+qpNqxTVRFJSoAdeWMwfmemEjKB7qZTfcUw2okZU=;
        fh=c0dXS1HFcxa0v5foEqnKyfYLmN3ETgX1zAQSZeTJm/w=;
        b=M+11Ku5x5yIIOiUhH97X6Y1gGMAwOeaKdCFBtZdh22HQxKGrHY39BFJsubW/O5+MmY
         1tq8uGQH90YeWeQop6tPDy7lqaJmA1ACZtGEQeg0vtY25mby5AFWE8X4ysFzIwn/z0j+
         QOh0FGr7kSHWjKbeEt04TQq5ABbzo8+9HM3fr+YsHE897i5TjYsYL459IqjtsFyIEY9I
         5jyQCJEYw9DW1KKeaRKm3G5tmfg3kZMiLuTbMTZx7DiXXD4qwiYq22XQiXc9Kis5KLfi
         4T6ASzdjZFod92JUY8+QedsXa4xgJIcX9qpTuBsIYeC3EqsRqn6cpfbsWrzm4tGJwalR
         OOBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779297920; x=1779902720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTJ+qpNqxTVRFJSoAdeWMwfmemEjKB7qZTfcUw2okZU=;
        b=gAkANWxYemAGONkvLMT1fPXjq+Yt9PD1eHV23t/UFmaCX8k8McSRrj5tfiUjcqftiJ
         uSVc5DSjJp+hQoGF3CrxuedDFr8CUG70gU4x97mONWH4A+BO360ehTZvOcnWQnJP+53S
         iF+cnm2QmpJaGaGTSxUJmo9u8zVhsdnhFEn224A3t/ATpq9TaLJDsApuc2WevTRvgVxe
         j40yq35FYPx9PbYMToT/6Fd4WpccBSwJgYznwA37/b1yL2Jp/W4u0as9TH1+cDdeDz9m
         bt47CeJAqL9a4aM+LHDXEesTRZWS7534BZ324PhyAgmkg1MNhZP+VdJ7g1RQDFT3L9A+
         s9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779297920; x=1779902720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pTJ+qpNqxTVRFJSoAdeWMwfmemEjKB7qZTfcUw2okZU=;
        b=Ynlp9D2UVbjhzhRowiJMmw+T+PvIpKrFMuMLl42AJ0NoQpAZD317J0Z3c8xbcL4494
         wEdx/9HLsSaZ2ojtmOUoOIHVkYmFeE+h11ntshxwotS/6RuhbaezLj+qc0ua59a1rV3F
         7Bce78gTXwa4nZvARZIGSJKsMn9uipQ8EOnauhxHjlGOxzNrPTAqEgXlQmCJXOoR/d/z
         DlSPxMfL9xbmVHAyAe93mfr6PHlV2FqCxZySs2jd45JKQ7eO7E0EdODDLhaGceRzpqX5
         czmb4FDdcvRJR491fRzBtA3qwBDgWokQ32PYqfg7WhvMug96zEy84o74PJEH34P7dvoh
         KpHw==
X-Forwarded-Encrypted: i=1; AFNElJ/AAzFJ6LgHv+nXZR77gmcMad30xTJn/cSzAr63pzVZsn+HZ6FX/Tgi6ooskUpN4/RQ9GB+vnJPphyL@vger.kernel.org
X-Gm-Message-State: AOJu0YwWVq1O1nzs1tle7k3ymywy0zT06Fbl1mcYy9JbrYsefANC/DKa
	JRQr58XEAkQx75xqEuQB9EocJtCZVoihc9r6xQ7yqkl+6V9lWKq/kT8r5VoF7qR/edYyLXvRciF
	GQI3tZ48nS2VMnbMU76lGjhmt9C3VQik=
X-Gm-Gg: Acq92OGFL6OjH29CzX6kFJtG1l8hbL/Ig8tqeSMAnTdLJyXZ4mYxOZvJMWotKMmJdGZ
	rFex+191v3dD83FkI2aqK9RyzAHEnKs4Z+xs7oiwfWB9T6CbmgvYqGJok9Pf178lyOp3tLk9YCh
	d28+EXGaznQ9IID3AZxaYU31tpIFtrbT0dZoGRDg9yD3kykJIxeuzOo+R0GXiRz4A2mIfnis7oW
	U/5j9hTkzfPyyv70YTNDFdF5MkoiU8PVFMn9dM6SkYZuOMzGL3f8c0FMTPD1czKQBEPg+ds6FEm
	+odlBDZLYkqmfHUnsnE=
X-Received: by 2002:a05:7301:9f18:b0:2e2:4979:ec7 with SMTP id
 5a478bee46e88-30398188068mr12104364eec.10.1779297919372; Wed, 20 May 2026
 10:25:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510110804.33045-1-clamor95@gmail.com> <20260510110804.33045-6-clamor95@gmail.com>
 <20260520150758.GG2767592@google.com> <CAPVz0n0t4PXfmgWYQ1vSTFwfg=+g4oGU+-dwgnBVKxUoUwHGqw@mail.gmail.com>
 <20260520160548.GK2767592@google.com> <CAPVz0n2s32uYP76R9VNtWYnHrDQJKK+qC1uRRdkaX1ekF15Pww@mail.gmail.com>
 <20260520170234.GN2767592@google.com>
In-Reply-To: <20260520170234.GN2767592@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 20 May 2026 20:25:08 +0300
X-Gm-Features: AVHnY4JZhma2ixtU98PfXtnc_wi0qyCf3_sR6bNe6Gls04f5jclDHbIKfn1qbLE
Message-ID: <CAPVz0n29SdjJxj6nx7GPx4+L_a-wZ-i+5jiOpL2btR_FQdp47Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] mfd: motorola-cpcap: diverge configuration per-board
To: Lee Jones <lee@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8237-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8D629599C20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D1=81=D1=80, 20 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 20:0=
2 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 20 May 2026, Svyatoslav Ryhel wrote:
>
> > =D1=81=D1=80, 20 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
19:05 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, 20 May 2026, Svyatoslav Ryhel wrote:
> > >
> > > > =D1=81=D1=80, 20 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=
=BE 18:08 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Sun, 10 May 2026, Svyatoslav Ryhel wrote:
> > > > >
> > > > > > MFD have rigid subdevice structure which does not allow flexibl=
e dynamic
> > > > > > subdevice linking. Address this by diverging CPCAP subdevice co=
mposition
> > > > > > to take into account board specific configuration.
> > > > > >
> > > > > > Create a common default subdevice composition, rename existing =
subdevice
> > > > > > composition into cpcap_mapphone_mfd_devices since it targets ma=
inly
> > > > > > Mapphone board.
> > > > > >
> > > > > > Removed st,6556002 as it is no longer applicable to all cases a=
nd
> > > > > > duplicates motorola,cpcap, which is used as the default composi=
tion.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  drivers/mfd/motorola-cpcap.c       | 142 ++++++++++++++++-----=
--------
> > > > > >  include/linux/mfd/motorola-cpcap.h |   6 ++
> > > > > >  2 files changed, 87 insertions(+), 61 deletions(-)
> > > > >
> > > > > Looking much better, thanks.
> > > > >
> > > > > Nit: A patch-level changelog really is much more helpful to revie=
wers.
> > > > >
> > > >
> > > > Noted, but I will not guarantee that I will do patch-level changelo=
gs, sorry.
> > >
> > > That's fine.  All I can do is ask.
> > >
> > > Note that, helping out reviewers usually ends up helping you too.
> > >
> > > [...]
> > >
> > > > > > +static const struct mfd_cell cpcap_default_mfd_devices[] =3D {
> > > > > > +     MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpca=
p-adc"),
> > > > > > +     MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,cpcap-battery"),
> > > > > > +     MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,cpcap-regulator"),
> > > > > > +     MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpca=
p-rtc"),
> > > > > > +     MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,cpcap-pwrbutton"),
> > > > > > +     MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,cpcap-usb-phy"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpca=
p-led-red"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpca=
p-led-green"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpca=
p-led-blue"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpca=
p-led-adl"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpca=
p-led-cp"),
> > > > > > +     MFD_CELL_NAME("cpcap-codec"),
> > > > > > +};
> > > > >
> > > > > Nit: I wouldn't complain if you wanted to have all of these on a =
single
> > > > > line for neatness.
> > > > >
> > > >
> > > > Noted
> > > >
> > > > > > +static const struct mfd_cell cpcap_mapphone_mfd_devices[] =3D =
{
> > > > > > +     MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,mapphone-cpcap-adc"),
> > > > > > +     MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,cpcap-battery"),
> > > > > > +     MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,mapphone-cpcap-charger"),
> > > > > > +     MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,mapphone-cpcap-regulator"),
> > > > > > +     MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpca=
p-rtc"),
> > > > > > +     MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,cpcap-pwrbutton"),
> > > > > > +     MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,mapphone-cpcap-usb-phy"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpca=
p-led-red"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpca=
p-led-green"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpca=
p-led-blue"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpca=
p-led-adl"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpca=
p-led-cp"),
> > > > > > +     MFD_CELL_NAME("cpcap-codec"),
> > > > > >  };
> > > > >
> > > > > A lot of these are duplicated, right?
> > > > >
> > > > > I would have a comment set, then the differences in separate cont=
ainers.
> > > >
> > > > It may be impossible to predict a generic setup since some devices =
may
> > > > require unique compatibles, other may not have LEDs, third may be
> > > > partially incompatible with existing cells. In other mfd cases
> > > > creating a generic bundle might be good, but in this case I would
> > > > suggest better to keep these separate entirely per-device. They wil=
l
> > > > not take much space, nor add confusion with these macros.
> > >
> > > I'm not sure we're understanding each other.  Let me give you an exam=
ple:
> > >
> > > static const struct mfd_cell cpcap_common_devices[] =3D {
> > >      MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0, "motorola,cpcap-b=
attery"),
> > >      MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc")=
,
> > >      MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0, "motorola,cpcap=
-pwrbutton"),
> > >      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-r=
ed"),
> > >      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-g=
reen"),
> > >      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-b=
lue"),
> > >      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-a=
dl"),
> > >      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-c=
p"),
> > >      MFD_CELL_NAME("cpcap-codec"),
> > > };
> > >
> > > static const struct mfd_cell cpcap_default_devices[] =3D {
> > >      MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-adc")=
,
> > >      MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,cpcap=
-regulator"),
> > >      MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,cpcap-u=
sb-phy"),
> > > };
> > >
> > > static const struct mfd_cell cpcap_mapphone_devices[] =3D {
> > >      MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,mapphone-cp=
cap-adc"),
> > >      MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0, "motorola,mapphon=
e-cpcap-charger"),
> > >      MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,mapph=
one-cpcap-regulator"),
> > >      MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,mapphon=
e-cpcap-usb-phy"),
> > > };
> > >
> > > This way, it's super easy to read / maintain the common and unique de=
vices.
> > >
> > > The only potential drawback would be 2 calls to mfd_add_devices() but
> > > that's common practice.
> > >
> > > Also notice that I droped the "_mfd" parts, which you should too.
> > >
> >
> > What if next added device does not have cpcap-battery, cpcap-led-adl,
> > cpcap-pwrbutton, uses external codec and would require cpcap-watchdog
> > which is not yet present. This will cause issues. Even Mot introduces
> > in the last patch of this patchset has slightly different composition.
>
> We usually just code-up what we have _today_.
>
> If new devices come in with different requirements, it takes 5 mins to re=
jig.
>

Ok, but I will take into account Mot commit when factoring out common.

> --
> Lee Jones

