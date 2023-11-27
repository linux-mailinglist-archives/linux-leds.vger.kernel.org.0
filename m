Return-Path: <linux-leds+bounces-170-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D94F7F9B78
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 09:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 079741F203F8
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 08:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A51111AE;
	Mon, 27 Nov 2023 08:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80FCBE;
	Mon, 27 Nov 2023 00:16:49 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=1709d64187=fe@dev.tdt.de>)
	id 1r7WnM-00GQ7c-2X; Mon, 27 Nov 2023 09:16:44 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <fe@dev.tdt.de>)
	id 1r7WnL-00GVdx-8q; Mon, 27 Nov 2023 09:16:43 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id 71E83240049;
	Mon, 27 Nov 2023 09:16:42 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id D7905240040;
	Mon, 27 Nov 2023 09:16:41 +0100 (CET)
Received: from localhost.localdomain (unknown [10.2.3.40])
	by mail.dev.tdt.de (Postfix) with ESMTPSA id 5A44133D23;
	Mon, 27 Nov 2023 09:16:41 +0100 (CET)
From: Florian Eckert <fe@dev.tdt.de>
To: Eckert.Florian@googlemail.com,
	pavel@ucw.cz,
	lee@kernel.org,
	kabel@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-leds@vger.kernel.org,
	stable@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [Patch v3 1/1] leds: ledtrig-tty: free allocated ttyname buffer on deactivate
Date: Mon, 27 Nov 2023 09:16:21 +0100
Message-ID: <20231127081621.774866-1-fe@dev.tdt.de>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: 151534::1701073003-9BC34DE9-1B3A693A/0/0
X-purgate: clean
X-purgate-type: clean

The ttyname buffer for the ledtrig_tty_data struct is allocated in the
sysfs ttyname_store() function. This buffer must be released on trigger
deactivation. This was missing and is thus a memory leak.

While we are at it, the tty handler in the ledtrig_tty_data struct should
also be returned in case of the trigger deactivation call.

Cc: stable@vger.kernel.org
Fixes: fd4a641ac88f ("leds: trigger: implement a tty trigger")
Signed-off-by: Florian Eckert <fe@dev.tdt.de>
Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
v1 -> v2:
Add Cc: tag
v2 -> v3:
Add Reviewed-by and resend witout changes

 drivers/leds/trigger/ledtrig-tty.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/le=
dtrig-tty.c
index 8ae0d2d284af..3e69a7bde928 100644
--- a/drivers/leds/trigger/ledtrig-tty.c
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -168,6 +168,10 @@ static void ledtrig_tty_deactivate(struct led_classd=
ev *led_cdev)
=20
 	cancel_delayed_work_sync(&trigger_data->dwork);
=20
+	kfree(trigger_data->ttyname);
+	tty_kref_put(trigger_data->tty);
+	trigger_data->tty =3D NULL;
+
 	kfree(trigger_data);
 }
=20
--=20
2.30.2


