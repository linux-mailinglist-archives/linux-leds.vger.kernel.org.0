Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73B48EB89
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 22:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbfD2UTw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 16:19:52 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39644 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728928AbfD2UTw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Apr 2019 16:19:52 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 51DA88025B; Mon, 29 Apr 2019 22:19:41 +0200 (CEST)
Date:   Mon, 29 Apr 2019 22:19:49 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH leds/for-next v1 1/2] leds: turris_omnia: build if
 CONFIG_COMPILE_TEST=y
Message-ID: <20190429201949.GD24658@amd>
References: <20190429194433.29760-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vni90+aGYgRvsTuO"
Content-Disposition: inline
In-Reply-To: <20190429194433.29760-1-marek.behun@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--vni90+aGYgRvsTuO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-04-29 21:44:32, Marek Beh=FAn wrote:
> As Pavel pointed out, this driver should build if COMPILE_TEST is
> enabled.
>=20
> Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>

ACK.


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vni90+aGYgRvsTuO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzHXGUACgkQMOfwapXb+vJVkQCgs3lkf0iXVFxL602Lfc8qZgKg
/M4AoKxKah8Ik4CZXISK6wGJNK+lgj7W
=gimD
-----END PGP SIGNATURE-----

--vni90+aGYgRvsTuO--
