Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09C90241994
	for <lists+linux-leds@lfdr.de>; Tue, 11 Aug 2020 12:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728571AbgHKKUb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Aug 2020 06:20:31 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52836 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728448AbgHKKUb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2020 06:20:31 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BB2661C0BD8; Tue, 11 Aug 2020 12:20:28 +0200 (CEST)
Date:   Tue, 11 Aug 2020 12:20:28 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh@kernel.org, marek.behun@nic.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v32 1/6] dt: bindings: lp50xx: Introduce the lp50xx
 family of RGB drivers
Message-ID: <20200811102028.tjea7oqbzb5jjqip@duo.ucw.cz>
References: <20200722153146.8767-1-dmurphy@ti.com>
 <20200722153146.8767-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7jkgene5vcu5zbvy"
Content-Disposition: inline
In-Reply-To: <20200722153146.8767-2-dmurphy@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--7jkgene5vcu5zbvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!
On Wed 2020-07-22 10:31:41, Dan Murphy wrote:
> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024,
> LP5018, LP5012 and LP5009 RGB LED device driver.  The LP5036/30/24/18/12/9
> can control RGB LEDs individually or as part of a control bank group.
> These devices have the ability to adjust the mixing control for the RGB
> LEDs to obtain different colors independent of the overall brightness of
> the LED grouping.
>=20
> Datasheet:
> http://www.ti.com/lit/ds/symlink/lp5012.pdf
> http://www.ti.com/lit/ds/symlink/lp5024.pdf
> http://www.ti.com/lit/ds/symlink/lp5036.pdf
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

> +           multi-led@1 {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reg =3D <0x1>;
> +               color =3D <LED_COLOR_ID_MULTI>;
> +               function =3D LED_FUNCTION_CHARGING;

These are just examples, but we should really separate "MULTI" colors
and "RGB".

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--7jkgene5vcu5zbvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXzJw7AAKCRAw5/Bqldv6
8pbSAJ9s18t0lQR7n0nNMX/9cwncEkoDIwCgvjSqotB88Nj3mVWhq3SbaHJ4yq4=
=k3hG
-----END PGP SIGNATURE-----

--7jkgene5vcu5zbvy--
