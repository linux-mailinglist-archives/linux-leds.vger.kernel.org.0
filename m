Return-Path: <linux-leds+bounces-7691-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGIpEnto2mkY2QgAu9opvQ
	(envelope-from <linux-leds+bounces-7691-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 17:27:55 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9813E0A68
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 17:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC89630247C8
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 15:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79EA39184C;
	Sat, 11 Apr 2026 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ngcp0+kE"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797FE36EA99;
	Sat, 11 Apr 2026 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775921269; cv=none; b=FKTeem7gIT6VUfoJFNI4LBeFlrg4s/bg3coT8BK0MVvyXkh9zi/bCF6D4VTjVc8afwl8Krfkl/9OQ+BmVEE3n6s7v4za9dtSLu9JHxFWKtVRw1TVAMYQeR+HX0RQdDIorTglSpuWJnK1ztW54RsJvlZjmhoiOR4az2qYv0ZxImQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775921269; c=relaxed/simple;
	bh=v6OfpwvtwA+/DgzVbjmuBKTzaqYTvEx6D0rNX/X8W78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rar/ADc+KyFtjUp0a5ISnakKSXamGUCiIUCfMTxI04bQiZdU4e0CVc7zIN41kxnOkPtBtm6ONaaLGtdl0ZLXBzcZAG8/vMSkyiFsFFSFHKg2kLrkuAX7epxMAzlC09wlPxKfZRDJmMVZ3O31MdRr40rWcfmcACBEWYNPVMlh2HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ngcp0+kE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26960C2BCAF;
	Sat, 11 Apr 2026 15:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775921269;
	bh=v6OfpwvtwA+/DgzVbjmuBKTzaqYTvEx6D0rNX/X8W78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ngcp0+kEmrUfl0vPb1iVNDEldDbFhipdNUTz9dPmeQs+Sc2KvuYiC7IJfS25q/RPt
	 nxvW1oaiBLBtaeiyNbnVwvc56pfxd2JgLysdE/zqI3vcA9uXz1GNyHNZ40ZoL2i8oy
	 UUWx9HA9Oqc+rDFU1ctoyCeQTwWlgm9tBL84gwL0WpY9KoM2ONQeHImeDyrFEfv0PI
	 5Y+hHhi3rZETCfUly0XMsOKs/kdWkVX6X9bZcl3sIRyiqA7rP1kt1A/lB3JhrpZ+Td
	 0c2EPcVjRC8yLj8AxUB5H97dA37sTWVZCnml0RcakrHYqw8JlqJwBcf8MTcS4UL+Wq
	 U2mCZG+ZBo4SQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17594F3ED50;
	Sat, 11 Apr 2026 15:27:49 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Sat, 11 Apr 2026 17:27:35 +0200
Subject: [PATCH v7 2/2] dt-bindings: embedded-controller: Add synology
 microp devices
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-synology_microp_initial-v7-2-9a3a094e763a@posteo.de>
References: <20260411-synology_microp_initial-v7-0-9a3a094e763a@posteo.de>
In-Reply-To: <20260411-synology_microp_initial-v7-0-9a3a094e763a@posteo.de>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4380;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=O5PcQocls9jYPOmJQIMpn3kj6x8hmmTQ60bjbG9C8SQ=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBp2mhzxH9NkOyGTHpenRnUbDClbZNHWppOsYbh4
 yvMcG2JECGJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCadpocxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9JZwg//fMkjG/j8LsBVgWYd5pEPkpVrI0q8Vnm
 rU6R/wI2qssEwy4tBISYC9lO+5ZKfHUED8BmwZGj8CpvSCS/JjYWs5Vb7auOgrLxRsbsF/KG+Nx
 JiSE0Wmzj/7QUYlE5qc4XNwcdQJ5QupdNYkxsAxpZXE60/k+XzHmLIjSh2kBV1dBkrTdKj4wVLN
 LTnW/Lrj40tAzJ6H1n11SKJPzxL7o0kCI0+4hFyDQl1KvOvKl4T1u9u5BYD/9VKu6nlkq2JGQkr
 W3jAmOvk2kJXbu2e9n3kUg4GpEE27YPp4X5s5pH8wozH/b5S5wQena42IIqp0QBqU8jBdPIe/Gu
 H75esXbL9jnSXz9HCisenm9A/Ig4QJovgTj4Y9qNXfFC5CxManD8bmdEOhui8nKflkV5j4k2apR
 aR+pnClCc+g3Xahxa+RSG9QLq0UOPqLY7RYq9iJOZVJ4jbdqGCgqzzIXpjGOY3f0v3yPeJvu8Ci
 QsxlSk9QmUP2uaDKJxRHvPNXYiw1RhP+pKtW1bKf2+K0n0iquLkEc94sshvzziBaebdRKXk+rZL
 XxO8lmZXLCou+sKdITbmoMi16835NkkwaPNnRfR2Kpi/GBDU8sRjjVY1H8HbiQRe39lzreifoY6
 8Wj+Ye+T36d9poNJTpuK1WZgs9B/W2hPZmgQGoQ3iUfYYe3FdVKA=
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
	TAGGED_FROM(0.00)[bounces-7691-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,posteo.de:email,posteo.de:replyto,posteo.de:mid,devicetree.org:url]
X-Rspamd-Queue-Id: 8D9813E0A68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Markus Probst <markus.probst@posteo.de>

Add the Synology Microp devicetree bindings. Those devices are
microcontrollers found on Synology NAS devices. They are connected to a
serial port on the host device.

Those devices are used to control certain LEDs, fan speeds, a beeper, to
handle buttons, fan failures and to properly shutdown and reboot the
device.

The device has a different feature set depending on the Synology NAS
model, like having different number of fans, buttons and leds. Depending
on the architecture of the model, they also need a different system
shutdown behaviour.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 .../synology,ds923p-microp.yaml                    | 92 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 93 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/synology,ds923p-microp.yaml b/Documentation/devicetree/bindings/embedded-controller/synology,ds923p-microp.yaml
new file mode 100644
index 000000000000..0a8fb1d8f314
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds923p-microp.yaml
@@ -0,0 +1,92 @@
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
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - synology,ds214play-microp
+              - synology,ds225p-microp
+              - synology,ds710p-microp
+              - synology,ds723p-microp
+              - synology,ds725p-microp
+              - synology,ds118-microp
+              - synology,ds124-microp
+              - synology,ds223-microp
+              - synology,ds223j-microp
+              - synology,ds1823xsp-microp
+              - synology,rs822p-microp
+              - synology,rs1221p-microp
+              - synology,rs1221rpp-microp
+              - synology,ds1825p-microp
+    then:
+      properties:
+        fan-failure-gpios: false
+    else:
+      required:
+        - fan-failure-gpios
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 78c99d831431..72075c9a2016 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25557,6 +25557,7 @@ F:	include/uapi/linux/sync_file.h
 SYNOLOGY MICROP DRIVER
 M:	Markus Probst <markus.probst@posteo.de>
 S:	Maintained
+F:	Documentation/devicetree/bindings/embedded-controller/synology,ds923p-microp.yaml
 F:	drivers/platform/synology_microp/
 
 SYNOPSYS ARC ARCHITECTURE

-- 
2.52.0



