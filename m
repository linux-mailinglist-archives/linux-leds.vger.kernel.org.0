Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE9F2C3E5D
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 11:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgKYKqd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 05:46:33 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:36148 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbgKYKqc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 05:46:32 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1B8B51C0B7D; Wed, 25 Nov 2020 11:46:30 +0100 (CET)
Date:   Wed, 25 Nov 2020 11:46:29 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] leds: lp50xx: Fix an error handling path in
 'lp50xx_probe_dt()'
Message-ID: <20201125104629.GE25562@amd>
References: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
 <20200923133510.GJ4282@kadam>
 <faa49efc-5ba5-b6bd-b486-2f7c4611219b@wanadoo.fr>
 <20200924064932.GP18329@kadam>
 <20200928115301.GB3987353@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="idY8LE8SD6/8DnRI"
Content-Disposition: inline
In-Reply-To: <20200928115301.GB3987353@kuha.fi.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--idY8LE8SD6/8DnRI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > I have been trying to teach Smatch to understand reference counting=
 so
> > > > it can discover these kinds of bugs automatically.
> > > >=20
> > > > I don't know how software_node_get_next_child() can work when it do=
esn't
> > > > call kobject_get().  This sort of bug would have been caught in tes=
ting
> > > > because it affects the success path so I must be reading the code w=
rong.
> > > >=20
> > >=20
> > > I had the same reading of the code and thought that I was missing som=
ething
> > > somewhere.
> > >=20
> > > There is the same question about 'acpi_get_next_subnode' which is als=
o a
> > > '.get_next_child_node' function, without any ref counting, if I'm cor=
rect.
> > >=20
> >=20
> > Yeah, but there aren't any ->get/put() ops for the acpi_get_next_subnod=
e()
> > stuff so it's not a problem.  (Presumably there is some other sort of
> > refcounting policy there).
>=20
> OK, so I guess we need to make software_node_get_next_child()
> mimic the behaviour of of_get_next_available_child(), and not
> acpi_get_next_subnode(). Does the attached patch work?

Does not sound unreasonable. Did it get solved, somehow?

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--idY8LE8SD6/8DnRI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++NgUACgkQMOfwapXb+vIHzwCgworQ7zr2uP1ShsLQgTp5zabE
BLcAnjZC4LxmDlCixRQv6XHtwCEAST/3
=iaU9
-----END PGP SIGNATURE-----

--idY8LE8SD6/8DnRI--
