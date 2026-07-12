Return-Path: <linux-leds+bounces-9046-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yvSZGWPOU2q0fAMAu9opvQ
	(envelope-from <linux-leds+bounces-9046-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 19:26:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF86C7457D9
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 19:26:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=quqwCnzS;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9046-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9046-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46956300FEE6
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 17:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504F7366042;
	Sun, 12 Jul 2026 17:26:47 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C7D35F5E4;
	Sun, 12 Jul 2026 17:26:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783877207; cv=none; b=AVJ9lBQiBe0JCzTqqkZ6YJNq5DnodGt+S/pp4AqSnOeuVY3wObbNd0QYcCtTJXc7pwSEG/LWN5G30a/IQxqosWvlwEHrZ5QipyjgSrkgCf2pkFcUnbg6+mdknrKRbKx1pzfkCeG/0+ZboDmVYkhdP4BtF6F1xhux3ceOJQZv4Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783877207; c=relaxed/simple;
	bh=Ccyj2aENOpt+T9FliU9tgevEOACqj+GpaoF+fe7Ht0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TsHi6crp4ssG0FSwLeAN1fVV4AfVBOThItNM/pIqQzuPMOG8nMc63kUKNS9uqSO7ZGAD8C63xwzshYjqd3jEtYPyU7npUMh2/OAo95Rb5b5/9A8eUihxATQyhYkBF/K0m521i+o79QNwu7/pVPBDytxp2SbykUQBxocQbhQNY/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=quqwCnzS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA9BCC2BCF7;
	Sun, 12 Jul 2026 17:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783877207;
	bh=Ccyj2aENOpt+T9FliU9tgevEOACqj+GpaoF+fe7Ht0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=quqwCnzSEnAm2cDl+g+GRXXx76mhv47AJeqB2BTuFWQG990eTjjH0plAg2YmKk7vG
	 zhR2GnX7r+dYJ3YMyOLIW1ZOmM6cOBrm3elELIgywR18ULNg4OMBi8JU7Sl7IYeeZr
	 gzHR1TDTpOAB4AaL2nORKCG74e4U3k30l8HLN/GlEHxAMZwJ02zuIl6E8OArH2Ole7
	 OEoJJcxBcdxBchy/LGLHWhJEGJczwn29XE0mz8gzP9NNKzRupz4o/ij6Jzk7IXQPqP
	 GU5dlK6pq6Uhmxv1PNtcRrPpHmjgUV92+PWbciWsnS5oG3y4576kzlKfPpKUB8/xW2
	 HKSpxs9DUyZUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC68BC44507;
	Sun, 12 Jul 2026 17:26:46 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Sun, 12 Jul 2026 19:26:45 +0200
Subject: [PATCH v22 3/3] rust: leds: add multicolor classdev abstractions
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-rust_leds-v22-3-055b0459a079@posteo.de>
References: <20260712-rust_leds-v22-0-055b0459a079@posteo.de>
In-Reply-To: <20260712-rust_leds-v22-0-055b0459a079@posteo.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Ira Weiny <iweiny@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=23237;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=uBtmZSt63tmvEP3wDfuvO+ow9daANnsD1u+QajstGPc=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqU85UrjtzIBSmBKYfNzsQYpx7GPt+PXWzq29Tt
 ePKq4zbSpmJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCalPOVBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9JXjhAApp+uj24T0QnCz/YfrPWlviXF4lDYkwW
 XWqmi5L+WpzBGrHa+5JZ55MrGvl1KqTiqlsq6CENbIX5VdX88f8wRuMdhMRHiIVOLR2VdyGcy22
 /fgwpSPoR+SDkzpiBNIyfQHEpmspSnEFlRUusUGNmaQe2an6ayfPtmsgqRgtzNegEA/OQAQBG2J
 dzicwdUiJ/Z6iXO4tbwRdGpvJ+lkPZVPvIAwHBxPWLpHjygaAF3IWzCTG50NXN4lGHQ6LXh+UZr
 NWFxOPXHeAmnmPUm40iu+Cytz4Ice61WCQesRtSbqMEAT9gHMWJmlLVEuR1nXFVlOMBcCy6z+Br
 +ljO9cVc1w28iABn0gebHc/J4cs5Tb/NgDLSyX7UkX6kJtUpKQ2Zl1mI1qVmzIfkcVtdQgO1AbV
 F/+38S6JBYK0jWarGAA+u97HpcQTIXnpDPIpOS1AtC7svyleDdgVrLNfXQMnJxmB+88myB0ZOUD
 VxltUnIsnfDdWL3r/B97rtOp2qRZ0WNMoPHJw7hRNvGtcD07UL5Sy79FvzJrlLAsdfQQcFJ+jBF
 6pKupH1sCoqkCySbY7vHc2a3SnNretd3vVEqaLdrVM4XPaT0EHgVO8erTk4gEGUGqx/KY+Dqy9G
 AgU5gzLoISr+Ey9JHqd7IA2RWOghYIGQ9FVJ/fGGcoGQhsxXmtmc=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
X-Endpoint-Received: by B4 Relay for markus.probst@posteo.de/default with
 auth_id=680
X-Original-From: Markus Probst <markus.probst@posteo.de>
Reply-To: markus.probst@posteo.de
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-9046-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:leon@kernel.org,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rafael@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:iweiny@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:markus.probst@posteo.de,m:alexgaynor@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[markus.probst@posteo.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,posteo.de:replyto,posteo.de:mid,posteo.de:email,vger.kernel.org:from_smtp,self.channel:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF86C7457D9

From: Markus Probst <markus.probst@posteo.de>

Implement the abstractions needed for multicolor led class devices,
including:

* `led::MultiColor` - the led mode implementation

* `MultiColorSubLed` - a safe wrapper arround `mc_subled`

* `led::MultiColorDevice` - a safe wrapper around `led_classdev_mc`

* `led::DeviceBuilder::build_multicolor` - a function to register a new
  multicolor led class device

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/led.rs              |  34 ++-
 rust/kernel/led/multicolor.rs   | 460 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 494 insertions(+), 1 deletion(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 1124785e210b..821f539e597e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -68,6 +68,7 @@
 #include <linux/iosys-map.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/mdio.h>
 #include <linux/mm.h>
 #include <linux/miscdevice.h>
diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
index ec4f178a120f..1cfb4ca41307 100644
--- a/rust/kernel/led.rs
+++ b/rust/kernel/led.rs
@@ -29,8 +29,16 @@
     types::Opaque, //
 };
 
+#[cfg(CONFIG_LEDS_CLASS_MULTICOLOR)]
+mod multicolor;
 mod normal;
 
+#[cfg(CONFIG_LEDS_CLASS_MULTICOLOR)]
+pub use multicolor::{
+    MultiColor,
+    MultiColorDevice,
+    MultiColorSubLed, //
+};
 pub use normal::{
     Device,
     Normal, //
@@ -254,7 +262,24 @@ pub enum Color {
     Violet = bindings::LED_COLOR_ID_VIOLET,
     Yellow = bindings::LED_COLOR_ID_YELLOW,
     Ir = bindings::LED_COLOR_ID_IR,
+    #[cfg_attr(
+        CONFIG_LEDS_CLASS_MULTICOLOR,
+        doc = "Use this color for a [`MultiColor`] led."
+    )]
+    #[cfg_attr(
+        not(CONFIG_LEDS_CLASS_MULTICOLOR),
+        doc = "Use this color for a `MultiColor` led."
+    )]
+    /// If the led supports RGB, use [`Color::Rgb`] instead.
     Multi = bindings::LED_COLOR_ID_MULTI,
