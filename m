Return-Path: <linux-leds+bounces-1664-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7DB8C3144
	for <lists+linux-leds@lfdr.de>; Sat, 11 May 2024 14:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33EBE1C20B25
	for <lists+linux-leds@lfdr.de>; Sat, 11 May 2024 12:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F55468E;
	Sat, 11 May 2024 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SF7WIB3/"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8381A2C17
	for <linux-leds@vger.kernel.org>; Sat, 11 May 2024 12:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715430919; cv=none; b=S8QC2v+KX+PvblDUmrLPbebLzGzf4vjv4+WpfsMQusag2ipN6/RdFTGTYAAczG6nSLIG5N3A860gbzAL2JpfKclJx6Sl1w0DsLOdptb2JNOiq/QraGE8jsLKEHbzB71yzdn0ZI2Dbr4hnPRX1MgZHy9UvB5rDPJMsj5WUfyK+9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715430919; c=relaxed/simple;
	bh=tdF40W5/p7BNpqk7dLQhpUrEV33iYOSR9aYMnXyOXoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bT1agAUeDwhidTZYysBv4yvhX7/43SfkTVbAvJkJhjOHu0xiOnEws4jlvOSa7WA3rovqJor9n5NihdQ4fYJD8PAZHeEgtvPoU+uEIgkaQ2OtgaOV6wNeyiwEhz89+d/WYvoe4pY9Uhi1sSy1TZdtpWpYCwRthWCWaEkZdUU3YPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SF7WIB3/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715430916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gLhuT+oWLYe8VAd+4kBJ2yh31MpICmbd3ylxkbHpSO0=;
	b=SF7WIB3/+oDlXw0Wbc+JK6YfgwOtkZa+obCqqdrIi4UzdlnZu9f1yNVkJKMmsaCIefvVnP
	nEnnms6NEBdC3rdnW8hxUtDkeesXCdnqPtJl1j38Fp/tKgbHeIGq/EdTj3gsi8zfnl68oS
	2HJEakkN1S35pDNbv2U0ZXU3HBJVO/A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-cJlqn6TuOrqo0Sepr6n1eg-1; Sat, 11 May 2024 08:35:12 -0400
X-MC-Unique: cJlqn6TuOrqo0Sepr6n1eg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04A4F80027F;
	Sat, 11 May 2024 12:35:12 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB02C2087D71;
	Sat, 11 May 2024 12:35:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: Use led_set_brightness() in LED trigger activate() callback
Date: Sat, 11 May 2024 14:35:10 +0200
Message-ID: <20240511123510.22303-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

A LED trigger's activate() callback gets called when the LED trigger
gets activated for a specific LED, so that the trigger code can ensure
the LED state matches the current state of the trigger condition
(LED_FULL when HCI_UP is set in this case).

led_trigger_event() is intended for trigger condition state changes and
iterates over _all_ LEDs which are controlled by this trigger changing
the brightness of each of them.

In the activate() case only the brightness of the LED which is being
activated needs to change and that LED is passed as an argument to
activate(), switch to led_set_brightness() to only change the brightness
of the LED being activated.

Note this is compile tested only.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 net/bluetooth/leds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/leds.c b/net/bluetooth/leds.c
index f46847632ffa..6e349704efe4 100644
--- a/net/bluetooth/leds.c
+++ b/net/bluetooth/leds.c
@@ -48,7 +48,7 @@ static int power_activate(struct led_classdev *led_cdev)
 	htrig = to_hci_basic_led_trigger(led_cdev->trigger);
 	powered = test_bit(HCI_UP, &htrig->hdev->flags);
 
-	led_trigger_event(led_cdev->trigger, powered ? LED_FULL : LED_OFF);
+	led_set_brightness(led_cdev, powered ? LED_FULL : LED_OFF);
 
 	return 0;
 }
-- 
2.44.0


