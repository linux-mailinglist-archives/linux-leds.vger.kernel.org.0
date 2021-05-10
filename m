Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2283780A1
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhEJJ5z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:57:55 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42156 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbhEJJ5g (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 May 2021 05:57:36 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9AE791C0B79; Mon, 10 May 2021 11:56:30 +0200 (CEST)
Date:   Mon, 10 May 2021 11:56:29 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Wan Jiabing <wanjiabing@vivo.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kael_w@yeah.net
Subject: Re: [PATCH] leds: Fix reference file name of documentation
Message-ID: <20210510095629.GA14728@amd>
References: <20210506070824.10965-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <20210506070824.10965-1-wanjiabing@vivo.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2021-05-06 15:08:24, Wan Jiabing wrote:
> In commit 56b01acc1c79a ("dt-bindings: gpio: fairchild,74hc595:
> Convert to json-schema"), gpio-74x164.txt was deleted and replaced
> by fairchild,74hc595.yaml. Fix the reference file name.
>=20
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
http://www.livejournal.com/~pavelmachek

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCZA0wACgkQMOfwapXb+vIxEgCeJcCOXUpDIRw9jY3lxihLArGX
k6EAn2KJDQ7NG3/gMF6p2v1DvdD6DAjF
=l7nT
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
