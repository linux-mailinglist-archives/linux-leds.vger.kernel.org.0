Return-Path: <linux-leds+bounces-1692-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5F18CC531
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2024 18:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E0F1B2037D
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2024 16:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6186141987;
	Wed, 22 May 2024 16:54:10 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A5249F9
	for <linux-leds@vger.kernel.org>; Wed, 22 May 2024 16:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716396850; cv=none; b=np97AwNrNJryT5MXWftN/5r6L/Y2xvnHNVMSFPrsvUDrAOekv6fP4FBe8mRtt0rtze5gwJFH4eF/FKfSeSAdRqVG6oo2r+XN1EXaAfXqIDVdpRfobBbX28reiLI2HsXBCp5mu/rIFOq0xGVbJsNCVbGZHHMX6kIOPJhDYRWu7r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716396850; c=relaxed/simple;
	bh=uJrygjf21XvLOzivoZDKOSI+lOFZ3c5IrGAIZvY4UMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GBU0CmrDaK9F0UuPYqXdBHaWij4Thoy4HChrqGcj8NLFkhX31m9yjClmibuLXaBA3BFJrncmgUnOM9wUb9SmVmfk8JG/uM+QIL7QVdBpbmWtxnM+aIw1uPACzh14pdlwtnHvJi381fZBPCgi2quLs8oUZjhdZ70G+WadhLzYS8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s9pE3-0007VA-G1; Wed, 22 May 2024 18:54:03 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s9pE2-002YC6-Of; Wed, 22 May 2024 18:54:02 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s9pE2-00AA0G-2C;
	Wed, 22 May 2024 18:54:02 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] leds: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Wed, 22 May 2024 18:53:59 +0200
Message-ID: <20240522165358.62238-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7469; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=uJrygjf21XvLOzivoZDKOSI+lOFZ3c5IrGAIZvY4UMY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmTiMmqDVS0AA0ZCqLhksSbGjgSHTIQpp9VmUCU CtPQAUOKMmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZk4jJgAKCRCPgPtYfRL+ Tq8AB/0e4SHFTDed8/ygyJcwJRiiDjftVdvdxuYhdBkz1uxUSaTZJEWiZk6ayQEpYyx4JkxO1lu AN/yJ/XPHtY8Gb59xeEjnuHFRzuymUBfItldUNDoDv3LhgwbZ/M1+6mu3ZIl64R5nJ+iY/FhRlw WftB5i+hq5U5jc6HqsgmC7ffphuozsDUJKOn3RAKmTmyxFBoQ3L7qC4jE8svJZxcvhgl95mZuDa DQv5WLXQxG78cbM6LwzPEOOTHqmozM0tvAHJXO9nE9hwlFbBtFkvAPmWy1mouCMCiDNAhXRW7y7 f12W4x3H8lKr5TOs3ylhsTcnI47p5OMrsvL8vPvcLa0H5pi0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

While add it, also remove commas after the sentinel entries.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/flash/leds-as3645a.c | 4 ++--
 drivers/leds/leds-an30259a.c      | 4 ++--
 drivers/leds/leds-bd2802.c        | 2 +-
 drivers/leds/leds-blinkm.c        | 2 +-
 drivers/leds/leds-lm3530.c        | 2 +-
 drivers/leds/leds-lm3532.c        | 2 +-
 drivers/leds/leds-lm3642.c        | 2 +-
 drivers/leds/leds-lm3697.c        | 2 +-
 drivers/leds/leds-lp3944.c        | 2 +-
 drivers/leds/leds-lp3952.c        | 2 +-
 drivers/leds/leds-lp5521.c        | 2 +-
 drivers/leds/leds-lp5562.c        | 2 +-
 drivers/leds/leds-lp8501.c        | 2 +-
 drivers/leds/leds-lp8860.c        | 2 +-
 drivers/leds/leds-turris-omnia.c  | 2 +-
 15 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/flash/leds-as3645a.c b/drivers/leds/flash/leds-as3645a.c
