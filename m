Return-Path: <linux-leds+bounces-8285-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA6hDpY+D2pNIQYAu9opvQ
	(envelope-from <linux-leds+bounces-8285-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 19:19:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C925AA129
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 19:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6F69320F2AE
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 16:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B97F37DAD0;
	Thu, 21 May 2026 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="N0AZ16MW"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F3F368D4D;
	Thu, 21 May 2026 16:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779381772; cv=none; b=aBYDZ1V4aaih/ER9dkMGjycJWfBd6uGaGcxRYH8fMgiFX6dRSFZwkJYGwElMktPyc56j+TwHwJZBQQPOrxQquDcDaxPC9Y47xgN5g9aIXwK/hTbajIeQh/67KH1cPUiDuheyJPwjSHK5ba4lOZKwJ3SD/5okngq4my79udoPKTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779381772; c=relaxed/simple;
	bh=DzycuLfHxA+iEaKyu+n+Vx3GmqTZWo9YGNa3G/eaWjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OWRmpPfLGZ+etKXfGdzNLSOqQbHI4y2pnamoWOOQrih/2QyfQHAsxBvbDLmF02T8hd6QkR/SlKmLiwuhbTR7Qb7T/xH3mdqQmfcKRwQDAxNAMRlvCbjlOhKwcPaA3d+2kQJAqGtLKnZX+sc90x/cM2UMr1RPyD1epcrE6x7doag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=N0AZ16MW; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1779381769;
	bh=DzycuLfHxA+iEaKyu+n+Vx3GmqTZWo9YGNa3G/eaWjk=;
	h=From:Date:Subject:To:Cc:From;
	b=N0AZ16MW+YsyS9Tr6MpVBat5VvQnG3UliFGlbJlHi69cJfs/z9+XopvztB02uAlGJ
	 fTfVJ/vS2SNVeJ6uXTy178KAesxEdkSA5ZniSzSNX/DGrBsvH6IRIBXCZwP80u8hkL
	 sn0yTHy88jfmdUVtwA6IIjhH6Esg6GiBRY6Wi+HU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 21 May 2026 18:42:41 +0200
Subject: [PATCH RFC] leds: core: Report ENODATA for brightness of hardware
 controlled LED
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-cros_ec-leds-hw-trigger-brightness-v1-1-6cd9d7c9671e@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNywrCMBBFf6XM2oE0xCJuBT/ArYjYZJKMSCoz8
 QGl/27U1eXcxTkzKAmTwrabQejJylNp0K868PlSEiGHxmCNHYwzDr1MeiaPNwqK+YVVOCUSHNv
 mWkgVe+ti3HhahzBAE92FIr9/kSMc9js4/U99jFfy9auHZfkALoNByYsAAAA=
X-Change-ID: 20260404-cros_ec-leds-hw-trigger-brightness-124ff8ce5dd6
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779381768; l=1404;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=DzycuLfHxA+iEaKyu+n+Vx3GmqTZWo9YGNa3G/eaWjk=;
 b=O0MBe+SCCvV82V8Pbg6GxS+clS2lEs9zVzF7N3bzjgC0tGBPRRz/4o8bfkLIoAsUigVKib7uW
 sDAYyrJRXutCRDhdhytNuOR1XKoOMx2tWRhCaB7I3/vlRQ64xobiKs1
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8285-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,weissschuh.net:email,weissschuh.net:mid,weissschuh.net:dkim]
X-Rspamd-Queue-Id: 92C925AA129
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While the LED is controlled fully by the hardware, the value cached by
the LED driver core is incorrect. Return ENODATA to userspace in this
case.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/led-class.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 9e14ae588f78..a88e274228e5 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -27,12 +27,25 @@ static LIST_HEAD(leds_lookup_list);
 
 static struct workqueue_struct *leds_wq;
 
+static bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
+{
+#ifdef CONFIG_LEDS_TRIGGERS
+	guard(rwsem_read)(&led_cdev->trigger_lock);
+	return led_cdev->trigger && led_cdev->trigger->trigger_type;
+#else
+	return false;
+#endif
+}
+
 static ssize_t brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	unsigned int brightness;
 
+	if (led_trigger_is_hw_controlled(led_cdev))
+		return -ENODATA;
+
 	mutex_lock(&led_cdev->led_access);
 	led_update_brightness(led_cdev);
 	brightness = led_cdev->brightness;

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260404-cros_ec-leds-hw-trigger-brightness-124ff8ce5dd6

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>


