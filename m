Return-Path: <linux-leds+bounces-7324-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDd7EhhctGklmQAAu9opvQ
	(envelope-from <linux-leds+bounces-7324-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 19:48:56 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B16288ECB
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 19:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 328B6300826A
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 18:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6A63E1209;
	Fri, 13 Mar 2026 18:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="QtsSuiUb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97D53E0C6E
	for <linux-leds@vger.kernel.org>; Fri, 13 Mar 2026 18:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773427705; cv=none; b=a85mfehLxBY0XyWphs2dUb6QMWeYhzfZZk/fyy4QSoY0N28TmbJSnKpouEHVwokHIVM/4HdpiwbBtFCCpniG5pYeTL8fDmoifoiGN4UJEUxOTdIQgaGohHBJKPIC2/Gu3WfOQF7SzBRoXd8UhuCD0f+Bc1QiDFDO4bX1Apd19ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773427705; c=relaxed/simple;
	bh=ZJYERfpm0n00oI7yjkATxc2bgro8TlTIhPLy6Dly0cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ibfkgcH3H9tEbl/FPFHcsdm4Ig7+g2bTs4U820KvTAiT3cY+TjxHN8VOjJ8n/Qg3GxY2JZFXykZkq7PF17bhGc73HA2PFf3Mhsmqg+GipJhFNfVKCSrZMqY+5io6oCcCjmxp5n5X7qSmd8YZGuYjn+PouF7p2AphR1b+nWiCeCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=QtsSuiUb; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 3E956240103
	for <linux-leds@vger.kernel.org>; Fri, 13 Mar 2026 19:48:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1773427702; bh=eBFgKTIDxbHJGxpffAhneVNIXveow5JR25/xttx6Mpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=QtsSuiUbK7YLe+zQlIL7aG0DtWdZg48c/Y7nIFzjNoWS14WlVOerprvZxaPzyYOWp
	 aog3jICFvYDILFyipyWs5ae0hsFDcEGMTK5h8ydj7m0Z08MPV24A/92vNelKi4aKfC
	 +ugVsOHYjbPXf70Fm9qoqxX67YwHL+6WyY1axqDL+A2o90Yx3RSuYV628rK62jzScA
	 A5t0rw/OhO76IDyIqUE6nf7Vdw0HEVGavXkTRpYO7DExsVYVOOqS5ppb1sXIJWKHlX
	 7cfMsvt3e+IvtkArr4tKeDWXgJnRDm2GSnYXACSjcE+Y3FTlzkZCNQHOCUSCReQLAl
	 akJLms1ZPCtpA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fXYQp3FWsz9rxD;
	Fri, 13 Mar 2026 19:48:18 +0100 (CET)
From: Markus Probst <markus.probst@posteo.de>
Date: Fri, 13 Mar 2026 18:48:21 +0000
Subject: [PATCH v3 2/7] rust: add basic mfd abstractions
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-synology_microp_initial-v3-2-16941debd8a0@posteo.de>
References: <20260313-synology_microp_initial-v3-0-16941debd8a0@posteo.de>
In-Reply-To: <20260313-synology_microp_initial-v3-0-16941debd8a0@posteo.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11227;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=ZJYERfpm0n00oI7yjkATxc2bgro8TlTIhPLy6Dly0cY=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBptFvhVHxRvAd2X1jRwJLTqL9yFTDiFWiGBDuWh
 dfAA82vbMuJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCabRb4RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9I7AxAAurRXFyFdxc1fz0RR4JNiXOO7sFMozFN
 JEJ3V51sQgVfnaL69LfGNznwhM05o0n3HOS+9YfQrovH9nXmeZsdlN5NDj/0ERgirta2mP6XEeg
 J+3aS5QfVW5RlAYSPL/4w2aGRolpDBiyyhexLeNwk6c9zD3TgWoMnW9U6kkejzIl/TG9ul6jQe5
 +4GHk+ipbZAD0m39yFpOqPOhRZ+Ab03QooCStymuRi9HhtIPYzivlvUsenVWTDOCQaX3KFxCeKd
 H8/FiiPTdj851e+iV2DEE608FI04YDu7CCPPYKDob+sG3rt6IIZtGdxddfQ+X0Bil/pDvxvbsHW
 c7J2qEoGCG/kScSIBrcvLuwBPQ9bAqTGMtj1Oh0b+UhLGkOFBTSP00LYT1dG1UeY6NvhKtPF1J3
 bBqe1D2veu5Ek3YVOZDNV+3jGA+hSSHxP4Xuv/qF0Jg5V3KYnPjC3KxMKbTTWrrRl5Yx5a00L0q
 TbbLS5Cv1cGxRd9msXFUvZhoiyUBkeK5pUvbhW4332DUT4mUfTfNt+eeXpPNbnWQxw6YFdGFtMw
 QCL96ZjK94Bsu39mYQnrBR3sjqvgRrS0vf9cF0lN1BkcyK1/wKlJLsM33JTIMRgOVv9UB9gCkBI
 O/GFJQXtSCjMVYjBYff7ZU5oBNySyTEecajcNGs5Q2ZLdPQkgnJ4=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7324-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:dkim,posteo.de:email,posteo.de:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 31B16288ECB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement the basic mfd rust abstractions required to register mfd
sub-devices, including:
- `mfd::Cell` - a safe wrapper for `struct mfd_cell`
- `mfd::CellAcpiMatch` - a safe wrapper for `struct mfd_cell_acpi_match`
- `const MFD_CELLS: Option<&'static [mfd::Cell]>` in each bus device,
  except auxiliary

The mfd sub-device registration will be done after a successful call to
probe in each bus device, except auxiliary. This guarantees that
`mfd_add_devices` will only be run at most once per device. It also
ensures that the sub-devices will be probed after the drvdata of the
device has been set.

In order to register mfd sub-devices for a device, the driver needs to
set `const MFD_CELLS` in their Driver trait implementation to Some.
A build_assert guarantees that this can only be set to Some, if
CONFIG_MFD_CORE is enabled.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 MAINTAINERS                     |   6 +++
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/i2c.rs              |   7 +++
 rust/kernel/lib.rs              |   1 +
 rust/kernel/mfd.rs              | 114 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/pci.rs              |   7 +++
 rust/kernel/platform.rs         |   7 +++
 rust/kernel/serdev.rs           |   6 +++
 rust/kernel/usb.rs              |   7 +++
 9 files changed, 156 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 749d63ca18fa..fa49e40836ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18082,6 +18082,12 @@ F:	drivers/mfd/
 F:	include/dt-bindings/mfd/
 F:	include/linux/mfd/
 
+MULTIFUNCTION DEVICES (MFD) [RUST]
+M:	Markus Probst <markus.probst@posteo.de>
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
+F:	rust/kernel/mfd.rs
+
 MULTIMEDIA CARD (MMC) ETC. OVER SPI
 S:	Orphan
 F:	drivers/mmc/host/mmc_spi.c
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index f597fe3352f5..b7c17d1d9ece 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -65,6 +65,7 @@
 #include <linux/jump_label.h>
 #include <linux/led-class-multicolor.h>
 #include <linux/mdio.h>
+#include <linux/mfd/core.h>
 #include <linux/mm.h>
 #include <linux/miscdevice.h>
 #include <linux/of_device.h>
diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index bb5b830f48c3..e733b651d878 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -14,6 +14,7 @@
     devres::Devres,
     driver,
     error::*,
+    mfd,
     of,
     prelude::*,
     types::{
@@ -167,6 +168,9 @@ extern "C" fn probe_callback(idev: *mut bindings::i2c_client) -> kernel::ffi::c_
             let data = T::probe(idev, info);
 
             idev.as_ref().set_drvdata(data)?;
+
+            idev.as_ref().mfd_add_devices(T::MFD_CELLS)?;
+
             Ok(0)
         })
     }
