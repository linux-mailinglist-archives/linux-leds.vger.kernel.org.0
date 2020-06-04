Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF0C1EE4C7
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 14:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgFDMvN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 08:51:13 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48010 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgFDMvN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 08:51:13 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8005E1C0BD2; Thu,  4 Jun 2020 14:51:11 +0200 (CEST)
Date:   Thu, 4 Jun 2020 14:51:11 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh@kernel.org>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        devicetree@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v25 01/16] dt: bindings: Add multicolor class dt bindings
 documention
Message-ID: <20200604125111.GA7222@duo.ucw.cz>
References: <20200526164652.2331-1-dmurphy@ti.com>
 <20200526164652.2331-2-dmurphy@ti.com>
 <20200527014902.GA859634@bogus>
 <20200527133948.GA5011@amd>
 <CAL_Jsq+rS=awLC_maPGjeWhh1Sb9U31xfvLecVe9sPTh83eDBw@mail.gmail.com>
 <20200602200436.GA6535@amd>
 <CAL_JsqLaycpi4EtXK-7GV49fm0GbPmPsrNwz2WSBFFO_zdQG0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLaycpi4EtXK-7GV49fm0GbPmPsrNwz2WSBFFO_zdQG0Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-06-02 15:44:32, Rob Herring wrote:
> On Tue, Jun 2, 2020 at 2:04 PM Pavel Machek <pavel@ucw.cz> wrote:
> >
> > On Wed 2020-05-27 08:35:06, Rob Herring wrote:
> > > On Wed, May 27, 2020 at 7:39 AM Pavel Machek <pavel@ucw.cz> wrote:
> > > >
> > > > Hi!
> > > >
> > > > Thanks for reviews!
> > > >
> > > > > > +additionalProperties: false
> > > > > > +...
> > > > > > diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> > > > >
> > > > > This isn't a binding file. Belongs in another patch.
> > > >
> > > > These constants are directly related to the binding. It makes sense=
 to
> > > > go in one patch...
> > >
> > > Yes, the header does go in this patch, but kernel subsystem files do =
not.
> > >
> > > Part of the reason for separating is we generate a DT only repository
> > > which filters out all the kernel code. Ideally this is just filtering
> > > out commits and the commit messages still make sens
> >
> > Well, but the patch can't be split like that. Otherwise we risk null
> > pointer dereferences when one part is applied but not the second one.
>=20
> There's no risk because you are supposed to apply both patches. I
> don't apply binding patches that are a part of a series like this.

Yes, this is always guaranteed to happen, because "git bisect"
understand patch series. Oh, wait.

Patches are supposed to be correct on their own. If your repository
filtering can not handle that, you need to fix that...

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXtjuPwAKCRAw5/Bqldv6
8jSDAJoC/expAKsQ5LCTCYIQ6CmDKUaorQCfduMu1F4bMFrldhHCCKp48N1qVy4=
=Hk8c
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
