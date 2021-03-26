Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B9634A36F
	for <lists+linux-leds@lfdr.de>; Fri, 26 Mar 2021 09:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhCZIwo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Mar 2021 04:52:44 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:50618 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhCZIwT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Mar 2021 04:52:19 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9D4921C0BB9; Fri, 26 Mar 2021 09:52:14 +0100 (CET)
Date:   Fri, 26 Mar 2021 09:52:14 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     cy_huang <u0084500@gmail.com>
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, cy_huang@richtek.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] leds: rt4505: Add support for Richtek RT4505
 flash LED controller
Message-ID: <20210326085213.GA21542@amd>
References: <1616739188-17719-1-git-send-email-u0084500@gmail.com>
 <1616739188-17719-2-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <1616739188-17719-2-git-send-email-u0084500@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add support for RT4505 flash LED controller. It can support up to 1.5A
> flash current with hardware timeout and low input voltage protection.
>=20
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Thank you, applied and pushed out.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmBdoL0ACgkQMOfwapXb+vLXHACfRN523TLaFcXlIeOs3uZU6EV1
P5cAni0ABu/P4GEWCmT2oc0XcKQcXlow
=ZtIY
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
