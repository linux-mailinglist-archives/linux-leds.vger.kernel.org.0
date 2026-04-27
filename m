Return-Path: <linux-leds+bounces-7855-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEyBFJKm72mpDgEAu9opvQ
	(envelope-from <linux-leds+bounces-7855-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2026 20:10:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9178478426
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2026 20:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0764F305044B
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2026 18:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6533ED12B;
	Mon, 27 Apr 2026 17:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="oR2KG7ET"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A9B3ECBF9
	for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 17:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312790; cv=none; b=BUJVM8bThG72Q5W2O0ajvie2qwrj5gbWaa+47Gf4JRSNL4LpyAkqCpDt6lDJMJOTqEp14wsNXiwWn9d0PoSIq9bUIZRTy4t6sOqnQYfxYS+jHGzR64trzlqPLyMQ9WQSwVtK502NWI+H8ZYR0cJ/zzc3AWS9UqamtFKRDFvXOLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312790; c=relaxed/simple;
	bh=jUkK9L1gPQJbNAsOYPwLU2s+11lgUZ2uHWYpFtVRJgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G8f4tTkKWB5j0Xk6TplWU74Ab4G5LKGSzTRlLDE+nvJvgysDWNgOcSFCPZWfub5O2QFsqEKOCb7bDnWi/6FOMqzpMBtS1v89Sm1pXLYIaCUizgLoz3mDSb8OK9Ysm4YMovM4y7Dab24LArXMmk/Skl3ydkqWZ4odQ2ywLZeJo38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=oR2KG7ET; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 2CAD5240109
	for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 19:59:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1777312787; bh=TWWbdxcQv2rC8OWvLELAqej/dFPCxGeBVo8I5zXn/tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=oR2KG7ET92rVNxtngq/vCKZ//SFYM4AU636Q8yFyFeT3H4vE5BdCyQ0eDYSqy05D3
	 dK5fxNe0p7qY1puXxBw20n9jFt3wp0ddTnVF5OR3NH5nxJuAGmVDdVdMMFopU/RPHF
	 Ukuo9BiMr+QGrHuDzGBSpdyomgnDeOhLD+oQZCYfoiCn8AJfu+7t7pDTVseyAq5o83
	 9qiFcoWU5FVEMr6WcaWx9xITID3cMTWZRlSmYQbIt53ne5KEyI0yzeLyouMJ/JeZ7+
	 OZChZLHXWUqnycBaFvRto1R4paY+SgDsGVi1AnwHooqAMPSb118J69eTgD6FPzKHcZ
	 K5QIYmuXRDYPg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g4BD0025Qz9rxN;
	Mon, 27 Apr 2026 19:59:43 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Date: Mon, 27 Apr 2026 17:59:46 +0000
Subject: [PATCH v14 2/3] rust: leds: add Mode trait
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-rust_leds-v14-2-4f4b17e5d516@posteo.de>
References: <20260427-rust_leds-v14-0-4f4b17e5d516@posteo.de>
In-Reply-To: <20260427-rust_leds-v14-0-4f4b17e5d516@posteo.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5273;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=jUkK9L1gPQJbNAsOYPwLU2s+11lgUZ2uHWYpFtVRJgQ=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBp76QLkBYIWlRAf+NjKA5Gkc9Dsogg6jHoJ1Yzy
 tMFJXkn666JAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCae+kCxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9Kz6w//Xgbpv5eoZxNNII1yShKxpDURSPJeiUC
 tB+EY9KDbcWjcUgibtGe1LNycNImcv/9XaeFxHaa88cyf5PEgdEi20qpfeVb+5mfvyus04XCPAf
 ElXivqyBv5fZj2cFKaMGfRo9iWSBKcA7q6zESOQkx/mcmrPJh4wMtzOg2bNN730eMNIC1thQ1PF
 nP53tOpeZlfKYNDHJvq0HRbrAPPhWh2vyMkYJEcDsUCvD9xr/QCDGwCijj6bKiE9rvzaKnNhE6s
 KaeJUd7dulj/UdKNIUeCT7hC27DY9jZtXe9CADVA2pdPypUUA3Lrj0ooYx25lIUE3GMlA7L807O
 ZnyIHxW1loS4InFHLpXWNxyZFYZyPFzddguC9Z3jnQMMOmHATBNMygD/iq9xvP3UwPpQetJ3L4R
 mH1jULFcCTGOjTMaCtQKh7VnqeptSXGdX0ud/BVpo8E1fH/tlrhnc20fzaydLRmhBu0lJd3qVax
 9dWuM9OWttCAIjjWETZcTanjw47HHjsIQU01gKqwrZ9Hl6hvi6j2CKPPJ3GjYpUhwL8GgqoH9p5
 p6/vik1vx7pUQVqLGlVLJsKtcA5KK94PUBs/iCuyLbPtgdOLvQxK/KjjHfqU4xieGwsq6qRr/2j
 ysR8EgxUlDnB4l2YZOBBy02jiVHSycGhPfnaQuZZshgDwK+TyuMM=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Queue-Id: B9178478426
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7855-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,posteo.de:dkim,posteo.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add the `led::Mode` trait to allow for other types of led class devices
in `led::LedOps`.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 rust/kernel/led.rs        | 28 ++++++++++++++++++++++++----
 rust/kernel/led/normal.rs | 24 ++++++++++++++++--------
 2 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
index f371ba48ef12..e8a69efd3066 100644
--- a/rust/kernel/led.rs
+++ b/rust/kernel/led.rs
@@ -33,7 +33,7 @@
 
 mod normal;
 
-pub use normal::Device;
+pub use normal::{Device, Normal};
 
 /// The name of the led is determined by the driver.
 pub enum Named {}
@@ -175,6 +175,7 @@ pub fn name(self, name: &'a CStr) -> Self {
 /// #[vtable]
 /// impl led::LedOps for MyLedOps {
 ///     type Bus = platform::Device<device::Bound>;
+///     type Mode = led::Normal;
 ///     const BLOCKING: bool = false;
 ///     const MAX_BRIGHTNESS: u32 = 255;
 ///
@@ -207,6 +208,11 @@ pub trait LedOps: Send + 'static + Sized {
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
@@ -219,12 +225,16 @@ pub trait LedOps: Send + 'static + Sized {
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
@@ -240,7 +250,7 @@ fn brightness_get(&self, dev: &Self::Bus, classdev: &Device<Self>) -> u32 {
     fn blink_set(
         &self,
         dev: &Self::Bus,
-        classdev: &Device<Self>,
+        classdev: &<Self::Mode as Mode>::Device<Self>,
         delay_on: &mut usize,
         delay_off: &mut usize,
     ) -> Result<()> {
@@ -303,6 +313,16 @@ fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
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
index bd239f186c64..dda247145f25 100644
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
@@ -89,7 +97,7 @@ pub fn build<T: LedOps>(
     }
 }
 
-impl<T: LedOps> Device<T> {
+impl<T: LedOps<Mode = Normal>> Device<T> {
     /// # Safety
     /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
     /// `led::Device`.
@@ -107,17 +115,17 @@ fn parent(&self) -> &device::Device<Bound> {
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
@@ -203,7 +211,7 @@ impl<T: LedOps> Adapter<T> {
 }
 
 #[pinned_drop]
-impl<T: LedOps> PinnedDrop for Device<T> {
+impl<T: LedOps<Mode = Normal>> PinnedDrop for Device<T> {
     fn drop(self: Pin<&mut Self>) {
         let raw = self.classdev.get();
         // SAFETY: The existence of `self` guarantees that `self.classdev.get()` is a pointer to a

-- 
2.53.0


