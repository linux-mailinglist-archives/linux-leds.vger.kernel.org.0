Return-Path: <linux-leds+bounces-844-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D114858218
	for <lists+linux-leds@lfdr.de>; Fri, 16 Feb 2024 17:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A21461F213AD
	for <lists+linux-leds@lfdr.de>; Fri, 16 Feb 2024 16:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A8612F5B3;
	Fri, 16 Feb 2024 16:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U3EqS1UY"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B5812F5AE
	for <linux-leds@vger.kernel.org>; Fri, 16 Feb 2024 16:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708099554; cv=none; b=JWFbMBmIE5wB0NxvFbJbTBvdTnR+7QuMXE3WnGOCqNdMw01rTN6/54m8glI3hBUvp1u6moQGs6pPZ6LjmMX+UgHJvaIF4fYvnHlaScOQp6bMF3bKcWAEbGjI1T5x5PybNRA99uw02Yd59adOCa9oU4rG2PuQbOuHHY6h0q2a1W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708099554; c=relaxed/simple;
	bh=C9MhUklpNm/EMn5tvs+cacjcLp2sqwXxyvsFi5KXK1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U8XyipQHHqgSUNl6eT0AEwrRvhEwkDSVCxYrUtQJ0+0ZtvE7vKr7pq2BzV/3IpYFlBCBtxVg6aZW9wOdbDh4vaVlS0Gsd6pNkP9pVEqwDnWjpoqaHBK9LvZTzExdYgCHjYxdkXhP6s94SWUwA708RaxPJCot+OqG+lCKqnjic0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U3EqS1UY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708099551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KUorjmauqTP01m9r8DcdmwR8ytx/nR0G/P2LHdDZiwg=;
	b=U3EqS1UYXY+lBnfHgIg9oE7j8A1nkfm1XzRkNMb83KfsZhE4J7/vwtDW3gSXrw8kvtfoAl
	+lu6YHeb5S/t+w0NMBQMDF+uFweIBvcz9F60xbE2WmfGqAFCqbOhgc5XFz6x9ewn0V0OTI
	+m7bmXQGcrvLSpigw96mHCXn+d26jO8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-Xl8D5-EkNNWqX9CgUTZWZg-1; Fri, 16 Feb 2024 11:05:46 -0500
X-MC-Unique: Xl8D5-EkNNWqX9CgUTZWZg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8768E86F129;
	Fri, 16 Feb 2024 16:05:45 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.108])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AE25492BE2;
	Fri, 16 Feb 2024 16:05:40 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 0/3] KTD2026 indicator LED for X86 Xiaomi Pad2
Date: Sat, 17 Feb 2024 00:05:23 +0800
Message-ID: <20240216160526.235594-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

The v2 patch includes:
1. Typo and style fixes.
2. The patch 0003 skips all the regulator setup for Xiaomi pad2 since
   KTD2026 on Xiaomi pad2 is already powered by BP25890RTWR. So, the
   sleep can be removed when removing the module.

Kate Hsuan (3):
  platform: x86-android-tablets: other: Add swnode for Xiaomi pad2
    indicator LED
  leds: rgb: leds-ktd202x: Get device properties through fwnode to
    support ACPI
  leds: rgb: leds-ktd202x: Skip requlator settings for Xiaomi pad2

 drivers/leds/rgb/Kconfig                      |  1 -
 drivers/leds/rgb/leds-ktd202x.c               | 73 +++++++++++-----
 .../platform/x86/x86-android-tablets/other.c  | 85 +++++++++++++++++++
 .../x86/x86-android-tablets/shared-psy-info.h |  2 +
 4 files changed, 141 insertions(+), 20 deletions(-)

-- 
2.43.1


