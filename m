Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5CF3E5C24
	for <lists+linux-leds@lfdr.de>; Tue, 10 Aug 2021 15:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241885AbhHJNtb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Aug 2021 09:49:31 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:59218 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240232AbhHJNtb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Aug 2021 09:49:31 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D67F31C0B77; Tue, 10 Aug 2021 15:49:04 +0200 (CEST)
Date:   Tue, 10 Aug 2021 15:49:04 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        axboe@kernel.dk, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Subject: Re: [RFC PATCH v2 01/10] docs: Add block device LED trigger
 documentation
Message-ID: <20210810134904.GA28089@amd>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
 <20210809033217.1113444-2-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <20210809033217.1113444-2-arequipeno@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +++ b/Documentation/ABI/testing/sysfs-block
> @@ -316,3 +316,19 @@ Description:
>  		does not complete in this time then the block driver timeout
>  		handler is invoked. That timeout handler can decide to retry
>  		the request, to fail it or to start a device recovery strategy.
> +
> +What:		/sys/block/<disk>/led
> +Date:		August 2021
> +Contact:	Ian Pilcher <arequipeno@gmail.com>
> +Description:
> +		Set the LED associated with this block device (or show available
> +		LEDs and the currently selected LED, if any).
> +
> +		Reading the attribute will display the available LEDs (LEDs that
> +		are associated with the blkdev LED trigger).  The currently
> +		selected LED is enclosed in square brackets.  To clear the
> +		device's LED association write 'none' (without the quotes) or
> +		an empty string/line to the attribute.
> +
> +		See Documentation/ABI/testing/sysfs-class-led-trigger-blkdev and
> +		Documentation/block/blk-ledtrig.rst.)

I have to agree with Marek / Pali -- this is very strange interface.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmESg88ACgkQMOfwapXb+vJV0gCdGqeHkXkz9qAl+6lcbIQnxYAJ
liUAoIIpKKVWZ9SEjYxGWwA0VjQRZqWk
=I/wx
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
