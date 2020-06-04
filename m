Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92E141EE601
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 15:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbgFDNxz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 09:53:55 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35114 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728791AbgFDNxz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 09:53:55 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6F60D1C0BD2; Thu,  4 Jun 2020 15:53:54 +0200 (CEST)
Date:   Thu, 4 Jun 2020 15:53:54 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        Jonas Gorski <jonas.gorski@gmail.com>, rpurdie@rpsys.net
Subject: Re: [PATCH v3] leds-bcm6328: support second hw blinking interval
Message-ID: <20200604135354.GJ7222@duo.ucw.cz>
References: <20200424133243.27303-1-noltari@gmail.com>
 <20200512100136.956872-1-noltari@gmail.com>
 <20200604132406.GD7222@duo.ucw.cz>
 <CE3312E5-8B8C-403D-81D6-B5C893C60586@gmail.com>
 <20200604134043.GG7222@duo.ucw.cz>
 <CA2F5175-2751-40F2-B38B-61A65C5AFD48@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="liqSWPDvh3eyfZ9k"
Content-Disposition: inline
In-Reply-To: <CA2F5175-2751-40F2-B38B-61A65C5AFD48@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--liqSWPDvh3eyfZ9k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-06-04 15:43:35, =C1lvaro Fern=E1ndez Rojas wrote:
> Hi Pavel,
>=20
> > El 4 jun 2020, a las 15:40, Pavel Machek <pavel@ucw.cz> escribi=F3:
> >=20
> > On Thu 2020-06-04 15:35:06, =C1lvaro Fern=E1ndez Rojas wrote:
> >> HI Pavel,
> >>=20
> >> Right now, only one hw blinking interval is supported, but up to two h=
w blinking intervals can be configured in the controller.
> >> This patch just adds support for the second hw blinking interval.
> >>=20
> >> BTW, I will send v4 which should clarify that each LED can be configur=
ed in 4 modes:
> >> 0: On
> >> 1: HW Blinking (Interval 1)
> >> 2: HW Blinking (Interval 2)
> >> 3: Off
> >>=20
> >> Until now we were only using 3 modes:
> >> 0: On
> >> 1: HW Blinking (Interval 1)
> >> 3: Off
> >=20
> > So the issue is .... there are like 5 LEDs and they can be on or off
> > or blinking with at most 2 different intervals?
> > 								Pavel
>=20
> Yes, the controller supports two different blinking delays (intervals), a=
nd LEDs can either be on, off or assigned to one of the two blinking delays.
> However, the current upstream controller only supports one blinking delay=
=2E This patch just adds support for both blinking delays instead of just o=
ne.
>

Ok. Please put this kind of summary in comment somewhere.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--liqSWPDvh3eyfZ9k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXtj88gAKCRAw5/Bqldv6
8px9AKCeS48GsItNQRkuTdGlT1PMJELDnQCZAfYR0wO80Pv8vCeeMqywGhfkInk=
=h3FK
-----END PGP SIGNATURE-----

--liqSWPDvh3eyfZ9k--
