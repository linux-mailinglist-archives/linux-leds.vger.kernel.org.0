Return-Path: <linux-leds+bounces-3595-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8279EFDE6
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 22:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA4E2164410
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 21:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BAF1ABECF;
	Thu, 12 Dec 2024 21:08:07 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from algol.kleine-koenig.org (algol.kleine-koenig.org [162.55.41.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45A31D54FA;
	Thu, 12 Dec 2024 21:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.41.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734037686; cv=none; b=YF2fFouPfXydAxjSmQ/2QZ8mzRc5BitcW/a5xfGySXeDonB7HM63vl9ncMsCOCLHHCR5QMA6TPtBmZOZY3OJuRNB31gxU8naGOWuMxtqTVbnup58uWlHF9XO5mlYjhPAVG+6WnH7qfF61MBXqgtkG2I0NSv0T+nPqN9zojjf8gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734037686; c=relaxed/simple;
	bh=X8ZYQyxfTsRwAqrB3b4m8it0qVmfkjAPbW64L5DFXes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idtyqkCjvEbX7ZQf8fvxosa0+j50TVWwzyWY8QtrQ3g3v5V2oMT95vmB2X3AOmSlEC6+AYesX47Gw4Plowf+IYN+A1RtJQFWpu0V63zOSeHQMTANCS92Qrm1XOfBOCwDFZ0IGVCDl+YulaOZaX9533YLDZL8Pk6Nzp0X2j7KB4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=kleine-koenig.org; arc=none smtp.client-ip=162.55.41.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kleine-koenig.org
Received: by algol.kleine-koenig.org (Postfix, from userid 1000)
	id 1A332F51FB7; Thu, 12 Dec 2024 21:58:14 +0100 (CET)
Date: Thu, 12 Dec 2024 21:58:13 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jakob Riepler <jakob+lkml@chaosfield.at>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: pwm-multicolor: Disable PWM when going to
 suspend
Message-ID: <rlq3efs5vorukieyj7h5lohpji3svowjpozisbizwihej6kgds@zxxksgdiuwgy>
References: <d7d930bc-4c82-4272-b2c6-88f7cac5a3e1@chaosfield.at>
 <50bbd767-b0e0-4788-975b-f5d9598208e5@chaosfield.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wt5yqy63j6fghig7"
Content-Disposition: inline
In-Reply-To: <50bbd767-b0e0-4788-975b-f5d9598208e5@chaosfield.at>


--wt5yqy63j6fghig7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] leds: pwm-multicolor: Disable PWM when going to
 suspend
MIME-Version: 1.0

On Mon, Dec 02, 2024 at 01:07:51PM +0100, Jakob Riepler wrote:
> This fixes suspend on platforms like stm32mp1xx, where the PWM consumer
> has to be disabled for the PWM to enter suspend.
> Another positive side effect is that active-low LEDs now properly
> turn off instead of going back to full brightness when they are set to 0.
>=20
> Link: https://lore.kernel.org/all/20240417153846.271751-2-u.kleine-koenig=
@pengutronix.de/
> Signed-off-by: Jakob Riepler <jakob+lkml@chaosfield.at>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--wt5yqy63j6fghig7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdbTmMACgkQj4D7WH0S
/k7/ugf/WBqnHunrE5w+U4cloDCKuHLEugerBVzBN+KCKznMP2BFN+G1SGc56H1u
I0VP07zI+GxKPLt74pQfhQlqNG2l0pZGKP7xkvXgsaZngpAEzFEUIOr0+SfXWyHo
S6oXIvnKUE+LJSyv/JuH7PEnga4/zAuf9E/LEhEtnws9w4bo7vS2QnjvCLjAfmR2
FmHdHFJ7gw1KYMAe2ZiygEmfF+51I/BWq1419hf5BG6ki97BZQFjOqcyxdcQVRV9
jv7SK9HJqMU9CNCPiWFcIFAJdGxaBavCg8jmon4rBn6tL8lJiM5OdMQa1u3Itmk5
JIwxMXd5K5RJLTZRWylf1FbRZOJNqw==
=sO9I
-----END PGP SIGNATURE-----

--wt5yqy63j6fghig7--

