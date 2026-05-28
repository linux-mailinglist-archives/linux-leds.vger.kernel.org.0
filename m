Return-Path: <linux-leds+bounces-8357-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNkPD3ZZGGq9jQgAu9opvQ
	(envelope-from <linux-leds+bounces-8357-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 17:04:22 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F3C5F41A3
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 17:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23136301913C
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 15:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C622F549F;
	Thu, 28 May 2026 15:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuVjPwSE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FA523394E
	for <linux-leds@vger.kernel.org>; Thu, 28 May 2026 15:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980633; cv=pass; b=Cq5eukdh8r5MykmnP+bPldc5txGCRuTwEVzN/eXxUwS5W5s9KTW2vYEoVf0SLbRrII5XflFUX6rmK1B/fXKiA+vbWp771iRiP+IJWCbKDoFvjPlpex3t+TR63zyZdPVQbs4QG25CW48dcCev0L9XMylzrp94/urAg3Uf/3FaN5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980633; c=relaxed/simple;
	bh=s3vC6wnoLZ1XKUWcUoScolE5ZeO4GGneFSy9sZNGveU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C07iEZPs76zMkTgcrdVrAmE87ulwg1vNvWccFAmDqxGaxx2AbSH6Of0l3OSIB0Y+Wx6+uKAzfimVrxSQQibXoLcZB3d4z5nxASI5Zdkr6jvuLQByiZn2z9fh52+VI3Vob6BNzJur3kMVEAW1MHTpcUeBTVm5+x0uE6MuSgFq3Kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuVjPwSE; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3025d725a05so28160419eec.1
        for <linux-leds@vger.kernel.org>; Thu, 28 May 2026 08:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779980623; cv=none;
        d=google.com; s=arc-20240605;
        b=GdrNNfM8yTqOzuZVO3LoxBRgvgpn7JorTMhAW+oYNoOxxEF/NYA2GQ+JhJoeOjS94O
         pcDZrCIQgJ08Ix104FV+GATTdhMKq3hkNAT8nCNkU/VfS+9z22SxQic6ffNsr2ZZnZ/X
         MaZfut3IJEYWSmaHEBT2qmS0sg6ZJrSEZ1mkEgtRYXalbbiYOo3CE6/c0vrdWZm336uQ
         h21rooS5vj0UwwbKYp2l0L+pveJjJ4fyFrFw/tp3kcAP5DYZBcj5PYiGMypcIg6BHUf8
         1wxWnNVxZ71fayZoo488TjboXKIeACtGuIIbz+wA/9U4UG88FJFU+OarUl9pgyMD3h6b
         h/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=999rZWGlrRMiFPTcWjsNb4DI/hC1DrKVLDhSSMIwam0=;
        fh=WikI6KPTI5d84gdKDyzh7TvJNUr/zDEH6U2raeBs+pU=;
        b=IdcA3+3TkNMOJfk65whnH3WuSNGhE7RPKRuZL3kiggfGjSWDUxCAqcURhxYaroZj2h
         vmzaL+as+UJvFrKXfccIzE0QYEEcttzceZVpnkRXrMzHEekIauSmTAPpyjvbD0/VNslQ
         SzsvcM6djA7t01p/U9D9dq7DQ7Wzackve3TwBkbNXkLCDWr245IFBJUYsbtpScN4JcJ3
         GEZbPg4aUQrG6MfIG/7HMZiJC63Gw/X1Kywytc1lQXarRtaSdpIrgi/uToZ6tUdcK6A8
         IahrDrRqzcbB53Vg5uFsZbeBBO7hEce1vj+cS+7sgKLiHJaQS07XRevgRflGg65WJS5J
         7kDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779980623; x=1780585423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=999rZWGlrRMiFPTcWjsNb4DI/hC1DrKVLDhSSMIwam0=;
        b=fuVjPwSEbktOykrRELN/cZftb6kIQsBcY83Isn0NjFaQGapKKFBb4rbpbh5I5mJINE
         eXUBy+gIboUF1wwiFdEt+D0YT0LG8KIdxdvcFAaC9sq+ocUwf55CUxujMo/CaDMLUWtX
         qnk+FpTobIjOFMk/Be7YvchW7TINllERCKZ2DZW1mnAWLP5qGz9b91lKyBrgYynd0KbT
         uQVwmTwGcNm4+v0qTce3bv7Bv97wUUCDJVvhvAHzOXPL3cQ64+zKGrvyuakLfl3Qw+6i
         SkqoBsLgUimHb81i1SeA3hsVIf40qYuN8z6moa1D7RGCjLc9ydxsME3fPLU17m9DWkjF
         ACHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779980623; x=1780585423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=999rZWGlrRMiFPTcWjsNb4DI/hC1DrKVLDhSSMIwam0=;
        b=PsfPLegs/H65heb0Bjg3y6WaT7JDZ0Di2IoX1ghIANe7fF45A78JwjvTmuE/gd+QI8
         R7daCR/1iYB9M0Ty7I1N3TLTxC6QTTGT0srmMd+6ALMmfNtmd7fwsJ1JEQF1y0edd69H
         YqGmKOHxu1XsMOjCssKdh8fDtxrKGv7YumTDDuLAPavnsJyxUzMAx3nZung4G2MtwM5z
         NXj/kQsla0lneFOMg4wN6xbQzpA5pXv5pBqOuhqDI/DecpB8UWMiks6YVhodseymRsHW
         AMXpKFxn1gHiLn7xjUf4dM1Wn16/VEiXlFmvAgvoDEjPNd7cGfwXju3gtPnI1Ef7lkdL
         NGGA==
X-Forwarded-Encrypted: i=1; AFNElJ8OfM5OQsp1q4TagfxxX6lzbYKIz1cyxMIOR189ApEXA+2+nWwHHTL6STFLNI0HN6lLdexaskmOZSSF@vger.kernel.org
X-Gm-Message-State: AOJu0YyanJq1rFoxl4mYlggB0XYn/95AVCidH+QbV1IvWWkSdpZK/44Q
	55hLIo/zYF0Zo5Hu2r9J3/JEWTitgWjwFVLbiQ8eO8ttdmaAasApAznX4YFhBOIuwOGreb9KwEH
	jZH2V6A3Ap2T8nl4TUUUiVdUqtl8hwJM=
X-Gm-Gg: Acq92OH7hs+jJ0kksOQvworN7EkNK7E7zhJPu7hDvc7jX5T+lFhlckU9+FNGulm1ozI
	lfmERJgJtAK58bK4DBsGwr4nXgqJuiVH9CxQ1rqbLrz5lUrYZ4NHiG/ndh0zEUdDK2yYe1IOJpN
	9Qk52RlGu9e0aOpZeH/hja0paTCmnk57ME+o05Hw156KrDOvf5MTnm4FtnL01I6tWjWAsIggL2T
	AlOeW3IC+5vBOX4CQw+XvoDbfI2CuvA3PPfMOqCs99H2CPsxjc3l3h/1KU5pcFnhhYP+Fzg3eHH
	kXY3EObXITfSfXjhx64=
X-Received: by 2002:a05:7301:fa04:b0:304:d82f:be10 with SMTP id
 5a478bee46e88-304d82fe55fmr1288739eec.11.1779980623129; Thu, 28 May 2026
 08:03:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528135123.103745-1-clamor95@gmail.com> <20260528135123.103745-3-clamor95@gmail.com>
 <20260528155001.2bcb7003@jic23-huawei>
In-Reply-To: <20260528155001.2bcb7003@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 28 May 2026 18:03:31 +0300
X-Gm-Features: AVHnY4JOZH_BBdJBd0wzIDDW2UO693Byl1wIIcPrxkbXcQMPI-6wgD9ANvHg0-o
Message-ID: <CAPVz0n0qCekQVGGyAyBuYv+RKC6bpydYBLJNGfPrgTYjtOJOuA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8357-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 17F3C5F41A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D1=87=D1=82, 28 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 17:5=
0 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, 28 May 2026 16:51:19 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Since there are no users of this driver via platform data, remove the
> > platform data support and switch to using Device Tree bindings.
> > Additionally, optimize functions used only by platform data.
>
>
> At least the IIO ones would have made much the same amount of sense for
> dt, just that they weren't having in the first place. I'd prefer that
> as a precursor patch to make the rest much more readable.
>

I can add you preferences into this commit, I don't mind.

> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> I only looked in detail at the iio bit. A few changes requested.
>
> > ---
> >  drivers/iio/light/lm3533-als.c      |  95 ++++------
> >  drivers/leds/leds-lm3533.c          |  51 ++++--
> >  drivers/mfd/lm3533-core.c           | 268 ++++++++++------------------
> >  drivers/video/backlight/lm3533_bl.c |  52 ++++--
> >  include/linux/mfd/lm3533.h          |  51 +-----
> >  5 files changed, 212 insertions(+), 305 deletions(-)
> >
> > diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-=
als.c
> > index 99f0b903018c..cbd337b73bd9 100644
> > --- a/drivers/iio/light/lm3533-als.c
> > +++ b/drivers/iio/light/lm3533-als.c
>
> > @@ -714,59 +720,33 @@ static const struct attribute_group lm3533_als_at=
tribute_group =3D {
> >       .attrs =3D lm3533_als_attributes
> >  };
> >
> > -static int lm3533_als_set_input_mode(struct lm3533_als *als, bool pwm_=
mode)
> > +static int lm3533_als_setup(struct lm3533_als *als)
> >  {
> > -     u8 mask =3D LM3533_ALS_INPUT_MODE_MASK;
> > -     u8 val;
> > +     struct device *dev =3D &als->pdev.dev;
> >       int ret;
> >
> > -     if (pwm_mode)
> > -             val =3D mask;     /* pwm input */
> > -     else
> > -             val =3D 0;        /* analog input */
> > -
> > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, val, mask=
);
> > -     if (ret) {
> > -             dev_err(&als->pdev->dev, "failed to set input mode %d\n",
> > -                                                             pwm_mode)=
;
> > -             return ret;
> > -     }
> > -
> > -     return 0;
> > -}
> > -
> > -static int lm3533_als_set_resistor(struct lm3533_als *als, u8 val)
> > -{
> > -     int ret;
> > -
> > -     if (val < LM3533_ALS_RESISTOR_MIN || val > LM3533_ALS_RESISTOR_MA=
X) {
> > -             dev_err(&als->pdev->dev, "invalid resistor value\n");
> > -             return -EINVAL;
> > -     }
> > -
> > -     ret =3D lm3533_write(als->lm3533, LM3533_REG_ALS_RESISTOR_SELECT,=
 val);
> > -     if (ret) {
> > -             dev_err(&als->pdev->dev, "failed to set resistor\n");
> > -             return ret;
> > -     }
> > +     device_property_read_u32(dev, "ti,resistor-value-ohm",
> > +                              &als->r_select);
> Does this have a default?  If so the pattern we've recently be setting on=
 for IIO
> is
>         if (device_property_present(dev, "ti,resistor-value-ohm"))
>                 ret =3D device_property_read_u32();
>                 if (ret) //corrupt property in some fashion
>                         return ret;
>         } else {
>                 //set default
>         }
> If there is no default then check it unconditionally.

