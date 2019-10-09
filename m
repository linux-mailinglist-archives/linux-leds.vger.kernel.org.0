Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD80D0F3E
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2019 14:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731255AbfJIMzY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 08:55:24 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:51651 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731252AbfJIMzY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 08:55:24 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 481D88034D; Wed,  9 Oct 2019 14:55:06 +0200 (CEST)
Date:   Wed, 9 Oct 2019 14:55:21 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, sfr@canb.auug.org.au
Cc:     torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: leds in -next -- update address was Re: [GIT PULL] LED fixes for
 5.4-rc3.
Message-ID: <20191009125520.GA1436@amd>
References: <20191008204258.22196-1-jacek.anaszewski@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline
In-Reply-To: <20191008204258.22196-1-jacek.anaszewski@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> - MAINTAINERS: add pointer to Pavel Machek's linux-leds.git tree.
>   Pavel is going to take over LED tree maintainership
>   from myself.

I pulled latest changes from for-next, so I can take over -next
maintainance for now.

Stephen, could you update your scripts to pull from
git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git ?

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2d2LgACgkQMOfwapXb+vJFDwCgsNu+90cQFxK7dhNVr2W3KEE0
E9gAn0INDeKhrh+ZxpqjqqZH7mkRzufi
=NDJS
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
