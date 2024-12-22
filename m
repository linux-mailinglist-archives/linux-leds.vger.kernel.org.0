Return-Path: <linux-leds+bounces-3692-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 869419FA7DC
	for <lists+linux-leds@lfdr.de>; Sun, 22 Dec 2024 21:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF8A6165A1E
	for <lists+linux-leds@lfdr.de>; Sun, 22 Dec 2024 20:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B490913A244;
	Sun, 22 Dec 2024 20:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="HU4Se2ly"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DA3748D;
	Sun, 22 Dec 2024 20:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734897899; cv=none; b=c0Anaa1hSfXzrd+dsf1ESLroqSr6U26P/REEFBajKcVcNc4WOGfdZjFao8+Hr693amOpQRjo7SPd206o5Tj/lyEXUZXJYiF8GDnPQYoJ7T7gJRhnFuldM0V5Hzzm+hrGQdmwTQCjLdENYmtYazaN7sNuGZy8HZU4pB1xG/sVfLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734897899; c=relaxed/simple;
	bh=IUsODn5TmnaQpCwJ4Im9kF+HCMYOj2OnDKc9Tg7Tu40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vmfn8BJNxqyG5zktMIcJyPhDg0H62lgtiCdB31lrksZxTSGjtLMETXAmV2pe19UDLDH5VgHjY1E3wzLn8NtgG6iTzNH4JTdLbcry3zNvPqj6oTDWI4/gb5McRuaNvxNOoobVLbkB6d4Bd7ZY4UlogcqLEppnyfSTk7fVqEJ7Cbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=HU4Se2ly; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734897893;
	bh=IUsODn5TmnaQpCwJ4Im9kF+HCMYOj2OnDKc9Tg7Tu40=;
	h=From:Date:Subject:To:Cc:From;
	b=HU4Se2lyyf5LLg/2D5GImLwyJjiamLvPAvrqfaufMBxe1dTSdvxRJ3Yz1Scdk/rPb
	 Pda+3+9nSFYAtDALCOOFfMvY20AWeFnaT2di4/Bg2vmLLLwskUuD4Pi2yCdnCJvZ2M
	 bQeo0rcXVVKl5r6mQnmTy9kokP5C8W9Hp9n0cexc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 22 Dec 2024 21:04:50 +0100
Subject: [PATCH] leds: triggers: Constify 'struct bin_attribute'
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241222-sysfs-const-bin_attr-led-v1-1-ecc5212a31fa@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAOFwaGcC/x3MQQqDMBBA0avIrB0w01SCVxEpaZzUAUkkE0qLe
 PeGLt/i/xOUi7DC1J1Q+C0qOTWYvoOw+fRilLUZaCBriAj1q1Ex5KQVn5IevtaCO69o7oN1Nzd
 6YwlafhSO8vmv5+W6fkac5R9qAAAA
X-Change-ID: 20241222-sysfs-const-bin_attr-led-15048386a142
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734897893; l=3289;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=IUsODn5TmnaQpCwJ4Im9kF+HCMYOj2OnDKc9Tg7Tu40=;
 b=rVbj8KKB5yi/XgI+NzNEZJrxoqW5/5t9JqdaSt0FIiw6XPHA9K7kvglzZjiOjg/yHBxnuX0AC
 Z9vLT3zoZnlDCKzmY9vSznfntl7jIEm+4KmSE2otsClWbvFU6YUKnd3
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/led-class.c    | 6 +++---
 drivers/leds/led-triggers.c | 4 ++--
 drivers/leds/leds.h         | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 2a04ac61574d5fcf998412e97d8bfbc3bd40ed81..c20ac8ccf52b7d79762a3aeea446389bad8443ea 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -85,13 +85,13 @@ static ssize_t max_brightness_show(struct device *dev,
 static DEVICE_ATTR_RO(max_brightness);
 
 #ifdef CONFIG_LEDS_TRIGGERS
-static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
-static struct bin_attribute *led_trigger_bin_attrs[] = {
+static const BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
+static const struct bin_attribute *const led_trigger_bin_attrs[] = {
 	&bin_attr_trigger,
 	NULL,
 };
 static const struct attribute_group led_trigger_group = {
-	.bin_attrs = led_trigger_bin_attrs,
+	.bin_attrs_new = led_trigger_bin_attrs,
 };
 #endif
 
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 78eb20093b2c10643e26cea3517acf5a58df423d..b2d40f87a5ff22b9fe38bce0a655da72ea385fee 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -34,7 +34,7 @@ trigger_relevant(struct led_classdev *led_cdev, struct led_trigger *trig)
 }
 
 ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
-			  struct bin_attribute *bin_attr, char *buf,
+			  const struct bin_attribute *bin_attr, char *buf,
 			  loff_t pos, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -123,7 +123,7 @@ static int led_trigger_format(char *buf, size_t size,
  * copy it.
  */
 ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
-			struct bin_attribute *attr, char *buf,
+			const struct bin_attribute *attr, char *buf,
 			loff_t pos, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index d7999e7372a49f4c5f2bd0c489581e2467d53803..bee46651e068f7f7c9d6d5fde31b39c020b79fcd 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -22,10 +22,10 @@ void led_stop_software_blink(struct led_classdev *led_cdev);
 void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value);
 void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned int value);
 ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
-			struct bin_attribute *attr, char *buf,
+			const struct bin_attribute *attr, char *buf,
 			loff_t pos, size_t count);
 ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
-			struct bin_attribute *bin_attr, char *buf,
+			const struct bin_attribute *bin_attr, char *buf,
 			loff_t pos, size_t count);
 
 extern struct rw_semaphore leds_list_lock;

---
base-commit: bcde95ce32b666478d6737219caa4f8005a8f201
change-id: 20241222-sysfs-const-bin_attr-led-15048386a142

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


