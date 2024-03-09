Return-Path: <linux-leds+bounces-1203-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AA8877373
	for <lists+linux-leds@lfdr.de>; Sat,  9 Mar 2024 20:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9015AB211AE
	for <lists+linux-leds@lfdr.de>; Sat,  9 Mar 2024 19:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747DD4C62E;
	Sat,  9 Mar 2024 19:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RSzNm4I5"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923F74C610
	for <linux-leds@vger.kernel.org>; Sat,  9 Mar 2024 19:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710011326; cv=none; b=nk1gWNbY+CerfUMjCm6mBsaIlPI4No/Sez6jHa/C6UAbz4CNc/2gpdMPSHKOVaBQH/ui8C9RJsiW5EUx+Q4YmGgFr7ZpwJNzdh45rfB4lNeJzqDgqR0RrmIcsGnXsrd/2Ygy+TfnfLv7jeO+ose+DFxueyox5LTmnC1WNPKFoK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710011326; c=relaxed/simple;
	bh=HtMT/ZLhiXaYQZOOx9SbQ91Bdm+pdKmtBXtaoafD4f8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZQJxydJkWF9gmURYXLl8EFZUusqN8amcdWnCh0+VyXDth6+2FoJCzNOzJx9BekKUJJ47tTN7CLrPAtQVcMR+7IHDeYp4qlrslC2QNTFrqlN9ilWKzSqxqyCSDF3UvNk6/wPsVnxKBmxIZyw7ZyrAOxxWB8b1apCfjK0XxAua7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RSzNm4I5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710011323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qxr07FgcNgwPCm2J7dVXnIyYj5SlEKK0YxjmbkdoU/Q=;
	b=RSzNm4I5z6NFBgd4h1r6TbHHAnE3Xi0cOmcAJAmwvXJjlDMygDNtV+O9VaNM3TtAs3a5BG
	WenCAHZ16jb2FFrBeRESaCl6eI5BiJOGm0RnoKdqdeRYNf9+1SIvfUYiZW2HQFIPIaZXvQ
	6GmoK0ZRFwH6LQHTfO01tRZxRooeGSo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-abEsYIZSMRWexwWHJMtR_Q-1; Sat, 09 Mar 2024 14:08:39 -0500
X-MC-Unique: abEsYIZSMRWexwWHJMtR_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08D27803FC6;
	Sat,  9 Mar 2024 19:08:39 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BB411C060D6;
	Sat,  9 Mar 2024 19:08:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Dan Murphy <dmurphy@ti.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-leds@vger.kernel.org
Subject: [RFC 2/2] leds: trigger: Add led_mc_trigger_event() function
Date: Sat,  9 Mar 2024 20:08:35 +0100
Message-ID: <20240309190835.173703-3-hdegoede@redhat.com>
In-Reply-To: <20240309190835.173703-1-hdegoede@redhat.com>
References: <20240309190835.173703-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Add a new led_mc_trigger_event() function for triggers which want to
change the color of a multi-color LED based on their trigger conditions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
This is a preparation patch for adding a new trigger to
drivers/power/supply/power_supply_leds.c which changes the color
of a RGB LED depending on if the battery is discharging (LED off)
charging (LED red) or full (LED green)
---
 drivers/leds/led-triggers.c | 20 ++++++++++++++++++++
 include/linux/leds.h        |  6 ++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index bd59a14a4a90..fcc4e7a7b12b 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -380,6 +380,26 @@ void led_trigger_event(struct led_trigger *trig,
 }
 EXPORT_SYMBOL_GPL(led_trigger_event);
 
+void led_mc_trigger_event(struct led_trigger *trig,
+			  unsigned int *intensity_value, unsigned int num_colors,
+			  enum led_brightness brightness)
+{
+	struct led_classdev *led_cdev;
+
+	if (!trig)
+		return;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
+		if (!(led_cdev->flags & LED_MULTI_COLOR))
+			continue;
+
+		led_mc_set_brightness(led_cdev, intensity_value, num_colors, brightness);
+	}
+	rcu_read_unlock();
+}
+EXPORT_SYMBOL_GPL(led_mc_trigger_event);
+
 static void led_trigger_blink_setup(struct led_trigger *trig,
 			     unsigned long delay_on,
 			     unsigned long delay_off,
diff --git a/include/linux/leds.h b/include/linux/leds.h
index fed88eb9e170..5378e4cd03ff 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -526,6 +526,9 @@ void led_trigger_register_simple(const char *name,
 				struct led_trigger **trigger);
 void led_trigger_unregister_simple(struct led_trigger *trigger);
 void led_trigger_event(struct led_trigger *trigger,  enum led_brightness event);
+void led_mc_trigger_event(struct led_trigger *trig,
+			  unsigned int *intensity_value, unsigned int num_colors,
+			  enum led_brightness brightness);
 void led_trigger_blink(struct led_trigger *trigger, unsigned long delay_on,
 		       unsigned long delay_off);
 void led_trigger_blink_oneshot(struct led_trigger *trigger,
@@ -562,6 +565,9 @@ static inline void led_trigger_register_simple(const char *name,
 static inline void led_trigger_unregister_simple(struct led_trigger *trigger) {}
 static inline void led_trigger_event(struct led_trigger *trigger,
 				enum led_brightness event) {}
+static inline void led_mc_trigger_event(struct led_trigger *trig,
+				unsigned int *intensity_value, unsigned int num_colors,
+				enum led_brightness brightness) {}
 static inline void led_trigger_blink(struct led_trigger *trigger,
 				      unsigned long delay_on,
 				      unsigned long delay_off) {}
-- 
2.43.2


