Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB2A3066F8
	for <lists+linux-leds@lfdr.de>; Wed, 27 Jan 2021 23:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbhA0WES (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 27 Jan 2021 17:04:18 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:36304 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbhA0WCe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 27 Jan 2021 17:02:34 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 146801C0B8E; Wed, 27 Jan 2021 23:01:35 +0100 (CET)
Date:   Wed, 27 Jan 2021 23:01:34 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jens Axboe <axboe@kernel.dk>, Dan Murphy <dmurphy@ti.com>,
        linux-ide@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: 5.11 new lockdep warning related to led-class code (also may
 involve ata / piix controller)
Message-ID: <20210127220134.GC23419@amd>
References: <b204637d-3b72-8320-8a62-f075467d8681@redhat.com>
 <20210112223015.GB28214@duo.ucw.cz>
 <f344f1db-1a7a-0a80-1cb1-f9c3fbf83abd@redhat.com>
 <0ec34bca-f7e0-8954-c253-d07ed6b71b80@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Content-Disposition: inline
In-Reply-To: <0ec34bca-f7e0-8954-c253-d07ed6b71b80@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>> Booting a 5.11-rc2 kernel with lockdep enabled inside a virtualbox vm=
 (which still
> >>> emulates good old piix ATA controllers) I get the below lockdep splat=
 early on during boot:
> >>>
> >>> This seems to be led-class related but also seems to have a (P)ATA
> >>> part to it. To the best of my knowledge this is a new problem in
> >>> 5.11 .
> >>
> >> This is on my for-next branch:
> >>
> >> commit 9a5ad5c5b2d25508996f10ee6b428d5df91d9160 (HEAD -> for-next, ori=
gin/for-next)
> >>
> >>     leds: trigger: fix potential deadlock with libata
> >>    =20
> >>     We have the following potential deadlock condition:
> >>    =20
> >>      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>      WARNING: possible irq lock inversion dependency detected
> >>      5.10.0-rc2+ #25 Not tainted
> >>      --------------------------------------------------------
> >>      swapper/3/0 just changed the state of lock:
> >>      ffff8880063bd618 (&host->lock){-...}-{2:2}, at: ata_bmdma_interru=
pt+0x27/0x200
> >>      but this lock took another, HARDIRQ-READ-unsafe lock in the past:
> >>       (&trig->leddev_list_lock){.+.?}-{2:2}
> >>
> >> If I'm not mistaken, that should fix your issue.
> >=20
> > I can confirm that this fixes things, thanks.
> >=20
> > I assume that this will be part of some future 5.11 fixes pull-req?
>=20
> This *regression* fix seems to still have not landed in 5.11-rc5, can
> we please get this on its way to Linus ?

Is it a regression? AFAIK it is a bug that has been there
forever... My original plan was to simply wait for 5.12, so it gets
full release of testing...

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmAR4r4ACgkQMOfwapXb+vLEXwCfU7pzN5sd4BvJkfx9HKxXllqu
StEAn108AVDOFbau5fHaq6ldYOH9imcd
=YcTn
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--
