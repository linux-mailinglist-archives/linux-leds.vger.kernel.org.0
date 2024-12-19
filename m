Return-Path: <linux-leds+bounces-3673-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB06E9F76E9
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2024 09:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1520F1609EA
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2024 08:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D73E21639B;
	Thu, 19 Dec 2024 08:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="s5wzle02"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA131A2396
	for <linux-leds@vger.kernel.org>; Thu, 19 Dec 2024 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734595878; cv=none; b=qCFSuQc3ioRhA6lNCgPFuNpBTu+p1lRYOUGLfyKUiP9JcxTg73iUqm6sEJkPSnQpOsd8+/vnnAgc4L8J92deLdcGWM0KhlZ7XXalgy6e2MX76gCN3rQn91aCW0l9Nfp09b3eykBAAwKNPkHRTgDOpvO6pDSTaeM6LWkl+tyBrd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734595878; c=relaxed/simple;
	bh=JW6BEEPp7C6IVob4t2erAbsojKxw9pABPwOqygRj/sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H25hWcg2QYu7Wie3b4Pg8g5NR7faKWVHtCGTJ8a7hSnRaFOpLdvW18qKNKWrSoGy7wnyBw56D7wBJkwfc/xIbH9ei3p4aGbDOYrQbVKHvelXZ+8tocKP7w5fKqsloUhNPUt5+KTBdaDQr4X0/zkf7mtpsQtXIrLmmDNir6HRfZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=s5wzle02; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fc01so865841a12.2
        for <linux-leds@vger.kernel.org>; Thu, 19 Dec 2024 00:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734595874; x=1735200674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l30pmurgnrZCgg1HevjA9SNBQTiwuzOzqnY711YESmA=;
        b=s5wzle02VDc9or7sb25+bcq+mRJsObd7rY0hTgalj8margql8fKcQnO3UlApgKdd3t
         KP6A3FaljedlKVZzRrbMhyNUh8Nku/Srgl10e0bxTeA5FreV/2UIY32hmGTumu1knbb9
         lNbTep1jNnCPPMzHKLG8ocPrZvx4gW7ZUAmOSMtv1z7UyMVD8c884txKzBxst6JLe7Ca
         A918br5g4VUvuh1k8qHhkeNqhFBJdz4OQETgrsR+WN1mabZGNUW6+GbeM1CZJpa8iebz
         TxJT4tIFgJbhE9WA5iZlnopOfppQp002xvmKOa4RkQJPUpf7HMWRsRBKXdvd15sYRMXc
         8XPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734595874; x=1735200674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l30pmurgnrZCgg1HevjA9SNBQTiwuzOzqnY711YESmA=;
        b=xDps8/x43dpFu+t1MRAm5WmA0CSs1a2pEqVnMkiLXl44j/8H2lBhFybL77g4nbEHNV
         qlioYfzpQdIVjc73+ocsfNoddbUVo4bb/NxIbTOzFfalXa4m1ca0EpdM8DMlRy3em2ST
         x37LiUt4xpwdDSUjBrfcAV8Hirb/nCBy74bQdZGhj1N/m3QTOV6zgtALTtAxvt10lIVs
         7CnusUe+g+7KTg7DP+Zj4hdQ3jXbim/5jLhmaayLw4TyPlZem/URHoTSx9+pgeLOQMve
         em8htdXlqSOVdX3Z4Fkx4EyQJeaXQWSggfhtJYwN9+IHbbOGgL8tvZhSSPAFk6cf+TCA
         jUwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgQ6nU8gCaiMxfQee9Q+CXPN5LGVVk2d8GDM64SV9X8JLBqlYyTR/u5R72orrPH0Sxa/Pn7maGfWM4@vger.kernel.org
X-Gm-Message-State: AOJu0YxKsbjWxeyHjRHCQg7/W/L2k6nOPK+ztfjOO5oXwd9pbuyn/SfK
	xZYZyzMbHvABoNhmD4Bnk6TobveQM9/oQgApNZSGW3L2Cq60CuFUq5mp+gGU8rU=
