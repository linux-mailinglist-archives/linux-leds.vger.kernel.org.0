Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD2D28DAE2
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 10:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbgJNINI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 04:13:08 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55564 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbgJNINI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Oct 2020 04:13:08 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C8CE41C0B87; Wed, 14 Oct 2020 10:13:05 +0200 (CEST)
Date:   Wed, 14 Oct 2020 10:13:05 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Udo van den Heuvel <udovdh@xs4all.nl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>
Subject: Re: disabling CONFIG_LED_CLASS (SND_HDA_CODEC_REALTEK)
Message-ID: <20201014081305.GD29881@amd>
References: <3c6d174c-30db-3d03-3d16-42df405f38d9@xs4all.nl>
 <58e774c5-fc80-2060-2091-9a6398582cc5@infradead.org>
 <9fc679e9-e9a9-ad80-b24c-f04489b98aa7@xs4all.nl>
 <27e159be-4376-e87b-5e60-803bc3749ec2@infradead.org>
 <eadc23e7-b383-e2fc-6e20-ed22745d0bfc@xs4all.nl>
 <2739e1fd-75c6-4e43-cd79-9028479f91bf@infradead.org>
 <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
 <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
 <20201014075458.GA29881@amd>
 <s5h4kmxmdqc.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Km1U/tdNT/EmXiR1"
Content-Disposition: inline
In-Reply-To: <s5h4kmxmdqc.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Km1U/tdNT/EmXiR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-10-14 10:08:27, Takashi Iwai wrote:
> On Wed, 14 Oct 2020 09:54:59 +0200,
> Pavel Machek wrote:
> >=20
> > Hi!
> >=20
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
> > > > Please make this selectable instead of forcing more bulk into my
> > >> kernel.
> >=20
> > LED core is not that big, and this avoided some rather "interesting"
> > hacks IIRC. If Udo wants more config complexity, lets first make him
> > measure the benefits, second submit a patch.
> >=20
> > But I'd suggest to just live with it.
> >=20
> > And yes, we should probably get rid of "CONFIG_NEW_LEDS" symbol. That
> > one is actually useless.
>=20
> IIRC, this was needed for the reverse selection of CONFIG_LEDS_CLASS
> and co.  But if it's really useless, I'll happily delete it.

It is needed for now. It is just something we should remove in
future. CONFIG options are not that cheap...

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Km1U/tdNT/EmXiR1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+GsxEACgkQMOfwapXb+vKj2wCgl8EFtbg190UseqaqnZEYuRJF
nsYAniWZl08TwB5hCRT99EU4nRv0+Zd+
=Vqx7
-----END PGP SIGNATURE-----

--Km1U/tdNT/EmXiR1--
