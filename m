Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEAE17D651
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2020 22:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgCHV0w (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Mar 2020 17:26:52 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:45244 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgCHV0w (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Mar 2020 17:26:52 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 59F571C0317; Sun,  8 Mar 2020 22:26:50 +0100 (CET)
Date:   Sun, 8 Mar 2020 22:26:49 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tobias Schramm <t.schramm@manjaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] Add generic inverted led triggers
Message-ID: <20200308212649.GA31247@amd>
References: <20200308142722.1199260-1-t.schramm@manjaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <20200308142722.1199260-1-t.schramm@manjaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This patch adds generic inverted LED triggers. With this patch applied
> any trigger can be used with inverted brightness levels by appending
> "-inverted" to the name of a trigger.

Not a big fan (sorry).

We have already _way_ too many triggers, we don't want to have twice
that much.

> This is can be useful for devices that do not have dedicated LEDs for e.g.
> disk activity indication. With this patch applied the power led can be set
>  to default-state =3D on and trigger =3D disk-activity-inverted. Then the=
 led
> will be on by default, indicating the power state of the device but it
> will turn off briefly whenever there is disk activity.

Better implementation might be to have a trigger attribute doing the
inverting.

> I think dual-use of LEDs might come in handy for quite a few devices since
> a lot of embedded boards and upcoming ARM based notebooks do only have one
> or two LEDs.

Inverting really does not work with all the triggers; numlock-inverted
will not get too many
users. always-on-inverted... blink-inverted.... I guess it does make
sense for disk activity (but be warned disk can be continuously active
for quite a while).

What triggers do you think make sense inverted?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5lYxkACgkQMOfwapXb+vLCcQCdFXTGZclHREpMmf1wjB+Wzmt/
4ecAoLyzF2muOElkuYhK0/xFDh6/XBA2
=abBt
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
