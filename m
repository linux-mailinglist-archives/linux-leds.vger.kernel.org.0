Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5458D112B9C
	for <lists+linux-leds@lfdr.de>; Wed,  4 Dec 2019 13:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbfLDMiI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Dec 2019 07:38:08 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54902 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfLDMiI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Dec 2019 07:38:08 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D52311C25E0; Wed,  4 Dec 2019 13:38:06 +0100 (CET)
Date:   Wed, 4 Dec 2019 13:38:06 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn@kryo.se>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 2/2] leds: meter: add leds-meter binding
Message-ID: <20191204123806.GB29179@duo.ucw.cz>
References: <1571756812-19005-1-git-send-email-akinobu.mita@gmail.com>
 <1571756812-19005-3-git-send-email-akinobu.mita@gmail.com>
 <CAL_JsqJ3+Ys5_JD0qnf7acS5wXUpAyU=Wdbfigud4p6fT1f9eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ3+Ys5_JD0qnf7acS5wXUpAyU=Wdbfigud4p6fT1f9eg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-10-23 09:56:03, Rob Herring wrote:
> On Tue, Oct 22, 2019 at 10:07 AM Akinobu Mita <akinobu.mita@gmail.com> wr=
ote:
> >
> > Add DT binding for leds-meter.
>=20
> What's an leds meter? Need a better explanation to understand if this
> makes sense at all, but some comments on the schema below.

It groups several LEDs into one "virtual" LED.

I'm not sure I like it. What is it good for?

We do not have many triggers that dim the LEDs, and if it is only used
=66rom userspace, it can stay in userspace...?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXeeorgAKCRAw5/Bqldv6
8rX7AKCfFNZstUnytqFhPWiVHS5USwHH5gCguiizcO24mmi2COmPy7igzck4b+o=
=8pXm
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--
