Return-Path: <linux-leds+bounces-1599-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D306C8BC7E6
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 08:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B8A4B20D85
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 06:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524B7446CF;
	Mon,  6 May 2024 06:56:53 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B66C64B
	for <linux-leds@vger.kernel.org>; Mon,  6 May 2024 06:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714978613; cv=none; b=Xxby2Wvzwyqk3WAB6ohEVARZH7vqwBy06GHPCfX9MHfxzHZk784pSHTtpKco/4VRpnLe+ErdUVRdtSzsAOF9vmRg3lYTvLE4okFr0LQGPpBS+2pQL0cCnB0wQvsAH0mGe9wBRF4gogynIWgeil2k32olNxE8rhtVAIoQbckkomI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714978613; c=relaxed/simple;
	bh=2zKT2p8+vnMlvN/837LdnwA7dOJPuuQdQKmHirAC+Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hy6P1nHG3k9sZ9AMHLiUOfcriq58dMdAr46HvJzaVBwCgvBIxQb1gnn09BMFidX5oiVL3kEncGy+lD3MlJtkV5sB+2NCmbETyoNYUE8lzL6SjjALvF8vx4nT34cN+RRkTQeHyG82ZkfpJGTMSnM2eYuJ9u7CiJbLrDbs0JVQjNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s3sH6-00004q-8U; Mon, 06 May 2024 08:56:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s3sH5-00GDHH-Bw; Mon, 06 May 2024 08:56:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s3sH5-00GU9r-0v;
	Mon, 06 May 2024 08:56:35 +0200
Date: Mon, 6 May 2024 08:56:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Unregister sysfs attributes before
 calling deactivate()
Message-ID: <xpglmb5j2ay7zsuxruhmrlp6ey2zq27mmrxeudp44i2zt5m2oe@dmttobthnxyk>
References: <20240504162533.76780-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pjhlae5plzvmg5xy"
Content-Disposition: inline
In-Reply-To: <20240504162533.76780-1-hdegoede@redhat.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org


--pjhlae5plzvmg5xy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 04, 2024 at 06:25:33PM +0200, Hans de Goede wrote:
> Triggers which have trigger specific sysfs attributes typically store
> related data in trigger-data allocated by the activate() callback and
> freed by the deactivate() callback.
>=20
> Calling device_remove_groups() after calling deactivate() leaves a window
> where the sysfs attributes show/store functions could be called after
> deactivation and then operate on the just freed trigger-data.
>=20
> Move the device_remove_groups() call to before deactivate() to close
> this race window.
>=20
> This also makes the deactivation path properly do things in reverse order
> of the activation path which calls the activate() callback before calling
> device_add_groups().
>=20
> Fixes: a7e7a3156300 ("leds: triggers: add device attribute support")
> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Looks reasonable

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pjhlae5plzvmg5xy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmY4fyIACgkQj4D7WH0S
/k6guwf/VRm4b39t0PMibUXp9dLKaKOJ+arX54qryQNBQQIxukPVaNNQKeLEU0CY
YW3eOdrojlrnam1B+lhlG6tk6E5PPBM9+LnIi09k58i5AaRY6Eodm7nvO5V0Qv9x
FiHEc5i8yQ7Jr7R/2IpE2O8mGoc9GVe+sreqzAVSJDcvXugsJpaPj/wKX40BDfi/
+M4QJfly0yDvPmLM7LatRNJmv25h1hX556fxDvR98qnFtgT5T/kkm2XMNixwfF1t
4sPNSYGO9+MU/PeyU2SYsg2PE8DD2JKJHwlXjZEosjEEf+i5bY/1MzqPgYdsZNje
hQGprDVYPij+vVSzsn06BgVLkdCBfg==
=4JMT
-----END PGP SIGNATURE-----

--pjhlae5plzvmg5xy--

