Return-Path: <linux-leds+bounces-1981-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAB490AA63
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2024 11:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8FD528887F
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2024 09:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE881953A0;
	Mon, 17 Jun 2024 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="efkYAPVD"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7733194C85;
	Mon, 17 Jun 2024 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618038; cv=none; b=OdZPEoZjqYX2htd4AIWn/9aVl1/JrOr1KH7xE9uyTQXhzoRz1B7QACS+98A17Y5pyTdDWVig6MN6ae0HkRay0jkWwAXBmffegNCeZl7pHT12o68X1PILj+hI4VMqqwMJ4fxstWMHHHiqXvNtyar+r7/ntv4xMvn8adldBKksCBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618038; c=relaxed/simple;
	bh=2t93KGC+WHDHD2dzUnsESmYw0sowfv7/mIZhe/xKaF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXPxeY0FDe1KdatcP2J+tGpvZfX7lG+DfPy5fnJQqTpmVhX0+DZlGcGZX1VMI3WQEbQWySV5rMl/TAxKWsQy2rUhcMp54zyoo2kCGrHTaYwJ9epm7uaJaii385PKohTBlyU1s2MIKJQ4fRyuiyVZ4gX6O2bxt4ITrPwVZhhT7LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=efkYAPVD; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id E99221C0082; Mon, 17 Jun 2024 11:53:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1718618033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Q4fEkBwXf4E5OngX0G/fLCfqgIJ33gO1Jy982FJLE4=;
	b=efkYAPVD8AVNqgdiF1LI8f5RqDMeQDVYlG0votbXRNNArhhq4VKUSnlc8pqLeONTq7BCRo
	QpkcWaX/+xMtnNJtJplsB1PE3NgID0mQBMiC4VEMMhBsETLLsW0OOOJ/zrgzARbZB6UsU+
	0v1asgAc5dhCVS5R1o0EqJRS0iRT9fE=
Date: Mon, 17 Jun 2024 11:53:53 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	linux-leds@vger.kernel.org, phone-devel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Bjorn Andersson <andersson@kernel.org>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Lee Jones <lee@kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] leds: sy7802: Add support for Silergy SY7802
 flash LED controller
Message-ID: <ZnAHsRn3N4mwPL7q@duo.ucw.cz>
References: <20240616-sy7802-v4-2-789994180e05@apitzsch.eu>
 <5701d3e7-f67b-4189-a5fd-8a992b9155fb@web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z8tJo+UJnXupDnOj"
Content-Disposition: inline
In-Reply-To: <5701d3e7-f67b-4189-a5fd-8a992b9155fb@web.de>


--Z8tJo+UJnXupDnOj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2024-06-16 20:55:41, Markus Elfring wrote:
> > The SY7802 is a current-regulated charge pump which can regulate two
> > current levels for Flash and Torch modes.
> >
> > It is a high-current synchronous boost converter with 2-channel high
> > side current sources. Each channel is able to deliver 900mA current.
>=20
> Would you like to improve such a change description with imperative wordi=
ngs?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.10-rc3#n94
>=20

Feel free to ignore this.

> =E2=80=A6
> > +++ b/drivers/leds/flash/leds-sy7802.c
> > @@ -0,0 +1,542 @@
> =E2=80=A6
> > +static int sy7802_strobe_get(struct led_classdev_flash *fl_cdev, bool =
*state)
> > +{
> =E2=80=A6
> > +	mutex_lock(&chip->mutex);
> > +	*state =3D !!(chip->fled_strobe_used & BIT(led->led_id));
> > +	mutex_unlock(&chip->mutex);
> > +
> > +	return 0;
> > +}
> =E2=80=A6
>=20
> Would you become interested to apply a statement like =E2=80=9Cguard(mute=
x)(&chip->mutex);=E2=80=9D?
> https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.h#L=
196

This does not look like real improvement for code this trivial.

BR,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--Z8tJo+UJnXupDnOj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZnAHsQAKCRAw5/Bqldv6
8qbrAJ9qDHzPErtCXlGzup2F35utxL0xhwCfb6zzKIF9JU4U0/EmT41iKsN7fUk=
=SYHf
-----END PGP SIGNATURE-----

--Z8tJo+UJnXupDnOj--

