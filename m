Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09E971247D
	for <lists+linux-leds@lfdr.de>; Fri,  3 May 2019 00:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbfEBWQE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 May 2019 18:16:04 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:35877 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfEBWQE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 May 2019 18:16:04 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id CCDC28030B; Fri,  3 May 2019 00:15:52 +0200 (CEST)
Date:   Fri, 3 May 2019 00:16:02 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, ibm-acpi@hmh.eng.br,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] leds: avoid races with workqueue
Message-ID: <20190502221602.GA23225@amd>
References: <20190427223207.GA3585@amd>
 <d2373c8b-5c66-c875-16c7-0c5a93470793@gmail.com>
 <20190429152259.GB10501@amd>
 <36e1fdd7-a220-4b0d-d558-829f522b0841@gmail.com>
 <20190501183600.GA20452@amd>
 <9337b5fb-0ff8-9925-29e6-a781884af861@gmail.com>
 <20190502191321.GB4845@amd>
 <62a99fe8-5c61-c681-3f9d-54e0a27a63d2@gmail.com>
 <20190502200606.GC4845@amd>
 <564697f8-ad02-6933-56e8-b3b19053d63d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <564697f8-ad02-6933-56e8-b3b19053d63d@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >Yes, that looks right. If you can add fixes: and cc: stable tags, the
> >rest should happen automagically.
>=20
> Cc: stable@kernel.org is exactly for what it claims - sending a copy
> to that list.
>=20
> "Fixes:" seems to be always enough for the bots to pick a patch.
>=20
> Tag added.

Well, docs says Cc: stable is right way to request inclusion, and it
does not talk about Fixes:... but I guess that will work too.

Thanks,
									Pavel

(
To have the patch automatically included in the stable tree, add the
tag

=2E. code-block:: none

     Cc: stable@vger.kernel.org

in the sign-off area. Once the patch is merged it will be applied to
the stable tree without anything else needing to be done by the author
or subsystem maintainer.
)

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzLbCIACgkQMOfwapXb+vLTRACgppf8XsAxNK6Gl2ZurjE45GG8
ncAAn0czatd0YesNkjk7bw3k7Tix2j6x
=nKoc
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
