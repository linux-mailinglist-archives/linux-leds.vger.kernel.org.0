Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468363B219B
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jun 2021 22:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhFWUNR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Jun 2021 16:13:17 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35144 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWUNQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Jun 2021 16:13:16 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 130951C0B76; Wed, 23 Jun 2021 22:10:58 +0200 (CEST)
Date:   Wed, 23 Jun 2021 22:10:57 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Doug Zobel <dougdev334@gmail.com>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: lp55xx: Initialize enable GPIO direction to output
Message-ID: <20210623201057.GA8540@amd>
References: <20210510204000.GA3714758@odessy>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <20210510204000.GA3714758@odessy>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-05-10 15:40:00, Doug Zobel wrote:
> The "Convert to use GPIO descriptors" commit changed the
> initialization of the enable GPIO from GPIOF_DIR_OUT to
> GPIOD_ASIS.  This breaks systems where the GPIO does not
> default to output.  Changing the enable initialization
> to GPIOD_OUT_LOW.

Thanks, applied.
							Pavel

--=20
http://www.livejournal.com/~pavelmachek

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmDTlVEACgkQMOfwapXb+vJfggCbBDDXJP9+24bNLzwe77Lxp8zu
cFkAoMDHBExA2hQfL8OYJ23VhKEFJTed
=GJhw
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
