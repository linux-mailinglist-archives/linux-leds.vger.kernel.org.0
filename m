Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D2194FA6
	for <lists+linux-leds@lfdr.de>; Mon, 19 Aug 2019 23:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbfHSVQO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Aug 2019 17:16:14 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:42811 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbfHSVQO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Aug 2019 17:16:14 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id F39598128C; Mon, 19 Aug 2019 23:15:58 +0200 (CEST)
Date:   Mon, 19 Aug 2019 23:16:11 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Wenwen Wang <wenwen@cs.uga.edu>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] led: triggers: Fix a memory leak bug
Message-ID: <20190819211611.GA13437@amd>
References: <1566247302-6217-1-git-send-email-wenwen@cs.uga.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <1566247302-6217-1-git-send-email-wenwen@cs.uga.edu>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-08-19 15:41:42, Wenwen Wang wrote:
> In led_trigger_set(), 'event' is allocated in kasprintf(). However, it is
> not deallocated in the following execution if the label 'err_activate' or
> 'err_add_groups' is entered, leading to memory leaks. To fix this issue,
> free 'event' before returning the error.
>=20
> Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>

Acked-by: Pavel Machek <pavel@ucw.cz>

> +++ b/drivers/leds/led-triggers.c
> @@ -173,6 +173,7 @@ int led_trigger_set(struct led_classdev *led_cdev, st=
ruct led_trigger *trig)
>  	list_del(&led_cdev->trig_list);
>  	write_unlock_irqrestore(&led_cdev->trigger->leddev_list_lock, flags);
>  	led_set_brightness(led_cdev, LED_OFF);
> +	kfree(event);
> =20
>  	return ret;
>  }

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1bEZsACgkQMOfwapXb+vI9jACgqcunWuABPR8NQjbzqfWOMope
tHcAoJmIhGa3fqwGm5MqOf6y8qdP52qD
=uvQW
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
