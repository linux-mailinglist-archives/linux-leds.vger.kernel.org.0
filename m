Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB24179399
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2019 21:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbfG2TNm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Jul 2019 15:13:42 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:38558 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728447AbfG2TNm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jul 2019 15:13:42 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id C3BAE802BB; Mon, 29 Jul 2019 21:13:26 +0200 (CEST)
Date:   Mon, 29 Jul 2019 21:13:38 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Dan Murphy <dmurphy@ti.com>, Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH 1/3] block: umem: rename LED_* macros to LEDCTRL_*
Message-ID: <20190729191338.GA2023@amd>
References: <1564322446-28255-1-git-send-email-akinobu.mita@gmail.com>
 <1564322446-28255-2-git-send-email-akinobu.mita@gmail.com>
 <85aa571d-69c4-a35c-8b9a-770cc3662baa@gmail.com>
 <CAC5umyggeHZJrW7BR7o+GgnQiW5zaSP+cqMeW_CgWwqLVOjNZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <CAC5umyggeHZJrW7BR7o+GgnQiW5zaSP+cqMeW_CgWwqLVOjNZQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-07-30 00:21:14, Akinobu Mita wrote:
> 2019=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=9C=88) 2:30 Jacek Anaszewski <jace=
k.anaszewski@gmail.com>:
> >
> > Hi Akinobu,
> >
> > On 7/28/19 4:00 PM, Akinobu Mita wrote:
> > > The umem driver defines LED_* macros for MEMCTRLCMD_LEDCTRL register
> > > values.  The LED_OFF and LED_ON macros conflict with the LED subsyste=
m's
> > > LED_OFF and LED_ON enums.
> > >
> > > This renames these LED_* macros to LEDCTRL_* in umem driver.
> > [...]
> > >
> > > diff --git a/drivers/block/umem.h b/drivers/block/umem.h
> > > index 5838497..8563fdc 100644
> > > --- a/drivers/block/umem.h
> > > +++ b/drivers/block/umem.h
> > > @@ -32,16 +32,16 @@
> > >  #define  MEM_2_GB            0xe0
> > >
> > >  #define MEMCTRLCMD_LEDCTRL   0x08
> > > -#define  LED_REMOVE          2
> > > -#define  LED_FAULT           4
> > > -#define  LED_POWER           6
> > > -#define       LED_FLIP               255
> > > -#define  LED_OFF             0x00
> > > -#define  LED_ON                      0x01
> > > -#define  LED_FLASH_3_5               0x02
> > > -#define  LED_FLASH_7_0               0x03
> > > -#define  LED_POWER_ON                0x00
> > > -#define  LED_POWER_OFF               0x01
> > > +#define  LEDCTRL_REMOVE              2
> >
> > This way the namespacing prefix still begins with "LED",
> > which can lead to further conflicts in the future.
>=20
> How about renaming 'LED_ON' to 'MEMCTRLCMD_LEDCTRL_ON', and 'LED_OFF' to
> 'MEMCTRLCMD_LEDCTRL_OFF' ?

I'd say that "MEMCTRL_LED_ON" woudl e enough, but... :-).
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0/RWIACgkQMOfwapXb+vI8BwCfeCZBkC8xCnzAvgNO+MdV86rs
ks0AoKtQ6zgIm4GmjVkJZnT5LYbCQ5Zk
=HiPQ
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
