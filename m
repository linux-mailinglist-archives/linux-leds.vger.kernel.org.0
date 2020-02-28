Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C461D17341A
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2020 10:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgB1JeJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Feb 2020 04:34:09 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33162 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbgB1JeJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Feb 2020 04:34:09 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2D2D71C030F; Fri, 28 Feb 2020 10:34:07 +0100 (CET)
Date:   Fri, 28 Feb 2020 10:34:06 +0100
From:   Pavel Machek <pavel@denx.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@denx.de>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v17 00/17] Multi Color LED Framework
Message-ID: <20200228093406.GA27860@amd>
References: <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com>
 <20200225101940.GB16252@amd>
 <be76fdac-9d32-b9b2-c01d-3aa315b14463@gmail.com>
 <20200226125903.GA2800@duo.ucw.cz>
 <20f6bdd5-e899-aead-8c35-1c3a3d09145f@gmail.com>
 <20200227105808.GA27003@duo.ucw.cz>
 <20200227124329.GA994747@kroah.com>
 <4c273c06-5024-b2d4-c656-b165015090be@ti.com>
 <96a31ff6-5ecf-05a7-d61f-2804f2488d1b@gmail.com>
 <20200228074235.GA2900429@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <20200228074235.GA2900429@kroah.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > >> Writing 3 or 4 or 5 numbers all at once in a single sysfs file to
> > >> represent a single output should be fine.
> > >> thanks,
> >=20
> > Thank you for making this clear.
> >=20
> > Effectively, the way to go as I see it now is just moving from
> > colors directory to channel_intensity and channel_names files.
>=20
> Wait, we already have an interface for this and you want to create a
> competing one?  Why?  What's wrong with what you have now?
>=20
> Do you have a pointer to the Documentation/ABI/ entries that you have
> now that you feel do not work well?

No, we don't have ABI for RGB LEDs, but there's well-known proposal on
the list Jacek is talking about.

We currently handle RGB LED as three separate LEDs, and that does not
work well.

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5Y3o4ACgkQMOfwapXb+vL3SQCaAk4FvW7GSMgA32H3yaDO/wVI
AFkAoJeZYvpKBuu2AiwDifDBhEuxySbo
=VpMO
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
