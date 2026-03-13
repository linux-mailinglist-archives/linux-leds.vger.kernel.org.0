Return-Path: <linux-leds+bounces-7327-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJdRJK5ftGmKmgAAu9opvQ
	(envelope-from <linux-leds+bounces-7327-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 20:04:14 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E972890F8
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 20:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 597E8302452B
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 19:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F071344D82;
	Fri, 13 Mar 2026 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ml8zml+G"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ABD3DFC86;
	Fri, 13 Mar 2026 19:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773428608; cv=none; b=SC5urzWvENNY2xFXb9fNGEmmQp0K67zncLUzMgjFPz46dRJQ3z33aPjdmVS6qGO+47VE8BxgW4JtLOhG1mEbz76VBpAR9HlXaSkwrJt1Tn6bShW6Tiu8V/B+wU9oHh3Y3+bQzZF6sxEc52n7FEPElVY2XcxEOYiYkDyWP8N6clE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773428608; c=relaxed/simple;
	bh=GGL+Ge1RluZCju5B3hATUukSaxdXBcAlUPKwu9Gx+8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PfE6kDMNmIMyzxQWQTTI1LHONpc0QXs59mNpc6s8TeNXbbH3dPn+wsCQrRj/4SnMPQ15LLKLGSQk0Bm3PRCvfHF3bKEiKYzCf/0LEmzp6YyNbKrlbp/k3Fv4uAUNIqb/cRnhmjmCuT2krx0LVhTWcS7UU2mjvQIRVWvEBDgtV3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ml8zml+G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DD38C19425;
	Fri, 13 Mar 2026 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773428608;
	bh=GGL+Ge1RluZCju5B3hATUukSaxdXBcAlUPKwu9Gx+8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ml8zml+G6gjTC5/LKMO27/JNzdpp9GdkHBSxF37vNRhgIdu1nz3QdLC6AQtuT6TIg
	 J/tGcgFpFQiex2DxlpzCv7vVnsgE0EDuVBWqZQ+7C6yUNcBy05rvY6zeqRU0E5m/DV
	 i66cPvncqpicjoKr1ozD+nupq849OrJNKdu7IyZsOztsHuj9xnisc64YdEC9T85nhI
	 6bWrjdWpKLLbyJOZr+ecx9XmhedOeHDNTP9PzCzvy+7S74HQtldnF9dG6N4IoQa4so
	 u0rpa1u1SuQo4+gKv3YBNUYm8nihr/MKFBBxYy/fmIb/uY53+Lq52+gAJPam/5IdoL
	 lIwk+Raa8GsGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B520107BCD0;
	Fri, 13 Mar 2026 19:03:28 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Fri, 13 Mar 2026 20:03:05 +0100
Subject: [PATCH v3 1/7] rust: Add `parent_unchecked` function to `Device`
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-synology_microp_initial-v3-1-ad6ac463a201@posteo.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2195;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=HETHM3CRJWMhkQNDAYTp+649XpdPAf3ubTc2qfzj0Cs=;
 b=owEBiAJ3/ZANAwAIATR2H/jnrUPSAcsmYgBptF9xtg7fm3QCPAN84bfAyXYLoytkYJX0Zk1Hy
 ocxzpV75O+JAk4EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCabRfcRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9KYOw/3QgAiL7JIEEzv95AJctnhTBiyqFlBvmt
 2rYNF7VZNwNIed5G49vPESuPgVmNr8Z/SKmK0QDdCrgbdBcGQ232hAi3TZA5+z50m5hZF9MzUfX
 FJsJIqKyynUuiiViozr4rBz1j/OfxU+le1/EvUc3IByZmJyPKfBWlQPBo4UKNZXTVeP7bVP1OQC
 c7UW5Ws0APSe807FqjLTv2H2KyaKod6o/PwtK8xHp3NpCF/3dLcUlL2GNAvk28tw8Sy5dqOTbay
 7OAEZsnYWgVyx9IPv4psnSXNA1naehGefhF/YGSd2eptg9XBYex2+rSPWvkdDy9tn4OM0YDX/3b
 eQFXWugSsZ7H5D32NOVC3b+S6TVFpfiyozUnPWVT5XGnDiY92+FUn5d8flLyF5OfOqXXtVyi7t2
 zhfHnz4w5VUybSv914BmvPsDhGFJgBp9UiZKXQYY+xLPonzOiWNlGq5daufj3u7tvBI5nGUJCLl
 2KAAlo59pXQt3yYBomdV0cGNXb9gWP8T8Aeiu1NC/7KsTImCU+1g88pcyEGCRwRDvDQ1CodcFEy
 xlt0+ejIXt4gMnZVcdRma/+ybL6zuVQZ6NnTm1OpOsswdHLVU7osmsE8C/XgCoGp1lRd61kzgVm
 BWSIIESxX4PNUz1zTxKUwcSLLBF/tZtanQoc/8+gnPqAzJOcm7A==
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
	TAGGED_FROM(0.00)[bounces-7327-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	HAS_REPLYTO(0.00)[markus.probst@posteo.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,posteo.de:replyto,posteo.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E7E972890F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Markus Probst <markus.probst@posteo.de>

This allows mfd sub-devices to access the bus device of their parent.

The existing safe `parent` function has been made public for
consistency.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 rust/kernel/device.rs | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 94e0548e7687..a53fb8a388e8 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -340,8 +340,7 @@ pub(crate) fn as_raw(&self) -> *mut bindings::device {
     }
 
     /// Returns a reference to the parent device, if any.
-    #[cfg_attr(not(CONFIG_AUXILIARY_BUS), expect(dead_code))]
-    pub(crate) fn parent(&self) -> Option<&Device> {
+    pub fn parent(&self) -> Option<&Device> {
         // SAFETY:
         // - By the type invariant `self.as_raw()` is always valid.
         // - The parent device is only ever set at device creation.
@@ -358,6 +357,28 @@ pub(crate) fn parent(&self) -> Option<&Device> {
         }
     }
 
+    /// Returns a reference to the parent device as bus device.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that the device has a parent, that is contained in `T`.
+    pub unsafe fn parent_unchecked<T: AsBusDevice<Ctx>>(&self) -> &T {
+        // SAFETY:
+        // - By the type invariant `self.as_raw()` is always valid.
+        // - The parent device is only ever set at device creation.
+        let parent_raw = unsafe { (*self.as_raw()).parent };
+
+        // SAFETY:
+        // - The safety requirements guarantee that the device has a parent, thus `parent_raw`
+        //   must be a pointer to a valid `struct device`.
+        // - `parent_raw` is valid for the lifetime of `self`, since a `struct device` holds a
+        //   reference count of its parent.
+        let parent = unsafe { Device::from_raw(parent_raw) };
+
+        // SAFETY: The safety requirements guarantee that the parent device is contained in `T`.
+        unsafe { T::from_device(parent) }
+    }
+
     /// Convert a raw C `struct device` pointer to a `&'a Device`.
     ///
     /// # Safety

-- 
2.52.0



