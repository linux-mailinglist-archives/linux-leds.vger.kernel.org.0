Return-Path: <linux-leds+bounces-7038-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOcvI0fsoWlDxQQAu9opvQ
	(envelope-from <linux-leds+bounces-7038-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:11:03 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AED1BC7E0
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B592D304750C
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 19:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166C33859C3;
	Fri, 27 Feb 2026 19:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="oTSbW2lM"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8A831618B;
	Fri, 27 Feb 2026 19:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219211; cv=pass; b=FKgX2jvPfdHcf8qouf2VNkJvt+nZDpDa3g6lcEL1SVyjDkx4S8dV2ab1GMp5qHdUiOQcwWoZ4lyRhTpF5BYmI1j7L9nTMKtA7yBdKJzpkN54QLzJYkVmBbLJ/8+kOuA4PyY3zQ73fO333q2OEOPaAex/sMZOtpfG55Io0YrS/5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219211; c=relaxed/simple;
	bh=Ucy7XAZZO4/8HWFzYkIyCLLhG908Cm/XxzdahSNiIQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XY0wJszU4ajpykAqFEhnifSoSL51Td/lxee0o9o8z+BC62gQ4lX50sJDthfYt7Uo8rh/q7lDorSEDdg/5+pHY12Gow+CuSgLUqOBc6AVDC2dh3uZsDfBlnWty+DiDhvhVaZr8J/iuP9hox9cZSipe8fPjX233m6ToYY9SonswNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=oTSbW2lM; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1772219185; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HoH4Dxxbzhw7dePTntIXeQZkXak7CuBfb2XIWZPt0Uyq5kChWSrrL39qaSO4CUfhxkW0lHing+6UQswjQofhqyO9/r+eay0B1mMyOXenGKDdYlPDhXSmIry2a9ucIVYpGqaG8n6Gi9UkQvZmzrw2twTLfXdyWpy0YeJ/4jGFZMA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772219185; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xy17tU33w1xzCJldc+joPucIJEv6DyWFIT0d2bdInMI=; 
	b=JRmtYTP4HNrDo3qTduQjo8qxg98IASuJp+yy8mbv5FJJmfPEwALP9CeaZ5uRzYYXIc1PEPF1ep/S/YZ9DChwx9vmM9tSViCKG3fV2iNaSg+X0zSfVV24YI7/CBE1vRiPVHG2f3sB8g6Ja2Dcm5xqxra17CamEq7qszK1itDMZcE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772219185;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Xy17tU33w1xzCJldc+joPucIJEv6DyWFIT0d2bdInMI=;
	b=oTSbW2lMGF3WJc+A6YiYg++8i7FasKD5s844kwb6lTnrT5SyFeZDjakiz6K0h5f6
	58ycwC7yv9+H3iqbxOuJ2bxXhfhrG7JTfJ6xA0lNSrTO153S5fbP9F8CGGvWQ7pS0+o
	k498D4mo2yr8DBQYxd3JNPIFhYhifFvhLSPCcl0xr4wRmJz4uQR0exl+eVKYlyuDkhL
	030nbTP/dkKVFhx4x6DXk/ZOGUK6/H+64q216IZWdQz5qEPt1nBNPOpPBSaQ1DDfuwz
	D3bwrKiDiQ9Cl4TsQxD7bxd1e/2ZD7rIwW65Qa04Ed7f0/i9g1i6lEashXInKmsgQI6
	zyF/zz7kgA==
Received: by mx.zohomail.com with SMTPS id 1772219184087993.5636808454385;
	Fri, 27 Feb 2026 11:06:24 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>
Cc: Rong Zhang <i@rong.moe>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	vsankar@lenovo.com,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 0/9] leds: Add support for hw initiated hw control trigger transition
Date: Sat, 28 Feb 2026 03:05:57 +0800
Message-ID: <20260227190617.271388-1-i@rong.moe>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7038-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[rong.moe:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[rong.moe,gmail.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rong.moe:mid,rong.moe:dkim]
X-Rspamd-Queue-Id: E5AED1BC7E0
X-Rspamd-Action: no action

Hi all,

Some laptops can tune their keyboard backlight according to ambient
light sensors (auto mode). This capability is essentially a hw control
trigger. Meanwhile, such laptops also offer a shrotcut for cycling
through brightness levels and auto mode. For example, on ThinkBook,
pressing Fn+Space cycles keyboard backlight levels in the following
sequence:

  1 => 2 => 0 => auto => 1 ...

Recent ThinkPad models should have similar sequence too.

However, there are some issues preventing us from using hw control
trigger:

1. We want a mechanism to tell userspace which trigger is the hw control
   trigger, so that userspace can determine if auto mode is on/off or
   turing it on/off programmatically without obtaining the hw control
   trigger's name via other channels
2. Turing on/off auto mode via the shortcut cannot activate/deactivate
   the hw control trigger, making the software state out-of-sync
3. Even with #1 resolved, deactivating the hw control trigger after
   receiving the event indicating "auto => 1" has a side effect of
   emitting LED_OFF, breaking the shortcut cycle

This RFC series tries to demonstrate a path on solving these issues:

- Introduce an attribute called trigger_may_offload, so that userspace
   can determine:
   - if the LED device supports hw control (supported => visible)
   - which trigger is the hw control trigger
   - if the hw control trigger is selected
   - if the hw control trigger is in hw control (i.e., offloaded)
     - A callback offloaded() is added so that LED triggers can report
       their hw control state
- Add led_trigger_notify_hw_control_changed() interface, so that LED
  drivers can notify the LED core about hardware initiated hw control
  state transitions. The LED core will then determine if the transition
  is allowed and turning on/off the hw control trigger accordingly
- Tune the logic of trigger deactivation so that it won't emit LED_OFF
  when the deactivation is triggered by hardware

The last two patches are included into the RFC series to demonstrate how
to utilize these interfaces to add support for auto keyboard backlight
to ThinkBook. They will be submitted separately once the dust settles.

Currently no Kconfig entry is provided to disable either interface. If
needed, I will add one later.

[ Summary of other approaches ]

< custom attribute >

Pros:
- simplicity, KISS
- no need to touch the LED core
- extensible as long as it has a sensor-neutral name
  - a sensor-related name could potentially lead to a mess if a future
    device implements auto mode based on multiple different sensors

Cons:
- must have zero influence on brightness_set[_blocking] callbacks
  in order not to break triggers
  - potential interference with triggers and the brightness attribute
- weird semantic (an attribute other than "brightness" and "trigger"
  changes the brightness)

< hw control trigger (this series) >

Pros:
- mutually exclusive with other triggers (hence less chaos)
- semantic correctness
- acts as an aggregate switch to turn on/off auto mode even a future
  device implements auto mode based on multiple different sensors
  - extensibility (through trigger attributes)

Cons:
- complexity

[ Previous discussion threads ]

https://lore.kernel.org/r/08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fastmail.com

https://lore.kernel.org/r/1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@rong.moe

Thanks,
Rong

Rong Zhang (9):
  leds: Load trigger modules on-demand if used as hw control trigger
  leds: Add callback offloaded() to query the state of hw control
    trigger
  leds: cros_ec: Implement offloaded() callback for trigger
  leds: turris-omnia: Implement offloaded() callback for trigger
  leds: trigger: netdev: Implement offloaded() callback
  leds: Add trigger_may_offload attribute
  leds: trigger: Add led_trigger_notify_hw_control_changed() interface
  platform/x86: ideapad-laptop: Decouple HW & cdev brightness for kbd
    backlight
  platform/x86: ideapad-laptop: Fully support auto kbd backlight

 .../obsolete/sysfs-class-led-trigger-netdev   |  15 ++
 Documentation/ABI/testing/sysfs-class-led     |  22 ++
 .../testing/sysfs-class-led-trigger-netdev    |  13 --
 Documentation/leds/leds-class.rst             |  72 ++++++-
 drivers/leds/led-class.c                      |  23 +++
 drivers/leds/led-triggers.c                   | 176 +++++++++++++++-
 drivers/leds/leds-cros_ec.c                   |   6 +
 drivers/leds/leds-turris-omnia.c              |   7 +
 drivers/leds/leds.h                           |   3 +
 drivers/leds/trigger/ledtrig-netdev.c         |  10 +
 drivers/platform/x86/lenovo/Kconfig           |   1 +
 drivers/platform/x86/lenovo/ideapad-laptop.c  | 194 ++++++++++++++----
 include/linux/leds.h                          |   6 +
 13 files changed, 492 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev


base-commit: a75cb869a8ccc88b0bc7a44e1597d9c7995c56e5
-- 
2.51.0


