Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E62E7AD08F
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 22:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbfIHU0Y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Sep 2019 16:26:24 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:37229 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfIHU0X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Sep 2019 16:26:23 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 6278A81EDE; Sun,  8 Sep 2019 22:26:07 +0200 (CEST)
Date:   Sun, 8 Sep 2019 22:26:20 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 3/5] driver core: class: add function to create
 /sys/class/<class>/foo directory
Message-ID: <20190908202620.GA9220@amd>
References: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
 <1567946472-10075-4-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <1567946472-10075-4-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This adds a new function class_kobject_create_and_add() that creates a
> directory in the /sys/class/<class>.
>=20
> This function is required to create the /sys/class/leds/triggers directory
> that contains all available LED triggers.

Lets not do this. With your fixes (1,2/5), we'll have reasonable
interface for triggers. We don't need a new one.

[And yes, we'll want to do something with the cpu activity trigger,
too.]

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl11Y+wACgkQMOfwapXb+vIBGgCfWdt4Yu+BdPDnU5QcgnUUIarP
fI0AoITMKEpAjkFtHJW7ZUYvFbSA40YC
=KRwV
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
