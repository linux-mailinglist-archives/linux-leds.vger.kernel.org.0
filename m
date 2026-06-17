Return-Path: <linux-leds+bounces-8644-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p1nSFSTRMmpJ5wUAu9opvQ
	(envelope-from <linux-leds+bounces-8644-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 18:53:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF13A69B818
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 18:53:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rong.moe header.s=zmail2048 header.b=dWKVMjer;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8644-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8644-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=rong.moe;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53BE3304EA09
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 16:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE6C495532;
	Wed, 17 Jun 2026 16:49:28 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86B634D90D;
	Wed, 17 Jun 2026 16:49:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781714967; cv=pass; b=BmWk78WnYuqp1ttTahQSifGR1vW6469+X+dAKQ2sNCIRJOxJGcyOrhtrHjSHdmguWiqgirHBbOOgzsXYrpe1UaEWn8mZ8yzFBf1y5motrljOUaYIRVo2NumkF64Y4nKddOVm48HYylFzHEQKae4hGC6WdgEeOj5GXcPsISgg9LQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781714967; c=relaxed/simple;
	bh=wJrT2V58uZc/Aq0rUPLxgR2p99HVHJubA4DSp/4Qw60=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cV2xIMz8EeG3LeWqm2DbUQSRqN+m+7wh8UfKlkeMRRfabOOiTcgpiEmpgCtq7qqkgxOWoxRAJ8TcYC7P2xnzp7izvZK0m/3HLO4E6KziIgN2ulN77rs0e8pL3puyLAKd1QvA07pE6HFc6BC7mcVQ/2OqGWVOzxQiTD/3SST9QQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=dWKVMjer; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1781714937; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P8mOydwEyh0KywaCILy0NUtbTEcZ+U+BNMWIgjUWhvxjhWO60j4jP3NdnZX4v2dC+b4YyJbAOnaAHl5s3Vv69Wa0ZmtfAI9rmIrW9dbU007svs/uLbviw+J5YqJJJ4GqR1wTb9hhYwLY/G7pDxs0UN/+NAaRLEkJ9TwugqHgsoM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781714937; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fwzmpldWEM/LsuBOnvQ7xaNSY/XR8WPxTWKCWtjOcPY=; 
	b=FHQJpJ3bGv34dQ6rPfNntw/w85BodiGMxzMJf11/MsGdc6mrz3mgM7PdPH/QPdKoL8ZnyxRSKU69wKemoFyaQo7s0kEAIHznQ4Xrs31AFA6dYx3e+AWN4ypdH8dMHeXiccWbjSIuVmzB3mA/iuub2waydwUMAErntWtoc5He680=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781714937;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=fwzmpldWEM/LsuBOnvQ7xaNSY/XR8WPxTWKCWtjOcPY=;
	b=dWKVMjerMlkbfBCVT5/OfNwvSNC6KPlhpvVHEFONGsT0X/RqdJ9150q1tZzrWU/u
	QqsJ2+mt/swHEH958DQDWwArlRyLOu974T8pRfPh7xPv7DHsWkV/PxCZEZ3jbRsFGQl
	2VpJWqgg1NeNi0ub40iHw00UvcWxAnRtBoSJwYvBXkz+cw0hK6X2l5Y9/5n5VsIgrtP
	S6Pi3C2Z2SPqQdm5zL4BttauwBCRkhGVkQtbUpuUVMzGzNA6dSkkz1a28oWRv6ZDYdu
	KN8CO/Lvh39mwiWO7AJZutwwDixF5ZSS8MiIU181jAECPB99t5jCX874Yg3HcGO08nS
	V+fOQELCuQ==
Received: by mx.zohomail.com with SMTPS id 1781714935760514.8858727678053;
	Wed, 17 Jun 2026 09:48:55 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH RFC v2 0/9] leds: Add support for hardware-initiated
 hardware control trigger transition
Date: Thu, 18 Jun 2026 00:47:54 +0800
Message-Id: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALrPMmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDUwMz3ZzUlGLdkqLM9PTUIt2Mcl2IqhRdS7NEMyNDC4vkpJQ0JaDugqL
 UtMwKsMnRSkFuzkqxEMHi0qSs1OQSkJlKtbUA3gfi84AAAAA=
X-Change-ID: 20260506-leds-trigger-hw-changed-96a62188cbdf
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Ike Panhc <ikepanhc@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@weissschuh.net,m:bleung@chromium.org,m:groeck@chromium.org,m:kabel@kernel.org,m:mpearson-lenovo@squebb.ca,m:derekjohn.clark@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:ikepanhc@gmail.com,m:andrew+netdev@lunn.ch,m:kuba@kernel.org,m:vishnuocv@gmail.com,m:vsankar@lenovo.com,m:linux-leds@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chrome-platform@lists.linux.dev,m:platform-driver-x86@vger.kernel.org,m:i@rong.moe,m:derekjohnclark@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com];
	FORGED_SENDER(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-8644-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rong.moe:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,gmail.com,lenovo.com,vger.kernel.org,lists.linux.dev,rong.moe];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,msgid.link:url,rong.moe:dkim,rong.moe:email,rong.moe:mid,rong.moe:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF13A69B818

