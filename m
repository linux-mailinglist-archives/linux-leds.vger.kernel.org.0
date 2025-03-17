Return-Path: <linux-leds+bounces-4291-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A06AA63B7B
	for <lists+linux-leds@lfdr.de>; Mon, 17 Mar 2025 03:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70AD516CD28
	for <lists+linux-leds@lfdr.de>; Mon, 17 Mar 2025 02:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4B753E23;
	Mon, 17 Mar 2025 02:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="ebekcQbx"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59DB28E8
	for <linux-leds@vger.kernel.org>; Mon, 17 Mar 2025 02:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742178413; cv=pass; b=PxVtIPA4hIzgdVyNR4DwaRWkzSjx2wSt+hj8H/hFh2QN06IMWyx9lSSKUdJZQzX1vw1J/WSEkPH7PAkR4Txn4/e42qs9ALquzF/1ZAIiiYl1jUNi57bAO7Rd6ZxJX+o73zyPftZbMWi5wGOUkWJgMhrqpfaYYp5cSchFmTDpi7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742178413; c=relaxed/simple;
	bh=z6RewlAPCKPZm5jZpp7z3gf2FyEq0fIG9rtBmQRVNk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V9JMyrNE8gGqv7TRutT87s+Ay66GpRN7DpJXVbj/d/4E9ALGsfL7j1uFFkSQZitT0Gdb82QsAfrojOHfse4bmLL116XayAP37+/JA+KcYSWs5aNSxQekTaeEw3Z1ZAiQ1S2OlRzzIl6OElpyw9iJU12TenhhMvDCjGws9/vhhBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=ebekcQbx; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1742178409; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ADY/lB1XGeABNeWR4yd371KUyaMxLqEzRcPK2+nGLXHdaLjtvRYNp/vcvvQ+44DLxsEPo+dns3nd2QpEbrxNEPtKWeWvVz93RRC7hDi+aFc2HrY30SL+dQTXBM+PnoGr5J6wC8t8JcE0YKKisId7aDgbTvfnr/6vnv5q/eMubC8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742178409; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rbYS3z11KFCUDP7jrfy97qOmJihjBNvWwu7Zu+dKFhE=; 
	b=TnhtNGBaeVNjhCp505JnVFV+dwVXNKhZxaOKmt3+U1rOS3P+pdx3v5RAnFzvuNNn4D8QWdIeAVyNDW0YOlmkfPlq7ey1yYJ6bkfJ73x+kApVxHzCgROsLz5V0fIZWgv89tzzivPQVXYBVWX46JJIQGc13wHVjICqOmDxYDhyagk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742178409;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rbYS3z11KFCUDP7jrfy97qOmJihjBNvWwu7Zu+dKFhE=;
	b=ebekcQbxXWY1vIzyH/AX145fwhXZw/e7Qrr3eO06qM3Lxfl5zCH5jcK81us+fkQ1
	F6u5VyDtBE1fMLgco34dYl61DKOn55UTPRfT6KJUhJ4x/6+5BZVoEju0Ums3nFNHbLX
	qPStDhne5QiaRa+DdXgtn0bcqRvVq7Sy5EYDL/mI=
Received: by mx.zohomail.com with SMTPS id 1742178406892320.697531018748;
	Sun, 16 Mar 2025 19:26:46 -0700 (PDT)
From: Craig McQueen <craig@mcqueen.au>
To: linux-leds@vger.kernel.org
Cc: Craig McQueen <craig@mcqueen.au>
Subject: [PATCH v4] leds: led-triggers: Improvements for default trigger
Date: Mon, 17 Mar 2025 13:26:30 +1100
Message-ID: <20250317022630.424015-1-craig@mcqueen.au>
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

Signed-off-by: Craig McQueen <craig@mcqueen.au>
---
 Documentation/ABI/testing/sysfs-class-led |  6 ++++++
 drivers/leds/led-triggers.c               | 13 +++++++++++++
 2 files changed, 19 insertions(+)

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
index b2d40f87a5ff..3799dcc1cf07 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -54,6 +54,11 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
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
@@ -98,6 +103,9 @@ static int led_trigger_format(char *buf, size_t size,
 	int len = led_trigger_snprintf(buf, size, "%s",
 				       led_cdev->trigger ? "none" : "[none]");
 
+	if (led_cdev->default_trigger)
+		len += led_trigger_snprintf(buf + len, size - len, " default");
+
 	list_for_each_entry(trig, &trigger_list, next_trig) {
 		bool hit;
 
@@ -281,6 +289,11 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
 	if (!led_cdev->default_trigger)
 		return;
 
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


