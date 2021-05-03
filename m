Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A813371384
	for <lists+linux-leds@lfdr.de>; Mon,  3 May 2021 12:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233195AbhECKRp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 May 2021 06:17:45 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:38042 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233196AbhECKRo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 May 2021 06:17:44 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2D8C61C0B79; Mon,  3 May 2021 12:16:51 +0200 (CEST)
Date:   Mon, 3 May 2021 12:16:50 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Juergen Borleis <jbe@pengutronix.de>
Cc:     linux-leds@vger.kernel.org,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
Subject: Re: [PATCH] leds: trigger/tty: Use led_set_brightness() to support
 all use cases
Message-ID: <20210503101650.GC6621@amd>
References: <20210503092542.14497-1-jbe@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Sr1nOIr3CvdE5hEN"
Content-Disposition: inline
In-Reply-To: <20210503092542.14497-1-jbe@pengutronix.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-05-03 11:25:42, Juergen Borleis wrote:
> Using led_set_brightness_sync() only works for LEDs which are connected
> via some kind of external bus like I=B2C or SPI. But it doesn't work for
> the simple use case of directly connected LEDs via GPIOs.

Really? I'd need to check.

> Because this function only honors the led_classdev::brightness_set_blocki=
ng
> callback. But the LED-GPIO driver registers the
> led_classdev::brightness_set member if the GPIO can be modified directly
> and thus, TTY triggers fail silently with -ENOTSUPP.
>=20
> With the previously used led_set_brightness() it works for both use cases.
> This function first checks for the simple case where the GPIO can be chan=
ged
> without additional overhead, and if it fails, does the modification via a
> workqueue.

Yeah, but that is not what we want. We are already running in the
workqueue.

We really should have a API that can be called from process context,
and just simply sets the brightness.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--Sr1nOIr3CvdE5hEN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCPzZIACgkQMOfwapXb+vJCHQCfVFzUNHnVvgKkn6lIfeIVYX9A
hs4AoIQFeJ/ueUt6I3fML1HMZCssl6ei
=BadJ
-----END PGP SIGNATURE-----

--Sr1nOIr3CvdE5hEN--
