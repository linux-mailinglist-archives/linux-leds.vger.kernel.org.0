Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2897733117A
	for <lists+linux-leds@lfdr.de>; Mon,  8 Mar 2021 15:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbhCHO5P (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Mar 2021 09:57:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231423AbhCHO5C (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Mar 2021 09:57:02 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31255C06174A
        for <linux-leds@vger.kernel.org>; Mon,  8 Mar 2021 06:57:02 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1lJHJZ-000549-3n; Mon, 08 Mar 2021 15:56:57 +0100
Received: from pengutronix.de (unknown [IPv6:2a03:f580:87bc:d400:743f:a98a:1069:4286])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id 3E2A55F0CBC;
        Mon,  8 Mar 2021 14:56:54 +0000 (UTC)
Date:   Mon, 8 Mar 2021 15:56:53 +0100
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Andrea Righi <andrea.righi@canonical.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, schuchmann@schleissheimer.de
Subject: Re: [PATCH] leds: trigger: fix potential deadlock with libata
Message-ID: <20210308145653.mechsganlrvpzyym@pengutronix.de>
References: <20201102104152.GG9930@xps-13-7390>
 <20210306203954.ya5oqgkdalcw45c4@pengutronix.de>
 <YEQ0ONQCwVUd0wmc@boqun-archlinux>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gp7ccw4en57i62vl"
Content-Disposition: inline
In-Reply-To: <YEQ0ONQCwVUd0wmc@boqun-archlinux>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--gp7ccw4en57i62vl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07.03.2021 10:02:32, Boqun Feng wrote:
> On Sat, Mar 06, 2021 at 09:39:54PM +0100, Marc Kleine-Budde wrote:
> > Hello *,
> >=20
> > On 02.11.2020 11:41:52, Andrea Righi wrote:
> > > We have the following potential deadlock condition:
> > >=20
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >  WARNING: possible irq lock inversion dependency detected
> > >  5.10.0-rc2+ #25 Not tainted
> > >  --------------------------------------------------------
> > >  swapper/3/0 just changed the state of lock:
> > >  ffff8880063bd618 (&host->lock){-...}-{2:2}, at: ata_bmdma_interrupt+=
0x27/0x200
> > >  but this lock took another, HARDIRQ-READ-unsafe lock in the past:
> > >   (&trig->leddev_list_lock){.+.?}-{2:2}
> > >=20
> > >  and interrupts could create inverse lock ordering between them.
> >=20
> > [...]
> >=20
> > > ---
> > >  drivers/leds/led-triggers.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> > > index 91da90cfb11d..16d1a93a10a8 100644
> > > --- a/drivers/leds/led-triggers.c
> > > +++ b/drivers/leds/led-triggers.c
> > > @@ -378,14 +378,15 @@ void led_trigger_event(struct led_trigger *trig,
> > >  			enum led_brightness brightness)
> > >  {
> > >  	struct led_classdev *led_cdev;
> > > +	unsigned long flags;
> > > =20
> > >  	if (!trig)
> > >  		return;
> > > =20
> > > -	read_lock(&trig->leddev_list_lock);
> > > +	read_lock_irqsave(&trig->leddev_list_lock, flags);
> > >  	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list)
> > >  		led_set_brightness(led_cdev, brightness);
> > > -	read_unlock(&trig->leddev_list_lock);
> > > +	read_unlock_irqrestore(&trig->leddev_list_lock, flags);
> > >  }
> > >  EXPORT_SYMBOL_GPL(led_trigger_event);
> >=20
> > meanwhile this patch hit v5.10.x stable and caused a performance
> > degradation on our use case:
> >=20
> > It's an embedded ARM system, 4x Cortex A53, with an SPI attached CAN
> > controller. CAN stands for Controller Area Network and here used to
> > connect to some automotive equipment. Over CAN an ISOTP (a CAN-specific
> > Transport Protocol) transfer is running. With this patch, we see CAN
> > frames delayed for ~6ms, the usual gap between CAN frames is 240=C2=B5s.
> >=20
> > Reverting this patch, restores the old performance.
> >=20
> > What is the best way to solve this dilemma? Identify the critical path
> > in our use case? Is there a way we can get around the irqsave in
> > led_trigger_event()?
> >=20
>=20
> Probably, we can change from rwlock to rcu here, POC code as follow,
> only compile tested. Marc, could you see whether this help the
> performance on your platform? Please note that I haven't test it in a
> running kernel and I'm not that familir with led subsystem, so use it
> with caution ;-)
>=20
> (While at it, I think maybe we miss the leddev_list_lock in net/mac80211
> in the patch)

I can confirm, this patch basically restores the old performance.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--gp7ccw4en57i62vl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmBGOzIACgkQqclaivrt
76nW3Qf/eyK3mOUT5t9BpkibwM2Ud0Kra3YZ+jvIg3UtRx4w2CmcSXpG2n77/EZv
S7hHXDnAoqDdPtTRFl+WW6idddlzTA/psg1ODQgyug6UzlEUR0za2vWePVsCLv47
vyIkJ5pe6SY/Ddi3/1eJgrZhjNNQa6fkOjKztGIYdzCY6gCMgZvUfb31qi2YOXZ5
FNl9gLy4TvygC2NCV28YbUsRwPNDHA3Qw8E9IJJFoLAfqQG/YFWhM1uONk98hMqO
kgqdMJIBGYLVcrCnnlMTECAE/DasLl9mIT8PbeiE6S+EMwymd+RDjXTg1ZBurKj1
KlCuP3BhmQBLtsiqpVIOiQxSBPcZfg==
=kDN4
-----END PGP SIGNATURE-----

--gp7ccw4en57i62vl--
