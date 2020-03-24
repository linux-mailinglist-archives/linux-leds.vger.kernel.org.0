Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CADE21909C6
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2020 10:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgCXJm1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Mar 2020 05:42:27 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44776 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbgCXJm1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Mar 2020 05:42:27 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 574CA1C0343; Tue, 24 Mar 2020 10:42:25 +0100 (CET)
Date:   Tue, 24 Mar 2020 10:42:22 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Nicolas Belin <nbelin@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, dmurphy@ti.com,
        devicetree@vger.kernel.org, baylibre-upstreaming@groups.io
Subject: Re: [PATCH v3 3/3] drivers: leds: add support for apa102c leds
Message-ID: <20200324094222.GA15096@amd>
References: <1583502010-16210-1-git-send-email-nbelin@baylibre.com>
 <1583502010-16210-4-git-send-email-nbelin@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <1583502010-16210-4-git-send-email-nbelin@baylibre.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-03-06 14:40:10, Nicolas Belin wrote:
> Initilial commit in order to support the apa102c RGB leds. The

Initial

> RGB and global brightness management is done by creating 4 leds
> from the Led Framework per apa102c led.
>=20

> +
> +		/* setting a color_id value for each of the 4 components of the
> +		 * apa102c RGB led. The first component is the global brightness
> +		 * of the led and thus has no color. The order of the colors
> +		 * after the global brightness is then blue, green and red
> +		 * in that order. It corresponds to the order in which the
> +		 * values are sent using spi
> +		 */
> +		rgb_led->component[0].color_id =3D -1; //no color

Please follow codingstyle on comment style and avoid // comments.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl551f4ACgkQMOfwapXb+vKNAACdHyKBsVW3v6cli5ZVCgheH7ky
D3kAnA22fu4Dv4StJjio2r7Ne6PEyWkM
=IEwh
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