@@ -328,6 +332,9 @@ pub trait Driver: Send {
     /// The table of ACPI device ids supported by the driver.
     const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
 
+    /// The mfd cells for mfd devices.
+    const MFD_CELLS: Option<&'static [mfd::Cell]> = None;
+
     /// I2C driver probe.
     ///
     /// Called when a new i2c client is added or discovered.
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 311fdf984b87..bacc54ca6aea 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -114,6 +114,7 @@
 pub mod led;
 pub mod list;
 pub mod maple_tree;
+pub mod mfd;
 pub mod miscdevice;
 pub mod mm;
 pub mod module_param;
diff --git a/rust/kernel/mfd.rs b/rust/kernel/mfd.rs
new file mode 100644
index 000000000000..6c47d9211bf2
--- /dev/null
+++ b/rust/kernel/mfd.rs
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Abstractions for the mfd subsystem.
+//!
+//! C header: [`include/linux/mfd/core.h`](srctree/include/linux/mfd/core.h)
+
+use core::{mem::MaybeUninit, ptr};
+
+use crate::{
+    device::{
+        CoreInternal,
+        Device, //
+    },
+    error::to_result,
+    prelude::*, //
+};
+
+/// A mfd cell.
+///
+/// # Invariants
+///
+/// A [`Cell`] instance represents a valid `struct mfd_cell`.
+#[repr(transparent)]
+pub struct Cell(bindings::mfd_cell);
+
+impl Cell {
+    /// Creates a new mfd cell.
+    pub const fn new(name: &'static CStr) -> Self {
+        Self(bindings::mfd_cell {
+            name: name.as_ptr().cast::<u8>(),
+
+            // SAFETY: Always safe to call.
+            // This is the const equivalent to `bindings::mfd_cell::default()`.
+            ..unsafe { MaybeUninit::zeroed().assume_init() }
+        })
+    }
+
+    /// Sets `of_compatible` and optionally `of_reg` and `use_of_reg` on the mfd cell.
+    pub const fn of(self, compatible: &'static CStr, reg: Option<u64>) -> Self {
+        Self(bindings::mfd_cell {
+            of_compatible: compatible.as_ptr().cast::<u8>(),
+            // TODO: Use `unwrap_or` once stabilized in const fn.
+            of_reg: if let Some(reg) = reg { reg } else { 0 },
+            use_of_reg: reg.is_some(),
+
+            ..self.0
+        })
+    }
+
+    /// Sets `acpi_match` on the mfd cell.
+    pub const fn acpi(self, acpi_match: &'static CellAcpiMatch) -> Self {
+        Self(bindings::mfd_cell {
+            acpi_match: &raw const acpi_match.0,
+
+            ..self.0
+        })
+    }
+}
+
+/// A mfd cell acpi match entry.
+///
+/// # Invariants
+///
+/// A [`CellAcpiMatch`] instance represents a valid `struct mfd_cell_acpi_match`.
+#[repr(transparent)]
+pub struct CellAcpiMatch(bindings::mfd_cell_acpi_match);
+
+impl CellAcpiMatch {
+    /// Creates a new mfd cell acpi match entry, using a ACPI PNP ID.
+    pub const fn pnpid(pnpid: &'static CStr) -> Self {
+        Self(bindings::mfd_cell_acpi_match {
+            pnpid: pnpid.as_ptr().cast::<u8>(),
+            adr: 0,
+        })
+    }
+
+    /// Creates a new mfd cell acpi match entry, using a ACPI ADR.
+    pub const fn adr(adr: u64) -> Self {
+        Self(bindings::mfd_cell_acpi_match {
+            pnpid: ptr::null(),
+            adr,
+        })
+    }
+}
+
+impl Device<CoreInternal> {
+    /// Registers child mfd devices.
+    // Always inline to optimize out error path of `build_assert`.
+    #[inline(always)]
+    pub(crate) fn mfd_add_devices(&self, cells: Option<&'static [Cell]>) -> Result {
+        if let Some(cells) = cells {
+            build_assert!(cfg!(CONFIG_MFD_CORE));
+
+            // SAFETY:
+            // - `self.as_raw()` is guaranteed to be a pointer to a valid `device`.
+            // - `cells.as_ptr()` is a guaranteed to be a pointer to a valid `mfd_cell` array
+            //   with the length of `cells.len()`.
+            to_result(unsafe {
+                bindings::devm_mfd_add_devices(
+                    self.as_raw(),
+                    bindings::PLATFORM_DEVID_AUTO,
+                    // CAST: `Cell` is a transparent wrapper of `mfd_cell`.
+                    cells.as_ptr().cast::<bindings::mfd_cell>(),
+                    i32::try_from(cells.len())?,
+                    ptr::null_mut(),
+                    0,
+                    ptr::null_mut(),
+                )
+            })?;
+        }
+
+        Ok(())
+    }
+}
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index af74ddff6114..6c4cf6cf970b 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -17,6 +17,7 @@
         from_result,
         to_result, //
     },
