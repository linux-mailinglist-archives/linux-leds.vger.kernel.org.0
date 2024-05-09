Return-Path: <linux-leds+bounces-1642-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7D38C10FF
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 16:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90D7D1C20B70
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 14:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E3615CD7D;
	Thu,  9 May 2024 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UJ+8tpLj"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7312115250D
	for <linux-leds@vger.kernel.org>; Thu,  9 May 2024 14:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715263880; cv=none; b=P0Mqnf4ti60KbtCq4Ny6UTs6fytylabD8U8DpJ+fHZULT0b2x1QzpQCDD4VzloB32FJxywD5KwwUpmjR57oTqSK9lt4/XPmg6G5rvRPpyWfS5V/EgtFfy8EH0j2WY1W/T6Wbo8Co4O3Isytqsgna26b48G3FKgbL7B8EhSubd44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715263880; c=relaxed/simple;
	bh=s3S3yZZTPQKvx60WdRJkUqjTIcjgqXF1dvf/d9xkFmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GO+A3LDD6XpMHibaiB0V1n3ZY9RD8nEfGGx0VbT9lJhwalcEuaSjp+3kyoUL8HVFep8W0TRA92OSmIZ1xcXkS932M+6SfVH3Edw0ZZG2FgylSbeQc8rIWwr8+vAQRNUl4Un7kzIFwxYFNtDc4jT+DQ95Lg888Jr72hHm46G2yY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UJ+8tpLj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715263878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nWjvEX+9pfsU6URUy43Hs1QDYGp7Lx6ScG0ezqueWTY=;
	b=UJ+8tpLj8jxO6AioLaw5sKyIUXNrnCrwdZYdtUWEaXjQJ24lueGU/s1sC+uvGVxvmq0gpE
	zC7SgtqsbCrEP8kzu9IRjHRItMBg1c/OAQpysY7jthxgOhiMwRTerYrIM/ORR2/9GqSjSa
	dhIYhcyMHn0C+17E0u7AmEGU1bix/Nc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-1TiidtGJPzee_imCRoBKmw-1; Thu, 09 May 2024 10:11:14 -0400
X-MC-Unique: 1TiidtGJPzee_imCRoBKmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA5C581227E;
	Thu,  9 May 2024 14:11:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D3502076B79;
	Thu,  9 May 2024 14:11:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 0/1] leds: trigger: Add new LED Input events trigger
Date: Thu,  9 May 2024 16:11:06 +0200
Message-ID: <20240509141107.63512-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

Hi All,

While looking into a driver for the backlight for the 3 menu / home / back
capacitive-touch buttons found on the bottom bezel of the Xiaomi Pad 2
tablet I decided rather then to write a custom driver just for this
it would be better to solve this in a generic way which can be reused
on other devices since having such capactive touch buttons on the bottom
bezel is quite normal for somewhat older phones and tablets.

So here is a patch adding a new trigger which turns LEDs on when there is
input (/dev/input/event*) activity and turns them back off again after
there has been no activity for 5 seconds. This trigger can then be used
to control the LEDs backlighting these kind of capactive touch buttons and
it may also be useful to control keyboard backlighting in some cases.

Changes in v2:
- Add MODULE_ALIAS() for module auto-loading
- Stop using the led-trigger.c private trigger->led_cdevs list

Regards,

Hans


Hans de Goede (1):
  leds: trigger: Add new LED Input events trigger

 drivers/leds/trigger/Kconfig                |  16 ++
 drivers/leds/trigger/Makefile               |   1 +
 drivers/leds/trigger/ledtrig-input-events.c | 233 ++++++++++++++++++++
 3 files changed, 250 insertions(+)
 create mode 100644 drivers/leds/trigger/ledtrig-input-events.c

-- 
2.44.0


