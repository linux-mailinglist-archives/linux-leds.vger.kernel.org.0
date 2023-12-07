Return-Path: <linux-leds+bounces-314-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4166F808F34
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 18:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9B041F210FF
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 17:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B978E4B150;
	Thu,  7 Dec 2023 17:59:08 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4EB1718
	for <linux-leds@vger.kernel.org>; Thu,  7 Dec 2023 09:59:03 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBIeD-0003hj-5f; Thu, 07 Dec 2023 18:58:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBIeA-00EEzP-RJ; Thu, 07 Dec 2023 18:58:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBIeA-00G5BH-I1; Thu, 07 Dec 2023 18:58:50 +0100
Date: Thu, 7 Dec 2023 18:58:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, kernel@pengutronix.de,
	Lu Hongfei <luhongfei@vivo.com>, Luca Weiss <luca@z3ntu.xyz>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	Anjelique Melendez <quic_amelende@quicinc.com>
Subject: Re: [PATCH v4 003/115] leds: qcom-lpg: Use devm_pwmchip_add()
 simplifying driver removal
Message-ID: <20231207175850.ebz6rorgysloqtmf@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <631d24f0edaa7ac8ebeb22bb66260db8d8823aff.1701860672.git.u.kleine-koenig@pengutronix.de>
 <20231207170622.GF111411@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ddgoqz5q2ydlqh6d"
Content-Disposition: inline
In-Reply-To: <20231207170622.GF111411@google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org


--ddgoqz5q2ydlqh6d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Lee,

On Thu, Dec 07, 2023 at 05:06:22PM +0000, Lee Jones wrote:
> On Wed, 06 Dec 2023, Uwe Kleine-K=F6nig wrote:
>=20
> > With pwmchip_remove() being automatically called after switching to
> > devm_pwmchip_add() the remove function can be dropped completely. Yay!
> > With lpg_remove() gone there is no user of the platform device's drvdata
> > left, so platform_set_drvdata() can be dropped from .probe(), too.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Note this patch was already sent out individually, find it at
> > https://lore.kernel.org/linux-leds/20231126095230.683204-2-u.kleine-koe=
nig@pengutronix.de/
> >=20
> >  drivers/leds/rgb/leds-qcom-lpg.c | 12 +-----------
> >  1 file changed, 1 insertion(+), 11 deletions(-)
>=20
> Acked-by: Lee Jones <lee@kernel.org>

Given that the patches #3, #4 and #5 are beneficial even without the
following patches from this series, feel free to pick them up via your
tree. I don't think the whole series will go in during a single
development cycle anyhow. If we get so far that the patches introducing
devm_pwmchip_alloc(), pwmchip_parent() and pwmchip_[gs]et_drvdata go in,
and maybe the other drivers/pwm changes, we can cope for the remaining
patches (#41 + #106-#115) in the next cycle.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ddgoqz5q2ydlqh6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVyB9kACgkQj4D7WH0S
/k5WiQgAq83qtwAdG6fW6x3ohaDMBzFDnUeowIP5aZiEeoj4/1e5PWFVM3WSRugP
nugeaJNsegsv2p5V0pEYKp3fdwYQ5nZw+MDtwn9saKfQqH75sYxLc3jE7PjX7s4f
YP2+XNbAjVCoVoaihOpIs5NgmnzqNGww1Fd+gsp2qswv80Ulp3zk26qFWhrOkHkK
QfD+dd1BzAmG88mVtaQ5CFutYCKXpvZ64u2ZE5Y80QsvdnNeP3b9btlTDGGTS0ip
B+O3wwcbcywEwEE56U87U5wYDrhm1aj9Uu/XV/XCRMxDPXvC8KOpVxw3zNCh0AkF
mrHJQR1dJcuKSfLDTGGX8L2ofv4lNw==
=gjpG
-----END PGP SIGNATURE-----

--ddgoqz5q2ydlqh6d--

