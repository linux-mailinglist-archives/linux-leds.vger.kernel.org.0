Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0CC19F1A7
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2020 10:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgDFIeZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Apr 2020 04:34:25 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51916 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgDFIeZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Apr 2020 04:34:25 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 136311C44FE; Mon,  6 Apr 2020 10:34:24 +0200 (CEST)
Date:   Mon, 6 Apr 2020 10:34:23 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Marek Behun <marek.behun@nic.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia LEDs
Message-ID: <20200406083423.GA31120@duo.ucw.cz>
References: <20200319181604.2425-1-marek.behun@nic.cz>
 <20200321153444.GE8386@duo.ucw.cz>
 <661959c3-cd24-1125-be35-f293212f4fe4@gmail.com>
 <20200321215030.08b75ccc@nic.cz>
 <e6f20e72-0bfc-5fc1-839e-1283d8f15394@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <e6f20e72-0bfc-5fc1-839e-1283d8f15394@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-03-22 16:51:02, Jacek Anaszewski wrote:
> Marek,
>=20
> On 3/21/20 9:50 PM, Marek Behun wrote:
> > On Sat, 21 Mar 2020 19:01:15 +0100
> > Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> >=20
> >>> How will this look in the /sys/class/leds?
> >>>
> >>> We don't want to see omnia:xxx:xx there. For the ethernet activity
> >>> leds, it would be nice to get something like eth0:red:activity...? =
=20
> >>
> >> devicename and devicename_mandatory should be removed.
> >>
> >=20
> > Without this I have:
> >=20
> > omnialeds /sys/class/leds # ls
> > blue:power   red:power    white:lan-2  white:pci-1  white:user-1
> > green:power  white:lan-0  white:lan-3  white:pci-2  white:user-2
> > mmc0::       white:lan-1  white:lan-4  white:pci-3  white:wan
>=20
> You might want to associate the LED with actual eth interface,
> as Pavel mentioned, but that would require some more work.

Yes please.

> Anyway, "omnia" alone doesn't allow to tell the location of the
> LED either.

ACK.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXorpjwAKCRAw5/Bqldv6
8h3CAKCM+/Kxb7cGBrB6YhNEK0i0q7h8WACgr/WhMv6XrgDR7bYAVIOLIcGyNq0=
=FvaQ
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
