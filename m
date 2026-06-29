Return-Path: <linux-leds+bounces-8783-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6udmKNOCQmpq8wkAu9opvQ
	(envelope-from <linux-leds+bounces-8783-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 16:36:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FE96DC1E8
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 16:36:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=posteo.de header.s=2017 header.b=aTAeiVxG;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8783-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8783-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=posteo.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D821C308009B
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 14:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF6041323C;
	Mon, 29 Jun 2026 14:21:45 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43541408619
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 14:21:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742905; cv=none; b=GxhRkb3C8KyksWsrsklnRnBQ1PXJrX9ukA4WwQeIYNycKY9lPRPzMMHE2cQohjPcJsHKUkNXcCErmxCu+ax0FEldKzio9jgPGKKX7nrSJJmoSCEgbmQU0fNa+mjEiqJhMJa7JuXxxu+IHCeQzapm7qIKNvxJ3hhL46DzRTAQ3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742905; c=relaxed/simple;
	bh=qLlH50DsPBHxPs+lphtz4ADgANwwLqfu3+0Z85rFfgc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I2ZwHBZwl6kAFQjI1id6M3ivAOeP/Q1n7A+G9zjemMSvy/ahGqZ5Dm0B7bo8Kn1y3B8VX/vDhNHHJhmcXG4cu8vciVsQ86wsrDLb3Bm/XHGY21otfhmG29W3kluy8J/9mDSxA3Q5k+ctEGCJTX9bTLL1pOWtqTorU8oPURj/deA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=aTAeiVxG; arc=none smtp.client-ip=185.67.36.65
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id BC608240028
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 16:21:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1782742895; bh=gIcbkjb2wutZUnDm3LaOG+Uc5Hy+tJ2frk8lfaReGAY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:To:Cc:Autocrypt:OpenPGP:From;
	b=aTAeiVxGY7KC0pNmtMd8sxaFQ6WDjwo85pQTxSC0mleII2xyfcZNHJHhfl22LnNxL
	 OJdZQhRDn3SZWOpKVZZzTLCeRtnqTyNuptCD4PqbPGVLidUyqXIJJOqLaQt/y+ry3T
	 SEP9kyAEAwwZz7PSX9YupQlHYGpr+p1ulMhgFD42jqcOeI5puvUPvQ00kD+6LRIZEb
	 A1q6aj/pPOKOo/YDwUo+303rj+LPCGr+igf0wW+nhYaF0FrpT+JFEWsofX6dx1yLhP
	 R4hbfHTokMoX5v2BbwGjdHXmPwoxPWTR+KqvDB8raEQVjk5UXnyPyVG0zRRgy4SSXK
	 vyKAPMYDg2sLw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gppP76nzzz9rxd;
	Mon, 29 Jun 2026 16:21:31 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Subject: [PATCH v15 0/2] Introduce Synology Microp driver
Date: Mon, 29 Jun 2026 14:21:34 +0000
Message-Id: <20260629-synology_microp_initial-v15-0-4b3d7367c7cf@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XUzY7bIBAH8FeJfC4RA8NXTvseVRVhGLLWJnHW9
 lqNVnn3YudQZDfuEaT5MQx/+7vqqWuorw6776qjsemb9poXoH7sqvDurydiTcwbleBCc8k16+/
 X9tye7sdLE7r2dmyuzdD4M+PJRB9MbdDpKlffOkrN75n++eu57ujzK58wPDerC/W9nw847GZeS
 Q5SGKn3Ujir0DFg0X90bx/UXem8b7tTVfY1lykQYFj31Q/HfJdIIyNSaIEctyocRhD/qgHAZ82
 ZYs+8Uy6ZIJJJ7jAKmCpq3xML7eXSDIfdaPaCdQGq6SbvTT+03X2e2QjzVf47nREYZymkRJE0o
 g1vt7YfqN1Hms1RlI597YjsOGmd0zJJCGrpyMIB+dqR2fFR+4BaesFh6WDhCP7awexwFDLG2sr
 gcemo0nGvHZUdYUJteR2Tcqt+9F8HuXrt6KkfmyKhwVoHt3RM4QC8dsw0Zy89d0gmj2jp2MLZm
 o/NjnGovQOBuL6XK52N93LZQW+VlMka4mbpAC8h3Ahing8jq0QUSVLtVx0BlJLZkKZMuwB1VF5
 nK64kUUobjw9TqpF7rriUQQu+kopY57/EhjTn2ou6dkFpSqvvDLCUNgIAU7JBGhNRqFpgXUqPx
 +MPPrdR7TsFAAA=
X-Change-ID: 20260306-synology_microp_initial-0f7dac7b7496
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=7339;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=qLlH50DsPBHxPs+lphtz4ADgANwwLqfu3+0Z85rFfgc=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqQn9rFD5nLSotFcztOv7cxwwIgYms95PMdR6oY
 N6RdFQx/o+JAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCakJ/axsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9LZ4Q//RxgIeDL9ri01R9A7yR/CFR37QpP3IvS
 T4ADmI3k8kQ73Jsp/saM1KxeOHaqeh3kgWCQUL6x2Ukxal8Do/neFLhXW/iDV4hHY8vjVm1ZGNC
 nkq0cnxC4T628bEOsrbWv8CKmeP0I43ruGSdrh7T1+v94lOeZdhdOHPm0HklKpx/ZVVis4ttBEn
 dmy88qs1DfcrJCdsePK7Od1H7tpcj7bVU7dc7QVjwh2hoqqXS2halUyBGwk6QcjVqOLGT+Z4qDZ
 3Zc9J/uoef1GDWmgnSbKtPRc3r3ObDwJY/lMFkPCFgceA9Yk7oGTyLE7j1Tm/iCBVCB1pR5scLb
 0135SLI262VuYzL8KjS0RaIShn73LO1KipecXGoTwBXPN/nqBpOejr+KvJqfATzNkOyeTeuYqOY
 dt5b6Qm4W/rypzKvoLP0V0tC2BLyPVa/wB81zc9x3Vzuh3LQy9D2Fd8V9UvRcX59iC38xX9BBZr
 iS+MwfYoE6LEcnHtWiZc0AkzeexPzG9FrI64nV+hIBHAnQXIekC0jg9iu9H8JlxuvOjVxVN0z5V
 PtyURMCMGoKpj9QIpQ2W2ed952vAKavkD07icEx+UanXlPH1rZgNiXFKxmd7vI2xSpNI5/rO5RF
 B2LpHbGpO2YkL0PHBRp0PAmwrWsJeYt3bImj+aiPH/X73RtM7Ft0=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8783-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,collabora.com,nvidia.com,onurozkan.dev];
	FORGED_SENDER(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:bryan.odonoghue@linaro.org,m:lee@kernel.org,m:pavel@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:gregkh@linuxfoundation.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:platform-driver-x86@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:markus.probst@posteo.de,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[posteo.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,msgid.link:url,posteo.de:dkim,posteo.de:email,posteo.de:mid,posteo.de:from_mime,model.rs:url,synology_microp.rs:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95FE96DC1E8

Synology uses a microcontroller in their NAS devices connected to a
serial port to control certain LEDs, fan speeds, a beeper, to handle
proper shutdown and restart, buttons and fan failures.

This patch series depends on the rust led abstraction [1] and the rust
serdev abstraction [2].

This is only a initial version of the driver able to control LEDs.
The following rust abstractions would be required, to implement the
remaining features:
- hwmon (include/linux/hwmon.h)
- input (include/linux/input.h)
- sysoff handler (include/linux/reboot.h)

[1] https://lore.kernel.org/rust-for-linux/20260629-rust_leds-v21-0-4f0f19579db5@posteo.de/
[2] https://lore.kernel.org/rust-for-linux/20260603-rust_serdev-v12-0-3400ffb88b12@posteo.de/

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
Changes in v15:
- adapted to rust led abstractiopn v21
- Link to v14: https://patch.msgid.link/20260531-synology_microp_initial-v14-0-1377d425b24b@posteo.de

Changes in v14:
- adapt to led abstraction v18 and serdev abstraction v11
- Link to v13: https://patch.msgid.link/20260530-synology_microp_initial-v13-0-aa2bb9c56efc@posteo.de

Changes in v13:
- adapted to driver-lifetime v5 patch series.
- set blink = false as initial power led state, as set_blink hasn't been
  called yet (even though the led is blinking at startup)
- Link to v12: https://patch.msgid.link/20260429-synology_microp_initial-v12-0-40a05033c620@posteo.de

Changes in v12:
- adapted to driver-lifetime patch series. The driver can't take
  advantage of it, until class devices like led also make use of it.
- Link to v11: https://patch.msgid.link/20260427-synology_microp_initial-v11-0-9c1bd5a6f3ed@posteo.de

Changes in v11:
- rebased on top of 7.1-rc1
- add "synology" as devicename to led, like it is done in existing dts
  files in the kernel
- fix color for led being orange instead of amber. I personally can't
  clearly tell them apart, but apparently its amber.
- replaced MCU with EC in Kconfig help
- Link to v10: https://patch.msgid.link/20260424-synology_microp_initial-v10-0-e852d2f3eba1@posteo.de

Changes in v10:
- resolved issues reported by Sashiko Bot:
  - removed unneeded include from device tree
  - fix typo in of device table
  - fix blink not set to false, if delay_off or delay_on is 0
- Link to v9: https://patch.msgid.link/20260423-synology_microp_initial-v9-0-4a8533f87e07@posteo.de

Changes in v9:
- separate fallback and front compatibles in dt schema
- remove front compatibles from of id table, if all functionality is
  by covered by the fallback
- remove TODO file
- add platform-driver-x86@vger.kernel.org to Maintainers file entry
- use `Delta` type in `BLINK_DELAY` const
- Link to v8: https://patch.msgid.link/20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de

Changes in v8:
- removed unnecessary Copy and Clone derive
- added `BLINK_DELAY` constant
- added compatible id fallbacks
- moved dt schema patch before the driver
- added ds411p
- Link to v7: https://lore.kernel.org/r/20260411-synology_microp_initial-v7-0-9a3a094e763a@posteo.de

Changes in v7:
- remove list of compatible ids from commit msg
- explain what makes the different models not compatible in the commit msg
- remove unnecessary examples
- Link to v6: https://lore.kernel.org/r/20260405-synology_microp_initial-v6-0-08fde474b6c9@posteo.de

Changes in v6:
- moved devicetree bindings patch at the end of the set
- remove several patches
- move of id table from model.rs to synology_microp.rs
- remove the model! macro
- use if blocks in devicetree schema to narrow down the
  fan-failure-gpios property
- add multiple devicetree examples to test if blocks
- Link to v5: https://lore.kernel.org/r/20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de

Changes in v5:
- add esata led support
- use different compatible for each model
- add visibility modifier to of_device_table macro
- fix match data missing when using PRP0001
- Link to v4: https://lore.kernel.org/r/20260320-synology_microp_initial-v4-0-0423ddb83ca4@posteo.de

Changes in v4:
- convert to monolithic driver and moved it into drivers/platform
- removed mfd rust abstraction
- moved dt-bindings to embedded-controller
- Link to v3: https://lore.kernel.org/r/20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de

Changes in v3:
- remove `default n` from Kconfig entry, as n is the default already.
- select RUST_SERIAL_DEV_BUS_ABSTRACTIONS in Kconfig
- add mfd rust abstraction
- split core and led parts into their own driver. It should now be considered a
  MFD device.
- split led part of dt binding into its own file
- Link to v2: https://lore.kernel.org/r/20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de

Changes in v2:
- fix missing tabs in MAINTAINERS file
- remove word binding from patch subject
- add missing signed-off-by
- add missing help entry in Kconfig
- add missing spdx license headers
- remove no-check{,-cpu}-fan properties from the dt-bindings and replace
  them with the check_fan module parameter
- use patternProperties for leds in dt-bindings
- license dt-binding as GPL-2.0-only OR BSD-2-Clause
- move driver from staging tree into mfd tree and mark it as work in
  progress inside Kconfig
- only register alert and usb led if fwnode is present
- Link to v1: https://lore.kernel.org/r/20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de

---
Markus Probst (2):
      dt-bindings: embedded-controller: Add synology microp devices
      platform: Add initial synology microp driver

 .../synology,ds918p-microp.yaml                    | 100 +++++++
 MAINTAINERS                                        |   7 +
 drivers/platform/Kconfig                           |   2 +
 drivers/platform/Makefile                          |   1 +
 drivers/platform/synology_microp/Kconfig           |  13 +
 drivers/platform/synology_microp/Makefile          |   3 +
 drivers/platform/synology_microp/command.rs        |  54 ++++
 drivers/platform/synology_microp/led.rs            | 297 +++++++++++++++++++++
 drivers/platform/synology_microp/model.rs          |  49 ++++
 .../platform/synology_microp/synology_microp.rs    |  91 +++++++
 10 files changed, 617 insertions(+)
---
base-commit: 728e68a889bcf257b1e67298b12c360e5c3a13e0
change-id: 20260306-synology_microp_initial-0f7dac7b7496
prerequisite-message-id: 20260530132736.3298549-1-dakr@kernel.org
prerequisite-patch-id: 310c6bee038ca3909a8e5e58ec12b74f7189b869
prerequisite-patch-id: 92812c3d42b29504838e6dc66c307ff5c035bb5e
prerequisite-change-id: 20251217-rust_serdev-ee5481e9085c:v12
prerequisite-patch-id: 059e43aa20628647ba98a0e5582444a5a7b68ec4
prerequisite-patch-id: 310c6bee038ca3909a8e5e58ec12b74f7189b869
prerequisite-patch-id: 92812c3d42b29504838e6dc66c307ff5c035bb5e
prerequisite-patch-id: a75cb3f900db0e765351b773cbfffaeb9a01a107
prerequisite-patch-id: 19eb53ce0c653c1406f8f192f6ad158fb4bd8d8f
prerequisite-patch-id: 55d6a70baf3be7f4da36b82cf02a5a7d59457520
prerequisite-change-id: 20251114-rust_leds-a959f7c2f7f9:v21
prerequisite-patch-id: d6a2bb314f215e3c6bd3a3ac87b991a33e3d6256
prerequisite-patch-id: 50bfe4b15f07d3733d4fc4b4520ce74cbac2cf4f
prerequisite-patch-id: ec48c2616ea8f0bd8f71cec858f1d5d0fdb2bac0


