Return-Path: <linux-leds+bounces-7333-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAYLFc1ftGmKmgAAu9opvQ
	(envelope-from <linux-leds+bounces-7333-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 20:04:45 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB73A28915D
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 20:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E20AF31C4E6E
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 19:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C719C3E0C56;
	Fri, 13 Mar 2026 19:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvJLiRlV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD4733509B;
	Fri, 13 Mar 2026 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773428609; cv=none; b=HVm4xo3JgfbnZmQbjJZ5uGOGs6fXVteu/O4DWRjCksF9fSIUOW6hPyHBENxzToRGu2Yv6ZzGlMGX5Ch9AgfbmcmJnKgGXL9pmIJntbiQ3XLEh4GdIpRP6+cP7YzayAnlrGWX5ub7uRkApGc8VjQuWfGDHMnVzFgiydDMp0ZUgPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773428609; c=relaxed/simple;
	bh=e599/+9riorUGtuRfkF9HzcpRuZoJHcKGAJ9QlZI5I8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nXpmJuekQZ/Y23pJdseybLApJWE0YGRFkV8ddQJ0jySXw0g1ic3CzesK9Gx1W5mdLxF+9s6vIzPVrXH7jLsn6NFReOjACAhbsGZsKjt+pqP2jjLvxiQySUHgLX+r0/7xa37KjWmYBZRW53lxvtqw27wAfXhM8NZrfgQ1dmuyzvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvJLiRlV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D21AC2BCB6;
	Fri, 13 Mar 2026 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773428608;
	bh=e599/+9riorUGtuRfkF9HzcpRuZoJHcKGAJ9QlZI5I8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pvJLiRlVTW9gj4yNp19D00dm8OTYy0w6khpjKe122WpTkf8RqPCoBowhTmwWCdTOv
	 sv4PKFUP3zo0RueVJcPzy3YeqvYpURal4NjR6Sny/XdWyxnk2qJuc09lpFVHbKD/dK
	 8kaVi276zEQIYnqSGmHcBVKEa161uWrEaCo8ObN/ACXevVXGzchAuPXZEKR5vEag0x
	 IjqOVbGRGjIldUBxNKGFAbngT6tbwnBGPRpRVTU0LkAone7APgmxdlwU+pjh/UKd6n
	 X2o+OI3tEmrHGJs40VECpZByH+5FYB0NytevZ66bnKcxY0pjZRoljm4a6ZM61r+v62
	 RFrgUNSqQVuFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AAA107BCD7;
	Fri, 13 Mar 2026 19:03:28 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Fri, 13 Mar 2026 20:03:10 +0100
Subject: [PATCH v3 6/7] mfd: Add synology microp core driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-synology_microp_initial-v3-6-ad6ac463a201@posteo.de>
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
In-Reply-To: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Igor Korotin <igor.korotin.linux@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-pci@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 Markus Probst <markus.probst@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3772;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=n1TKkDCU7sA420yu0PCrb8RGAbqzgpwd288LpkGJk1c=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBptF97W5uQx7vZUUUd4QTbEpR69O3l4q/MbVaPB
 MN4wBOFIiyJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCabRfexsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9IsyhAAhBUVFnog6ffMupKTG44AV8/+txW6AW1
 EvUWNHUFE8jVpTzG30B+pT3z9Ay1Wm6uXoBrrg9hRXLYdZczOyEPw5SHpbBQ02+xqwRi732nBd0
 NE+9GUMnsEI2Z64+5sNuqjEJCQRQT4shpdDV8fJ4QGegPLRoTcl/ns/JG7Uxik+98RCzJFKuEoH
 qPiaqjizLGlQSjWRxmToWO8wcORGh27vMzKUR1xRqWWHEBQKN6FbgK3+C+CO8sOSoamqMnhkTq9
 z4rxYOrOtA1J/ZiHlNLd55BEQhTXDyKTriwjm8POPEKXAeahPGy4nCXLK9RTKDrGIGERH7DEZCN
 IhdOEF8AYgjZG4A3F5xy5RxRRAZB2zeEYD8UqGhGthVmmPlD8eo2oBUgox3iNh7BkxER5SqYa6P
 EKkEKwJZkzbeXT2JmQ3uCNTuGiiA0sLzO0JYPeYNvnwgVtswPVgMZv4zeokBKJe+6tNFBUFcwvn
 nbQsJYfMsuR6Z/vbZXek0ofgoaTKNDfjbBNyojNybEwKLF35it2wvyfwiwfgRVDpRYcZhswpP22
 3+DBMH2MreBmpoTD6ut+vAqGJmAwhRoEPu1P9B4sgWnWkBn6BAq7nTNm3d8nD6OGaw/CbnVpR7x
 W3cW1RzC4tFC/zCLdW9w6BMAaK9wt8vl1wEqBVbCxRHWXTqCAl7Y=
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7333-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	HAS_REPLYTO(0.00)[markus.probst@posteo.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,posteo.de:email,posteo.de:replyto,posteo.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BB73A28915D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Markus Probst <markus.probst@posteo.de>

Add a synology microp core driver, written in Rust.
The driver targets a microcontroller found in Synology NAS devices. It
only provides the base for sub-devices, like LEDs.

Tested successfully on a Synology DS923+.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 MAINTAINERS                    |  7 +++++++
 drivers/mfd/Kconfig            | 11 ++++++++++
 drivers/mfd/Makefile           |  2 ++
 drivers/mfd/synology_microp.rs | 46 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 66 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa49e40836ab..32932ecab9cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25539,6 +25539,13 @@ F:	drivers/dma-buf/sync_*
 F:	include/linux/sync_file.h
 F:	include/uapi/linux/sync_file.h
 
+SYNOLOGY MICROP DRIVER
+M:	Markus Probst <markus.probst@posteo.de>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/synology,microp.yaml
+F:	Documentation/devicetree/bindings/mfd/synology,microp.yaml
+F:	drivers/mfd/synology_microp.rs
+
 SYNOPSYS ARC ARCHITECTURE
 M:	Vineet Gupta <vgupta@kernel.org>
 L:	linux-snps-arc@lists.infradead.org
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7192c9d1d268..8b8b391d1b47 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1320,6 +1320,17 @@ config MFD_SY7636A
 	  To enable support for building sub-devices as modules,
 	  choose M here.
 
+config MFD_SYNOLOGY_MICROP
+	tristate "Synology Microp core driver"
+	depends on RUST
+	select RUST_SERIAL_DEV_BUS_ABSTRACTIONS
+	select MFD_CORE
+	help
+	  Enable support for the MCU found in Synology NAS devices.
+
+	  This driver only provides the base for sub-devices. For additional
+	  functionality, you have to enable support for the sub-devices as well.
+
 config MFD_RDC321X
 	tristate "RDC R-321x southbridge"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e75e8045c28a..f754be7163cd 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -304,3 +304,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
 obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
 
 obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
+
+obj-$(CONFIG_MFD_SYNOLOGY_MICROP)	+= synology_microp.o
diff --git a/drivers/mfd/synology_microp.rs b/drivers/mfd/synology_microp.rs
new file mode 100644
index 000000000000..b9b5fff5c18d
--- /dev/null
+++ b/drivers/mfd/synology_microp.rs
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Synology Microp core driver
+
+use kernel::{
+    device,
+    mfd,
+    of,
+    prelude::*,
+    serdev, //
+};
+
+kernel::module_serdev_device_driver! {
+    type: SynologyMicropCoreDriver,
+    name: "synology_microp",
+    authors: ["Markus Probst <markus.probst@posteo.de>"],
+    description: "Synology Microp core driver",
+    license: "GPL v2",
+}
+
+struct SynologyMicropCoreDriver;
+
+kernel::of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <SynologyMicropCoreDriver as serdev::Driver>::IdInfo,
+    [(of::DeviceId::new(c"synology,microp"), ()),]
+);
+
+#[vtable]
+impl serdev::Driver for SynologyMicropCoreDriver {
+    type IdInfo = ();
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+    const MFD_CELLS: Option<&'static [mfd::Cell]> =
+        Some(&[mfd::Cell::new(c"synology_microp_leds").of(c"synology,microp-leds", None)]);
+
+    fn probe(
+        dev: &serdev::Device<device::Core>,
+        _id_info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, kernel::error::Error> {
+        let _ = dev.set_baudrate(9600);
+        dev.set_flow_control(false);
+        dev.set_parity(serdev::Parity::None)?;
+        Ok(Self)
+    }
+}

-- 
2.52.0



