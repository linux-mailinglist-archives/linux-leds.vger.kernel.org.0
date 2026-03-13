Return-Path: <linux-leds+bounces-7332-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKoBFsxftGmKmgAAu9opvQ
	(envelope-from <linux-leds+bounces-7332-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 20:04:44 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD61D289155
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 20:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE36831C029D
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 19:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73733E0C40;
	Fri, 13 Mar 2026 19:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGoB1gTC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB712DF12F;
	Fri, 13 Mar 2026 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773428609; cv=none; b=Eti2YmGyEVFKlhutBwZEmZszlp2I5/IJGEaleCuU99PJmep1ezAT9h+TliUQtjugqG0f/Ych0HuMhCEbp08+gXNnnzW3ZDPWu/Y98/SArBkybo+5mJssy4ME2AbocxcA6D7AA0aXzKPNdx4D5PJGIY7lIO4ccounc/m+1eouBkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773428609; c=relaxed/simple;
	bh=Jx7UrUTas1KVn/N4PI1g4X8WSfQKM/+cArejjQk62XM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=URvK54FmBLhY5BlpIqQ6Tw2h9pS7zfOgFvEC/BR/NxGazJsE8POadZQqsck6lW+6iMUKIUi9mEin2YHPH3eCu9KsMdqZMkDN0azl4BIrFL7fqFbloiI5W0DUg1k2w79moVHzmBnOtjhR5ghjlhTLiwGa6Td+8XIml/cf3Ai4s2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGoB1gTC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BE56C2BCB4;
	Fri, 13 Mar 2026 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773428608;
	bh=Jx7UrUTas1KVn/N4PI1g4X8WSfQKM/+cArejjQk62XM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hGoB1gTCzNofnwtvKWS4UPRREqrNBAStY344sOOB2vOb0N46Rk5CguD9Iuy8d6X6x
	 GQll9c+1BxFq97mTrp15I2NiSTnFEQ5FtwNqxT+TEnBigxFaCQqXSCJs2xBw6pMz0G
	 ODLtZmU6S47bRHLus0q2VazCDEbPuJyceZWuLlP69e+KYFh0BCqP0PlmK051dHWFRG
	 zdMNHioNSFfWJN9oqHW/DNdIDPkR5A7jBwuK1kqKP8P1zZ6MCS0y05ffhoAZX0Zvj4
	 7ibcUMDC4ehENvrMwCrTS3WCWxhb0iMn1L6t+SA/0Tn296sRmdsdPvXo41zoBOKT7L
	 jOsYBVFHPfZBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824AE107BCDF;
	Fri, 13 Mar 2026 19:03:28 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Fri, 13 Mar 2026 20:03:09 +0100
Subject: [PATCH v3 5/7] dt-bindings: mfd: Add synology,microp device
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-synology_microp_initial-v3-5-ad6ac463a201@posteo.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3421;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=BWCjYQBHaSfDWg8Gx+1WSTdoVU+3MjA/rzyHsPChX7o=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBptF95QKk57C5wGYpOrgF+665YuLzVFk9/o6152
 RHv7L3t4L+JAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCabRfeRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9LkWQ/+I5FvYw6cc5ThLEBTFpIlGUb3vXxj0s5
 CMgyALXltBdsVCG2cfRtMB29vkjz+PvR6DyghJpfPk8T8gO6XZWmqEh4op9aX4e535Hz4UIEITw
 HMU2whDV/W88fVa9PFICGUOZPSqs44t5Mp3Hwb0OFeOyUdXZine/3B7uPy6X8zCzgj5aGklO8z9
 olqCaoOR98NeWTlu+MP1jj6nPeG6scgII52M7pmsb2cSV3AX2sNmJPvq6f4nHE5t1F9ILwNDM70
 VLBbMCsZeM75Lbq1bhGiHw78C+zeVv0Qov4JQuajcVwFSVVsa8zi9kEpP4ZhZo905JDuXvokEGI
 7Ah3Vcu51/8I9yF0ettPL1L8WuRbuIrwSJoyNleb/lA+8TzdyWFMIxL+fUXfH8llWvnj8/S77CF
 Y/YmR2IFxAorinV8vwHyIhf4cCXp7KAu+Ia1MdM6ADMDVIvFHzgNQKKjZQ//iEX6B6vuzi0xrVo
 ad4DSpIcRrN8JlLB3gePGKehcoM5ahQHE4oF18ASh0kq7xsPRGL77wXnHzLAGz+WTUi4I+Q7UnZ
 Z5N4OKW6s5iKcD+Zyp65fNxkAg4wGHOaabS7sEaTjNxROsBlCWF9llL60oYal2Pqb2nMQWXC2ue
 LKVuxQ7jsuxM3+O9Oh3SSF7DNcqCzl3xkbEUt6VOe2GgyXZ3FtG4=
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
	TAGGED_FROM(0.00)[bounces-7332-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	HAS_REPLYTO(0.00)[markus.probst@posteo.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,posteo.de:replyto,posteo.de:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DD61D289155
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
 .../devicetree/bindings/leds/synology,microp.yaml  | 40 +++++++++++++++++
 .../devicetree/bindings/mfd/synology,microp.yaml   | 51 ++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/synology,microp.yaml b/Documentation/devicetree/bindings/leds/synology,microp.yaml
new file mode 100644
index 000000000000..f7bf32c240f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/synology,microp.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/synology,microp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synology NAS on-board Microcontroller LEDs
+
+maintainers:
+  - Markus Probst <markus.probst@posteo.de>
+
+description: |
+  This is part of device tree bindings for Synology NAS on-board
+  Microcontroller.
+
+  This device can manage up to 4 leds in Synology NAS devices:
+  - Power
+  - Status
+  - Alert
+  - USB
+
+  The Power and Status LEDs are available on every Synology NAS model,
+  therefore the associated child nodes are mandatory. If the NAS also has
+  a alert or usb led, the associated child nodes need to be added.
+
+properties:
+  compatible:
+    const: synology,microp-leds
+
+patternProperties:
+  "^(power|status|alert|usb)-led$":
+    $ref: /schemas/leds/common.yaml
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - power-led
+  - status-led
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/synology,microp.yaml b/Documentation/devicetree/bindings/mfd/synology,microp.yaml
new file mode 100644
index 000000000000..57bb986d24f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/synology,microp.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/synology,microp.yaml#
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
+  It is a multifunction device with the following sub modules:
+  - LEDs
+
+properties:
+  compatible:
+    const: synology,microp
+
+  leds:
+    $ref: /schemas/leds/synology,microp.yaml
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    mcu {
+      compatible = "synology,microp";
+
+      leds {
+        compatible = "synology,microp-leds";
+
+        power-led {
+          color = <LED_COLOR_ID_BLUE>;
+          function = LED_FUNCTION_POWER;
+        };
+
+        status-led {
+          color = <LED_COLOR_ID_MULTI>;
+          function = LED_FUNCTION_STATUS;
+        };
+      };
+    };

-- 
2.52.0



