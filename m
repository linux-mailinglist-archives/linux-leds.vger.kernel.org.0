Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2441B54C0
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2020 08:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbgDWGfz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Apr 2020 02:35:55 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52470 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgDWGfz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Apr 2020 02:35:55 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6685B1C01F2; Thu, 23 Apr 2020 08:35:53 +0200 (CEST)
Date:   Thu, 23 Apr 2020 08:35:52 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: add cznic,turris-omnia-leds
 binding
Message-ID: <20200423063552.GA22554@amd>
References: <20200421171732.8277-1-marek.behun@nic.cz>
 <20200421171732.8277-2-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <20200421171732.8277-2-marek.behun@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add device-tree bindings documentation for Turris Omnia RGB LEDs.
>=20
> Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>
> Cc: Rob Herring <robh+dt@kernel.org>

Rob already reviewed this one. Is there reason not to have his
reviewed-by here?

https://patchwork.ozlabs.org/project/devicetree-bindings/patch/201903281934=
28.19273-3-marek.behun@nic.cz/

>  MAINTAINERS                                   |   5 +-

Please put MAINTAINERS change into separate patch. I don't think I can
merge it throught the LEDs tree.

Best regards,
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEUEARECAAYFAl6hN0gACgkQMOfwapXb+vLoiwCYw6TcjTE/K9oQ4das15s2Jx6J
zQCgwY9c+n7fhct+h2bYLxLPE86pcTg=
=gPI3
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
