Return-Path: <linux-leds+bounces-181-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5629B7F9E1D
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 12:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD390B20DE7
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 11:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C2818C1D;
	Mon, 27 Nov 2023 11:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [91.198.224.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF8E12F;
	Mon, 27 Nov 2023 03:03:24 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=1709d64187=fe@dev.tdt.de>)
	id 1r7ZOZ-006Um5-DO; Mon, 27 Nov 2023 12:03:19 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <fe@dev.tdt.de>)
	id 1r7ZOY-006UlJ-ND; Mon, 27 Nov 2023 12:03:18 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id 617F0240040;
	Mon, 27 Nov 2023 12:03:18 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id CC98D24004B;
	Mon, 27 Nov 2023 12:03:17 +0100 (CET)
Received: from localhost.localdomain (unknown [10.2.3.40])
	by mail.dev.tdt.de (Postfix) with ESMTPSA id 6E1B333D8E;
	Mon, 27 Nov 2023 12:03:17 +0100 (CET)
From: Florian Eckert <fe@dev.tdt.de>
To: Eckert.Florian@googlemail.com,
	pavel@ucw.cz,
	lee@kernel.org,
	kabel@kernel.org,
	gregkh@linuxfoundation.org,
	u.kleine-koenig@pengutronix.de
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [Patch v9 3/4] leds: ledtrig-tty: make rx tx activitate configurable
Date: Mon, 27 Nov 2023 12:03:10 +0100
Message-ID: <20231127110311.3583957-4-fe@dev.tdt.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231127110311.3583957-1-fe@dev.tdt.de>
References: <20231127110311.3583957-1-fe@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-purgate-type: clean
X-purgate: clean
X-purgate-ID: 151534::1701082999-FA0CB49D-11F123A3/0/0

Until now, the LED blinks when data is sent via the tty (rx/tx).
This is not configurable.

This change adds the possibility to make the indication for the direction
of the transmitted data independently controllable via the new rx and
tx sysfs entries.

- rx:
  Signal reception (rx) of data on the named tty device.
  If set to 0, the LED will not blink on reception.
  If set to 1 (default), the LED will blink on reception.

- tx:
  Signal transmission (tx) of data on the named tty device.
  If set to 0, the LED will not blink on transmission.
  If set to 1 (default), the LED will blink on transmission.

This new sysfs entry are on by default. Thus the trigger behaves as
before this change.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 .../ABI/testing/sysfs-class-led-trigger-tty   |  16 +++
 drivers/leds/trigger/ledtrig-tty.c            | 114 ++++++++++++++++--
 2 files changed, 119 insertions(+), 11 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-tty b/Docu=
mentation/ABI/testing/sysfs-class-led-trigger-tty
index 2bf6b24e781b..504dece151b8 100644
--- a/Documentation/ABI/testing/sysfs-class-led-trigger-tty
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
@@ -4,3 +4,19 @@ KernelVersion:	5.10
 Contact:	linux-leds@vger.kernel.org
 Description:
 		Specifies the tty device name of the triggering tty
+
+What:		/sys/class/leds/<led>/rx
+Date:		February 2024
+KernelVersion:	6.8
+Description:
+		Signal reception (rx) of data on the named tty device.
+		If set to 0, the LED will not blink on reception.
+		If set to 1 (default), the LED will blink on reception.
+
+What:		/sys/class/leds/<led>/tx
+Date:		February 2024
+KernelVersion:	6.8
+Description:
+		Signal transmission (tx) of data on the named tty device.
+		If set to 0, the LED will not blink on transmission.
+		If set to 1 (default), the LED will blink on transmission.
diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/le=
dtrig-tty.c
index 0d73bec1529f..ee6d01ecb309 100644
--- a/drivers/leds/trigger/ledtrig-tty.c
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -17,6 +17,19 @@ struct ledtrig_tty_data {
 	const char *ttyname;
 	struct tty_struct *tty;
 	int rx, tx;
+	bool mode_rx;
+	bool mode_tx;
+};
+
+/* Indicates which state the LED should now display */
+enum led_trigger_tty_state {
+	TTY_LED_BLINK,
+	TTY_LED_DISABLE,
+};
+
+enum led_trigger_tty_modes {
+	TRIGGER_TTY_RX =3D 0,
+	TRIGGER_TTY_TX,
 };
=20
 static int ledtrig_tty_wait_for_completion(struct device *dev)
