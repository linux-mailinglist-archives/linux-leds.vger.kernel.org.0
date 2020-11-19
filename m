Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B50862B8DB2
	for <lists+linux-leds@lfdr.de>; Thu, 19 Nov 2020 09:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbgKSIif (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Nov 2020 03:38:35 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:43342 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgKSIif (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Nov 2020 03:38:35 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 69BA71C0B87; Thu, 19 Nov 2020 09:38:31 +0100 (CET)
Date:   Thu, 19 Nov 2020 09:38:30 +0100
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
Message-ID: <20201119083830.GA31871@amd>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd>
 <CAE+NS36rnHzhdk5Os+vL=uK225HJT-bUHSRJ6KccaOHc-kCjpA@mail.gmail.com>
 <20201119074416.GA27576@amd>
 <CAE+NS3430=-WynyXQr+8MghmtmiCR+2VeTt4aD5cT8UmA+1Qrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
In-Reply-To: <CAE+NS3430=-WynyXQr+8MghmtmiCR+2VeTt4aD5cT8UmA+1Qrg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Moonlight has more current level(150mA) from general RGB LED (24mA).
> > > It can be used as night-light and usually use color AMBER.
> > > Camera flashes are usually use two flash LED. One is YELLOW, and one
> > >is WHITE.
> >
> > From what I seen, night-lights are usually differetent "temperatures"
> > of white. Cool white + warm white.
> >
> > I believe "warm white" would be easier to understand than
> > "moonlight"...
>=20
> ACK, I will change color "LED_COLOR_ID_WHITE"

If you have two leds that differ only in one being "cool white" and
one being "warm white", you may need to introduce defines for one of
them.

If not, keeping "LED_COLOR_ID_WHITE" is enough.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+2LwYACgkQMOfwapXb+vJyQACfYV2csyAq22QDr0kWaNLt5aNT
ifoAn1b7uWaQPwk6nYu5GiDDzNFsPLup
=d2jd
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