X-Gm-Gg: ASbGncsmvJvh0qlFcrjoe2qPO2D1UpSMSEHoa2IEL4Q2lGjTmK3uZP+/chxJz9Vv88n
	ED2DPeVQ48JK0jtyYt8BNIIKIPYTQMz6q3LfmS7bEtpruJ903OkTzhKZUlvOM4nP2Ss84HmVK4k
	MiSj79hktJCAbL1IuZXCky1J90P0uH6D7LRGwXllW/wr4mmugFZIOh5BwKCH18YgoPoXCDhRKrD
	kYGXz5VHeMbu2bMBnAfpr/gmMqAUjEz8a2eoXSQu3egoUVUaDd/3wkKy6xKFw==
X-Google-Smtp-Source: AGHT+IH14fNck5IRKL0035QZjbzePk7ndrzkAPG84X1Nir3GfdBnJwfXxa2NgD3JNEBpSNb5e6n36A==
X-Received: by 2002:a05:6402:400c:b0:5ce:d028:e11 with SMTP id 4fb4d7f45d1cf-5d8025cfec7mr2019467a12.17.1734595873878;
        Thu, 19 Dec 2024 00:11:13 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a3ebsm389378a12.7.2024.12.19.00.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 00:11:13 -0800 (PST)
Date: Thu, 19 Dec 2024 09:11:11 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, 
	Jakob Riepler <jakob+lkml@paranoidlabs.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4] leds: pwm-multicolor: Disable PWM when going
 to suspend
Message-ID: <kfkfwwv3ytv3jdcfg5xle6xjks7mjk6ziqe75lrhq4tqfgi6pk@borrphl7vatz>
References: <20241216213754.18374-2-jakob+lkml@paranoidlabs.org>
 <173444790659.1886613.13367326556110236101.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zv7wquikricwlc6m"
Content-Disposition: inline
In-Reply-To: <173444790659.1886613.13367326556110236101.b4-ty@kernel.org>


--zv7wquikricwlc6m
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: (subset) [PATCH v4] leds: pwm-multicolor: Disable PWM when going
 to suspend
MIME-Version: 1.0

Hello Lee,

On Tue, Dec 17, 2024 at 03:05:06PM +0000, Lee Jones wrote:
> On Mon, 16 Dec 2024 22:37:55 +0100, Jakob Riepler wrote:
> > This fixes suspend on platforms like stm32mp1xx, where the PWM consumer
> > has to be disabled for the PWM to enter suspend.
> > Another positive side effect is that active-low LEDs now properly
> > turn off instead of going back to full brightness when they are set to =
0.
> >=20
> >=20
>=20
> Applied, thanks!
>=20
> [1/1] leds: pwm-multicolor: Disable PWM when going to suspend
>       commit: 29df7025cff00dd9fa7cacbec979ede97ee775eb

Where is this applied? I checked today's next and even after

	for b in for-leds-next for-leds-next-next leds-fixes master; do git fetch =
git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git refs/heads/$b; d=
one

I don't have the above commit object and these branches don't seem to
contain the commit with a different commit id either.

Best regards
Uwe

--zv7wquikricwlc6m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdj1R0ACgkQj4D7WH0S
/k5aegf/TmDEKBqbUThHXXnIe8JzhmH0acvO5db38Ai/8e+Tr7DQqyNEHomVUyG5
nYvvDe3wERzgKxfi8EhYrsRxhmPM6W2TyTs6bVfDYeBRVNek1qg4io+fQ+QM45tv
sSsvtT7HSusenue/6iNl91VOwk0/gXU4LBnvHsNk1B1He28S2rJe5fyE5JO1jXXv
UfcbUdcaojBrx17L7xBrF5OLiQm0iYEIvXV4TPfH50dB6XBI4PNkqU3LOfxg2pnB
MSnoCD8d6ugZLNZQ6ZJmfcJthjwCRkIBU4K8oAv8gIBEGuyF3Gs8nlYGlqnvRXWm
kuLKZmfMHId/auoC4C0xAnK+lyFPSQ==
=8fvW
-----END PGP SIGNATURE-----

--zv7wquikricwlc6m--

