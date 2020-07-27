Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3192922E9E3
	for <lists+linux-leds@lfdr.de>; Mon, 27 Jul 2020 12:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbgG0KVB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Jul 2020 06:21:01 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42094 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0KVB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Jul 2020 06:21:01 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 004E01C0BD4; Mon, 27 Jul 2020 12:20:58 +0200 (CEST)
Date:   Mon, 27 Jul 2020 12:20:58 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: Re: We have multicolor, but should we turn it into RGB?
Message-ID: <20200727102058.GA16553@amd>
References: <20200727084500.GA15237@amd>
 <20200727114048.32f36c59@dellmb.labs.office.nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <20200727114048.32f36c59@dellmb.labs.office.nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Multicolor is a bit too abstract. Yes, we can have
> > Green-Magenta-Ultraviolet LED, but so far all the LEDs we support are
> > RGB, and not even RGB-White or RGB-Yellow variants emerged.
> >=20
> > Multicolor is not a good fit for RGB LED. It does not really know
> > about LED color.  In particular, there's no way to make LED "white".
> >=20
> > Userspace is interested in knowing "this LED can produce arbitrary
> > color", which not all multicolor LEDs can.
> >=20
> > 	Proposal: let's add "rgb" to led_colors in
> > 	drivers/leds/led-core.c, add corresponding device tree
> > 	defines, and use that, instead of multicolor for RGB LEDs.
> >=20
> > 	We really need to do that now; "white" stuff can wait.
> >=20
> > RGB LEDs are quite common, and it would be good to be able to turn LED
> > white and to turn it into any arbitrary color. It is essential that
> > userspace is able to set arbitrary colors, and it might be good to
> > have that ability from kernel, too... to allow full-color triggers.
>=20
> I am not against adding RGB if you want to somehow teach the subsystem
> to mix arbitrary color (either by teaching it color curves or some
> other way). But I think we shouldn't remove multicolor, and here's the
> reason why:

I'd not remove multicolor. It would be still there for non-RGB
uses. (Sorry if I was unclear).

But I may want to disable it for now, not to have ABI incompatibility
in future.

> Most of the time I have seen 2 LEDs per ethernet port, green and yellow,
> but some ports have 2 Bi-Color LEDs, each consisting of green and
> yellow. I think most of the time these are 2-terminal LEDs.
>=20
> So basically here we have, instead of a RGB LED, a GY LED (GY for
> green/yellow).
=2E..
> So if we want to reasonably add support for this configuration of LEDs
> and to offer the user to configure these DUAL modes via the trigger
> API, I think these LEDs should be shown in the system as multicolor
> LEDs.

Yes, I guess multicolor may make sense there.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8eqooACgkQMOfwapXb+vI4pwCfVO9jWq2uQC6Wmxr95Wundjwz
gEMAoLXj55GKMdOasG/hTpPAlVoKOf+q
=X0xg
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
