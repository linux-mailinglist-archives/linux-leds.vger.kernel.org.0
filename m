Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39AE2291E5
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jul 2020 09:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbgGVHPp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Jul 2020 03:15:45 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52684 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbgGVHPp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jul 2020 03:15:45 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DD49F1C0BD8; Wed, 22 Jul 2020 09:15:42 +0200 (CEST)
Date:   Wed, 22 Jul 2020 09:15:42 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v6 2/3] leds: initial support for Turris Omnia LEDs
Message-ID: <20200722071542.GB8984@amd>
References: <20200721125922.10979-1-marek.behun@nic.cz>
 <20200721125922.10979-3-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Content-Disposition: inline
In-Reply-To: <20200721125922.10979-3-marek.behun@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +
> +/*
> + * On the front panel of the Turris Omnia router there is also a button =
which can be used to control
> + * the intensity of all the LEDs at once, so that if they are too bright=
, user can dim them.
> + * The microcontroller cycles between 8 levels of this global brightness=
 (from 100% to 0%), but this
> + * setting can have any integer value between 0 and 100. It is therefore=
 convenient to be able to
> + * change this setting from software.
> + * We expose this setting via a sysfs attribute file called "brightness"=
=2E This file lives in the
> + * device directory of the LED controller, not an individual LED, so it =
should not confuse users.
> + */

Lets keep comments formatted to 80 columns. This overflew my screen
and is unreadable.
							Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8X554ACgkQMOfwapXb+vKBnQCeOi3dm6FSqkyszusk6SVZQVoq
/DUAnicyXo1L0Xr9oyVnUG3OBgaQYBzO
=88QU
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
