Return-Path: <linux-leds+bounces-2535-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B50339607E4
	for <lists+linux-leds@lfdr.de>; Tue, 27 Aug 2024 12:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E824C1C2251B
	for <lists+linux-leds@lfdr.de>; Tue, 27 Aug 2024 10:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB47A19E81F;
	Tue, 27 Aug 2024 10:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V1bNhCzk"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BD619753F
	for <linux-leds@vger.kernel.org>; Tue, 27 Aug 2024 10:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724755990; cv=none; b=klMoIYXpJuUW0g5eoHputuRG0sBjyc/DQozCwKUJ/Jnov79OVllsVBjmyciJqlzT7LZXS0zHyE3kEs9snVFgZFetEv666BMMeJlcFRXLhCwfoeeucLVFcTyqUGrhymo7LMinSJhjhFIES6UmLmpzMHgkZ8SxJnCtiusvQTAlGGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724755990; c=relaxed/simple;
	bh=vhGFAKURRpGiLzdI/3d0EafP4TO+MvKjm+sOuc/Hq10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OZo5EujYdlY2w6IlCkMXw9zSMj4QfhYvu5regG9bASNu2frzaznOscgTjd986vsZ1dXFcFPxUcLtuPiT2kJI8Udi01ggAdlGzYa2rnjfIDV9FBKivVdX/XoZUMIN1VRPWps+D4wjmrjdF7LqQKf0pgtLg0AIlLXTUSMXXdvXdCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V1bNhCzk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724755988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZgYvxJxYadRu72QVbqiiBTAQxcLnOjms0OIyTFIa+gI=;
	b=V1bNhCzkEMSOlhHWJzp2tvXyqSo/fO8xWujnQRdDo8mqYDAkj9XMoa838Jt+LA1GH5s+4Z
	HV01WdtH/a9qbBXKnpEBG+eJ5znmIlyqhTR8CRbvLOLkAUC/TcDTkyMq3pLs36+aJJZFZx
	hGGnerqjTJriOcd1R45gfV8q6oHFkvQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-377-wQvwAnrlMsCTy8IQiO2-SA-1; Tue,
 27 Aug 2024 06:53:03 -0400
X-MC-Unique: wQvwAnrlMsCTy8IQiO2-SA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6BD4E1954B32;
	Tue, 27 Aug 2024 10:53:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.3])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F0A4A1955DE4;
	Tue, 27 Aug 2024 10:52:57 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-bluetooth@vger.kernel.org
Subject: [PATCH resend] Bluetooth: Use led_set_brightness() in LED trigger activate() callback
Date: Tue, 27 Aug 2024 12:52:48 +0200
Message-ID: <20240827105248.18177-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

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
2.46.0


