Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6486227EFE6
	for <lists+linux-leds@lfdr.de>; Wed, 30 Sep 2020 19:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731333AbgI3REE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Sep 2020 13:04:04 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:56250 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731332AbgI3REE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 13:04:04 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 966651C0B76; Wed, 30 Sep 2020 19:04:03 +0200 (CEST)
Date:   Wed, 30 Sep 2020 19:04:03 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Peter Meerwald <p.meerwald@bct-electronic.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Zahari Petkov <zahari@balena.io>
Subject: Re: [PATCH leds 7/7] leds: pca963x: use struct led_init_data when
 registering
Message-ID: <20200930170403.GE27760@duo.ucw.cz>
References: <20200920002500.5851-1-marek.behun@nic.cz>
 <20200920002500.5851-8-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Content-Disposition: inline
In-Reply-To: <20200920002500.5851-8-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
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
>   "pca963x:%d:%.2x:%u"
> For backwards compatibility we therefore set init_data->default_label
> to this value so that the LED will not get a different name if `label`
> property is not present, nor are `color` and `function`.

I took patches 6 and 7 of the series.

Thanks,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3S6gwAKCRAw5/Bqldv6
8p3eAJ90tsizkHypQvI39qbtIDSG9HuBnwCgs3ZbRs6oWbSbLMF6wTu5aAMKnIM=
=hzbP
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--
