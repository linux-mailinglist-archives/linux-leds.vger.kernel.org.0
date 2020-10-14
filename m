Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0BC628DB3E
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 10:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgJNI1w (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 04:27:52 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57066 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbgJNI1w (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Oct 2020 04:27:52 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 75E391C0B87; Wed, 14 Oct 2020 10:27:53 +0200 (CEST)
Date:   Wed, 14 Oct 2020 10:27:52 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Udo van den Heuvel <udovdh@xs4all.nl>
Cc:     Takashi Iwai <tiwai@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>
Subject: Re: disabling CONFIG_LED_CLASS (SND_HDA_CODEC_REALTEK)
Message-ID: <20201014082752.GA31728@amd>
References: <eadc23e7-b383-e2fc-6e20-ed22745d0bfc@xs4all.nl>
 <2739e1fd-75c6-4e43-cd79-9028479f91bf@infradead.org>
 <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
 <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
 <s5hblh5mele.wl-tiwai@suse.de>
 <s5ha6wpmei5.wl-tiwai@suse.de>
 <20201014075853.GB29881@amd>
 <056a8933-378f-30f2-c7af-5514d93d3c36@xs4all.nl>
 <20201014081116.GC29881@amd>
 <2be6e184-97d4-a2b1-a500-6ea3528cff37@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <2be6e184-97d4-a2b1-a500-6ea3528cff37@xs4all.nl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-10-14 10:22:01, Udo van den Heuvel wrote:
> On 14-10-2020 10:11, Pavel Machek wrote:
> >> It's a computer, not a disco-light or anything like that.
> >=20
> > And you probably have numlock LED.
>=20
> On the case? no way.
> It is on the keyboard, a separate device, and already has a function.
> We also have a caps lock LED and scroll lock LED there, with separate
> functions.
> I do not need 'extra' functionality for those.
>=20
> > Additional config options have costs, too, and we don't want to
> > support gazillion config options.=20
>=20
> That is not the issue.
> One should have thought about stuff beforehand.

We did. And decided this is best solution.

> The non-selectability is not my fault.

It also does not affect you in any way.

Feel free to go to the mic LED discussion to see why we did it like
this. Then you can come up with better solution for problem at hand.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+GtogACgkQMOfwapXb+vKayQCdGTNvHRcPHVDdAHQuiZy/dWhE
ODEAn24xZ2THmW5GhEwvQEVN6M8lSC7g
=Hwxk
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
