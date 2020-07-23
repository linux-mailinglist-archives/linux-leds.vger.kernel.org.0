Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A95C422B760
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 22:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725979AbgGWURA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 16:17:00 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34376 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgGWUQ7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2020 16:16:59 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 613FA1C0BD7; Thu, 23 Jul 2020 22:16:57 +0200 (CEST)
Date:   Thu, 23 Jul 2020 22:16:57 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] leds: add orange color
Message-ID: <20200723201657.nb5dm2aqmjnizmpq@duo.ucw.cz>
References: <20200723125751.4045-1-marek.behun@nic.cz>
 <20200723193908.GA26165@amd>
 <57981a86-dd1b-09ee-8035-4c84d4c990df@gmail.com>
 <30b1f173-c687-9fe2-92bd-fc53f776cb77@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oiazyhqct7khpp2v"
Content-Disposition: inline
In-Reply-To: <30b1f173-c687-9fe2-92bd-fc53f776cb77@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--oiazyhqct7khpp2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > Many network devices have LEDs with green and orange color, instead=
 of
> > > > green and yellow.
> > >=20
> > > Is it likely that we see device having both yellow and orange LEDs?
> >=20
> > Why should we?
>=20
> This question actually refers to the below sentence...
>=20
> > > I'd simply lie and say those LEDs are yellow...
>=20
> So, why do you think we should strive to limit the number
> of color definitions?

Because there's infinitely many colors :-). And programmers are bad at
differentiating them. You can't really tell wavelength of light by
looking at it.

I mean.. yes, maybe we can add orange, pink, green-blue, violet,
=2E.. white at different temperatures ...

It will be rather long list.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--oiazyhqct7khpp2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXxnwOQAKCRAw5/Bqldv6
8mxkAJ92euDOpPz4qAP0AnpRlskzSMmdYwCeN5iGJtFfLueYlWja2M13epfYP/g=
=PTPD
-----END PGP SIGNATURE-----

--oiazyhqct7khpp2v--
