Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0ADC28DAB4
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 09:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgJNHzC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 03:55:02 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53108 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgJNHzC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Oct 2020 03:55:02 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B40CA1C0B87; Wed, 14 Oct 2020 09:54:59 +0200 (CEST)
Date:   Wed, 14 Oct 2020 09:54:59 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Udo van den Heuvel <udovdh@xs4all.nl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Takashi Iwai <tiwai@suse.de>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>
Subject: Re: disabling CONFIG_LED_CLASS (SND_HDA_CODEC_REALTEK)
Message-ID: <20201014075458.GA29881@amd>
References: <43b79598-1592-683f-46df-9e5489110780@infradead.org>
 <6fd1e91e-19d0-6682-dfc6-49f1cd60408b@infradead.org>
 <3c6d174c-30db-3d03-3d16-42df405f38d9@xs4all.nl>
 <58e774c5-fc80-2060-2091-9a6398582cc5@infradead.org>
 <9fc679e9-e9a9-ad80-b24c-f04489b98aa7@xs4all.nl>
 <27e159be-4376-e87b-5e60-803bc3749ec2@infradead.org>
 <eadc23e7-b383-e2fc-6e20-ed22745d0bfc@xs4all.nl>
 <2739e1fd-75c6-4e43-cd79-9028479f91bf@infradead.org>
 <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
 <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>> I.e.: it looks like I will lose some funcionality when I disable
> >>> SND_HDA_CODEC_REALTEK.
> >>
> >> OK. At present you can't have it both ways, i.e., SND_HDA_CODEC_REALTEK
> >> with no LEDS. That driver apparently wants LEDS.
> >=20
> > Thanks but why have I gone for years without LEDS?
> > I do not need LEDS, I do not want LEDS, I do not have LEDS (that are
> > visible, usable, etc).
> >=20
> > Please make this selectable instead of forcing more bulk into my
>> kernel.

LED core is not that big, and this avoided some rather "interesting"
hacks IIRC. If Udo wants more config complexity, lets first make him
measure the benefits, second submit a patch.

But I'd suggest to just live with it.

And yes, we should probably get rid of "CONFIG_NEW_LEDS" symbol. That
one is actually useless.

Best regards,
								Pavel
							=09
> and this Kconfig entry:
>=20
> config SND_HDA_CODEC_REALTEK
> 	tristate "Build Realtek HD-audio codec support"
> 	select SND_HDA_GENERIC
> 	select SND_HDA_GENERIC_LEDS
>=20
> it seems that LED support is not always wanted (please see above).
> I.e., user(s) would like to build a kernel without LED support at all.
>=20
> Can you make it a build option?
>=20
> thanks.

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+GrtIACgkQMOfwapXb+vIBRACfToWfcNk9AdXdXG4zZ7i28/s3
4/wAn0pgJoPXjHt0MDaxgLcMMwqmrHhJ
=JHTM
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
