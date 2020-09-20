Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5698C271850
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 23:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgITVqv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 17:46:51 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49526 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgITVqu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 17:46:50 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 31DDD1C0B7A; Sun, 20 Sep 2020 23:46:48 +0200 (CEST)
Date:   Sun, 20 Sep 2020 23:46:47 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>, dmurphy@ti.com,
        linux-kernel@vger.kernel.org, Antonio Ospite <ao2@ao2.it>
Subject: Re: [PATCH leds] leds: regulator: remove driver
Message-ID: <20200920214647.GC31397@duo.ucw.cz>
References: <20200920204203.17148-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Content-Disposition: inline
In-Reply-To: <20200920204203.17148-1-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-09-20 22:42:03, Marek Beh=FAn wrote:
> The leds-regulator driver only supports the old platform data binding
> and no in-tree code uses it. It also seems that no OpenWRT board uses
> it.
>=20
> Remove this driver.

Lets keep this one. Connecting LED directly to regulator simply makes
sense.

Best regards,

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2fNxwAKCRAw5/Bqldv6
8n+gAKCBEyhXpLLso5cZ7smH5TyWDzyN0gCgqjmDjXQVKYxudktyepJM/DYN5s4=
=fPkY
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--
