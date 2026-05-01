Return-Path: <linux-leds+bounces-7935-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E5vFIi69GkwEAIAu9opvQ
	(envelope-from <linux-leds+bounces-7935-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 01 May 2026 16:36:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C76B44AD471
	for <lists+linux-leds@lfdr.de>; Fri, 01 May 2026 16:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7F2E300E28B
	for <lists+linux-leds@lfdr.de>; Fri,  1 May 2026 14:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563593CCA12;
	Fri,  1 May 2026 14:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="lMnSkLCg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499823CD8D8
	for <linux-leds@vger.kernel.org>; Fri,  1 May 2026 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777646176; cv=none; b=HkD/f9Mu8Lw6KSMMO3jrTi6x2v+mCv5/lg8AuSuC3ZYTjK+pVywcjjvGI8B1MBJk7aMv5W3uVbzsylAKLDDdq3YKuiURjPt7n48eFTvPtqs9ctPsPEN0kuujUoBn8buU5104WZWpWClFbbuKuXlNVZxQGa4T0sElffWlkhhkvLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777646176; c=relaxed/simple;
	bh=E3bzm3QfblHpymqQiQxNq+2D7OfbgIrNy1j3vjDCsY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJNnQAW29802Up2dQlXS6H+zgKa6vMoHsjUMAalLlAbPr18jO0I7F44u4KJimpgdI4jXJNs+tRhzjDgdHPP2TuZS3MbIKoWZFs6NamaKd3tRIvY6hUa+DX1CKJFn5i3OF1EqUegtvOsI56MlVnzjq9a/hQ2tqxJHbDHt+8IHQ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=lMnSkLCg; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id DEB1524002A
	for <linux-leds@vger.kernel.org>; Fri,  1 May 2026 16:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1777646166; bh=ACUzYLr3qqQMmbokYLGbria4mjdatKFkWDd5VxD8PSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=lMnSkLCgQDUSA/5TDV0o6DEBihB4O8d8m4bdlFo1WwwW0XNQxi8SpDSfaGRsTgcHB
	 5BEsaQVlaR81efRPN8W9qkc43hP14Lb41z0PVAjPoOkrnWdkXMLxo9ZwoZFe3wNrAr
	 dQ5VbvdM/PS4Jvdfc9b1x6XIGLzR6DTMHlZu8UcmjkmOZDTGBBqHjcv4tPyZyhhFtW
	 Kc20jKCmP2g0EDt54FKt/Ic46hrnxCH/Swu9/k2h4b7oTSkYXrEJp1VnWL/+kDSrwL
	 el/6zbIjrPJP0zxQ+86vlEKKcSvqdnJ9uOTuPvbycKCfzmx5hp9hVrli7U7bs4TP3b
	 /v4T6LGnpp/Mw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g6YW84MvPz9rxG;
	Fri,  1 May 2026 16:36:04 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Date: Fri, 01 May 2026 14:36:05 +0000
Subject: [PATCH v16 2/3] rust: leds: add Mode trait
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-rust_leds-v16-2-9f329fdedcd9@posteo.de>
References: <20260501-rust_leds-v16-0-9f329fdedcd9@posteo.de>
In-Reply-To: <20260501-rust_leds-v16-0-9f329fdedcd9@posteo.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5332;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=E3bzm3QfblHpymqQiQxNq+2D7OfbgIrNy1j3vjDCsY8=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBp9LpQPk288lLbmRXPjYIv3XlTbqajWBkB1Wi2I
 PMxfPGWaiCJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCafS6UBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9Lr/RAAjLKd9iLV4ghqqKSRVJGKIIq2NDZmBlK
 W6JmmWzqQaDNOsr0RBCtofqc4emDZ/IYEyCgYG87YyI0AloIL2hNOT9sZTcIAJ4adMQvrRPDFLC
 71iDEy6aCJtdVKiLjIthgaOXE4jfcF8sZ4q6j0o4IMpClEDWktpWO3PseBHyokZuLvAfaM/jXsP
 hy8qqUR0JGgvBNxe96jO8KYAE2jgoYQHdFoJio+0+acgZCzbnaOudg0+4bAnxjmpg/nxDA2gjM5
 HLFyoCS4mmTu2VBHh+Uih4kwmmnDfIH69t3OxXPPifvb/P75EnvEMKV11tyUrXTeAJHqakSud6k
 U96fpcN+Yz2nK/wkKGt3rkCg3MFGjjt78JwjmZ58B1VNqWtneqkiXA6UF/7K1s2qS/X/pKqL0ay
 wdBr9Y+qjFKL5FG7VVW6rVH4SvjhJuUgWqRRN4eWPfi1vMOy+egSmLM4HfR3Jka5MgwFPFQ6TCm
 4QRb0/ynV/ufCYXPTC42VWAhGAeHE2d/y2Z3HgIyMKf6RJB548Meb1UoE7MUrrtku6cvaLQUz5t
 JNHCxBKCRpVxtzGL4/YIb98qoZbzm/yyEwZGZOKOCscAfAabP6k5GNOgYBnSULGv6t1JMsojAKP
 nPS6wCINjDvyZcqKAstBI4FW8/nATRBbnDRqd0GajjpR+FBhvljQ=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Queue-Id: C76B44AD471
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7935-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,posteo.de:dkim,posteo.de:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Add the `led::Mode` trait to allow for other types of led class devices
in `led::LedOps`.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 rust/kernel/led.rs        | 31 +++++++++++++++++++++++++++----
 rust/kernel/led/normal.rs | 24 ++++++++++++++++--------
 2 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
index 57746b0b08ca..5ddfee47f911 100644
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
-    fn brightness_get(&self, dev: &Self::Bus, classdev: &Device<Self>) -> Result<u32> {
+    fn brightness_get(
+        &self,
+        dev: &Self::Bus,
+        classdev: &<Self::Mode as Mode>::Device<Self>,
+    ) -> Result<u32> {
         let _ = (dev, classdev);
         build_error!(VTABLE_DEFAULT_ERROR)
     }
@@ -227,7 +240,7 @@ fn brightness_get(&self, dev: &Self::Bus, classdev: &Device<Self>) -> Result<u32
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
index 6715ddf911be..ad69ed85feb0 100644
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
@@ -88,7 +96,7 @@ pub fn build<T: LedOps>(
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
@@ -210,7 +218,7 @@ impl<T: LedOps> Adapter<T> {
 }
 
 #[pinned_drop]
-impl<T: LedOps> PinnedDrop for Device<T> {
+impl<T: LedOps<Mode = Normal>> PinnedDrop for Device<T> {
     fn drop(self: Pin<&mut Self>) {
         let raw = self.classdev.get();
         // SAFETY: The existence of `self` guarantees that `self.classdev.get()` is a pointer to a

-- 
2.53.0


