Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1671E28DADA
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 10:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbgJNILU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 04:11:20 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55372 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgJNILU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Oct 2020 04:11:20 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B889C1C0B87; Wed, 14 Oct 2020 10:11:17 +0200 (CEST)
Date:   Wed, 14 Oct 2020 10:11:17 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Udo van den Heuvel <udovdh@xs4all.nl>
Cc:     Takashi Iwai <tiwai@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>
Subject: Re: disabling CONFIG_LED_CLASS (SND_HDA_CODEC_REALTEK)
Message-ID: <20201014081116.GC29881@amd>
References: <9fc679e9-e9a9-ad80-b24c-f04489b98aa7@xs4all.nl>
 <27e159be-4376-e87b-5e60-803bc3749ec2@infradead.org>
 <eadc23e7-b383-e2fc-6e20-ed22745d0bfc@xs4all.nl>
 <2739e1fd-75c6-4e43-cd79-9028479f91bf@infradead.org>
 <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
 <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
 <s5hblh5mele.wl-tiwai@suse.de>
 <s5ha6wpmei5.wl-tiwai@suse.de>
 <20201014075853.GB29881@amd>
 <056a8933-378f-30f2-c7af-5514d93d3c36@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline
In-Reply-To: <056a8933-378f-30f2-c7af-5514d93d3c36@xs4all.nl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-10-14 10:05:42, Udo van den Heuvel wrote:
> On 14-10-2020 09:58, Pavel Machek wrote:
> > Contrary to his claims, Udo very probably has LEDs in his systems...
>=20
> We have a visible power LED.
> WE have a HDD LED.

> The board has LEDs, yes, but the SilverStone Fortress FT02 hides them
> fairly well.
> I did not ask for LEDs nor need them this way.
> It's a computer, not a disco-light or anything like that.

And you probably have numlock LED.

> Whether the code is big or not does not matter, it is a matter of being
> able to select what one needs without getting bothered with other code
> that will do nothing.

No.

Additional config options have costs, too, and we don't want to
support gazillion config options. LED core should be small enough that
it does not matter. Sound was inventing its own "tiny LED core"
before.

> So please consider.

I did. Answer is no. Please accept it.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+GsqQACgkQMOfwapXb+vKstQCgxBdpLaykEQKd4ktnkUrUcz10
NwgAoLEJrV5eMh7YSG6O0cSOLB1wIHop
=1j4b
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
