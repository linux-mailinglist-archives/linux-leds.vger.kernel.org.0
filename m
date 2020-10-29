Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1617A29F38F
	for <lists+linux-leds@lfdr.de>; Thu, 29 Oct 2020 18:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbgJ2Rpc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 13:45:32 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:60242 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgJ2Rpb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Oct 2020 13:45:31 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C6DD51C0B7A; Thu, 29 Oct 2020 18:45:29 +0100 (CET)
Date:   Thu, 29 Oct 2020 18:45:29 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Ben Whitten <ben.whitten@gmail.com>, linux-leds@vger.kernel.org
Subject: Re: ledtrig netdev: what is the purpose of spinlock usage?
Message-ID: <20201029174529.GA26053@duo.ucw.cz>
References: <20201029070000.15472666@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <20201029070000.15472666@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> since you are the original author of netdev LED trigger, I guess this
> question should go to you. Why are spinlocks used as locks in the
> netdev trigger code? Is this for performance? Would it be a drastic
> performance hit to use mutexes?

Triggers can be called from interrupt context, IIRC, and many simple
LEDs can be operated from interrupt context, too.

Thus you need spinlocks...

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX5r/uQAKCRAw5/Bqldv6
8nsCAJ9uLX5vOC31VeSzZRR9dpgOPs9FZQCaAlQxrT1duTsUXDc7/k7nZvgSi/I=
=YNNT
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
