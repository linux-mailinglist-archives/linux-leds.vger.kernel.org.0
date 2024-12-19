Return-Path: <linux-leds+bounces-3680-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7BD9F7CA8
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2024 14:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FA62189122B
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2024 13:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D876B224AE2;
	Thu, 19 Dec 2024 13:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mVL/Xi4t"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388201F8682
	for <linux-leds@vger.kernel.org>; Thu, 19 Dec 2024 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734616163; cv=none; b=LtvivBe25fdlsPnmrxVUEhBd/cxkFMA9eoSjehRLE0+gxpV0u/kijBmes+X0j4+cFitcyJzDreTEbQDdgfw19RVLRMU1AmWc/mID3lmP9gdYzXNsuW89/wRww9cy3ITV6hG6GLKLTxKj/Xry0Q3sYA+Dv4hAXeT2JoV3371w+3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734616163; c=relaxed/simple;
	bh=qY/n4FmoGHtdoeuTSW0/Z5/s6MLRRWslj4/8NWDgS6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQOQbz+NHsZOA8oklvkCAoEdPPNCmD/AxCaIZFhVacnJfqmd0S4kc64SpXus9sm7havFrOrbiwTuV1oF8k4kPOCBQnHC+ZQxsXrWwP39yB0jIJdgycJ9B71jNctjHHLaONPgqXjDUD5HaMeOxwhwSKH9gV2tLHp4mwVePs1eJkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mVL/Xi4t; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-436249df846so5738225e9.3
        for <linux-leds@vger.kernel.org>; Thu, 19 Dec 2024 05:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734616159; x=1735220959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ecSIQteYy5y7sAhLhwklIkG+3LHWjme9GUjh0YZj2Xo=;
        b=mVL/Xi4tHdXGOGzwFJwD2XsqjF4b5tP6ItKGfSFYg6rCQiSHRkMVmfT901K+GxkYxk
         ZA8XhsoLQmMdZ/CFHDGcpMtDPgl7LDRUH+KvlmeVACY1klszHFN3sEM5CroLfBLpaX7m
         snekGvMT0jHmerE5FQAVdz2MFNssPcOtX+zuuEogpgSASstQeSNgVqeOIY4bjDt9A4KW
         rE5Yyp0W741T4PrzoDVFma5JYsS3Zw4yDch9uyKWxv4JMuODgKTaL/h80JG+g2YkY07V
         eQ6welDdGni5FD9m99nbzbfMyuUsfhWky6GFwM0VMmj/L5bF+K0Stv1aS58gJQgNeCpe
         wa6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734616159; x=1735220959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecSIQteYy5y7sAhLhwklIkG+3LHWjme9GUjh0YZj2Xo=;
        b=nuWDNpSlsv8XEF6n04/RkAAwL0RWtraxCVXcz2l6Ejopm/522WZ6wFjV+F/nYbr2nX
         AEpEzOVj+KeHdxX2VXHjNVoU7AF/VEJwaxg6d+1uZ2nrPa6VAQivvOmEJO4M22k9F9d2
         MV7CiEXZ7Q3w+asKXWYIXhLUtWbpoLwKBDPEmOQJ9VKQfVzbrhY3XS0ZeegdnnbJy3BF
         f5mepcY5myaG/CtnNroyMzbpHeyYpVknTM9aJLA1EsP4mPqI7WlqsDEJ2FGoBQ5GnY5o
         aAz+PQL3hQCLqpk2kD6LYpESbjxMGGj80rfhLXHBfWa0mWS5OxqR30v9aOePMDfD8FT2
         5hag==
X-Forwarded-Encrypted: i=1; AJvYcCV+FhpqM5AoRKiaLVu7ltUKOyDx6UkA6zss15tDb3yJNEKs2Ws2dxeQFR3jqzqmGDcoxZlgZNoQfmx1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+5O9YkLw6jwUbI8p9EFd7IIIHNdi/VXMyki8HyP8MAE5LtI6D
	a++X84fC0YaE9RZ2r2nTAcmXZHtVYhTXRVBpT/zQnAMgOKZVm0YIQ1rMVtsvKohQqagB91Dllnv
	VayksUMBt
