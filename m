Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8DF391AA9
	for <lists+linux-leds@lfdr.de>; Wed, 26 May 2021 16:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235050AbhEZOtY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 May 2021 10:49:24 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33846 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234893AbhEZOtY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 May 2021 10:49:24 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D64891C0B80; Wed, 26 May 2021 16:47:51 +0200 (CEST)
Date:   Wed, 26 May 2021 16:47:51 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 16/17] leds: leds-nuc: add support for changing the
 ethernet type indicator
Message-ID: <20210526144751.GA2141@amd>
References: <20210519100253.49b155e9@thinkpad>
 <20210519121812.4285b3ea@coco.lan>
 <20210519141102.0161a9d9@thinkpad>
 <20210519162413.4feeab02@coco.lan>
 <20210519175503.567e6ecc@thinkpad>
 <20210519203014.1838de3a@coco.lan>
 <20210520130014.7189a315@dellmb>
 <20210520180028.495f94e4@coco.lan>
 <20210520183633.084a8c3f@thinkpad>
 <20210520205933.3cfc57a9@coco.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <20210520205933.3cfc57a9@coco.lan>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > See, there's nothing that the driver can possible do with
> > > rx, tx, link, interval, device_name/device, as the the BIOS allows
> > > to set to "LAN1", "LAN2" or "LAN1+LAN2". the WMI interface doesn't
> > > provide *any* information about what LAN1 means. =20
> >=20
> > On the contrary, there is something the driver can do with these
> > attributes. If the specific combination is not supported, the driver
> > should return -EOPNOTSUPP in the trigger_offload method and let the
> > netdev trigger do the work in software.=20
>=20
> Letting netdev to trigger is something we don't want to allow, as this
> can cause side effects, making it doing slow the system due to BIOS calls
> for no good reason.

I'm with Marek here. Please listen to him.

Yes, operating LEDs can cost some CPU cycles. That's the case on most
hardware. Yet we want to support most triggers on most hardware.

Best regards,

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCuX5cACgkQMOfwapXb+vLAcwCbBzgQIYwh4JUJsSgQSrO7xbUU
IioAmwX8mKnpRmC1qRAlJIiv382x+Z1Z
=5jjI
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
