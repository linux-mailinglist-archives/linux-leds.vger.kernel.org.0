Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20B1428DBBC
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 10:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgJNIiB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 04:38:01 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58222 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgJNIiB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Oct 2020 04:38:01 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 75E1B1C0B87; Wed, 14 Oct 2020 10:37:59 +0200 (CEST)
Date:   Wed, 14 Oct 2020 10:37:58 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Udo van den Heuvel <udovdh@xs4all.nl>
Cc:     Takashi Iwai <tiwai@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>
Subject: Re: disabling CONFIG_LED_CLASS (SND_HDA_CODEC_REALTEK)
Message-ID: <20201014083758.GB31728@amd>
References: <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
 <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
 <s5hblh5mele.wl-tiwai@suse.de>
 <s5ha6wpmei5.wl-tiwai@suse.de>
 <20201014075853.GB29881@amd>
 <056a8933-378f-30f2-c7af-5514d93d3c36@xs4all.nl>
 <20201014081116.GC29881@amd>
 <2be6e184-97d4-a2b1-a500-6ea3528cff37@xs4all.nl>
 <20201014082752.GA31728@amd>
 <9cf705b9-1fca-2445-43de-916b13b9103f@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline
In-Reply-To: <9cf705b9-1fca-2445-43de-916b13b9103f@xs4all.nl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-10-14 10:34:21, Udo van den Heuvel wrote:
> On 14-10-2020 10:27, Pavel Machek wrote:
> >> One should have thought about stuff beforehand.
> >=20
> > We did. And decided this is best solution.
>=20
> Then the thought process went awry.
>=20
> >> The non-selectability is not my fault.
> >=20
> > It also does not affect you in any way.
>=20
> It does.
> /boot fills up even sooner thanks to this unused code.
> Compiles last longer because of this unused code.

Have you measured how much slower and how much bigger it is? Do you
understand that you propose to make source code bigger and slower to
compile for everyone else?

You are filling my inbox.

> > Feel free to go to the mic LED discussion to see why we did it like
> > this. Then you can come up with better solution for problem at hand.
>=20
> I did not think of forcing code onto somebody. Someone else did.
> This is effectively the effect of the LEDs thing.

Without understanding what was decided and why, this discussion is not
useful.


									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+GuOYACgkQMOfwapXb+vJMOACeINaNJ284URcw5rkEnAaaBLD3
AUkAoK9ipT87VRbgXSFTZYc9dMa1g4go
=0WBC
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
