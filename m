Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAB98B6EB
	for <lists+linux-leds@lfdr.de>; Tue, 13 Aug 2019 13:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfHMLb5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Aug 2019 07:31:57 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:54617 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbfHMLb5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Aug 2019 07:31:57 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 39BDF8073E; Tue, 13 Aug 2019 13:31:42 +0200 (CEST)
Date:   Tue, 13 Aug 2019 13:31:54 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     syzbot <syzbot+e1a4f80c370d2381e49f@syzkaller.appspotmail.com>
Cc:     Julia.Lawall@lip6.fr, bp@alien8.de, dan.j.williams@intel.com,
        dave.hansen@linux.intel.com, dave.jiang@intel.com,
        dvyukov@google.com, haozhong.zhang@intel.com, hpa@zytor.com,
        jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
        pbonzini@redhat.com, peterz@infradead.org, rkrcmar@redhat.com,
        rpurdie@rpsys.net, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de, x86@kernel.org
Subject: Re: WARNING in untrack_pfn
Message-ID: <20190813113154.GA8420@amd>
References: <000000000000f70a0e0571ad8ffb@google.com>
 <000000000000c3fe1b058ffd7c99@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <000000000000c3fe1b058ffd7c99@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-08-13 03:56:06, syzbot wrote:
> syzbot has found a reproducer for the following crash on:

Unsigned emails are ugly. Could the "From: " be modified to include
name of responsible person?

> HEAD commit:    d45331b0 Linux 5.3-rc4
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D16130d4a600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D3d7eaed8496da=
4da
> dashboard link: https://syzkaller.appspot.com/bug?extid=3De1a4f80c370d238=
1e49f
> compiler:       clang version 9.0.0 (/home/glider/llvm/clang
> 80fee25776c2fb61e74c1ecb1a523375c2500b69)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D131f8e0e600=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D10e1a1ee600000
>=20
> The bug was bisected to:
>=20
> commit c68729119f4d2993bec3c9cb999ad76de5aeddba
> Author: Julia Lawall <Julia.Lawall@lip6.fr>
> Date:   Sat Jul 15 09:58:19 2017 +0000
>=20
>     leds: tlc591xx: add missing of_node_put

And this looks like mistake. I don't think this commit is causing the
crash. Can you somehow verify?

								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1Sn6oACgkQMOfwapXb+vI4QwCgoymvNRbg/fcRXs34awljQPfa
GAwAnRWHuMB93tZPDz5C4dE+LjyU11lj
=Llkh
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
