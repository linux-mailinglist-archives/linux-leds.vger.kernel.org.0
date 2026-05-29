Return-Path: <linux-leds+bounces-8361-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOGqJpNfGWpevwgAu9opvQ
	(envelope-from <linux-leds+bounces-8361-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 11:42:43 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5FB6001BB
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 11:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2D7B3069635
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 09:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1080E3BF667;
	Fri, 29 May 2026 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ER/ZUh/n"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1363B3C3456
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780047614; cv=pass; b=uPWY5j2lRx0AiKzl6dnsjsGE6gbMYK8RkSrDDJnPTuE0YGg5k3OGyADqoXDc8JRJPEapxkHcUQA/4d/ZvQRitqNGBM7+iXQOD4k+zMzkd2zSHhNDZ+rFXIKym4xeF6jwjNlHeExA00B/3jstuh6MXS3rN8TeaCXUfckW9pqiH0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780047614; c=relaxed/simple;
	bh=hg1MJgJp69xCiE6cXF9NCpUM7bLjzfVxjRpPbrpZrNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFYvKWLjdSubru0d2s15xB/WqARQKzzRl50R/3Fp/ijKv6YaS76Ma4O3b3M3jQfVDqVMBGxnhQwo7mvejBTBCYhpiUxbW18n9m9K6PNpA5wtR+AIy1hX66irKRfnNm6PTA4hV41h+UIa1A+FDVzcvIwPQpWEahS+LHFUYJEX/1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ER/ZUh/n; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304f590dd91so64326eec.0
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 02:40:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780047609; cv=none;
        d=google.com; s=arc-20240605;
        b=kK+yu+wRHNsfUvh1lbJK9Q8Ma3kkoCFm+aWiIwlxB2wmlqbmS+vAUtOXIwKkFic50w
         3UU7L4q/alPohzR4ZNtBCDu2edov9M15rvHafuxl6N2Art4uBXg07aB30cmGuLhaV20z
         b+TMlKyVPnR+cmJw9L/pNcNeHp8cFRBb9ooXg3vU7mkEd1Pv9y2wD1IafOFjgpC32JrQ
         C1Wq3LnpWS150DRS21C3rhuULt1y2v7HEw8lXpSmYE/ejdfTBxiS/4feLC/KWhB429lo
         l43NNLEFExhCao4Ih0F6VsvMHddxKqGjxJ0qtWkXTVZsN85rns0uPpTzyDdUe+9adN9u
         CKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CNp8LY64my7Ot0qUd7egC8x+n5gTs/XUD+GWS+UeAxA=;
        fh=2l01rtbxbfCjDju5m/EyN6zV7xQTv3ufYhTiJt9vTGg=;
        b=iAXWZ9Jiktc+EJq+3NvSwEEYD8oaCjajG6nOZL/fRxtrQz8mmxsM4jpa3CKK+K/gnA
         66L6SeZKU8LuSpjFFggl13laHOp5m0HLP8iuPHOauXwFMvvissootAVHikT9RQeDsn50
         RLR2jgVbOAkZc461MiHBk37yRMaO0lQAg5x7fOBUYaVxv0ioQzAMv2BD2CnDmp4yLpNd
         dQpmaCWlL7AvPDJYWDxC52HQzSfeRIp5eY7pBthjyNC1i2fB2mctIA89As/3mw4gWcGP
         DqEHLO+7aINLpNowTurL4SQkmSv0rHN8HUXx6Txqd/gAAJee63642uNGdFQVzK7iSsbk
         SHXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780047609; x=1780652409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNp8LY64my7Ot0qUd7egC8x+n5gTs/XUD+GWS+UeAxA=;
        b=ER/ZUh/n9BTKkNEbqFe4m2wNZ7eu/R3sRNbBT86MgRvs9JqHi+OEBGDBuazyQcnncd
         DRyKGjwuI1VbaNL5v2j5cXy+22qLNHSm37J0Rf4rGoIPm8wH7ngdWn48jisI69LF4DWP
         F/wnJznYogmxTTLscmY7dkEQs77qyyPn4kxwDB2eIRyccVVMsshqrKzP50X7HwLpt7Er
         +64is3HsJHHYpsx9UoLYPqlvg+go3bpy/YzirrA/vglper5FJFNY4+dmGbpMcnreyG53
         E4LogGWgyd4DCdMgYPZaaPyR3aY8J1Scs0PatWDN2jV2imyXRsGD9gEhAt0B88/cm7Ri
         I31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780047609; x=1780652409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CNp8LY64my7Ot0qUd7egC8x+n5gTs/XUD+GWS+UeAxA=;
        b=mv3LYT78Vv8gs8ss6nuk4/hklC4K9C7YiYcGe8g8dmdvIUNa+y9iHeJYsKG4BV4vtX
         xbRarcTcAkCtyAbm2D2ff71DoCCsnbHNZTSzO8N3HDR4c7Rm6ZKndR6FTVQonioZKdqw
         xDxumcBVQF6zAUeBJV8A3aLw13g+iZ4NHjcWkUlcBq//jKAGIb6znaCAOW+TX1FgEHOy
         LOyJHWw58QgLgE9rVDYjoMAXxHQTNzlgYerIjrIkXeVT6TOLjHhOXV5EJdgcapytFxph
         /yr9RdR7xyU/YHfK4SoYRRCSdFSraplj14j39IsP8Wia6/pLabUkpEAC1kkVElKQryV+
         McZg==
X-Forwarded-Encrypted: i=1; AFNElJ/liR5tt6Rtpr4p5xIZubkSR4Zcr6kMo0hCMl+bLXgJj+NhL7Hb+aNtTCyS5U85/ku83spQjUMWRgAE@vger.kernel.org
X-Gm-Message-State: AOJu0YxrnWu8mSpJj0VsEnaqHFqJJnzdR8DO8+noSyihe2Kc6JqE46SG
	py9sA3CgUWWpmuPYR7CBf2mhaRJ5dChgqcVjua6XYF7MHuZXShK8xiuqSZ50n2VZq1LJq9M3vA3
	GOl3aW0U2ixQuErPlCbHrnP+2SLDplw0=
X-Gm-Gg: Acq92OHHAl280aZak12bHBzc+ilaIPPOKdllj9oT0h99NJT7TtbTnK9OYGSVZUa1oqa
	mq0XCfk+fktQKnr7ZGFfvPpnDmv4+tQ9D6HDFdzysmaDX0kTAdMBAhLZileU0Rj3aAmwpLVHPpl
	wPu12hwUysvhuLZrrCkfzWsh1x+SfFHyi/MofKTdJxPCtlZbwQbRJESezPl2mhgLPtRgbJzVOiG
	QeBBlISGyRsA4F8o2Fw18rZm0Dni1sKhxOve+vIWXpW0E42z3ScSQCC2YYDVbWedK+n2Kro742/
	yHwUndq7X1jhoVJMd2I=
X-Received: by 2002:a05:7300:371e:b0:304:d75b:f5df with SMTP id
 5a478bee46e88-304eb1f674amr920610eec.19.1780047608587; Fri, 29 May 2026
 02:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528135123.103745-1-clamor95@gmail.com> <20260528135123.103745-3-clamor95@gmail.com>
 <20260528155001.2bcb7003@jic23-huawei> <CAPVz0n0qCekQVGGyAyBuYv+RKC6bpydYBLJNGfPrgTYjtOJOuA@mail.gmail.com>
 <20260529100819.1823ebb3@jic23-huawei>
In-Reply-To: <20260529100819.1823ebb3@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 May 2026 12:39:56 +0300
X-Gm-Features: AVHnY4KxytPKwIfHLJ8T1GXio2-Gko93x1b9EqyHTERy5U5OnXbey3uFJfFakx8
Message-ID: <CAPVz0n0VHdUo5oHdALgcerLsykdz-2n7c+jxYHrMOV7Ra5x_qQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] mfd: lm3533: Convert to use OF bindings
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8361-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3C5FB6001BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=BF=D1=82, 29 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 12:0=
8 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, 28 May 2026 18:03:31 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > =D1=87=D1=82, 28 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
17:50 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, 28 May 2026 16:51:19 +0300
> > > Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > >
> > > > Since there are no users of this driver via platform data, remove t=
he
> > > > platform data support and switch to using Device Tree bindings.
> > > > Additionally, optimize functions used only by platform data.
> > >
> > >
> > > At least the IIO ones would have made much the same amount of sense f=
or
> > > dt, just that they weren't having in the first place. I'd prefer that
>
> Gah. I write gibberish after too much reviewing.  having/helping!
>
> > > as a precursor patch to make the rest much more readable.
> > >
> >
> > I can add you preferences into this commit, I don't mind.
> >
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > >
> > > I only looked in detail at the iio bit. A few changes requested.
> > >
> > > > ---
> > > >  drivers/iio/light/lm3533-als.c      |  95 ++++------
> > > >  drivers/leds/leds-lm3533.c          |  51 ++++--
> > > >  drivers/mfd/lm3533-core.c           | 268 ++++++++++--------------=
----
> > > >  drivers/video/backlight/lm3533_bl.c |  52 ++++--
> > > >  include/linux/mfd/lm3533.h          |  51 +-----
> > > >  5 files changed, 212 insertions(+), 305 deletions(-)
> > > >
> > > > diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3=
533-als.c
> > > > index 99f0b903018c..cbd337b73bd9 100644
> > > > --- a/drivers/iio/light/lm3533-als.c
> > > > +++ b/drivers/iio/light/lm3533-als.c
> > >
> > > > @@ -714,59 +720,33 @@ static const struct attribute_group lm3533_al=
s_attribute_group =3D {
> > > >       .attrs =3D lm3533_als_attributes
> > > >  };
> > > >
> > > > -static int lm3533_als_set_input_mode(struct lm3533_als *als, bool =
pwm_mode)
> > > > +static int lm3533_als_setup(struct lm3533_als *als)
> > > >  {
> > > > -     u8 mask =3D LM3533_ALS_INPUT_MODE_MASK;
> > > > -     u8 val;
> > > > +     struct device *dev =3D &als->pdev.dev;
> > > >       int ret;
> > > >
> > > > -     if (pwm_mode)
> > > > -             val =3D mask;     /* pwm input */
> > > > -     else
> > > > -             val =3D 0;        /* analog input */
> > > > -
> > > > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, val, =
mask);
> > > > -     if (ret) {
> > > > -             dev_err(&als->pdev->dev, "failed to set input mode %d=
\n",
> > > > -                                                             pwm_m=
ode);
> > > > -             return ret;
> > > > -     }
> > > > -
> > > > -     return 0;
> > > > -}
> > > > -
> > > > -static int lm3533_als_set_resistor(struct lm3533_als *als, u8 val)
> > > > -{
> > > > -     int ret;
> > > > -
> > > > -     if (val < LM3533_ALS_RESISTOR_MIN || val > LM3533_ALS_RESISTO=
R_MAX) {
> > > > -             dev_err(&als->pdev->dev, "invalid resistor value\n");
> > > > -             return -EINVAL;
> > > > -     }
> > > > -
> > > > -     ret =3D lm3533_write(als->lm3533, LM3533_REG_ALS_RESISTOR_SEL=
ECT, val);
> > > > -     if (ret) {
> > > > -             dev_err(&als->pdev->dev, "failed to set resistor\n");
> > > > -             return ret;
> > > > -     }
> > > > +     device_property_read_u32(dev, "ti,resistor-value-ohm",
> > > > +                              &als->r_select);
> > > Does this have a default?  If so the pattern we've recently be settin=
g on for IIO
> > > is
> > >         if (device_property_present(dev, "ti,resistor-value-ohm"))
> > >                 ret =3D device_property_read_u32();
> > >                 if (ret) //corrupt property in some fashion
> > >                         return ret;
> > >         } else {
> > >                 //set default
> > >         }
> > > If there is no default then check it unconditionally.
> >
> > default value is LM3533_ALS_RESISTOR_MIN and if no property is present
> > clamp will ensure that als->r_select will be set to
> > LM3533_ALS_RESISTOR_MIN
>
> I don't see that default in the binding doc and relying in the 0 being cl=
amped
> isn't particularly readable - I'd set it explicitly.
>

