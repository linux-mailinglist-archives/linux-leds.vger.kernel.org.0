Return-Path: <linux-leds+bounces-3621-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8B19F469A
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 09:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 266EF7A264B
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 08:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201701DDC33;
	Tue, 17 Dec 2024 08:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CildxNoP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC44E1DC745
	for <linux-leds@vger.kernel.org>; Tue, 17 Dec 2024 08:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734425730; cv=none; b=DuiNFoOmGkp43cItdm7/QsgCXf3KJ8INXP7gUlJ6/YIP2PuPzHFf+YxJQI3AUAUTh17FqSxmsOjeDp3tF6O0CKv2DLtFkRM3CW7pDlr43vTp72fI64lIPjZHHr9BZDAWl/5vrujGFORNa7hOkvUIiHoGKWhoYhshhrdKv0qJAPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734425730; c=relaxed/simple;
	bh=cuxyL8v4tnilELGzNvEWCHqBTaOLE7bmfmtakrW6FJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLwAiCrbcLwxTO0GLysx2vEJVCC5Pll9XyZVG781IXXLvkrwu8kmsex8+HXHDtVWqhr7IbgbIlHbhd6kAfl0EQqXPhVL/FbxFPHU87YrSzOFbr6cmasr1Q5msKH0eUw37qlhx6p75jXGqDd++L2DJJrQ3fjotNdDVBP7hwa0Huw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CildxNoP; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso24215125e9.0
        for <linux-leds@vger.kernel.org>; Tue, 17 Dec 2024 00:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734425725; x=1735030525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VzMzEWYF4JXJMl5I2vPSjh/3wjpRKRmLIFv3W3v5fbE=;
        b=CildxNoPeXqhlvG0zCO4xtmZ5aWtEAeCsaGGWHXxHczsjC/41O+UCAaUjaUMkT0t+Y
         eb9oh2bj9sAftT6zTqI30wdvsoMs/E9hiKzeW1o+Mb8bvF3BY7lKpSEAUNRsSaKa1GUG
         Yz9jUlCiQ10AlxPbelwmhJ06H1hejGn0VbZONqg6qhwW3TBlede5AVEHIZSMyLnBIKR/
         Jya7YmzP2Ff5H2zpTYbp2zcBEQUGk4nOjnqv2RF11vvbGBXLYYwVlrPysABDIoO6IuQy
         o4I9px4ubM9RTJn1BFE7/T5dwQvrVAOd5BD0AXIZSKa4JoMKT2Ci6yYPJYblMHmC1ejp
         pPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425725; x=1735030525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzMzEWYF4JXJMl5I2vPSjh/3wjpRKRmLIFv3W3v5fbE=;
        b=veUeqbt7nad6DJOc5MVdfvfYk8B+la/UTt/4aqM89aWPyUyTGjw+6nPcqlb6eJWy7y
         9AxEYIF4Y1HtqwqriiHUd4guFQHioSjZhue6TkIi1HbKEEXk7OAirj2wWPaTNBnGqTUv
         BXG+H5UWdZ/z30u/iPwAb12jpj1/6pZGtSpsdeqn2XnicZ4/ngUrtTXclm3NJPcFDt8T
         APYrpPKuhpHxX4oGaUgQDFPJFERPe1d4cxbEZbAYqmh80WONL1ECTmcMWN8GUFaPnr+R
         A9sikdG7TxXNc0duDKZxRUgAfGfT0zOYAtW7veYXAVe+9SZFPYpO5VxBeAr3eOHFBl2D
         z1hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpQRcFHipCrVo14xc2fFUV6tsUPyvWrdf82uerJCmveBeaPlLIP4s6OSLlEL4HgdKNNAWa0U/SPVnW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/sOoF8lf5GF80Cstyb+rjjEVff6+c/cbS7E7nqVVsjDZn1MmV
	qtor9OXDvSGr6Q4fSyikaPQsxMYarsMZE7g23c4FrJ6MRtJ2rnxes2yDc4Ef691xsY8warF0SWQ
	44O7mc/rQ
