Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5C631F813
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 12:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbhBSLR6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 06:17:58 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:49270 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbhBSLR5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 06:17:57 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 927501C0B80; Fri, 19 Feb 2021 12:16:59 +0100 (CET)
Date:   Fri, 19 Feb 2021 12:16:59 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity
 from DT
Message-ID: <20210219111659.GI19207@duo.ucw.cz>
References: <20210204143738.28036-1-schuchmann@schleissheimer.de>
 <20210204145308.GC14305@duo.ucw.cz>
 <DB8P190MB0634587826F57667BB3BBB6CD9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210205103438.GB27854@amd>
 <DB8P190MB063473FEA37E69E6DF6BC5F6D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="poJSiGMzRSvrLGLs"
Content-Disposition: inline
In-Reply-To: <DB8P190MB063473FEA37E69E6DF6BC5F6D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--poJSiGMzRSvrLGLs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > ? Does not make sense and changelog does not help.
> > >
> > > This is an unused variable which is in the driver
> > > (same as the regulator). Should I provide a patch on its own for that
> > > or just describe in the changelog?
> >=20
> > Lets do separate patch here. DT changes will need Ack from Rob, this
> > can go in directly.
>=20
> Okay, I will submit a separate patch
>=20
> > Can you or Dan submit patch getting the regulator support to work? If
> > not, I guess we should remove the regulator support after all.
>=20
> To be true I am fairly new to the kernel and have no idea
> how to test this. So no, I don't want provide a patch (except
> for removing), sorry.

No problem. It seems Andy submitted series for this.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--poJSiGMzRSvrLGLs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC+eKwAKCRAw5/Bqldv6
8k0GAJ9eBnOqKXpNbD64WsGkaDn2QJtn9QCfZh77uCdQ3ZmsZvhJHWa9JpKOqrg=
=ztOQ
-----END PGP SIGNATURE-----

--poJSiGMzRSvrLGLs--
