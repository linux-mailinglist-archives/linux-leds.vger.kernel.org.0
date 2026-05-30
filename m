Return-Path: <linux-leds+bounces-8394-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJRZFMFpG2pICAkAu9opvQ
	(envelope-from <linux-leds+bounces-8394-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 31 May 2026 00:50:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFEB613B33
	for <lists+linux-leds@lfdr.de>; Sun, 31 May 2026 00:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9436B3043448
	for <lists+linux-leds@lfdr.de>; Sat, 30 May 2026 22:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233D7379C49;
	Sat, 30 May 2026 22:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="o37n4nrz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5846C379974
	for <linux-leds@vger.kernel.org>; Sat, 30 May 2026 22:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780181401; cv=none; b=StPrGVOCFEpXpT/4xmM2S2iqTdImI+OKC8olvHvjNLHFgvjz8kPtl2OOeRsjbSpdhUCzOCrCce5ER2R00j2VeW3WSdr7ZUbm8FWeIgdjllMcGFj6KBmEgcwwnB5M6zk9UDwb/qSMXpzkTAMFIh9/tqKQZhO/udSKpKwpRuUBkLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780181401; c=relaxed/simple;
	bh=KRFkPz7OX2mT+wcUbMkbF+m3ZtwkNHQRdK9vxmhAW/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGar/1Gb7Os/xWVKnSeCyWbHVo+A1EZQ5Qqtvab7XSCfRXBklmc8bbCeIVbCTQd48SGVzuoiTY058L0HlEKwQErKCUOgJSJ4uFD76eZhGP2m+8mDNvs/D3CfSy0pk1diMkU5xLZX9XyD/znh7AnVLfBqlxSn0sSC4eiTWoFZU9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=o37n4nrz; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id D9023240104
	for <linux-leds@vger.kernel.org>; Sun, 31 May 2026 00:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1780181397; bh=MB084IU5c3o2gnWXS2CDP/diPbGDyqeyqmcsCrG+Mio=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=o37n4nrzxv+lFDGZ+XGf4sPISb/dPWeJlxgsTWTVWoMP5b+otV+B5zi4ahr88RN3P
	 G5oY70Wg07gm7IQWjQw0Lv0HQcyQoN4eKpDjGxYTHJGdIIROZnzc648EwX60w+I/3J
	 1mOEwjxl9QsbICjqV/xy9XWHoZTAhOgZ/aYTJQ1dITqReNOLIoJTKsgAkOcfYmT2DY
	 hQKAyLk95lOc4CVQA+rN6r9NBttoP5U6WMq+CVkin2PxTPb0GjYJ+XFnM8UWFt05OL
	 vZK+eZL9+wM2ZMLfJuwGjkFjwfR3Fv6aD518r+zKQSxm8HCk+2iGlNJPiKPJ8WXQPi
	 Wj747bH/ZIyVQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gSb5b3w1sz6ty3;
	Sun, 31 May 2026 00:49:55 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Date: Sat, 30 May 2026 22:49:56 +0000
Subject: [PATCH v18 2/3] rust: leds: add Mode trait
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-rust_leds-v18-2-d07102ba5170@posteo.de>
References: <20260531-rust_leds-v18-0-d07102ba5170@posteo.de>
In-Reply-To: <20260531-rust_leds-v18-0-d07102ba5170@posteo.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=5605;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=KRFkPz7OX2mT+wcUbMkbF+m3ZtwkNHQRdK9vxmhAW/c=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqG2mP/b3Ny/M0SHOPIC416di7RbuOfVI5iE8km
 1DF1rD9/uKJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCahtpjxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9L/IQ/8DE3CJ2nH+j/mysRstc/dxH8mbYVtVIJ
 9+w9V4g8lU4RlPMXQlCOjDTVkAABEVoDnvlfEGXqucgAjbQ6+VpubPk88nEFc7zkYaW3BcAN6vq
 kI6FkSVS0G7tqFLr2Wzq4q18uIKIreKtqVXVXhZwZzzqCqEH/5/tzCSPc9gn4xjps8TEuIa6wxv
 lZF4vOniWo5caaohCW1iojFjAuZGyblmjWP8o0VdiA92MDUSsM+3NF/dvXWUYXTlf5EnDkPLKBd
 C0LGF+N+tDqkYjcEQ/51JxmZTxEX69oEDUpCgN+t0O/oLorb3sejUKK5QDFMRlqMMuAA+br+jDR
 EQWqjXzxm0+pNojuCs94kd1TiVUST9ka+b3dlThjiWI9kri4IXZy6Y3g+W5ANtjnQB8HkaPzGIS
 c0qckOuX3NidApeyyjEuLXt72gvBMios6H4qcFcRJ/1deUFw5dB2cp0JS3wQFVReXFH0bLFBJKd
 EcY8lR7FqzTwYK6aDGXzf8wpQBIVlpzMoc9Dy5VbJ+Ped3nWJDXl7ZnUNFbRE8Rgb66VYFjFf5B
 UZ8mp6ZFMpK68H9tCUYdgfFqRd88TPXbFmuXOAzODgu1DOob53IKGgn++Q3o22+v7ILhXkEL5+V
 Z3/FpNw4+6Y/yeTua51HhqECFWM7erIGYV63q2ADohfBjpcUmkjw=
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8394-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,posteo.de:email,posteo.de:mid,posteo.de:dkim]
X-Rspamd-Queue-Id: AAFEB613B33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the `led::Mode` trait to allow for other types of led class devices
in `led::LedOps`.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 rust/kernel/led.rs        | 27 +++++++++++++++++++++++----
 rust/kernel/led/normal.rs | 22 +++++++++++++++-------
 2 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
