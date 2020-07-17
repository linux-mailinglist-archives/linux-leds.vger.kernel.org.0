Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B1D22361D
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jul 2020 09:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726113AbgGQHoP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Jul 2020 03:44:15 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:50840 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgGQHoO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Jul 2020 03:44:14 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 577D91C0BD4; Fri, 17 Jul 2020 09:44:11 +0200 (CEST)
Date:   Fri, 17 Jul 2020 09:44:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Alexandre Courbot <gnurou@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: add NCT6795D driver
Message-ID: <20200717074410.GA8895@amd>
References: <20200713134114.137265-1-gnurou@gmail.com>
 <20200714223344.GA20740@amd>
 <CAAVeFuKomLcAue9rGXhK3Uc=H+v9ZLBA84Ozr_rZDRQMYeC=dg@mail.gmail.com>
 <17fe52a2-73ff-b547-8a59-5df009c929c8@gmail.com>
 <CAAVeFuJQCp7Fpqx3nUHMy29Jw1pLNoQtxRw3qxfEf3YKnrm0fw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <CAAVeFuJQCp7Fpqx3nUHMy29Jw1pLNoQtxRw3qxfEf3YKnrm0fw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > >>> Add support for the LED feature of the NCT6795D chip found on some
> > >>> motherboards, notably MSI ones. The LEDs are typically used using a
> > >>> RGB connector so this driver creates one LED device for each color
> > >>> component.
> > >>
> > >> Ok, let me take a look. What entries does it present in /sys?
> > >
> > > Right now these 3 directories in /sys/class/leds:
> > >
> > > nct6795d:blue:
> > > nct6795d:green:
> > > nct6795d:red:
> > >
> > > with the usual suspects `brightness` and `max_brightness` in each. I
> > > am not 100% sure I got the names right so please let me know if that
> > > is not correct.
> >
> > You miss LED function, that should be in the second section.

third section?

> The reason for not having a function at the moment is that I took a
> look at include/dt-bindings/leds/common.h and could not find any
> function that could reasonably apply. This basically controls a RGB
> connector on the motherboard which serves no particular function - you
> can plug a RGB fan or anything else you want and control it in any
> fashion. Is there a function that applies to this use-case?

This is normally used for motherboard lightning, right? I believe this
is getting common on gaming boards, and we want common support for
that.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8RVsoACgkQMOfwapXb+vIYJQCeNv8XzLypVkfOvVKCaRH1eEgF
d68AnRg1XriCFpqeZJE1euaJT4p+qWLa
=G7Tf
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
