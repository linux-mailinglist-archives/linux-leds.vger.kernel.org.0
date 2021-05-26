Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577B6391AC5
	for <lists+linux-leds@lfdr.de>; Wed, 26 May 2021 16:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbhEZOwr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 May 2021 10:52:47 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34166 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235124AbhEZOwp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 May 2021 10:52:45 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 16DD01C0B80; Wed, 26 May 2021 16:51:13 +0200 (CEST)
Date:   Wed, 26 May 2021 16:51:12 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 16/17] leds: leds-nuc: add support for changing the
 ethernet type indicator
Message-ID: <20210526145112.GB2141@amd>
References: <20210519141102.0161a9d9@thinkpad>
 <20210519162413.4feeab02@coco.lan>
 <20210519175503.567e6ecc@thinkpad>
 <20210519203014.1838de3a@coco.lan>
 <20210520130014.7189a315@dellmb>
 <20210520180028.495f94e4@coco.lan>
 <20210520183633.084a8c3f@thinkpad>
 <20210520205933.3cfc57a9@coco.lan>
 <20210520220703.5a86b994@thinkpad>
 <20210521111400.127ffa10@coco.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline
In-Reply-To: <20210521111400.127ffa10@coco.lan>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > You say that for this controller it would be bad to do in SW, because it
> > would take too much time in BIOS calls. (I wonder how much...)=20
>=20
> Yeah, it would be interesting to know how much. However, measuring BIOS
> latency and time spent on such calls can be tricky: one needs to use a
> high-res clock that it is not used anywhere else, in order to measure
> it.=20

I'm sure you can time kernel compilation while LEDs are using software
netdev trigger, for example.

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCuYGAACgkQMOfwapXb+vJFDACfdUCXRYSS74FydyliLdElL27I
TXEAoMI9acvhBn3odljv1Kv0GKkN7Mrb
=Tqsk
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
