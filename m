Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAC012ABA1
	for <lists+linux-leds@lfdr.de>; Thu, 26 Dec 2019 11:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfLZK37 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Dec 2019 05:29:59 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44554 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbfLZK37 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Dec 2019 05:29:59 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 964A61C2103; Thu, 26 Dec 2019 11:29:57 +0100 (CET)
Date:   Thu, 26 Dec 2019 11:29:56 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] leds: lm3692x: Disable chip on brightness 0
Message-ID: <20191226102956.GH4033@amd>
References: <cover.1577272495.git.agx@sigxcpu.org>
 <e1dc56c07235063a9c0afbfc8c227b92b39ec3d4.1577272495.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="it/zdz3K1bH9Y8/E"
Content-Disposition: inline
In-Reply-To: <e1dc56c07235063a9c0afbfc8c227b92b39ec3d4.1577272495.git.agx@sigxcpu.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--it/zdz3K1bH9Y8/E
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-12-25 12:16:39, Guido G=FCnther wrote:
> Otherwise there's a noticeable glow even with brightness 0. Also
> turning off the regulator can save additional power.

Ok, this will make set brightness slower, but I guess it makes sense.

Can you try to toggling brightness quickly from userspace, maybe even
=66rom two threads, to ensure nothing really goes wrong there?

Hmm. And if this is independend of the other series, tell me and I can
apply v2.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--it/zdz3K1bH9Y8/E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4Ei6QACgkQMOfwapXb+vKRlACgjsmUKw5HTV41mZpVjYyCe4a+
jxAAn0TJv2kocImeeHf4JNzTV0lAj5vi
=iO66
-----END PGP SIGNATURE-----

--it/zdz3K1bH9Y8/E--
