Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE1A027170E
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 20:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgITSeE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 14:34:04 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:56768 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgITSeE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 14:34:04 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CA3891C0B8A; Sun, 20 Sep 2020 20:34:01 +0200 (CEST)
Date:   Sun, 20 Sep 2020 20:34:01 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: ledtrig-cpu: Limit to 4 CPUs
Message-ID: <20200920183401.GA21494@duo.ucw.cz>
References: <20200919093833.GA14326@duo.ucw.cz>
 <27e19ac9-4bc0-2945-3985-6cd6bb5407df@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <27e19ac9-4bc0-2945-3985-6cd6bb5407df@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >    *
> >    * It can be bound to any LED just like other triggers using either a
> >    * board file or via sysfs interface.
> >    *
> >    * An API named ledtrig_cpu is exported for any user, who want to add=
 CPU
> > - * activity indication in their code
> > + * activity indication in their code.
> >    *
> >    * Copyright 2011 Linus Walleij <linus.walleij@linaro.org>
> >    * Copyright 2011 - 2012 Bryan Wu <bryan.wu@canonical.com>
> > @@ -145,6 +149,9 @@ static int __init ledtrig_cpu_init(void)
> >   	for_each_possible_cpu(cpu) {
> >   		struct led_trigger_cpu *trig =3D &per_cpu(cpu_trig, cpu);
> > +		if (cpu > 4)
>=20
> NACK. The workaround for this trigger was implemented for a reason -
> to make it working on platforms with arbitrary number of logical cpus.
> I've got 8, so I am discriminated now. Not saying, that it precludes
> trigger registration with no single line of warning.

Can I get details of your setup?

What CPU type that is, and how are you mapping CPU activity to LEDs?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2egmQAKCRAw5/Bqldv6
8ifzAJ425uTIMaxQjbPH64kCDAFYOYS/EgCfTu7q/5bT+yzx1aKsfqeRIQBfdtM=
=7Xqf
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
