Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C17F31ECA1
	for <lists+linux-leds@lfdr.de>; Thu, 18 Feb 2021 18:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233784AbhBRQ4g (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Feb 2021 11:56:36 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:60952 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhBRNfU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Feb 2021 08:35:20 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5FC981C0B81; Thu, 18 Feb 2021 14:33:52 +0100 (CET)
Date:   Thu, 18 Feb 2021 14:33:52 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
        kernel@pengutronix.de, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v11] leds: trigger: implement a tty trigger
Message-ID: <20210218133352.GA13628@duo.ucw.cz>
References: <20201218104246.591315-1-u.kleine-koenig@pengutronix.de>
 <20201218104246.591315-4-u.kleine-koenig@pengutronix.de>
 <X/8cwD51DYhzRdDO@kroah.com>
 <20210113173018.bq2fkea2o3yp6rf6@pengutronix.de>
 <X/89NHn4oJFC7GjM@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <X/89NHn4oJFC7GjM@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > so that I can queue it up?
> >=20
> > Oh, so you are LED maintainer now? My congratulations.
> > (Honestly, do you plan to apply this without their ack? Not that I'm
> > against you doing that, I'm happy if I can archive this patch series as
> > done, but I'm a bit surprised.)
>=20
> It's drug on for so long now, the infrastructure that this driver needs
> has now bee merged, so I see no reason why this driver can't be taken
> now.  I offered up a "any objections?" in the past, and have gotten
> none, so I will take that for quiet acceptance :)

Thanks for taking the infrastructure patches, but please drop this
one. Its buggy, as were previous versions. I'll handle it.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC5swAAKCRAw5/Bqldv6
8juFAJ0TZjd2+5522dD5lZlorAgkEx16owCeOsTGUx1TGwtU3nRGluFtJQNJ0sI=
=vxnK
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