Oh, ye, my bad. Schema enforces one of props to be present and if pwn
is present then resistor is ignored. What if I move resistor reading,
clamping and conversion under !als->pwm_mode check? Then resistor must
be present and hence must be checked unconditionally.

Additionally, I can comment original lm3533_als_setup with #if 0
#endif then git formatting will be much cleaner and easier to review,
and once we all come to result I will just remove entire commented
block and Lee can pick clean commits.

>
> >
> > >
> > > >
> > > > -     return 0;
> > > > -}
> > > > +     als->r_select =3D clamp(als->r_select, LM3533_ALS_RESISTOR_MI=
N,
> > > > +                           LM3533_ALS_RESISTOR_MAX);
> > > > +     als->r_select =3D DIV_ROUND_UP(2 * MICRO, 10 * als->r_select)=
;
> > > >
> > > > -static int lm3533_als_setup(struct lm3533_als *als,
> > > > -                         const struct lm3533_als_platform_data *pd=
ata)
> > > > -{
> > > > -     int ret;
> > > > +     als->pwm_mode =3D device_property_read_bool(dev, "ti,pwm-mode=
");
> > > >
> > > > -     ret =3D lm3533_als_set_input_mode(als, pdata->pwm_mode);
> > > > +     ret =3D lm3533_update(lm3533, LM3533_REG_ALS_CONF, als->pwm_m=
ode ?
> > > > +                         LM3533_ALS_INPUT_MODE_MASK : 0,
> > >
> > > That's ugly.  Better as
> > >
> > >         ret =3D lm3533_update(lm3533, LM3533_REG_ALS_CONF,
> > >                             als->pwm_mode ? LM3533_ALS_INPUT_MODE_MAS=
K : 0,
> > >
> >
> > Yes sure, just followed 80 char limit.
> >
> > > Though if there wasn't a layer hiding the regmap, it could just have =
been
> > >
> > >         ret =3D regmap_assign_bits(lm3533->regmap, LM3533_REG_ALS_CON=
F,
> > >                                  LM3533_ALS_INPUT_MODE_MASK, als->pwm=
_mode);;
> > >
> > > which would have been nicer.
> > >
> > > I'm not particularly keen on the swashing of the helpers being in a p=
atch
>
> smashing.  (this definitely wasn't my best effort at English!)
>
> > > that is about switching the binding type as feels largely unrelated.
> > > Should really have been a precursor, easier to review patch.
> > >
> >
> > Removing of lm3533_update layer is not the scope of this patchset.
>
> Understood.  I'm fine with just the refactor you are doing brought out as=
 a precursor
> patch.
>

I have looked into removing wrappers too. That seems to be less a
hassle that I anticipated, so I will include regmap switch in the v2.

> >
> > >
> > > > +                         LM3533_ALS_INPUT_MODE_MASK);
> > > >       if (ret)
> > > > -             return ret;
> > > > +             return dev_err_probe(dev, ret, "failed to set input m=
ode %d\n",
> > > > +                                  als->pwm_mode);
> > > >
> > > >       /* ALS input is always high impedance in PWM-mode. */
> > > > -     if (!pdata->pwm_mode) {
> > > > -             ret =3D lm3533_als_set_resistor(als, pdata->r_select)=
;
> > > > +     if (!als->pwm_mode) {
> > > > +             ret =3D lm3533_write(lm3533, LM3533_REG_ALS_RESISTOR_=
SELECT,
> > > > +                                (u8)als->r_select);
> > >
> > > Same applies here. Mostly an unrelated change as the only thing switc=
hing that
> > > is related to the patch is one parameter.
> > >
> >
> > Removing of lm3533_write layer is not the scope of this patchset.
> >
> > > >               if (ret)
> > > > -                     return ret;
> > > > +                     return dev_err_probe(dev, ret, "failed to set=
 resistor\n");
> > > >       }
> > > >
> > > >       return 0;
> > >
> > > > @@ -852,25 +825,28 @@ static int lm3533_als_probe(struct platform_d=
evice *pdev)
> > > >       indio_dev->channels =3D lm3533_als_channels;
> > > >       indio_dev->num_channels =3D ARRAY_SIZE(lm3533_als_channels);
> > > >       indio_dev->name =3D dev_name(&pdev->dev);
> > > > -     iio_device_set_parent(indio_dev, pdev->dev.parent);
> > >
> > > I'm not sure why this was there in the first place.  Hence not sure i=
f it
> > > is safe to remove.
> > >
> >
> > This is directly related to OF conversion. The iio_device_set_parent
> > bound indio_dev to parent, and it causes problems with OF now since
> > als output has its own node and binding it to parent if wrong. Same
> > story for backlight and leds btw.
>
> Is there any risk anyone was using the canonical path to get to the iio d=
ev?
> /sys/bus/platform/devices/..../iio\:deviceX
> This is technically an ABI change be it a subtle one.
>

Linux kernel has no users of this driver, and it is in "stale" state
for more then 2 years (maybe even longer). I have cc'd Johan Hovold.

https://lore.kernel.org/lkml/ZmBcvtLCzllQDWVX@hovoldconsulting.com/

This this 2 y. o. discussion and there were no actions ore movements.
I assume this driver in its current form has no more users. This does
not mean that it cannot be revived though.

>
> >
> > >
> > > > diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.=
c
> > > > index 45795f2a1042..d707d43d5526 100644
> > > > --- a/drivers/leds/leds-lm3533.c
> > > > +++ b/drivers/leds/leds-lm3533.c
> > >
> > > >
> > > >       led->cb.dev =3D led->cdev.dev;
> > > >
> > > > -     ret =3D lm3533_led_setup(led, pdata);
> > > > +     device_property_read_u32(&pdev->dev, "led-max-microamp",
> > > > +                              &led->max_current);
> > >
> > > I'd prefer explicit setting of the default to be visible before this,=
 or
> > > the property_present pattern I mention in the IIO review above.
> > >
> >
> > clamp will ensure that led->max_current will be set to
> > LM3533_LED_MAX_CURRENT_MIN regardless if it it present
>
> As above, I'd prefer it set explicitly.
>

I understand your position and I am not denying it for ALS part, but
LEDs don't belong to IIO subsystem and different subsystem maintainers
may have drastically different preferences and requirements (ugh, PTSD
in its full glory).

> >
> > > > +     led->max_current =3D clamp(led->max_current, LM3533_LED_MAX_C=
URRENT_MIN,
> > > > +                              LM3533_LED_MAX_CURRENT_MAX);
> > >
> > > I didn't look any further (busy day!)
> >
>

