Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 831AB1B8963
	for <lists+linux-leds@lfdr.de>; Sat, 25 Apr 2020 22:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgDYUh5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 25 Apr 2020 16:37:57 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57272 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgDYUh5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 25 Apr 2020 16:37:57 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2EC501C0239; Sat, 25 Apr 2020 22:37:55 +0200 (CEST)
Date:   Sat, 25 Apr 2020 22:37:54 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 12/17] leds: lp55xx: Add multicolor framework support
 to lp55xx
Message-ID: <20200425203754.GD23926@amd>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-13-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OaZoDhBhXzo6bW1J"
Content-Disposition: inline
In-Reply-To: <20200423155524.13971-13-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--OaZoDhBhXzo6bW1J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-04-23 10:55:19, Dan Murphy wrote:
> Add multicolor framework support for the lp55xx family.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

> @@ -159,6 +164,8 @@ struct lp55xx_chip {
>   * struct lp55xx_led
>   * @chan_nr         : Channel number
>   * @cdev            : LED class device
> + * @mc_cdev	    : Multi color class device
> + * @color_components: Multi color LED map information

Whitespace is funny here.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--OaZoDhBhXzo6bW1J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEUEARECAAYFAl6kn6IACgkQMOfwapXb+vJnzQCYxQq5qrjkB8KwwXPFcDeEpFIM
+gCeOS/a5wMo4IAUUpp4RJmKCt6GJiw=
=oWxZ
-----END PGP SIGNATURE-----

--OaZoDhBhXzo6bW1J--
