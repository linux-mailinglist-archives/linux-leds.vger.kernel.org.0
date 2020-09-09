Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E62262B99
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 11:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgIIJS3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Sep 2020 05:18:29 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53458 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbgIIJS3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Sep 2020 05:18:29 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5608A1C0B87; Wed,  9 Sep 2020 11:18:26 +0200 (CEST)
Date:   Wed, 9 Sep 2020 11:18:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Grant Feng <von81@163.com>
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com, robh+dt@kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] leds: is31fl319x: Add shutdown pin and generate a
 5ms low pulse when startup
Message-ID: <20200909091825.GA14289@amd>
References: <20200825082206.26575-1-von81@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <20200825082206.26575-1-von81@163.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-08-25 16:22:05, Grant Feng wrote:
> generate a 5ms low pulse on shutdown pin when startup, then the chip
> becomes more stable in the complex EM environment.

Thanks, I applied the series.

Best regards,
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9YneEACgkQMOfwapXb+vLajgCfW0n9+F/Lpu0ojSH90wVJCpS9
FKYAoMM4Nu3Gueg4e6u+DHY+5mPOmJAF
=6kU8
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
