Return-Path: <linux-leds+bounces-1766-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A28778D63E2
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 16:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CA9C1F2449E
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 14:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8605F158DDF;
	Fri, 31 May 2024 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C2y/N1Va"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0071515B106
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 13:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163964; cv=none; b=XH8SK4Yp4rcmVDtYYThnkO3XVWJydCvbRtPhmNbN5HoRcd+xuYxoUd7rnNm8UQumWS/bTpq+WFqSFJLis4mWiovSMdL9UpOHQ/EW+i19N9MZ1zSYGQ41U2BrNwP7UMTzNGTXo3UAsNyuuwDyNAVhTRwhYZInYFC/4JUo1a0V49s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163964; c=relaxed/simple;
	bh=b1ziKa/te1+vuCv+IYJc6cUzOc5dUBoh85xuajXYgsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qlJOtPviiM/JuQBT6bdgafzQlpJUOt7c5dTevMHckApdYhvWiTHM2ryNz3Y2ADaGzBz5FVo9LQlkpfz2awhSwotASkUFCrqAkCXosj4L7w5NHNoEam5xQyVZxCFF9LPgWK//NY4LZvTRRLXsDELiuLYYAhdTUcHmpzxJjkQgivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C2y/N1Va; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717163961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4FHQJP96BxsHrXC5wmthkrx4Th26HVDazkmRJkcjsyY=;
	b=C2y/N1Vai6HO2WMLT/8HdI7y3rt5D9mtt8GjxiKGZhK22Q2Vjj4vBcOJpAiNj6MNRIqP9N
	KOZMaeFoYJ16WX8B0h3dhQnKZ3BUbf0SIqHD6lTEiEq7fJLEQUutGTEdKxR4AEm+yq00RU
	5bVZywS1MsVlOzJ+hjIn2/A6nPnZZpA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-GZhEyxD8NqKTocrxm8ka8A-1; Fri, 31 May 2024 09:59:19 -0400
X-MC-Unique: GZhEyxD8NqKTocrxm8ka8A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75CBB185A780;
	Fri, 31 May 2024 13:59:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9EC5A51BF;
	Fri, 31 May 2024 13:59:18 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-leds@vger.kernel.org
Subject: [PATCH v3 0/1] leds: trigger: Add new LED Input events trigger
Date: Fri, 31 May 2024 15:59:09 +0200
Message-ID: <20240531135910.168965-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

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

Changes in v3:
- Rebase on v6.10-rc1
- Use kzalloc(sizeof(*handle), ...)

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
2.45.1


