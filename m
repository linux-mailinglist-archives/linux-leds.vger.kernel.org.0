Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B946E27A416
	for <lists+linux-leds@lfdr.de>; Sun, 27 Sep 2020 22:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgI0UdN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Sep 2020 16:33:13 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:36910 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbgI0UdM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Sep 2020 16:33:12 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AB2F71C0B76; Sun, 27 Sep 2020 22:33:10 +0200 (CEST)
Date:   Sun, 27 Sep 2020 22:33:09 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com
Subject: Re: [PATCH] leds: Add documentation about possible subsystem
 improvements
Message-ID: <20200927203308.GA25916@amd>
References: <20200925093318.GB20659@amd>
 <20200925164632.22bcd5af@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline
In-Reply-To: <20200925164632.22bcd5af@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-09-25 16:46:32, Marek Behun wrote:
> On Fri, 25 Sep 2020 11:33:18 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
>=20
> > +* Command line utility to manipulate the LEDs?
> > +
> > +/sys interface is not really suitable to use by hand, should we have
> > +an utility to perform LED control?
>=20
> I will try to implement ledtool.

Actually.. I started something. How do you like Rust?

https://gitlab.com/tui/tui/-/blob/master/led/src/main.rs

In future, I'd like utility to accept both old and new names while we
clean them up.

It would be also nice to have useful listing mode -- name, type,
current brightness/trigger...

In future, it would be good to be able to set rgb led to particular
color.

And probably user-friendly interface to access LEDs for particular
ethernet interface would be nice.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9w9wQACgkQMOfwapXb+vLz6ACgs3rZ9vECYNMsY1ITsjuDGUUj
HGEAnAmGuYF3zjAI5/3ltKIMeKsgMZk7
=1KHo
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