+    mfd,
     prelude::*,
     str::CStr,
     types::Opaque,
@@ -116,6 +117,9 @@ extern "C" fn probe_callback(
             let data = T::probe(pdev, info);
 
             pdev.as_ref().set_drvdata(data)?;
+
+            pdev.as_ref().mfd_add_devices(T::MFD_CELLS)?;
+
             Ok(0)
         })
     }
@@ -303,6 +307,9 @@ pub trait Driver: Send {
     /// The table of device ids supported by the driver.
     const ID_TABLE: IdTable<Self::IdInfo>;
 
+    /// The mfd cells for mfd devices.
+    const MFD_CELLS: Option<&'static [mfd::Cell]> = None;
+
     /// PCI driver probe.
     ///
     /// Called when a new pci device is added or discovered. Implementers should
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 8917d4ee499f..e2bcf8ef093c 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -25,6 +25,7 @@
         self,
         IrqRequest, //
     },
+    mfd,
     of,
     prelude::*,
     types::Opaque,
@@ -104,6 +105,9 @@ extern "C" fn probe_callback(pdev: *mut bindings::platform_device) -> kernel::ff
             let data = T::probe(pdev, info);
 
             pdev.as_ref().set_drvdata(data)?;
+
+            pdev.as_ref().mfd_add_devices(T::MFD_CELLS)?;
+
             Ok(0)
         })
     }
