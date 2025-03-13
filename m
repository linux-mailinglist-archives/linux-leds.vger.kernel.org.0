Return-Path: <linux-leds+bounces-4249-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0473CA6063D
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 00:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5616B3B7B70
	for <lists+linux-leds@lfdr.de>; Thu, 13 Mar 2025 23:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A178722612;
	Thu, 13 Mar 2025 23:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="fub73hSn"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEE05CB8
	for <linux-leds@vger.kernel.org>; Thu, 13 Mar 2025 23:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741910212; cv=pass; b=BFVUQhT1qAA0eqhMJHabH2dCGZzQQqwrWdfMzuz7myEtl7Ev6ystL9bqbhMAVYef9TEFullt5YSVQYSx4iuSyfosY4V+aB5U/psm5ptbHIYTpZm0n3ImB59Mp9k1YIont7axcwRHF4JmRV9yJqlNaLoLclGjVaMut6Hg6Ni05MU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741910212; c=relaxed/simple;
	bh=ylwlJZO1Q10Us5/20JtShDyNDmyyQRoD4UAb3H8V2Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mG/dC6o8NuTTZH1FXsZU5C5zIAo0MrMDEkffXbMq+VQ558RpMfrvYfVQxESYQwKW9iaYcQF5h1uEcooH4khJFCnjStFYCzLhQ0oxcI8HfTnRknXsMEzBTsNU/TR5bp5ZsQ4o8je+lKZKbuCPdsiqotjC+CtDzCbTAcA+OImOxZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=fub73hSn; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1741910206; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I2Ej5NWZLFksLpSynP+Sgckdm44wbEjQvVon/GNcIPF9MhHYcNQX9zIdggQMe2xAbzjUoP+Sbr3eLnlhQnBS1aBdOBEDrnDkk0GztiU/H9OLcTzYKza1b+QwdaUwwiUKcQnCBZbDWf3fSswQp1DchPbCIHL76l+tEXujBOLuJx4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741910206; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RiWTmxL8isck8BFgQSSLnseWMDP/lL6PX+vWMSvGjQQ=; 
	b=YAEsY6AAZvSGLQD2IBrDrORhttn7H9MqRbCCJfuHxIVv2SlZpVOUVa/BdKxW3d+0TwF38bS2Ib9fnJHVP6PoDH19ja9t5tH0/vsLfZRuu83yfVI8iU3rgdvngTJPfPa3KI5XSub1uhnxenioNuX08qxHvd81bQK1BDWsI5P8roU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741910206;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=RiWTmxL8isck8BFgQSSLnseWMDP/lL6PX+vWMSvGjQQ=;
	b=fub73hSn31wtLJfFK9xRn9EOTEzjKPwCpWdxWS+KgNwIPrdRrk+BOC66fZ9Am8V3
	/Bq7X1aqDe1AVh84Tn67mytl8ReqaxJX6wb/2Jxe0Zedp4yGmKwPXVpspfraLTVXnYE
	aUqfEQ3zoV0sX0qRPSs6uGXJljixf9tcF/ccVoZk=
Received: by mx.zohomail.com with SMTPS id 1741910204481922.316146533587;
	Thu, 13 Mar 2025 16:56:44 -0700 (PDT)
From: Craig McQueen <craig@mcqueen.au>
To: linux-leds@vger.kernel.org
Cc: Craig McQueen <craig@mcqueen.au>
Subject: [PATCH v3] leds: led-triggers: Improvements for default trigger
Date: Fri, 14 Mar 2025 10:56:26 +1100
Message-ID: <20250313235626.402788-1-craig@mcqueen.au>
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


