Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB012770BB
	for <lists+linux-leds@lfdr.de>; Thu, 24 Sep 2020 14:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbgIXMQo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Sep 2020 08:16:44 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:36658 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbgIXMQo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Sep 2020 08:16:44 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2280D1C0BCF; Thu, 24 Sep 2020 14:16:42 +0200 (CEST)
Date:   Thu, 24 Sep 2020 14:16:41 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Peter Meerwald <p.meerwald@bct-electronic.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Zahari Petkov <zahari@balena.io>
Subject: Re: [PATCH leds 5/7] leds: pca963x: use flexible array
Message-ID: <20200924121641.GF3933@duo.ucw.cz>
References: <20200920002500.5851-1-marek.behun@nic.cz>
 <20200920002500.5851-6-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="iBwuxWUsK/REspAd"
Content-Disposition: inline
In-Reply-To: <20200920002500.5851-6-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--iBwuxWUsK/REspAd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Instead of doing two allocations, allocate only once, by utilizing
> flexible array members.

Thanks, I have applied 1-5 of the series. I would not mind getting
some testing here.

Best regards,
							Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--iBwuxWUsK/REspAd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2yOKQAKCRAw5/Bqldv6
8kJ+AJ4yeLL2lb2pCl1u6qlMyqGMbdetcACeJGgIG/aoJMFv8Jg4uXsZexEW+CM=
=o52i
-----END PGP SIGNATURE-----

--iBwuxWUsK/REspAd--
