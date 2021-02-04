Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A1F30F771
	for <lists+linux-leds@lfdr.de>; Thu,  4 Feb 2021 17:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237486AbhBDQPD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Feb 2021 11:15:03 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:53742 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237870AbhBDQN5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Feb 2021 11:13:57 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 44B691C0B77; Thu,  4 Feb 2021 17:12:43 +0100 (CET)
Date:   Thu, 4 Feb 2021 17:12:42 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: rt8515: add V4L2_FLASH_LED_CLASS dependency
Message-ID: <20210204161242.GE14305@duo.ucw.cz>
References: <20210204153951.1551156-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ILuaRSyQpoVaJ1HG"
Content-Disposition: inline
In-Reply-To: <20210204153951.1551156-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ILuaRSyQpoVaJ1HG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2021-02-04 16:39:44, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The leds-rt8515 driver can optionall use the v4l2 flash led class,

Optionally.

> Add the same dependency that the other users of this class have
> instead, which just prevents the broken configuration.
>=20
> Fixes: e1c6edcbea13 ("leds: rt8515: Add Richtek RT8515 LED driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the fix. If you plan to send a pull request to linus before
5.11, feel free to add it.

Acked-by: Pavel Machek <pavel@ucw.cz>

Otherwise I'll queue it for -rc1, I guess.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--ILuaRSyQpoVaJ1HG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYBwc+gAKCRAw5/Bqldv6
8h6XAJwPVXcS26ScGLxjsgJDhXn/gY9QdgCdEj+hPjkck79RV7CoI2RHiyLtbn4=
=aYuu
-----END PGP SIGNATURE-----

--ILuaRSyQpoVaJ1HG--
