Return-Path: <linux-leds+bounces-180-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D79E7F9E19
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 12:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F54A2813BF
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 11:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56C318C11;
	Mon, 27 Nov 2023 11:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [91.198.224.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02D5135;
	Mon, 27 Nov 2023 03:03:24 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=1709d64187=fe@dev.tdt.de>)
	id 1r7ZOY-006UlZ-Q9; Mon, 27 Nov 2023 12:03:18 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <fe@dev.tdt.de>)
	id 1r7ZOY-006Uko-2Y; Mon, 27 Nov 2023 12:03:18 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id B0B84240049;
	Mon, 27 Nov 2023 12:03:17 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 24ED424004B;
	Mon, 27 Nov 2023 12:03:17 +0100 (CET)
Received: from localhost.localdomain (unknown [10.2.3.40])
	by mail.dev.tdt.de (Postfix) with ESMTPSA id 71FCB33D90;
	Mon, 27 Nov 2023 12:03:16 +0100 (CET)
From: Florian Eckert <fe@dev.tdt.de>
To: Eckert.Florian@googlemail.com,
	pavel@ucw.cz,
	lee@kernel.org,
	kabel@kernel.org,
	gregkh@linuxfoundation.org,
	u.kleine-koenig@pengutronix.de
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [Patch v9 1/4] tty: add new helper function tty_get_tiocm
Date: Mon, 27 Nov 2023 12:03:08 +0100
Message-ID: <20231127110311.3583957-2-fe@dev.tdt.de>
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
X-purgate-ID: 151534::1701082998-FA0CB49D-132AF335/0/0
X-purgate-type: clean
X-purgate: clean

There is no in-kernel function to get the status register of a tty device
like the TIOCMGET ioctl returns to userspace. Create a new function,
tty_get_tiocm(), to obtain the status register that other portions of the
kernel can call if they need this information, and move the existing
internal tty_tiocmget() function to use this interface.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 drivers/tty/tty_io.c | 28 ++++++++++++++++++++++------
 include/linux/tty.h  |  1 +
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 06414e43e0b5..e2e93404133e 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -2498,6 +2498,24 @@ static int send_break(struct tty_struct *tty, unsi=
gned int duration)
 	return retval;
 }
=20
+/**
+ * tty_get_tiocm - get tiocm status register
+ * @tty: tty device
+ *
+ * Obtain the modem status bits from the tty driver if the feature
+ * is supported.
+ */
+int tty_get_tiocm(struct tty_struct *tty)
+{
+	int retval =3D -ENOTTY;
+
+	if (tty->ops->tiocmget)
+		retval =3D tty->ops->tiocmget(tty);
+
+	return retval;
+}
+EXPORT_SYMBOL_GPL(tty_get_tiocm);
+
 /**
  * tty_tiocmget - get modem status
  * @tty: tty device
@@ -2510,14 +2528,12 @@ static int send_break(struct tty_struct *tty, uns=
igned int duration)
  */
 static int tty_tiocmget(struct tty_struct *tty, int __user *p)
 {
-	int retval =3D -ENOTTY;
+	int retval;
=20
-	if (tty->ops->tiocmget) {
-		retval =3D tty->ops->tiocmget(tty);
+	retval =3D tty_get_tiocm(tty);
+	if (retval >=3D 0)
+		retval =3D put_user(retval, p);
=20
-		if (retval >=3D 0)
-			retval =3D put_user(retval, p);
-	}
 	return retval;
 }
=20
diff --git a/include/linux/tty.h b/include/linux/tty.h
index 4b6340ac2af2..d219a11e3fe0 100644
--- a/include/linux/tty.h
+++ b/include/linux/tty.h
@@ -419,6 +419,7 @@ bool tty_unthrottle_safe(struct tty_struct *tty);
 int tty_do_resize(struct tty_struct *tty, struct winsize *ws);
 int tty_get_icount(struct tty_struct *tty,
 		struct serial_icounter_struct *icount);
+int tty_get_tiocm(struct tty_struct *tty);
 int is_current_pgrp_orphaned(void);
 void tty_hangup(struct tty_struct *tty);
 void tty_vhangup(struct tty_struct *tty);
--=20
2.30.2


