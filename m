Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3600336C17C
	for <lists+linux-leds@lfdr.de>; Tue, 27 Apr 2021 11:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235096AbhD0JNX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Apr 2021 05:13:23 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42614 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235132AbhD0JNS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Apr 2021 05:13:18 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 86A8B1C0B7A; Tue, 27 Apr 2021 11:12:32 +0200 (CEST)
Date:   Tue, 27 Apr 2021 11:12:32 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-leds <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: LEDS_BLINK_LGM should depend on X86
Message-ID: <20210427091231.GB9373@amd>
References: <20210316133946.2376963-1-geert+renesas@glider.be>
 <20210425205717.GD10996@amd>
 <CAMuHMdW_Mf49yLVt+BJjNNLi+H5C-qaaWFfjQNBr5iuSo25xZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW_Mf49yLVt+BJjNNLi+H5C-qaaWFfjQNBr5iuSo25xZQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-04-26 09:06:16, Geert Uytterhoeven wrote:
> Hi Pavel,
>=20
> On Sun, Apr 25, 2021 at 10:57 PM Pavel Machek <pavel@ucw.cz> wrote:
> > > The Intel Lightning Mountain (LGM) Serial Shift Output controller (SS=
O)
> > > is only present on Intel Lightning Mountain SoCs.  Hence add a
> > > dependency on X86, to prevent asking the user about this driver when
> > > configuring a kernel without Intel Lightning Mountain platform suppor=
t.
> > >
> > > While at it, merge the other dependencies into a single statement.
> > >
> > > Fixes: c3987cd2bca34ddf ("leds: lgm: Add LED controller driver for LG=
M SoC")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > This rejected, so I applied it by hand.
>=20
> Thank you!
>=20
> > I'm deleting the Fixes tag --
> > we don't want this in stable.
>=20
> Why not? Shouldn't people running stable be shielded from useless
> questions while configuring their kernels?

See stable-kernel-rules. (Maybe updating them to match recent reality
would be better, but...)

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCH1X8ACgkQMOfwapXb+vL/EwCdGJ13SHiiyDVBJAdg6FF+n7yj
/aQAniVRFc2gDtXd9QhWR2KP5g4lyGlP
=j18m
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
