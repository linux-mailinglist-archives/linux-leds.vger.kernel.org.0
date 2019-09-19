Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABFFB76C3
	for <lists+linux-leds@lfdr.de>; Thu, 19 Sep 2019 11:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388893AbfISJyS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Sep 2019 05:54:18 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47392 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388941AbfISJyS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Sep 2019 05:54:18 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id C5D6580653; Thu, 19 Sep 2019 11:54:02 +0200 (CEST)
Date:   Thu, 19 Sep 2019 11:54:15 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] leds: lm3692x: Probing and flag fixes
Message-ID: <20190919095415.GA29939@amd>
References: <cover.1568772964.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
In-Reply-To: <cover.1568772964.git.agx@sigxcpu.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-09-17 19:19:53, Guido G=FCnther wrote:
> The driver currently returns success on init although probing fails and
> register setup uses flag values from other registers which is confusing
> when reading the driver. This series cleans this up.

1,3,4,5: Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2DUEcACgkQMOfwapXb+vLkagCbBPMe4cm/BU7fNEulKOVcH2uI
s0AAn1PKsRbkTG1+M3fn4yZLiIG5FYGr
=y9/9
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