X-Gm-Gg: ASbGncs78Av/+RIeaxTJjEHc7MvFEfbZzC+2G6LIVkJMlVZQdvJKhVpEoSBuEJ0aUsp
	j/WMJuAV4qrgUbHnxFIO3LWh29EinAL2GGo/wMer3dR2RYjPkvTfgjHk2nlIn1y0KJCDG/ofkfN
	9RZv3zJrMrRM5uKz1hPfaLyzgVxn6/vlXTKhFmzt4H+SH0zes2e4NzwQIM94lsq8+oo81X6m2cT
	R6rhM8mnm9RAPlWM5Zl+W2eDQyrk7fbpgWHsPoWFF7uXWmrDd/+oHrTdaRywQ==
X-Google-Smtp-Source: AGHT+IE3dgdXfqWSfuYHI8PIJnc5u02LwerTL937HVdaj2/aaUkoCi2SUKPOldoh28BScyGM2Z4fYA==
X-Received: by 2002:a05:6000:1882:b0:385:cf9d:2720 with SMTP id ffacd0b85a97d-38a19b087dfmr3594732f8f.23.1734616159524;
        Thu, 19 Dec 2024 05:49:19 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828a8dsm1624713f8f.2.2024.12.19.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 05:49:18 -0800 (PST)
Date: Thu, 19 Dec 2024 14:49:15 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, 
	Jakob Riepler <jakob+lkml@paranoidlabs.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4] leds: pwm-multicolor: Disable PWM when going
 to suspend
Message-ID: <o2yip6u2tyklncj7qdw74i2vrvqwvxmzfv3mutjgykaypsptos@fmx3legn4pgz>
References: <20241216213754.18374-2-jakob+lkml@paranoidlabs.org>
 <173444790659.1886613.13367326556110236101.b4-ty@kernel.org>
 <kfkfwwv3ytv3jdcfg5xle6xjks7mjk6ziqe75lrhq4tqfgi6pk@borrphl7vatz>
 <20241219082504.GM2418536@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ewxpaafreo4jsewa"
Content-Disposition: inline
In-Reply-To: <20241219082504.GM2418536@google.com>


--ewxpaafreo4jsewa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: (subset) [PATCH v4] leds: pwm-multicolor: Disable PWM when going
 to suspend
MIME-Version: 1.0

Hello Lee,

On Thu, Dec 19, 2024 at 08:25:04AM +0000, Lee Jones wrote:
> On Thu, 19 Dec 2024, Uwe Kleine-K=F6nig wrote:
> > On Tue, Dec 17, 2024 at 03:05:06PM +0000, Lee Jones wrote:
> > > Applied, thanks!
> > >=20
> > > [1/1] leds: pwm-multicolor: Disable PWM when going to suspend
> > >       commit: 29df7025cff00dd9fa7cacbec979ede97ee775eb
> >=20
> > Where is this applied? I checked today's next and even after
> >=20
> > 	for b in for-leds-next for-leds-next-next leds-fixes master; do git fe=
tch git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git refs/heads/$=
b; done
> >=20
> > I don't have the above commit object and these branches don't seem to
> > contain the commit with a different commit id either.
>=20
> Check again tomorrow. :)

I was impatient and found the commit now in your for-leds-next branch. I
wanted to double check that there is no encoding problem. Everything is
fine.

Thanks
Uwe

--ewxpaafreo4jsewa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdkJFgACgkQj4D7WH0S
/k4snQgAhYNC/omRhOgy+M9PRnubw8IOifUyuXn36KhdDq34WRn9FG50XEvb/fD6
3PJnB1TfVdG5/jvST/d8rXrL29mSr+xAGLARxQOIqW4xKE9TrGIfS04JYNZSnXvN
IrpTImLgLG9z3wJFLzcqotqhYn1z1tBc0XSIQ2RswTUDCeAIYgD1v4WmVN7bI1UP
33H5UKwPF55EVJH+Cww00dvtSFZK5duzvuBWS3CbHgKB/cmhy3lJtSf/YULefX+0
Kw1EQ70XDFAORDy8xMoQHpcbFeca3q3Lv79QMPs/BR/sUmOgKHkSD3L+AWQp5vzy
/dgZ0PFfCMn5S4uPc4xfu3Neaza+ZA==
=CHjO
-----END PGP SIGNATURE-----

--ewxpaafreo4jsewa--

