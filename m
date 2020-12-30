Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE772E7C1F
	for <lists+linux-leds@lfdr.de>; Wed, 30 Dec 2020 20:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgL3TVk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Dec 2020 14:21:40 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:60666 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgL3TVk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Dec 2020 14:21:40 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 80A641C0B79; Wed, 30 Dec 2020 20:20:57 +0100 (CET)
Date:   Wed, 30 Dec 2020 20:20:57 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh@kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        jacek.anaszewski@gmail.com, dmurphy@ti.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, thunder.leizhen@huawei.com
Subject: Re: [PATCH v2] dt-bindings: leds: Document commonly used LED triggers
Message-ID: <20201230192057.GF25903@duo.ucw.cz>
References: <20201210082449.30586-1-manivannan.sadhasivam@linaro.org>
 <20201214223621.GA2493849@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xkXJwpr35CY/Lc3I"
Content-Disposition: inline
In-Reply-To: <20201214223621.GA2493849@robh.at.kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--xkXJwpr35CY/Lc3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-12-14 16:36:21, Rob Herring wrote:
> On Thu, Dec 10, 2020 at 01:54:49PM +0530, Manivannan Sadhasivam wrote:
> > This commit documents the LED triggers used commonly in the SoCs. Not
> > all triggers are documented as some of them are very application specif=
ic.
> > Most of the triggers documented here are currently used in devicetrees
> > of many SoCs.
>=20
> The idea with recent LED binding changes is to move away from=20
> 'linux,default-trigger' to 'function' and 'trigger-sources' and to have=
=20
> some sort of standardized names.

Yes, but I guess we still want to document this... and perhaps use it
during transition and when trigger-sources (etc) are too hard to set
up.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--xkXJwpr35CY/Lc3I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX+zTGQAKCRAw5/Bqldv6
8g4bAJ9c4pSJ1XVBUmopWKPjhhhiIKiUJgCeLML1TCTldG0ypmbnMMN6q0LeMRY=
=HQML
-----END PGP SIGNATURE-----

--xkXJwpr35CY/Lc3I--
