Return-Path: <linux-leds+bounces-7810-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIDdJGUE6mk/rQIAu9opvQ
	(envelope-from <linux-leds+bounces-7810-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 13:37:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F8C4515C1
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 13:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A52A301549F
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 11:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9173238422A;
	Thu, 23 Apr 2026 11:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="eTv81qPA"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068F53DE449
	for <linux-leds@vger.kernel.org>; Thu, 23 Apr 2026 11:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776944221; cv=pass; b=WrqHCNgZ47o+HRLM7/XcybGRpTPxgnPQ7asU8LE9SxtK3DQeYQ8+14ebjdj8vSjHKFLcQv7mR9wxcuc9tKkcfY3duyHbzD+g2U7AiL0vL4u0UA2/QPSWK+c+JopGryWpgy0iz15Maj81MdQaKRfO4ToQ+ZK6lwBuwF+YJoGuk64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776944221; c=relaxed/simple;
	bh=tYi0ZweA6nx+29Ig6qLsvBvLwRyB5uL0M0Nh+HkO5RA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tPol0i2LKzCHaQROJrXG3zbPeDEmRl7Xl560rPKaFecDqCAQEBhiX9p8URvoNaZukI73XtvgSV2COZFkLXFbs+CUgUGQE7QlONjD+VjVNI+s3QPbgrTpxGi+f4yWkfo7lM4/rPC4w4ZUvfYoM/2wmJZstdJWLDPgB4l0VYnFEuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=eTv81qPA; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1776944216; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RTCPGvzBitqAh4TiH7Sfc4q0nX/lG6/EJhCQIsPNY9MmA3of84/HGehSmwsejTd8PpQEyNKoB8Pt9yYjzno/TWFcfJBwddpt+gHxwfSQJeI8zSE5ChN9GXEcolaIhxnpJd1wuMF0mvhDnrojjz0NA8ZdGq7AUZYF6mlWtfn7jHc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776944216; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ldfqt5wfJiZle/vNdWzWmhMnUH7+BprYRLe1fVxP6bg=; 
	b=AJb0aB4KUFuWdzoROUkb81e5QsWM2sHhLDfGju2fBUSX+qMi+Q3mBNfmqLotjQWDnmIsZ4ioPviCPvxoYK35daEGWYwZT8T7FUYKbULtbktTqfGwVwTsuEbYIR83EAALtnVE2NIrGqiLPk8ATlOFK8pi1wMdX9Fecn+kT8W9/TY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776944216;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ldfqt5wfJiZle/vNdWzWmhMnUH7+BprYRLe1fVxP6bg=;
	b=eTv81qPAHOuGg/BN+2VR0WvlvBHoF+7LYfKgQVs1kLVENF9RtVoav0PeYHLAdx9C
	Eoap0AMZJf2Thb67jERKfVoyPezbXBgi3pX7jTRD2Ehrb/fLpqzeOKfStvmw0QHIy1A
	BPz3Q5MzxrVjTjEAasCGch3Md6b4s+PbuWbIM2JE=
Received: by mx.zohomail.com with SMTPS id 1776944215475834.509149166934;
	Thu, 23 Apr 2026 04:36:55 -0700 (PDT)
From: Craig McQueen <craig@mcqueen.au>
To: linux-leds@vger.kernel.org
Cc: Craig McQueen <craig@mcqueen.au>
Subject: [PATCH] leds: core: Fix race condition for software blink
Date: Thu, 23 Apr 2026 21:36:38 +1000
Message-ID: <20260423113638.2079302-1-craig@mcqueen.au>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mcqueen.au:s=zmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[mcqueen.au];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-7810-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[craig@mcqueen.au,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mcqueen.au:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mcqueen.au:email,mcqueen.au:dkim,mcqueen.au:mid]
X-Rspamd-Queue-Id: 82F8C4515C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

led_set_brightness() function: Change handling of software blink to
avoid race conditions when stopping blink and setting brightness.

Triggers may call led_set_brightness(LED_OFF),
led_set_brightness(LED_FULL) in quick succession to disable blinking and
turn the LED on. If the delayed work task has not yet disabled blinking
by the time the second call occurs, then the brightness also needs to be
changed in the delayed work task.

Signed-off-by: Craig McQueen <craig@mcqueen.au>
---
 drivers/leds/led-core.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 385e78af1dac..073c547068cc 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -303,24 +303,31 @@ EXPORT_SYMBOL_GPL(led_stop_software_blink);
 
 void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness)
 {
-	/*
-	 * If software blink is active, delay brightness setting
-	 * until the next timer tick.
-	 */
-	if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) {
+	if (brightness) {
 		/*
-		 * If we need to disable soft blinking delegate this to the
-		 * work queue task to avoid problems in case we are called
-		 * from hard irq context.
+		 * If software blink disable is pending, also queue brightness setting.
+		 * If software blink is active, delay brightness setting
+		 * until the next timer tick.
 		 */
-		if (!brightness) {
-			set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
+		if (test_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags) ||
+		    test_bit(LED_BLINK_DISABLE, &led_cdev->work_flags)) {
+			led_cdev->delayed_set_value = brightness;
+			set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
 			queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
-		} else {
-			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
-				&led_cdev->work_flags);
+			return;
+		} else if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) {
 			led_cdev->new_blink_brightness = brightness;
+			set_bit(LED_BLINK_BRIGHTNESS_CHANGE, &led_cdev->work_flags);
+			return;
 		}
+	} else if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) {
+		/*
+		 * If we need to disable soft blinking delegate this to the
+		 * work queue task to avoid problems in case we are called
+		 * from hard irq context.
+		 */
+		set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
+		queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
 		return;
 	}
 
-- 
2.52.0


