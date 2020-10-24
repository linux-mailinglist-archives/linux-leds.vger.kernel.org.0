Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF8F297B42
	for <lists+linux-leds@lfdr.de>; Sat, 24 Oct 2020 09:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759925AbgJXHpT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Oct 2020 03:45:19 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51928 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759924AbgJXHpT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Oct 2020 03:45:19 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BE8501C0B7C; Sat, 24 Oct 2020 09:45:17 +0200 (CEST)
Date:   Sat, 24 Oct 2020 09:45:17 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Strange timer LED behavior
Message-ID: <20201024074516.GA32500@amd>
References: <20201020122149.GA19856@duo.ucw.cz>
 <DF67F732-7B99-4C32-A7E9-4595E2B1E82A@digi.com>
 <20201020180813.GA25906@duo.ucw.cz>
 <CF36FC5F-6FA9-4797-A6D6-6533D795DAD1@digi.com>
 <20201020183300.GB25906@duo.ucw.cz>
 <78785807-3DB7-4A70-B135-2B20A260EA57@digi.com>
 <20201020184054.GC25906@duo.ucw.cz>
 <31E37AC2-589B-41F0-B7AA-9E520160F8A6@digi.com>
 <20201022100646.GA26350@duo.ucw.cz>
 <6C8DDBC1-FCAF-411A-AA38-108CEE58EC9C@digi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <6C8DDBC1-FCAF-411A-AA38-108CEE58EC9C@digi.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-10-22 11:34:34, Bollinger, Seth wrote:
>=20
> >>> Yeah. Don't do that! :-). For solid on/solid off, just turn the
> >>> trigger off. For blinking, use timer trigger.
> >>=20
> >> If I want to go from on or off to flashing, I need to set the timer tr=
igger, which results in a 500 ms flash rate until the real rates are set.  =
This results in a noticeably different first blink.  I guess we=E2=80=99re =
looking for smooth control of the LED.
> >>=20
> >=20
> > Okay, that's fair requirement, I guess.
> >=20
> > If you have proposals how to solve this in a nice way, go ahead.
> >=20
> > As a hack...
> >=20
> > I believe you can go from on to off like this:
> >=20
> > on:9999,off:0 -> on:9999,off:1 -> on:1,off:9999 -> on:0,off:9999.
> >=20
> > (And I believe we should document this somewhere).
>=20
>=20
> I hate to respond to this, because it makes me look stupid, but=E2=80=A6 =
 :)
>=20
> The problem turned out to be that the original author was using buffered =
IO to do the sysfs writes (which I didn=E2=80=99t notice until yesterday). =
 When I switched to a different method, the writes were ordered correctly a=
nd didn=E2=80=99t glitch.
>=20
> Apologies for bothering you all, and great thanks for your assistance!

Hehe, okay. Good that it is solved.

(And yes, such bugs happen, forgetting about buffered i/o is quite
common).

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+T24wACgkQMOfwapXb+vIjFACfTWm3A7ETbPVzEO5VM88ZFJCu
Y+UAmgMFO6wEiefVmMwTdDha+v+xfpRA
=rrMX
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
