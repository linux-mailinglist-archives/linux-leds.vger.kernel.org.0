Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3949427184F
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 23:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgITVpf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 17:45:35 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49376 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgITVpf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 17:45:35 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3FECD1C0B7A; Sun, 20 Sep 2020 23:45:33 +0200 (CEST)
Date:   Sun, 20 Sep 2020 23:45:32 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH leds v3 6/9] leds: lm36274: use devres LED registering
 function
Message-ID: <20200920214532.GB31397@duo.ucw.cz>
References: <20200919180304.2885-1-marek.behun@nic.cz>
 <20200919180304.2885-7-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline
In-Reply-To: <20200919180304.2885-7-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Now that the potential use-after-free issue is resolved we can use
> devres for LED registration in this driver.
>=20
> By using devres version of LED registering function we can remove the
> .remove method from this driver.
>=20
> Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>
> Cc: Dan Murphy <dmurphy@ti.com>

AFAICT this one is buggy, I sent explanation before. Why are you
resubmitting it?

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2fNfAAKCRAw5/Bqldv6
8ihHAJ0csKvjQ/5Ptq8fnzk29TeQy+Z1wACgni2LiJI9ChMT0HXmU250JEZI9V4=
=qC4Q
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
