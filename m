Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 584B030DCA4
	for <lists+linux-leds@lfdr.de>; Wed,  3 Feb 2021 15:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232812AbhBCOYt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Feb 2021 09:24:49 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:45708 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232770AbhBCOYe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Feb 2021 09:24:34 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1FA421C0BB5; Wed,  3 Feb 2021 15:23:37 +0100 (CET)
Date:   Wed, 3 Feb 2021 15:23:36 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: lp50xx: remove unused regulator
Message-ID: <20210203142336.GA12369@duo.ucw.cz>
References: <20210203083408.2534-1-schuchmann@schleissheimer.de>
 <20210203090249.GA14154@amd>
 <2e9dff78-7fde-404d-6fad-6aeedf1145d1@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
In-Reply-To: <2e9dff78-7fde-404d-6fad-6aeedf1145d1@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2021-02-03 07:49:35, Dan Murphy wrote:
> Pavel
>=20
> On 2/3/21 3:02 AM, Pavel Machek wrote:
> > On Wed 2021-02-03 08:34:08, Sven Schuchmann wrote:
> > > The regulator for vled-supply is unused in the driver.
> > > It is just assigned from DT and disabled in lp50xx_remove.
> > > So the code can be removed from the driver.
> > Dan, what is going on here? Do we need to also enable the regulator,
> > or is the removal correct thing to do?
> >=20
> I think it would be better to do an enable as opposed to removing the cod=
e.
>=20
> This would be needed especially in applications that have to meet strict
> power management requirements.
>=20
> Users may want to disable or enable the regulator during suspend/resume.
> Otherwise it would be considered always-on and the regulator does not need
> to be populated.

Do you have set up where this is needed and you can test this? Will
you submit the fixes?

Best regards,

									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYBqx6AAKCRAw5/Bqldv6
8jFQAKCyPEEBmWIfS2dealtjPjKjlpJHBACeOJjX45J5QLjGO8fmQ0dbBipQBEw=
=u8q6
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
