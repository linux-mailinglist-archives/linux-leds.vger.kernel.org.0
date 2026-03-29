Return-Path: <linux-leds+bounces-7574-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEPWHE9pyWnqxwUAu9opvQ
	(envelope-from <linux-leds+bounces-7574-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 20:02:55 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BF53537CC
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 20:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16DBC300E738
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 18:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D489537AA81;
	Sun, 29 Mar 2026 18:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ob9ACM1V"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD0A262A6;
	Sun, 29 Mar 2026 18:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774807360; cv=none; b=BLw/xelGRgF8YJOmma0tuT4O1TMo912E7qimmQe+3xkswsP8fIashiwDp0+aPSkHWiV3+LWnPe+KaRmi5AavVknW3VZyFq/1MsmNlCEB1EeJvuKjKr0nMNWnFiLbxupwULodiBbHlr1/M4r7Sx+7qNn6PlfxZvT5vcPuGsKaMo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774807360; c=relaxed/simple;
	bh=KQLMbeg4QKqADBpszyEzpxFyxsA9Ac3jxbOP4uoc5Y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CX1z+ofibYoLBzh8lXqEK4b3r9gsGiQjtvDrv4p1Pl8t7A2xXTyuCPEuugSVG0EoZHrihpVy5pX4WfPw0P5GmRCqqeFFFr+FJhmEvlJ36zHfCLLsVI72mfjL77nM4tdMP0Gvkl6hvafW3uS9pAJAJ+0yAQOH5+VtcyZYqSp6Fgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ob9ACM1V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59879C19424;
	Sun, 29 Mar 2026 18:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774807360;
	bh=KQLMbeg4QKqADBpszyEzpxFyxsA9Ac3jxbOP4uoc5Y8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ob9ACM1Vt+/wakNGNDH0pR4HUEX+fPwSanH6rvYONZoZx0QWAcSCa0jgSpG0Gpv7Q
	 vFYU+cqhYQS58iquT9D/PJPWY1+PxQubE1yYv85MXKyFLqHM/+ZpsLQ93CxUciLSoz
	 O/BDgesGTccaxadgUQlhSKU8N1/VzM6FX9E6niszqm3dxxihIsD62Fp5q+G/OGKiZ5
	 CeuqVMdIkizO6tZQnUYs61WEr1iCi33vHvUzp0LJicxZ3FCji+6Mdu1BbNZQWEJCO6
	 Y08ObhHn+73FsJ+6Ua2JZ9htShkF+5Pwo12lPUkY5DzFMcOlwDExgJ/1JPC34QocgS
	 NpLHaZITwTpYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E50F3D61C;
	Sun, 29 Mar 2026 18:02:40 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Sun, 29 Mar 2026 20:02:15 +0200
Subject: [PATCH v5 1/4] dt-bindings: embedded-controller: Add synology
 microp devices
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-synology_microp_initial-v5-1-27cb80bdf591@posteo.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2847;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=LjFpIfANTZFo1+4IPCHrW+YIb3KmnE+ivKHsB6gln08=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBpyWk57cnwGnzCYU7bX9FQiaKM/eXTH6tO9Tsvs
 8PqY3PJRquJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaclpORsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9IgDA/+MkrrYxXzol9wLHQzbRjvpCsg6A/6Hn6
 H0AoQgev00ZuBP8o5HPBJW2wL0BSIZ8hEg/hIxrGg/vxBYMKHz90cfSGPjF3tyqVJw7tf1wlcwP
 bNRykHuuxTXqNeQ+vtEhLD5oa/y4pbwkDoTFmGfRxCmPpj3h/5iEo4k6yOVRA+toNg63jEtMCzJ
 Hm9aq4s6vaWN/X9Hf4+1jdJi4PUZN4gozqI3iqp1zLIuFKx2S/M5wrlTp9whdBqunWSDYYgcyZ5
 RoZ/kNYb+049oFVOHCwX46k1+J7C3s58MemHgWiIO0JL0t2y45exFk4ozUVw94/68rEd2gq4yZ3
 ZAAN4RyhqCBQRgUeQREp3CA1W++fodZZvkfV9H7Wy7d+q82wvmLmM8LA1X2Q+zyOmw3RmuXMYs9
 /APKwzC5fDHFOHpsmIPsEIqVwdPldK1Ks//Pk/hbtNso3D7lsMOr4oZqNzdZX5JragSPj7xQU0d
 ITPdapX3ODn4R/yTCsVvEKra7yBbBPTXOA2NtaDri54URNPhMOWMdQiouADGMCksBjS9sGKM//W
 PtWNKFQh2n+d4kBn3+0rL6epwa7Ut344MIYHN1fxtSfZS2QPtDTw6hS88OcFQU93DvwEo5R28h/
 BAKU8Sbn74AVHk0n0D6UHZuBbWlKJVvWckYrJ7+xj86jWoINbFt0=
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
	TAGGED_FROM(0.00)[bounces-7574-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	HAS_REPLYTO(0.00)[markus.probst@posteo.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,posteo.de:email,posteo.de:replyto,posteo.de:mid,devicetree.org:url]
X-Rspamd-Queue-Id: 18BF53537CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Markus Probst <markus.probst@posteo.de>

Add the Synology Microp devicetree bindings. Those devices are
microcontrollers found on Synology NAS devices. They are connected to a
serial port on the host device.

Those devices are used to control certain LEDs, fan speeds, a beeper, to
handle buttons, fan failures and to properly shutdown and reboot the
device.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 .../synology,ds923p-microp.yaml                    | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/synology,ds923p-microp.yaml b/Documentation/devicetree/bindings/embedded-controller/synology,ds923p-microp.yaml
new file mode 100644
index 000000000000..599d32ce2be9
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds923p-microp.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/synology,ds923p-microp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synology NAS on-board Microcontroller
+
+maintainers:
+  - Markus Probst <markus.probst@posteo.de>
+
+description: |
+  Synology Microp is a microcontroller found in Synology NAS devices.
+  It is connected to a serial port on the host device.
+
+  It is necessary to properly shutdown and reboot the NAS device and
+  provides additional functionality such as led control, fan speed control,
+  a beeper and buttons on the NAS device.
+
+properties:
+  compatible:
+    enum:
+      - synology,ds923p-microp
+      - synology,ds918p-microp
+      - synology,ds214play-microp
+      - synology,ds225p-microp
+      - synology,ds425p-microp
+      - synology,ds710p-microp
+      - synology,ds1010p-microp
+      - synology,ds723p-microp
+      - synology,ds1522p-microp
+      - synology,rs422p-microp
+      - synology,ds725p-microp
+      - synology,ds118-microp
+      - synology,ds124-microp
+      - synology,ds223-microp
+      - synology,ds223j-microp
+      - synology,ds1823xsp-microp
+      - synology,rs822p-microp
+      - synology,rs1221p-microp
+      - synology,rs1221rpp-microp
+      - synology,ds925p-microp
+      - synology,ds1525p-microp
+      - synology,ds1825p-microp
+
+  fan-failure-gpios:
+    description: GPIOs needed to determine which fans stopped working on a fan failure event.
+    minItems: 2
+    maxItems: 3
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    embedded-controller {
+      compatible = "synology,ds923p-microp";
+
+      fan-failure-gpios = <&gpio 68 GPIO_ACTIVE_HIGH>, <&gpio 69 GPIO_ACTIVE_HIGH>;
+    };

-- 
2.52.0



