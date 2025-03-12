Return-Path: <linux-leds+bounces-4236-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 325E4A5D3DF
	for <lists+linux-leds@lfdr.de>; Wed, 12 Mar 2025 02:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9005189BF1C
	for <lists+linux-leds@lfdr.de>; Wed, 12 Mar 2025 01:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEDF13AD38;
	Wed, 12 Mar 2025 01:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="SogET6NT"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF788635B
	for <linux-leds@vger.kernel.org>; Wed, 12 Mar 2025 01:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741741918; cv=pass; b=dCWSJ8589Njl0ZN8nuZFPo4ULFsg0fbrTFUT4NdygJAWsr2VscXQmPwBCEfDOX+hE81i/DiDFsVKaLUaPY6cfCV111n2q/MO7PsZR/z50SIX2jx32hxDZDtS02IRuIUxT1LJSwA2egSe+LaaRI4s8KSurbber/LRZKNZe/bayDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741741918; c=relaxed/simple;
	bh=teAVtI3URCNbzOocDOzCFMGg7ZQcP1vkIrr88RnyhBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jo34n0duxLbv4XQE2U50tL6dizTAdEOTJwiqefe0y1urCjGXSYMSJ0nU7j0lwtNPGEH3r3llDcbGjridfN9GWC5YiZbHaC+SM6THiM3W8eRYgwsl0b72qoE8UzYmXVElFfOx/TfoQuDERiDSXLUi/jROKvYmc7qzroLzM3mgadY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=SogET6NT; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1741741913; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DEo+Mg1E9+2gVYRnCpAlDMJf5XS5pNW3TePAQzHGUGzE7R1kYcDKp/oNorbcZCqAlNgshmAg/DDVoeUu+lbBTuST21HW/0Y9FYzG3/ZBTp9qkX48/W+5x2sOYgguTWzUoM4mKfr/DPBPvYLRl1qNHBMCSnW54uX1xWwTCtuuDtU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741741913; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cOHA8VDABXhA1mR8+v4wGvUh5fzz/32jTavn3rF9vqQ=; 
	b=al5HFPx0EpB9SLjQrrsv6BwJON5jecK3bIXFUrKoY8b6VO8Np7lDr8XO5rpsPvcdAzRRPufYkEyc2L6E4GS0m2nJhZsMMMszwcmc/CRl5BT2CuQkJ2PEoNq14bBiVWSA3b7kEFta4/1nQrUHV7/Jg3NMTBX9NFTyt2s8Q6CSAmE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741741913;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cOHA8VDABXhA1mR8+v4wGvUh5fzz/32jTavn3rF9vqQ=;
	b=SogET6NTJqpIWVoefdW1xk0nUeo8thVZft2bk/JlaCqRBjDh6YWUcf/jsrbx0Mqn
	lAAKx8t+QDGAER3tT5cyhw6lI54fmop52tV/90OEwjW6FZLPXfJc4xsk2lNnGk6zw/P
	4eLC/lIfFYa8CxC2TXAvmaukGWZ7LI490IYodyko=
Received: by mx.zohomail.com with SMTPS id 1741741907981761.1289745040816;
	Tue, 11 Mar 2025 18:11:47 -0700 (PDT)
From: Craig McQueen <craig@mcqueen.au>
To: linux-leds@vger.kernel.org
Cc: Craig McQueen <craig@mcqueen.au>
Subject: [PATCH v2] leds: led-triggers: Improvements for default trigger
Date: Wed, 12 Mar 2025 12:11:35 +1100
Message-ID: <20250312011136.380647-1-craig@mcqueen.au>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Accept "default" written to sysfs trigger attr.
If the text "default" is written to the LED's sysfs 'trigger' attr, then
call led_trigger_set_default() to set the LED to its default trigger.

If the default trigger is set to "none", then led_trigger_set_default()
will remove a trigger. This is in contrast to the default trigger being
unset, in which case led_trigger_set_default() does nothing.
---
 Documentation/ABI/testing/sysfs-class-led |  6 ++++++
 drivers/leds/led-triggers.c               | 26 ++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index 2e24ac3bd7ef..0313b82644f2 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -72,6 +72,12 @@ Description:
 		/sys/class/leds/<led> once a given trigger is selected. For
 		their documentation see `sysfs-class-led-trigger-*`.
 
+		Writing "none" removes the trigger for this LED.
+
+		Writing "default" sets the trigger to the LED's default trigger
+		(which would often be configured in the device tree for the
+		hardware).
+
 What:		/sys/class/leds/<led>/inverted
 Date:		January 2011
 KernelVersion:	2.6.38
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index b2d40f87a5ff..00c898af9969 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -49,11 +49,21 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 		goto unlock;
 	}
 
+	/* Empty string. Do nothing. */
+	if (sysfs_streq(buf, "")) {
+		goto unlock;
+	}
+
 	if (sysfs_streq(buf, "none")) {
 		led_trigger_remove(led_cdev);
 		goto unlock;
 	}
 
+	if (sysfs_streq(buf, "default")) {
+		led_trigger_set_default(led_cdev);
+		goto unlock;
+	}
+
 	down_read(&triggers_list_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
 		if (sysfs_streq(buf, trig->name) && trigger_relevant(led_cdev, trig)) {
@@ -98,6 +108,9 @@ static int led_trigger_format(char *buf, size_t size,
 	int len = led_trigger_snprintf(buf, size, "%s",
 				       led_cdev->trigger ? "none" : "[none]");
 
+	if (led_cdev->default_trigger && led_cdev->default_trigger[0])
+		len += led_trigger_snprintf(buf + len, size - len, " default");
+
 	list_for_each_entry(trig, &trigger_list, next_trig) {
 		bool hit;
 
@@ -278,9 +291,20 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
 	struct led_trigger *trig;
 	bool found = false;
 
-	if (!led_cdev->default_trigger)
+	/* NULL pointer or empty string. Do nothing. */
+	if (!led_cdev->default_trigger || !led_cdev->default_trigger[0])
 		return;
 
+	/* This case isn't sensible. Do nothing. */
+	if (!strcmp(led_cdev->default_trigger, "default"))
+		return;
+
+	/* Remove trigger. */
+	if (!strcmp(led_cdev->default_trigger, "none")) {
+		led_trigger_remove(led_cdev);
+		return;
+	}
+
 	down_read(&triggers_list_lock);
 	down_write(&led_cdev->trigger_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
-- 
2.48.1


