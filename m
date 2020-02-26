Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B32C61700ED
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 15:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbgBZOP7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 09:15:59 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:43462 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgBZOP7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 09:15:59 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AAB5A1C0411; Wed, 26 Feb 2020 15:15:57 +0100 (CET)
Date:   Wed, 26 Feb 2020 15:15:57 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: How to synchronize leds in trigger
Message-ID: <20200226141557.GK4080@duo.ucw.cz>
References: <69050f67-b611-dfd9-b166-a0d51edc18e2@kaa.org.ua>
 <d44bcd3c-bc6f-9168-bfbd-c71469d5e771@gmail.com>
 <54c07894-f302-fe1e-9f03-aa30ea1abca1@kaa.org.ua>
 <20200130104424.22cec119@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZG5hGh9V5E9QzVHS"
Content-Disposition: inline
In-Reply-To: <20200130104424.22cec119@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ZG5hGh9V5E9QzVHS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > I'm happy to invest my time to implement such functionality.
> > I think it can be really useful for LEDs array like CR0014114 <https://=
git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=3Dv5.5=
&id=3Db9dd69155371ebd7055c182e30423edc9104239f>.
> >=20
> > In few days I can publish my vision,
> > but before that could you please explain why it will took months?
> > Where it can be hard to implement?
>=20
> Just look at how long the API for RGB LEDs is being agreed upon. It is
> over a year already, if not longer, and still not merged.

Sorry about that.

Anyway, you have a pretty good driver with RGB support disabled, IIRC,
and it only had one tiny thing left to fix.

If you want to re-submit that, maybe we can have that for 5.7.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZG5hGh9V5E9QzVHS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXlZ9nQAKCRAw5/Bqldv6
8siXAJ9hO+UN3Znv3QxgzxOMfawOriiApACeOGjVjbvWt+W+9DBga7p+6J7T4L8=
=iGFD
-----END PGP SIGNATURE-----

--ZG5hGh9V5E9QzVHS--
