Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEED30BB02
	for <lists+linux-leds@lfdr.de>; Tue,  2 Feb 2021 10:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232571AbhBBJdi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Feb 2021 04:33:38 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:53684 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbhBBJdM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Feb 2021 04:33:12 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AEB9F1C0B76; Tue,  2 Feb 2021 10:32:29 +0100 (CET)
Date:   Tue, 2 Feb 2021 10:32:29 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jens Axboe <axboe@kernel.dk>, Dan Murphy <dmurphy@ti.com>,
        linux-ide@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: 5.11 new lockdep warning related to led-class code (also may
 involve ata / piix controller)
Message-ID: <20210202093228.GA29131@amd>
References: <b204637d-3b72-8320-8a62-f075467d8681@redhat.com>
 <20210112223015.GB28214@duo.ucw.cz>
 <f344f1db-1a7a-0a80-1cb1-f9c3fbf83abd@redhat.com>
 <0ec34bca-f7e0-8954-c253-d07ed6b71b80@redhat.com>
 <20210127220134.GC23419@amd>
 <cc1cac99-e3de-9585-bfa0-db7b013e8a80@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <cc1cac99-e3de-9585-bfa0-db7b013e8a80@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Is it a regression? AFAIK it is a bug that has been there
> > forever... My original plan was to simply wait for 5.12, so it gets
> > full release of testing...
>=20
> It may have been a pre-existing bug which got triggered by libata
> changes?

Fixes tag suggests it is rather old.

> I don't know. I almost always run all my locally build kernels with lockd=
ep
> enabled and as the maintainer of the vboxvideo, vboxguest and vboxsf guest
> drivers in the mainline kernel I quite often boot local build kernels ins=
ide
> a vm.
>=20
> So I believe that lockdep tripping over this is new in 5.11, which is why
> I called it a regression.
>=20
> And the fix seems very safe and simple, so IMHO it would be good to get
> this into 5.11

It is in 5.11 now, and also -stable kernels. (Which suprised me a
bit).

Testing would be welcome.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmAZHCwACgkQMOfwapXb+vJIhwCffqEyb87hmw489lVr2xJf68p9
s4gAnjqioizHCLkcak/HHiwFMBgzwn19
=kcnu
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
