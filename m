Return-Path: <linux-leds+bounces-6300-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 884CFC80F3C
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 15:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6EEDC4E291C
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 14:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E294A22A4F1;
	Mon, 24 Nov 2025 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="G3QiqLkm"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFADD2AD0C;
	Mon, 24 Nov 2025 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763993845; cv=none; b=OOvb2u0FNDwn9ET13Du8WhVV4jQuO+GaZKGEvponF8zfUn5NA0lQ+i+4nQjK08wyIZqO2Sk9NCGYSmBFd600y66vrWtHre3+bx5H/dVOdp8YrqzBqJ1DYNLHjycb8GRk2zPnQR95W6EXOHJKsfkTzkPeb2+T73ebAtbFihJdw64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763993845; c=relaxed/simple;
	bh=Wsstj013XusSELY9pSeYxg1soFm6y4bPhvrcs+jNS5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cusb4FTwjv14EPDW9ILDKsoE2WARI8qo1Zax9bJDoxgMDO2c16FVnVnsSuOvtAtw667cEnka7/JiZzcvcHNarLNNI1UW1OLy6jZgZKx0ym6vm2ogEKPRvt9MKbq5mtSbRfZj7Bqdm1gKpBOPit37WCQk3NrB4/RQZ+FfUY+HTmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=G3QiqLkm; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 393701C00AB; Mon, 24 Nov 2025 15:17:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1763993839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7t7KRyxs7r+qRv7gCxeliCI8kpln4bhlxsfsmvOU0VE=;
	b=G3QiqLkmiuGUo/pEDv2YR9U5cPXX1EDRob9AzR89waGvOCx0++TWXK1amICFCnXQYuGHhz
	U65TUppwov3bwBbep9RnyZ6ISwgP5LBFEnJH0o5MmGItK6Hls1hwkly32Wt2KCkvZQDgap
	AR0xEw82DYIv7mVpbwQ1X8LC+tL5+gI=
Date: Mon, 24 Nov 2025 15:17:18 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/2] leds: accept trigger parameters in "trigger:params"
 format
Message-ID: <aSRo7s5S/jZY5Tbu@duo.ucw.cz>
References: <1348915776.459857.1763933207303.ref@mail.yahoo.com>
 <1348915776.459857.1763933207303@mail.yahoo.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mFnZv+kOX6EPwkB6"
Content-Disposition: inline
In-Reply-To: <1348915776.459857.1763933207303@mail.yahoo.com>


--mFnZv+kOX6EPwkB6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Allow parameters to be passed along with the trigger name when
> writing to /sys/class/leds/<led>/trigger in the format:
> =A0=A0echo "trigger_name:params" > /sys/class/leds/<led>/trigger

There's "one value per sysfs file" rule. Lets not do this.

Normal way is that trigger creates separate sysfs files for
parameters.

Best regards,
								Pavel