@@ -218,6 +222,9 @@ pub trait Driver: Send {
     /// The table of ACPI device ids supported by the driver.
     const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
 
+    /// The mfd cells for mfd devices.
+    const MFD_CELLS: Option<&'static [mfd::Cell]> = None;
+
     /// Platform driver probe.
     ///
     /// Called when a new platform device is added or discovered.
diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
index d9fea4bd4439..6e702c734ded 100644
--- a/rust/kernel/serdev.rs
+++ b/rust/kernel/serdev.rs
@@ -14,6 +14,7 @@
         to_result,
         VTABLE_DEFAULT_ERROR, //
     },
+    mfd,
     of,
     prelude::*,
     sync::Completion,
@@ -180,6 +181,8 @@ extern "C" fn probe_callback(sdev: *mut bindings::serdev_device) -> kernel::ffi:
 
             private_data.probe_complete.complete_all();
 
+            sdev.as_ref().mfd_add_devices(T::MFD_CELLS)?;
+
             result.map(|()| 0)
         })
     }
@@ -339,6 +342,9 @@ pub trait Driver: Send {
     /// The table of ACPI device ids supported by the driver.
     const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
 
+    /// The mfd cells for mfd devices.
+    const MFD_CELLS: Option<&'static [mfd::Cell]> = None;
+
     /// Serial device bus device driver probe.
     ///
     /// Called when a new serial device bus device is added or discovered.
diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 0e1b9a88f4f1..a64ed6a530f1 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -17,6 +17,7 @@
         from_result,
         to_result, //
     },
+    mfd,
     prelude::*,
     types::{
         AlwaysRefCounted,
@@ -96,6 +97,9 @@ extern "C" fn probe_callback(
 
             let dev: &device::Device<device::CoreInternal> = intf.as_ref();
             dev.set_drvdata(data)?;
+
+            dev.mfd_add_devices(T::MFD_CELLS)?;
+
             Ok(0)
         })
     }
@@ -309,6 +313,9 @@ pub trait Driver {
     /// The table of device ids supported by the driver.
     const ID_TABLE: IdTable<Self::IdInfo>;
 
+    /// The mfd cells for mfd devices.
+    const MFD_CELLS: Option<&'static [mfd::Cell]> = None;
+
     /// USB driver probe.
     ///
     /// Called when a new USB interface is bound to this driver.

-- 
2.52.0


