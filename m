Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 466921BA088
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 11:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgD0J4n (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 05:56:43 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:60930 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgD0J4n (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 05:56:43 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D4CB91C024B; Mon, 27 Apr 2020 11:56:41 +0200 (CEST)
Date:   Mon, 27 Apr 2020 11:56:41 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     qiwuchen55@gmail.com
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: Re: [PATCH] leds: leds-nic78bx: handle error checking and error
 processing
Message-ID: <20200427095641.GB21572@duo.ucw.cz>
References: <1581695916-16708-1-git-send-email-qiwuchen55@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline
In-Reply-To: <1581695916-16708-1-git-send-email-qiwuchen55@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: chenqiwu <chenqiwu@xiaomi.com>
>=20
> Add error checking and error processing for led probe.

led->LED please.

Ok, I see that error handling there is clearly propblematic.

> Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>

>=20
> +
> +err_led_classdev_register:
> +	i -=3D 1;
> +	while (i >=3D 0)
> +		devm_led_classdev_unregister(dev, &nic78bx_leds[i--].cdev);
> +	devm_release_region(dev, io_rc->start, resource_size(io_rc));
> +err_request_region:
> +err_res_size:
> +	release_resource(io_rc);
> +err_get_res:
> +	devm_kfree(dev, led_data);
>  	return ret;

But we should not need to do devm_ releasing in the error paths,
right? Core is expected to do that for us... AFAICT only
release_resource() is neccessary... unless it has some kind of devm_
variant.

Best regards,
									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXqasWQAKCRAw5/Bqldv6
8iEoAJ9dVZlhcVZCH/cmYlATV3NaEi70CwCfcLh66BFB+kUEFpl91s0yuzHmkiE=
=EhIj
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