> Core stores the RHS in led_cdev->params for the duration of the
> activate() call; triggers may read and optionally consume or copy it.
> Core frees any remaining buffer after activate() returns.
>=20
> Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
>=20
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -33,6 +33,12 @@ trigger_relevant(struct led_classdev *le
> =A0 =A0 =A0return !trig->trigger_type || trig->trigger_type =3D=3D led_cd=
ev->trigger_type;
> =A0}
> =A0
> +/*=A0
> + * core: accept "<trigger>" or "<trigger>:<params>" and pass params via =
led_cdev->params.
> + * - If a colon is present, the RHS is duplicated and stored in led_cdev=
->params.
> + * - The trigger's activate callback may consume the pointer (free it an=
d set to NULL).
> + * - If the trigger does not consume it, core frees the buffer after act=
ivate returns.
> + */
> =A0ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct bin_attribute *bin_attr, char *buf,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0loff_t pos, size_t count)
> @@ -41,6 +47,10 @@ ssize_t led_trigger_write(struct file *f
> =A0 =A0 =A0struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> =A0 =A0 =A0struct led_trigger *trig;
> =A0 =A0 =A0int ret =3D count;
> +=A0 =A0 char *tmp =3D NULL;
> +=A0 =A0 char *params =3D NULL;
> +=A0 =A0 char *pcolon;
> +=A0 =A0 bool found =3D false;
> =A0
> =A0 =A0 =A0mutex_lock(&led_cdev->led_access);
> =A0
> @@ -49,26 +59,81 @@ ssize_t led_trigger_write(struct file *f
> =A0 =A0 =A0 =A0 =A0goto unlock;
> =A0 =A0 =A0}
> =A0
> -=A0 =A0 if (sysfs_streq(buf, "none")) {
> -=A0 =A0 =A0 =A0 led_trigger_remove(led_cdev);
> +=A0 =A0 /* copy input and NUL-terminate; trim trailing newline if presen=
t */
> +=A0 =A0 tmp =3D kstrndup(buf, count, GFP_KERNEL);
> +=A0 =A0 if (!tmp) {
> +=A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> =A0 =A0 =A0 =A0 =A0goto unlock;
> =A0 =A0 =A0}
> +=A0 =A0 if (strlen(tmp) && tmp[strlen(tmp) - 1] =3D=3D '\n')
> +=A0 =A0 =A0 =A0 tmp[strlen(tmp) - 1] =3D '\0';
> +
> +=A0 =A0 /* handle special keywords */
> +=A0 =A0 if (sysfs_streq(tmp, "none")) {
> +=A0 =A0 =A0 =A0 led_trigger_remove(led_cdev);
> +=A0 =A0 =A0 =A0 goto out_free;
> +=A0 =A0 }
> +=A0 =A0 if (sysfs_streq(tmp, "default")) {
> +=A0 =A0 =A0 =A0 led_trigger_set_default(led_cdev);
> +=A0 =A0 =A0 =A0 goto out_free;
> +=A0 =A0 }
> +
> +=A0 =A0 /* split on first ':' to accept "<trigger>" or "<trigger>:<param=
s>" */
> +=A0 =A0 pcolon =3D strchr(tmp, ':');
> +=A0 =A0 if (pcolon) {
> +=A0 =A0 =A0 =A0 *pcolon =3D '\0';
> +=A0 =A0 =A0 =A0 params =3D kstrdup(pcolon + 1, GFP_KERNEL);
> +=A0 =A0 =A0 =A0 if (!params) {
> +=A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> +=A0 =A0 =A0 =A0 =A0 =A0 goto out_free;
> +=A0 =A0 =A0 =A0 }
> +=A0 =A0 }
> =A0
> =A0 =A0 =A0down_read(&triggers_list_lock);
> =A0 =A0 =A0list_for_each_entry(trig, &trigger_list, next_trig) {
> -=A0 =A0 =A0 =A0 if (sysfs_streq(buf, trig->name) && trigger_relevant(led=
_cdev, trig)) {
> +=A0 =A0 =A0 =A0 if (!trigger_relevant(led_cdev, trig))
> +=A0 =A0 =A0 =A0 =A0 =A0 continue;
> +
> +=A0 =A0 =A0 =A0 if (sysfs_streq(tmp, trig->name)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0down_write(&led_cdev->trigger_lock);
> +
> +=A0 =A0 =A0 =A0 =A0 =A0 /* attach transient params to led_cdev before se=
tting trigger */
> +=A0 =A0 =A0 =A0 =A0 =A0 if (params) {
> +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(led_cdev->params);
> +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 led_cdev->params =3D params;
> +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 params =3D NULL; /* ownership transferre=
d */
> +=A0 =A0 =A0 =A0 =A0 =A0 } else {
> +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(led_cdev->params);
> +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 led_cdev->params =3D NULL;
> +=A0 =A0 =A0 =A0 =A0 =A0 }
> +
> +=A0 =A0 =A0 =A0 =A0 =A0 /* set the trigger (this will call trig->activat=
e/led_trigger_set) */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0led_trigger_set(led_cdev, trig);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0up_write(&led_cdev->trigger_lock);
> =A0
> -=A0 =A0 =A0 =A0 =A0 =A0 up_read(&triggers_list_lock);
> -=A0 =A0 =A0 =A0 =A0 =A0 goto unlock;
> +=A0 =A0 =A0 =A0 =A0 =A0 found =3D true;
> +=A0 =A0 =A0 =A0 =A0 =A0 break;
> =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0}
> -=A0 =A0 /* we come here only if buf matches no trigger */
> -=A0 =A0 ret =3D -EINVAL;
> =A0 =A0 =A0up_read(&triggers_list_lock);
> =A0
> +=A0 =A0 if (!found) {
> +=A0 =A0 =A0 =A0 /* no matching trigger name found */
> +=A0 =A0 =A0 =A0 ret =3D -EINVAL;
> +=A0 =A0 =A0 =A0 goto out_free;
> +=A0 =A0 }
> +
> +=A0 =A0 /* If the trigger didn't consume the transient params, free it n=
ow. */
> +=A0 =A0 down_write(&led_cdev->trigger_lock);
> +=A0 =A0 if (led_cdev->params) {
> +=A0 =A0 =A0 =A0 kfree(led_cdev->params);
> +=A0 =A0 =A0 =A0 led_cdev->params =3D NULL;
> +=A0 =A0 }
> +=A0 =A0 up_write(&led_cdev->trigger_lock);
> +
> +out_free:
> +=A0 =A0 kfree(tmp);
> +=A0 =A0 kfree(params); /* free if not attached */
> =A0unlock:
> =A0 =A0 =A0mutex_unlock(&led_cdev->led_access);
> =A0 =A0 =A0return ret;
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -240,6 +240,17 @@ struct led_classdev {
> =A0
> =A0 =A0 =A0/* Ensures consistent access to the LED class device */
> =A0 =A0 =A0struct mutex=A0 =A0 =A0 =A0 led_access;
> +=A0 =A0 /*
> +=A0 =A0 =A0* Optional transient parameter provided by core when user wri=
tes
> +=A0 =A0 =A0* "<trigger_name>:<param>" to /sys/class/leds/<led>/trigger.
> +=A0 =A0 =A0* - Core allocates a NUL-terminated string and stores it here=
 before
> +=A0 =A0 =A0*=A0 =A0calling trigger->activate(led_cdev).
> +=A0 =A0 =A0* - Trigger may "consume" the string by freeing it and settin=
g the
> +=A0 =A0 =A0*=A0 =A0pointer to NULL.
> +=A0 =A0 =A0* - If the trigger does not consume it, core frees the buffer=
 after
> +=A0 =A0 =A0*=A0 =A0activate returns.
> +=A0 =A0 =A0*/
> +=A0 =A0 char *params;
> =A0};
> =A0
> =A0/**

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--mFnZv+kOX6EPwkB6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaSRo7gAKCRAw5/Bqldv6
8gC+AJ9Mky79zgRI002jnvP8ujOZ6QXC3wCeN2HsouEA4KmrpBg3jf6H8yEY7gs=
=C7Sw
-----END PGP SIGNATURE-----

--mFnZv+kOX6EPwkB6--

