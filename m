Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B39919F1B8
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2020 10:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgDFIkG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Apr 2020 04:40:06 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52522 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgDFIkG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Apr 2020 04:40:06 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0F7891C4505; Mon,  6 Apr 2020 10:40:05 +0200 (CEST)
Date:   Mon, 6 Apr 2020 10:40:04 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia LEDs
Message-ID: <20200406084004.GB31120@duo.ucw.cz>
References: <20200319181604.2425-1-marek.behun@nic.cz>
 <20200321225342.7651547b@nic.cz>
 <20200321221653.GA13329@amd>
 <20200321233638.587d94cc@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline
In-Reply-To: <20200321233638.587d94cc@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2020-03-21 23:36:38, Marek Behun wrote:
> On Sat, 21 Mar 2020 23:16:53 +0100
> Pavel Machek <pavel@ucw.cz> wrote:
>=20
> > Hi!
> >=20
> > > The microcontroller on Turris Omnia supports more settings than just
> > > LEDs (usb3 port power and input button for example).
> > >=20
> > > I am wondering if this approach (registering LED driver to
> > > communicate with the microcontroller) is correct, since the
> > > microcontroller can do other things.
> > >=20
> > > For Turris Mox firmware I created a driver in
> > > drivers/firmware/turris-mox-rwtm.c. =20
> >=20
> > this should be drivers/platform/turris/, I believe. It is not
> > _firmware_, is it?
>=20
> It is code that interacts with the firmware. It already is merged in
> drivers/firmware/. The raspberrypi firmware interacting drivers is
> also

Everything has firmware these days, so everything is interacting with
firmware. We have drivers/platform, not drivers/firmware/sata.

drivers/firmware is for firmware that runs on _main_ CPU.

drivers/platform is for talking with embedded controllers (that may
have their own firmware).

But I suggest you put it all into drivers/leds for now, and then maybe
move it, because otherwise it will be nightmare for maintainers.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXorq5AAKCRAw5/Bqldv6
8kO1AJ9vaVCkeEePazUYdxA36WYGt9EQ4QCfSmjhusuGG+8ojHjjc/VHR8OmmUI=
=pElr
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
