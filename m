Return-Path: <linux-leds+bounces-9044-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8YZEJFrOU2qvfAMAu9opvQ
	(envelope-from <linux-leds+bounces-9044-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 19:26:50 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FA17457C5
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 19:26:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=F+zpMBnT;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9044-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-9044-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 886AF300AC34
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 17:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EEF3655C7;
	Sun, 12 Jul 2026 17:26:47 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB893546EC;
	Sun, 12 Jul 2026 17:26:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783877207; cv=none; b=MxKmTSeFeb6zaR0HrQee3y7NmRDF2uN2gBWdawbdtHvWVgNvlRVGTW9wKQyHBQcd9Oz/s/M42+eLfK+IddzT5LukhopHlHnDD5DV6h2NyYSeGSEz3utc5aZKErrKNbKbjVtHN4fDvD9Zmxj3G0QRWlqD5Mesk0byBTEAszwLoNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783877207; c=relaxed/simple;
	bh=LbIXFi6RoowHL8fWkFvaqjDUegfBqETQKa1bY68LrPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hR01iSLNeKjnYIPBMbsyAC6OiJsoWY68lWxWKlWtnOaBOZqYv5vawegg8/rePel1aJcLW4mHSOypfSqznj0xRKasGboqakljk5Dtv3CFeaWnEqgZGM1taUGi3J/0MdvBTrKC1tbOXEUnco8II2xIxkg3SdiFBdc+AahZ/CCQ5LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+zpMBnT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B940BC2BCF5;
	Sun, 12 Jul 2026 17:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783877206;
	bh=LbIXFi6RoowHL8fWkFvaqjDUegfBqETQKa1bY68LrPo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F+zpMBnT/+DOtXcD8PVmmT9vcb/8nXCkPxMOw4N/dhKCGEkuANs1YaE4pNCVF6WRO
	 ae5xLDK9DzsIBTxpg9eEBmvRg9u1wl2fR0R2sa4l1q0FVoxbhedtBehRToBcUX25b6
	 45veFbM276OA5RAWVrd7vAWsrZ5M0j18vUgXKd7zsa8bajfE6tvWxb2ALrL+04Y26y
	 wcfuD2QRwHv2quTzB24F/VV74UNkiDW1V0FZshOECbkB4e3b0mA3Ji29WLTm3XqjaE
	 Q/n0Iu27w/Ql70Hj4kCf/51ouSKfkWIEyRkMDrBT4DrMkE8lgKLqmYKxsWyg2UPnOK
	 6w9D2aAqyGb1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E45C44506;
	Sun, 12 Jul 2026 17:26:46 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Sun, 12 Jul 2026 19:26:44 +0200
Subject: [PATCH v22 2/3] rust: leds: add Mode trait
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-rust_leds-v22-2-055b0459a079@posteo.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5626;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=qpy5GWiOw2phlXaRzUTaPi0ihAjNEMjTvj78mEPj8Kk=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqU85UOErFxWk1eXiVcmqogoj1mpgXgnUxJdOnR
 VzQ8xos8biJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCalPOVBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9KicxAAjqImq5aXAAxfabF9gWu9SPSa3tGjSGF
 Bf/C6yDoa/mfsXHVObRrMJG6/W7JLqWk+KCwIgr1oYkHTSUuPHiYtzJ+QGqqpJnFoxoIiFs4uLl
 U18Y5Yvw1QZpsk9k9YMRxyaCSkfAQyJq5IkBINlJUjAaQD4lDl8vqw2QlePrmAIybZH/S2IhZgy
 K1WNP9fMhjs76hzz1encRqPasg01+PD0udBW4yJxfvmWnHKRopD/g2zx1H3EIJHnn2Eqh0zMqGd
 5sSUejWRHemxi53ooou7p5eMrfz1TAzFpWCqzKILL0yeCBGvbWIUnK4roOeO/juhdPrvSAVhrCw
 G2mlIOCgoCT+hlCCB7uCbfmG72VAxPTbVSKsJiWdBaMePNnX+hlCua/RzLpRI9tLRTsgxYYYbol
 uW1WjtKGj2JozKw1/ZFeH/hrm3jim/0ulV2bPdJJeKIyQAFMw3nwzSRTL0tG0sxiJo8eygocRCo
 5OHCb2wVjv5i5+UtpXB6m5srnTw+DuaACXJKyT3ejlZZtCNCXyOTWsgzPtzKIFEjfwhmc0JoG2U
 AP2XSoBAfgL6LHIjHbIQTZ4m4lH7DtW+QnHfKmw9hlTkaYfu0vyWccdSBHpOYAzLF/PCNIvfyKV
 V62s5A6+sbXK6YSSvHoSrJKQ+oaxRZNhnctrwKKHb2D0dWU9p9+g=
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-9044-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:replyto,posteo.de:mid,posteo.de:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1FA17457C5

From: Markus Probst <markus.probst@posteo.de>

Add the `led::Mode` trait to allow for other types of led class devices
in `led::LedOps`.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 rust/kernel/led.rs        | 27 +++++++++++++++++++++++----
 rust/kernel/led/normal.rs | 22 +++++++++++++++-------
 2 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
index 143f790eb6e4..ec4f178a120f 100644
--- a/rust/kernel/led.rs
+++ b/rust/kernel/led.rs
@@ -31,7 +31,10 @@
 
 mod normal;
 
-pub use normal::Device;
+pub use normal::{
+    Device,
+    Normal, //
+};
 
 /// The name of the led is determined by the driver.
 pub enum Named {}
@@ -160,6 +163,7 @@ pub fn name(self, name: &'init CStr) -> Self {
 /// #[vtable]
 /// impl led::LedOps for MyLedOps {
 ///     type Bus = platform::Device<device::Bound>;
+///     type Mode = led::Normal;
 ///     const BLOCKING: bool = false;
 ///     const MAX_BRIGHTNESS: u32 = 255;
 ///
@@ -181,6 +185,11 @@ pub trait LedOps: Send + Sync + Sized {
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
@@ -193,7 +202,7 @@ pub trait LedOps: Send + Sync + Sized {
     fn brightness_set<'bound>(
         &self,
         dev: &'bound Self::Bus,
-        classdev: &Device<'bound, Self>,
+        classdev: &<Self::Mode as Mode>::Device<'bound, Self>,
         brightness: u32,
     ) -> Result<()>;
 
@@ -201,7 +210,7 @@ fn brightness_set<'bound>(
     fn brightness_get<'bound>(
         &self,
         dev: &'bound Self::Bus,
-        classdev: &Device<'bound, Self>,
+        classdev: &<Self::Mode as Mode>::Device<'bound, Self>,
     ) -> Result<u32> {
         let _ = (dev, classdev);
         build_error!(VTABLE_DEFAULT_ERROR)
@@ -218,7 +227,7 @@ fn brightness_get<'bound>(
     fn blink_set<'bound>(
         &self,
         dev: &'bound Self::Bus,
-        classdev: &Device<'bound, Self>,
+        classdev: &<Self::Mode as Mode>::Device<'bound, Self>,
         delay_on: &mut usize,
         delay_off: &mut usize,
     ) -> Result<()> {
@@ -282,6 +291,16 @@ fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
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
index 816db7c57689..25190486a62d 100644
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
 
 impl<'init, S: DeviceBuilderState> DeviceBuilder<'init, S> {
     /// Registers a new [`Device`].
-    pub fn build<'bound: 'init, T: LedOps + 'bound>(
+    pub fn build<'bound: 'init, T: LedOps<Mode = Normal> + 'bound>(
         self,
         parent: &'bound T::Bus,
         ops: impl PinInit<T, Error> + 'init,
@@ -87,7 +95,7 @@ pub fn build<'bound: 'init, T: LedOps + 'bound>(
     }
 }
 
-impl<'bound, T: LedOps + 'bound> Device<'bound, T> {
+impl<'bound, T: LedOps<Mode = Normal> + 'bound> Device<'bound, T> {
     /// # Safety
     /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
     /// `led::Device`.
@@ -107,17 +115,17 @@ fn parent(&self) -> &'bound device::Device<Bound> {
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
@@ -210,7 +218,7 @@ impl<T: LedOps> Adapter<T> {
 }
 
 #[pinned_drop]
-impl<'bound, T: LedOps + 'bound> PinnedDrop for Device<'bound, T> {
+impl<'bound, T: LedOps<Mode = Normal> + 'bound> PinnedDrop for Device<'bound, T> {
     fn drop(self: Pin<&mut Self>) {
         let raw = self.classdev.get();
         // SAFETY: The existence of `self` guarantees that `self.classdev.get()` is a pointer to a

-- 
2.54.0