index c92d99d68497..6ee337008db7 100644
--- a/rust/kernel/led.rs
+++ b/rust/kernel/led.rs
@@ -32,7 +32,10 @@
 
 mod normal;
 
-pub use normal::Device;
+pub use normal::{
+    Device,
+    Normal, //
+};
 
 /// The name of the led is determined by the driver.
 pub enum Named {}
@@ -161,6 +164,7 @@ pub fn name(self, name: &'a CStr) -> Self {
 /// #[vtable]
 /// impl led::LedOps for MyLedOps {
 ///     type Bus = platform::Device<device::Bound>;
+///     type Mode = led::Normal;
 ///     const BLOCKING: bool = false;
 ///     const MAX_BRIGHTNESS: u32 = 255;
 ///
@@ -182,6 +186,11 @@ pub trait LedOps: Send + Sync + Sized {
     #[allow(private_bounds)]
     type Bus: AsBusDevice<Bound>;
 
+    /// The led mode to use.
+    ///
+    /// See [`Mode`].
+    type Mode: Mode;
+
     /// If set true, [`LedOps::brightness_set`] and [`LedOps::blink_set`] must perform the
     /// operation immediately. If set false, they must not sleep.
     const BLOCKING: bool;
@@ -194,7 +203,7 @@ pub trait LedOps: Send + Sync + Sized {
     fn brightness_set<'bound>(
         &self,
         dev: &'bound Self::Bus,
-        classdev: &Device<'bound, Self>,
+        classdev: &<Self::Mode as Mode>::Device<'bound, Self>,
         brightness: u32,
     ) -> Result<()>;
 
@@ -202,7 +211,7 @@ fn brightness_set<'bound>(
     fn brightness_get<'bound>(
         &self,
         dev: &'bound Self::Bus,
-        classdev: &Device<'bound, Self>,
+        classdev: &<Self::Mode as Mode>::Device<'bound, Self>,
     ) -> Result<u32> {
         let _ = (dev, classdev);
         build_error!(VTABLE_DEFAULT_ERROR)
@@ -219,7 +228,7 @@ fn brightness_get<'bound>(
     fn blink_set<'bound>(
         &self,
         dev: &'bound Self::Bus,
-        classdev: &Device<'bound, Self>,
+        classdev: &<Self::Mode as Mode>::Device<'bound, Self>,
         delay_on: &mut usize,
         delay_off: &mut usize,
     ) -> Result<()> {
@@ -283,6 +292,16 @@ fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
     }
 }
 
