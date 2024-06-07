Return-Path: <linux-leds+bounces-1857-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB03900084
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 12:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11F68281F49
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 10:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95094433C7;
	Fri,  7 Jun 2024 10:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bK4PpL9e"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139B5762C1
	for <linux-leds@vger.kernel.org>; Fri,  7 Jun 2024 10:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755540; cv=none; b=NFezdUytsSxPKQOfbDaKJx0rDxi9GLmSN4lZSV2sL701rN/JLFd4e49N+1YPdaeuH6Q77u451dGpiR+aU64wfrt1SbETPCUDwZxgyNGxm3UDuK3pKoxDmAVHyQX0flJ3I0249qQ3ghz/VT3IzMAI4j1dgWaRHEL1oA17ts/AElU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755540; c=relaxed/simple;
	bh=UQyLrKvwXFeJTbVMp3JrLlULiFQYm1z4rjeGlpJMP3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qFPlLUG0p2ozqgOKo05asaYfo3N5zUP5mnrpl/7ZAc+Bw4I9vMDLK0ku5/6VOhocxZmC9hl3NR527Bl7OeLtnUho59cht4aYHlJVqlC11TYG1Qxf1KvSlfrW/bivM89UT586TDE/2QgGykhwTS5X1uQF2AZeEa9Nb+B0Np5DlR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bK4PpL9e; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717755537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N/DX36CyXJrx0AdFl/DLUTt1b1E77C/gLDrVW9G/1mc=;
	b=bK4PpL9eBPV4m0Dfbd1zKAY4anPX4nnaK+zt7nNHL6U5ZqB9innKnqRaYG6Lf2vpd3/x8X
	wXcAeJjx3mR3XIffSfEy3eKiUtOmPbaUeH4KQa96o+hQ/xxbwZhOH7VfFIO4NjfIZo/IUS
	mlruyQLjhcyUrxvccqKb9Q15e3k/LwI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-Q4Iz4AoYO_a5rPfhensX-g-1; Fri,
 07 Jun 2024 06:18:55 -0400
X-MC-Unique: Q4Iz4AoYO_a5rPfhensX-g-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5C9101956055;
	Fri,  7 Jun 2024 10:18:53 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 500E030000C4;
	Fri,  7 Jun 2024 10:18:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	regressions@lists.linux.dev,
	linux-leds@vger.kernel.org,
	Genes Lists <lists@sapience.com>,
	=?UTF-8?q?Johannes=20W=C3=BCller?= <johanneswueller@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] leds: class: Revert: "If no default trigger is given, make hw_control trigger the default trigger"
Date: Fri,  7 Jun 2024 12:18:47 +0200
Message-ID: <20240607101847.23037-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Commit 66601a29bb23 ("leds: class: If no default trigger is given, make
hw_control trigger the default trigger") causes ledtrig-netdev to get
set as default trigger on various network LEDs.

This causes users to hit a pre-existing AB-BA deadlock issue in
ledtrig-netdev between the LED-trigger locks and the rtnl mutex,
resulting in hung tasks in kernels >= 6.9.

Solving the deadlock is non trivial, so for now revert the change to
set the hw_control trigger as default trigger, so that ledtrig-netdev
no longer gets activated automatically for various network LEDs.

The netdev trigger is not needed because the network LEDs are usually under
hw-control and the netdev trigger tries to leave things that way so setting
it as the active trigger for the LED class device is a no-op.

Fixes: 66601a29bb23 ("leds: class: If no default trigger is given, make hw_control trigger the default trigger")
Reported-by: Genes Lists <lists@sapience.com>
Closes: https://lore.kernel.org/all/9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com/
Reported-by: "Johannes Wüller" <johanneswueller@gmail.com>
Closes: https://lore.kernel.org/lkml/e441605c-eaf2-4c2d-872b-d8e541f4cf60@gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-class.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 24fcff682b24..ba1be15cfd8e 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -552,12 +552,6 @@ int led_classdev_register_ext(struct device *parent,
 	led_init_core(led_cdev);
 
 #ifdef CONFIG_LEDS_TRIGGERS
-	/*
-	 * If no default trigger was given and hw_control_trigger is set,
-	 * make it the default trigger.
-	 */
-	if (!led_cdev->default_trigger && led_cdev->hw_control_trigger)
-		led_cdev->default_trigger = led_cdev->hw_control_trigger;
 	led_trigger_set_default(led_cdev);
 #endif
 
-- 
2.45.1


