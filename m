Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5114400A14
	for <lists+linux-leds@lfdr.de>; Sat,  4 Sep 2021 08:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234922AbhIDGal (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Sep 2021 02:30:41 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37372 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhIDGal (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Sep 2021 02:30:41 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D629E1C0BA6; Sat,  4 Sep 2021 08:29:38 +0200 (CEST)
Date:   Sat, 4 Sep 2021 08:29:38 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux@vger.kernel.org,
        gregkh@linuxfoundation.org, kabel@kernel.org
Subject: Re: [PATCH 01/18] docs: Add block device (blkdev) LED trigger
 documentation
Message-ID: <20210904062938.GA25286@amd>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-2-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <20210903204548.2745354-2-arequipeno@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add Documentation/ABI/testing/sysfs-class-led-trigger-blkdev to
> document:
>=20
>   * /sys/class/leds/<led>/blink_time
>   * /sys/class/leds/<led>/interval
>   * /sys/class/leds/<led>/mode
>   * /sys/class/leds/<led>/add_blkdev
>   * /sys/class/leds/<led>/delete_blkdev
>   * /sys/class/leds/<led>/block_devices
>=20
> Add /sys/block/<disk>/blkdev_leds to Documentation/ABI/testing/sysfs-block
>=20
> Add overview in Documentation/leds/ledtrig-blkdev.rst

> +What:		/sys/class/leds/<led>/add_blkdev
> +Date:		September 2021
> +Contact:	Ian Pilcher <arequipeno@gmail.com>
> +Description:
> +		Associate a block device with this LED by writing its kernel
> +		name (as shown in /sys/block) to this attribute.  Multiple
> +		device names may be written at once, separated by whitespace.

This is seriously strange interface.

> +What:		/sys/class/leds/<led>/delete_blkdev
> +Date:		September 2021
> +Contact:	Ian Pilcher <arequipeno@gmail.com>
> +Description:
> +		Remove the association between this LED and a block device by
> +		writing the device's kernel name to this attribute.  Multiple
> +		device names may be written at once, separated by whitespace.
> +
> +What:		/sys/class/leds/<led>/block_devices
> +Date:		September 2021
> +Contact:	Ian Pilcher <arequipeno@gmail.com>
> +Description:
> +		Directory containing links to all block devices that are
> +		associated with this LED.

If you have directory with symlinks, why not use symlink() syscall
instead of add_blkdev, and unlink() syscall instead of delete_blkdev?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEzElIACgkQMOfwapXb+vI1CgCbBSYKK/iUvPdu5qHN04iQlYoy
n0UAn1ObM4N5zYbBl8CcHYs76h7Yq9XS
=YFp+
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
