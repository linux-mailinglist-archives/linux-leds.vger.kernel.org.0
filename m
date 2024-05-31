Return-Path: <linux-leds+bounces-1761-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1904F8D6366
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 15:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B8B91C26E3D
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 13:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A41158DD3;
	Fri, 31 May 2024 13:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ShvGbZ5G"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD549158DD6
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 13:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163241; cv=none; b=nFA02iLsoi7I/T7A+b83KuPSSb+vrXwN/Qvj5ea+19CRqfXvqEdG1gvJAFR5cVQdxjpA+0TMQwD9fV9Ww9yIPYTDisnrPhgT7gpBq+R0SDN8c6B275CQniMtryXohHgsmAVHihO2w+ac/XarW6g2y+ww4r6sNL/FJ837lafN5gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163241; c=relaxed/simple;
	bh=zeLocC1NGaOcNYKscGuUkNU5SfwK15oEy7SRK9R9AsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ou6O6t6xiuC/zbpBHlXDwPFpkP+Wj6i5sCFktP4ZSLUMcbEfbXVt116B9xZI2tgQbXmENPChYOUTb5IP7z5YjbCA1CdvOLCNE7LcpRDAGah2yscHEAjOgXu65BsCYfS5AnrO4PSmLhwkedx+JQDmvUUSD60irqn2NcCb20SPcQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ShvGbZ5G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717163238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hkyDJ97Nt4W0DLuh1WlFGOGD1xVSkXowvYZeokoIvEg=;
	b=ShvGbZ5GH6OJIglngldjK+UmCVowvKttI3sYmr1bw9o1nVjbi18NHRIcx1ueMQlnB3IBHC
	X3qYfUoj0pJD68prZ2KFbdpL+pkHQDfQ7twJ4MbD3udOnnytyy34WfV4pyJfE49X+WGuZ2
	WGM4zrTEgkrxHIkrZtBxAiVQigGrEqg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-Qmr5Gif_PKWLoepUPpdwKQ-1; Fri, 31 May 2024 09:47:15 -0400
X-MC-Unique: Qmr5Gif_PKWLoepUPpdwKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAB3B800169;
	Fri, 31 May 2024 13:47:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B47C7105480A;
	Fri, 31 May 2024 13:47:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/3] power: supply: power-supply-leds: Add activate() callback to triggers
Date: Fri, 31 May 2024 15:46:59 +0200
Message-ID: <20240531134702.166145-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Hi All,

This series adds an activate callback to the power-supply LED triggers to
ensure that power-supply LEDs get the correct initial value when the LED
gets registered after the power_supply has been registered.

Note that in 6.10-rc1 commit 822c91e72eac ("leds: trigger: Store brightness
set by led_trigger_event()") already solves this for the case were
the trigger only changes only the brightness. Since the power-supply
triggers can also set blinking and colors of mc LEDs that is not enough.

Patches 1-2 do some refactoring / prep work and patch 3 adds the actual
activate callback.

This series applies on top of 6.10-rc1 + "[PATCH v10 0/6] KTD2026 indicator
LED for X86 Xiaomi Pad2" that series should show up in
https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/

soon, since this is also LED related I guess this could be merged
through the LED tree too. Or Lee could provide an IB branch for
Sebastian to merge that branch + this series through the psy tree.
Sebastian, what has your preference ?

Regards,

Hans


Hans de Goede (3):
  power: supply: power-supply-leds: Add
    power_supply_[un]register_led_trigger()
  power: supply: power-supply-leds: Share trig pointer for online and
    charging_full
  power: supply: power-supply-leds: Add activate() callback to triggers

 drivers/power/supply/power_supply_leds.c | 178 +++++++++++++----------
 include/linux/power_supply.h             |   9 +-
 2 files changed, 103 insertions(+), 84 deletions(-)

-- 
2.45.1


