Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9090D132976
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jan 2020 16:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbgAGPBZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Jan 2020 10:01:25 -0500
Received: from vm1.sequanux.org ([188.165.36.56]:51986 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727880AbgAGPBZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 7 Jan 2020 10:01:25 -0500
X-Greylist: delayed 373 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Jan 2020 10:01:24 EST
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id 742A91085E2;
        Tue,  7 Jan 2020 15:55:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tPdmNcS--lMf; Tue,  7 Jan 2020 15:55:08 +0100 (CET)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id 573591085A0;
        Tue,  7 Jan 2020 15:55:08 +0100 (CET)
Date:   Tue, 7 Jan 2020 15:55:08 +0100
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        Vincent Donnefort <vdonnefort@gmail.com>
Subject: Re: [PATCH 2/2] leds: ns2: Convert to GPIO descriptors
Message-ID: <20200107145508.GA21102@kw.sim.vm.gnt>
References: <20200107141030.74052-1-linus.walleij@linaro.org>
 <20200107141030.74052-2-linus.walleij@linaro.org>
 <20200107141742.GA13954@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <20200107141742.GA13954@duo.ucw.cz>
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2020 at 03:17:42PM +0100, Pavel Machek wrote:
> Hi!
>=20
> > This converts the NS2 LED driver to use GPIO descriptors.
> > We take care to request the GPIOs "as is" which is what
> > the current driver goes to lengths to achieve, then we use
> > GPIOs throughout.
> >=20
> > As the nodes for each LED does not have any corresponding
> > device, we need to use the DT-specific accessors to get these
> > GPIO descriptors from the device tree.
>=20
> Ok. But what is motivation for doing this? Was this tested?
>=20
> Does anyone still use leds-ns2?

Hi,

Yes the leds-ns2 driver is used by The LaCie Network Space v2 family of
NAS and by the Seagate NAS 2 and 4-Bay. The latter is a bit old but not
obsolete. AFAIK all this NASes are supported by Debian.

I'll do the testing this week-end.

Simon

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl4Um8sACgkQzyg/RDPm
szpZRA//QjPwNWTD7pLeT49nyTnjvfFBz/61WtKHwKHCNA1WSU+qwCFKE2cUFlyb
3/dmd1ZC0qPnpriU9gWnT2ts4L7wO37iDKHudCAFrsxCaWYh6dBBs/QyAgqY4cUJ
5gZpHUyopJSJcVsuRw7RIy0rBFQXwKOJcVy5FdSm+choijnl/e0v21dc0psof3e8
syddMgN+6Uj2l6TGhsYZQoqj/T7jNoE0rhZZsfDXXzi/QxMKDn59gksZXfCDERU/
pF42EnwplqSzECVWa7MBPdld3XIOaiSvCVc+ZsFcQX0WJc+dDHaOgEhM9/1wS5cV
3EhyF9vOlAYDHbTfIYxEja1Fvsx3W/mrg5yzm6XRLOb8xe7rRwk5Qjog/fMHItjo
xVNuAuFLi98gD7Ed4MgBp4CVWBa4d4pSC1uy5t4BUZ41tzCbQyegkYNqXR2Zxd6f
b/kLmqYkirmvqhg7jWyY8jBHilmhGSY4vJHiMN+dNH7PIMtHw4f4Yi6iSQlG+Ndn
zQ9iqsP44H5RWn+NOHn6JR1tYax1JvPQXEWuoxQXNzlmrATYt37WkZVIYelFj6kd
THvSs7b8o/hMawpan97aYL54afKFtlL1s2wVFuLISm6iWNGvFCVYfAr9Zmv+4rwL
Jz6xtW9GqWtkwLYivDbyOFa6WDdroT1Vl8qkmwRC5xj/61ZuOkU=
=yzfU
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
