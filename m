Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5977E21B5
	for <lists+linux-leds@lfdr.de>; Mon,  6 Nov 2023 13:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbjKFMek (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Nov 2023 07:34:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbjKFMeh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Nov 2023 07:34:37 -0500
Received: from mxout70.expurgate.net (mxout70.expurgate.net [91.198.224.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC9EB6;
        Mon,  6 Nov 2023 04:34:34 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <prvs=068806c1c2=fe@dev.tdt.de>)
        id 1qzyoH-00BFYS-3c; Mon, 06 Nov 2023 13:34:29 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1qzyoG-00Ddr6-7d; Mon, 06 Nov 2023 13:34:28 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id DCE61240050;
        Mon,  6 Nov 2023 13:34:27 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id 3BB64240052;
        Mon,  6 Nov 2023 13:34:27 +0100 (CET)
Received: from localhost.localdomain (unknown [10.2.3.40])
        by mail.dev.tdt.de (Postfix) with ESMTPSA id 05AE1227EE;
        Mon,  6 Nov 2023 13:34:27 +0100 (CET)
From:   Florian Eckert <fe@dev.tdt.de>
To:     Eckert.Florian@googlemail.com, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, pavel@ucw.cz, lee@kernel.org,
        kabel@kernel.org, u.kleine-koenig@pengutronix.de,
        m.brock@vanmierlo.com
Cc:     linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [Patch v7 3/6] leds: ledtrig-tty: change logging if get icount failed
Date:   Mon,  6 Nov 2023 13:34:12 +0100
Message-ID: <20231106123415.3365732-4-fe@dev.tdt.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231106123415.3365732-1-fe@dev.tdt.de>
References: <20231106123415.3365732-1-fe@dev.tdt.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Content-Transfer-Encoding: quoted-printable
X-purgate: clean
X-purgate-ID: 151534::1699274068-65079C7C-E3564830/0/0
X-purgate-type: clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Change the log level from info to warn, because there is something
wrong. That is more a warn message than an info message.

While we are at it, the device prefix is also changed, as this is the
led device and not the tty device that generates this message.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 drivers/leds/trigger/ledtrig-tty.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/le=
dtrig-tty.c
index 3e69a7bde928..86595add72cd 100644
--- a/drivers/leds/trigger/ledtrig-tty.c
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -83,6 +83,7 @@ static void ledtrig_tty_work(struct work_struct *work)
 	struct ledtrig_tty_data *trigger_data =3D
 		container_of(work, struct ledtrig_tty_data, dwork.work);
 	struct serial_icounter_struct icount;
+	struct led_classdev *led_cdev =3D trigger_data->led_cdev;
 	int ret;
=20
 	mutex_lock(&trigger_data->mutex);
@@ -117,7 +118,7 @@ static void ledtrig_tty_work(struct work_struct *work=
)
=20
 	ret =3D tty_get_icount(trigger_data->tty, &icount);
 	if (ret) {
-		dev_info(trigger_data->tty->dev, "Failed to get icount, stopped pollin=
g\n");
+		dev_warn(led_cdev->dev, "Failed to get icount, stop polling\n");
 		mutex_unlock(&trigger_data->mutex);
 		return;
 	}
@@ -126,8 +127,7 @@ static void ledtrig_tty_work(struct work_struct *work=
)
 	    icount.tx !=3D trigger_data->tx) {
 		unsigned long interval =3D LEDTRIG_TTY_INTERVAL;
=20
-		led_blink_set_oneshot(trigger_data->led_cdev, &interval,
-				      &interval, 0);
+		led_blink_set_oneshot(led_cdev, &interval, &interval, 0);
=20
 		trigger_data->rx =3D icount.rx;
 		trigger_data->tx =3D icount.tx;
--=20
2.30.2

