Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46AB418E514
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 23:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgCUWQz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 18:16:55 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35588 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727258AbgCUWQz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Mar 2020 18:16:55 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A53231C031D; Sat, 21 Mar 2020 23:16:53 +0100 (CET)
Date:   Sat, 21 Mar 2020 23:16:53 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia LEDs
Message-ID: <20200321221653.GA13329@amd>
References: <20200319181604.2425-1-marek.behun@nic.cz>
 <20200321225342.7651547b@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <20200321225342.7651547b@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The microcontroller on Turris Omnia supports more settings than just
> LEDs (usb3 port power and input button for example).
>=20
> I am wondering if this approach (registering LED driver to
> communicate with the microcontroller) is correct, since the
> microcontroller can do other things.
>=20
> For Turris Mox firmware I created a driver in
> drivers/firmware/turris-mox-rwtm.c.

this should be drivers/platform/turris/, I believe. It is not
_firmware_, is it?

> Maybe I should create I driver in drivers/firmware/ for the Omnia
> microcontroller, and then the LED driver could use functions exported
> by the microcontroller driver to manipulate LEDs.
>=20
> What do you think?

So... you can do that, but you'll have multiple maintainers
coordinating updates at that point. Feel free to split LED support
into two files so that it can be moved to different directory later...

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl52klQACgkQMOfwapXb+vL9dwCfX0c2dCkfhxitY0eRK4U21ImO
yGMAn15U835NBbOtNi6Ox0JmanpR1MZA
=PAEX
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
