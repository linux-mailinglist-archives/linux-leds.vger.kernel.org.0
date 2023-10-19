Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 519807CF6BD
	for <lists+linux-leds@lfdr.de>; Thu, 19 Oct 2023 13:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345362AbjJSL2V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Oct 2023 07:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345346AbjJSL2U (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Oct 2023 07:28:20 -0400
Received: from mxout70.expurgate.net (mxout70.expurgate.net [91.198.224.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A38112;
        Thu, 19 Oct 2023 04:28:17 -0700 (PDT)
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <prvs=9670043017=fe@dev.tdt.de>)
        id 1qtRCJ-00493z-OI; Thu, 19 Oct 2023 13:28:15 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1qtRCJ-0022g8-Ar; Thu, 19 Oct 2023 13:28:15 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id 187EF24004B;
        Thu, 19 Oct 2023 13:28:15 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id C2ABF240040;
        Thu, 19 Oct 2023 13:28:14 +0200 (CEST)
Received: from localhost.localdomain (unknown [10.2.3.40])
        by mail.dev.tdt.de (Postfix) with ESMTPSA id 7D0262062B;
        Thu, 19 Oct 2023 13:28:14 +0200 (CEST)
From:   Florian Eckert <fe@dev.tdt.de>
To:     Eckert.Florian@googlemail.com, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, pavel@ucw.cz, lee@kernel.org,
        kabel@kernel.org, u.kleine-koenig@pengutronix.de,
        ansuelsmth@gmail.com, m.brock@vanmierlo.com
Cc:     linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v4 2/3] tty: add new helper function tty_get_tiocm
Date:   Thu, 19 Oct 2023 13:28:08 +0200
Message-ID: <20231019112809.881730-3-fe@dev.tdt.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231019112809.881730-1-fe@dev.tdt.de>
References: <20231019112809.881730-1-fe@dev.tdt.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Content-Transfer-Encoding: quoted-printable
X-purgate: clean
X-purgate-type: clean
X-purgate-ID: 151534::1697714895-F98EC49D-9EB96688/0/0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The struct 'tty_struct' has a callback to read the status flags of the tt=
y
if the tty driver provides them. So fare, the data is transferred directl=
y
to userspace with the function 'tty_tiocmget'. This function cannot be
used to evaluate the status line of the tty interface in the ledtrig-tty
trigger. To make this possible, a new function must be added that does
not immediately pass the data on to userspace.

The new function 'tty_get_tiocm' only returns the status register.
This information can then be processed further in the ledtrig-tty
trigger.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 drivers/tty/tty_io.c | 28 ++++++++++++++++++++++------
 include/linux/tty.h  |  1 +
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 3299a5d50727..a12f63854ac4 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -2494,6 +2494,24 @@ static int send_break(struct tty_struct *tty, unsi=
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
@@ -2506,14 +2524,12 @@ static int send_break(struct tty_struct *tty, uns=
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
index f002d0f25db7..8e4d0b3b12b7 100644
--- a/include/linux/tty.h
+++ b/include/linux/tty.h
@@ -421,6 +421,7 @@ int tty_unthrottle_safe(struct tty_struct *tty);
 int tty_do_resize(struct tty_struct *tty, struct winsize *ws);
 int tty_get_icount(struct tty_struct *tty,
 		struct serial_icounter_struct *icount);
+int tty_get_tiocm(struct tty_struct *tty);
 int is_current_pgrp_orphaned(void);
 void tty_hangup(struct tty_struct *tty);
 void tty_vhangup(struct tty_struct *tty);
--=20
2.30.2

