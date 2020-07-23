Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2300222B7EB
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 22:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgGWUkM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 16:40:12 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:36668 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgGWUkM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2020 16:40:12 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EBD2D1C0BD7; Thu, 23 Jul 2020 22:40:08 +0200 (CEST)
Date:   Thu, 23 Jul 2020 22:39:53 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] leds: add orange color
Message-ID: <20200723203953.iijldzbnfqh36mex@duo.ucw.cz>
References: <20200723125751.4045-1-marek.behun@nic.cz>
 <20200723193908.GA26165@amd>
 <57981a86-dd1b-09ee-8035-4c84d4c990df@gmail.com>
 <30b1f173-c687-9fe2-92bd-fc53f776cb77@gmail.com>
 <20200723201657.nb5dm2aqmjnizmpq@duo.ucw.cz>
 <8b36be51-3a75-458d-4fed-d730621e1547@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vzmddara4yq3lx3y"
Content-Disposition: inline
In-Reply-To: <8b36be51-3a75-458d-4fed-d730621e1547@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--vzmddara4yq3lx3y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > > > Many network devices have LEDs with green and orange color, ins=
tead of
> > > > > > green and yellow.
> > > > >=20
> > > > > Is it likely that we see device having both yellow and orange LED=
s?
> > > >=20
> > > > Why should we?
> > >=20
> > > This question actually refers to the below sentence...
> > >=20
> > > > > I'd simply lie and say those LEDs are yellow...
> > >=20
> > > So, why do you think we should strive to limit the number
> > > of color definitions?
> >=20
> > Because there's infinitely many colors :-). And programmers are bad at
> > differentiating them. You can't really tell wavelength of light by
> > looking at it.
> >=20
> > I mean.. yes, maybe we can add orange, pink, green-blue, violet,
> > ... white at different temperatures ...
> >=20
> > It will be rather long list.
>=20
> I think that we should allow setting the LED color name after
> what manufacturer claims it is.

Well, someone can try to compile list of common colors, and convince
me that this list is good enough...

=2E..but really, unless there's device where there are leds of
yellow/orange color... it may be easier to keep the current list.

IOW "are we solving real problem by introducing orange color"?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vzmddara4yq3lx3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXxn1mQAKCRAw5/Bqldv6
8kC0AKCuIcIRCrxuSBzqr63Qm+mNMaxa/QCWKEhXJ8WeOsPeqfR3/YiIyMNRLg==
=xDsn
-----END PGP SIGNATURE-----

--vzmddara4yq3lx3y--
