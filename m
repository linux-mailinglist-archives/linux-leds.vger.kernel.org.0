Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B50276B8A
	for <lists+linux-leds@lfdr.de>; Thu, 24 Sep 2020 10:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbgIXIOs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Sep 2020 04:14:48 -0400
Received: from vm1.sequanux.org ([188.165.36.56]:38914 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727151AbgIXIOs (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 24 Sep 2020 04:14:48 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id 5C315108625;
        Thu, 24 Sep 2020 10:14:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QWw3IZubI_XL; Thu, 24 Sep 2020 10:14:44 +0200 (CEST)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id BCD6E1085DE;
        Thu, 24 Sep 2020 10:14:44 +0200 (CEST)
Date:   Thu, 24 Sep 2020 10:14:44 +0200
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        dmurphy@ti.com
Subject: Re: [PATCH leds 0/2] leds: ns2: convert to fwnode API
Message-ID: <20200924081444.GH4828@kw.sim.vm.gnt>
References: <20200923141840.6333-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p7qwJlK53pWzbayA"
Content-Disposition: inline
In-Reply-To: <20200923141840.6333-1-kabel@kernel.org>
User-Agent: Mutt/1.6.0 (2016-04-01)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--p7qwJlK53pWzbayA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 04:18:38PM +0200, Marek Beh=C3=BAn wrote:
> Hi Pavel,
>=20
> Simon wants to bind this driver without device-tree, so this changes
> the binding from specific OF API to generic fwnode API.
>=20
> This applies to your for-next, but if you apply this, I will have to
> respin my other series moving parsing of `linux,default-trigger` to
> LED core.
>=20
> Marek
>=20
> Cc: Simon Guinot <simon.guinot@sequanux.org>
>=20
> Marek Beh=C3=BAn (2):
>   leds: ns2: convert to fwnode API
>   leds: ns2: do not guard OF match pointer with of_match_ptr
>=20
>  drivers/leds/leds-ns2.c | 74 ++++++++++++++++++++---------------------
>  1 file changed, 36 insertions(+), 38 deletions(-)
>=20
> --=20
> 2.26.2

Hi Marek,

Thanks for this patches. I'll test them this week.

Simon

--p7qwJlK53pWzbayA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl9sVXMACgkQzyg/RDPm
szrvlw/9E8U0dyO1zr96gJ+ULyeN7fe0BcqTLgvdwRV4TB0Y71rPqNpLUyo9SS4J
R2rTCfO+qCiE+tgjgdL5Timu1ZhemjbpnYujOLq7/DmrCigKAZP0tJtWhEpFLauk
lnRTGWhCOCVYSAkzRnlJK42OGhdCbfSwtOPqR22ASR8vLLFC4WBnk8NC9IlaWuSr
li2/YYP8RpUGGgv0uQJJvGNhqPfn/I14f7YEbx6qZslyDEKUPKUp4unrFLqBNA5E
i58kAHPiITVBSb3INLCb6ActzVbroDUuyPR9x1Am3flay0OHbs6KkVUSPdeUbsFJ
DNSB2k9CKx8p1ONMjSGqZ4wohUv6N8Z4gaQ1CN/tra9o5OGGDZVASlyBg21RmPB/
Ga9i75j4T3+0qe4JKy4HnkaimI9u01P7jvBoreEy4MIF6HWiha1eXXpXuIZjjIZk
rz2PozWaTKLw0LKSRdw3Z8I7k1UAxChVCJi2i7FQmfWAKwyAxo42La1eUxwvk456
bbd88EMyCeH+04K69W10UUZsa68bdXDzW7oAZsVJODI3A1tkH31dnbtNNCjkPWpe
GXMOhmer9wIS3ksgxSjj2Rlz1EIHdNtOuaS8h0ptARTkAsgPSgU8pokdd2RwtvGb
TAStbRh1i37UgKWRvfFF74rxLtlzQ+deG4MhMxAON1urWqcEg3g=
=kYVV
-----END PGP SIGNATURE-----

--p7qwJlK53pWzbayA--
