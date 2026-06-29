Return-Path: <linux-leds+bounces-8792-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +2IqBnOjQmpc/AkAu9opvQ
	(envelope-from <linux-leds+bounces-8792-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 18:55:15 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5096DD89F
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 18:55:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=posteo.de header.s=2017 header.b=RjcdWIaa;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8792-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8792-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=posteo.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDBA53037BE6
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 16:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8D24657DA;
	Mon, 29 Jun 2026 16:52:18 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DA7466B4C
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 16:52:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751938; cv=none; b=bdxQNQO4yYxzO7mEXthbbL1YIFYciTjs7gWkirwBJ7Ret5HhXVADBLoHKcbNLhI3MbStGvTKGYaNPZ09I7FQMf6e31wPaiDKNu9bA5QSDO1G9UzoF7Z2tUf4/xZw44eoNI2rEjn6M/lGAdXh4HczVqC5zgK4oQr9qxm7wDkS/xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751938; c=relaxed/simple;
	bh=g46Kqxx/P6WRmtIVsCJyUECP6qFHfIg4iGW+hmHzmaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jNXK5n78/4rWgxwwevJhbIr/7fa8MTd3m7bF3w7H+WiKax2sctKrTqhms2X25x/9UG7T3LFp/jqZSJEISD76FHkdzQUgWPbNPv618pVS+M0EDRocBHcln8nQushmtQOn7n2Sg9YfMMaet2T+tgRvHxA3OYLJrVemoTAWPQ/Wut8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=RjcdWIaa; arc=none smtp.client-ip=185.67.36.66
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B1456240103
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 18:52:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1782751934; bh=Zp34lZ9jhdymKNwCrxTPsJL1/Mu74Tofy/e/ILy1NDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=RjcdWIaacniWy9HlW6RqVdJFrkE+2eav5/G2N8r5W5r/l9or1RNDOuETxvyafVbS+
	 +ZTnk7OC/c7MkdoVEz8UpL+Lbj/60RXuPz8YzoTMjDcZjHBcgiLDyKXyVPqqnjoVAo
	 +Gdr6iO/La4wyoYOyigsoatp/bTbFSBKc60mWOXI/qIlvhdSp1D1YPa/hH+Vmobf8R
	 QFwaYuuEuk1fax1vzcC1H7HHmUWkm/j0enWOYNMhPD6q4sxzvlky5Frf5zKBl4tSKC
	 /8dAdqj+weCd+McwpicTzkg8hddeYiwk2QQIS4oWnQ4zFNoEXBXNatkIl6rPFfv/Iz
	 DCnXS9H6pksLQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gpskz288Xz6twb;
	Mon, 29 Jun 2026 18:52:11 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Date: Mon, 29 Jun 2026 16:52:13 +0000
Subject: [PATCH v16 1/2] dt-bindings: embedded-controller: Add synology
 microp devices
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-synology_microp_initial-v16-1-601e91c49e0d@posteo.de>
References: <20260629-synology_microp_initial-v16-0-601e91c49e0d@posteo.de>
In-Reply-To: <20260629-synology_microp_initial-v16-0-601e91c49e0d@posteo.de>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4079;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=g46Kqxx/P6WRmtIVsCJyUECP6qFHfIg4iGW+hmHzmaw=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqQqK3YwKbQN+Y2QAajgTXhT9zPih+7iPdbgSmI
 H2jisEAMzSJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCakKitxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9L6bA//dUphwv0vGF1vWbdk6k1e8HN/ty742H2
 JCDefowCZmr4rCEh9vScu7hsBuNLE3vtZgM3zmE7TUeh7xhsAiKynQWZivZekiuJ+eRdvvmZQFW
 X5TFHj3ThOZ9fLIELQjbivkBvdHy9sefsbAlMM8shvk3XynNM5hm5Av+sbQE5vMBRYzC8RhfOZw
 IbB8Nh8QSn77Vq/FNEAmhpyviINkbnIdecf+QaY2/+/9PRGzmFO1o3suq8L27vg/Dkas4MU2/Ty
 Ncd3B9XLsNYhLt+VOybkxWEIZsr9Yb8kt24TyhEH7N2fVQMh2+VUpw/p48k3UI5KxxRcwZygaSC
 V5iWkHYn93DhDXI9hWOHexn21vEq3b/UG3wQRt+yHBrzTcSltglBuKF2z0XWGaTW7Eukum2tKm9
 B7Sy3ZDJGx8W+rzhC9vOZrL0heYwK1YncUFhnM0Jhz9Y/zKMwhkTquzeMJlKkGq8FgM/TTXAGQz
 ynv/+fyyPFNA9Kk84/egUcVa4T90djzsgUDKk6KpVZZYD9hQbtpSywEskoGhWK3TXfTFs01Iau9
 aZ/t8RSZB+kwOrOBGc7iUZ2nLY4HdjzNSdaUFPfTotHB9rEdAW9DuovQZ2X2t7PsiYtKtFfTrhZ
 Zxdg56LG3QCzo0OuRaLhgqMpgRLCG9QuSJ1KIujQoRpIOhHEQtw0=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8792-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,collabora.com,nvidia.com,onurozkan.dev];
	FORGED_SENDER(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:bryan.odonoghue@linaro.org,m:lee@kernel.org,m:pavel@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:gregkh@linuxfoundation.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:platform-driver-x86@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:markus.probst@posteo.de,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[posteo.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,posteo.de:dkim,posteo.de:email,posteo.de:mid,posteo.de:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC5096DD89F

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
index 000000000000..a44101884322
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
+              - synology,rs1221rpp-microp
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


