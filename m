Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0551D36A99A
	for <lists+linux-leds@lfdr.de>; Sun, 25 Apr 2021 23:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbhDYVrV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 25 Apr 2021 17:47:21 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52526 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbhDYVrV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 25 Apr 2021 17:47:21 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DC4831C0B77; Sun, 25 Apr 2021 23:46:39 +0200 (CEST)
Date:   Sun, 25 Apr 2021 23:46:39 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Dan Murphy <dmurphy@ti.com>,
        =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: pca955x: Allow full control over led name
Message-ID: <20210425214639.GH10996@amd>
References: <20210325005456.152469-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4LFBTxd4L5NLO6ly"
Content-Disposition: inline
In-Reply-To: <20210325005456.152469-1-joel@jms.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--4LFBTxd4L5NLO6ly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2021-03-25 11:24:56, Joel Stanley wrote:
> The PCA955x driver since it was merged has added a "pca955x:" prefix to
> LED names. This meanas platform data (such as the device tree) cannot
> fully control the name. Here's what this produces using the example in
> the device tree bindings:
>=20
>  # cat /sys/class/leds/
>  pca955x:green:power/
>  pca955x:pca9552:white/
>  pca955x:pca9552:yellow/
>  pca955x:red:power/
>=20
> Some systems want the ability to configure the full string. To do this,
> introduce a build time option that adds the prefix that defaults to
> enabled in order to preserve existing behaviour.

No. Config option is not acceptable for this.

Just delete the prefix and fix the breakage.
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--4LFBTxd4L5NLO6ly
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCF4z8ACgkQMOfwapXb+vKu+wCgvnQ+a54QIYI8TDkZUjTdxMh8
yAwAoLNpjuyoXQ+yOUus5+CGrTyPENp3
=mZGg
-----END PGP SIGNATURE-----

--4LFBTxd4L5NLO6ly--
