Return-Path: <linux-leds+bounces-1805-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D958D71BA
	for <lists+linux-leds@lfdr.de>; Sat,  1 Jun 2024 21:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 998732824E5
	for <lists+linux-leds@lfdr.de>; Sat,  1 Jun 2024 19:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D179C154C08;
	Sat,  1 Jun 2024 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U+EiNaKe"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFD614E2EF
	for <linux-leds@vger.kernel.org>; Sat,  1 Jun 2024 19:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717271744; cv=none; b=kO470KAuTu4Z4ze2mGrmyu25K0FAoLfAWizEP1kTIBB9BRKAMfbk6w5cDrhzuVwi+m+1gjsk7gv+vLKyXGkLk+ydzW18tTMwJgk3hiIfk18y+SQoj2CJzjHzP0M0xpsKRaAF2Hq/xfYX/+GhOxiXcHMbRCobcE7b03r7G2pwKnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717271744; c=relaxed/simple;
	bh=6bNuYJhpsT9xIOMc+ZWFw6EYER1/ZusUMyZwz00y894=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETCWzTIGhGxT0+zK2+UqoQJ3VZEyCWuouqllSmyltuMnFlKIWtFl6tKHeVZq/Rzkr6TbdCe23ZV5ni5kk6B07+jqfKauUZ0A3K7WpPIvCLdAQGlZs0oBppv28McEvxNTwPV99CFN+A/JQiHKB6a/Y16xFzdgbcZPGkCGDZk1+m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U+EiNaKe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717271742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kIGIGAD7ayWRcyHPJFKvCC3jpjGwjQ230x866mYBRqY=;
	b=U+EiNaKefJb/4kiv79iekEeLPfXEzhCAB+5FfsqvNZW7348hD7NtqeMjonFEmCXjQpCId0
	5eDFmtwCJ6X8ASGWLhoBodjn6amAnC7dkoZ7m4RLXBw/NFB/5UUO2sUx2jTZUgqARloYxq
	6CpVWot/p3yEj1qvq1V2gDvIzfjoh3o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-Kt_IZ59PMLG37qQI4t5Jmg-1; Sat, 01 Jun 2024 15:55:38 -0400
X-MC-Unique: Kt_IZ59PMLG37qQI4t5Jmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39BAC101A525;
	Sat,  1 Jun 2024 19:55:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 969821C0D100;
	Sat,  1 Jun 2024 19:55:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-leds@vger.kernel.org
Subject: [RFC 1/2] leds: trigger: input-events: Replace led_on with a flags field
Date: Sat,  1 Jun 2024 21:55:27 +0200
Message-ID: <20240601195528.48308-2-hdegoede@redhat.com>
In-Reply-To: <20240601195528.48308-1-hdegoede@redhat.com>
References: <20240601195528.48308-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Replace the led_on boolean with a flags field, using bit 0 for FL_LED_ON,
this is a preparation patch for adding further flags.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/trigger/ledtrig-input-events.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
index 1de0176799f9..94d5580ea093 100644
--- a/drivers/leds/trigger/ledtrig-input-events.c
+++ b/drivers/leds/trigger/ledtrig-input-events.c
@@ -17,14 +17,16 @@
 
 #define DEFAULT_LED_OFF_DELAY_MS			5000
 
+/* To avoid repeatedly setting the brightness while there are events */
+#define FL_LED_ON					0
+
 struct input_events_data {
 	struct input_handler handler;
 	struct delayed_work work;
 	spinlock_t lock;
 	struct led_classdev *led_cdev;
 	int led_cdev_saved_flags;
-	/* To avoid repeatedly setting the brightness while there are events */
-	bool led_on;
+	unsigned long flags;
 	unsigned long led_off_time;
 	unsigned long led_off_delay;
 };
@@ -42,7 +44,7 @@ static void led_input_events_work(struct work_struct *work)
 	 */
 	if (time_after_eq(jiffies, data->led_off_time)) {
 		led_set_brightness_nosleep(data->led_cdev, LED_OFF);
-		data->led_on = false;
+		clear_bit(FL_LED_ON, &data->flags);
 	}
 
 	spin_unlock_irq(&data->lock);
@@ -95,10 +97,9 @@ static void input_events_event(struct input_handle *handle, unsigned int type,
 
 	spin_lock_irqsave(&data->lock, flags);
 
-	if (!data->led_on) {
+	if (!test_and_set_bit(FL_LED_ON, &data->flags))
 		led_set_brightness_nosleep(led_cdev, led_cdev->blink_brightness);
-		data->led_on = true;
-	}
+
 	data->led_off_time = jiffies + led_off_delay;
 
 	spin_unlock_irqrestore(&data->lock, flags);
-- 
2.45.1


