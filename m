Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D828CBFE3
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 17:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390104AbfJDP6p (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 11:58:45 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:56666 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389794AbfJDP6p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 11:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=sOKlWykXlh+1/D/OVbEd1hyxD1BzgK7qGyNgFtzbN8U=; b=U469b3ccy/WKsbY0yysCHSowX
        ioxTGlZ4liWahE1r4i+sR0ALlJagyRLQv8v22lRdjSTNTDPeKRoCpdunhDypbDvr5MDbEGc82BcBG
        Opo4hB+zxAsfW75C94nYIMP+sr0X5uqSJxRROt3ao+NEtcHcUS/lTfaECHPbpOXRFDa/A=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iGPyZ-0003TW-6m; Fri, 04 Oct 2019 15:58:39 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 52C2D2741EF0; Fri,  4 Oct 2019 16:58:38 +0100 (BST)
Date:   Fri, 4 Oct 2019 16:58:38 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     mark.rutland@arm.com, daniel.thompson@linaro.org,
        Liam Girdwood <lgirdwood@gmail.com>, tomi.valkeinen@ti.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        pavel@ucw.cz, lee.jones@linaro.org, linux-leds@vger.kernel.org,
        dmurphy@ti.com
Subject: Re: Should regulator core support parsing OF based fwnode?
Message-ID: <20191004155838.GE4866@sirena.co.uk>
References: <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
 <20191003183554.GA37096@sirena.co.uk>
 <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
 <20191003194140.GE6090@sirena.co.uk>
 <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
 <20191004113942.GB4866@sirena.co.uk>
 <b6318ba5-e76e-dc1c-6921-a702abf6749c@ti.com>
 <20191004144029.GC4866@sirena.co.uk>
 <6df68ecb-f92e-fd9c-7f55-f66fa463263a@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jKBxcB1XkHIR0Eqt"
Content-Disposition: inline
In-Reply-To: <6df68ecb-f92e-fd9c-7f55-f66fa463263a@ti.com>
X-Cookie: core error - bus dumped
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--jKBxcB1XkHIR0Eqt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2019 at 05:13:13PM +0200, Jean-Jacques Hiblot wrote:
> On 04/10/2019 16:40, Mark Brown wrote:

> > Why is the LED core populating anything?  Is the LED core copying bits
> > out of the struct device for the actual device into a synthetic device
> > rather than passing the actual device in?  That really doesn't seem like
> > a good idea, it's likely to lead to things like this where you don't
> > copy something that's required (or worse where something directly in the
> > struct device that can't be copied is needed).

> This is not a copy of a device of parent's of_node or something like that.

> You can think of a LED controller as a bus. It 'enumerates' its children
> LED, create the children devices (one per LED) and provides the functions=
 to
> interact with them.

> The device node we are talking about here is a per-LED thing, it is a chi=
ld
> node of the node of the LED controller.

> here is an example:
>=20
> =A0=A0=A0 tlc59108: tlc59116@40 { /* this is the node for the LED control=
ler */
> =A0=A0=A0 =A0=A0=A0 status =3D "okay";
> =A0=A0=A0 =A0=A0=A0 #address-cells =3D <1>;
> =A0=A0=A0 =A0=A0=A0 #size-cells =3D <0>;
> =A0=A0=A0 =A0=A0=A0 compatible =3D "ti,tlc59108";
> =A0=A0=A0 =A0=A0=A0 reg =3D <0x40>;
>=20
> =A0=A0=A0 =A0=A0=A0 backlight_led: led@2 { /* this is the node of one LED=
 attached to
> pin#2 of the LED controller */
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 power-supply =3D <&bkl_fixed>;
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 reg =3D <0x2>;
> =A0=A0=A0 =A0=A0=A0 };

Regulator supplies are supposed to be defined at the chip level rather
than subfunctions with names corresponding to the names on the chip.
This ensures that all chips look similar when you're mapping the
schematic into a DT, you shouldn't need to know about the binding for a
given chip to write a DT for it and if multiple people (perhaps working
on different OSs) write bindings for the same chip there should be a
good chance that they come up with the same mapping.  The supply_alias
interface is there to allow mapping these through to subfunctions if
needed, it looks like the LED framework should be using this.

That said if you are doing the above and the LEDs are appearing as
devices it's extremely surprising that their of_node might not be
initialized.

--jKBxcB1XkHIR0Eqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2XbC0ACgkQJNaLcl1U
h9CmMwf9ECgZ2ghDJUYkumszQL7edht7aQckB9pgZYkckEmwTq38eVilMfRXG/tJ
mRbJ2jFnduiEXOXn5qNm+bj918hFDgfAPdAVOx6ZFCz79rtrR6eqNK7lZoVnalln
tt62hjS3w74fYHKokbcd6s59q0dV1oVSVwxLx6ZENzkhZOA8mgp+xx43Tx2NrQVN
rO+XtTKTMsAnvEYJZYT2K9PkvPCNb6358cr/etapbLTHEje7priUojy2vRwoh1CA
Gwm5fir1Sxr3DL9MKQZ+Z9DMPWEQWURu+Ewslbhcb0jxKzPIP9vcJTKrlRW8JBhl
94yp9Hat1NShg+SsPvwQ3ROQmDssTQ==
=BPJg
-----END PGP SIGNATURE-----

--jKBxcB1XkHIR0Eqt--
