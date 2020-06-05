Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326E01EF712
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2020 14:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgFEMLV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Jun 2020 08:11:21 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48862 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgFEMLU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 Jun 2020 08:11:20 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3A9011C0BD2; Fri,  5 Jun 2020 14:11:19 +0200 (CEST)
Date:   Fri, 5 Jun 2020 14:11:18 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh@kernel.org>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        devicetree@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v25 01/16] dt: bindings: Add multicolor class dt bindings
 documention
Message-ID: <20200605121118.GC31680@duo.ucw.cz>
References: <20200526164652.2331-1-dmurphy@ti.com>
 <20200526164652.2331-2-dmurphy@ti.com>
 <20200527014902.GA859634@bogus>
 <20200527133948.GA5011@amd>
 <CAL_Jsq+rS=awLC_maPGjeWhh1Sb9U31xfvLecVe9sPTh83eDBw@mail.gmail.com>
 <20200602200436.GA6535@amd>
 <CAL_JsqLaycpi4EtXK-7GV49fm0GbPmPsrNwz2WSBFFO_zdQG0Q@mail.gmail.com>
 <20200604125111.GA7222@duo.ucw.cz>
 <CAL_JsqJ1XOYXyqj_VO2cFigVT=k5NTX3BO6RsDqQ-+pDBNJsrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ1XOYXyqj_VO2cFigVT=k5NTX3BO6RsDqQ-+pDBNJsrw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > There's no risk because you are supposed to apply both patches. I
> > > don't apply binding patches that are a part of a series like this.
> >
> > Yes, this is always guaranteed to happen, because "git bisect"
> > understand patch series. Oh, wait.
>=20
> What!? If the binding patch with the header comes first, how would
> bisect build the driver change without the header?

The driver is already in tree, and includes array of strings. When you
change the define, you need to update the array, too, because you
don't want to have invalid value in there.

> > Patches are supposed to be correct on their own. If your repository
> > filtering can not handle that, you need to fix that...
>=20
> I'm just asking you to follow the process that *everyone* else is
> following and works. It's not really about the repository filtering.
> That doesn't care. A binding ABI is defined by the schema and any
> defines it has. That is the logical unit that stands on its own.

It does not work in this case.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXto2ZgAKCRAw5/Bqldv6
8rBGAKCkPxiODKIJjKg68MpWT85olQkZqACgqZJOnmhVx7xwFXtkwTDiHMAe8mM=
=vUEk
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--
