Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 600A41EE634
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 16:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbgFDOBW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 10:01:22 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35850 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728604AbgFDOBW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 10:01:22 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B6E631C0BD2; Thu,  4 Jun 2020 16:01:20 +0200 (CEST)
Date:   Thu, 4 Jun 2020 16:01:20 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, jonas.gorski@gmail.com,
        rpurdie@rpsys.net
Subject: Re: [PATCH v5] leds-bcm6328: support second hw blinking interval
Message-ID: <20200604140120.GK7222@duo.ucw.cz>
References: <20200604134826.1808153-1-noltari@gmail.com>
 <20200604135905.1899171-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="08ATZu8fEq0x2T3M"
Content-Disposition: inline
In-Reply-To: <20200604135905.1899171-1-noltari@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--08ATZu8fEq0x2T3M
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-06-04 15:59:05, =C1lvaro Fern=E1ndez Rojas wrote:
> Right now the driver uses only 3 LED modes:
> 0: On
> 1: HW Blinking (Interval 1)
> 3: Off
>=20
> However, the controller supports a second HW blinking interval, which res=
ults
> in 4 possible LED modes:
> 0: On
> 1: HW Blinking (Interval 1)
> 2: HW Blinking (Interval 2)
> 3: Off

> Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>

Thanks, applied.

Best regards,
									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--08ATZu8fEq0x2T3M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXtj+sAAKCRAw5/Bqldv6
8tUlAKCqY/hJe5dJn5V6P+U9KicyqZROCQCgs82yd1+Jlq5oU/0Wod/An5p5zzw=
=snMu
-----END PGP SIGNATURE-----

--08ATZu8fEq0x2T3M--
