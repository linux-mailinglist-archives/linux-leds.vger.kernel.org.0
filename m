Return-Path: <linux-leds+bounces-7688-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE5OCtdj2mlN1ggAu9opvQ
	(envelope-from <linux-leds+bounces-7688-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 17:08:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C1F3E088C
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 17:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 00E0C3013727
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 15:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F0A38BF76;
	Sat, 11 Apr 2026 15:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="c8n+9q4F"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B9039182C
	for <linux-leds@vger.kernel.org>; Sat, 11 Apr 2026 15:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775920056; cv=none; b=RI977BCHLQlgsoiFdRsJ3dCKhPuZ8e0hZQs/6Xj77Y+zVGRUg5kRLTPVVYCtepw7eT+4MTbr/AwaJxsxSM0CEfrKaVxYjey1rWp1joBDBFTf+jiB7LDcF9wqQtCQHHv1SqnDNN+4Qk+rQvvA2RUzfe6KrXgHWKMtLoizQNp60Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775920056; c=relaxed/simple;
	bh=zdwp4NNgFfvRIvYjtCKYF8YDPW9jE+7dJKS4sgsjRTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+DzX1bsigvDjaBsC3se23Ia8kyUVvn8OnqzVNDoNX7S31iqy9h+szfjJOpnA+wCrS+I3VgXom2aWyo2DPU2C15F1ReKj9B7oTosgCEFWSDPlSKZ/taL9rRrGyHHL1U9Sr/stUvb0vQ8mqNL8D9yKQ73oUQBf3BIQL111ejOuiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=c8n+9q4F; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 9FE4B240106
	for <linux-leds@vger.kernel.org>; Sat, 11 Apr 2026 17:07:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1775920043; bh=Pam4GgQs35Wt+h5iJjbhd0iaxYfo7309XAPP4E8NHrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=c8n+9q4FrnPBy8ptW/cU+3tDtU7dTAjiQQvudIc1ISqkaemfi8Rzhn6Sk6nZlyOYr
	 cQR3Z89VlMqPNML3QJ3ezTQuajWj50aNN/MJyQ+LM7Me2Sv8waE02/PFNtUzfO27KB
	 hUp4nDfOXGNBCrz3EXX+D1Iw47rJTOe2GK6icG70atLnltXBnljPShaLFSAmufsy6h
	 CDuHAdnMAvpubRWXv9oZ93SjtzXucDU3tx/g/ZeboZkUKYLFLPY/TrplFwoU7tjlMF
	 aWl3don6kP/TOoFHDeQc/oo6jFvOpg68xG4JwM02gWkrow73TYTXQH0JNkF6l2FxDW
	 fyw2LyO20gbNQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ftH8T23xxz9rxM;
	Sat, 11 Apr 2026 17:07:21 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Date: Sat, 11 Apr 2026 15:07:22 +0000
Subject: [PATCH RESEND v13 2/3] rust: leds: add Mode trait
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-rust_leds-v13-2-1208a2821deb@posteo.de>
References: <20260411-rust_leds-v13-0-1208a2821deb@posteo.de>
In-Reply-To: <20260411-rust_leds-v13-0-1208a2821deb@posteo.de>
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
 bh=zdwp4NNgFfvRIvYjtCKYF8YDPW9jE+7dJKS4sgsjRTo=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBp2mOlLQ5bKhScemCDJhuKDcnJhm5A7Zy7SZeAP
 VAtJ4XEw6GJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCadpjpRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9JZ7xAArkYd6PmVaL0Px4aTB0gyFOgfiw+VCO0
 EfrZL5bfjUSIP4dKpRo/+49xK+I0uMAVZL12FzR3Nll9F29FWTPD7E+AtnNBuWBoSTUuXF6gxHb
 NC4enp135w645pEgkMedJJNq2HjT/zmNovmH2O5x7fnoIQCZb8a8G169ZV4nW6uQM0GYpvqd/6b
 ofw/F7NAvOuV9kqQxnNNN1m7yWFTU+HmGJayswzcSWAzROdKvdPfDXk4DgFzo5M+8pnC36ELsFY
 7S23BIJlfWr+IEKEixaNCJv8Jb1+ElCHg2UbxqGGW5gerWjYbPJU+PHhj9RSSgvQhS/81UaXjl0
 ux80wcZpyqmxLDOgR5sM2k+z2JsGzy8/jgYTQvkNhPTlC3WZxVg28Z3hN0JJQkBiufkGrxVlnDf
 oNgDIAMM4cDgoY/q4aPlzFl/7TKe+o5LEELiAraJG7gTIM+q+RJfeFWi1JiFHwNHCsJWLJPENOR
 jSdT7UmxAtVWgTW4QupGWCFplXrA8rU9t7aTuIYAzQTRAdrkDEw9yN4AvR5GEQEh/Rn3oL2jSX+
 rVJxxy0q/tisD7/hOR9qgXmhbSXSbncEob3d3rNGR8DHC2K7rQAlQ/eZG8pEZqMSwOSWMG3fUzC
 5yMG5TMm5JFZgtg+fIOqyna78xBNauAAra24LiIB03jr/kPqb40s=
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7688-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,posteo.de:dkim,posteo.de:email,posteo.de:mid]
X-Rspamd-Queue-Id: 24C1F3E088C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the `led::Mode` trait to allow for other types of led class devices
in `led::LedOps`.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 rust/kernel/led.rs        | 28 ++++++++++++++++++++++++----
 rust/kernel/led/normal.rs | 24 ++++++++++++++++--------
 2 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
index 1fba512a804c..5035563d68a3 100644
--- a/rust/kernel/led.rs
+++ b/rust/kernel/led.rs
@@ -35,7 +35,7 @@
 
 mod normal;
 
-pub use normal::Device;
+pub use normal::{Device, Normal};
 
 /// The name of the led is determined by the driver.
 pub enum Named {}
@@ -177,6 +177,7 @@ pub fn name(self, name: &'a CStr) -> Self {
 /// #[vtable]
 /// impl led::LedOps for MyLedOps {
 ///     type Bus = platform::Device<device::Bound>;
+///     type Mode = led::Normal;
 ///     const BLOCKING: bool = false;
 ///     const MAX_BRIGHTNESS: u32 = 255;
 ///
@@ -209,6 +210,11 @@ pub trait LedOps: Send + 'static + Sized {
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
@@ -221,12 +227,16 @@ pub trait LedOps: Send + 'static + Sized {
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
@@ -242,7 +252,7 @@ fn brightness_get(&self, dev: &Self::Bus, classdev: &Device<Self>) -> u32 {
     fn blink_set(
         &self,
         dev: &Self::Bus,
-        classdev: &Device<Self>,
+        classdev: &<Self::Mode as Mode>::Device<Self>,
         delay_on: &mut usize,
         delay_off: &mut usize,
     ) -> Result<()> {
@@ -305,6 +315,16 @@ fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
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
2.52.0


