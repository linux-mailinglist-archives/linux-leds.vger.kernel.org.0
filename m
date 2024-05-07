Return-Path: <linux-leds+bounces-1625-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 477928BDEF7
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 11:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBAEF1F22FB5
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 09:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF4814F10E;
	Tue,  7 May 2024 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BQhGCbCT"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6954F1514F0
	for <linux-leds@vger.kernel.org>; Tue,  7 May 2024 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715075479; cv=none; b=KTMLC7Db5CfM1JwybVpslWhREx4F7qFkbv1mM0T+RVcxleiBGoCpU8GKAmKwo4syDE0U8RwMYDaVJX8TuSLQ2/cJNL2uDFcJeIi65Hc4olh3hjIHLc8foJl5L7Fm6SHUHRLakwcRighjB6/ILHtZvdtbwP9FIlpYJpLi8zjHR7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715075479; c=relaxed/simple;
	bh=HC9DGBFD3juAcLNeVQsiH25FSYYFlNSbF3NKu2dNZz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VPqu1Q7Y4srXQRPv5smjUDJaQx+wVnEDOna5MpBJxQlqDIOCDPa2oO4GHEImOTZJgpNyKar9PG7xX70QfYXcsu0Ga2vQ19ngKES65VMYd4DqDzpHvRn1ZAWDFQiYUiMt4aUbi83vogepghlbGYu+GEkgt9fAmYJTtGUxZLG5q5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BQhGCbCT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715075477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4UcO4n0mOrAzzAnHaSpnX5OOpC9JKuMUatCI4+Owe/g=;
	b=BQhGCbCTzMMKqdRJb7Z0s1WgxxXpF2WVyQLbR+HFqlyc8TJmFvuHKGsn+wwBfxlidPnGzS
	nr5PT8HFQShbNLGtM3ssOBFIwY1br+iQBJRW3+dUeH3h2xQ8rAnjEswVM808/7pvxooJGR
	GcMAqoqgmbrB4WN9530X04+dxmuurVk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-orKE88ktOVaXYzEv9gp1ag-1; Tue, 07 May 2024 05:51:13 -0400
X-MC-Unique: orKE88ktOVaXYzEv9gp1ag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DB39101A54F;
	Tue,  7 May 2024 09:51:13 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CC1C1000DB7;
	Tue,  7 May 2024 09:51:11 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-leds@vger.kernel.org
Subject: [PATCH] leds: trigger: Call synchronize_rcu() before calling trig->activate()
Date: Tue,  7 May 2024 11:51:11 +0200
Message-ID: <20240507095111.27109-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Some triggers call led_trigger_event() from their activate() callback
to initialize the brightness of the LED for which the trigger is being
activated.

In order for the LEDs initial state to be set correctly this requires that
the led_trigger_event() call uses the new version of trigger->led_cdevs,
which has the new LED.

AFAICT led_trigger_event() will always use the new version when it is
running on the same CPU as where the list_add_tail_rcu() call was made,
which is why the missing synchronize_rcu() has not lead to bug reports.
But if activate() is pre-empted, sleeps or uses a worker then
the led_trigger_event() call may run on another CPU which may still use
the old trigger->led_cdevs list.

Add a synchronize_rcu() call to ensure that any led_trigger_event() calls
done from activate() always use the new list.

Triggers using led_trigger_event() from their activate() callback are:
net/bluetooth/leds.c, net/rfkill/core.c and drivers/tty/vt/keyboard.c.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-triggers.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 6d535a7fd075..018fe1eed4db 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -194,6 +194,13 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		spin_unlock(&trig->leddev_list_lock);
 		led_cdev->trigger = trig;
 
+		/*
+		 * Some activate() calls use led_trigger_event() to initialize
+		 * the brightness of the LED for which the trigger is being set.
+		 * Ensure the led_cdev is visible on trig->led_cdevs for this.
+		 */
+		synchronize_rcu();
+
 		if (trig->activate)
 			ret = trig->activate(led_cdev);
 		else
-- 
2.44.0


