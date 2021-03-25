Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA2A348D96
	for <lists+linux-leds@lfdr.de>; Thu, 25 Mar 2021 11:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhCYKBc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Mar 2021 06:01:32 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48988 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhCYKBZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Mar 2021 06:01:25 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 04D6D1C0B92; Thu, 25 Mar 2021 11:01:23 +0100 (CET)
Date:   Thu, 25 Mar 2021 11:01:22 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     ChiYuan Huang <u0084500@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        cy_huang <cy_huang@richtek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] leds: rt4505: Add support for Richtek RT4505
 flash LED controller
Message-ID: <20210325100122.GA4619@amd>
References: <1604284946-16254-1-git-send-email-u0084500@gmail.com>
 <3cf3ee50-3dd8-d3b1-66a9-cea2ba487de3@gmail.com>
 <CADiBU3-pDdoCioKc1mZwx7tp+_kfcN=4j-iMOT9LupXW03qwNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <CADiBU3-pDdoCioKc1mZwx7tp+_kfcN=4j-iMOT9LupXW03qwNA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > >   create mode 100644 drivers/leds/flash/Kconfig
> > >   create mode 100644 drivers/leds/flash/Makefile
> > >   create mode 100644 drivers/leds/flash/leds-rt4505.c
> >
> > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> >
> Any problem with this patch? Do I need to submit it again?

It won't apply on current next.

So please: Merge ACKs, reorder it so that docs goes first, port it to

To gitolite.kernel.org:pub/scm/linux/kernel/git/pavel/linux-leds.git
   34731ed13e8a..85674b0e40d9  for-next -> for-next

and resubmit.

Thanks you,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmBcX3EACgkQMOfwapXb+vIObwCffd6b9g3jXk6f/cdlPb+rlSfH
MdAAoJdDJxSs2dbMDTPjQt1CSHnf3xe5
=yFKW
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
