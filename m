Return-Path: <linux-leds+bounces-7039-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IhcA1HroWkjxQQAu9opvQ
	(envelope-from <linux-leds+bounces-7039-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:06:57 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBF01BC6D6
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5554C3040F9E
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 19:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66243ACA6A;
	Fri, 27 Feb 2026 19:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="pncNjs/a"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9513939C6;
	Fri, 27 Feb 2026 19:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219212; cv=pass; b=U3JwwuRPWDqGkCdk7QUfoAWl2cYaOFou4QY0Wp98aNV53fQr+tEn6cou9C3mQ3jZ8kJ9HpU3OqWDyTrlDeEweGT5T3VdisCTd1CA2TlnXCCHTW0Z+nnUxPaf8/ToVBL5dm2rBVel2JUXnUXOpJOT6vw1AXGQLsQax+dFcXRt4rY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219212; c=relaxed/simple;
	bh=O2znY7UBCkJ8aEJ+L9ZRaextBNOgb8dQOc90g9PZI84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sgRk5btC29XoN4RR/KbnislHfAWuyZnuOoy6Q/YpG8aX+kXVb4Kf1Vb8yHT9tVuVkxYONWLZMX7GjP/LKFEdKNqhqZWh+TrPRDTha+AhmJgTAqJWaypAc0wYhSZtnimP6zAq5C92KtgMZAHro6GV5IhFp6oykMACC7GjM4I2riA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=pncNjs/a; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1772219191; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lUlOq3fd4RDRixkqVJvDfE/qkERa8ctVCI8ddq8bGTo4/6Nb4Q+v+ojT6J2MuJ7ww8mW3hXVuoWO2rAg96L6Wg+2hi3CR492teVONT8sjd+S77RL9KOsrUVBTedTXiF+u4FobNZ1y0K5aaNg6elgLQG9H5k2Q/NdYlV7CAGOMDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772219191; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=agLqAxnBrM1AWo0wht9pO0RhZJja5s7YuQDGBSPClV4=; 
	b=g7Br1xigaP0uwED+0Iu9iGb/mJzrBFyLDsBqI2FsbIqUBiUqSXmXtgCEta7IDkIUfXf5gaoboDX0y52cW2OsrBLfPXoISU4Sen0gZKAU/LBtQSEUhfLVRWoMEZCfQpbyxI17mH4oLr4Uiax/6YZdf9gzdbaGGEWe5O9ept3FkcQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772219191;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=agLqAxnBrM1AWo0wht9pO0RhZJja5s7YuQDGBSPClV4=;
	b=pncNjs/aMloR+ChccepObwWaxO/36IIsOuRpDx23UKlRLp0dFP5L/ApMi5krhjgv
	dni7A9MjjpiliGX3MYgsEmMSrQSku+ObpkRAxhDgAyY39+VhdVczEkHA5/cYx1hSQTn
	SRymJfIwlL1C2Ae/UygLJOjMHwySHzWCM/PtmKLTvXq+88uUvxnWT754Dn+c9kI8ZUl
	TzIZL7+S5gvg0fyJSyrwHjqqV9SnxhoxpKg/iMJpmEMavHINHXx4MTWRfhlCesiP+NI
	KBNj9RyciQSbWc3o2UQVJCv52DZCaKrkMsMBvqmKqUmSzOXCPOsSAcvVSm8A6+FkTNb
	eyYpu8wTeA==
Received: by mx.zohomail.com with SMTPS id 1772219188704827.658173429945;
	Fri, 27 Feb 2026 11:06:28 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>
Cc: Rong Zhang <i@rong.moe>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	vsankar@lenovo.com,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 1/9] leds: Load trigger modules on-demand if used as hw control trigger
Date: Sat, 28 Feb 2026 03:05:58 +0800
Message-ID: <20260227190617.271388-2-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227190617.271388-1-i@rong.moe>
References: <20260227190617.271388-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7039-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[rong.moe:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[rong.moe,gmail.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:mid,rong.moe:dkim,rong.moe:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BCBF01BC6D6
X-Rspamd-Action: no action

In the following patches, we are about to support hardware initiated
trigger transitions to/from the device's hw control trigger. In case
the LED hardware switches itself to hw control mode, hw control trigger
must be loaded before so that the transition can be processed.

Load the trigger module specified by hw_control_trigger, so that
hardware initiated trigger transitions can be processed when the hw
control trigger is compiled as a module.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/leds/led-class.c    |  1 +
 drivers/leds/led-triggers.c | 33 +++++++++++++++++++++++++++++++++
 drivers/leds/leds.h         |  1 +
 3 files changed, 35 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index d34a194535604..0fa45f22246e3 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -576,6 +576,7 @@ int led_classdev_register_ext(struct device *parent,
 
 #ifdef CONFIG_LEDS_TRIGGERS
 	led_trigger_set_default(led_cdev);
+	led_load_hw_control_trigger(led_cdev);
 #endif
 
 	mutex_unlock(&led_cdev->led_access);
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index b1223218bda11..3066bc91a5f94 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -313,6 +313,39 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_trigger_set_default);
 
+static inline bool led_match_hw_control_trigger(struct led_classdev *led_cdev,
+						struct led_trigger *trig)
+{
+	return (!strcmp(led_cdev->hw_control_trigger, trig->name) &&
+		trigger_relevant(led_cdev, trig));
+}
+
+void led_load_hw_control_trigger(struct led_classdev *led_cdev)
+{
+	struct led_trigger *trig;
+	bool found = false;
+
+	if (!led_cdev->hw_control_trigger)
+		return;
+
+	/* default_trigger is handled by led_trigger_set_default(). */
+	if (led_cdev->default_trigger &&
+	    !strcmp(led_cdev->default_trigger, led_cdev->hw_control_trigger))
+		return;
+
+	down_read(&triggers_list_lock);
+	list_for_each_entry(trig, &trigger_list, next_trig) {
+		found = led_match_hw_control_trigger(led_cdev, trig);
+		if (found)
+			break;
+	}
+	up_read(&triggers_list_lock);
+
+	if (!found)
+		request_module_nowait("ledtrig:%s", led_cdev->hw_control_trigger);
+}
+EXPORT_SYMBOL_GPL(led_load_hw_control_trigger);
+
 /* LED Trigger Interface */
 
 int led_trigger_register(struct led_trigger *trig)
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index bee46651e068f..e85afd4d04fd0 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -21,6 +21,7 @@ void led_init_core(struct led_classdev *led_cdev);
 void led_stop_software_blink(struct led_classdev *led_cdev);
 void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value);
 void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned int value);
+void led_load_hw_control_trigger(struct led_classdev *led_cdev);
 ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
 			const struct bin_attribute *attr, char *buf,
 			loff_t pos, size_t count);
-- 
2.51.0


