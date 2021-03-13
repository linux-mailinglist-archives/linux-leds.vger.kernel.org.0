Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC51339D8B
	for <lists+linux-leds@lfdr.de>; Sat, 13 Mar 2021 11:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbhCMKYk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 13 Mar 2021 05:24:40 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:48220 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbhCMKYd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 13 Mar 2021 05:24:33 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2BC9A1C0B85; Sat, 13 Mar 2021 11:24:31 +0100 (CET)
Date:   Sat, 13 Mar 2021 11:24:30 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Rahul Tanwar <rtanwar@maxlinear.com>
Cc:     Cheol Yong Kim <ckim@maxlinear.com>, Qiming Wu <qwu@maxlinear.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Adam Borowski <kilobyte@angband.pl>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        John Crispin <john@phrozen.org>,
        Hauke Mehrtens <hmehrtens@maxlinear.com>,
        Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: MaxLinear, please maintain your drivers was Re: [PATCH] leds:
 lgm: fix gpiolib dependency
Message-ID: <20210313102430.GA11435@duo.ucw.cz>
References: <20210308153052.2353885-1-arnd@kernel.org>
 <20210309180851.GA4669@duo.ucw.cz>
 <20210309193910.GA7507@amd>
 <YEgeoPqCCgTUEsSc@angband.pl>
 <20210310072831.GA29779@amd>
 <CAK8P3a2+o8N77A_OkP+QD7ntA+M4U26k15Hh1rNN16-afcTp9g@mail.gmail.com>
 <9a74ce79-b7cf-dec1-a64c-d928b5712645@hauke-m.de>
 <MN2PR19MB3486B88ADF5BE557BEE168AEAF909@MN2PR19MB3486.namprd19.prod.outlook.com>
 <MW2PR1901MB2187816296E1B03F91EB972BD0909@MW2PR1901MB2187.namprd19.prod.outlook.com>
 <MN2PR19MB3693B7620DABED199AA304B5B1909@MN2PR19MB3693.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <MN2PR19MB3693B7620DABED199AA304B5B1909@MN2PR19MB3693.namprd19.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Sorry for the hiccup due to missing email address in the email chain duri=
ng the ownership transition.
>=20
> Henceforth, I will be the maintainer for all kernel drivers/code related =
to =E2=80=9Cformerly Intel=E2=80=99s now MaxLinear=E2=80=99s=E2=80=9D Light=
ning Mountain SoC.
>=20
> Please send any Lightning Mountain SoC related issues email to Rahul Tanw=
ar (rtanwar@maxlinear.com<mailto:rtanwar@maxlinear.com>) and I will ensure =
that I
> address the issues in a timely manner.
>=20
> I will wait for more details on your fix request for LGM LED
> driver. Thanks.

Please review/Ack arnd's change.

Plus I'd like you to

1) remove LEDS_BLINK Kconfig symbol

2) provide useful Kconfig help text for your driver.

Thank you,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYEyS3gAKCRAw5/Bqldv6
8vxmAJ9FvMs2JegMmexmr37OARnEh156dACgwi7Jk65iG7STxDC7zHVXw6Ub1sE=
=WQa6
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
