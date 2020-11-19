Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B842B8C82
	for <lists+linux-leds@lfdr.de>; Thu, 19 Nov 2020 08:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725813AbgKSHoU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Nov 2020 02:44:20 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:38636 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgKSHoU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Nov 2020 02:44:20 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2D57E1C0B8C; Thu, 19 Nov 2020 08:44:17 +0100 (CET)
Date:   Thu, 19 Nov 2020 08:44:16 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
Message-ID: <20201119074416.GA27576@amd>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd>
 <CAE+NS36rnHzhdk5Os+vL=uK225HJT-bUHSRJ6KccaOHc-kCjpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <CAE+NS36rnHzhdk5Os+vL=uK225HJT-bUHSRJ6KccaOHc-kCjpA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > From: Gene Chen <gene_chen@richtek.com>
> > >
> > > Add LED_COLOR_ID_MOONLIGHT definitions
> >
> > Why is moonlight a color? Camera flashes are usually white, no?
> >
> > At least it needs a comment...
> >
> > Best regards,
> >                                                                 Pavel
> >
>=20
> Moonlight has more current level(150mA) from general RGB LED (24mA).
> It can be used as night-light and usually use color AMBER.
> Camera flashes are usually use two flash LED. One is YELLOW, and one
>is WHITE.

=46rom what I seen, night-lights are usually differetent "temperatures"
of white. Cool white + warm white.

I believe "warm white" would be easier to understand than
"moonlight"...

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+2IlAACgkQMOfwapXb+vLdBQCgw6Mjjjv/SdV6hkGTYQl/7cQh
GQgAn3WXoyjkpxWPpQZ9WyjNM0ewu0S2
=DlK0
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