+    #[cfg_attr(
+        CONFIG_LEDS_CLASS_MULTICOLOR,
+        doc = "Use this color for a [`MultiColor`] led with rgb support."
+    )]
+    #[cfg_attr(
+        not(CONFIG_LEDS_CLASS_MULTICOLOR),
+        doc = "Use this color for a `MultiColor` led with rgb support."
+    )]
     Rgb = bindings::LED_COLOR_ID_RGB,
     Purple = bindings::LED_COLOR_ID_PURPLE,
     Orange = bindings::LED_COLOR_ID_ORANGE,
@@ -295,7 +320,14 @@ fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
 ///
 /// Each led mode has its own led class device type with different capabilities.
 ///
-/// See [`Normal`].
+#[cfg_attr(
+    CONFIG_LEDS_CLASS_MULTICOLOR,
+    doc = "See [`Normal`] and [`MultiColor`]."
+)]
+#[cfg_attr(
+    not(CONFIG_LEDS_CLASS_MULTICOLOR),
+    doc = "See [`Normal`] and `MultiColor`."
+)]
 pub trait Mode: private::Sealed {
     /// The class device for the led mode.
     type Device<'bound, T: LedOps<Mode = Self> + 'bound>;
diff --git a/rust/kernel/led/multicolor.rs b/rust/kernel/led/multicolor.rs
new file mode 100644
index 000000000000..82fe96fd5273
--- /dev/null
+++ b/rust/kernel/led/multicolor.rs
@@ -0,0 +1,460 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Led mode for the `struct led_classdev_mc`.
+//!
+//! C header: [`include/linux/led-class-multicolor.h`](srctree/include/linux/led-class-multicolor.h)
+
+use core::{
+    cell::UnsafeCell,
+    num::NonZero,
+    ptr, //
+};
+
+use crate::types::ScopeGuard;
+
+use super::*;
+
+/// The led mode for the `struct led_classdev_mc`. Leds with this mode can have multiple colors.
+pub enum MultiColor {}
+impl Mode for MultiColor {
+    type Device<'bound, T: LedOps<Mode = Self> + 'bound> = MultiColorDevice<'bound, T>;
+}
+impl private::Sealed for MultiColor {}
+
+/// The multicolor sub led info representation.
+///
+/// This structure represents the Rust abstraction for a C `struct mc_subled`.
+#[repr(C)]
+#[derive(Debug)]
+#[non_exhaustive]
+pub struct MultiColorSubLed {
+    /// The color of the sub led
+    pub color: Color,
+    brightness: UnsafeCell<u32>,
+    intensity: UnsafeCell<u32>,
+    /// The maximum supported intensity value.
+    ///
+    /// If None the maximum intensity equals to [`LedOps::MAX_BRIGHTNESS`].
+    pub max_intensity: Option<NonZero<u32>>,
+    /// Arbitrary data for the driver to store.
+    pub channel: u32,
+}
+
+// SAFETY: `MultiColorSubLed` can be shared among threads.
+unsafe impl Sync for MultiColorSubLed {}
+
+impl Clone for MultiColorSubLed {
+    fn clone(&self) -> Self {
+        Self {
+            color: self.color,
+            brightness: self.brightness().into(),
+            intensity: self.intensity().into(),
+            max_intensity: self.max_intensity,
+            channel: self.channel,
+        }
+    }
+}
+
+// We directly pass a reference to the `subled_info` field in `led_classdev_mc` to the driver via
+// `Device::subleds()`.
+// We need safeguards to ensure `MultiColorSubLed` and `mc_subled` stay identical.
+const _: () = {
+    use core::mem::offset_of;
+
+    const fn assert_same_type<T>(_: &T, _: &T) {}
+
+    let rust_zeroed = MultiColorSubLed {
+        color: Color::White,
+        brightness: UnsafeCell::new(0),
+        intensity: UnsafeCell::new(0),
+        max_intensity: None,
+        channel: 0,
+    };
+    let c_zeroed = bindings::mc_subled {
+        color_index: 0,
+        brightness: 0,
+        intensity: 0,
+        max_intensity: 0,
+        channel: 0,
+    };
+
+    assert!(offset_of!(MultiColorSubLed, color) == offset_of!(bindings::mc_subled, color_index));
+    assert!(
+        offset_of!(MultiColorSubLed, brightness) == offset_of!(bindings::mc_subled, brightness)
+    );
+    assert!(offset_of!(MultiColorSubLed, intensity) == offset_of!(bindings::mc_subled, intensity));
+    assert!(
+        offset_of!(MultiColorSubLed, max_intensity)
+            == offset_of!(bindings::mc_subled, max_intensity)
+    );
+    assert!(offset_of!(MultiColorSubLed, channel) == offset_of!(bindings::mc_subled, channel));
+
+    assert_same_type(&0u32, &c_zeroed.color_index);
+    assert_same_type(&rust_zeroed.brightness.into_inner(), &c_zeroed.brightness);
+    assert_same_type(&rust_zeroed.intensity.into_inner(), &c_zeroed.intensity);
+    assert!(size_of_val(&rust_zeroed.max_intensity) == size_of_val(&c_zeroed.max_intensity));
+    assert_same_type(&rust_zeroed.channel, &c_zeroed.channel);
+
+    assert!(size_of::<MultiColorSubLed>() == size_of::<bindings::mc_subled>());
+};
+
+impl MultiColorSubLed {
+    /// Create a new multicolor sub led info.
+    #[inline]
+    pub const fn new(color: Color) -> Self {
+        Self {
+            color,
+            brightness: UnsafeCell::new(0),
+            intensity: UnsafeCell::new(0),
+            max_intensity: None,
+            channel: 0,
+        }
+    }
+
+    /// Set arbitrary data for the driver.
+    #[inline]
+    pub const fn channel(mut self, channel: u32) -> Self {
+        self.channel = channel;
+        self
+    }
+
+    /// Set the initial intensity of the subled.
+    #[inline]
+    pub const fn initial_intensity(mut self, intensity: u32) -> Self {
+        self.intensity = UnsafeCell::new(intensity);
+        self
+    }
+
+    /// Set the maximum supported intensity of the subled.
+    #[inline]
+    pub const fn max_intensity(mut self, max_intensity: NonZero<u32>) -> Self {
+        self.max_intensity = Some(max_intensity);
+        self
+    }
+
+    /// The intensity of the sub led.
+    #[inline]
+    pub const fn intensity(&self) -> u32 {
+        // SAFETY:
+        // - `self.intensity.get()` is a valid pointer to `u32`.
+        // - We don't have exclusive or immutable access to `self.intensity`,
+        //   but the alignment should prevent "load tearing".
+        unsafe { *self.intensity.get() }
+    }
+
+    /// The brightness of the sub led.
+    #[inline]
+    pub const fn brightness(&self) -> u32 {
+        // SAFETY:
+        // - `self.brightness.get()` is a valid pointer to `u32`.
+        // - We don't have exclusive or immutable access to `self.brightness`,
+        //   but the alignment should prevent "load tearing".
+        unsafe { *self.brightness.get() }
+    }
+}
+
+/// The multicolor led class device representation.
+///
+/// This structure represents the Rust abstraction for a multicolor led class device.
+#[pin_data(PinnedDrop)]
+pub struct MultiColorDevice<'bound, T: LedOps<Mode = MultiColor> + 'bound> {
+    #[pin]
+    ops: T,
+    #[pin]
+    classdev: Opaque<bindings::led_classdev_mc>,
+    _p: PhantomData<&'bound ()>,
+}
+
+impl<'init, S: DeviceBuilderState> DeviceBuilder<'init, S> {
+    /// Registers a new [`MulticolorDevice`].
+    pub fn build_multicolor<'bound: 'init, T: LedOps<Mode = MultiColor> + 'bound>(
+        self,
+        parent: &'bound T::Bus,
+        ops: impl PinInit<T, Error> + 'init,
+        subleds: &'init [MultiColorSubLed],
+    ) -> impl PinInit<MultiColorDevice<'bound, T>, Error> + 'init {
+        const_assert!(T::MAX_BRIGHTNESS <= i32::MAX.unsigned_abs() || !T::HAS_BRIGHTNESS_GET);
+
+        try_pin_init!(MultiColorDevice {
+            ops <- ops,
+            classdev <- Opaque::try_ffi_init(|ptr: *mut bindings::led_classdev_mc| {
+                let mut colors = [false; bindings::LED_COLOR_ID_MAX as usize];
+                for subled in subleds {
+                    if colors[subled.color as usize] {
+                        dev_err!(parent.as_ref(), "duplicate color in multicolor led\n");
+                        return Err(EINVAL);
+                    }
+                    colors[subled.color as usize] = true;
+                }
+                let subleds_box = KBox::pin_slice(
+                    |index| Ok::<_, Error>(subleds[index].clone()),
+                    subleds.len(),
+                    GFP_KERNEL,
+                )?;
+                let subleds_box_raw = KBox::into_raw(Pin::into_inner(subleds_box));
+
+                let subled_guard = ScopeGuard::new(|| {
+                    // SAFETY: `subleds_box_raw` is guaranteed to be a valid pointer to
+                    // `[MultiColorSubLed]`.
+                    drop(unsafe { <KBox<[MultiColorSubLed]>>::from_raw(subleds_box_raw) });
+                });
+
+                // SAFETY: `try_ffi_init` guarantees that `ptr` is valid for write.
+                // `led_classdev_mc` gets fully initialized in-place by
+                // `led_classdev_multicolor_register_ext` including `mutex` and `list_head`.
+                unsafe {
+                    ptr.write(bindings::led_classdev_mc {
+                        led_cdev: bindings::led_classdev {
+                            brightness_set: (!T::BLOCKING)
+                                .then_some(Adapter::<T>::brightness_set_callback),
+                            brightness_set_blocking: T::BLOCKING
+                                .then_some(Adapter::<T>::brightness_set_blocking_callback),
+                            brightness_get: T::HAS_BRIGHTNESS_GET
+                                .then_some(Adapter::<T>::brightness_get_callback),
+                            blink_set: T::HAS_BLINK_SET.then_some(Adapter::<T>::blink_set_callback),
+                            max_brightness: T::MAX_BRIGHTNESS,
+                            brightness: self.initial_brightness,
+                            color: self.color as u32,
+                            name: self.name.map_or(core::ptr::null(), CStrExt::as_char_ptr),
+                            ..bindings::led_classdev::default()
+                        },
+                        num_colors: u32::try_from(subleds_box_raw.len())?,
+                        // CAST: The safeguards in the const block ensure that
+                        // `MultiColorSubLed` has an identical layout to `mc_subled`.
+                        subled_info: subleds_box_raw.cast::<bindings::mc_subled>(),
+                    })
+                };
+
+                let mut init_data = bindings::led_init_data {
+                    fwnode: self
+                        .fwnode
+                        .as_ref()
+                        .map_or(core::ptr::null_mut(), |fwnode| fwnode.as_raw()),
+                    default_label: core::ptr::null(),
+                    devicename: self
+                        .devicename
+                        .map_or(core::ptr::null(), CStrExt::as_char_ptr),
+                    devname_mandatory: self.devname_mandatory,
+                };
+
+                // SAFETY:
+                // - `parent.as_ref().as_raw()` is guaranteed to be a pointer to a valid
+                //    `device`.
+                // - `ptr` is guaranteed to be a pointer to an initialized `led_classdev_mc`.
+                to_result(unsafe {
+                    bindings::led_classdev_multicolor_register_ext(
+                        parent.as_ref().as_raw(),
+                        ptr,
+                        if self.name.is_none() {
+                            &raw mut init_data
+                        } else {
+                            core::ptr::null_mut()
+                        },
+                    )
+                })?;
+
+                subled_guard.dismiss();
+
+                core::mem::forget(self.fwnode); // keep the reference count incremented
+
+                Ok::<_, Error>(())
+            }),
+            _p: PhantomData,
+        })
+    }
+}
+
+impl<'bound, T: LedOps<Mode = MultiColor> + 'bound> MultiColorDevice<'bound, T> {
+    /// # Safety
+    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
+    /// `led::MultiColorDevice`.
+    #[inline]
+    unsafe fn from_raw<'a>(led_cdev: *mut bindings::led_classdev) -> &'a Self {
+        // SAFETY: The function's contract guarantees that `led_cdev` points to a `led_classdev`
+        // field embedded within a valid `led::MultiColorDevice`. `container_of!` can therefore
+        // safely calculate the address of the containing struct.
+        let led_mc_cdev = unsafe { container_of!(led_cdev, bindings::led_classdev_mc, led_cdev) };
+
+        // SAFETY: It is guaranteed that `led_mc_cdev` points to a `led_classdev_mc`
+        // field embedded within a valid `led::MultiColorDevice`. `container_of!` can therefore
+        // safely calculate the address of the containing struct.
+        unsafe { &*container_of!(Opaque::cast_from(led_mc_cdev), Self, classdev) }
+    }
+
+    #[inline]
+    fn parent(&self) -> &'bound device::Device<Bound> {
+        // SAFETY: `self.classdev.get()` is guaranteed to be a valid pointer to `led_classdev_mc`.
+        unsafe { device::Device::from_raw((*(*self.classdev.get()).led_cdev.dev).parent) }
+    }
+
+    /// Returns the subleds passed to [`Device::new_multicolor`].
+    #[inline]
+    pub fn subleds(&self) -> &[MultiColorSubLed] {
+        // SAFETY: The existence of `self` guarantees that `self.classdev.get()` is a pointer to a
+        // valid `led_classdev_mc`.
+        let raw = unsafe { &*self.classdev.get() };
+        // SAFETY: `raw.subled_info` is a valid pointer to `mc_subled[num_colors]`.
+        // CAST: The safeguards in the const block ensure that `MultiColorSubLed` has an identical
+        // layout to `mc_subled`.
+        unsafe {
+            core::slice::from_raw_parts(
+                raw.subled_info.cast::<MultiColorSubLed>(),
+                // CAST: It is guaranteed that `num_colors` fits into an `usize`.
+                raw.num_colors as usize,
+            )
+        }
+    }
+}
+
+// SAFETY: A `led::MultiColorDevice` can be unregistered from any thread.
+unsafe impl<'bound, T: LedOps<Mode = MultiColor> + 'bound + Send> Send
+    for MultiColorDevice<'bound, T>
+{
+}
+
+// SAFETY: `led::MultiColorDevice` can be shared among threads because all methods of `led::Device`
+// are thread safe.
+unsafe impl<'bound, T: LedOps<Mode = MultiColor> + 'bound + Sync> Sync
+    for MultiColorDevice<'bound, T>
+{
+}
+
+struct Adapter<T: LedOps<Mode = MultiColor>> {
+    _p: PhantomData<T>,
+}
+
+impl<T: LedOps<Mode = MultiColor>> Adapter<T> {
+    /// # Safety
+    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
+    /// `led::MultiColorDevice`.
+    /// This function is called on setting the brightness of a led.
+    unsafe extern "C" fn brightness_set_callback(
+        led_cdev: *mut bindings::led_classdev,
+        brightness: u32,
+    ) {
+        // SAFETY: The function's contract guarantees that `led_cdev` is a valid pointer to a
+        // `led_classdev` embedded within a `led::MultiColorDevice`.
+        let classdev = unsafe { MultiColorDevice::<T>::from_raw(led_cdev) };
+        // SAFETY: `classdev.parent()` is guaranteed to be contained in `T::Bus`.
+        let parent = unsafe { T::Bus::from_device(classdev.parent()) };
+
+        // SAFETY: `classdev.classdev.get()` is guaranteed to be a pointer to a valid
+        // `led_classdev_mc`.
+        unsafe { bindings::led_mc_calc_color_components(classdev.classdev.get(), brightness) };
+
+        let _ = classdev.ops.brightness_set(parent, classdev, brightness);
+    }
+
+    /// # Safety
+    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
+    /// `led::MultiColorDevice`.
+    /// This function is called on setting the brightness of a led immediately.
+    unsafe extern "C" fn brightness_set_blocking_callback(
+        led_cdev: *mut bindings::led_classdev,
+        brightness: u32,
+    ) -> i32 {
+        from_result(|| {
+            // SAFETY: The function's contract guarantees that `led_cdev` is a valid pointer to a
+            // `led_classdev` embedded within a `led::MultiColorDevice`.
+            let classdev = unsafe { MultiColorDevice::<T>::from_raw(led_cdev) };
+            // SAFETY: `classdev.parent()` is guaranteed to be contained in `T::Bus`.
+            let parent = unsafe { T::Bus::from_device(classdev.parent()) };
+
+            // SAFETY: `classdev.classdev.get()` is guaranteed to be a pointer to a valid
+            // `led_classdev_mc`.
+            unsafe { bindings::led_mc_calc_color_components(classdev.classdev.get(), brightness) };
+
+            classdev.ops.brightness_set(parent, classdev, brightness)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
+    /// `led::MultiColorDevice`.
+    /// This function is called on getting the brightness of a led.
+    unsafe extern "C" fn brightness_get_callback(led_cdev: *mut bindings::led_classdev) -> u32 {
+        // SAFETY: The function's contract guarantees that `led_cdev` is a valid pointer to a
+        // `led_classdev` embedded within a `led::MultiColorDevice`.
+        let classdev = unsafe { MultiColorDevice::<T>::from_raw(led_cdev) };
+        // SAFETY: `classdev.parent()` is guaranteed to be contained in `T::Bus`.
+        let parent = unsafe { T::Bus::from_device(classdev.parent()) };
+
+        // CAST: Resulting value will be casted back to i32 in the led subsystem.
+        from_result(|| {
+            classdev
+                .ops
+                .brightness_get(parent, classdev)
+                .inspect(|val| debug_assert!(*val <= T::MAX_BRIGHTNESS))
+                .and_then(|val| Ok(i32::try_from(val)?))
+        }) as u32
+    }
+
+    /// # Safety
+    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
+    /// `led::MultiColorDevice`.
+    /// `delay_on` and `delay_off` must be valid pointers to `usize` and have
+    /// exclusive access for the period of this function.
+    /// This function is called on enabling hardware accelerated blinking.
+    unsafe extern "C" fn blink_set_callback(
+        led_cdev: *mut bindings::led_classdev,
+        delay_on: *mut usize,
+        delay_off: *mut usize,
+    ) -> i32 {
+        from_result(|| {
+            // SAFETY: The function's contract guarantees that `led_cdev` is a valid pointer to a
+            // `led_classdev` embedded within a `led::MultiColorDevice`.
+            let classdev = unsafe { MultiColorDevice::<T>::from_raw(led_cdev) };
+            // SAFETY: `classdev.parent()` is guaranteed to be contained in `T::Bus`.
+            let parent = unsafe { T::Bus::from_device(classdev.parent()) };
+
+            classdev.ops.blink_set(
+                parent,
+                classdev,
+                // SAFETY: The function's contract guarantees that `delay_on` points to a `usize`
+                // and is exclusive for the period of this function.
+                unsafe { &mut *delay_on },
+                // SAFETY: The function's contract guarantees that `delay_off` points to a `usize`
+                // and is exclusive for the period of this function.
+                unsafe { &mut *delay_off },
+            )?;
+            Ok(0)
+        })
+    }
+}
+
+#[pinned_drop]
+impl<'bound, T: LedOps<Mode = MultiColor> + 'bound> PinnedDrop for MultiColorDevice<'bound, T> {
+    fn drop(self: Pin<&mut Self>) {
+        let raw = self.classdev.get();
+        // SAFETY: The existence of `self` guarantees that `self.classdev.get()` is a pointer to a
+        // valid `led_classdev_mc`.
+        let dev: &device::Device = unsafe { device::Device::from_raw((*raw).led_cdev.dev) };
+
+        let _fwnode = dev
+            .fwnode()
+            // SAFETY: the reference count of `fwnode` has previously been
+            // incremented in `led::DeviceBuilder::build_multicolor`.
+            .map(|fwnode| unsafe { ARef::from_raw(NonNull::from(fwnode)) });
+
+        // SAFETY: The existence of `self` guarantees that `self.classdev` has previously been
+        // successfully registered with `led_classdev_multicolor_register_ext`.
+        unsafe { bindings::led_classdev_multicolor_unregister(raw) };
+
+        // SAFETY: `raw` is guaranteed to be a valid pointer to `led_classdev_mc`.
+        let led_cdev = unsafe { &*raw };
+
+        // SAFETY: `led_cdev.subled_info` is guaranteed to be a valid pointer to
+        // `[MultiColorSubLed]` with length of `led_cdev.num_colors`.
+        // See `led::DeviceBuilder::build_multicolor`.
+        drop(unsafe {
+            KBox::from_raw(ptr::slice_from_raw_parts_mut(
+                led_cdev.subled_info.cast::<MultiColorSubLed>(),
+                // CAST: `num_colors` was originally converted from a `usize` in
+                // `DeviceBuilder::build_multicolor`. Thus it is guaranteed that
+                // `num_colors` fits into an usize.
+                led_cdev.num_colors as usize,
+            ))
+        });
+    }
+}

-- 
2.54.0



