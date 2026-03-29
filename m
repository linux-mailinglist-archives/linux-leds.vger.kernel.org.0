Return-Path: <linux-leds+bounces-7578-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM7zIIppyWnqxwUAu9opvQ
	(envelope-from <linux-leds+bounces-7578-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 20:03:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A31353843
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 20:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68DE6302796E
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 18:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546D838758C;
	Sun, 29 Mar 2026 18:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDyEDx6g"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1537E387345;
	Sun, 29 Mar 2026 18:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774807361; cv=none; b=QbVVhA9WoYdL/woF4ZY348gcyiXISIFhZfgxmAnTyZnJJl1MMgOVaPrx5D7ODqBzRs37RCcbx7jHLQd8m1SrAuNN/u+nelqzvQXxOS5NRzkyXeeHHTMOLpm6teu09K7ga3yAt1u2foX+gkmvw2npKBXGxNbZgC3lQerS6n2MF1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774807361; c=relaxed/simple;
	bh=FJhC27+7zeXo83uPgrYf71tU8fzeZWxPfJuQirmjthA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FdnBfibrOv+IRYkBGJ1EuWhVnw+lWyPimrAs3p0hjZttfYF1tpsv/BOEJBiggUfzhYB9gwy/je59uOu7Hp1GC0t9lg1V64k5Z0GckGMOyj4Ma42d1Rw0gycUcN6EehqHkg5CQWxWndA3xqg6SZmYQIsalqucoZnGtsEd0PDrblA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDyEDx6g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93DE1C2BCB2;
	Sun, 29 Mar 2026 18:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774807360;
	bh=FJhC27+7zeXo83uPgrYf71tU8fzeZWxPfJuQirmjthA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VDyEDx6gwxhqYOjuDddQZYEe2HcnYWgXwryfk/pwFuHIpU2e0an2WXC3PMcBaXilk
	 8oZldrp43Qbg3BaZaJavhip72k8p6kKf6cj/1dHaiSqbOxmLv2lUBuB5/dwBtgpaYU
	 k1yG0ZLJ3adsTyfaCuFIglJODiu1joz/1PZ/WSQ4WzJxnZhqMSz6GEQR3hSgZ/NrMP
	 fY/GTEKJbEreqnbe1f65EJ28Ryj4dBF812/87zkuG7cI/hckyljOFvPmPTKFqp+c5S
	 3Nc5dIa0dYHcdl8qHFSBNR2TVnoZMFC+vnvGInUndzXkozStM3B2Mr/8c4ZLCnWsNX
	 nHkWY35A2Id0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A2DF3D60E;
	Sun, 29 Mar 2026 18:02:40 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Sun, 29 Mar 2026 20:02:17 +0200
Subject: [PATCH v5 3/4] rust: add visibility to of_device_table macro
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-synology_microp_initial-v5-3-27cb80bdf591@posteo.de>
References: <20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de>
In-Reply-To: <20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=iV2l67bhv+wCuyTeTqB9BVUr9sNOMqsg1qsymLG7EsM=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBpyWk80jz8hwYduy2NVO16Nw+QmCcnfOUz4un+D
 flz7346mdyJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaclpPBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9L1IhAAmOHqW05kUkziFxXtscbD5JGUieX/6Xe
 ONLSKTl/BtzYFwSZZOnvkhewlw5jN/37XUDGkFdu8ol6LY8XRd5hff+AV3JpM0oclvwbMOQABRc
 4gi67cvMB8iOGnIRN1/YcJl4NLbbyfYkugxE7CSF8wwnhRdOTzK7lyBLVPQUMg7OUpcijlEn92w
 85BW3OVkrRd19axOEFPR+Rkj0fOncuHqXiE5LWxmhrVJV5FPB/ylysA2sWHzZ9Y93ozYaF00iIX
 0Lbjeg8TkNnqesjS6D104WW7rBSMeV40f5cQr+RWqid3jDvc0h20sM0Aj73FDG+C5pwgI/DIaIV
 T+joE6ZUQb+GaVBLRjBlxmYk/rDzfQYuS6qhLd/DFq15Qd9S6V++H4kUJfTl0dZLfzAgmJpJE0y
 saDHowfRam5yf2gSWRPbnYOL0PNDaivmi6ppJG4sdcb7OlHiYTJ83meAJTfoIYY8gu8h2sKwH3p
 jtfjoOj11bGwZMQubldnHPl10SyA6ABxrqB2RzX2CzV7BLEvWxOgenRXq0uXeVXaF8Gikp+AwRL
 qsqVm8hkZpDXLiQIUK+ShWyZlibpj34PM2u7xg5x0MPOEcYmcta2rfgrZX2NuxipHvJtabHUEeN
 OCJE7QzLwafk3BsbFSqdnzgFvEXMeDIkZhQBggpkMJmKaNoV9hzk=
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
	TAGGED_FROM(0.00)[bounces-7578-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,posteo.de:replyto,posteo.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D1A31353843
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Markus Probst <markus.probst@posteo.de>

Add visibility argument to macro to allow defining an of device table in
a different module than the driver, which can improve readability.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 rust/kernel/of.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
index 58b20c367f99..a0de98a23416 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -53,8 +53,9 @@ pub const fn new(compatible: &'static CStr) -> Self {
 /// Create an OF `IdTable` with an "alias" for modpost.
 #[macro_export]
 macro_rules! of_device_table {
-    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $table_data: expr) => {
-        const $table_name: $crate::device_id::IdArray<
+    ($table_vis:vis $table_name:ident, $module_table_name:ident, $id_info_type: ty,
+        $table_data: expr) => {
+        $table_vis const $table_name: $crate::device_id::IdArray<
             $crate::of::DeviceId,
             $id_info_type,
             { $table_data.len() },

-- 
2.52.0



