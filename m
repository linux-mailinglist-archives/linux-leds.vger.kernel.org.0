Return-Path: <linux-leds+bounces-7857-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEKWKI2o72mpDgEAu9opvQ
	(envelope-from <linux-leds+bounces-7857-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2026 20:18:53 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 504FB478668
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2026 20:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B6BC306FD94
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2026 18:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C556B3E8C74;
	Mon, 27 Apr 2026 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPwFJUpH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA1E3DD50D;
	Mon, 27 Apr 2026 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777313563; cv=none; b=Id/8gf1MAhXxop7PgRRD6i6GcQMkALz0IFka30uJ8x60dmZJpJlybXw4qns6QtIe+JAzPNLHC2gImmWY2lGGI2pGQzrpltO7e+jkevaZkksNcWnARsLlEJVipJD9Y12wSxxIW8sNUXkxJj68prVgTi1c+nQJNMJt9SMNCamABik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777313563; c=relaxed/simple;
	bh=44NA6rUhVair067G7uXMUjokLii9afZLzuTWi8578y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=epuNFVMAyHkWzlHwei7B+jtqIKOg2Z6KzZeK/C40l4J/4FhyrrfkSy5EJGpJlqPqCfyIMubti5UoeEEaTT9fCoU8I13kV43UEV3AlDyBPNhfEx0fDlM9fA8+7T6QhgSB7ChRDeXWbnnpI6EUpNtS8+8SmfELniIA3p58qnK8xC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPwFJUpH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 760CDC2BCB5;
	Mon, 27 Apr 2026 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777313563;
	bh=44NA6rUhVair067G7uXMUjokLii9afZLzuTWi8578y8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IPwFJUpHhJVa+QZ3bq+hmmzQmXNChGLYPtCdZ8jfzRZvdj9BsSBbqzsTfWS+UNH32
	 vgLxp+7WkWpH0QTM2asH1Glt2ksLAXcNibnR4ZCThU7ZaMUngwpCiXNdcHcJRmXbpt
	 E0wbqbNHKxh0cio5ti0cctIW7wMKlf7oEbq3Vil4/CT/P6DHz8jGQG+tS/YsBeAEwE
	 b+6PcpGihsrSkRQqXFjjl3ytFt5BEMP5EQTMb7vV8PUOR2u2UZfKkY/vNirTk5UGlU
	 d/6O3EpnqF8T1uN+hxTy/dBpxThqhkjWfyZQhWG3Re6n9LR19AgFubm980UaHu8UTL
	 xzt3mPFPvwQ/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6441DFF8860;
	Mon, 27 Apr 2026 18:12:43 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Mon, 27 Apr 2026 20:12:39 +0200
Subject: [PATCH v11 1/2] dt-bindings: embedded-controller: Add synology
 microp devices
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-synology_microp_initial-v11-1-9c1bd5a6f3ed@posteo.de>
References: <20260427-synology_microp_initial-v11-0-9c1bd5a6f3ed@posteo.de>
In-Reply-To: <20260427-synology_microp_initial-v11-0-9c1bd5a6f3ed@posteo.de>
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
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4079;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=alrwaULuLrijlaEQo59qC6IZr7fepf0GBhjIrFXTxGk=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBp76cZgaw/kugHrB+H9nhX/zUS5elOTE6Lrh3Ex
 v28+PbVvBCJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCae+nGRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9JGMxAAs24Bm6w/nmdxqdqRPBk/mWmdsuf6gl0
 gKHUoBw4ljA8Sjfl5QRdGm1jZtYWJiO/q9+99E7e6PhYDFnM0T6q8YVWD74yZlVwi7GYMhFm4Tg
 6eHxDv/iFSWKD/cBHx7UcwVjEhKh/BUGCVnqQZOPgvSmdqL5Pm7JDYa2GMjdJAa+t502dOpnCD9
 4gQiW1spOM4TkIWtt9CluZEHcdCyBSm26eyUA+xGxYnXiL5r3C1Xqwsn6uaFay2/thjbWGHlcGq
 iF8/0mUiQTkgsE3RQOWNAaRoE1d1oGl1YZXF3SyGfzmiMxJBUGFqxt/CzzLbp7vUi8NtAOdBrY0
 YQPxduxut5Zd7t2vFi/LVFedVT1Mm9kzQ4xkFYV2lr9ocGWSB5NEhl7UlpDQT7eLodQdKSdSL1K
 cddKu6zHENEnCA9qOF5eSSC1OCCAhJI7kZXVuFoahh+bUS77iZngfAp46yMx9dvsKXpaN+dKs1q
 LOFjL4YRFEpr1ZtRVCTmRNW3Y2+Y3n0Q3CcrgtIri8gn/2juOWpKlxQ3v344mYrZvgctYsBZSr9
 RswLBbC2utrGD1az1/UJbUuuxeg+6jKmKinXAdUNMRnA4+DIRbrg6FsvgNAbqkqGEgkpExBwUrv
 7ZT3TzrdgChocaUcs0r9SwDZWF4WXnzGLtf454KIH4i/uzXbFs90=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
X-Endpoint-Received: by B4 Relay for markus.probst@posteo.de/default with
 auth_id=680
X-Original-From: Markus Probst <markus.probst@posteo.de>
Reply-To: markus.probst@posteo.de
X-Rspamd-Queue-Id: 504FB478668
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-7857-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,posteo.de:replyto,posteo.de:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 .../synology,ds918p-microp.yaml                    | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/synology,ds918p-microp.yaml b/Documentation/devicetree/bindings/embedded-controller/synology,ds918p-microp.yaml
new file mode 100644
index 000000000000..eb1c9d3fac07
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds918p-microp.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/synology,ds918p-microp.yaml#
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
+    oneOf:
+      - items:
+          - enum:
+              - synology,ds1221rpp-microp
+              - synology,rs822p-microp
+              - synology,rs422p-microp
+          - const: synology,rs1221p-microp
+
+      - items:
+          - const: synology,ds1825p-microp
+          - const: synology,ds1823xsp-microp
+
+      - items:
+          - enum:
+              - synology,ds725p-microp
+              - synology,ds225p-microp
+              - synology,ds723p-microp
+              - synology,ds710p-microp
+          - const: synology,ds214play-microp
+
+      - items:
+          - enum:
+              - synology,ds425p-microp
+              - synology,ds1525p-microp
+              - synology,ds925p-microp
+              - synology,ds923p-microp
+              - synology,ds1522p-microp
+              - synology,ds1010p-microp
+              - synology,ds411p-microp
+          - const: synology,ds918p-microp
+
+      - items:
+          - enum:
+              - synology,ds124-microp
+              - synology,ds223j-microp
+              - synology,ds223-microp
+          - const: synology,ds118-microp
+
+      - enum:
+          - synology,ds118-microp
+          - synology,ds1823xsp-microp
+          - synology,rs1221p-microp
+          - synology,ds918p-microp
+          - synology,ds214play-microp
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
+              - synology,ds918p-microp
+              - synology,rs422p-microp
+    then:
+      required:
+        - fan-failure-gpios
+    else:
+      properties:
+        fan-failure-gpios: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    embedded-controller {
+      compatible = "synology,ds923p-microp", "synology,ds918p-microp";
+
+      fan-failure-gpios = <&gpio 68 GPIO_ACTIVE_HIGH>, <&gpio 69 GPIO_ACTIVE_HIGH>;
+    };

-- 
2.53.0



