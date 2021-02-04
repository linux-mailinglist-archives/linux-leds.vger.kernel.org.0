Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B3A30F55E
	for <lists+linux-leds@lfdr.de>; Thu,  4 Feb 2021 15:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236851AbhBDOtO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Feb 2021 09:49:14 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:43674 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236725AbhBDOs3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Feb 2021 09:48:29 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6E8E21C0B77; Thu,  4 Feb 2021 15:47:28 +0100 (CET)
Date:   Thu, 4 Feb 2021 15:47:28 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: lp50xx: remove unused regulator
Message-ID: <20210204144728.GA14305@duo.ucw.cz>
References: <20210203083408.2534-1-schuchmann@schleissheimer.de>
 <20210203090249.GA14154@amd>
 <2e9dff78-7fde-404d-6fad-6aeedf1145d1@ti.com>
 <20210203142336.GA12369@duo.ucw.cz>
 <0ddd5bdf-0484-3c20-1b6e-5573d1ff90f6@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <0ddd5bdf-0484-3c20-1b6e-5573d1ff90f6@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2021-02-03 10:02:00, Dan Murphy wrote:
> Pavel
>=20
> On 2/3/21 8:23 AM, Pavel Machek wrote:
> > On Wed 2021-02-03 07:49:35, Dan Murphy wrote:
> > > Pavel
> > >=20
> > > On 2/3/21 3:02 AM, Pavel Machek wrote:
> > > > On Wed 2021-02-03 08:34:08, Sven Schuchmann wrote:
> > > > > The regulator for vled-supply is unused in the driver.
> > > > > It is just assigned from DT and disabled in lp50xx_remove.
> > > > > So the code can be removed from the driver.
> > > > Dan, what is going on here? Do we need to also enable the regulator,
> > > > or is the removal correct thing to do?
> > > >=20
> > > I think it would be better to do an enable as opposed to removing the=
 code.
> > >=20
> > > This would be needed especially in applications that have to meet str=
ict
> > > power management requirements.
> > >=20
> > > Users may want to disable or enable the regulator during suspend/resu=
me.
> > > Otherwise it would be considered always-on and the regulator does not=
 need
> > > to be populated.
> > Do you have set up where this is needed and you can test this? Will
> > you submit the fixes?
>=20
> No I use an always on regulator in my setup. I have no managed supplies
> exposed.

Hmm, that is not ideal :-(. Can you try to provide patch, anyway?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYBwJAAAKCRAw5/Bqldv6
8sggAJ4zBz1csm1BfQrxFGY4y05ScEhujQCgj4moxaLa/wt98rt3OYfnoCuDJO4=
=+oon
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
