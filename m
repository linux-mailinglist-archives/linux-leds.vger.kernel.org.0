Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68DB32F5125
	for <lists+linux-leds@lfdr.de>; Wed, 13 Jan 2021 18:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbhAMRbK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 13 Jan 2021 12:31:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbhAMRbH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 13 Jan 2021 12:31:07 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68667C061794
        for <linux-leds@vger.kernel.org>; Wed, 13 Jan 2021 09:30:27 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kzjyN-0004u7-3M; Wed, 13 Jan 2021 18:30:19 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kzjyM-00022u-9o; Wed, 13 Jan 2021 18:30:18 +0100
Date:   Wed, 13 Jan 2021 18:30:18 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
        kernel@pengutronix.de, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v11] leds: trigger: implement a tty trigger
Message-ID: <20210113173018.bq2fkea2o3yp6rf6@pengutronix.de>
References: <20201218104246.591315-1-u.kleine-koenig@pengutronix.de>
 <20201218104246.591315-4-u.kleine-koenig@pengutronix.de>
 <X/8cwD51DYhzRdDO@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nmy3rlhv6pmrmaof"
Content-Disposition: inline
In-Reply-To: <X/8cwD51DYhzRdDO@kroah.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--nmy3rlhv6pmrmaof
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Usage is as follows:

	myled=3Dledname
	tty=3DttyS0

	echo tty > /sys/class/leds/$myled/trigger
	echo $tty > /sys/class/leds/$myled/ttyname

=2E When this new trigger is active it periodically checks the tty's
statistics and when it changed since the last check the led is flashed
once.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
Hello,

On Wed, Jan 13, 2021 at 05:16:00PM +0100, Greg Kroah-Hartman wrote:
> This causes the following build warning with the patch applied:
>=20
> drivers/leds/trigger/ledtrig-tty.c:19:13: warning: =E2=80=98ledtrig_tty_h=
alt=E2=80=99 defined but not used [-Wunused-function]
>    19 | static void ledtrig_tty_halt(struct ledtrig_tty_data *trigger_dat=
a)
>       |             ^~~~~~~~~~~~~~~~
>=20
> Can you fix this up and just resend this patch (the other 2 are already
> in my tree),

oh indeed. Thanks for catching this and so preventing me still more
shame when I have to receive a dozen or so patches that fix this :-)
Droping this function is the only change since v10.

> so that I can queue it up?

