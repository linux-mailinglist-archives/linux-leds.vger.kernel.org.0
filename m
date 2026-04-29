Return-Path: <linux-leds+bounces-7909-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLVNJghI8mm1pQEAu9opvQ
	(envelope-from <linux-leds+bounces-7909-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 20:03:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A08D498894
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 20:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A441C305AC48
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 18:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036BE3C3C06;
	Wed, 29 Apr 2026 18:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="bsHOanPq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0D8413235
	for <linux-leds@vger.kernel.org>; Wed, 29 Apr 2026 18:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777485643; cv=none; b=srobi88AF1bqk4w0bvJfEboAtxEcnKfeQyWM3tzniC5cqbTTcmkY+asjbWPxIcim6aUh3qUqqJubYBMgKEOX89s8ZlsOzDEudE4XkHN/P3P6xUs5hga9j516B8u2NF1QJyYZUXTqL8XP10z+WM30dVDnaggSOTtuQSYCeTDl/Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777485643; c=relaxed/simple;
	bh=cPrOlNu8bSG6m/HubwuoNKjkYgaf1AB560k91Pl+eq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jD9FG+N0O4AGbS8oksrhQyREhFbCfdDOWdtdNFJozIrCRrtZiJBj1vciZjeRW7i4CO33pDlhOn6xocTNMNfqLYkFBmvxaBFMAEkhANy+0O/6osmvi9wh4YCIzIWasdBmnmPl7Mi3NuMzhyvWSbVDIhMphixYtUd3Ic+Cj/blmcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=bsHOanPq; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id A7C29240108
	for <linux-leds@vger.kernel.org>; Wed, 29 Apr 2026 20:00:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1777485640; bh=7miERddD4atgBUE11JQvgG54A2lz6Exs5eBb9OlQerA=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=bsHOanPqCeXMpWLGZMaF+eKA4sprcGBFViu/gA+Xa6gs8ViEZZKuUpHbizGf+p1nh
	 JIrgGasZdGf7SDkm+Ke2uefwwV6AzqCNSwqThAk7148eCkkVCrAckg01DHYs9LkT4+
	 W5cMfIByxLx1EzDoKxaarEtntpji2hATaC8XJ0Mtc+jZ1PSVhAiEvtSrzbQ0ezmo0b
	 YFe4SZwvqdxW6teJRy4zNJ+PCpuAK3pAuFIMtt0F1cljDV309OA1+wMzRW5f1vqNP9
	 4tXJQc7w0e/l7oLt1I2rCjT9o+iH+8l20d2KCtZ2aa0569a82ZreCJLMiTuTk91XEe
	 nC+lHcGqlYRzQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g5Q851DcCz9rxb;
	Wed, 29 Apr 2026 20:00:37 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Date: Wed, 29 Apr 2026 18:00:39 +0000
Subject: [PATCH v15 2/3] rust: leds: add Mode trait
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-rust_leds-v15-2-97e97b27ebb5@posteo.de>
References: <20260429-rust_leds-v15-0-97e97b27ebb5@posteo.de>
In-Reply-To: <20260429-rust_leds-v15-0-97e97b27ebb5@posteo.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5311;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=cPrOlNu8bSG6m/HubwuoNKjkYgaf1AB560k91Pl+eq8=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBp8kc/hjpiEhigpjZ+8fcE7MgKND/vt99g0poNJ
 j3J+aE8GEKJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCafJHPxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9JwKA//VqmSg0ZWxy1Ep6k7QT9FXodMtNXWs+v
 ndi3PWBTl4hl68eGBt1crJF/ipbgPLU3teWcoWOuOOLgy0zpS6oStnyKkbmdisHPwzrXULev9YR
 zg3sLjozuDqtDfWi32FYYv0eo+Pc8cf3lzLjXwi8FL8TpEfhHAA7OSLbB1h3MseUILtgAGpnzw1
 90C6s+3NZLmSxEOLJ3NWorQxYMrgJAkh/UCff3FI9+NXRKauLfMQ5U0C9kx+s1+Z8oMdfgxsrDz
 VHfh7aYj5XthEsBZKV+z3bXR78IeKbrsIgTXZRwWpLNyjCh7MMtURdnlmrkod/67JfIq5JVtl+8
 3qYZpy8Q51TPSXDbd+/VMBZuvu/Fv1RkPUvkhWyAdmXjiEE10jtQ7zmjbxz/yASs5eRKHTsSXkt
 3qAD+Ft5S1k8ysSZT3Cu6mKsf7T/giYNXZTnF+62ygSpZiBa3+I9iWmGWGmBb/jpfhTgsSs7YHA
 KFAQlrNzI52w9amNCZUCmCV329VQVsDIxqfb19xTp1igBrwAGBv4unmBDCm9OcruscGdENToHnJ
 gBeSvVs1bL/rbrS+uw+3ds3vRSPQINyuNTE3YZCsD/V5HXAtB/+aSCVbcVlMKXvDl/LQMmowA0c
 j2EZ06vME0ZNKSGgaAWkjUsvjOljnQlQL8+1VMz73vJJTHZ0Wdyw=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Queue-Id: 1A08D498894
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7909-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,posteo.de:email,posteo.de:dkim,posteo.de:mid]

Add the `led::Mode` trait to allow for other types of led class devices
in `led::LedOps`.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 rust/kernel/led.rs        | 31 +++++++++++++++++++++++++++----
 rust/kernel/led/normal.rs | 24 ++++++++++++++++--------
 2 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
