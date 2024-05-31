Return-Path: <linux-leds+bounces-1744-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DDE8D612C
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 14:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 221EA283652
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 12:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863BF156C7C;
	Fri, 31 May 2024 12:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fwYC3euF"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171FC29A0
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 12:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717156900; cv=none; b=Xhfx4vPAFdK/2t4qWufl67gVVZvrteEqOo5wnD4hMcYlwVuCmNk9A7MVJyA2riThoWxcmpvI0bi9IKfJ5YNxYdRjXHuuARDfY/RjYcseU6RaLNlLnQt1w0eJlAhvsZ4VgmkDFw271DgPXapvPdaPww0OylddMNCoWpsi47PHcH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717156900; c=relaxed/simple;
	bh=SGUxaqj3roxhsZHXZ97Jzmz5x+OTYp82vFmPpB5FHg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iGSDKkWTyuFhSLjHtW//rh2QfoTgYBQiWtXY08V+K4I8xaxLi8fDhUT5HmbNdIW+A8JWOpPu3rbeNd4/FvUWRnEdxrPHzLmxNH3UgY8a/PhOghI+LTyO3WSMvsINBgG7cUJ2a6kKKzHafRBPAE1fhJ8+dp6yCBB0E5TB7n2Bzm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fwYC3euF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717156898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z5cFbf2GUbcrYaHE/CFhP7+b5Ae1iDyBnu+KvJWUvY0=;
	b=fwYC3euFuY6/sGmCwRilOHDMJclIq81bt90Wj5musp0HqsRFK4SpA36IEXahQx6Rc57ylT
	q9SS4eheP4BwvkHVp/illUIRincP1CUmrHjxuSrBBHAaVgjY5DZhQQwLAi+Ze5h1ry1sct
	3eiDmPTEx371csMokkVKct2piAkX8yQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-J1kzq2mMM3Sv2AkkK5-C0g-1; Fri, 31 May 2024 08:01:33 -0400
X-MC-Unique: J1kzq2mMM3Sv2AkkK5-C0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36262101A525;
	Fri, 31 May 2024 12:01:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 74A381054820;
	Fri, 31 May 2024 12:01:32 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-leds@vger.kernel.org
Subject: [PATCH v2] leds: trigger: Call synchronize_rcu() before calling trig->activate()
Date: Fri, 31 May 2024 14:01:24 +0200
Message-ID: <20240531120124.75662-1-hdegoede@redhat.com>
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

In order for the LED's initial state to be set correctly this requires that
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
Changes in v2:
- Rebase on top of v6.10-rc1
---
 drivers/leds/led-triggers.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index b1b323b19301..07ce5cf76cf4 100644
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
 		ret = 0;
 		if (trig->activate)
 			ret = trig->activate(led_cdev);
-- 
2.45.1


