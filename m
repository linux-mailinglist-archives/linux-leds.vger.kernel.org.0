Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B79CA1BB906
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2020 10:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgD1InE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Apr 2020 04:43:04 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35424 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgD1InD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Apr 2020 04:43:03 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5CE801C0265; Tue, 28 Apr 2020 10:43:02 +0200 (CEST)
Date:   Tue, 28 Apr 2020 10:43:01 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 02/17] leds: Add multicolor ID to the color ID list
Message-ID: <20200428084301.GC20640@amd>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-3-dmurphy@ti.com>
 <20200425195242.GA1143@bug>
 <003891b8-a697-6d55-3862-5773e23a466a@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Content-Disposition: inline
In-Reply-To: <003891b8-a697-6d55-3862-5773e23a466a@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-04-27 12:12:18, Dan Murphy wrote:
> Pavel
>=20
> On 4/25/20 2:52 PM, Pavel Machek wrote:
> >On Thu 2020-04-23 10:55:09, Dan Murphy wrote:
> >>Add a new color ID that is declared as MULTICOLOR as with the
> >>multicolor framework declaring a definitive color is not accurate
> >>as the node can contain multiple colors.
> >>
> >>Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >Please merge with previous patch, and you can keep reviews.
>=20
> Not sure we should do that.=A0 The previous patches deals directly with t=
he
> bindings and this is code.
>=20
> I thought the rule was to keep bindings and code separated.
>=20
> It made sense to squash the bindings header patch to the bindings document
> patch but it does not make sense to squash this patch to the bindings.
>=20
> Please let me know if you want me to proceed with the squash.

Well, OTOH it seems wrong to have array that is only
half-initialized... But it is not a big deal.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6n7JUACgkQMOfwapXb+vKOxQCffeMiLO16ErCjGnPSc4HtSVu3
Bm0An1e04aRx8T6MkLO1cxxUF3Lr2skC
=iN50
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--
