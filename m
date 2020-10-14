Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D10528DABE
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 09:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbgJNH67 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 03:58:59 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53662 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728388AbgJNH66 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Oct 2020 03:58:58 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 77A311C0B87; Wed, 14 Oct 2020 09:58:54 +0200 (CEST)
Date:   Wed, 14 Oct 2020 09:58:53 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Udo van den Heuvel <udovdh@xs4all.nl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>
Subject: Re: disabling CONFIG_LED_CLASS (SND_HDA_CODEC_REALTEK)
Message-ID: <20201014075853.GB29881@amd>
References: <3c6d174c-30db-3d03-3d16-42df405f38d9@xs4all.nl>
 <58e774c5-fc80-2060-2091-9a6398582cc5@infradead.org>
 <9fc679e9-e9a9-ad80-b24c-f04489b98aa7@xs4all.nl>
 <27e159be-4376-e87b-5e60-803bc3749ec2@infradead.org>
 <eadc23e7-b383-e2fc-6e20-ed22745d0bfc@xs4all.nl>
 <2739e1fd-75c6-4e43-cd79-9028479f91bf@infradead.org>
 <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
 <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
 <s5hblh5mele.wl-tiwai@suse.de>
 <s5ha6wpmei5.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Content-Disposition: inline
In-Reply-To: <s5ha6wpmei5.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > >>> I.e.: it looks like I will lose some funcionality when I disable
> > > >>> SND_HDA_CODEC_REALTEK.
> > > >>
> > > >> OK. At present you can't have it both ways, i.e., SND_HDA_CODEC_RE=
ALTEK
> > > >> with no LEDS. That driver apparently wants LEDS.
> > > >=20
> > > > Thanks but why have I gone for years without LEDS?
> > > > I do not need LEDS, I do not want LEDS, I do not have LEDS (that are
> > > > visible, usable, etc).
> > > >=20
> > > > Please make this selectable instead of forcing more bulk into my ke=
rnel.
> > >=20
> > > Hi Takashi,
> > >=20
> > > Regarding
> > > commit 7cdf8c49b1df0a385db06c4f9a5ba1b16510fdcc
> > > Author: Takashi Iwai <tiwai@suse.de>
> > > Date:   Thu Jun 18 13:08:31 2020 +0200
> > >     ALSA: hda: generic: Add a helper for mic-mute LED with LED classd=
ev
> > >=20
> > > and this Kconfig entry:
> > >=20
> > > config SND_HDA_CODEC_REALTEK
> > > 	tristate "Build Realtek HD-audio codec support"
> > > 	select SND_HDA_GENERIC
> > > 	select SND_HDA_GENERIC_LEDS
> > >=20
> > > it seems that LED support is not always wanted (please see above).
> > > I.e., user(s) would like to build a kernel without LED support at all.
> > >=20
> > > Can you make it a build option?
> >=20
> > Something like this?
>=20
> This one is more suitable for the merge :)

That will still break the build if SND_HDA_CODEC_REALTEK=3Dy and
SND_HDA_GENERIC_LEDS=3Dm, no?

Lets keep things as they are.

Contrary to his claims, Udo very probably has LEDs in his systems...


							Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+Gr70ACgkQMOfwapXb+vIC4wCfT4KC6/tj5oHpUZovLlQWxfP/
ubgAnjVBdTXPjA/O6oNFfO6DvgYcSOsa
=pwWX
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