+/// The led mode.
+///
+/// Each led mode has its own led class device type with different capabilities.
+///
+/// See [`Normal`].
+pub trait Mode: private::Sealed {
+    /// The class device for the led mode.
+    type Device<'bound, T: LedOps<Mode = Self> + 'bound>;
+}
+
 mod private {
     pub trait Sealed {}
 }
diff --git a/rust/kernel/led/normal.rs b/rust/kernel/led/normal.rs
index 09244133f14c..2ffe65bb9dc2 100644
--- a/rust/kernel/led/normal.rs
+++ b/rust/kernel/led/normal.rs
@@ -6,11 +6,19 @@
 
 use super::*;
 
+/// The led mode for the `struct led_classdev`. Leds with this mode can only have a fixed color.
+pub enum Normal {}
+
+impl Mode for Normal {
+    type Device<'bound, T: LedOps<Mode = Self> + 'bound> = Device<'bound, T>;
+}
+impl private::Sealed for Normal {}
+
 /// The led class device representation.
 ///
 /// This structure represents the Rust abstraction for a led class device.
 #[pin_data(PinnedDrop)]
-pub struct Device<'bound, T: LedOps + 'bound> {
+pub struct Device<'bound, T: LedOps<Mode = Normal> + 'bound> {
     #[pin]
     ops: T,
     #[pin]
@@ -20,7 +28,7 @@ pub struct Device<'bound, T: LedOps + 'bound> {
 
 impl<'a, S: DeviceBuilderState> DeviceBuilder<'a, S> {
     /// Registers a new [`Device`].
-    pub fn build<'bound: 'a, T: LedOps + 'bound>(
+    pub fn build<'bound: 'a, T: LedOps<Mode = Normal> + 'bound>(
         self,
         parent: &'bound T::Bus,
         ops: impl PinInit<T, Error> + 'a,
@@ -87,7 +95,7 @@ pub fn build<'bound: 'a, T: LedOps + 'bound>(
     }
 }
 
-impl<'bound, T: LedOps + 'bound> Device<'bound, T> {
+impl<'bound, T: LedOps<Mode = Normal> + 'bound> Device<'bound, T> {
     /// # Safety
     /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
     /// `led::Device`.
@@ -106,17 +114,17 @@ fn parent(&self) -> &'bound device::Device<Bound> {
 }
 
 // SAFETY: A `led::Device` can be unregistered from any thread.
-unsafe impl<'bound, T: LedOps + 'bound + Send> Send for Device<'bound, T> {}
+unsafe impl<'bound, T: LedOps<Mode = Normal> + 'bound + Send> Send for Device<'bound, T> {}
 
 // SAFETY: `led::Device` can be shared among threads because all methods of `led::Device`
 // are thread safe.
-unsafe impl<'bound, T: LedOps + 'bound + Sync> Sync for Device<'bound, T> {}
+unsafe impl<'bound, T: LedOps<Mode = Normal> + 'bound + Sync> Sync for Device<'bound, T> {}
 
 struct Adapter<T: LedOps> {
     _p: PhantomData<T>,
 }
 
-impl<T: LedOps> Adapter<T> {
+impl<T: LedOps<Mode = Normal>> Adapter<T> {
     /// # Safety
     /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
     /// `led::Device`.
@@ -209,7 +217,7 @@ impl<T: LedOps> Adapter<T> {
 }
 
 #[pinned_drop]
-impl<'bound, T: LedOps + 'bound> PinnedDrop for Device<'bound, T> {
+impl<'bound, T: LedOps<Mode = Normal> + 'bound> PinnedDrop for Device<'bound, T> {
     fn drop(self: Pin<&mut Self>) {
         let raw = self.classdev.get();
         // SAFETY: The existence of `self` guarantees that `self.classdev.get()` is a pointer to a

-- 
2.53.0


