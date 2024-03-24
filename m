Return-Path: <linux-leds+bounces-1327-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C57887D61
	for <lists+linux-leds@lfdr.de>; Sun, 24 Mar 2024 16:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 845F91C20A01
	for <lists+linux-leds@lfdr.de>; Sun, 24 Mar 2024 15:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25D91862F;
	Sun, 24 Mar 2024 15:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FsF6zAzS"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7991946C
	for <linux-leds@vger.kernel.org>; Sun, 24 Mar 2024 15:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711292572; cv=none; b=Z3TEfWEy2fRUDYZz25UYSsSvZExMhUnu5haW8yDDa+NSSEM9RzN7cCcnNHpc432189xdvh2H9SJvmuoUK/UNjQEiLMJ3lH7Yy4MjawX0sChhTgt6FHGx+X/yx28NVqFPCs4HAqO4QfjOl/pfzAG88cVlEJNkuAJox9e+U1uC83s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711292572; c=relaxed/simple;
	bh=iSR4eVTv9vBjTyoy0u2zQ1BJB3q/2JhCssOVrTNtf8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SWkSNWSSgXzQ5LBjY3dLPB800OUlPwop0ss2EM2W/KPIyksWvaJybncb06PAhBUSVCbU0jy7G2r32vleYAqBZZpJ4fPdoLHwt+IpTd/50KBEaFxbDGqhOC9+D3Jk2ETNJV3C99guak0Kr7zLHSLXr0X3zHjMo/TV25Lg/wMgmII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FsF6zAzS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711292570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y5liH5XREjRdtzIi3oVOZVrr4OfiHuxXZ9yg0sczK48=;
	b=FsF6zAzSRC31IS16/tHqHNvs+TJQ/tdlI1xjRdXm7cIuP8AWmSQzMdcs5JUMo9PRgBwTfJ
	H5bma3aS2Nxj0fxQTt0f60YL2yJtS8ItsBaKQGYxvwjiOSugi0SdhbKztvvMqJwiLv7+TF
	2+Wbr3hsoPJWxFN/eJ1z11JhFL7XJhY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-uNinFOgkNkGnMUXaPTkbPQ-1; Sun, 24 Mar 2024 11:02:45 -0400
X-MC-Unique: uNinFOgkNkGnMUXaPTkbPQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86BD980F7E3;
	Sun, 24 Mar 2024 15:02:44 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9B2E40C6DAE;
	Sun, 24 Mar 2024 15:02:38 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v5 RESEND 6/6] platform: x86-android-tablets: others: Set the LED trigger to charging_red_full_green for Xiaomi pad2
Date: Sun, 24 Mar 2024 23:01:07 +0800
Message-ID: <20240324150107.976025-7-hpa@redhat.com>
In-Reply-To: <20240324150107.976025-1-hpa@redhat.com>
References: <20240324150107.976025-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Set the default trigger to bq27520-0-charging-red-full-green. The LED
will show red when the battery is charging. The LED will show green
when the battery status is full.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/other.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 1012a158f7b7..eccfea7b01c0 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -610,7 +610,7 @@ static const struct property_entry ktd2026_rgb_led_props[] = {
 	PROPERTY_ENTRY_U32("reg", 0),
 	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RGB),
 	PROPERTY_ENTRY_STRING("function", "indicator"),
-	PROPERTY_ENTRY_STRING("linux,default-trigger", "bq27520-0-charging"),
+	PROPERTY_ENTRY_STRING("linux,default-trigger", "bq27520-0-charging-red-full-green"),
 	{ }
 };
 
-- 
2.44.0


