Return-Path: <linux-leds+bounces-1082-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3723B86DA38
	for <lists+linux-leds@lfdr.de>; Fri,  1 Mar 2024 04:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6975280F6C
	for <lists+linux-leds@lfdr.de>; Fri,  1 Mar 2024 03:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD2746433;
	Fri,  1 Mar 2024 03:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QayqyHA0"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745004655F
	for <linux-leds@vger.kernel.org>; Fri,  1 Mar 2024 03:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709264211; cv=none; b=au0VYo7ubfY7TRAoZCqpN150KxINedGbuQK7fQ17EGEvms3OQdM0GU6GKsrOeaqXD7y2S0wkinuFB7QXG4wWF9jTb1FUn9Tbw/XF67hN8mihJrYRxdSKqkBWSHvH88IwknDt2gnPwwL1XCZIy7PuwKAnzRUTCxds1OhkS+Pl7jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709264211; c=relaxed/simple;
	bh=+0HWL37XmaBELqr1Y5osV08VTnMz7DcvLvGP1oceLHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U8r2mmrEzvZokPooZ8gPHwyvliteUO0TyKe43z5MINgGHLt0ELsPsq1t1ot4wWf9ss8QmEZppgo3kNVNCPC3qvTjzXPEzrBoOHfBqxXNpk9G4kixfTUxHIzfxG3Z9x/59fR8L9wD3pTSunvhDftfNyoqhHj2rBX0JuKG7ylQ9Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QayqyHA0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709264208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cujA/aqlYoJlFQNLpUGlHmZhSDTZ/CBl5llEOGsmWQw=;
	b=QayqyHA0ku1z0u6jNPZq/jUWhV5LDZ48i5yNYPEHs106Ei4FKRlK10cKt2dkdnyAvwunJu
	W8VAWs2OzJ0ha0HcV1exHy9NiMwsTkXhZusCP4J2Qp1oRm7th39FeEg1V1In+mDeA4PGyT
	lapXpiAF2NusecacIdGRVxOa7/lDXus=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-82et7fLhN4uBI5soMReEDQ-1; Thu, 29 Feb 2024 22:36:44 -0500
X-MC-Unique: 82et7fLhN4uBI5soMReEDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 743F389F9EC;
	Fri,  1 Mar 2024 03:36:43 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9049C03488;
	Fri,  1 Mar 2024 03:36:38 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 0/2] KTD2026 indicator LED for X86 Xiaomi Pad2
Date: Fri,  1 Mar 2024 11:36:10 +0800
Message-ID: <20240301033612.11826-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

This patch added the support for Xiaomi Pad2 indicator LED. This work
included two parts.
1. Added the KTD2026 swnode description to describe the LED controller.
2. Migrated the original driver to fwnode to support x86 platform.

Moreover, the LED trigger is set to bq27520-0-charging for Xiaomi Pad2
so the LED will be turned on when charging.

--
Changes in v3:
1. Drop the patch "leds-ktd202x: Skip regulator settings for Xiaomi
   pad2"

Changes in v2:
1. Typo and style fixes.
2. The patch 0003 skips all the regulator setup for Xiaomi pad2 since
   KTD2026 on Xiaomi pad2 is already powered by BP25890RTWR. So, the
   sleep can be removed when removing the module.

Kate Hsuan (2):
  platform: x86-android-tablets: other: Add swnode for Xiaomi pad2
    indicator LED
  leds: rgb: leds-ktd202x: Get device properties through fwnode to
    support ACPI

 drivers/leds/rgb/Kconfig                      |  1 -
 drivers/leds/rgb/leds-ktd202x.c               | 58 ++++++++-----
 .../platform/x86/x86-android-tablets/other.c  | 85 +++++++++++++++++++
 .../x86/x86-android-tablets/shared-psy-info.h |  2 +
 4 files changed, 126 insertions(+), 20 deletions(-)

-- 
2.43.2


