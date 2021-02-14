Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3BD31B268
	for <lists+linux-leds@lfdr.de>; Sun, 14 Feb 2021 21:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbhBNU33 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 14 Feb 2021 15:29:29 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:37260 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbhBNU32 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 14 Feb 2021 15:29:28 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BBB431C0B76; Sun, 14 Feb 2021 21:31:38 +0100 (CET)
Date:   Sun, 14 Feb 2021 21:31:38 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: [GIT PULL 5.11-rc8] LED fix
Message-ID: <20210214203138.GA22191@amd>
References: <20210214171328.GA5314@duo.ucw.cz>
 <CAHk-=wgCp5n3sB_hDmOLSPiJcwJm9RErBHN_6ABhRWyVEkY4Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgCp5n3sB_hDmOLSPiJcwJm9RErBHN_6ABhRWyVEkY4Xw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Unfortunately, for some reason request-pull is not willing to
> > cooperate, so I'm just doing this manually.
>=20
> The reason request-pull doesn't cooperate is actually spelled out explici=
tly:
>=20
> > pavel@duo:/data/l/linux-leds$ git request-pull master git://git.kernel.=
org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ 92bf22614b21a2706f4993b2=
78017e437f7785b3 > /tmp/delme for-rc8-5.11
> > warn: No match for commit 92bf22614b21a2706f4993b278017e437f7785b3 foun=
d at git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/
> > warn: Are you sure you pushed '92bf22614b21a2706f4993b278017e437f7785b3=
' there?
>=20
> Commit 92bf22614b21 is my rc7 commit. And it's not in your tree (which
> is based on rc1).
>=20
> Why are you giving raw commit ID's to git request-pull? Particularly
> ones that aren't even in your upstream tree? Git figures things out on
> its own, why do you point to the rc7 commit that has nothing to do
> with what you're pushing?

I find raw commit IDs easier to work with than the tags.

> And yes, that commit exists on kernel.org through my tree, but it's
> not reachable from any tips in yours (because your work was based on
> earlier state - which is as it should be).

I don't understand.

I want you to apply dbeb02a0bc41b9e9b9c05e460890351efecf1352 .

92bf22614b21 is my rc7, and it is parent of the commit I want you to
apply. It is listed as so on
https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/commit=
/?h=3Dfor-rc8-5.11 . I would call that "reachable"...?

So I guess I could update master to rc7 to get rid of this error and
retry request-pull?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmApiKkACgkQMOfwapXb+vJJTQCfdZOxWiYsUTU5b35sCoSqBhMR
61oAnAyCKZM4c9cfCb9AKQOd0E1sUmZ5
=N5Wa
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
