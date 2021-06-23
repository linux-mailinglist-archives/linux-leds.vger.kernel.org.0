Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2513B21DF
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jun 2021 22:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhFWUlp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Jun 2021 16:41:45 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37468 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWUlp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Jun 2021 16:41:45 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6840A1C0B76; Wed, 23 Jun 2021 22:39:26 +0200 (CEST)
Date:   Wed, 23 Jun 2021 22:39:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jafar Akhondali <gigelaknak@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        mauro.chehab@huawei.com,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: LEDs with hardware-accelerated patterns, suspend indication
Message-ID: <20210623203925.GI8540@amd>
References: <20210526153040.GA4537@amd>
 <5fbbab4f-3e22-5a4a-eea8-2531ee165cc4@redhat.com>
 <CAMW3L+19tP_9=+8j8LLjqCGDaaVZ86UMm9NwLbbpA77zOYnr1Q@mail.gmail.com>
 <79988fe2-7b3d-7485-131c-4f654ec6d8b8@redhat.com>
 <CAMW3L+13O4jXyp1LVtuxhpXP_fkfWXi9JoNS8FYUAMHaJBGKZg@mail.gmail.com>
 <17ec2040-24e9-4090-e64b-8048f0b4005b@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hABqaeELJqnDDeDE"
Content-Disposition: inline
In-Reply-To: <17ec2040-24e9-4090-e64b-8048f0b4005b@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--hABqaeELJqnDDeDE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Sorry for the late reply.
> > there are two categories of keyboard lighting modes:
> > 1. static
> > 2. dynamic
> >=20
> > In static mode, any of 4 zones can be configured to show specific color,
> > independently.
> >=20
> > In dynamic mode, there is no control over specific zones.
> > It's only possible to set some: color, speed, direction
> > and: [R]ed,[G]reen, [B]lue
> >=20
> > so in dynamic mode, the user can't control zones,
> > the dynamic effects take care of that.
>=20
> So we have 4 zones, which are individual controllable, so which should
> probably be modeled as individual LED class devices. But when we enable
> the hardware effects, then the individual addressing goes away and we
> set one effect which applies to all zones.
>=20
> Jafar, do I understand this correctly?
>=20
> Pavel, how should this be mapped to the led-class API?

Fun :-).

> Some ideas:
>=20
> a) Only add the new lpattern to the main zone?
> 2) Add the new lpattern to all zones, but only make it
> writable in the main zone ?

Require lpattern in all zones to be same and active before actually
enabling the pattern?

Decide lpattern is not suitable for this and figure out what to with
multi-LED triggers? Someone wanted them for "meters" (CPU load 25% 50%
75% 100% LED bar)...

Skip this hardware feature for now. We don't have to support
everything?

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--hABqaeELJqnDDeDE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmDTm/0ACgkQMOfwapXb+vL3GgCeLxqiGOHMfMCblFbN8WT62Lug
nmoAnjag/BBo2rTZcTG6sCUoCiRio867
=Xnzh
-----END PGP SIGNATURE-----

--hABqaeELJqnDDeDE--