index 6cbaa917deb4..c1259f15dd3a 100644
--- a/rust/kernel/led.rs
+++ b/rust/kernel/led.rs
@@ -33,7 +33,10 @@
 
 mod normal;
 
-pub use normal::Device;
+pub use normal::{
+    Device,
+    Normal, //
+};
 
 /// The name of the led is determined by the driver.
 pub enum Named {}
@@ -162,6 +165,7 @@ pub fn name(self, name: &'a CStr) -> Self {
 /// #[vtable]
 /// impl led::LedOps for MyLedOps {
 ///     type Bus = platform::Device<device::Bound>;
+///     type Mode = led::Normal;
 ///     const BLOCKING: bool = false;
 ///     const MAX_BRIGHTNESS: u32 = 255;
 ///
@@ -194,6 +198,11 @@ pub trait LedOps: Send + Sync + 'static + Sized {
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
@@ -206,12 +215,16 @@ pub trait LedOps: Send + Sync + 'static + Sized {
     fn brightness_set(
         &self,
         dev: &Self::Bus,
-        classdev: &Device<Self>,
+        classdev: &<Self::Mode as Mode>::Device<Self>,
         brightness: u32,
     ) -> Result<()>;
 
     /// Gets the current brightness level.
-    fn brightness_get(&self, dev: &Self::Bus, classdev: &Device<Self>) -> u32 {
+    fn brightness_get(
+        &self,
+        dev: &Self::Bus,
+        classdev: &<Self::Mode as Mode>::Device<Self>,
+    ) -> u32 {
         let _ = (dev, classdev);
         build_error!(VTABLE_DEFAULT_ERROR)
     }
@@ -227,7 +240,7 @@ fn brightness_get(&self, dev: &Self::Bus, classdev: &Device<Self>) -> u32 {
     fn blink_set(
         &self,
         dev: &Self::Bus,
-        classdev: &Device<Self>,
+        classdev: &<Self::Mode as Mode>::Device<Self>,
         delay_on: &mut usize,
         delay_off: &mut usize,
     ) -> Result<()> {
@@ -291,6 +304,16 @@ fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
     }
 }
 
+/// The led mode.
+///
+/// Each led mode has its own led class device type with different capabilities.
+///
+/// See [`Normal`].
+pub trait Mode: private::Sealed {
+    /// The class device for the led mode.
+    type Device<T: LedOps<Mode = Self>>;
+}
+
 mod private {
     pub trait Sealed {}
 }
diff --git a/rust/kernel/led/normal.rs b/rust/kernel/led/normal.rs
index b457ddb742c7..43356d26abe4 100644
--- a/rust/kernel/led/normal.rs
+++ b/rust/kernel/led/normal.rs
@@ -6,11 +6,19 @@
 
 use super::*;
 
+/// The led mode for the `struct led_classdev`. Leds with this mode can only have a fixed color.
+pub enum Normal {}
+
+impl Mode for Normal {
+    type Device<T: LedOps<Mode = Self>> = Device<T>;
+}
+impl private::Sealed for Normal {}
+
 /// The led class device representation.
 ///
 /// This structure represents the Rust abstraction for a led class device.
 #[pin_data(PinnedDrop)]
-pub struct Device<T: LedOps> {
+pub struct Device<T: LedOps<Mode = Normal>> {
     #[pin]
     ops: T,
     #[pin]
@@ -19,7 +27,7 @@ pub struct Device<T: LedOps> {
 
 impl<'a, S: DeviceBuilderState> DeviceBuilder<'a, S> {
     /// Registers a new [`Device`].
-    pub fn build<T: LedOps>(
+    pub fn build<T: LedOps<Mode = Normal>>(
         self,
         parent: &'a T::Bus,
         ops: impl PinInit<T, Error> + 'a,
@@ -86,7 +94,7 @@ pub fn build<T: LedOps>(
     }
 }
 
-impl<T: LedOps> Device<T> {
+impl<T: LedOps<Mode = Normal>> Device<T> {
     /// # Safety
     /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
     /// `led::Device`.
@@ -105,17 +113,17 @@ fn parent(&self) -> &device::Device<Bound> {
 }
 
 // SAFETY: A `led::Device` can be unregistered from any thread.
-unsafe impl<T: LedOps + Send> Send for Device<T> {}
+unsafe impl<T: LedOps<Mode = Normal> + Send> Send for Device<T> {}
 
 // SAFETY: `led::Device` can be shared among threads because all methods of `led::Device`
 // are thread safe.
-unsafe impl<T: LedOps + Sync> Sync for Device<T> {}
+unsafe impl<T: LedOps<Mode = Normal> + Sync> Sync for Device<T> {}
 
-struct Adapter<T: LedOps> {
+struct Adapter<T: LedOps<Mode = Normal>> {
     _p: PhantomData<T>,
 }
 
-impl<T: LedOps> Adapter<T> {
+impl<T: LedOps<Mode = Normal>> Adapter<T> {
     /// # Safety
     /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
     /// `led::Device`.
@@ -201,7 +209,7 @@ impl<T: LedOps> Adapter<T> {
 }
 
 #[pinned_drop]
-impl<T: LedOps> PinnedDrop for Device<T> {
+impl<T: LedOps<Mode = Normal>> PinnedDrop for Device<T> {
     fn drop(self: Pin<&mut Self>) {
         let raw = self.classdev.get();
         // SAFETY: The existence of `self` guarantees that `self.classdev.get()` is a pointer to a

-- 
2.53.0


