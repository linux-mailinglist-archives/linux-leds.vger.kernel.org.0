Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E9C2C3FDC
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 13:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgKYMXA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 07:23:00 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:43076 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbgKYMXA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 07:23:00 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 69FEF1C0B7D; Wed, 25 Nov 2020 13:22:54 +0100 (CET)
Date:   Wed, 25 Nov 2020 13:22:54 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/5] leds: qcom-lpg: add support for pm8150[bl] leds
Message-ID: <20201125122253.GF29328@amd>
References: <20201030010713.247009-1-dmitry.baryshkov@linaro.org>
 <20201030010713.247009-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/QKKmeG/X/bPShih"
Content-Disposition: inline
In-Reply-To: <20201030010713.247009-3-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--/QKKmeG/X/bPShih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-10-30 04:07:10, Dmitry Baryshkov wrote:
> Add support for the LPG/PWM block found on newer PMICs: PM8150B and
> PM8150A/L.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

1,2: Acked-by: Pavel Machek <pavel@ucw.cz>

=2E..but they don't apply to current leds-next tree, so I'm not taking
them.

Best regards,
								Pavel--=20
http://www.livejournal.com/~pavelmachek

--/QKKmeG/X/bPShih
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++TJ0ACgkQMOfwapXb+vJgaQCgv54sRYnOHC0fgcx2vocUu9Ha
GxIAoJ+7bCctjiUSYLeKp7E43I+4WfY6
=nr0o
-----END PGP SIGNATURE-----

--/QKKmeG/X/bPShih--