Oh, so you are LED maintainer now? My congratulations.
(Honestly, do you plan to apply this without their ack? Not that I'm
against you doing that, I'm happy if I can archive this patch series as
done, but I'm a bit surprised.)

Best regards
Uwe

 .../ABI/testing/sysfs-class-led-trigger-tty   |   6 +
 drivers/leds/trigger/Kconfig                  |   9 +
 drivers/leds/trigger/Makefile                 |   1 +
 drivers/leds/trigger/ledtrig-tty.c            | 183 ++++++++++++++++++
 4 files changed, 199 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-tty
 create mode 100644 drivers/leds/trigger/ledtrig-tty.c

diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-tty b/Docume=
ntation/ABI/testing/sysfs-class-led-trigger-tty
new file mode 100644
index 000000000000..2bf6b24e781b
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
@@ -0,0 +1,6 @@
+What:		/sys/class/leds/<led>/ttyname
+Date:		Dec 2020
+KernelVersion:	5.10
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Specifies the tty device name of the triggering tty
diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index ce9429ca6dde..b77a01bd27f4 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -144,4 +144,13 @@ config LEDS_TRIGGER_AUDIO
 	  the audio mute and mic-mute changes.
 	  If unsure, say N
=20
+config LEDS_TRIGGER_TTY
+	tristate "LED Trigger for TTY devices"
+	depends on TTY
+	help
+	  This allows LEDs to be controlled by activity on ttys which includes
+	  serial devices like /dev/ttyS0.
+
+	  When build as a module this driver will be called ledtrig-tty.
+
 endif # LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
index 733a83e2a718..25c4db97cdd4 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+=3D ledtrig-panic.o
 obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+=3D ledtrig-netdev.o
 obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+=3D ledtrig-pattern.o
 obj-$(CONFIG_LEDS_TRIGGER_AUDIO)	+=3D ledtrig-audio.o
+obj-$(CONFIG_LEDS_TRIGGER_TTY)		+=3D ledtrig-tty.o
diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledt=
rig-tty.c
new file mode 100644
index 000000000000..d2ab6ab080ac
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/delay.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/tty.h>
+#include <uapi/linux/serial.h>
+
+struct ledtrig_tty_data {
+	struct led_classdev *led_cdev;
+	struct delayed_work dwork;
+	struct mutex mutex;
+	const char *ttyname;
+	struct tty_struct *tty;
+	int rx, tx;
+};
+
+static void ledtrig_tty_restart(struct ledtrig_tty_data *trigger_data)
+{
+	schedule_delayed_work(&trigger_data->dwork, 0);
+}
+
+static ssize_t ttyname_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct ledtrig_tty_data *trigger_data =3D led_trigger_get_drvdata(dev);
+	ssize_t len =3D 0;
+
+	mutex_lock(&trigger_data->mutex);
+
+	if (trigger_data->ttyname)
+		len =3D sprintf(buf, "%s\n", trigger_data->ttyname);
+
+	mutex_unlock(&trigger_data->mutex);
+
+	return len;
+}
+
+static ssize_t ttyname_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t size)
+{
+	struct ledtrig_tty_data *trigger_data =3D led_trigger_get_drvdata(dev);
+	char *ttyname;
+	ssize_t ret =3D size;
+	bool running;
+
+	if (size > 0 && buf[size - 1] =3D=3D '\n')
+		size -=3D 1;
+
+	if (size) {
+		ttyname =3D kmemdup_nul(buf, size, GFP_KERNEL);
+		if (!ttyname) {
+			ret =3D -ENOMEM;
+			goto out_unlock;
+		}
+	} else {
+		ttyname =3D NULL;
+	}
+
+	mutex_lock(&trigger_data->mutex);
+
+	running =3D trigger_data->ttyname !=3D NULL;
+
+	kfree(trigger_data->ttyname);
+	tty_kref_put(trigger_data->tty);
+	trigger_data->tty =3D NULL;
+
+	trigger_data->ttyname =3D ttyname;
+
+out_unlock:
+	mutex_unlock(&trigger_data->mutex);
+
+	if (ttyname && !running)
+		ledtrig_tty_restart(trigger_data);
+
+	return ret;
+}
+static DEVICE_ATTR_RW(ttyname);
+
+static void ledtrig_tty_work(struct work_struct *work)
+{
+	struct ledtrig_tty_data *trigger_data =3D
+		container_of(work, struct ledtrig_tty_data, dwork.work);
+	struct serial_icounter_struct icount;
+	int ret;
+
+	mutex_lock(&trigger_data->mutex);
+
+	if (!trigger_data->ttyname) {
+		/* exit without rescheduling */
+		mutex_unlock(&trigger_data->mutex);
+		return;
+	}
+
+	/* try to get the tty corresponding to $ttyname */
+	if (!trigger_data->tty) {
+		dev_t devno;
+		struct tty_struct *tty;
+		int ret;
+
+		ret =3D tty_dev_name_to_number(trigger_data->ttyname, &devno);
+		if (ret < 0)
+			/*
+			 * A device with this name might appear later, so keep
+			 * retrying.
+			 */
+			goto out;
+
+		tty =3D tty_kopen_shared(devno);
+		if (IS_ERR(tty) || !tty)
+			/* What to do? retry or abort */
+			goto out;
+
+		trigger_data->tty =3D tty;
+	}
+
+	ret =3D tty_get_icount(trigger_data->tty, &icount);
+	if (ret) {
+		dev_info(trigger_data->tty->dev, "Failed to get icount, stopped polling\=
n");
+		mutex_unlock(&trigger_data->mutex);
+		return;
+	}
+
+	if (icount.rx !=3D trigger_data->rx ||
+	    icount.tx !=3D trigger_data->tx) {
+		led_set_brightness(trigger_data->led_cdev, LED_ON);
+
+		trigger_data->rx =3D icount.rx;
+		trigger_data->tx =3D icount.tx;
+	} else {
+		led_set_brightness(trigger_data->led_cdev, LED_OFF);
+	}
+
+out:
+	mutex_unlock(&trigger_data->mutex);
+	schedule_delayed_work(&trigger_data->dwork, msecs_to_jiffies(100));
+}
+
+static struct attribute *ledtrig_tty_attrs[] =3D {
+	&dev_attr_ttyname.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(ledtrig_tty);
+
+static int ledtrig_tty_activate(struct led_classdev *led_cdev)
+{
+	struct ledtrig_tty_data *trigger_data;
+
+	trigger_data =3D kzalloc(sizeof(*trigger_data), GFP_KERNEL);
+	if (!trigger_data)
+		return -ENOMEM;
+
+	led_set_trigger_data(led_cdev, trigger_data);
+
+	INIT_DELAYED_WORK(&trigger_data->dwork, ledtrig_tty_work);
+	trigger_data->led_cdev =3D led_cdev;
+	mutex_init(&trigger_data->mutex);
+
+	return 0;
+}
+
+static void ledtrig_tty_deactivate(struct led_classdev *led_cdev)
+{
+	struct ledtrig_tty_data *trigger_data =3D led_get_trigger_data(led_cdev);
+
+	cancel_delayed_work_sync(&trigger_data->dwork);
+
+	kfree(trigger_data);
+}
+
+static struct led_trigger ledtrig_tty =3D {
+	.name =3D "tty",
+	.activate =3D ledtrig_tty_activate,
+	.deactivate =3D ledtrig_tty_deactivate,
+	.groups =3D ledtrig_tty_groups,
+};
+module_led_trigger(ledtrig_tty);
+
+MODULE_AUTHOR("Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>");
+MODULE_DESCRIPTION("UART LED trigger");
+MODULE_LICENSE("GPL v2");

base-commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
prerequisite-patch-id: a2c3eea0944a3ae222a4429ba4983d24bea8e0fa
prerequisite-patch-id: 8203736a5395e3deef08add27f70f0f00b845d43
--=20
2.29.2

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nmy3rlhv6pmrmaof
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl//LiYACgkQwfwUeK3K
7An2LAf+MUiZrHxM362eFWmDlTqQsartDfdj83msWa2U1LeXxANOmxnLMVJpLc5V
oMeryoLdPwrgVrLO+7FmBqxO15wqM6d7iFzxol+13lHzxgYJ4LHgJAPhBnNeozd7
UWTJNoshoQwecj7DfFnLwwz/nBpmljC3DK68UkiUP0DxSsq8jUODeS7NNCz2Qqgk
Ol/DWvk0TE0A8i3D2fNv9wpVaQb4QnSVj+ZC1PlP5a6Yy1zVSNIqMI7VmGQnPvVe
zsOdS7lvrPNgrBa5a73NWWlMwx4dEHFzpp2k8iKqf1+OUN2+Ib5P2iQfJmGnZ4D/
7LQn/J/HLnnEi171lyys7IXIbPIgXw==
=o+GN
-----END PGP SIGNATURE-----

--nmy3rlhv6pmrmaof--
