Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D8131F84B
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 12:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhBSLVj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 06:21:39 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:49490 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbhBSLUo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 06:20:44 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 648001C0B80; Fri, 19 Feb 2021 12:20:00 +0100 (CET)
Date:   Fri, 19 Feb 2021 12:20:00 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: [GIT PULL 5.11-rc8] LED fix
Message-ID: <20210219112000.GJ19207@duo.ucw.cz>
References: <20210214171328.GA5314@duo.ucw.cz>
 <CAHk-=wgCp5n3sB_hDmOLSPiJcwJm9RErBHN_6ABhRWyVEkY4Xw@mail.gmail.com>
 <20210214203138.GA22191@amd>
 <CAHk-=wgmB6qH7Ho433B066S0=B-CtDNFtaZWOM3PMGWB0ERKSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="DesjdUuHQDwS2t4N"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgmB6qH7Ho433B066S0=B-CtDNFtaZWOM3PMGWB0ERKSw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--DesjdUuHQDwS2t4N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On Sun, Feb 14, 2021 at 12:31 PM Pavel Machek <pavel@ucw.cz> wrote:
> >
> > 92bf22614b21 is my rc7, and it is parent of the commit I want you to
> > apply.
>=20
> Oh, right you are. I looked at your leds-cleanup-for-pavel branch for
> some reason, which was much older.
>=20
> Anyway, it does the remote lookup with git ls-remote, and doesn't find
> any matching ref for that 92bf22614 commit you gave it as a base, so
> that's why it complains. You _could_ fix that by just pushing all the
> tags you have locally to your remote too.
>=20
> Have you changed your behavior wrt git request-pull lately? Because
> that whole model you use is broken.

This was really one-off and I found the git messages quite confusing.
>=20
> The "end" commit shouldn't be my tag (and it shouldn't be a SHA1). It
> should be *your* branch name.
>=20
> So what you *should* have used is something like
>=20
>     git request-pull master
> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/
> for-rc8-5.11
>=20
> (assuming "master" is the upstream branch - which would be my
> v5.11-rc7) without any odd SHA games or anything like that.

Yes, pushing master should work. I tried to fall back to SHAs as I
find them less confusing.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--DesjdUuHQDwS2t4N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC+e4AAKCRAw5/Bqldv6
8hfCAKCSGEICjqzvoR7vNLOKfRDRQBlssQCeI77qs2TbTjC9buuP6WBTk1yprcY=
=ougf
-----END PGP SIGNATURE-----

--DesjdUuHQDwS2t4N--
