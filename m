Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEC4821CB11
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 21:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729162AbgGLTLR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 15:11:17 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:46962 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729122AbgGLTLR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 15:11:17 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DDD1E1C0BD2; Sun, 12 Jul 2020 21:11:11 +0200 (CEST)
Date:   Sun, 12 Jul 2020 21:11:11 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
        marek.behun@nic.cz
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200712191111.GA20592@amd>
References: <20200702144712.1994685-1-megous@megous.com>
 <20200711100409.GA18901@amd>
 <20200711210111.5ysijhexgyzyr7u7@core.my.home>
 <20200712072554.GC4721@duo.ucw.cz>
 <20200712134911.r3lig4hgyqhmslth@core.my.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <20200712134911.r3lig4hgyqhmslth@core.my.home>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > > Some LED controllers may come with an internal HW triggering mech=
anism
> > > > > for the LED and an ability to switch between user control of the =
LED,
> > > > > or the internal control. One such example is AXP20X PMIC, that al=
lows
> > > > > wither for user control of the LED, or for internal control based=
 on
> > > > > the state of the battery charger.
> > > > >=20
> > > > > Add support for registering per-LED device trigger.
> > > > >=20
> > > > > Names of private triggers need to be globally unique, but may cla=
sh
> > > > > with other private triggers. This is enforced during trigger
> > > > > registration. Developers can register private triggers just like
> > > > > the normal triggers, by setting private_led to a classdev
> > > > > of the LED the trigger is associated with.
> > > >=20
> > > > What about this? Should address Marek's concerns about resource use=
=2E..
> > >=20
> > > What concerns? Marek's concerns seem to be about case where we regist=
er
> > > a trigger for (each led * self-working configuration) which I admit
> > > can be quite a lot of triggers if there are many functions. But that's
> > > not my proposal.
> > >=20
> > > My proposal is to only register on trigger per LED at most. So on my
> > > system that's 1 extra trigger and on Marek's system that'd be 48 new
> > > triggers. Neither seems like a meaningful problem from resource
> > > use perspective.
> >=20
> > So.. 48 triggers on Marek's systems means I'll not apply your patch.
> >=20
> > Please take a look at my version, it is as simple and avoids that
> > problem.
>=20
> I would, but I don't see your version linked or mentioned in this
> thread.

Ah! Sorry about that. Here it is. (I verified it compiles in the
meantime).

Best regards,
								Pavel

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 79e30d2cb7a5..e8333675959c 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -27,6 +27,12 @@ LIST_HEAD(trigger_list);
=20
  /* Used by LED Class */
=20
+static inline bool
+trigger_relevant(struct led_classdev *led_cdev, struct led_trigger *trig)
+{
+	return !trig->trigger_type || trig->trigger_type =3D=3D led_cdev->trigger=
_type;
+}
+
 ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 			  struct bin_attribute *bin_attr, char *buf,
 			  loff_t pos, size_t count)
@@ -50,7 +56,8 @@ ssize_t led_trigger_write(struct file *filp, struct kobje=
ct *kobj,
=20
 	down_read(&triggers_list_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (sysfs_streq(buf, trig->name)) {
+		if (sysfs_streq(buf, trig->name) &&
+		    trigger_relevant(led_cdev, trig)) {
 			down_write(&led_cdev->trigger_lock);
 			led_trigger_set(led_cdev, trig);
 			up_write(&led_cdev->trigger_lock);
@@ -96,6 +103,9 @@ static int led_trigger_format(char *buf, size_t size,
 		bool hit =3D led_cdev->trigger &&
 			!strcmp(led_cdev->trigger->name, trig->name);
=20
+		if (!trigger_relevant(led_cdev, trig))
+			continue;
+
 		len +=3D led_trigger_snprintf(buf + len, size - len,
 					    " %s%s%s", hit ? "[" : "",
 					    trig->name, hit ? "]" : "");
@@ -243,7 +253,8 @@ void led_trigger_set_default(struct led_classdev *led_c=
dev)
 	down_read(&triggers_list_lock);
 	down_write(&led_cdev->trigger_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (!strcmp(led_cdev->default_trigger, trig->name)) {
+		if (!strcmp(led_cdev->default_trigger, trig->name) &&
+		    trigger_relevant(led_cdev, trig)) {
 			led_cdev->flags |=3D LED_INIT_DEFAULT_TRIGGER;
 			led_trigger_set(led_cdev, trig);
 			break;
@@ -280,7 +291,8 @@ int led_trigger_register(struct led_trigger *trig)
 	down_write(&triggers_list_lock);
 	/* Make sure the trigger's name isn't already in use */
 	list_for_each_entry(_trig, &trigger_list, next_trig) {
-		if (!strcmp(_trig->name, trig->name)) {
+		if (!strcmp(_trig->name, trig->name) &&
+		    (!_trig->private_led || _trig->private_led =3D=3D trig->private_led)=
) {
 			up_write(&triggers_list_lock);
 			return -EEXIST;
 		}
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 2451962d1ec5..cba52714558f 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -57,6 +57,10 @@ struct led_init_data {
 	bool devname_mandatory;
 };
=20
+struct led_hw_trigger_type {
+	int dummy;
+}
+
 struct led_classdev {
 	const char		*name;
 	enum led_brightness	 brightness;
@@ -150,6 +154,8 @@ struct led_classdev {
=20
 	/* Ensures consistent access to the LED Flash Class device */
 	struct mutex		led_access;
+
+	struct led_hw_trigger_type *trigger_type;
 };
=20
 /**
@@ -345,6 +351,9 @@ struct led_trigger {
 	int		(*activate)(struct led_classdev *led_cdev);
 	void		(*deactivate)(struct led_classdev *led_cdev);
=20
+	/* LED-private triggers have this set. */
+	struct led_hw_trigger_type *trigger_type;
+
 	/* LEDs under control by this trigger (for simple triggers) */
 	rwlock_t	  leddev_list_lock;
 	struct list_head  led_cdevs;

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8LYE8ACgkQMOfwapXb+vJdiQCeJ4trCd2rs4k4OMeb0h+YAMBw
ZUUAn1AK61+/gdi35YuNtLNw6hamB5Qb
=3ItD
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
