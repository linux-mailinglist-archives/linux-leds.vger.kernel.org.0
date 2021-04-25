Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE1E36A930
	for <lists+linux-leds@lfdr.de>; Sun, 25 Apr 2021 22:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbhDYUb1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 25 Apr 2021 16:31:27 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48028 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhDYUb1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 25 Apr 2021 16:31:27 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E41181C0B77; Sun, 25 Apr 2021 22:30:45 +0200 (CEST)
Date:   Sun, 25 Apr 2021 22:30:45 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: timer: Optionally stop timer trigger on
 reboot
Message-ID: <20210425203045.GB10996@amd>
References: <20210213154736.2905933-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline
In-Reply-To: <20210213154736.2905933-1-alexander.sverdlin@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This functionality is similar to heartbeat and activity triggers and
> turns the timer-triggered LEDs off right before reboot. It's configurable
> via new module parameter "reboot_off" to preserve original behaviour.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

So actual problem this solves that LED stays on during reboot?

I'd kind of expect hardware to switch the LEDs off. If hardware does
not do that, maybe the driver should?

So I'm not sure if it should be done from trigger; but if it is, it
really should not be optional.

Best regards,
								Pavel

> ---
>  drivers/leds/trigger/ledtrig-timer.c | 39 +++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/=
ledtrig-timer.c
> index 7c14983781ee..3eadcb0a629a 100644
> --- a/drivers/leds/trigger/ledtrig-timer.c
> +++ b/drivers/leds/trigger/ledtrig-timer.c
> @@ -16,6 +16,11 @@
>  #include <linux/device.h>
>  #include <linux/ctype.h>
>  #include <linux/leds.h>
> +#include <linux/reboot.h>
> +
> +static bool reboot_off;
> +module_param(reboot_off, bool, 0444);
> +MODULE_PARM_DESC(reboot_off, "Switch LED off on reboot");
> =20
>  static ssize_t led_delay_on_show(struct device *dev,
>  		struct device_attribute *attr, char *buf)
> @@ -97,7 +102,39 @@ static struct led_trigger timer_led_trigger =3D {
>  	.deactivate =3D timer_trig_deactivate,
>  	.groups =3D timer_trig_groups,
>  };
> -module_led_trigger(timer_led_trigger);
> +
> +static int timer_reboot_notifier(struct notifier_block *nb, unsigned lon=
g code,
> +				 void *unused)
> +{
> +	led_trigger_unregister(&timer_led_trigger);
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block timer_reboot_nb =3D {
> +	.notifier_call =3D timer_reboot_notifier,
> +};
> +
> +static int __init timer_trig_init(void)
> +{
> +	int ret;
> +
> +	ret =3D led_trigger_register(&timer_led_trigger);
> +	if (ret)
> +		return ret;
> +	if (reboot_off)
> +		register_reboot_notifier(&timer_reboot_nb);
> +	return 0;
> +}
> +
> +static void __exit timer_trig_exit(void)
> +{
> +	/* Not afraid of -ENOENT */
> +	unregister_reboot_notifier(&timer_reboot_nb);
> +	led_trigger_unregister(&timer_led_trigger);
> +}
> +
> +module_init(timer_trig_init);
> +module_exit(timer_trig_exit);
> =20
>  MODULE_AUTHOR("Richard Purdie <rpurdie@openedhand.com>");
>  MODULE_DESCRIPTION("Timer LED trigger");

--=20
http://www.livejournal.com/~pavelmachek

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCF0XUACgkQMOfwapXb+vLGXwCfT/ZhKdk8kl1vMeqc+MIUdDLY
UbcAniseCewwzdeVlpEO3/M668CbNeoH
=7h4z
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
