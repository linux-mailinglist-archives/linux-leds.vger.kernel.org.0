Return-Path: <linux-leds+bounces-1558-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 383488BA1FD
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2024 23:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E706D280D03
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2024 21:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACACD1635DB;
	Thu,  2 May 2024 21:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MO8V1UpS"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B61181313
	for <linux-leds@vger.kernel.org>; Thu,  2 May 2024 21:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714684476; cv=none; b=OVFpCVqq//YOqGhYdklu9z1rn7aaVJvwfc3foyrw9fJYqgaCLLEJgLpzropNSjqLwlCnT+LsQAwYXOuYHtcf6hmj9pHTpVhGKaulUJaCr0b3r0ljRoQB53rakqnfus+X6UbJZjiVlQ5bAjWYPWiZzJa/j09vMoXUGsDWbpOdLB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714684476; c=relaxed/simple;
	bh=rgKiuxp0KFmYpUzNhIDlxHrx2g/X1BRfNqkEpVlSA/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CqA3ApR1+dciZulaO9PCOEwvwC+Sf2wXDeu/Q4Y6jMJVS5BUxVhK3hKiiUYCTwCHyQTGw6XWos1ZpRLVGzxLqgDhWc6wKGyyn8U33mwhy8SPVLBwpc4Ss6eoIo20ix2SEcfuisDBSjCyPROuyCgERDh7ZjN2aJQ9E2ajwmMBLwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MO8V1UpS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714684474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+yb74sCZBPhPPjmzE+BoPdK3yuptgNQ0UnjwumtB9W0=;
	b=MO8V1UpSNqzXg98OQjIx+5IB0WZjW1mRg/qKhFrrryyuMEnRd9Uf124vUFOYHMaiR0vznZ
	WxaL3PbNMpi1NYyGLTrdPk4xKCtzh6Jm6ymYu1c0XkAornBKOAs/FkpfwIHbBlNSeALVDm
	ktu5M8GygxN74wmJ+1uCHT0t2w40UOo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-5ZquhIAeNCSNTSyryoojlw-1; Thu, 02 May 2024 17:14:28 -0400
X-MC-Unique: 5ZquhIAeNCSNTSyryoojlw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9171D81F469;
	Thu,  2 May 2024 21:14:27 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 38098477F82;
	Thu,  2 May 2024 21:14:26 +0000 (UTC)
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
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v8 0/7] KTD2026 indicator LED for X86 Xiaomi Pad2
Date: Thu,  2 May 2024 23:14:18 +0200
Message-ID: <20240502211425.8678-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

Hi All,

Here is v8 of Kate's series to add support for Xiaomi Pad2 indicator LED.

I believe this is ready for merging now. Patch 6/7 has an Acked-by from
Sebastien for merging this patch through the leds tree since it depends
on the earlier patches. LEDs tree maintainers please merge patches 1-6,
then patch 7 can be merged through the pdx86 tree indepdently.

This work includes:
1. Added the KTD2026 swnode description to describe the LED controller.
2. Migrated the original driver to fwnode to support x86 platform.
3. Support for multi-color LED trigger event.
4. The LED shows orange  when charging and the LED shows green when the
   battery is full.

Moreover, the LED trigger is set to the new trigger, called
"bq27520-0-charging-orange-full-green" for Xiaomi Pad2 so the LED shows
orange when charging and the LED shows green when the battery is full.

--
Changes in v8:
1. New bugfix: "leds: rgb: leds-ktd202x: Initialize mutex earlier"
2. Make charging_orange_full_green triggers set the colors in RGB order
3. Modify the Pad2 ktd202x fwnode to have the colors in RGB order

Changes in v7:
1. Platform: x86-android-tablets: other: Add swnode for Xiaomi pad2
   indicator LED was included in Hans' branch.
2. Included the tags from the previous version in the commit message.
3. Fixed the comma issue for the structure initialiser.

Changes in v6:
1. The I2C ID table was moved to a separate patch.
2. The LED shows orange when charging.
3. The trigger name was renamed to charging-orange-full-green.
4. The default trigger of Xiaomi Pad2 is
   "bq27520-0-charging-orange-full-green".

Changes in v5:
1. Fix swnode LED color settings.
2. Improve the driver based on the comments.
3. Introduce a LED new API- led_mc_trigger_event() to make the LED
   color can be changed according to the trigger.
4. Introduced a new trigger "charging-red-full-green". The LED will be
   red when charging and the LED will be green when the battery is full.
5. Set the default trigger to "bq27520-0-charging-red-full-green" for
   Xiaomi Pad2.

Changes in v4:
1. Fix double casting.
2. Since force casting a pointer value to int will trigger a compiler
   warning, the type of num_leds was changed to unsigned long.

Changes in v3:
1. Drop the patch "leds-ktd202x: Skip regulator settings for Xiaomi
   pad2"

Changes in v2:
1. Typo and style fixes.
2. The patch 0003 skips all the regulator setup for Xiaomi pad2 since
   KTD2026 on Xiaomi pad2 is already powered by BP25890RTWR. So, the
   sleep can be removed when removing the module.

Regards,

Hans


Hans de Goede (3):
  leds: rgb: leds-ktd202x: Initialize mutex earlier
  leds: core: Add led_mc_set_brightness() function
  leds: trigger: Add led_mc_trigger_event() function

Kate Hsuan (4):
  leds: rgb: leds-ktd202x: Get device properties through fwnode to
    support ACPI
  leds: rgb: leds-ktd202x: I2C ID tables for KTD2026 and 2027
  power: supply: power-supply-leds: Add charging_orange_full_green
    trigger for RGB LED
  platform: x86-android-tablets: Xiaomi pad2 RGB LED fwnode updates

 drivers/leds/led-class-multicolor.c           |  1 +
 drivers/leds/led-core.c                       | 31 +++++++
 drivers/leds/led-triggers.c                   | 20 +++++
 drivers/leds/rgb/Kconfig                      |  1 -
 drivers/leds/rgb/leds-ktd202x.c               | 84 +++++++++++--------
 .../platform/x86/x86-android-tablets/other.c  |  6 +-
 drivers/power/supply/power_supply_leds.c      | 23 +++++
 include/linux/leds.h                          | 26 ++++++
 include/linux/power_supply.h                  |  2 +
 9 files changed, 156 insertions(+), 38 deletions(-)

-- 
2.44.0


