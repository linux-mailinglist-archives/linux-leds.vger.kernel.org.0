Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B14C2B239
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2019 12:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfE0Kd6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 May 2019 06:33:58 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50928 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfE0Kd6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 May 2019 06:33:58 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 7158D80490; Mon, 27 May 2019 12:33:46 +0200 (CEST)
Date:   Mon, 27 May 2019 12:33:56 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/9] leds: multicolor: Add sysfs interface definition
Message-ID: <20190527103355.GA5287@amd>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <20190523190820.29375-2-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-05-23 14:08:12, Dan Murphy wrote:
> Add a documentation of LED Multicolor LED class specific
> sysfs attributes.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../ABI/testing/sysfs-class-led-multicolor    | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>=20
> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Docum=
entation/ABI/testing/sysfs-class-led-multicolor
> new file mode 100644
> index 000000000000..2f102ede258b
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -0,0 +1,57 @@
> +What:		/sys/class/leds/<led>/colors/sync_enable
> +Date:		April 2019

I believe I suggested more reasonable interface. Why not use that?

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzrvRIACgkQMOfwapXb+vJdxQCfXnAO1nLU1TIocQz6gagl1XRu
PSsAn17PTm9eh3T5EcXZOPxosG8n4/3+
=xsN+
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