@@ -85,11 +98,69 @@ static ssize_t ttyname_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(ttyname);
=20
+static ssize_t ledtrig_tty_attr_show(struct device *dev, char *buf,
+				     enum led_trigger_tty_modes attr)
+{
+	struct ledtrig_tty_data *trigger_data =3D led_trigger_get_drvdata(dev);
+	bool state;
+
+	switch (attr) {
+	case TRIGGER_TTY_RX:
+		state =3D trigger_data->mode_rx;
+		break;
+	case TRIGGER_TTY_TX:
+		state =3D trigger_data->mode_tx;
+		break;
+	}
+
+	return sysfs_emit(buf, "%u\n", state);
+}
+
+static ssize_t ledtrig_tty_attr_store(struct device *dev, const char *bu=
f,
+				      size_t size, enum led_trigger_tty_modes attr)
+{
+	struct ledtrig_tty_data *trigger_data =3D led_trigger_get_drvdata(dev);
+	bool state;
+	int ret;
+
+	ret =3D kstrtobool(buf, &state);
+	if (ret)
+		return ret;
+
+	switch (attr) {
+	case TRIGGER_TTY_RX:
+		trigger_data->mode_rx =3D state;
+		break;
+	case TRIGGER_TTY_TX:
+		trigger_data->mode_tx =3D state;
+		break;
+	}
+
+	return size;
+}
+
+#define DEFINE_TTY_TRIGGER(trigger_name, trigger) \
+	static ssize_t trigger_name##_show(struct device *dev, \
+		struct device_attribute *attr, char *buf) \
+	{ \
+		return ledtrig_tty_attr_show(dev, buf, trigger); \
+	} \
+	static ssize_t trigger_name##_store(struct device *dev, \
+		struct device_attribute *attr, const char *buf, size_t size) \
+	{ \
+		return ledtrig_tty_attr_store(dev, buf, size, trigger); \
+	} \
+	static DEVICE_ATTR_RW(trigger_name)
+
+DEFINE_TTY_TRIGGER(rx, TRIGGER_TTY_RX);
+DEFINE_TTY_TRIGGER(tx, TRIGGER_TTY_TX);
+
 static void ledtrig_tty_work(struct work_struct *work)
 {
 	struct ledtrig_tty_data *trigger_data =3D
 		container_of(work, struct ledtrig_tty_data, dwork.work);
-	struct serial_icounter_struct icount;
+	enum led_trigger_tty_state state =3D TTY_LED_DISABLE;
+	unsigned long interval =3D LEDTRIG_TTY_INTERVAL;
 	int ret;
=20
 	if (!trigger_data->ttyname)
@@ -117,22 +188,37 @@ static void ledtrig_tty_work(struct work_struct *wo=
rk)
 		trigger_data->tty =3D tty;
 	}
=20
-	ret =3D tty_get_icount(trigger_data->tty, &icount);
-	if (ret)
-		goto out;
+	if (trigger_data->mode_rx || trigger_data->mode_tx) {
+		struct serial_icounter_struct icount;
=20
-	if (icount.rx !=3D trigger_data->rx ||
-	    icount.tx !=3D trigger_data->tx) {
-		unsigned long interval =3D LEDTRIG_TTY_INTERVAL;
+		ret =3D tty_get_icount(trigger_data->tty, &icount);
+		if (ret)
+			goto out;
=20
-		led_blink_set_oneshot(trigger_data->led_cdev, &interval,
-				      &interval, 0);
+		if (trigger_data->mode_tx && (icount.tx !=3D trigger_data->tx)) {
+			trigger_data->tx =3D icount.tx;
+			state =3D TTY_LED_BLINK;
+		}
=20
-		trigger_data->rx =3D icount.rx;
-		trigger_data->tx =3D icount.tx;
+		if (trigger_data->mode_rx && (icount.rx !=3D trigger_data->rx)) {
+			trigger_data->rx =3D icount.rx;
+			state =3D TTY_LED_BLINK;
+		}
 	}
=20
 out:
+	switch (state) {
+	case TTY_LED_BLINK:
+		led_blink_set_oneshot(trigger_data->led_cdev, &interval,
+				&interval, 0);
+		break;
+	case TTY_LED_DISABLE:
+		fallthrough;
+	default:
+		led_set_brightness(trigger_data->led_cdev, LED_OFF);
+		break;
+	}
+
 	complete_all(&trigger_data->sysfs);
 	schedule_delayed_work(&trigger_data->dwork,
 			      msecs_to_jiffies(LEDTRIG_TTY_INTERVAL * 2));
@@ -140,6 +226,8 @@ static void ledtrig_tty_work(struct work_struct *work=
)
=20
 static struct attribute *ledtrig_tty_attrs[] =3D {
 	&dev_attr_ttyname.attr,
+	&dev_attr_rx.attr,
+	&dev_attr_tx.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(ledtrig_tty);
@@ -152,6 +240,10 @@ static int ledtrig_tty_activate(struct led_classdev =
*led_cdev)
 	if (!trigger_data)
 		return -ENOMEM;
=20
+	/* Enable default rx/tx mode */
+	trigger_data->mode_rx =3D true;
+	trigger_data->mode_tx =3D true;
+
 	led_set_trigger_data(led_cdev, trigger_data);
=20
 	INIT_DELAYED_WORK(&trigger_data->dwork, ledtrig_tty_work);
--=20
2.30.2


