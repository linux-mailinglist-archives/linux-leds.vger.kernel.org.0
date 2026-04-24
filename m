Return-Path: <linux-leds+bounces-7840-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCudG7Bg62kCMAAAu9opvQ
	(envelope-from <linux-leds+bounces-7840-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 14:23:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E112345E5F7
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 14:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B80273024522
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 12:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091123BD641;
	Fri, 24 Apr 2026 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="nJGFjK6z"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A403C9EF8
	for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2026 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033367; cv=none; b=OuSWTOgky6gRO1EXdnTIclyLW1eq2r9g3tpQjgAg4Hp1V23I1oYzTSbuEM71tWRDFXBJ67ybIC9+9P5lC5zw7/Wr9bOjrLEWIJunyer5e+NVKUB7ESevjNR3/8ygCF7dAeuHKwqhTaITa6cbLF5/qb6A/ErCOzSj/u+q+UiA37Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033367; c=relaxed/simple;
	bh=JksoEsoW9NpwFt/9TFUwhxbmhYY2ls4unLAq3UAwiCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HgTXt3TKYl/cfQWIEIGShmnWisf2wCkQ3YcuV6Mh+Nj0z2CVJxmtWBIow09guVETWD9rc1TCmMZg4uR2btMEwIavANBv421AxDY+rS0I0H2vRK2Sk+hJH8ru/e/qiylp4dUibFdU/ZmilHuvKLuzAVdw2+j479WUSJujPpGLrhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=nJGFjK6z; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 0EB29240029
	for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2026 14:22:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1777033361; bh=02hx51gcaGFMhc9PB2acCjq1bdgwDVIf+U6cn40o0WE=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=nJGFjK6zsKFjVNkrgISg5eS/J9YRuXR+ebiYm4nalZD+qsMos41hTg3SAdTH+eNH7
	 4VcisG9zPtY6Norn51t8vpSAhzcuB8dqrQooQArhCGrUBF09VbOCzo1Yv28byTxgJZ
	 EVJjItgUF3cBTZodlEF7y0Y8HGY7KToDnWMtc7PFPBeGCtD0QL0RkVxgU416e5rfIb
	 CHF0mh65WCJCem26jLrXmtpdMNTtL6eN1Yi57axchEUm+TSV+pgqnRRfrn35X4w/fv
	 /dKdY/O1DDuIBJ6fjWD1MiZ64DWYAtuR2QtzAQg9hc3L1e6S1nrjLpsBq33J26UAtI
	 TorPftC9q6Y/A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g2BtQ0scSz9rxK;
	Fri, 24 Apr 2026 14:22:38 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Date: Fri, 24 Apr 2026 12:22:40 +0000
Subject: [PATCH v10 1/2] dt-bindings: embedded-controller: Add synology
 microp devices
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-synology_microp_initial-v10-1-e852d2f3eba1@posteo.de>
References: <20260424-synology_microp_initial-v10-0-e852d2f3eba1@posteo.de>
In-Reply-To: <20260424-synology_microp_initial-v10-0-e852d2f3eba1@posteo.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4006;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=JksoEsoW9NpwFt/9TFUwhxbmhYY2ls4unLAq3UAwiCE=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBp62CKw4Wx7PRgsn9u9fV3pKcSp9G0uyiUXDrTt
 sVYTYWQQe6JAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaetgihsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9Im6hAAkWgwJ+xJU6dGh/Vqh1tz/wV1uLmbvko
 PqwPYDDieRJE3107N1igKQc/Z4u4bLDDoTArtLwE30XLxm/Fe1jNszsUHIy3O9T/hs94EnC/4Nx
 exxsmnFQP+iezS3bjgtnsyKFRaEyNBOGgwPZDswoaHqxcrw7lo6tbttHprqbESAniE9ZZ7JkAso
 lijB75gt58ZdSM2VoCAY3cdk/A7nXpwznlQj+0/TrgvJ+N4IXcAK8HFWK3a+ySeK0FBwkn5XFUM
 cnALwGjckkGgXyT92o+muEUE9sSyUYtVLoKERO6dvldxU02rFCOzC6MprW6zpfAQOznN1J2rpbr
 fLS1EpeTQRCAeSetiooaP06shDLVwxlxYx19moCZ4Na8dE3wjfu7EQD8dmclhc7mjsmeBvywXNu
 hiyCSbIF/dn+co5tQz8Em1c2Tx0XM+TJ8lRfvCFRNXGEFpk5vACbiBjiRCw0cmZxXSHzRmxWEet
 e47QvaJJhPXX/hsssvMoDIbhLN6CFKUUL3YFtrum+7t1AM4cS5o3FI82HSWiPWzXlhuUE4rxo0n
 JCGnHFciHCJ8suSC13FkI4Ir7uy8GPj7a3GtzkkMCHaMkAcYVS7sEVSSJzXkq0f6SZ0r8KoqMHo
 RyKNNS9wiZdaLM1yncLCR6unbSqM4FonD5k5Kg2YkV7f7be3D/ew=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Queue-Id: E112345E5F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7840-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[posteo.de:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

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


