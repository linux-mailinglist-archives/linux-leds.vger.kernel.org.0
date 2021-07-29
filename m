Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776093D9FDF
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 10:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235162AbhG2IyT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Jul 2021 04:54:19 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:32866 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235257AbhG2IyS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Jul 2021 04:54:18 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 411A81C0B79; Thu, 29 Jul 2021 10:54:14 +0200 (CEST)
Date:   Thu, 29 Jul 2021 10:54:13 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        axboe@kernel.dk, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Subject: Re: [RFC PATCH 0/8] Add configurable block device LED triggers
Message-ID: <20210729085413.GA16945@amd>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
In-Reply-To: <20210729015344.3366750-1-arequipeno@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This patch series adds configurable (i.e. user-defined) block device LED
> triggers.
>=20
> * Triggers can be created, listed, and deleted via sysfs block class
>   attributes (led_trigger_{new,list,del}).
>=20
> * Once created, block device LED triggers are associated with LEDs just
>   like any other LED trigger (via /sys/class/leds/${LED}/trigger).
>=20
> * Each block device gains a new device attribute (led_trigger) that can
>   be used to associate the device with a trigger or clear its
>   association.

That's not how this is normally done.

We normally have a trigger ("block device activity") which can then
expose parameters ("I watch for read" and "I monitor sda1").

Is there a reason normal solution can not be used?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmECbLUACgkQMOfwapXb+vL9tACgnOzb1KvTxmFtIJuKCic5ZIg/
y44AoKfmCU0r9lJBSrs3cIzBq6G/ZJhY
=EPbJ
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
