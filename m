Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A71A92270
	for <lists+linux-leds@lfdr.de>; Mon, 19 Aug 2019 13:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbfHSLbO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Aug 2019 07:31:14 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:43483 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbfHSLbO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Aug 2019 07:31:14 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 41A8C8160B; Mon, 19 Aug 2019 13:30:59 +0200 (CEST)
Date:   Mon, 19 Aug 2019 13:31:12 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, daniel.thompson@linaro.org, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: document the "power-supply"
 property
Message-ID: <20190819113111.GH21072@amd>
References: <20190715155657.22976-1-jjhiblot@ti.com>
 <20190715155657.22976-2-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Uu2n37VG4rOBDVuR"
Content-Disposition: inline
In-Reply-To: <20190715155657.22976-2-jjhiblot@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Uu2n37VG4rOBDVuR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-07-15 17:56:56, Jean-Jacques Hiblot wrote:
> Most of the LEDs are powered by a voltage/current regulator. Describing it
> in the device-tree makes it possible for the LED core to enable/disable it
> when needed.
>=20
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Uu2n37VG4rOBDVuR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1aiH8ACgkQMOfwapXb+vJ6XQCgiIrpQmvbBHZjEjV5SpEDtd84
gAgAn03AYtiswSYRdaEQAeNIr2uR6Z8w
=wPaJ
-----END PGP SIGNATURE-----

--Uu2n37VG4rOBDVuR--
