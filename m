Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E6A285E22
	for <lists+linux-leds@lfdr.de>; Wed,  7 Oct 2020 13:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgJGLbI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 7 Oct 2020 07:31:08 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:59832 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbgJGLbI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Oct 2020 07:31:08 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 95FC11C0BB6; Wed,  7 Oct 2020 13:31:05 +0200 (CEST)
Date:   Wed, 7 Oct 2020 13:31:05 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Message-ID: <20201007113105.GE12224@duo.ucw.cz>
References: <20201006165850.17790-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Oiv9uiLrevHtW1RS"
Content-Disposition: inline
In-Reply-To: <20201006165850.17790-1-vadimp@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Oiv9uiLrevHtW1RS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-10-06 19:58:50, Vadim Pasternak wrote:
> It could be more than one instance of LED with the same name in the
> modular systems. For example, "status" or "uid" LED can be located
> on chassis and on each line card of modular system.
> In order to avoid conflicts with duplicated names, append platform
> device Id, which is unquie, to LED name after driver name.
> Thus, for example, "status" LED on chassis is to be called, like it is
> called now on non modular systems, on which platform device Id is not
> specified: "mlxreg:status:green". While for the line cards LEDs it will
> be called like: "mlxreg48:status:green", "mlxreg66:status:green",
> etcetera.

No.

You really should not have mlxreg: in the LED label. It is useless.

Make it so that LEDs on main body are ":foo:bar", and LEDs on the
expansion card has something reasonable as the device part.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Oiv9uiLrevHtW1RS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX32m+QAKCRAw5/Bqldv6
8juWAJ0Y7ZmfXfrrUsv7UOsenkqk4alewQCeNOrzs/yLgQpaXo9JtFn5zXVpHcc=
=qr1Y
-----END PGP SIGNATURE-----

--Oiv9uiLrevHtW1RS--