default value is LM3533_ALS_RESISTOR_MIN and if no property is present
clamp will ensure that als->r_select will be set to
LM3533_ALS_RESISTOR_MIN

>
> >
> > -     return 0;
> > -}
> > +     als->r_select =3D clamp(als->r_select, LM3533_ALS_RESISTOR_MIN,
> > +                           LM3533_ALS_RESISTOR_MAX);
> > +     als->r_select =3D DIV_ROUND_UP(2 * MICRO, 10 * als->r_select);
> >
> > -static int lm3533_als_setup(struct lm3533_als *als,
> > -                         const struct lm3533_als_platform_data *pdata)
> > -{
> > -     int ret;
> > +     als->pwm_mode =3D device_property_read_bool(dev, "ti,pwm-mode");
> >
> > -     ret =3D lm3533_als_set_input_mode(als, pdata->pwm_mode);
> > +     ret =3D lm3533_update(lm3533, LM3533_REG_ALS_CONF, als->pwm_mode =
?
> > +                         LM3533_ALS_INPUT_MODE_MASK : 0,
>
> That's ugly.  Better as
>
>         ret =3D lm3533_update(lm3533, LM3533_REG_ALS_CONF,
>                             als->pwm_mode ? LM3533_ALS_INPUT_MODE_MASK : =
0,
>

Yes sure, just followed 80 char limit.

> Though if there wasn't a layer hiding the regmap, it could just have been
>
>         ret =3D regmap_assign_bits(lm3533->regmap, LM3533_REG_ALS_CONF,
>                                  LM3533_ALS_INPUT_MODE_MASK, als->pwm_mod=
e);;
>
> which would have been nicer.
>
> I'm not particularly keen on the swashing of the helpers being in a patch
> that is about switching the binding type as feels largely unrelated.
> Should really have been a precursor, easier to review patch.
>

Removing of lm3533_update layer is not the scope of this patchset.

>
> > +                         LM3533_ALS_INPUT_MODE_MASK);
> >       if (ret)
> > -             return ret;
> > +             return dev_err_probe(dev, ret, "failed to set input mode =
%d\n",
> > +                                  als->pwm_mode);
> >
> >       /* ALS input is always high impedance in PWM-mode. */
> > -     if (!pdata->pwm_mode) {
> > -             ret =3D lm3533_als_set_resistor(als, pdata->r_select);
> > +     if (!als->pwm_mode) {
> > +             ret =3D lm3533_write(lm3533, LM3533_REG_ALS_RESISTOR_SELE=
CT,
> > +                                (u8)als->r_select);
>
> Same applies here. Mostly an unrelated change as the only thing switching=
 that
> is related to the patch is one parameter.
>

Removing of lm3533_write layer is not the scope of this patchset.

> >               if (ret)
> > -                     return ret;
> > +                     return dev_err_probe(dev, ret, "failed to set res=
istor\n");
> >       }
> >
> >       return 0;
>
> > @@ -852,25 +825,28 @@ static int lm3533_als_probe(struct platform_devic=
e *pdev)
> >       indio_dev->channels =3D lm3533_als_channels;
> >       indio_dev->num_channels =3D ARRAY_SIZE(lm3533_als_channels);
> >       indio_dev->name =3D dev_name(&pdev->dev);
> > -     iio_device_set_parent(indio_dev, pdev->dev.parent);
>
> I'm not sure why this was there in the first place.  Hence not sure if it
> is safe to remove.
>

This is directly related to OF conversion. The iio_device_set_parent
bound indio_dev to parent, and it causes problems with OF now since
als output has its own node and binding it to parent if wrong. Same
story for backlight and leds btw.

>
> > diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> > index 45795f2a1042..d707d43d5526 100644
> > --- a/drivers/leds/leds-lm3533.c
> > +++ b/drivers/leds/leds-lm3533.c
>
> >
> >       led->cb.dev =3D led->cdev.dev;
> >
> > -     ret =3D lm3533_led_setup(led, pdata);
> > +     device_property_read_u32(&pdev->dev, "led-max-microamp",
> > +                              &led->max_current);
>
> I'd prefer explicit setting of the default to be visible before this, or
> the property_present pattern I mention in the IIO review above.
>

clamp will ensure that led->max_current will be set to
LM3533_LED_MAX_CURRENT_MIN regardless if it it present

> > +     led->max_current =3D clamp(led->max_current, LM3533_LED_MAX_CURRE=
NT_MIN,
> > +                              LM3533_LED_MAX_CURRENT_MAX);
>
> I didn't look any further (busy day!)