index 12c2609c1137..2c6ef321b7c8 100644
--- a/drivers/leds/flash/leds-as3645a.c
+++ b/drivers/leds/flash/leds-as3645a.c
@@ -743,8 +743,8 @@ static void as3645a_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id as3645a_id_table[] = {
-	{ AS_NAME, 0 },
-	{ },
+	{ AS_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, as3645a_id_table);
 
diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
index decfca447d8a..a42cc4bc6917 100644
--- a/drivers/leds/leds-an30259a.c
+++ b/drivers/leds/leds-an30259a.c
@@ -331,8 +331,8 @@ static const struct of_device_id an30259a_match_table[] = {
 MODULE_DEVICE_TABLE(of, an30259a_match_table);
 
 static const struct i2c_device_id an30259a_id[] = {
-	{ "an30259a", 0 },
-	{ /* sentinel */ },
+	{ "an30259a" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, an30259a_id);
 
diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
index 0792ea126cea..2a08c5f27608 100644
--- a/drivers/leds/leds-bd2802.c
+++ b/drivers/leds/leds-bd2802.c
@@ -776,7 +776,7 @@ static int bd2802_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(bd2802_pm, bd2802_suspend, bd2802_resume);
 
 static const struct i2c_device_id bd2802_id[] = {
-	{ "BD2802", 0 },
+	{ "BD2802" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bd2802_id);
diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index 2782da1a1930..e40b87aead2d 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -718,7 +718,7 @@ static void blinkm_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id blinkm_id[] = {
-	{"blinkm", 0},
+	{ "blinkm" },
 	{}
 };
 
diff --git a/drivers/leds/leds-lm3530.c b/drivers/leds/leds-lm3530.c
index a2feef8e4ac5..e44a3db106c3 100644
--- a/drivers/leds/leds-lm3530.c
+++ b/drivers/leds/leds-lm3530.c
@@ -478,7 +478,7 @@ static void lm3530_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3530_id[] = {
-	{LM3530_NAME, 0},
+	{ LM3530_NAME },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, lm3530_id);
diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 8c90701dc50d..54b5650877f7 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -726,7 +726,7 @@ static const struct of_device_id of_lm3532_leds_match[] = {
 MODULE_DEVICE_TABLE(of, of_lm3532_leds_match);
 
 static const struct i2c_device_id lm3532_id[] = {
-	{LM3532_NAME, 0},
+	{ LM3532_NAME },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, lm3532_id);
diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index 6eee52e211be..61629d5d6703 100644
--- a/drivers/leds/leds-lm3642.c
+++ b/drivers/leds/leds-lm3642.c
@@ -390,7 +390,7 @@ static void lm3642_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3642_id[] = {
-	{LM3642_NAME, 0},
+	{ LM3642_NAME },
 	{}
 };
 
diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 380d17a58fe9..99de2a331727 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -360,7 +360,7 @@ static void lm3697_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3697_id[] = {
-	{ "lm3697", 0 },
+	{ "lm3697" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm3697_id);
diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
index 8ea746c499d1..ccfeee49ea78 100644
--- a/drivers/leds/leds-lp3944.c
+++ b/drivers/leds/leds-lp3944.c
@@ -417,7 +417,7 @@ static void lp3944_remove(struct i2c_client *client)
 
 /* lp3944 i2c driver struct */
 static const struct i2c_device_id lp3944_id[] = {
-	{"lp3944", 0},
+	{ "lp3944" },
 	{}
 };
 
diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
index ff7bae2447dd..17219a582704 100644
--- a/drivers/leds/leds-lp3952.c
+++ b/drivers/leds/leds-lp3952.c
@@ -266,7 +266,7 @@ static int lp3952_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp3952_id[] = {
-	{LP3952_NAME, 0},
+	{ LP3952_NAME },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, lp3952_id);
diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index f9c8b568b652..d242c12e7569 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -591,7 +591,7 @@ static void lp5521_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp5521_id[] = {
-	{ "lp5521", 0 }, /* Three channel chip */
+	{ "lp5521" }, /* Three channel chip */
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp5521_id);
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 39db9aeb67c5..e545ca8bd1f6 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -584,7 +584,7 @@ static void lp5562_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp5562_id[] = {
-	{ "lp5562", 0 },
+	{ "lp5562" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp5562_id);
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index ac50aa88939a..68b5c7ae31b9 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -375,7 +375,7 @@ static void lp8501_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp8501_id[] = {
-	{ "lp8501",  0 },
+	{ "lp8501" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp8501_id);
diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 19b621012e58..7a136fd81720 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -459,7 +459,7 @@ static void lp8860_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp8860_id[] = {
-	{ "lp8860", 0 },
+	{ "lp8860" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp8860_id);
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index b443f8c989fa..39f740be058f 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -534,7 +534,7 @@ static const struct of_device_id of_omnia_leds_match[] = {
 };
 
 static const struct i2c_device_id omnia_id[] = {
-	{ "omnia", 0 },
+	{ "omnia" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, omnia_id);

base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
-- 
2.43.0


