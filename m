Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF46B122F9
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2019 22:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbfEBUGI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 May 2019 16:06:08 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:60748 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbfEBUGI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 May 2019 16:06:08 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 7AA38802FF; Thu,  2 May 2019 22:05:56 +0200 (CEST)
Date:   Thu, 2 May 2019 22:06:06 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, ibm-acpi@hmh.eng.br,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] leds: avoid races with workqueue
Message-ID: <20190502200606.GC4845@amd>
References: <20190427193411.GA9709@amd>
 <2578a614-beb9-1c9d-9f74-208a8a7ab64f@gmail.com>
 <20190427223207.GA3585@amd>
 <d2373c8b-5c66-c875-16c7-0c5a93470793@gmail.com>
 <20190429152259.GB10501@amd>
 <36e1fdd7-a220-4b0d-d558-829f522b0841@gmail.com>
 <20190501183600.GA20452@amd>
 <9337b5fb-0ff8-9925-29e6-a781884af861@gmail.com>
 <20190502191321.GB4845@amd>
 <62a99fe8-5c61-c681-3f9d-54e0a27a63d2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline
In-Reply-To: <62a99fe8-5c61-c681-3f9d-54e0a27a63d2@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-05-02 21:28:06, Jacek Anaszewski wrote:
> On 5/2/19 9:13 PM, Pavel Machek wrote:
> >Hi!
> >
> >>>>>+++ b/drivers/leds/led-class.c
> >>>>>@@ -57,6 +57,7 @@ static ssize_t brightness_store(struct device *dev,
> >>>>>  	if (state =3D=3D LED_OFF)
> >>>>>  		led_trigger_remove(led_cdev);
> >>>>>  	led_set_brightness(led_cdev, state);
> >>>>>+	flush_work(&led_cdev->set_brightness_work);
> >>>>
> >>>>Is this really required here? It creates non-uniform brightness
> >>>>setting behavior depending on whether it is set from sysfs or
> >>>>by in-kernel call to led_set_brightness().
> >>>
> >>>This fixes the echo 0 > brightness; echo 1 > brightness. It has to be
> >>>at a place where we can sleep.
> >>>
> >>>If you have better idea, it is welcome, but it would be good to fix
> >>>the bug.
> >>
> >>Currently not, so I applied the patch in this shape.
> >
> >Thanks!
> >
> >This is actually something that makes sense for stable.. perhaps the
> >bots can pick it up.
>=20
> I was thinking of it, but finally decided to submit this patch
> to linux-stable when it will prove not having side effects.
>=20
> But if you think it is ready for stable then I can add
> relevant "Fixes" tag. Do you think that below will be an appropriate
> base to refer to?
>=20
> Fixes 1afcadfcd184 ("leds: core: Use set_brightness_work for the blocking
> op")

Yes, that looks right. If you can add fixes: and cc: stable tags, the
rest should happen automagically.

Thanks!
									Pavel



--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzLTa4ACgkQMOfwapXb+vLwhQCgi3JeQuNX0skWytw+vdvS2HyA
mtwAnR4DCTMLMBJ+uEuZyH2iBTfLXTPJ
=3aC0
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
