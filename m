Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7742746B6
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 18:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgIVQcU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 12:32:20 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:56132 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbgIVQcU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 12:32:20 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 28F5C1C0B76; Tue, 22 Sep 2020 18:32:18 +0200 (CEST)
Date:   Tue, 22 Sep 2020 18:32:17 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH leds v3 1/9] leds: lm36274: cosmetic: rename lm36274_data
 to chip
Message-ID: <20200922163217.GA25550@duo.ucw.cz>
References: <20200919180304.2885-1-marek.behun@nic.cz>
 <20200919180304.2885-2-marek.behun@nic.cz>
 <a5e6ff92-ebe9-f977-f5eb-21447fc6016a@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <a5e6ff92-ebe9-f977-f5eb-21447fc6016a@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-09-22 10:39:34, Dan Murphy wrote:
> Marek
>=20
> On 9/19/20 1:02 PM, Marek Beh=FAn wrote:
> > Rename this variable so that it is easier to read and easier to write in
> > 80 columns. Also rename variable of this type in lm36274_brightness_set
> > from led to chip, to be consistent.
>=20
> This patch seems a bit unnecessary.=A0 The current variables fit fine wit=
h 80
> columns.

I like this patch... result is easier to read.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2onEQAKCRAw5/Bqldv6
8sC5AKC+VwM3oDTtifiNxUA/T5ps1kTmGgCdGqoJsHNh45VMOQXas3pJxvlQViw=
=/7Ec
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
