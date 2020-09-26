Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17739279C3C
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 21:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgIZTsX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Sep 2020 15:48:23 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:43446 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgIZTsX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 26 Sep 2020 15:48:23 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7ABBC1C0C70; Sat, 26 Sep 2020 21:48:20 +0200 (CEST)
Date:   Sat, 26 Sep 2020 21:48:09 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Adrian Schmutzler <freifunk@adrianschmutzler.de>
Cc:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add include/dt-bindings/leds/ to linux-leds
 list
Message-ID: <20200926194809.GA31836@duo.ucw.cz>
References: <20200926164745.3779-1-freifunk@adrianschmutzler.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <20200926164745.3779-1-freifunk@adrianschmutzler.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The content of include/dt-bindings/leds/, particularly common.h,
> is apparantly maintained by the linux-leds list. This is also
> explicitly stated in the Documentation.
>=20
> Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 190c7fa2ea01..415f0e089bbe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9809,6 +9809,7 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
>  F:	Documentation/devicetree/bindings/leds/
>  F:	drivers/leds/
> +F:	include/dt-bindings/leds/
>  F:	include/linux/leds.h

I'd not say this is right. I'm not sure what the docs says, but I
don't commit dt changes without ack from Rob. With yaml stuff, I'm
even less confident doing so.

So I'd say Rob maintains this.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2+a+AAKCRAw5/Bqldv6
8oFPAKCd917mucNICiCfscCWe4NmLBOqEwCgjBRaTlKAMzcVPyq0xqYwE6I4/8I=
=LOy7
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
