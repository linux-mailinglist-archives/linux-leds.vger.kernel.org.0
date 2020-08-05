Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46A023D3B7
	for <lists+linux-leds@lfdr.de>; Wed,  5 Aug 2020 23:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgHEV5e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Aug 2020 17:57:34 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53634 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgHEV5d (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Aug 2020 17:57:33 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7FB6F1C0BD2; Wed,  5 Aug 2020 23:57:30 +0200 (CEST)
Date:   Wed, 5 Aug 2020 23:57:30 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: s3c24xx: Remove unused machine header include
Message-ID: <20200805215730.h6434lief5drnnu2@duo.ucw.cz>
References: <20200803091936.24984-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ljilayodnbc3yjys"
Content-Disposition: inline
In-Reply-To: <20200803091936.24984-1-krzk@kernel.org>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ljilayodnbc3yjys
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-08-03 11:19:36, Krzysztof Kozlowski wrote:
> The driver includes machine header for GPIO registers but actually does
> not use them.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks, applied.
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ljilayodnbc3yjys
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXysrSgAKCRAw5/Bqldv6
8u62AJ4ir1EErxG9h1Qow2wCQ9gAFcX1JQCeMUBE9VPpVUUiBlKwiaTd1OB961k=
=x79/
-----END PGP SIGNATURE-----

--ljilayodnbc3yjys--
