Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C85743ECED4
	for <lists+linux-leds@lfdr.de>; Mon, 16 Aug 2021 08:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233571AbhHPGvn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Aug 2021 02:51:43 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41322 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233376AbhHPGvm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Aug 2021 02:51:42 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7BBD71C0B77; Mon, 16 Aug 2021 08:51:10 +0200 (CEST)
Date:   Mon, 16 Aug 2021 08:51:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Colin King <colin.king@canonical.com>
Cc:     linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: flash: Remove redundant initialization of variable
 ret
Message-ID: <20210816065110.GA7500@duo.ucw.cz>
References: <20210612132547.58727-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <20210612132547.58727-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Colin Ian King <colin.king@canonical.com>
>=20
> The variable ret is being initialized with a value that is never read,
> it is being updated later on. The assignment is redundant and can be
> removed.
>=20
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

I did this instead; hopefully that's okay with everyone.

Best regards,
							Pavel

commit 654933ae7d32f278eecd0bb0f175785574ac4775
Author: Pavel Machek <pavel@ucw.cz>
Date:   Mon Aug 16 08:47:08 2021 +0200

    leds: flash: Remove redundant initialization of variable ret
   =20
    Adjust initialization not to trigger Coverity warnings.
   =20
    Reported-by: Colin Ian King <colin.king@canonical.com>
    Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index 6eeb9effcf65..185e17055317 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -92,14 +92,12 @@ static ssize_t flash_strobe_store(struct device *dev,
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
 	unsigned long state;
-	ssize_t ret =3D -EINVAL;
+	ssize_t ret =3D -EBUSY;
=20
 	mutex_lock(&led_cdev->led_access);
=20
-	if (led_sysfs_is_disabled(led_cdev)) {
-		ret =3D -EBUSY;
+	if (led_sysfs_is_disabled(led_cdev))
 		goto unlock;
-	}
=20
 	ret =3D kstrtoul(buf, 10, &state);
 	if (ret)


--=20
http://www.livejournal.com/~pavelmachek

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYRoK3gAKCRAw5/Bqldv6
8j8dAJ4ofrlkLRgyhMsj+wAlN16lq/bCRgCeN7K/b+N0KrTKckmebbrTfnoryCs=
=RFL6
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
