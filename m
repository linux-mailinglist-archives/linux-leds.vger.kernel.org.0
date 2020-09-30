Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D1A27EFD2
	for <lists+linux-leds@lfdr.de>; Wed, 30 Sep 2020 18:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgI3Q7e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Sep 2020 12:59:34 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55744 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgI3Q7e (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 12:59:34 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3BCD41C0B76; Wed, 30 Sep 2020 18:59:31 +0200 (CEST)
Date:   Wed, 30 Sep 2020 18:59:30 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh@kernel.org>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Adam Ford <aford173@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        NeilBrown <neilb@suse.de>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH leds + devicetree 03/13] dt-bindings: leds: tca6507:
 convert to YAML
Message-ID: <20200930165930.GA27760@duo.ucw.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
 <20200919221548.29984-4-marek.behun@nic.cz>
 <20200929165606.GA767552@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <20200929165606.GA767552@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-09-29 11:56:06, Rob Herring wrote:
> On Sun, 20 Sep 2020 00:15:38 +0200, Marek Beh=FAn wrote:
> > This converts the tca6507 LED binding to yaml.
> >=20
> > Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>
> > Cc: NeilBrown <neilb@suse.de>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: H. Nikolaus Schaller <hns@goldelico.com>
> > Cc: Tony Lindgren <tony@atomide.com>
> > Cc: Adam Ford <aford173@gmail.com>
> > Cc: Viresh Kumar <viresh.kumar@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > ---
> >  .../devicetree/bindings/leds/tca6507.txt      |  49 -------
> >  .../devicetree/bindings/leds/ti,tca6507.yaml  | 134 ++++++++++++++++++
> >  2 files changed, 134 insertions(+), 49 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/leds/tca6507.txt
> >  create mode 100644 Documentation/devicetree/bindings/leds/ti,tca6507.y=
aml
> >=20
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks, applied.

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3S5cgAKCRAw5/Bqldv6
8i0oAJ934xCRcpK1fsGTfXVUu1FgrJQJXACdHeP435zEXoQmwjHDjX7Ws1AvADI=
=uK9j
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
