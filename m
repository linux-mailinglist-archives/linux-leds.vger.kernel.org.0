Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C04A10CB9
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 20:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfEASgE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 May 2019 14:36:04 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:35257 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbfEASgE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 May 2019 14:36:04 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 757618058D; Wed,  1 May 2019 20:35:52 +0200 (CEST)
Date:   Wed, 1 May 2019 20:36:00 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, ibm-acpi@hmh.eng.br,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] leds: avoid races with workqueue
Message-ID: <20190501183600.GA20452@amd>
References: <20190426123513.GA18172@amd>
 <20190426214246.GA24966@amd>
 <84fac57d-1121-a1da-fb45-16a2521bdef9@gmail.com>
 <20190427193411.GA9709@amd>
 <2578a614-beb9-1c9d-9f74-208a8a7ab64f@gmail.com>
 <20190427223207.GA3585@amd>
 <d2373c8b-5c66-c875-16c7-0c5a93470793@gmail.com>
 <20190429152259.GB10501@amd>
 <36e1fdd7-a220-4b0d-d558-829f522b0841@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <36e1fdd7-a220-4b0d-d558-829f522b0841@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >There are races between "main" thread and workqueue. They manifest
> >themselves on Thinkpad X60:
> >This should result in LED blinking, but it turns it off instead:
> >     root@amd:/data/pavel# cd /sys/class/leds/tpacpi\:\:power
> >     root@amd:/sys/class/leds/tpacpi::power# echo timer > trigger
> >     root@amd:/sys/class/leds/tpacpi::power# echo timer > trigger
> >     root@amd:/sys/class/leds/tpacpi::power#
> >It should be possible to transition from blinking to solid on by echo
> >0 > brightness; echo 1 > brightness... but that does not work, either,
> >if done too quickly.
> >Synchronization of the workqueue fixes both.
> >Signed-off-by: Pavel Machek <pavel@ucw.cz>
> >
> >diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> >index 68aa923..dcb59c8 100644
> >--- a/drivers/leds/led-class.c
> >+++ b/drivers/leds/led-class.c
> >@@ -57,6 +57,7 @@ static ssize_t brightness_store(struct device *dev,
> >  	if (state =3D=3D LED_OFF)
> >  		led_trigger_remove(led_cdev);
> >  	led_set_brightness(led_cdev, state);
> >+	flush_work(&led_cdev->set_brightness_work);
>=20
> Is this really required here? It creates non-uniform brightness
> setting behavior depending on whether it is set from sysfs or
> by in-kernel call to led_set_brightness().

This fixes the echo 0 > brightness; echo 1 > brightness. It has to be
at a place where we can sleep.

If you have better idea, it is welcome, but it would be good to fix
the bug.

Best regards,
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzJ5xAACgkQMOfwapXb+vI/BACeNY7i8g4zzNbNSD+qMBKyQ70o
B34AoMDqGa9BH+n7wyRQltKiOYrajtpV
=CJ0T
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
