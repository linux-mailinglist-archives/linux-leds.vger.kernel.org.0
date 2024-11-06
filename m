Return-Path: <linux-leds+bounces-3319-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4382D9BF226
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 16:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C913C1F23C59
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 15:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E912202F87;
	Wed,  6 Nov 2024 15:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEFmPbv4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED1E1DFD87;
	Wed,  6 Nov 2024 15:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730908139; cv=none; b=qfDR5VxjhhwanXvlSk3+DUNIOjhWFtOycfPkBvn91PnLXKGQctddFWlazYHxqz7tKK/D9dkxs8bdbbZw0E48Lp8OLDloR+lmdK9+nUzfjv4bJV5pT5H9xn4pyeodspNjOCw5FPXfOefOzAXKOZjkxyfE8M/MtZRcF++mk2zz0sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730908139; c=relaxed/simple;
	bh=BUjlLL3HG2bzwOOY+gGlZ9xoQOKIco0H4L5OAMPb4tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzTTuFcMV6jrvp5YvXwueOUac9ccHpGiEYUSSEWBhMLABXMyEIYtilHfSqTApiqqeVp92/5zvlTo6G2u5KHeFSkB5y6h161zX8CQNZhZs5ZkBAr1LYq62bQUyOURcFePY2tpO4sbYiupB0tN9gu8rTWpnkh2MxWSXEjlxaYnoNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEFmPbv4; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb5638dd57so66310181fa.0;
        Wed, 06 Nov 2024 07:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730908135; x=1731512935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQn1mBA7i5mwq1Zg7u/t7aW7YEOcPTTZGAm5PudoZGM=;
        b=cEFmPbv41XRlOQS5SX2n0SLYdWX3o/OJ2zXt/IlKgdYzUeY1WqGAk493mT8n2qXH3I
         It7r0QXYiQitkpXD8l/zESbvS2FWZPPisvTJPPpruhP6JNcvq5ufOQfnOyk+36N1rxFc
         llF13hOcRfS41js7hGRoFuFGdTMHCKLSFLjGaZjocEekWty+DQTGTbGjXpCKUI4VuFBv
         d6616xaLpTeyA9sjI+/AEkiD/bQ1A83hKQo27/IzC41LDg9Gogwq76opauQFh6EWegbQ
         xjpmxSm24Ln8UhUBZlPpD6QkLvgekk8FTgJGu8Na7r1qeANM7RK5PaPQg/+msjln03fD
         7HeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730908135; x=1731512935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQn1mBA7i5mwq1Zg7u/t7aW7YEOcPTTZGAm5PudoZGM=;
        b=uRH2MY+i0vj5cs7PdcaSm+8u1qOz8DREuo0EmwVXXAHKfYyQwRLTPSi8PNvgWXLqVb
         vx0v0aSPDKWhw4dbsPuGlLxFwyXi9Xw4BYfyci8yaRTert99iM6YnerJQPN9APO9/diY
         PWstuFsmK94qG1mlaJgr5h8zs3yNPRlnsdKZULoMV6G1VsFhJfAT/qtz3iho/grp+Ggy
         a8KF8L1UL4X8vEX2aAa+7/44jpbBrS3bX6WZ5p1vDteBHt+0WSk91TxDYTmeI9AgysiB
         loJF8iSi1NbD2OsRSSVQORq086ZMSmrzR8tJKQiSA/LZjfscFu3ESrqMj4N2QzHAasyF
         zACg==
X-Forwarded-Encrypted: i=1; AJvYcCVFU7HAqKTkwMkFPYjAnBmOC7soBApc7By84mY2fx69Nl11lQm22ONasJ3wJZbmV8WSs2cB0DixmLvEPsI=@vger.kernel.org, AJvYcCWsYGtJfbtgIKsAdHmBNVm0bIEptinHp6f7N0dRlsQUJAF4jOzMHUwzRsKs8NnhiVr9O0qw4YzlgpCC5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl3ThhCdVLkQ7FaFuOGp14UGznhFqW+bM8THzX1Vzd/CFgztIf
	W30mev4A47UNnVQj1MRRaoXmFM7ZWteeZmtB+iEBpRPeoJEs2aGPlKPaS9RoACQSRmzZNazmyXG
	F7atd26aaflto0MouKrShokwa5K6Lp7i6xQM=
