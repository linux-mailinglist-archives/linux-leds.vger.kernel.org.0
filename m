Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D4B2A7B05
	for <lists+linux-leds@lfdr.de>; Thu,  5 Nov 2020 10:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725468AbgKEJxB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Nov 2020 04:53:01 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:45160 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgKEJxB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 Nov 2020 04:53:01 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6A8D11C0B82; Thu,  5 Nov 2020 10:52:58 +0100 (CET)
Date:   Thu, 5 Nov 2020 10:52:57 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com, malliamireddy009@gmail.com,
        yixin.zhu@intel.com
Subject: Re: [PATCH v1 1/2] dt-bindings: leds: Add bindings for intel LGM SOC
Message-ID: <20201105095257.GA7994@amd>
References: <c9c963a2d03fbd03bd21f71f3d776ac5800cf6cc.1604331498.git.mallikarjunax.reddy@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <c9c963a2d03fbd03bd21f71f3d776ac5800cf6cc.1604331498.git.mallikarjunax.reddy@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-11-05 17:43:50, Amireddy Mallikarjuna reddy wrote:
> Add DT bindings YAML schema for SSO controller driver
> of Lightning Mountain(LGM) SoC.
>

intel -> Intel in the title.
"Lightning Mountain(LGM)" -> 'Lightning Mountain (LGM)"

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-lgm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel LGM Soc LED SSO driver

Please spell out LGM and SSO here. Soc -> SoC?


> +          intel,sso-brightness:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: brightness level of the LED.
> +            minimum: 0
> +            maximum: 255

?

> +          intel,sso-hw-trigger:
> +            type: boolean
> +            description: This property indicates Hardware driven/control=
 LED.

Why is this intel specific?

> +          intel,sso-hw-blink:
> +            type: boolean
> +            description: This property indicates Enable LED blink by Har=
dware.

?

> +          intel,sso-blink-rate:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: LED HW blink frequency.

?

Best regards,
						Pavel
--=20
http://www.livejournal.com/~pavelmachek

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+jy3kACgkQMOfwapXb+vItswCdHK/rBjUuX8XXr4kRgKyZnhDA
BcAAoMRvUm2kKvgPmc4PKgqdfoK1Z4/N
=SlwM
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
