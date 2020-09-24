Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34AAA277091
	for <lists+linux-leds@lfdr.de>; Thu, 24 Sep 2020 14:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgIXMGl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Sep 2020 08:06:41 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35682 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgIXMGe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Sep 2020 08:06:34 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 99EEF1C0BCB; Thu, 24 Sep 2020 14:06:32 +0200 (CEST)
Date:   Thu, 24 Sep 2020 14:06:32 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH leds v3 3/9] leds: lm36274: use struct led_init_data when
 registering
Message-ID: <20200924120632.GC3933@duo.ucw.cz>
References: <20200919180304.2885-1-marek.behun@nic.cz>
 <20200919180304.2885-4-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Content-Disposition: inline
In-Reply-To: <20200919180304.2885-4-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> By using struct led_init_data when registering we do not need to parse
> `label` DT property. Moreover `label` is deprecated and if it is not
> present but `color` and `function` are, LED core will compose a name
> from these properties instead.
>=20
> Previously if the `label` DT property was not present, the code composed
> name for the LED in the form
>   "parent_name::"
> For backwards compatibility we therefore set
>   init_data->default_label =3D ":";
> so that the LED will not get a different name if `label` property is not
> present, nor are `color` and `function`.
>=20
> Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>
> Cc: Dan Murphy <dmurphy@ti.com>

I applied 1-3 of this series.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2yLyAAKCRAw5/Bqldv6
8m6KAKCS+EcQKLsP7fYy9aXoshhbKnoduQCeIis5O0i16XiU6+D46QItZbFNKxw=
=tQ93
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--
