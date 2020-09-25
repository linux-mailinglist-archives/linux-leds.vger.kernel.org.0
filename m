Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE3C278436
	for <lists+linux-leds@lfdr.de>; Fri, 25 Sep 2020 11:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbgIYJkn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Sep 2020 05:40:43 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44980 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727346AbgIYJkn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Sep 2020 05:40:43 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 94B6E1C0C44; Fri, 25 Sep 2020 11:40:39 +0200 (CEST)
Date:   Fri, 25 Sep 2020 11:40:38 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: ledtrig-cpu: Limit to 4 CPUs
Message-ID: <20200925094038.GC20659@amd>
References: <20200919093833.GA14326@duo.ucw.cz>
 <27e19ac9-4bc0-2945-3985-6cd6bb5407df@gmail.com>
 <20200920183401.GA21494@duo.ucw.cz>
 <781dcb5e-7bad-f740-5914-778ec8a7306b@gmail.com>
 <20200921224212.GA13299@amd>
 <db0b2dca-b7d3-8d76-cc6c-b399c1fa9921@gmail.com>
 <c60858bd-9a9f-5537-9f96-2e44db0c0d9e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="p2kqVDKq5asng8Dg"
Content-Disposition: inline
In-Reply-To: <c60858bd-9a9f-5537-9f96-2e44db0c0d9e@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--p2kqVDKq5asng8Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>So.. no, it is not causing kernel crashes or something. But it is
> >>example of bad interface, and _that_ is causing problems. (And yes, if
> >>I realized it is simply possible to limit it, maybe the BIN_ATTR
> >>conversion would not be neccessary...)
> >
> >The limitation you proposed breaks the trigger on many plafforms.
>=20
> Actually it precludes its use.
>=20
> I still see the patch in your linux-next, so I reserve myself the
> right to comment on your pull request.

You are free to comment on anything.

I believe probability someone uses that with more than 4 CPUs is <
5%. Probability that someone uses it with more than 100 CPUs is << 1%
I'd say. Systems just don't have that many LEDs. I'll take the risk.

If I broke someone's real, existing setup, I'll raise the limit.

(With exception of uled setups. In such cases, I'll just laugh.)

If you know or can find out someone using it with more than 4 CPUs, I
can obviously raise the limit before the merge.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--p2kqVDKq5asng8Dg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9tuxYACgkQMOfwapXb+vImXACfYPwAMqlGN0lqrqh4tyHCfT1y
ee0AnjtjP7rVsDsuXcoRM+lmZlxIgYkB
=GgT7
-----END PGP SIGNATURE-----

--p2kqVDKq5asng8Dg--
