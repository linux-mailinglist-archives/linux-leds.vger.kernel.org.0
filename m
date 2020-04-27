Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3800F1BA004
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 11:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgD0Jgw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 05:36:52 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58464 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgD0Jgw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 05:36:52 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CB6B21C0244; Mon, 27 Apr 2020 11:36:50 +0200 (CEST)
Date:   Mon, 27 Apr 2020 11:36:50 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Denis Osterland-Heim <denis.osterland@diehl.com>
Cc:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 1/3] leds: pwm: check result of led_pwm_set() in
 led_pwm_add()
Message-ID: <20200427093650.GA20954@duo.ucw.cz>
References: <20200421130644.16059-1-Denis.Osterland@diehl.com>
 <20200421130644.16059-2-Denis.Osterland@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <20200421130644.16059-2-Denis.Osterland@diehl.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-04-21 13:09:14, Denis Osterland-Heim wrote:
> led_pwm_set() now returns an error when setting the PWM fails.
>=20
> Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>

Thanks, applied. (Just this patch for now).
                                                                Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXqansgAKCRAw5/Bqldv6
8qQ3AKCtI3ImRODOL9NxWExJ/ZqJPr+PDQCcC7HIRK+ByJIsnyFOcap6jA1HFcc=
=JXQI
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
