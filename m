Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49DA04835E
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2019 15:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbfFQNBz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Jun 2019 09:01:55 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45909 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbfFQNBz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Jun 2019 09:01:55 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id E7E9680258; Mon, 17 Jun 2019 15:01:40 +0200 (CEST)
Date:   Mon, 17 Jun 2019 15:01:51 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Brian Norris <briannorris@google.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Doug Anderson <dianders@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Richard Purdie <rpurdie@rpsys.net>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Guenter Roeck <groeck@google.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        kernel@collabora.com
Subject: Re: [PATCH v3 3/4] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Message-ID: <20190617130150.GA21113@amd>
References: <20180208113032.27810-1-enric.balletbo@collabora.com>
 <20180208113032.27810-4-enric.balletbo@collabora.com>
 <20190607220947.GR40515@google.com>
 <20190608210226.GB2359@xo-6d-61-c0.localdomain>
 <20190610205233.GB137143@google.com>
 <20190611104913.egsbwcedshjdy3m5@holly.lan>
 <CA+ASDXOq7KQ+f4KMh0gaC9hvXaxBDdsbiJxiTbeOJ9ZVaeNJag@mail.gmail.com>
 <20190611223019.GH137143@google.com>
 <20190612110325.xdn3q2aod52oalge@holly.lan>
 <20190612192642.GK137143@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <20190612192642.GK137143@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Certainly "linear" (this device will work more or less correctly if the
> > userspace applies perceptual curves). Not sure about logarithmic since
> > what is actually useful is something that is "perceptually linear"
> > (logarithmic is merely a way to approximate that).
> >=20
> > I do wonder about a compatible string like most-detailed to
> > least-detailed description. This for a PWM with the auto-generated
> > tables we'd see something like:
> >=20
> > cie-1991,perceptual,non-linear
> >=20
> > For something that is non-linear but we are not sure what its tables are
> > we can offer just "non-linear".
>=20
> Thanks for the feedback!
>=20
> It seems clear that we want a string for the added flexibility. I can
> work on a patch with the compatible string like description you
> suggested and we can discuss in the review if we want to go with that
> or prefer something else.

Compatible-like string seems overly complicated.

> > Instead one valid value for the sysfs should be "unknown" and this be
> > the default for drivers we have not analysed (this also makes it easy to
> > introduce change here).
>=20
> An "unknown" value sounds good, it allows userspace to just do what it
> did/would hace done before this attribute existed.

What about simply not presenting the attribute when we don't have the
information?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0Hjz4ACgkQMOfwapXb+vJICwCgw2oDqZxKwg0bd8+7Xh6ZsIX9
/MsAn2woctEoRe0BmsGCFOw5p1KQMS68
=vCQf
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
