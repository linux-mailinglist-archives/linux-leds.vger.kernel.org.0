Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1172A30A5F7
	for <lists+linux-leds@lfdr.de>; Mon,  1 Feb 2021 11:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233227AbhBAK53 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Feb 2021 05:57:29 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:57062 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbhBAK5I (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Feb 2021 05:57:08 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 853FF1C0B78; Mon,  1 Feb 2021 11:56:25 +0100 (CET)
Date:   Mon, 1 Feb 2021 11:56:25 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: [GIT PULL] LEDs chagnes for v5.11-rc
Message-ID: <20210201105625.GB23135@duo.ucw.cz>
References: <20210131094255.GA31740@duo.ucw.cz>
 <CAHk-=wih0mO6E4cvrAypwPu6xe--DziANaRmqhoRgdX9cM0shw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
In-Reply-To: <CAHk-=wih0mO6E4cvrAypwPu6xe--DziANaRmqhoRgdX9cM0shw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Sun 2021-01-31 11:26:42, Linus Torvalds wrote:
> On Sun, Jan 31, 2021 at 1:43 AM Pavel Machek <pavel@ucw.cz> wrote:
> >
> > This pull is due to "leds: trigger: fix potential deadlock with
> > libata" -- people find the warn annoying. It also contains new driver
> > (still should be okay late in -rcs, right?) and two trivial fixes.
>=20
> I've pulled it, but please don't add new drivers in -rc's.
>=20
> Yes, we traditionally accepted them as hardware enablement, but
> honestly, our development cycles are so reliable and consistent these
> days that it makes very little sense any more.

Ok, makes sense.

> So aim for just new device ID additions rather than new drivers,
> unless it's some *hugely* popular hardware that actually causes
> problems for people bootstrapping the system (ie things like a disk or
> network driver from a major company that is expected to actually be
> widely available and an actual issue for people trying to install
> Linux on their own).

Well, this is for most important piece of hardware today,
PinePhone. Too bad it is only for its flash LED.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYBfeWQAKCRAw5/Bqldv6
8vF7AKCa1lddbzfxGCxztMTe9KXhVgngAACeJ/RnxBEig0g3RDOdS+RsQ8Kpfuc=
=TYWK
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
