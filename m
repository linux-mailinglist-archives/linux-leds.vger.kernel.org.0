Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74DBD36A94C
	for <lists+linux-leds@lfdr.de>; Sun, 25 Apr 2021 22:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhDYU6A (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 25 Apr 2021 16:58:00 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49624 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhDYU57 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 25 Apr 2021 16:57:59 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 49F071C0B79; Sun, 25 Apr 2021 22:57:18 +0200 (CEST)
Date:   Sun, 25 Apr 2021 22:57:17 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: LEDS_BLINK_LGM should depend on X86
Message-ID: <20210425205717.GD10996@amd>
References: <20210316133946.2376963-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="DiL7RhKs8rK9YGuF"
Content-Disposition: inline
In-Reply-To: <20210316133946.2376963-1-geert+renesas@glider.be>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--DiL7RhKs8rK9YGuF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The Intel Lightning Mountain (LGM) Serial Shift Output controller (SSO)
> is only present on Intel Lightning Mountain SoCs.  Hence add a
> dependency on X86, to prevent asking the user about this driver when
> configuring a kernel without Intel Lightning Mountain platform support.
>=20
> While at it, merge the other dependencies into a single statement.
>=20
> Fixes: c3987cd2bca34ddf ("leds: lgm: Add LED controller driver for LGM So=
C")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This rejected, so I applied it by hand. I'm deleting the Fixes tag --
we don't want this in stable.

Thanks and best regards,
							Pavel

--=20
http://www.livejournal.com/~pavelmachek

--DiL7RhKs8rK9YGuF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCF160ACgkQMOfwapXb+vLx5ACgmQ42W4Cy6adL2ixq0WsP3v41
i3QAoI5tOZK3Pmy6BDAw919XdaB2B4t4
=nx5Y
-----END PGP SIGNATURE-----

--DiL7RhKs8rK9YGuF--
