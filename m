Return-Path: <linux-leds+bounces-7671-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIy6Nezi12kVUQgAu9opvQ
	(envelope-from <linux-leds+bounces-7671-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 19:33:32 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 387A63CE284
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 19:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D34B3006B7A
	for <lists+linux-leds@lfdr.de>; Thu,  9 Apr 2026 17:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592833AB272;
	Thu,  9 Apr 2026 17:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pVB09xiG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161CC3E3154
	for <linux-leds@vger.kernel.org>; Thu,  9 Apr 2026 17:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775755998; cv=pass; b=kNWwsVzZKJ48/VCE25Aw4Y8BYtjxpe2MSkXNqSPCFFyeRa5f/0DkblQt2b0QJIttuDJV96V0JqTji0KnqC5aIPZvzk+zYWARfiML4rd07LXOX/JjN+aN/UsOQCjoUWBTsnmX5jJyQgeYSJwxTsnPaJcdDer0Pr72xIwQVkGWaq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775755998; c=relaxed/simple;
	bh=pAp6FMygBYV1F6TaYcfCi8Htvtlt5svuMU2I9kTySjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QkD86qDkabC6HtJhtiJjuqAqdoM/xkx4bdIDEuU19BivCi1ajSNkrjBHzYTxRazKKr6hoDUBwfPNgKAdfXUlGq12q/M1fg0JgIJ50brNp1vYFBfroB3aLwXSU0xhLN7WeOJPdarteJAyK6VBYOu7i4ohkwkMavWNBICn2seE5Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pVB09xiG; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c01854477so190556266b.0
        for <linux-leds@vger.kernel.org>; Thu, 09 Apr 2026 10:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775755987; cv=none;
        d=google.com; s=arc-20240605;
        b=gnGpDJ56a/D4yOx3qhlJ0G2QCG20HeLWHKlF9y7cbX8YiUVqrxdwOuzdRmZmkVlS4y
         HoraeTfHeZuOazN3b/94kXU9VMzRmPnzYz2PbUbbwb4zF4HGC2bOY1VdKc2XHsmGIzJy
         3MgjyCEKnbDcgz2n0jcSArtdHxY05cd+bOvWn6IQTBW6MNHBDc8sE5YwcvlPQ14oE6Pf
         3JVX2O64nILLk3lsjfoIMiNFKvBv9aJ7zWcYtdpwV5m2t0uN8soY95xArn9DqX6c+iDK
         yoELowsfCk2yRF4ihzwg45EIgMkno69vmh64xpTqi82FadAiZ6tr6DGhvqtSya5Ao5Eg
         /5gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3XPkS92gnUuX48YeJscFkbdS2F7DzIauqRmSzvPVPq8=;
        fh=X/yKbcLz6auqxei7884iplvjzdpH/lJTDOq8yQscJss=;
        b=azx6lFQEDgrgkzyyGu4/1qsq8aj3d+MjAxdh4eA7GHzAydDnVIa1B0XD+yq39YAboj
         Q2yJmwE0WoUdqSTLfJwuyyiT1SZgVWM97OYw1QcuDvtzdp8Zutjfb5BMBWMwWHEGlBDA
         y/qDy6IXOzXtIrUk377awBpZzUEVQ+cBnmQWgLsUg3vrkusspk9hi62LHCSjg3qwfP8c
         C6xEhbEScTvLe45/954cRBZ31BhxLjb+V3nEuFFYysaM5aFuIJwBQO24XL/OIvMsc/k+
         oTLyCmvU2V4SuvoFKdyYfjGO6rPKmj0JnjYAuij8Ns5m+z4ztKFPBr4UbEt8INsI6q/P
         zx0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775755987; x=1776360787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XPkS92gnUuX48YeJscFkbdS2F7DzIauqRmSzvPVPq8=;
        b=pVB09xiGHF6RqqzYmr3jDyzPLm2CrlDEy+tvdKHBfuV9PCeyqt0XXe9O0UBJ8CsZXv
         XPLqB0AlYxFpD+1q8WJz/7RJl3vWBKLvFmkZSNbF/IwHUr9RvMBy7Y/O6hUWK7MmEWXJ
         mrnt4n0EQ9Ky5NlnG3PO+RwMcFaj+1eVO/gBadJUCYlnUFCdTnA2sNg1f1cyotou8e8s
         JMKaT+Iha7Ol7W8hzDtw+7RxzhRh5Vtdfc6Qv/QNx4FNLVGHT2GYZCQ6yxmd2Im2tYPg
         2EnGFCyMo0B5uazPaG0iHsWwpZHWvpxyOANj72oOQeYnPQs6Vau9f9cL2jrayPbR0m8+
         WOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775755987; x=1776360787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3XPkS92gnUuX48YeJscFkbdS2F7DzIauqRmSzvPVPq8=;
        b=SgPhvvU9/IQL274oFxnfLc1sSzrGOAI8vUSYhy3nt1ms9Vu9zNbWt/CmHXIfeHPxHo
         d+cnjVjQMoyDKAdlve12QLxo+ozWtkUCuDNhqPkAQ6S9rzbj+LTlWdZorKjq4ghrCaW6
         +eH1E9eUfpoK/bU2an0nyn4XoVaSEmneIIkDIsqhaiIZ0G56Dmrtvwk/AZ9XR9s4bSrW
         K4xZKoJrAb9pTtR4q26qYvh9dAbL7lQSg03jvAyrQIoLOiyX41scFlS24YYjIXTGTLu/
         HgfxVMFml+XhvDD0+BSHMCTsFui9/OHq+wHaGlDhgCZbUPtJw9g2W45T0uJSz7Yl2/aX
         zuAg==
X-Gm-Message-State: AOJu0YyJ6nk4ekqORMjIDEZ/8Os4ZlO8RC26nn7PRRguQEZy4ricp35G
	BLZi2le2uUUWH9o0HSsLThL3LxqijNHL5XzPKyDJPBjn1DD/NeNpfmJ9xqlJhxqLUF5DhrTMz0B
	vtUFeLNv2wpb0uKAiHdVCi/DlNfBnnH+tsA==
X-Gm-Gg: AeBDieshENwSQXyQBtN4uNeBU4i66uCJQF16GnC105Fzf4oXF1k3E+FGA/3w91bou4g
	+Gp4So1glTbbFvfcwVAAAA7SPiJ0wLCgwz9MoAormLSSkoc95AbjI2Ojvd9Owp1elvRi+Ei8Sqf
	UdjQHTwzk7sssm8WYYh/f/sFTv6UeZH5dkkR31D//Nt91gO3am6RNymthGwzuNqcNGqt+0toRGn
	T+A9YiglUm9+j9ssHaY44u5fryGbqkpPTAJefWICVlfS6W+pY1qim1EZ+vRI3mdf+hXvg6EsHAY
	Va5Fw1YMjChkcT+FjwnRE5P4IeDcbvz0ZOXFjfaY7R4uTMMqZZQ5lqGnesn/+kN44ngz2OZNh8s
	b2TmLBA==
X-Received: by 2002:a17:906:9f87:b0:b9d:6a06:fab1 with SMTP id
 a640c23a62f3a-b9d7265c9b4mr6451966b.32.1775755986990; Thu, 09 Apr 2026
 10:33:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320040821.46540-1-rosenp@gmail.com> <20260326113336.GK1141718@google.com>
 <CAKxU2N_8BnBETT8YeDa44bDvC_srepskpA7iDYOwPQJsfb0dXw@mail.gmail.com> <20260409124417.GA3290953@google.com>
In-Reply-To: <20260409124417.GA3290953@google.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 9 Apr 2026 10:32:55 -0700
X-Gm-Features: AQROBzBVfPk1Mg0NTdCC5ZF5QedLEgsgiQZ0J1Ci6_R_-CCKPRkOy_dRyCxB_uA
Message-ID: <CAKxU2N-pAaCDR9vH7PEXLtb__Sc_JU6Qrd-5dgFC3deKmJGFcQ@mail.gmail.com>
Subject: Re: [PATCH] leds: pca955x: kzalloc + kcalloc to single kzalloc
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7671-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 387A63CE284
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 9, 2026 at 5:44=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 26 Mar 2026, Rosen Penev wrote:
>
> > On Thu, Mar 26, 2026 at 4:33=E2=80=AFAM Lee Jones <lee@kernel.org> wrot=
e:
> > >
> > > On Thu, 19 Mar 2026, Rosen Penev wrote:
> > >
> > > > Two fewer allocations as a result.
> > > >
> > > > Required placing some structs before others as flexible array membe=
rs
> > > > require a complete definition. Declaration is not enough.
> > > >
> > > > Added __counted_by support for one of the structs for extra runtime
> > > > analysis.
> > > >
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/leds/leds-pca955x.c | 45 ++++++++++++++-------------------=
----
> > > >  1 file changed, 17 insertions(+), 28 deletions(-)
> > > >
> > > > diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955=
x.c
> > > > index 2007fe6217ec..ee5f02eaa3c9 100644
> > > > --- a/drivers/leds/leds-pca955x.c
> > > > +++ b/drivers/leds/leds-pca955x.c
> > > > @@ -112,19 +112,6 @@ static const struct pca955x_chipdef pca955x_ch=
ipdefs[] =3D {
> > > >       },
> > > >  };
> > > >
> > > > -struct pca955x {
> > > > -     struct mutex lock;
> > > > -     struct pca955x_led *leds;
> > > > -     const struct pca955x_chipdef    *chipdef;
> > > > -     struct i2c_client       *client;
> > > > -     unsigned long active_blink;
> > > > -     unsigned long active_pins;
> > > > -     unsigned long blink_period;
> > > > -#ifdef CONFIG_LEDS_PCA955X_GPIO
> > > > -     struct gpio_chip gpio;
> > > > -#endif
> > > > -};
> > > > -
> > > >  struct pca955x_led {
> > > >       struct pca955x  *pca955x;
> > > >       struct led_classdev     led_cdev;
> > > > @@ -137,8 +124,21 @@ struct pca955x_led {
> > > >  #define led_to_pca955x(l)    container_of(l, struct pca955x_led, l=
ed_cdev)
> > > >
> > > >  struct pca955x_platform_data {
> > > > -     struct pca955x_led      *leds;
> > > >       int                     num_leds;
> > > > +     struct pca955x_led      leds[] __counted_by(num_leds);
>
> I'm not sure we should we be embedding the full 'struct pca955x_led'
> (which contains runtime framework structures like 'struct led_classdev')
> directly inside the platform data?  Besides platform data should ideally
> be restricted to static configuration properties rather than runtime
> state.
>
> > > Where is the memory allocated to this now?
> > The kzalloc call was updated to use struct_size to allocate it
> > together with the struct.
> > >
> > > Why do we need this in both structs?
> > kzalloc and kcalloc can be combined in both locations.
>
> I believe my original question might have been misunderstood.  I was
> asking about the architectural design choice.  Why does the same 'leds'
> array need to exist in both the 'pca955x' runtime structure and the
> 'pca955x_platform_data' configuration structure?  Could we look at
> eliminating this redundancy to avoid storing duplicate data?
From what I see, this bit of code handles missing pdata.
>
> > >
> > > > +};
> > > > +
> > > > +struct pca955x {
> > > > +     struct mutex lock;
> > > > +     const struct pca955x_chipdef    *chipdef;
> > > > +     struct i2c_client       *client;
> > > > +     unsigned long active_blink;
> > > > +     unsigned long active_pins;
> > > > +     unsigned long blink_period;
> > > > +#ifdef CONFIG_LEDS_PCA955X_GPIO
> > > > +     struct gpio_chip gpio;
> > > > +#endif
>
> #ifdef statements are to be avoided in C files.
>
> Please find another way to do this (if it's required).
This is not my code.
>
> > > > +     struct pca955x_led leds[];
> > > >  };
> > > >
> > > >  /* 8 bits per input register */
> > > > @@ -542,15 +542,11 @@ pca955x_get_pdata(struct i2c_client *client, =
const struct pca955x_chipdef *chip)
> > > >       if (count > chip->bits)
> > > >               return ERR_PTR(-ENODEV);
> > > >
> > > > -     pdata =3D devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERN=
EL);
> > > > +     pdata =3D devm_kzalloc(&client->dev, struct_size(pdata, leds,=
 chip->bits), GFP_KERNEL);
> > > >       if (!pdata)
> > > >               return ERR_PTR(-ENOMEM);
> > > >
> > > > -     pdata->leds =3D devm_kcalloc(&client->dev,
> > > > -                                chip->bits, sizeof(struct pca955x_=
led),
> > > > -                                GFP_KERNEL);
> > > > -     if (!pdata->leds)
> > > > -             return ERR_PTR(-ENOMEM);
> > > > +     pdata->num_leds =3D chip->bits;
> > > >
> > > >       device_for_each_child_node(&client->dev, child) {
> > > >               u32 reg;
> > > > @@ -568,8 +564,6 @@ pca955x_get_pdata(struct i2c_client *client, co=
nst struct pca955x_chipdef *chip)
> > > >               fwnode_property_read_u32(child, "type", &led->type);
> > > >       }
> > > >
> > > > -     pdata->num_leds =3D chip->bits;
> > > > -
> > > >       return pdata;
> > > >  }
> > > >
> > > > @@ -623,15 +617,10 @@ static int pca955x_probe(struct i2c_client *c=
lient)
> > > >               return -ENODEV;
> > > >       }
> > > >
> > > > -     pca955x =3D devm_kzalloc(&client->dev, sizeof(*pca955x), GFP_=
KERNEL);
> > > > +     pca955x =3D devm_kzalloc(&client->dev, struct_size(pca955x, l=
eds, chip->bits), GFP_KERNEL);
> > > >       if (!pca955x)
> > > >               return -ENOMEM;
> > > >
> > > > -     pca955x->leds =3D devm_kcalloc(&client->dev, chip->bits,
> > > > -                                  sizeof(*pca955x_led), GFP_KERNEL=
);
> > > > -     if (!pca955x->leds)
> > > > -             return -ENOMEM;
> > > > -
> > > >       i2c_set_clientdata(client, pca955x);
> > > >
> > > >       mutex_init(&pca955x->lock);
> > > > --
> > > > 2.53.0
> > > >
> > >
> > > --
> > > Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> >
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

