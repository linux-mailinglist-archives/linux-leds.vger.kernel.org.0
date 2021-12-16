Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B8B476F0B
	for <lists+linux-leds@lfdr.de>; Thu, 16 Dec 2021 11:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236178AbhLPKmJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Dec 2021 05:42:09 -0500
Received: from static.55.155.9.5.clients.your-server.de ([5.9.155.55]:11109
        "EHLO vm3.sequanux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbhLPKmJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Dec 2021 05:42:09 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm3.sequanux.org (Postfix) with ESMTP id 6059110860F;
        Thu, 16 Dec 2021 11:31:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm3.sequanux.org ([127.0.0.1])
        by localhost (vm3.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dD0htLPr1N16; Thu, 16 Dec 2021 11:31:20 +0100 (CET)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm3.sequanux.org (Postfix) with ESMTPSA id C58991085FE;
        Thu, 16 Dec 2021 11:31:20 +0100 (CET)
Date:   Thu, 16 Dec 2021 11:30:59 +0100
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-leds@vger.kernel.org, j.anaszewski@samsung.com
Subject: Re: [bug report] leds: ns2: Remove work queue
Message-ID: <YbsVY7Xqa6k1Plba@kw.sim.vm.gnt>
References: <20211210135249.GA16777@kili>
 <20211215203955.GG28336@duo.ucw.cz>
 <20211215220441.2d83299a@thinkpad>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ekv3dsDtj3l37yNF"
Content-Disposition: inline
In-Reply-To: <20211215220441.2d83299a@thinkpad>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Ekv3dsDtj3l37yNF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:04:41PM +0100, Marek Beh=C3=BAn wrote:
> On Wed, 15 Dec 2021 21:39:55 +0100
> Pavel Machek <pavel@ucw.cz> wrote:
>=20
> > Hi!
> >=20
> > > Hello LED devs,
> > >=20
> > > The patch c29e650b3af2: "leds: ns2: Remove work queue" from Nov 20,
> > > 2015, leads to the following Smatch static checker warning:
> > >=20
> > > 	drivers/leds/leds-ns2.c:96 ns2_led_set_mode()
> > > 	warn: sleeping in atomic context =20
> >=20
> > Yup, this looks wrong.
> >=20
> > Plus, the code is quite crazy.
> >=20
> > Not sure what the write_lock in that function is supposed to protect
> > against. Perhaps it can be just removed?
> >=20
> > Hmm. led_set_mode uses custom interface for hardware accelerated
> > LED. Ideally there's more fixing to be done there :-(.
>=20
> The last time we discussed this, Simon said that he is willing to
> convert once we have trigger offloading API. But we will also need
> blkdev trigger. Time to review Ian Pilcher's last attempt at blkdev?
>   [RESEND PATCH v8 0/2] Introduce block device LED trigger
>   https://lore.kernel.org/linux-leds/20211119212733.286427-1-arequipeno@g=
mail.com/

Hi Marek,

I kind of remembering that :)

--Ekv3dsDtj3l37yNF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAmG7FWIACgkQzyg/RDPm
szpO3hAAzRUaIPBwxFUNdpaQOvYAGeliQ8P/CyIQDTCMpYARdqK3bSgtgsbKdfYj
gICPlrXmgsnVf38ytlNzTWSBj6nYWcQUQXa/m9/EipeTOSuo6WB0am9ju000heEI
sP7DcNMOtl/r51JMfymHcrnOzV7LuNBmxMbOU12Z8/e/4ZzPDUk2ec0eTT1lZjY7
j0V3MulgZyLZsK3JTeusj1+jF86omRpl3IQMbdgWiuuadehVKhcqOE+JRCJ9pLmK
4E3RQJcSFMM+90li2QaTpuLUoDB+gtg4kvlJg9kdb/9stdkzuUXVgNyk3a+EIs7U
XM/JbaJFO/BaltwrRuLzjMGqfBkwzXUQdfuvvdr2iwkkN0jTZlRtwE+3RrCknMPt
W79ptb0q6RWEpMTN0nqyJ1Js7RBMTwOFQnCAAip+baoEYGbklQUB1M4F5W3ttUMK
7HZCTtFl0r5RSBA7SF6wnW2y5eNeNDPaip/uzzbsTktkgt4kXH+SNSP5arlTXjDl
qMTB66Ku41u1CWJnZu7vwdT34I6WbjqLKyXFgYDLJM914Ga+MPbVL/0NhY6reQ9N
LVbN+BTeOepzQhlQxCK8aDWFbGdBPqh1S5VZRGXE0qJpnG27LgYw9QgGAKdZjyCQ
j+Is9rKcHQlB+mgP0GDBzKhJJN+5n20p3rXfPpAlb+4PkpvIQ0E=
=+BDZ
-----END PGP SIGNATURE-----

--Ekv3dsDtj3l37yNF--
