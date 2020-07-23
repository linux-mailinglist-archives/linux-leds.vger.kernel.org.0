Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 861DB22B8CA
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 23:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgGWVil (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 17:38:41 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41436 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbgGWVil (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2020 17:38:41 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A258E1C0BD5; Thu, 23 Jul 2020 23:38:38 +0200 (CEST)
Date:   Thu, 23 Jul 2020 23:38:38 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] leds: add orange color
Message-ID: <20200723213838.a6intg3rxu6v6vxr@duo.ucw.cz>
References: <20200723125751.4045-1-marek.behun@nic.cz>
 <20200723193908.GA26165@amd>
 <57981a86-dd1b-09ee-8035-4c84d4c990df@gmail.com>
 <30b1f173-c687-9fe2-92bd-fc53f776cb77@gmail.com>
 <20200723201657.nb5dm2aqmjnizmpq@duo.ucw.cz>
 <8b36be51-3a75-458d-4fed-d730621e1547@gmail.com>
 <20200723203953.iijldzbnfqh36mex@duo.ucw.cz>
 <854ee2f0-4dd1-b665-f216-bff33ab3b571@gmail.com>
 <20200723210452.c63oup3k7w4icqc6@duo.ucw.cz>
 <20200723231755.6b6476c0@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="onv5t7tqvj5pzvca"
Content-Disposition: inline
In-Reply-To: <20200723231755.6b6476c0@nic.cz>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--onv5t7tqvj5pzvca
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > ...but really, unless there's device where there are leds of
> > > > yellow/orange color... it may be easier to keep the current list. =
=20
> > >=20
> > > Yellow has been available since the inception of the led_colors array,
> > > so if we have that, then why we should not have orange? =20
> >=20
> > I fear people will confuse yellow and orange.
>=20
> LOL, so I looked into schematics and the manufacturer of the ethernet
> port cage calls the LED yellow. So apparently I confused it with
> orange... :D

Apparently orange LEDs do exist (and some call them amber) as do
violet, pink, greenish-blue, ...

But... let's not extend the list unless we have good reason.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--onv5t7tqvj5pzvca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXxoDXgAKCRAw5/Bqldv6
8vCAAJ90mVxLRRiP6RrCoi7OtZn+b2B5PQCgnjKQMQrMoDm19mmTJ2fu+G2Q/DE=
=0b9N
-----END PGP SIGNATURE-----

--onv5t7tqvj5pzvca--
