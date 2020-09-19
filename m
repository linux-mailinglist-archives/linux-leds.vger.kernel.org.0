Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28232270CBF
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 12:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgISKE3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 06:04:29 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:45368 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgISKE3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 06:04:29 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4E0321C0B85; Sat, 19 Sep 2020 12:04:26 +0200 (CEST)
Date:   Sat, 19 Sep 2020 12:04:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH leds v2 31/50] leds: lm36274: use devres LED registering
 function
Message-ID: <20200919100425.GA16109@duo.ucw.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
 <20200917223338.14164-32-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <20200917223338.14164-32-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> By using devres version of LED registering function we can remove the
> .remove method from this driver.

Please see a0972fff09479dd09b731360a3a0b09e4fb4d415.

And yes, Johan should have added a comment instead of placing it in
changelog. Feel free to add the comment. There was more than one such
patch IIRC.

Best regards,
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2XXqQAKCRAw5/Bqldv6
8pNGAKCBVzPLTTuhD4Ps+0m59MWqL2J/bACcCLzFuZcdUbhmgLME5MZA7UY9wUM=
=Hhc7
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
