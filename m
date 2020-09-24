Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64502770B7
	for <lists+linux-leds@lfdr.de>; Thu, 24 Sep 2020 14:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbgIXMOb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Sep 2020 08:14:31 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:36504 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbgIXMOb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Sep 2020 08:14:31 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 052C11C0BCF; Thu, 24 Sep 2020 14:14:29 +0200 (CEST)
Date:   Thu, 24 Sep 2020 14:14:28 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Marek Behun <marek.behun@nic.cz>, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH leds + devicetree 02/13] leds: tca6507: use fwnode API
 instead of OF
Message-ID: <20200924121428.GE3933@duo.ucw.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
 <20200919221548.29984-3-marek.behun@nic.cz>
 <BD25CCC6-343D-4624-9718-276B3C7C6510@goldelico.com>
 <20200920193503.735bc66c@nic.cz>
 <20200920193953.3eccaf31@nic.cz>
 <ACF08157-2DD4-4135-8761-6D9D29B53FA4@goldelico.com>
 <AF3EF225-9188-4225-A0D6-B748736CA68F@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+JUInw4efm7IfTNU"
Content-Disposition: inline
In-Reply-To: <AF3EF225-9188-4225-A0D6-B748736CA68F@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--+JUInw4efm7IfTNU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > leds: various: use only available OF children
> > leds: various: use dev_of_node(dev) instead of dev->of_node
> >=20
> > Will try tomorrow.
>=20
> Ok, I have not found a negative effect on GTA04...
> Well, it only uses DT for ages.

Thanks, I applied 1 and 2 of the series.

Device tree and documentation changes are not really for me (I can
take the documentation ones if I get and ack). The rest does not look bad,
but I would not mind someone testing them.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--+JUInw4efm7IfTNU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2yNpAAKCRAw5/Bqldv6
8mCAAKChhLrWchKXtg5Cee/8Mn8EqyttkQCfcdOYPiR/TTEimYUyGSQ0LItcMSQ=
=zeFq
-----END PGP SIGNATURE-----

--+JUInw4efm7IfTNU--
