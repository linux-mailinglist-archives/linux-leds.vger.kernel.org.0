Return-Path: <linux-leds+bounces-8389-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB8aIdU7GmqR2QgAu9opvQ
	(envelope-from <linux-leds+bounces-8389-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 30 May 2026 03:22:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D637760ABD0
	for <lists+linux-leds@lfdr.de>; Sat, 30 May 2026 03:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CE0E303F7F6
	for <lists+linux-leds@lfdr.de>; Sat, 30 May 2026 01:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCE5247DE1;
	Sat, 30 May 2026 01:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W18sP45z"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BD123392A;
	Sat, 30 May 2026 01:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780103839; cv=none; b=n0D5AsfsXHTpaT8HMefidPS6zTfLLoLesXTW1wzE0XGaOYMjBeTTbc0IGN8hMnO2b+mDVGDTmCTm5GbjQyjKsELsjF64gEn5GAVnOftS/CZlyf3FVJhHWReKRGFRkwJhrCiLpe1dwbcZActcRlePbm6k+8Fn+oA3CLDPmKCRF6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780103839; c=relaxed/simple;
	bh=XEG7/6Tx8+Ho9GaqwSQnKkYuJ7k2VfUo2qlY6W8R35M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TBImJzGDQZe98fZVrs82ra+fmQ/tXavQ5PKoPBUgvVzeMoc9L6JTs6fBouvTbz/rgK3dhY5YhOqceAVnLwyUV6VXzI3UpMZWVffcUywdE+aWw2k+kokP9aTTu46N1QEjOJ0jpCnI0os8OnOqixpMCJMAOyIJ+ahRCMyJIaP7bh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W18sP45z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 977F0C2BCB3;
	Sat, 30 May 2026 01:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780103838;
	bh=XEG7/6Tx8+Ho9GaqwSQnKkYuJ7k2VfUo2qlY6W8R35M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=W18sP45z8f6Jzvl+DhZ8mcPn+7L+EuwVmobfHkUY3MPKB6dfKt6onwC6tggUdNwz+
	 zNfojlalSgu0L8CEWziuRiUrUAfq3ckjCfLTNsOJ6Et1uxRMm6m3uRR7R6RKyRSYTI
	 zAmiZCdfxQfiLtUjFK3739v7xzA5qBr+GrQ/e+laEswcylpry5NDWuvJqNbLA4MsvZ
	 sS+tGwj6JyKWq0DNIrXl0mRGdsl04dBiUMZbtDh4gbXdjBAyuunSvRanpZtRaxRRmz
	 kqAXN8ugxt3Dk7JHyAfqYTOz9EwXxrwkTtO5XMK1/MyQ9HRY7BPuze/7ahGf19kUvi
	 g6RO0NmRYV/DA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D523CD6E51;
	Sat, 30 May 2026 01:17:18 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Subject: [PATCH v13 0/2] Introduce Synology Microp driver
Date: Sat, 30 May 2026 03:17:10 +0200
Message-Id: <20260530-synology_microp_initial-v13-0-aa2bb9c56efc@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJc6GmoC/4XU227jIBAG4FeJfL1EDGdy1fdYrSIMQ4qaxCm4V
 qMq717sSLuWU2evLJDmg/kZ+aspmBOWZrf5ajIOqaTuXBfAf20a/+rOByQp1I2GUaYop4qU67k
 7dofr/pR87i77dE59ckdCow7O61YLq5pafckY0+dE//5zX2d8/6gn9PfN5oSluOmA3WbiJZUgm
 aB0y21dWEWABPeWX94wn/G47fJhlB/rmKxfy2ALTChrfi77285UJYGBJvmj9PsaQcCBIEphAC0
 10u8G81MJgLiXHDEU4qy0UXsWdbS7AfRY0bqCxHenU+p3m0FvgWQvm7H/11T6Ll+npAeYAvhvp
 gMQSqKPEQMqIYx/uXSlx24bcDIHNnfMusOqY7mxVvHIwculw2cO8HWHV8cF5bxQ3DEKS0fMHEb
 XHVEdKhgPoTXcO7F05Nyx646sDtO+NbQNUdqH+6h/jqBy3VHjfUwMKLRolbdLR88cgHVHjzk77
 qgVqGtES8fMnGf5mOpoK5SzdaLFY1927jx5L1sd4YzkPBqNVC8doHNIPBnEmg9BI1lgkWPrHm4
 EMJf0E2mcaeuhDdKpaoUHic2lJ48P41QL6uqvgnOvGJ1Lt9vtG8tSrObdBAAA
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11870;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=XEG7/6Tx8+Ho9GaqwSQnKkYuJ7k2VfUo2qlY6W8R35M=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqGjqcKVrYHDmJ0oBoU91qnSwjap8r+nQ+iwhsM
 ZIhszkcTFKJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaho6nBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9J5TA/+I3T/oh45SvxmGfx+Md+E08AFbXnPkZ8
 achBSp8fuXTmdwUfQ54nxk+OPEEGubVrDcrTQbmOGi5NBx0BDjtZ80ZPbpuP07vXyMYkX3TZx2P
 EYeeJTn4RKzOTI7oFgunaypwwCHHGQ22z4fAtsvjoP0gb201SDnCaIXDFrq5McTA1r7M8TK23oi
 UxqLGQaRBH8rM+/+YBpXZ0t3eWNPs8648oLEepzcDwGfRniFwQItg5TOdcP5HPCIUK6k9JOammY
 vRxGVyLlG+r4KBno6mqmJ6qPvAyeB8CVzVSH6jkytZI2qH5S6CXDhu+wGy32H+/UsUFmFcv9kwy
 Rmo1auzQ71zUhprHRcFCSc4wsM/P6nXrxK+nXxxPwHiORAwHq2Qaumnhsv8WIRjezhT+cLn9xMt
 F5P6XuIlQuVTjJuNWiV8PryHWuOrt3DouZ7oeY7ZsxniJ02qXz0L5iM1UR+hFSIQxitqQfZ7wlv
 K1MHnuME1LETzEhql3LogemmAMPSsGdARNsdqA71xbM16WWDZYvErPemSEKh4mf8IdNskttahon
 ohse2q7hgjThEBR8TOxXjmekMquX+qSaxNUIwWI8vYX/ptIlI59aAwu+g7HAWAi0YOaZdv7fdGd
 Tru4IXuVGatyFvBtyJ9y2JC9gJgf5qEufCwHRnBhubyABwi170N0=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
X-Endpoint-Received: by B4 Relay for markus.probst@posteo.de/default with
 auth_id=680
X-Original-From: Markus Probst <markus.probst@posteo.de>
Reply-To: markus.probst@posteo.de
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8389-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	HAS_REPLYTO(0.00)[markus.probst@posteo.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,model.rs:url,posteo.de:replyto,posteo.de:mid,posteo.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,synology_microp.rs:url]
X-Rspamd-Queue-Id: D637760ABD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

[1] https://lore.kernel.org/rust-for-linux/20260530-rust_leds-v17-0-c0698c4368e2@posteo.de/
[2] https://lore.kernel.org/rust-for-linux/20260530-rust_serdev-v8-0-2a95f1da22a7@posteo.de/

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
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
 drivers/platform/synology_microp/led.rs            | 287 +++++++++++++++++++++
 drivers/platform/synology_microp/model.rs          |  49 ++++
 .../platform/synology_microp/synology_microp.rs    |  91 +++++++
 10 files changed, 607 insertions(+)
---
base-commit: 9e171fc1d7d7ab847a750c03571c87ac3c17bd84
change-id: 20260306-synology_microp_initial-0f7dac7b7496
prerequisite-message-id: 20260505152400.3905096-1-dakr@kernel.org
prerequisite-patch-id: d2aebf69b153c039bbed1d0ed26906708fd22534
prerequisite-patch-id: 84b28da2f5de20fc1785095c647b2ffc35d969a5
prerequisite-patch-id: 67318671a5eed5fb4ad23a450f1cf0e442bf8ca2
prerequisite-message-id: 20260525202921.124698-1-dakr@kernel.org
prerequisite-patch-id: b84db329d4372a175cb8d49e4e88c3eecf7eb228
prerequisite-patch-id: 2c30303f409cc8288cc87e241920219f5ddd8390
prerequisite-patch-id: 4e4f0ad370d763ad00b0f75b91fa216f2cc95953
prerequisite-patch-id: 5bcd6b37f3498feebda275dfef78136eba34004e
prerequisite-patch-id: 872b0982f3e5e7d1698d9df3b325e4cd27b27789
prerequisite-patch-id: 3a3c7749e017d9335f58497404d1350e96caf471
prerequisite-patch-id: 3526c9154f581497a11465b936d83ef61a875454
prerequisite-patch-id: 65d8c757b52475c2acc7d22ddc92cd3f0152b55d
prerequisite-patch-id: 4bd31f1414d5248dc080884caadf5f21684a8427
prerequisite-patch-id: 7beadbb0da3e589ed86d12f512d1c83427dd82b4
prerequisite-patch-id: 12cd0f67ffd27347f90c065db491945908206b7f
prerequisite-patch-id: 4642e31f66331f6c3b579377111ea733dbb3a11c
prerequisite-patch-id: 52d67b40b4396c741e2222d6a5bc7927abcb77aa
prerequisite-patch-id: 74ca82ff26cf9c7a993757c87db8be62006e820f
prerequisite-patch-id: 466fb9fa7febbffd8ef51b311c7d9893c11fc0f0
prerequisite-patch-id: e515cd98b06e26721cbbe6a4fbacd251d0073b63
prerequisite-patch-id: 8dc8e75d9f6499a554ef7e474bbacdbf3660a9f2
prerequisite-patch-id: 5fdb9f71dca2f44dd293760a60db125b770f1f55
prerequisite-patch-id: c766a24c2d5064f5ec09daada0b8e8fba862d3aa
prerequisite-patch-id: b768f6456d35fa7a80c015e34bbdba6082dbd593
prerequisite-patch-id: 6a8b17234f12f7084e6e2ce843a7031b0a891ce4
prerequisite-patch-id: 98b2deb9e60c1f28f90c5ee34fd608aaa9fd9420
prerequisite-patch-id: 774b29be66e641ee50cedb4704cf49d8b9fabf50
prerequisite-patch-id: cf95dc936cfc4b3a7a363435a51a48d9009645b3
prerequisite-change-id: 20251217-rust_serdev-ee5481e9085c:v8
prerequisite-patch-id: 45128665162dd9f51a0764deb3815a338948b291
prerequisite-patch-id: b84db329d4372a175cb8d49e4e88c3eecf7eb228
prerequisite-patch-id: 2c30303f409cc8288cc87e241920219f5ddd8390
prerequisite-patch-id: 4e4f0ad370d763ad00b0f75b91fa216f2cc95953
prerequisite-patch-id: 5bcd6b37f3498feebda275dfef78136eba34004e
prerequisite-patch-id: 872b0982f3e5e7d1698d9df3b325e4cd27b27789
prerequisite-patch-id: 3a3c7749e017d9335f58497404d1350e96caf471
prerequisite-patch-id: 3526c9154f581497a11465b936d83ef61a875454
prerequisite-patch-id: 65d8c757b52475c2acc7d22ddc92cd3f0152b55d
prerequisite-patch-id: 4bd31f1414d5248dc080884caadf5f21684a8427
prerequisite-patch-id: 7beadbb0da3e589ed86d12f512d1c83427dd82b4
prerequisite-patch-id: 12cd0f67ffd27347f90c065db491945908206b7f
prerequisite-patch-id: 4642e31f66331f6c3b579377111ea733dbb3a11c
prerequisite-patch-id: 52d67b40b4396c741e2222d6a5bc7927abcb77aa
prerequisite-patch-id: 74ca82ff26cf9c7a993757c87db8be62006e820f
prerequisite-patch-id: 466fb9fa7febbffd8ef51b311c7d9893c11fc0f0
prerequisite-patch-id: e515cd98b06e26721cbbe6a4fbacd251d0073b63
prerequisite-patch-id: 8dc8e75d9f6499a554ef7e474bbacdbf3660a9f2
prerequisite-patch-id: 5fdb9f71dca2f44dd293760a60db125b770f1f55
prerequisite-patch-id: c766a24c2d5064f5ec09daada0b8e8fba862d3aa
prerequisite-patch-id: b768f6456d35fa7a80c015e34bbdba6082dbd593
prerequisite-patch-id: 6a8b17234f12f7084e6e2ce843a7031b0a891ce4
prerequisite-patch-id: 98b2deb9e60c1f28f90c5ee34fd608aaa9fd9420
prerequisite-patch-id: 774b29be66e641ee50cedb4704cf49d8b9fabf50
prerequisite-patch-id: cf95dc936cfc4b3a7a363435a51a48d9009645b3
prerequisite-patch-id: 52b17274481cc770c257d8f95335293eca32a2c5
prerequisite-patch-id: 6ab09768759461c6bea5d4a0833d50e3e41067f1
prerequisite-patch-id: c8506718a0433ffc4b3c686c1261509159a54d31
prerequisite-patch-id: 19eb53ce0c653c1406f8f192f6ad158fb4bd8d8f
prerequisite-patch-id: 55d6a70baf3be7f4da36b82cf02a5a7d59457520
prerequisite-change-id: 20251114-rust_leds-a959f7c2f7f9:v17
prerequisite-patch-id: 45128665162dd9f51a0764deb3815a338948b291
prerequisite-patch-id: b84db329d4372a175cb8d49e4e88c3eecf7eb228
prerequisite-patch-id: 2c30303f409cc8288cc87e241920219f5ddd8390
prerequisite-patch-id: 4e4f0ad370d763ad00b0f75b91fa216f2cc95953
prerequisite-patch-id: 5bcd6b37f3498feebda275dfef78136eba34004e
prerequisite-patch-id: 872b0982f3e5e7d1698d9df3b325e4cd27b27789
prerequisite-patch-id: 3a3c7749e017d9335f58497404d1350e96caf471
prerequisite-patch-id: 3526c9154f581497a11465b936d83ef61a875454
prerequisite-patch-id: 65d8c757b52475c2acc7d22ddc92cd3f0152b55d
prerequisite-patch-id: 4bd31f1414d5248dc080884caadf5f21684a8427
prerequisite-patch-id: 7beadbb0da3e589ed86d12f512d1c83427dd82b4
prerequisite-patch-id: 12cd0f67ffd27347f90c065db491945908206b7f
prerequisite-patch-id: 4642e31f66331f6c3b579377111ea733dbb3a11c
prerequisite-patch-id: 52d67b40b4396c741e2222d6a5bc7927abcb77aa
prerequisite-patch-id: 74ca82ff26cf9c7a993757c87db8be62006e820f
prerequisite-patch-id: 466fb9fa7febbffd8ef51b311c7d9893c11fc0f0
prerequisite-patch-id: e515cd98b06e26721cbbe6a4fbacd251d0073b63
prerequisite-patch-id: 8dc8e75d9f6499a554ef7e474bbacdbf3660a9f2
prerequisite-patch-id: 5fdb9f71dca2f44dd293760a60db125b770f1f55
prerequisite-patch-id: c766a24c2d5064f5ec09daada0b8e8fba862d3aa
prerequisite-patch-id: b768f6456d35fa7a80c015e34bbdba6082dbd593
prerequisite-patch-id: 6a8b17234f12f7084e6e2ce843a7031b0a891ce4
prerequisite-patch-id: 98b2deb9e60c1f28f90c5ee34fd608aaa9fd9420
prerequisite-patch-id: 774b29be66e641ee50cedb4704cf49d8b9fabf50
prerequisite-patch-id: cf95dc936cfc4b3a7a363435a51a48d9009645b3
prerequisite-patch-id: ea861073f29519d3aa4e6e13b6cdf22e6882c093
prerequisite-patch-id: 72e3f69ddcb244e8871f63086c416d485d807901
prerequisite-patch-id: e8dab3c76da6795163eabb6799188856431134b7



