Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB0023D3BA
	for <lists+linux-leds@lfdr.de>; Wed,  5 Aug 2020 23:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgHEV5r (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Aug 2020 17:57:47 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53652 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgHEV5r (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Aug 2020 17:57:47 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7AC521C0BD2; Wed,  5 Aug 2020 23:57:44 +0200 (CEST)
Date:   Wed, 5 Aug 2020 23:57:44 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Grant Feng <von81@163.com>
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] leds: is31fl32xx: Add sdb pin and generate a 5ms low
 pulse when startup
Message-ID: <20200805215744.tlm5ycvl5zxcmvpm@duo.ucw.cz>
References: <20200803102935.24364-1-von81@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mkm5roqqrkejkkn5"
Content-Disposition: inline
In-Reply-To: <20200803102935.24364-1-von81@163.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--mkm5roqqrkejkkn5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-08-03 18:29:35, Grant Feng wrote:
> generate a 5ms low pulse on sdb pin when startup, then the chip
> becomes more stable in the complex EM environment.

Thanks, applied.
							Pavel
						=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--mkm5roqqrkejkkn5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXysrWAAKCRAw5/Bqldv6
8ourAJ47uRQe1hhBU5T+PMcCjYVzsXp3nQCdFkpXP/87MySWtrGsXuhbdJ2dE5I=
=1tRL
-----END PGP SIGNATURE-----

--mkm5roqqrkejkkn5--
