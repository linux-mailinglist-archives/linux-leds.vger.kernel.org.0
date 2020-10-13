Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44FDE28CA5B
	for <lists+linux-leds@lfdr.de>; Tue, 13 Oct 2020 10:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403913AbgJMIhp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Oct 2020 04:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403907AbgJMIhl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Oct 2020 04:37:41 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB82BC0613D0
        for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2020 01:37:40 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kSFoH-0004G7-3T; Tue, 13 Oct 2020 10:37:29 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kSFoF-0005UK-Ab; Tue, 13 Oct 2020 10:37:27 +0200
Date:   Tue, 13 Oct 2020 10:37:27 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     kernel test robot <lkp@intel.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, kbuild-all@lists.01.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>, kernel@pengutronix.de,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v8 3/3] leds: trigger: implement a tty trigger
Message-ID: <20201013083727.bii6p6yhdh53zbko@pengutronix.de>
References: <20201012123358.1475928-4-u.kleine-koenig@pengutronix.de>
 <202010122255.mTooYoPh-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cnr3vbqepw63ca5h"
Content-Disposition: inline
In-Reply-To: <202010122255.mTooYoPh-lkp@intel.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--cnr3vbqepw63ca5h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Oct 12, 2020 at 10:16:59PM +0800, kernel test robot wrote:
> Hi "Uwe,

I love your test report! Perhaps something to improve: The parser of the
=46rom: line should drop the " :-)

>    drivers/leds/trigger/ledtrig-tty.c: In function 'ledtrig_tty_work':
> >> drivers/leds/trigger/ledtrig-tty.c:92:7: warning: variable 'firstrun' =
set but not used [-Wunused-but-set-variable]
>       92 |  bool firstrun =3D false;
>          |       ^~~~~~~~

Indeed, this line should just be dropped. I won't resend yet, waiting
for some feedback first and assuming reviewers are able to interpolate
how v9 will look like :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cnr3vbqepw63ca5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl+FZ0QACgkQwfwUeK3K
7AlByQf/QetryfgvRVepJCPyfH15sS5n6kVfHoQRw59sz8GlbqraBNtO/mF6+UWx
U4AhTHha/Da1T97IfvJFglYMj0j/MJnWMUvN++tk2LGF2pOYhW8sxixHihHjhGvH
9zaE/1hPU96onIA7MCoi5DN1EOlEKVHQCgtoUWODYjB4JaaoJn9sUxwF8+mab2Au
49H7rauA8Uu7F1mU8eBrbo+Jyo40rXeCpF7gmq2D/T454+2zpTfSo/Cg65Ot6faH
OODgcnxIzA+OS02XJphoAvbPfa0gvnY5LEoj5Wcpw9Ten+azeB+gSFBmULItMlLH
mtfb9jHM7E9W6HJ0P8aCzhur7fT7fQ==
=JlDd
-----END PGP SIGNATURE-----

--cnr3vbqepw63ca5h--