Some laptops can tune their keyboard backlight according to ambient
light sensors (auto mode). This capability is essentially a hardware
control trigger. Meanwhile, such laptops also offer a shrotcut for
cycling through brightness levels and auto mode. For example, on
ThinkBook, pressing Fn+Space cycles keyboard backlight levels in the
following sequence:

  1 => 2 => 0 => auto => 1 ...

Recent ThinkPad models should have similar sequence too.

However, there are some issues preventing us from using a private
hardware control trigger:

1. We want a mechanism to tell userspace which trigger is the hardware
   control one, so that userspace can determine if auto mode is on/off,
   as well as turing it on/off programmatically without obtaining the
   trigger's name via other channels
2. Turing on/off auto mode via the shortcut cannot activate/deactivate
   the corresponding hardware control trigger, making the software state
   out of sync
3. Even with #1 resolved, deactivating the hardware control trigger has
   a side effect of emitting LED_OFF, breaking the shortcut cycle, where
   "auto => 1" requires the driver to deactivate the trigger

This RFC series tries to demonstrate a path on solving these issues:

- Introduce an attribute "trigger_may_offload", so that userspace can
  determine:
  - if the LED device supports hardware control (supported => visible)
  - which trigger is the hardware control trigger selected by the LED
    device
  - if the trigger is selected ("<foo_trigger>")
  - if the trigger is offloaded ("[foo_trigger]")
    - A callback offloaded() is added so that LED triggers can report
      their hardware control state
- Add led_trigger_notify_hw_control_changed() interface, so that LED
  drivers can notify the LED core about hardware-initiated hardware
  control transitions. The LED core will then determine if the
  transition is allowed and switching between "none" (i.e., no trigger)
  and the device's private trigger accordingly
  - This capability is restricted to the device's private trigger. If
    the current trigger is neither the private trigger nor "none", no
    transition will be made
  - This interface is gated behind Kconfig LEDS_TRIGGERS_HW_CHANGED and
    LED device flag LED_TRIG_HW_CHANGED
- Tune the logic of trigger deactivation so that it won't emit LED_OFF
  when the deactivation is triggered by hardware

The last three patches are included in the RFC series to demonstrate how
to these interfaces are supposed to be utilized, so that ideapad-laptop
can expose the auto mode of ThinkBook's keyboard backlight. They can be
submitted separately once the dust settles, if preferred.

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

< private hardware control trigger (this series) >

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

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Restrict the led_trigger_notify_hw_control_changed() interface to
  private triggers only
  - Drop PATCH v1 1/9 ("leds: Load trigger modules on-demand if used as
    hw control trigger"), not relavant any more
- Gate the led_trigger_notify_hw_control_changed() interface behind
  Kconfig LEDS_TRIGGERS_HW_CHANGED and LED device flag
  LED_TRIG_HW_CHANGED
- Fix lock ordering inversion
- ideapad-laptop:
  - Only call led_trigger_notify_hw_control_changed() when needed
  - Serialize keyboard backlight notifications
- Reword commit messages and documentations
- Link to v1: https://patch.msgid.link/20260227190617.271388-1-i@rong.moe

---
Rong Zhang (9):
      leds: Add callback offloaded() to query the state of hardware control trigger
      leds: cros_ec: Implement offloaded() callback for trigger
      leds: turris-omnia: Implement offloaded() callback for trigger
      leds: trigger: netdev: Implement offloaded() callback
      leds: Add trigger_may_offload attribute
      leds: trigger: Add led_trigger_notify_hw_control_changed() interface
      platform/x86: ideapad-laptop: Decouple hardware & classdev brightness for keyboard backlight
      platform/x86: ideapad-laptop: Serialize keyboard backlight notifications
      platform/x86: ideapad-laptop: Fully support auto keyboard backlight

 .../ABI/obsolete/sysfs-class-led-trigger-netdev    |  16 ++
 Documentation/ABI/testing/sysfs-class-led          |  22 +++
 .../ABI/testing/sysfs-class-led-trigger-netdev     |  13 --
 Documentation/leds/leds-class.rst                  |  74 +++++++
 drivers/leds/led-class.c                           |  23 +++
 drivers/leds/led-triggers.c                        | 131 +++++++++++-
 drivers/leds/leds-cros_ec.c                        |   6 +
 drivers/leds/leds-turris-omnia.c                   |   7 +
 drivers/leds/leds.h                                |   2 +
 drivers/leds/trigger/Kconfig                       |   9 +
 drivers/leds/trigger/ledtrig-netdev.c              |  10 +
 drivers/platform/x86/lenovo/Kconfig                |   1 +
 drivers/platform/x86/lenovo/ideapad-laptop.c       | 219 ++++++++++++++++-----
 include/linux/leds.h                               |   9 +
 14 files changed, 481 insertions(+), 61 deletions(-)
---
base-commit: 66affa37cfac0aec061cc4bcf4a065b0c52f7e19
change-id: 20260506-leds-trigger-hw-changed-96a62188cbdf

Thanks,
Rong


