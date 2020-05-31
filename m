Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B522D1E9A01
	for <lists+linux-leds@lfdr.de>; Sun, 31 May 2020 21:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgEaTG1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 31 May 2020 15:06:27 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33996 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgEaTG1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 31 May 2020 15:06:27 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D46641C0BD2; Sun, 31 May 2020 21:06:25 +0200 (CEST)
Date:   Sun, 31 May 2020 21:06:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh@kernel.org,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v25 03/16] dt: bindings: lp50xx: Introduce the lp50xx
 family of RGB drivers
Message-ID: <20200531190625.GA30537@duo.ucw.cz>
References: <20200526164652.2331-1-dmurphy@ti.com>
 <20200526164652.2331-4-dmurphy@ti.com>
 <20200527135848.GB5011@amd>
 <d22658c2-07e2-74e6-dc2b-4b64fd9789dd@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
In-Reply-To: <d22658c2-07e2-74e6-dc2b-4b64fd9789dd@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > +          There can only be one instance of the ti,led-bank
> > > +          property for each device node.  This is a required node is=
 the LED
> > > +          modules are to be backed.
> > I don't understand the second sentence. Pretty sure it is not valid
> > english.
>=20
>=20
> If I make these changes is this still viable for 5.8 or would you then go
> into 5.9?

It really depends if we get -rc8 or not, and if you'll need to do any
changes to C code or not...

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXtQAMQAKCRAw5/Bqldv6
8mQ5AKCI6rJP7GSF+oHRZ4o+yuS6YCo22wCYnf0LlvVWugPqDe1HSeX9u2IF6Q==
=LIhM
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
