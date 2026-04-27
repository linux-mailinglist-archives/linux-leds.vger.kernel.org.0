Return-Path: <linux-leds+bounces-7859-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AdoNMSn72njDgEAu9opvQ
	(envelope-from <linux-leds+bounces-7859-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2026 20:15:32 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49669478591
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2026 20:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15D7F304F231
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2026 18:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F202B3E9591;
	Mon, 27 Apr 2026 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGD/Jsz7"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2003E9298;
	Mon, 27 Apr 2026 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777313563; cv=none; b=NLHOw8ox3zcNOVRM+pxajZdfcIWep+TFkntToY1e2SsMPp8iGjH+t/b/ff9VSji+BUnSzRn04zs2mlfC8HHDBuBOThbfsxMqZ5Szyhi8UptOejnZgrRiyNzrxYLj5EL4QSiGRDkKHxwlrI1quh43D3C2KAktn3sUmYmWHcZ3wFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777313563; c=relaxed/simple;
	bh=UdG0Y3AzgBhVD5fbYvF/r1RlsPIe/pDq4iIEOXkt55Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GlFXEjr0osAtIDLXVFBfmBPGW690Nv5fvX5ZaMv0Xf5zvnwETzgg+EuVdoyn2F3e0LWeaFizlrCIJEiR7i8Eih86v2AlVNUMOXdzRYd9lCO/Ag+wZ1oGeH6iFMOpoVeR2cJZDDXT4W011MJ5EvGCWaxnRpNC7wQrdE5id3C2xks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGD/Jsz7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61CC2C19425;
	Mon, 27 Apr 2026 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777313563;
	bh=UdG0Y3AzgBhVD5fbYvF/r1RlsPIe/pDq4iIEOXkt55Q=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NGD/Jsz7AZGvieu9I8A8IqNaueLW8h2KOHQtrcVl0AkYBDulPAoLB4jqb/IoX5nI1
	 B0wn9YUzHkvyuQreavyalzjF7k9OJeJ/VKj0TeJWSJV26ZdzSiIF0s/f97ZR8kj2XD
	 mzCq0f+669nRlhpo+qIbNP9JUHroK6Wi3Or/rm7CVPLu3zVtGAhxeGMS5w4rB6t/9K
	 3WR8CaCfr2f+KjLuYTyEsx82XrGiWJvUAe4fTbK/j/ydVJx7wdZ9Vozns/1S0iJ3hS
	 SxAI55886lSWJWcM5IT8QAzlTWmPWQoEUJw7jvG8qb9cfsc4twqLskJsq08WEVKp3h
	 7jdPOiQqa0Euw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51692FF886C;
	Mon, 27 Apr 2026 18:12:43 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Subject: [PATCH v11 0/2] Introduce Synology Microp driver
Date: Mon, 27 Apr 2026 20:12:38 +0200
Message-Id: <20260427-synology_microp_initial-v11-0-9c1bd5a6f3ed@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABan72kC/4XSzW7jIBAH8FeJfC4VA8OXT32PahVhGFqkJE6Na
 21U5d2XOId6XTk9MtL8+M/AV1NoyFSadvfVDDTlkvtTPQA87Zrw7k9vxHKshUZwobnkmpXLqT/
 0b5f9MYehP+/zKY/ZHxhPJvpgOoNON7X7PFDKf2f69c/9PNDHZ71hvBe//XZXdQUCDBs+y7ivm
 SJNjEihBXLcqtBOM7puAcB7y4FiYd4pl0wQySTXToC3js4XYqE/HvPY7ibzDGwI0NwCvecy9sN
 lHn2COdGvQ07AOEshJYqkEW14OfdlpP450mxOYunYbUdUx0nrnJZJQlBrRy4ckNuOrI6P2gfU0
 gsOawcXjuDbDlaHo5AxdlYGj2tHLR237ajqCBM6y7uYlPuRR387yNW2o295bIqEBjsd3NoxCwd
 g2zG3PXvpuUMydUVrxy6cR/ux1TEOtXcgEH/O5ZbOg/dy1UFvlZTJGuJm7QBfQvjgI9b9MLJKR
 JEkdf6/RNfr9R9hfXWV2gMAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6107;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=UdG0Y3AzgBhVD5fbYvF/r1RlsPIe/pDq4iIEOXkt55Q=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBp76cZY43+JXV0zU7jUWnPpJio9bHcx8O4/zp7G
 ba+iHsCSauJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCae+nGRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9I0qA//cxHSwP79AllLalTIKQT+fRxW+mC8kfa
 YTcpwzsByTqn/zKWXJt6lIja1AeVEIZNTSPt72CmneOisWSKMXP8gmpkbPS0xrNzZpWgV33Za8b
 2oRjrH/vky4Emi61hwO6kt3p6iUnh9sCm7RoU9A615sIg3niF8bY1G6gdxubUkTsv9IHngl9qIy
 Qy32ei5AUZ/lrU/Pi8KOY3QkbezaHgS90aZk/ncJTy0TrJS2T4iXAoKuuwkpF5jNN58B5d+19uw
 EkpDz4D4/sdfb9+hrZdNcI/c3zcPkB4jh5gRuWouvOMz2eySZtD44x3niSgbIqy8JEpmxZHsoIn
 k+aORsUnJTSG66HKf7ygGBVN/jgvlZW/LAKrgki4pw7jqNzJWUVOVpdothtMPadD6Cs3S7dCreq
 8tMFJW3KvhEKfYJG9tu9frqelVKjMZ2zy6er/HkIXsLNwLD+r5l7G2sN69X1Ttv2qtfMojUWZps
 mrYEMy+eS9zeGRvSXVCIC8WYIrqIE+/T0y4A81dbUAf7oMJ10R39ymSnpPK6yVdg4feFgbJG8wE
 l4Q2dlIyjs06cxil3gv7n4ufvizupHmsLyO522mVLQPZ0g9xMZcXCxml/g7EfLe19N63LsfpBPM
 og6wgmExmiykbW6ljAfAwMAmD844Dp4XFFsWTxckNn7+7H4GMUNo=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
X-Endpoint-Received: by B4 Relay for markus.probst@posteo.de/default with
 auth_id=680
X-Original-From: Markus Probst <markus.probst@posteo.de>
Reply-To: markus.probst@posteo.de
X-Rspamd-Queue-Id: 49669478591
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7859-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	HAS_REPLYTO(0.00)[markus.probst@posteo.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,posteo.de:email,posteo.de:replyto,posteo.de:mid,synology_microp.rs:url,msgid.link:url,model.rs:url]

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

[1] https://lore.kernel.org/rust-for-linux/20260427-rust_leds-v14-0-4f4b17e5d516@posteo.de/
[2] https://lore.kernel.org/rust-for-linux/20260427-rust_serdev-v6-0-173798d5e1a3@posteo.de/

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
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
 .../platform/synology_microp/synology_microp.rs    |  90 +++++++
 10 files changed, 606 insertions(+)
---
base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
change-id: 20260306-synology_microp_initial-0f7dac7b7496
prerequisite-change-id: 20251217-rust_serdev-ee5481e9085c:v6
prerequisite-patch-id: 52b17274481cc770c257d8f95335293eca32a2c5
prerequisite-patch-id: 6ab09768759461c6bea5d4a0833d50e3e41067f1
prerequisite-patch-id: 8df2fcbdf925250fd8b768c48d4d4224a431c987
prerequisite-patch-id: d0686cf451ef899a06d468adfba51ccd84e6ff98
prerequisite-change-id: 20251114-rust_leds-a959f7c2f7f9:v14
prerequisite-patch-id: bffdc634baa213e70eacc27b52033b16bd7451c4
prerequisite-patch-id: b15ffa7d95d9260151bfb116b259c4473f721c82
prerequisite-patch-id: 144f13648788a554a03be98ee572e00bd985fa0f



