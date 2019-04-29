Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04654E828
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 18:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbfD2QxX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 12:53:23 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50092 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728520AbfD2QxX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Apr 2019 12:53:23 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 2EE5F80565; Mon, 29 Apr 2019 18:53:12 +0200 (CEST)
Date:   Mon, 29 Apr 2019 18:53:20 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Subject: Re: linux-next: Tree for Apr 29 (drivers/leds/leds-turris-omnia)
Message-ID: <20190429165319.GB16782@amd>
References: <20190429190354.0d5e2e93@canb.auug.org.au>
 <d3822785-0683-28df-ffa6-ab679aa27c73@infradead.org>
 <20190429153200.GA11761@amd>
 <20190429173842.06f02852@nic.cz>
 <20190429163753.GA16782@amd>
 <20190429184439.68049050@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline
In-Reply-To: <20190429184439.68049050@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-04-29 18:44:39, Marek Behun wrote:
> On Mon, 29 Apr 2019 18:37:53 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
>=20
> > On Mon 2019-04-29 17:38:42, Marek Behun wrote:
> > > I am sending patch only adding the I2C dep. Theoretically it is
> > > possible that someone uses the same I2C API in their microcontroller =
on
> > > another architecture. =20
> >=20
> > Theoretically. But we both now that probability of that is very low,
> > and that likely driver would need other updates, too... right?
>=20
> What would be the benefit to add ARM dependency? So that distro
> compilations don't ship the turris_omnia driver unnecesarily?

That, and so that people are not asked "do you want to enable omnia
LEDs?" when they update their kernel on i386.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzHK/8ACgkQMOfwapXb+vLgFQCbBT8/KsQWEWskwbs456w5uUE/
7BMAoKij4UeFSlpx8MvfCpQnAHNLssIi
=q6GE
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
