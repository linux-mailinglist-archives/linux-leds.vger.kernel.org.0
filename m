Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13421EDB66
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2019 10:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbfKDJQH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Nov 2019 04:16:07 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33896 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728138AbfKDJQG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Nov 2019 04:16:06 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0400F1C06D3; Mon,  4 Nov 2019 10:09:59 +0100 (CET)
Date:   Mon, 4 Nov 2019 10:09:58 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Martin Schiller <ms@dev.tdt.de>
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com, rafal@milecki.pl,
        linux@rasmusvillemoes.dk, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: netdev: fix handling on interface rename
Message-ID: <20191104090958.GI12355@duo.ucw.cz>
References: <20191025070142.23654-1-ms@dev.tdt.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yhze8HlyfmXt1APY"
Content-Disposition: inline
In-Reply-To: <20191025070142.23654-1-ms@dev.tdt.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--yhze8HlyfmXt1APY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The NETDEV_CHANGENAME code is not "unneeded" like it is stated in commit
> 4cb6560514fa ("leds: trigger: netdev: fix refcnt leak on interface
> rename").
>=20
> The event was accidentally misinterpreted equivalent to
> NETDEV_UNREGISTER, but should be equivalent to NETDEV_REGISTER.
>=20
> This was the case in the original code from the openwrt project.
>=20
> Otherwise, you are unable to set netdev led triggers for (non-existent)
> netdevices, which has to be renamed. This is the case, for example, for
> ppp interfaces in openwrt.
>=20
> Fixes: 06f502f57d0d ("leds: trigger: Introduce a NETDEV trigger")
> Fixes: 4cb6560514fa ("leds: trigger: netdev: fix refcnt leak on interface=
 rename")
> Signed-off-by: Martin Schiller <ms@dev.tdt.de>

Thanks, applied.

I assume it does not fix _real bad_ bug to qualify for stable.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--yhze8HlyfmXt1APY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXb/q5gAKCRAw5/Bqldv6
8lRfAJ9218hA1HtD2txQdrnyAfZdMWB38ACgwBt2+abNumlOLi8NiQfUnIB05BI=
=jtTa
-----END PGP SIGNATURE-----

--yhze8HlyfmXt1APY--
