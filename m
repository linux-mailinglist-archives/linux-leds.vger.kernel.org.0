Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A17B8D1D76
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2019 02:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731542AbfJJAgb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 20:36:31 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33909 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731145AbfJJAgb (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 9 Oct 2019 20:36:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46pXFn3J83z9s7T;
        Thu, 10 Oct 2019 11:36:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570667789;
        bh=arnV4YeF195CkdQRcEOF4JZK7WnH2Z7fUvzdfofOT24=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KLpChH0U0UFW1QQk54fxdOWQGndN3TtL67gQ7H0DbksYVt6Ibdron+x6EKZvZyX+L
         OesHmz2WfAuM0rHT0MtIEbjC883tZ4/0tYJZMjqVQiIaNeXaufD+GJ9nxeKnjbxZjO
         XiMtJrItb8RPf7HFrVkj1MQ0LglVSkP3Bf+2KvCvmUt/mWloiS+AYTBFz3y0j3W42q
         vok5qD1toUZVEF8KCuOevnQydepZGPV84/fU9Zil7suc+3ug28+n5tTK4tqCII8EY0
         9rZZFheXepJMZZCPKnRZZu414/sBzzBNKXU/fTLtJfwmu7RDVVy7xcSSnVj1ZtO0Wy
         PdbpSzsUmZYNA==
Date:   Thu, 10 Oct 2019 11:36:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: leds in -next -- update address was Re: [GIT PULL] LED fixes
 for 5.4-rc3.
Message-ID: <20191010113628.62708b7d@canb.auug.org.au>
In-Reply-To: <20191009125520.GA1436@amd>
References: <20191008204258.22196-1-jacek.anaszewski@gmail.com>
        <20191009125520.GA1436@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pQjucLpReI.erAoc1bAlOW_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

--Sig_/pQjucLpReI.erAoc1bAlOW_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Pavel,

On Wed, 9 Oct 2019 14:55:21 +0200 Pavel Machek <pavel@ucw.cz> wrote:
>
> > - MAINTAINERS: add pointer to Pavel Machek's linux-leds.git tree.
> >   Pavel is going to take over LED tree maintainership
> >   from myself. =20
>=20
> I pulled latest changes from for-next, so I can take over -next
> maintainance for now.
>=20
> Stephen, could you update your scripts to pull from
> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git ?

Done.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/pQjucLpReI.erAoc1bAlOW_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2efQwACgkQAVBC80lX
0GwgXgf4xDlgAN864WMWFjNSbkM6j2Hbno9pmOFU8VLnhFEasLqk7fb2zxnOmrT8
NJ6AKufxhi5ICOcSBHsvF3FO1fARiMYU6I4UUg1ttYqaX2v7nOuRyojvsZZqxCXf
puMPeq42O5oAgzXSuQnNEG32jwQHSKydhWUr74s/uNsWDEylYIAUDPfmGQKQ3Ret
mcTnaKrohPXegSmJ7CAL2+SgCuMuDufk7kGhUtl6DNRl9t9FTJOaEUIBxbGwIh1k
M58Ri6Y3/HphDvUAvdBrB4WAldY568gZfF5ufRJ3xARCRPKb4q5um1ftrWBFqniH
aNmQa+1CCqAfXzR4cjB/KOcEjFhH
=Kdm0
-----END PGP SIGNATURE-----

--Sig_/pQjucLpReI.erAoc1bAlOW_--
