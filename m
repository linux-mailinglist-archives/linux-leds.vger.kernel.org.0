Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 667C91090E2
	for <lists+linux-leds@lfdr.de>; Mon, 25 Nov 2019 16:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbfKYPRE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 25 Nov 2019 10:17:04 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54402 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbfKYPRE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 25 Nov 2019 10:17:04 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7CD081C2007; Mon, 25 Nov 2019 16:17:02 +0100 (CET)
Date:   Mon, 25 Nov 2019 16:17:01 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>, dtor@google.com,
        Guenter Roeck <linux@roeck-us.net>,
        Dan Murphy <dmurphy@ti.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Oleh Kravchenko <oleg@kaa.org.ua>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Simon Shields <simon@lineageos.org>
Subject: Re: [PATCH v5 03/26] dt-bindings: leds: Add LED_FUNCTION definitions
Message-ID: <20191125151701.GB3816@amd>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
 <20190609190803.14815-4-jacek.anaszewski@gmail.com>
 <CAMuHMdXkQCVXdsbS1Tf+7wkafJ4JxhxXeh4R7OWOz5uGs-jL5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXkQCVXdsbS1Tf+7wkafJ4JxhxXeh4R7OWOz5uGs-jL5Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-11-15 14:01:50, Geert Uytterhoeven wrote:
> Hi Jacek,
>=20
> On Sun, Jun 9, 2019 at 9:09 PM Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
> > Add initial set of common LED function definitions.
> >
> > Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>=20
> > --- a/include/dt-bindings/leds/common.h
> > +++ b/include/dt-bindings/leds/common.h
> > @@ -30,4 +31,45 @@
> >  #define LED_COLOR_ID_IR                7
> >  #define LED_COLOR_ID_MAX       8
> >
> > +/* Standard LED functions */
> > +#define LED_FUNCTION_ACTIVITY "activity"
>=20
> What's the appropriate function for "general purpose" or "user" LEDs on
> development boards, where the LEDs don't have fixed functions, unlike
> on real products?
> Perhaps just LED_FUNCTION_INDICATOR?

I'd prefer such LEDs to not exist :-).

> I noticed your very initial submission defined LED_FUNCTION_USER "user".
> I couldn't find an explanation for the rationale behind its removal in la=
ter
> revisions, or any discussion asking for that.

There are "user" leds even on non-development boads... one is labeled
"scroll lock".

For the development board, I'd actually prefer to assign some
reasonable functions. If vendor BSP uses the LEDs for disk and network
indicators (for example) I'd just mark it as a disk and network
LEDs...

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3b8GwACgkQMOfwapXb+vKOngCeMPIGUI5sLmxz2QWwUEawrSyU
Wu4An2/gtTGMzwzqq4R6aHay3jUaFgBo
=JtRl
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
