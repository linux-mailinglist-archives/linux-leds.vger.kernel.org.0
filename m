Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA50318E29C
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 16:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbgCUPeq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 11:34:46 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54822 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgCUPeq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Mar 2020 11:34:46 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 022CA1C0337; Sat, 21 Mar 2020 16:34:44 +0100 (CET)
Date:   Sat, 21 Mar 2020 16:34:44 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia LEDs
Message-ID: <20200321153444.GE8386@duo.ucw.cz>
References: <20200319181604.2425-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Dzs2zDY0zgkG72+7"
Content-Disposition: inline
In-Reply-To: <20200319181604.2425-1-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Dzs2zDY0zgkG72+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +	if (led->color !=3D color) {
> +		dev_warn(dev, "Node %pfw: 'color' should be %s!\n", node,
> +			 led_colors[color]);
> +		return 0;
> +	}
> +
> +	init_data.devicename =3D "omnia";
> +	init_data.fwnode =3D node;
> +	init_data.devname_mandatory =3D true;

How will this look in the /sys/class/leds?

We don't want to see omnia:xxx:xx there. For the ethernet activity
leds, it would be nice to get something like eth0:red:activity...?

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Dzs2zDY0zgkG72+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXnY0FAAKCRAw5/Bqldv6
8gycAJ9aIJ1Yo9HcJXN4zPTRu0mB2gUUnwCglpqBucDpJ1+Bi5WClu4obIpYHlQ=
=omSA
-----END PGP SIGNATURE-----

--Dzs2zDY0zgkG72+7--
