Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7727024782C
	for <lists+linux-leds@lfdr.de>; Mon, 17 Aug 2020 22:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgHQUfW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Aug 2020 16:35:22 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:40280 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgHQUfV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Aug 2020 16:35:21 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CB3611C0BB7; Mon, 17 Aug 2020 22:35:19 +0200 (CEST)
Date:   Mon, 17 Aug 2020 22:35:19 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh@kernel.org, marek.behun@nic.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v33 0/6] LP50xx addition and remainder Multicolor patches
Message-ID: <20200817203519.GA14622@amd>
References: <20200812195020.13568-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <20200812195020.13568-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> These are the final patches from the original multicolor framework patchs=
et.
>=20
> Changes made were to the LP50xx to rework regmap_defaults to eliminate us=
ed
> only once #defines.  Also fixed putting the child node in the dt parsing =
and
> changed regmap regcache type to flat.

Thanks. I applied 1 and 2 of the series to the for-next branch.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl866gcACgkQMOfwapXb+vK3/gCgm1Jg7V7qaZpX1QGT/ZtA4YAD
8XIAnj3SrFGh3d1vaa5D5YEMboS1eNrv
=+nSX
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
