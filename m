Return-Path: <linux-leds+bounces-773-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AC884C4D4
	for <lists+linux-leds@lfdr.de>; Wed,  7 Feb 2024 07:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02D7F28B6CF
	for <lists+linux-leds@lfdr.de>; Wed,  7 Feb 2024 06:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D2F25574;
	Wed,  7 Feb 2024 06:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UiaOTWXI"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D42D25566
	for <linux-leds@vger.kernel.org>; Wed,  7 Feb 2024 06:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707286254; cv=none; b=D/WrCAtiCTpsdbW8yqmKzwK/mRGDdIKuOllvK09D3j+wmZkIrpuIqp2oIDIcngdqUOwtBqnTwz+4zfHuOKF0u25NSsxOW9JyVUdmJSSljxHdRlVt/Spulfsw31B9spDdW+LIWUzvxewJe+kdpvVvRzhkg8ZbOIgqv+S58Lw6Pto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707286254; c=relaxed/simple;
	bh=L35QMpEsdoDCMyjRk0YIWhnb7h4Fbiw8wggB3TGNW0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQ4pnQnO58JRg1+5KtHfCfeHaWu5ztlylZ9Eakr2detrqjLPKbBBi0x7pgmKKC5LpbxkSOcujPgIT2P5J26Es20lucdm9mT4B2laHgxLsCaRAE6tchYPCrjinRyBootdhZ8QelzrheC892jwbjPZx1zFGQmo1q68cKZG1a91y0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UiaOTWXI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707286251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nQ115fx9zHrutsWrwrQXur/1A7qSlZzNjkAaOamyOZA=;
	b=UiaOTWXIa+45CyQZU9Bp7/4P4zLUXsY8WdaXwvqz2sfhhGPvneWHAh3EIR0MggUY28PXDN
	Y120/m3s7u8sYrLJA/eKWCdiS69cPU4JNqkIk4xA1429UOeioPgAvo9bP2f9gxeuddjynQ
	SeVwCfGncHpilfGSaiEEB9e9ZihxEjc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-OSQKT60zNpaxyv92lEr_4Q-1; Wed, 07 Feb 2024 01:10:48 -0500
X-MC-Unique: OSQKT60zNpaxyv92lEr_4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CADDC811E81;
	Wed,  7 Feb 2024 06:10:47 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.64.240.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB86C1C0652C;
	Wed,  7 Feb 2024 06:10:44 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 0/2] KTD2026 indicator LED for X86 Xiaomi Pad2
Date: Wed,  7 Feb 2024 14:10:04 +0800
Message-ID: <20240207061006.407066-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

This patch added the support for Xiaomi Pad2 indicator LED. This work
included two parts.
1. Added the KTD2026 swnode description to describe the LED controller.
2. Migrated the original driver to fwnode to support x86 platform.

Moreover, the LED trigger is set to bq27520-0-charging for Xiaomi Pad2
so the LED will be turned on when charging.

Kate Hsuan (2):
  platform: x86-android-tablets: other: Add swnode for Xiaomi pad2
    indicator LED
  leds: rgb: leds-ktd202x: Get device properties through fwnode to
    support ACPI

 drivers/leds/rgb/Kconfig                      |  1 -
 drivers/leds/rgb/leds-ktd202x.c               | 68 ++++++++++-----
 .../platform/x86/x86-android-tablets/other.c  | 85 +++++++++++++++++++
 .../x86/x86-android-tablets/shared-psy-info.h |  2 +
 4 files changed, 132 insertions(+), 24 deletions(-)

-- 
2.43.0


