Return-Path: <linux-leds+bounces-1591-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD198BC061
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2024 14:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7117E281C9B
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2024 12:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B11107A6;
	Sun,  5 May 2024 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FRIcBLrv"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337D214293
	for <linux-leds@vger.kernel.org>; Sun,  5 May 2024 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714912373; cv=none; b=W+xTgDEhm+ksmifpbufuM/PhewUIGQSlWKvHALQpWyvpIeDuo+31ZqSAPqFFRQt4xRLSxlcOAZkSmZ8BsSRnTRgSwS3/eVQUgFHoE+LmBfigu1FteQsCQ4gnpRIKZlLFNI6t2l5HeDdx5bp7QXx1kxhs9qb4jXF/Ii3MhSLA9yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714912373; c=relaxed/simple;
	bh=yTBSP1sxglL+LMYPRMfQ0MuvBnoFLhauti1RqikAueI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=svoUjTQIEEBPYycS90+TAPv9JvmU08jX8/kCLlFr5SYvVv2sWBOy7S/snuNV/oC2/89Bwxphw8ygMVvGTTnI6/Gn28krvWmLpriYFf0uHuep4f7l8h+5ojAHE6T6m6HW2HltPRkB8fpMl6nx3jUR35q8MSp81ABNKNx79YeuJIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FRIcBLrv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714912371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UvYDSSJ1kiUKxT7MPvRtb7iJtqAeyhNGsmjTBbrxiQQ=;
	b=FRIcBLrv7wchIWAYM26zL2aJ6R6ePmCS09p1rxDU2ffDSPxgGvzf8J7iU029Mn1WK5ij/V
	4p3SR4dibnISR1QEHcCEtJ9OlBwCG6GKRV4fd7Y/4LFpLLxX2uC4h2Lf912RsexWtNkaCp
	7GA/R9D4WA1vfvcVKvaRDNe5fQqN2h4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-x5q9JY-vMmaU6GH0wZZlXA-1; Sun, 05 May 2024 08:32:47 -0400
X-MC-Unique: x5q9JY-vMmaU6GH0wZZlXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3609D80B3DD;
	Sun,  5 May 2024 12:32:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A00B200AF76;
	Sun,  5 May 2024 12:32:46 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-leds@vger.kernel.org
Subject: [PATCH 0/1] leds: trigger: Add new LED Input events trigger
Date: Sun,  5 May 2024 14:32:39 +0200
Message-ID: <20240505123240.14955-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

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

Regards,

Hans


Hans de Goede (1):
  leds: trigger: Add new LED Input events trigger

 drivers/leds/trigger/Kconfig                |  16 ++
 drivers/leds/trigger/Makefile               |   1 +
 drivers/leds/trigger/ledtrig-input-events.c | 252 ++++++++++++++++++++
 3 files changed, 269 insertions(+)
 create mode 100644 drivers/leds/trigger/ledtrig-input-events.c

-- 
2.44.0


