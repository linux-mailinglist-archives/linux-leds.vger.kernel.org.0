Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D3C274747
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 19:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgIVRML (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 13:12:11 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37368 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgIVRML (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 13:12:11 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C98191C0B76; Tue, 22 Sep 2020 19:12:08 +0200 (CEST)
Date:   Tue, 22 Sep 2020 19:12:08 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Peter Meerwald <p.meerwald@bct-electronic.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Zahari Petkov <zahari@balena.io>
Subject: Re: [PATCH leds 0/7] leds: pca963x cleanup
Message-ID: <20200922171208.GC25550@duo.ucw.cz>
References: <20200920002500.5851-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0lnxQi9hkpPO77W3"
Content-Disposition: inline
In-Reply-To: <20200920002500.5851-1-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--0lnxQi9hkpPO77W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> this is a cleanup of pca963x LED driver, in spirit of previous
> patches I sent recently.
>=20
> This series should apply on your for-next.

I like the series. Looks good on quick review. Someone testing it
would be very welcome...

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--0lnxQi9hkpPO77W3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2owaAAKCRAw5/Bqldv6
8l1yAJ4xytH0qsgjUiE3ntaGhNaHf6xSswCfY0ml6LuR4VbLyPpKcCWgLTt6RNI=
=QIaJ
-----END PGP SIGNATURE-----

--0lnxQi9hkpPO77W3--
