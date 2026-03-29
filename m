Return-Path: <linux-leds+bounces-7575-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLGEIFdpyWnqxwUAu9opvQ
	(envelope-from <linux-leds+bounces-7575-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 20:03:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2223537E4
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 20:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B86743012268
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 18:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC87B3859FC;
	Sun, 29 Mar 2026 18:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGjaSeBo"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDF627281D;
	Sun, 29 Mar 2026 18:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774807360; cv=none; b=FmXZxO1Zt3PdLLCtL51uP9oj/X48V5mC/y3wCZRJ4MGlwwYbhJFcGuEQQ4MZLdrmB2NLeb4IfeCd6+eGs5vndWdVdvmlE/zoAzCghCNWKy3GoOj3HOsJyMYs9DSOt3jVafF6uUqgr5xzHrlQhjdGanBSYpjy9HqR54xHrE0Gtvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774807360; c=relaxed/simple;
	bh=e9f+BMD2N11b9ib6ZSQd0dqaXGkaOaje80ss+t/0DIw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s9n0NMEB5LaM8Yr+/yNbfjDZO8NPVaVG08d9wlESgHSAOf2WS64ciBZaIv3UuZzTVyk0Lk6MsLeUXyN8Hd86iI6wzYIfHWSz2OYZZ6n7OATJtcmKIe4v7dX+7iiJu1uDnSUipp6GRZF7JwKD/pVQ9pKyhlzdIsj6wUEKVu/8ctI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGjaSeBo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 485E1C116C6;
	Sun, 29 Mar 2026 18:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774807360;
	bh=e9f+BMD2N11b9ib6ZSQd0dqaXGkaOaje80ss+t/0DIw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nGjaSeBoXXXuEodbE8MhnZMq9Yy089MQNUvTfroXxFO587/k4eUzeX4BcvTcKkfo4
	 zNrGbd9uwANGioKjyuAf3WdX9ZsbVECMCTVLANFuxnwVqgmBGuc/8sZ/03lHSDBTQ9
	 xUIK0Ioj5g+XKg5RQ/YG8oJYYcG1MJCQTtY/iAx6i2HyNITwMlnQaqIF4kpf7MopN2
	 vy+e4pag7mqWF7kdbB2KLpIe7fNT8fwJTUTe8EOgU9WzMW7udHAmquG03drtfkJeio
	 Fgxr4a8rz02nJCZutTKB49WFGpAQJcTQtG8IJd2Nd8YstQo1uMS0v5JJ1old1oUB3L
	 phKbjmXcHdMvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30469F3D60E;
	Sun, 29 Mar 2026 18:02:40 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Subject: [PATCH v5 0/4] Introduce Synology Microp driver
Date: Sun, 29 Mar 2026 20:02:14 +0200
Message-Id: <20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACZpyWkC/4XP32rDIBgF8FcJXs/if2Ou9h5jFKufrdDGVFNZK
 X33uXSwUCi7PML5eb4bKpAjFDR0N5ShxhLT2IJ865A72HEPOPqWESNMEU4ULtcxHdP+uj1Fl9O
 0jWOcoz1iErS3Tu+0MAq19pQhxK9F/vh85AznS/tgfjz++UPXdEkZ1ThfyrxtkzxUDCBFT8GQX
 rqhcrSe9FuhVDwqR/AFWyNN0I4FHcxQ6dLY2QLYpdMpzkNX9Ybg7CT6GXSIZU75ulxe6bLo3yM
 rxQQHFwJ4UEL07n1KZYa08bCYla2d/rXDmmN4b4zigVMnnx2+cih/7fDmWK+sE4pbRuizI1YOI
 68d0RwiGPd+13Nnxdq53+/fqYwUBCcCAAA=
X-Change-ID: 20260306-synology_microp_initial-0f7dac7b7496
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4452;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=e9f+BMD2N11b9ib6ZSQd0dqaXGkaOaje80ss+t/0DIw=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBpyWk2rUhmZ7TPhVuN6wydRwT1dix2jIFFv5vla
 /grj/FHqNaJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaclpNhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9LiHw//T9vdWAmurrnC0s622dhpTVgbKSQHzQG
 5yblR8VQwWCtwnBBEjNhKYBGVX2xzsTH7rgQwHOSvti+wigT56uPtNyboK/6MPIKytjJOI1lSsd
 Aafbg0El+YVHvgt350Wd4QiUFwwRqvJBY+umM1w85+2EIoNPMLLus9Tfa8szuL5w9vsne8+tfv3
 lVKoBTELOZDEShIG40lNJ9WtC63jT+j9FJDkzr/YQmXiCBJMMGNZBqNnckQRSvjx5mwO3TXkRq8
 BMc3wXUvyX3ihe2j7Q08gM9V1wcczqnGpq2DV2cejiqXAooDVicTO8qsmPOqw7vdgRxAqopv6/B
 pKmn0DGrgSY/4fKf6XAjMOifov9Io0UVZDlNnuZxuznz7nzYGpIjD9ixj7BejrmnuUxTKfPVG4a
 3fkk/cuXTVB+NAIaTjTKLSSE+07UZzPn9HZZWL2Gt2trZ6hP3bwG41k6Jsb96woTWJKIUGYB7hZ
 kiJzosBB6f5MTZH17FnyHMh9zGz9nFI2BALl4TNiG5v0wfqfqqeqExdF9dUs6WR6easfuOD5kgj
 Lt/5KqF7VuOr4HmU6AWz6jaYsYD+al/akn5Rnz8LfqOzcLRL6jjprgK37irs+npw2ZZsjKW9cK3
 WR0NfJLntEeHN+wRyhvUprKHWV6Z/QJOJvgccX43WEigzODILB5w=
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7575-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,posteo.de:replyto,posteo.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1F2223537E4
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
- sysoff handler + hardware protection shutdown (include/linux/reboot.h)

[1] https://lore.kernel.org/rust-for-linux/20260329-rust_leds-v13-0-21a599c5b2d1@posteo.de/
[2] https://lore.kernel.org/rust-for-linux/20260313-rust_serdev-v3-0-c9a3af214f7f@posteo.de/

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
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
Markus Probst (4):
      dt-bindings: embedded-controller: Add synology microp devices
      ACPI: of: match PRP0001 in of_match_device
      rust: add visibility to of_device_table macro
      platform: Add initial synology microp driver

 .../synology,ds923p-microp.yaml                    |  65 +++++
 MAINTAINERS                                        |   6 +
 drivers/acpi/bus.c                                 |   7 +-
 drivers/of/device.c                                |   9 +-
 drivers/platform/Kconfig                           |   2 +
 drivers/platform/Makefile                          |   1 +
 drivers/platform/synology_microp/Kconfig           |  13 +
 drivers/platform/synology_microp/Makefile          |   3 +
 drivers/platform/synology_microp/TODO              |   7 +
 drivers/platform/synology_microp/command.rs        |  55 ++++
 drivers/platform/synology_microp/led.rs            | 276 +++++++++++++++++++++
 drivers/platform/synology_microp/model.rs          | 171 +++++++++++++
 .../platform/synology_microp/synology_microp.rs    |  54 ++++
 include/linux/acpi.h                               |  11 +
 rust/kernel/of.rs                                  |   5 +-
 15 files changed, 678 insertions(+), 7 deletions(-)
---
base-commit: d1d81e9d1a4dd846aee9ae77ff9ecc2800d72148
change-id: 20260306-synology_microp_initial-0f7dac7b7496
prerequisite-change-id: 20251217-rust_serdev-ee5481e9085c:v3
prerequisite-patch-id: 52b17274481cc770c257d8f95335293eca32a2c5
prerequisite-patch-id: eec47e5051640d08bcd34a9670b98804449cad52
prerequisite-patch-id: f24b68c71c3f69371e8ac0251efca0a023b31cc4
prerequisite-patch-id: 3dfc1f7e5ecd3e0dd65d676aeb16f55260847b25
prerequisite-change-id: 20251114-rust_leds-a959f7c2f7f9:v13
prerequisite-patch-id: 818700f22dcb9676157c985f82762d7c607b861e
prerequisite-patch-id: b15ffa7d95d9260151bfb116b259c4473f721c82
prerequisite-patch-id: 8c47e0d107530f577a1be0b79f8ee791f95d3cbe