X-Gm-Gg: ASbGncvtxKsnJxZKKz6R2Sp0pw41ksGNNYkNmb1NHSZkYkmtPstpo17IuzYG0srwv62
	8Oft0xBn1x7g0agU6H4lN5BIkGOtNw0mwu0NChRh/S06lQKx/YOJDEyiy84qj89x8KHA4mHSB9E
	YMT7vc4VSLsAUz/UY9lxF7LvbubSZjl3hU/j4Z5Wai6+ZTxLc0mjuc/qvzfhGUwd1YDOjQAci7u
	uuE4tayocPxjG8HIsqIgKX7LUj/lHiz62Ay5kxxcXkURP1b6vVRmmc8tT8b4w==
X-Google-Smtp-Source: AGHT+IGaMszbOv+z9nYqkthli6tHZOo5qH0QuIqbPOPrEPbg0JKqfPxZffDETNuPMkD2e5/fgD26Cw==
X-Received: by 2002:a05:6000:795:b0:385:ee59:44f1 with SMTP id ffacd0b85a97d-38880ac8586mr13046511f8f.20.1734425725109;
        Tue, 17 Dec 2024 00:55:25 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80601desm10489661f8f.90.2024.12.17.00.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 00:55:24 -0800 (PST)
Date: Tue, 17 Dec 2024 09:55:22 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jakob Riepler <jakob+lkml@paranoidlabs.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] leds: pwm-multicolor: Disable PWM when going to
 suspend
Message-ID: <bhymumlk7nesrcdovmp5shhelcqrs5i4eorqoerobtc5p6jifz@ychl36jc2h5q>
References: <20241216213754.18374-2-jakob+lkml@paranoidlabs.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5vopurjdzekoi6e4"
Content-Disposition: inline
In-Reply-To: <20241216213754.18374-2-jakob+lkml@paranoidlabs.org>


--5vopurjdzekoi6e4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4] leds: pwm-multicolor: Disable PWM when going to
 suspend
MIME-Version: 1.0

On Mon, Dec 16, 2024 at 10:37:55PM +0100, Jakob Riepler wrote:
> This fixes suspend on platforms like stm32mp1xx, where the PWM consumer
> has to be disabled for the PWM to enter suspend.
> Another positive side effect is that active-low LEDs now properly
> turn off instead of going back to full brightness when they are set to 0.
>=20
> Link: https://lore.kernel.org/all/20240417153846.271751-2-u.kleine-koenig=
@pengutronix.de/
> Signed-off-by: Jakob Riepler <jakob+lkml@paranoidlabs.org>
> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Now there are just nitpicks left:

 - Your S-o-b usually comes last.

 - The encoding of your mail is strange. It claims 8bit us-ascii which
   doesn't make sense. Depending on the mail reader and its locale my
   name might show as Uwe Kleine-K=EF=BF=BD=EF=BF=BDnig. See also
   https://lore.kernel.org/all/20241216213754.18374-2-jakob+lkml@paranoidla=
bs.org/
   which says "Warning: decoded text below may be mangled, UTF-8
   assumed".

Many maintainers don't care about the first item and if Lee has a sane
environment my name makes it correctly into the git history. So from my
side that's no reason for a v5, but for future patches it would be great
to improve here.

Best regards
Uwe

--5vopurjdzekoi6e4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdhPHgACgkQj4D7WH0S
/k5hQAf/X8241mnPnqFaI59nd1MRvjuJVWpZptupbIOLwJgEkFP7Bp4qwq4x640y
cidry2tPdrgPXcIRcVsdGoN2uw9eMmNK0jxfWf+yX13Dpx/sPj3SUzDiXNk5TnhE
ihSw0V6fZNBjqqiyJtfaQhV1YQg4rehEVW0yt5ySjjwBSgI5ga1qq+qjgcK+jLE0
brB5EQZc6gh99jmxSYcxx9b9x+HCHDh8Nh4ySyK7pIfom6+hcRsIIXbfNnodYTxz
E4zMLGHDj7NJcI0scfraMCzEqgEAVGoQpTaz1rT2p7s/JvbaI3K3mK92MFs6nDy9
dp7P8I8te30sofESlwHicjFgZyzp6A==
=G10+
-----END PGP SIGNATURE-----

--5vopurjdzekoi6e4--

