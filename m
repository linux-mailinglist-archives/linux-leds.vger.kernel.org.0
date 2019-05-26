Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 829FE2A90D
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2019 10:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727623AbfEZISJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 26 May 2019 04:18:09 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40586 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbfEZISI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 26 May 2019 04:18:08 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id E73AC802D3; Sun, 26 May 2019 10:17:56 +0200 (CEST)
Date:   Sun, 26 May 2019 10:18:06 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, linz@li-pro.net, rpurdie@rpsys.net
Subject: Re: Disk activity trigger: keeps blinking under full load
Message-ID: <20190526081806.GA16279@amd>
References: <20190523214301.GA14788@amd>
 <67fee5a8-cba1-79aa-104c-84bbe0e168e9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline
In-Reply-To: <67fee5a8-cba1-79aa-104c-84bbe0e168e9@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2019-05-25 19:02:47, Jacek Anaszewski wrote:
> Hi,
>=20
> On 5/23/19 11:43 PM, Pavel Machek wrote:
> >Hi!
> >
> >I'm trying to use disk activity trigger on a scrollock LED... but it
> >significantly differs from "usual" disk LED: even under "full" disk
> >activity (linear read) where it should be solidly "on", it keeps
> >blinking.
> >
> >I guess that's what led_trigger_blink_oneshot() does. I tried to
> >change the parameters... off_delay =3D=3D 0 breaks it completely, and ev=
en
> >with delay of 1 it behaves very weirdly.
> >
> >Is there better helper I should use?
>=20
> It seems this is the way how led_blink_set_oneshot() works.
> It initially checks whether timer is pending and doesn't
> reset the timer in this case:
>=20
>         if (test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
>              timer_pending(&led_cdev->blink_timer))
>                 return;
>=20
> In effect you get gaps between timer expiration and setting of a new
> blink shot.

Yep. I consider it a bug (it differs from hardware disk activity LEDs
and looks horrible).

Is there someone who considers it a feature?
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEUEARECAAYFAlzqS74ACgkQMOfwapXb+vK5lwCY2aJx2EmQ02TQvwWY1vYObBB3
eQCeLxM5YOpHbDuCdqBQMAtiKqCmIiQ=
=qDzm
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
