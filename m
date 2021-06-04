Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45A439B1CC
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jun 2021 07:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhFDFG4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Jun 2021 01:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbhFDFGz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Jun 2021 01:06:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E54AC061760
        for <linux-leds@vger.kernel.org>; Thu,  3 Jun 2021 22:05:10 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lp214-000159-Lt; Fri, 04 Jun 2021 07:05:06 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lp213-00082A-HA; Fri, 04 Jun 2021 07:05:05 +0200
Date:   Fri, 4 Jun 2021 07:05:06 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 02/15] leds: leds-gpio-register: Supply description for
 param 'id'
Message-ID: <20210604050506.esoghbat3byaxes7@pengutronix.de>
References: <20210528090629.1800173-1-lee.jones@linaro.org>
 <20210528090629.1800173-3-lee.jones@linaro.org>
 <20210528094118.xw53q46i676wx6gb@pengutronix.de>
 <20210528095531.GO543307@dell>
 <20210528103532.5n6zzr26hqglvz2p@pengutronix.de>
 <20210601090503.GY543307@dell>
 <20210602082436.hdi4olxekvvbtzef@pengutronix.de>
 <YLdCR9VlDgVmwK7D@ada.ifak-system.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2vf6epzaduvlkwiy"
Content-Disposition: inline
In-Reply-To: <YLdCR9VlDgVmwK7D@ada.ifak-system.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2vf6epzaduvlkwiy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alex,

On Wed, Jun 02, 2021 at 10:33:11AM +0200, Alexander Dahl wrote:
> Am Wed, Jun 02, 2021 at 10:24:36AM +0200 schrieb Uwe Kleine-K=C3=B6nig:
> > Ah, that the patch is already merged is news to me. Indeed, then fixing
> > this is not sensible. My initial feedback was less than an hour after
> > you sent the patch and it appeared just yesterday in next, so this
> > wasn't easily noticeable for me.
> >=20
> > Usually I'm annoyed about maintainers who don't react to patch series
> > and don't apply it. Here I'm more annoyed that I was Cc:d---which I
> > interpret as a request for feedback---and an hour later was already too
> > late for my review reply and there was (up to today) no maintainer mail
> > that the patch set was applied.
>=20
> Pavel applied (part of) the series quite quickly and stated in reply
> to patch 14/15:
>=20
> https://lore.kernel.org/linux-leds/20210528093921.GA2209@amd/

Just for the record: I only got the cover letter, patch 02 and the
thread below the latter. So seeing the info there isn't straight
forward either.

> This is not really motivating to review at all. =C2=AF\_(=E3=83=84)_/=C2=
=AF

+1

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2vf6epzaduvlkwiy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmC5tH8ACgkQwfwUeK3K
7AmHRQf+JKybtqz0iOmit2xZz2pRILcpkoXyY5f9ShCNUkxgt04ZDg/Dj+xYs7ij
Aoyazhx1I5hU71N3/iAipToIHm1pqfyZNmfSBN08C4KrmAjhMpqF1yFrNjDLssSJ
4a5lVTFy5zbk6T8tAkQmm13oVA8yB+O3jde2NZpkLlg2YJLSaXiLtMiCDnjrN/gc
3LShPqm7VPQuu1b3wstRs7C10+u3pxYvzPoS2+gUoOs1j7vsv8rjTrr6o2HckD8b
J8SZ/Kbj5qh3POy+KbP4cnpTUfn/V2E5Ir3lvKEQWTyEuoKRzMXpSobusXPPYrPT
8L787R+RO8Ka4fSxVOkaINAoMcPkMA==
=uT2u
-----END PGP SIGNATURE-----

--2vf6epzaduvlkwiy--
