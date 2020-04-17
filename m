Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F9F1AE48D
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2020 20:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730522AbgDQSOG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Apr 2020 14:14:06 -0400
Received: from vm1.sequanux.org ([188.165.36.56]:45663 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730323AbgDQSOG (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 17 Apr 2020 14:14:06 -0400
X-Greylist: delayed 376 seconds by postgrey-1.27 at vger.kernel.org; Fri, 17 Apr 2020 14:14:05 EDT
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id EDEAE1085E8;
        Fri, 17 Apr 2020 20:07:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dmXUmdp9l_D8; Fri, 17 Apr 2020 20:07:47 +0200 (CEST)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id EE2AC1085B7;
        Fri, 17 Apr 2020 20:07:46 +0200 (CEST)
Date:   Fri, 17 Apr 2020 20:07:46 +0200
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: netxbig: Convert to use GPIO descriptors
Message-ID: <20200417180746.GD15254@kw.sim.vm.gnt>
References: <20200415145139.155663-1-linus.walleij@linaro.org>
 <20200417125219.GC19028@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cpvLTH7QU4gwfq3S"
Content-Disposition: inline
In-Reply-To: <20200417125219.GC19028@duo.ucw.cz>
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--cpvLTH7QU4gwfq3S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 02:52:19PM +0200, Pavel Machek wrote:
> Hi!
>=20
> > This converts the NetXbig LED driver to use GPIO descriptors
> > instead of using the legacy interfaces in <linux/of_gpio.h>
> > and <linux/gpio.h> to iteratively parse the device tree for
> > global GPIO numbers.
> >=20
> > Cc: Simon Guinot <simon.guinot@sequanux.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Nothing obviously wrong here, but I'd not mind some testing.

Hi Pavel and Linux,

If you are not in a hurry, then I'll try it next week.

Simon

--cpvLTH7QU4gwfq3S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl6Z8HIACgkQzyg/RDPm
szpOpQ//TpWPIHxvErM08hcMwco7P0sB5o8SNAqaafShFrrI088SNvDoP2+nKKj3
51d1GY2JP51Nu3AnOKsoyerXTTfE4EP7eO2KvqOmwxRJQzGZQlfrYjLqgU5jAPf8
4VQuy1/Io1vfgY9vLVLuhzjSfefpOznS/PiEGiw5SjGtUmOT2NKtaNTQxaEldYx+
7F0kJn17oIFXzMtmubHH+W0gqILrpr2RGh7YOXcs1mHLqZHJfw1rCAu+h9k139c3
lle2XH0wSh89THf8KcMD7qBBbVEYH5PAfK2IHeyDCgOjv2xTKFWRrv0dX/hXacAA
iZ0H8Pa0boSC7miOMyasGWgviAcsmO185UvpCYNgJtbv2lJknBLk1BHyLmAWowaz
UbS3sZdc7QqydIx2yyLYLLRL9nGimjJxc4kW9mgJOK1WpqwPSJoR65tVthBMDycQ
vnXRGSFyH4evfDTKpO/jqpi4SGmIx8Qlsy3gyeMwWilXn6KX2Q/gYdN+QoDOxvgI
Vjt6siwZHHSVPeITbTVLSOnmBnjHdNPweOboZ2FoWPY8Ufi2K6fkk5ag5uH8B8DJ
aEi2J+aBvV4SEWkvERZa+CWBKsf2pdYrQnvNoWSxBk03/YA71RGUtExGppyKtLVs
Atkhac2QHACwkN+5/7VYCUtRP6aV4dpoX/WApzP62/paj5DxbQY=
=iHSA
-----END PGP SIGNATURE-----

--cpvLTH7QU4gwfq3S--