X-Google-Smtp-Source: AGHT+IHkE8CG0n0VJVnCOEKQzH/pE+L6AD9UJFoYJ+MfW49t/jw0uJOl1LuzPMjIpZ5nB7zm1T6D1X9eRPTRjGp9uwA=
X-Received: by 2002:a05:651c:1546:b0:2fa:c18c:faba with SMTP id
 38308e7fff4ca-2fcbe07ac05mr189220751fa.30.1730908134868; Wed, 06 Nov 2024
 07:48:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106015441.995014-1-anishkmr@amazon.com> <a349a820-7b3f-4739-a506-e2947f6df68d@kernel.org>
In-Reply-To: <a349a820-7b3f-4739-a506-e2947f6df68d@kernel.org>
From: anish kumar <yesanishhere@gmail.com>
Date: Wed, 6 Nov 2024 07:48:42 -0800
Message-ID: <CABCoZhCxHLbi4KcZUZPTHyeKxen2erB4kHGxNn073P2xq3z1Fw@mail.gmail.com>
Subject: Re: [PATCH] leds: driver for O2 Micro LED IC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: anishkmr@amazon.com, pavel@ucw.cz, dmurphy@ti.com, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Karthik Poduval <kpoduval@lab126.com>, Yue Hu <yhuamzn@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 2:46=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/11/2024 02:54, anishkmr@amazon.com wrote:
> > From: Anish Kumar <anishkmr@amazon.com>
> >
> > LED Driver for O2 Micro LED IC
> >
> > reviewed-by: Anish Kumar <yesanishhere@gmail.com>
> > Signed-off-by: Karthik Poduval <kpoduval@lab126.com>
> > Signed-off-by: Yue Hu <yhuamzn@amazon.com>
> > ---
> >  .../devicetree/bindings/leds/leds-ozl003.txt  |  23 ++
>
> 1. Please run scripts/checkpatch.pl and fix reported warnings. Then
> please run `scripts/checkpatch.pl --strict` and (probably) fix more
> warnings. Some warnings can be ignored, especially from --strict run,
> but the code here looks like it needs a fix. Feel free to get in touch
> if the warning is not clear.

It was run on the code but not on this text file. Missed that.
>
> 2. No bindings in TXT. They must com ine DT schema. It is no 2017
> anymore. Please reach to your colleagues in Amazon for some internal
> guidance on upstreaming. Such big companies should perform basic
> internal review instead of asking community to explain that basic stuff.

Will convert this to YAML and send.
>
> 3. Please use scripts/get_maintainers.pl to get a list of necessary
> people and lists to CC. It might happen, that command when run on an
> older kernel, gives you outdated entries. Therefore please be sure you
> base your patches on recent Linux kernel.

We did but our mistake is we cloned the wrong git, we cloned
git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git

>
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.

./get_maintainers returned wrong values because of wrong tree.

>
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.

will add that.
>
> Please kindly resend and include all necessary To/Cc entries.

Will do. Thanks for review.
>
>
>
> ...
>
>
> > +
> > +static struct i2c_driver ozl003_driver =3D {
> > +     .driver =3D {
> > +             .owner =3D THIS_MODULE,
>
> Please do no send downstream, junk code. This was fixed years ago.

ok.
>
> > +             .name =3D "ozl003",
> > +             .of_match_table =3D ozl003_match_table,
> > +     },
> > +     .id_table =3D ozl003_id,
> > +     .probe =3D ozl003_probe,
> > +     .remove =3D ozl003_remove,
> > +};
> > +
>
> ...
>
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:ozl003-led");
>
> Drop as well. Useless or incorrect.

ok.
>
> Best regards,
> Krzysztof
>

