Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9ABA4563AE
	for <lists+linux-leds@lfdr.de>; Thu, 18 Nov 2021 20:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhKRTuK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Nov 2021 14:50:10 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:48348 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhKRTuK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Nov 2021 14:50:10 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 73D8D1C0B76; Thu, 18 Nov 2021 20:47:08 +0100 (CET)
Date:   Thu, 18 Nov 2021 20:47:07 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     cy_huang <u0084500@gmail.com>
Cc:     robh+dt@kernel.org, matthias.bgg@gmail.com,
        gene.chen.richtek@gmail.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, wilma.wu@mediatek.com,
        benjamin.chao@mediatek.com, ChiYuan Huang <cy_huang@richtek.com>
Subject: Re: [PATCH] dt-bindings: leds: Replace moonlight with indicator in
 mt6360 example
Message-ID: <20211118172232.GB30480@amd>
References: <1637133726-6581-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <1637133726-6581-1-git-send-email-u0084500@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Replace moonlight with indicator in mt6360 example to prevent the below
> build error:
>=20
> Error: Documentation/devicetree/bindings/leds/leds-mt6360.example.dts:114=
=2E24-25
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:385:
> Documentation/devicetree/bindings/leds/leds-mt6360.example.dt.yaml]
> Error 1

Thanks, applied, hopefully it makes the checker happy.

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYZatuwAKCRAw5/Bqldv6
8mlKAJ90vIi/sBn9q2sGJqCTPZFZYHji5gCglAM3pvcMIDm3gdkd/95Ylnf6wiI=
=N/xf
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
