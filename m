Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3529B287235
	for <lists+linux-leds@lfdr.de>; Thu,  8 Oct 2020 12:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729322AbgJHKFL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Oct 2020 06:05:11 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:45084 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbgJHKFL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Oct 2020 06:05:11 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CF3731C0B8A; Thu,  8 Oct 2020 12:05:08 +0200 (CEST)
Date:   Thu, 8 Oct 2020 12:05:08 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     Marek Behun <marek.behun@nic.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Message-ID: <20201008100508.GA16084@duo.ucw.cz>
References: <20201006165850.17790-1-vadimp@nvidia.com>
 <20201007113105.GE12224@duo.ucw.cz>
 <20201007142049.02d8c3ba@nic.cz>
 <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008075619.GB32424@amd>
 <DM6PR12MB389877E86421231E18EF7DCDAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008105550.44fa3165@nic.cz>
 <DM6PR12MB3898D2BDC4AC32036E792548AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <DM6PR12MB3898D2BDC4AC32036E792548AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Vadim, the LED core constructs names in form
> >   device:color:function-enumerator
> > so if you must have number there, IMO it should be
> >   mlxreg:green:status-48
> >   mlxreg:green:status-56
> >   ...
>=20
> But why you consider it as function enumerator?
> For example card48, card56 are two different devices
> of same type.
> Both have 'status' LED.

It would help if you could explain what "mlxreg" is.

And yes, if you have some kind of device with a status LED, then you
can put that into the first card. For example sda::status would be
accetpable. But cardXX is way too generic.

Perhaps you can explain what "card" is in this context? What is its
main function?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX37kVAAKCRAw5/Bqldv6
8pIkAJ4vuFIn1VkBy1WwOxIFCbKowE7jXgCeIdD7N4zFisudEa334FkJjxZnmw4=
=26oj
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
