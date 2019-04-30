Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 358E61022A
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 00:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbfD3WFa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 18:05:30 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:54339 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfD3WFa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 18:05:30 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 883F6802FE; Wed,  1 May 2019 00:05:18 +0200 (CEST)
Date:   Wed, 1 May 2019 00:05:27 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/7] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
Message-ID: <20190430220527.GC20410@amd>
References: <20190430191730.19450-1-dmurphy@ti.com>
 <20190430191730.19450-6-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Content-Disposition: inline
In-Reply-To: <20190430191730.19450-6-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-04-30 14:17:28, Dan Murphy wrote:
> The LM3697 is a single function LED driver. The single function LED
> driver needs to reside in the LED directory as a dedicated LED driver
> and not as a MFD device.  The device does have common brightness and ramp
> features and those can be accomodated by a TI LMU framework.
>=20
> The LM3697 dt binding needs to be moved from the ti-lmu.txt and a dedicat=
ed
> LED dt binding needs to be added.  The new LM3697 LED dt binding will then
> reside in the Documentation/devicetree/bindings/leds directory and follow=
 the
> current LED and general bindings guidelines.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>=20
> v3 - No changes added Reviewed-by Rob - https://lore.kernel.org/patchwork=
/patch/1058762/
>=20
> v2 - Made changes to reference ti,brightness-resolution to the ti-lmu.txt=
 -
> https://lore.kernel.org/patchwork/patch/1054501/
>=20
>  .../devicetree/bindings/leds/leds-lm3697.txt  | 73 +++++++++++++++++++
>  .../devicetree/bindings/mfd/ti-lmu.txt        | 27 +------
>  2 files changed, 74 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3697.txt b/Doc=
umentation/devicetree/bindings/leds/leds-lm3697.txt
> new file mode 100644
> index 000000000000..02378f33c9ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
> @@ -0,0 +1,73 @@
> +* Texas Instruments - LM3697 Highly Efficient White LED Driver
> +
> +The LM3697 11-bit LED driver provides high-
> +performance backlight dimming for 1, 2, or 3 series
> +LED strings while delivering up to 90% efficiency.
> +
> +This device is suitable for display and keypad Lighting

"lightning."
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzIxqcACgkQMOfwapXb+vINZQCfQmpVTdPQHXb97Gc7qaf68H19
2+YAnidEX+z480WDvj0tuj61J/oiRamI
=JIXb
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
