Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1E0F18E253
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 16:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbgCUPP1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 11:15:27 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51508 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbgCUPP1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Mar 2020 11:15:27 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1A9451C031D; Sat, 21 Mar 2020 16:15:25 +0100 (CET)
Date:   Sat, 21 Mar 2020 16:15:09 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Denis Osterland-Heim <denis.osterland@diehl.com>
Cc:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 5/5] leds: pwm: add reference to common leds for
 default-state
Message-ID: <20200321151509.GA8386@duo.ucw.cz>
References: <20200321081321.15614-1-Denis.Osterland@diehl.com>
 <20200321081321.15614-6-Denis.Osterland@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <20200321081321.15614-6-Denis.Osterland@diehl.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2020-03-21 08:15:51, Denis Osterland-Heim wrote:
> The default-state is now supported for PWM leds.
>=20
> Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXnYvfQAKCRAw5/Bqldv6
8vruAJ9JigSRV352Q9mnIWerJuIlHO7fMwCghlhj8whKe4nARjXc3LwaszgwvbQ=
=rxOr
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
