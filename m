Return-Path: <linux-leds+bounces-7892-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nu3ULu7W8GlHaAEAu9opvQ
	(envelope-from <linux-leds+bounces-7892-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 17:49:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE81488368
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 17:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA0E63118158
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 15:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E133BED06;
	Tue, 28 Apr 2026 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBJB1IS0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D76339BFE6
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390612; cv=none; b=hbCspNhA09SS/2P9PdJipmH1Q4FfFEzDUehHsSvAsJjg1q0vyYa6VCHvu2aBpiR83XPaBrOjxXXnouHAcyeNYd0n/PWoUDqgT3TY85DmRXSVHETkzQxnhAXi1lAc64VA+KqqsFM/nrHhIdA+yPLVGrHcPS+BDvP1beqiO5+IvXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390612; c=relaxed/simple;
	bh=nDhbrosT8U/39BZHe42+MYjzH8OaxkXKfQ2Gn3LuRmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXG+Ou1+F61MXtXBmyqQ7cSI+b8nyHaD41M09c0sPJ0iwCZpProhlBm6wGll4Wa7RgAc8Vdau4DjVkK1W9zoiuhun3DwOgvV8hXyOUrRBcsWFnJQ0vqpV7YVE9u8fixxKLjxVi69yFkTLDhrUqTPjQBP5sYXB6gD6VZ+8nv4ghI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBJB1IS0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso89023165e9.2
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 08:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777390598; x=1777995398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HlPZ/CLcCFHkVKEhAtN3foaks/uuE3eD27nJrsbiI4=;
        b=KBJB1IS074zLZwZxyJo5o+ZB/VQjGFTlGvHpNoR4rO6VdQK7AoS+KfefGVaWudbrg+
         3GyEAKGhEC7siSwUJuspp9mh9CBnBE2p/wR7b8xQFbQbowJRYwmPv15/r9rVSRlMLN7X
         7DveYO0lr1fn+zk/6irlEN0WTHdcftBCRL2LhuEVAAIqdgiKCKEn7P/6wqw8OqvOH41O
         s6S7PMSFsCQQNK+96NrMiNQcrvlWGeB1Ove8PiV3jPiSVtoEaDKHWiVPV8KCF30PIeP7
         U6bQ+7AZWLHU6qz85Bed+GOPUEvXZ/BV1h3oXUDJP9XuJbOIy9U3CiAfwMVKV4IJkkj0
         vWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777390598; x=1777995398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1HlPZ/CLcCFHkVKEhAtN3foaks/uuE3eD27nJrsbiI4=;
        b=lWkfUZlP2w9e6XcSBJrTZMop/N9URVcGX1qjS/vtEaYhuaMWZyLYIS9FmpuCLnCWXB
         G8QF5BOpjkpnznoMy6ZiLi//lek8LQrVr4PgTzdft3vPnlbehBlc+Nc5jr6qXh2l2Dlr
         vbXuR2YouyJWZE1+okghAbAT8uVZj8qK3SlNUHJ0QnsspytHElGTgYZy5oWg/C39qRoW
         RT8akL9fPL16Tl1kwDQf0bzrH+XpYTuscDZrMljR6kJj9eacdsmfmsuIw99UChe5POXq
         fa24CES6JQhs0nb0rUsR482BCdNveBYVMkhEU8cFuPReRoPOHRBNT6giM5E/Ap2K1Ity
         8uqw==
X-Forwarded-Encrypted: i=1; AFNElJ81dQQodRZ4h/D3Nr7sbfjCKU14nykgCgo0c0nWUTxHW3dsOzYXhmn0Pa1SBtqLjw/e9AiXZGcCxnjD@vger.kernel.org
X-Gm-Message-State: AOJu0YwrFlZPrJtgWl/cWJf9IOawEiiBMYAXHEde8zXoe5a7KIH6o08F
	bxtOnZBSBd+dDw/0ExRcJrV5mQG1hyhToWk8HJfrOPCeWsBGjzwP22Dt
X-Gm-Gg: AeBDiesygRQNJxiF0PzUzjKD1dDBHRanbV/p491cohwm6zei7ToDMCh+XN+Txsu7oP0
	Ogo6P/CCRrfv2sdx/sNara/+wUmF9esN6FwrO4iAdHYtQ1uCqjMwXfsmnDKXYaGi1aOse4AoQJU
	6l+6lE/cOe2+E68fS/C4VlgbluoPVE1MTJgF9avsej0NACka6ptANuabcIyG9BE1m+K7PQnbVCC
	iexGVLftZkWwKNYAv1oGMGQNk/V0GS3nN0BFuAxkjzz4cmbYCIFF9yt5DlubD62CAfDiNtIpmrY
	UCXfko2NjbAPne2AyCuiFLiYUvniFHoGSdS3q8dAtKAyzOTX94BtgHKR6jCqOuu4jRXGG7mnQfh
	obTc442tVZj68ZJyL3LCrPM5mfly2ArC7r7ZOb3X84ep6h3HPg/fpW9rIYm/L6vxpHWNI/FdREf
	KMyeUapvISmenW67GKvyLWnD0htzb0fORCbQ==
X-Received: by 2002:a05:600c:30d3:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-48a782dbab7mr30596125e9.1.1777390597697;
        Tue, 28 Apr 2026 08:36:37 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b56c2d0sm1358875e9.11.2026.04.28.08.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:36:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 3/6 RESEND] dt-bindings: mfd: motorola-cpcap: convert to DT schema
Date: Tue, 28 Apr 2026 18:36:08 +0300
Message-ID: <20260428153611.142816-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428153611.142816-1-clamor95@gmail.com>
References: <20260428153611.142816-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0FE81488368
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7892-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.997];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.1:email]
X-Spam: Yes

Convert devicetree bindings for the Motorola CPCAP MFD from TXT to YAML.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/mfd/motorola,cpcap.yaml          | 414 ++++++++++++++++++
 .../bindings/mfd/motorola-cpcap.txt           |  78 ----
 2 files changed, 414 insertions(+), 78 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt

diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
new file mode 100644
index 000000000000..7f257f3a1a5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
@@ -0,0 +1,414 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC MFD
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: motorola,cpcap
+      - const: st,6556002
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  spi-max-frequency:
+    maximum: 9600000
+
+  spi-cs-high: true
+  spi-cpol: true
+  spi-cpha: true
+
+  adc:
+    $ref: /schemas/iio/adc/motorola,cpcap-adc.yaml#
+
+  audio-codec:
+    type: object
+    additionalProperties: false
+
+    properties:
+      interrupts:
+        items:
+          - description: headset detect interrupt
+          - description: microphone bias 2 detect interrupt
+
+      interrupt-names:
+        items:
+          - const: hs
+          - const: mb2
+
+      "#sound-dai-cells":
+        const: 1
+
+      VAUDIO-supply:
+        description:
+          Codec power supply, usually VAUDIO regulator of CPCAP.
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: port connected to the Stereo HiFi DAC
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: port connected to the Voice DAC
+
+        required:
+          - port@0
+          - port@1
+
+    required:
+      - interrupts
+      - interrupt-names
+      - "#sound-dai-cells"
+
+  battery:
+    $ref: /schemas/power/supply/cpcap-battery.yaml#
+
+  charger:
+    $ref: /schemas/power/supply/cpcap-charger.yaml#
+
+  key-power:
+    $ref: /schemas/input/motorola,cpcap-pwrbutton.yaml#
+
+  phy:
+    $ref: /schemas/phy/motorola,cpcap-usb-phy.yaml#
+
+  regulator:
+    $ref: /schemas/regulator/motorola,cpcap-regulator.yaml#
+
+  rtc:
+    $ref: /schemas/rtc/motorola,cpcap-rtc.yaml#
+
+patternProperties:
+  "^led(-[a-z]+)?$":
+    $ref: /schemas/leds/motorola,cpcap-leds.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - spi-max-frequency
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/input/linux-event-codes.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpcap: pmic@0 {
+            compatible = "motorola,cpcap", "st,6556002";
+            reg = <0>; /* cs0 */
+
+            interrupt-parent = <&gpio1>;
+            interrupts = <7 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            spi-max-frequency = <3000000>;
+            spi-cs-high;
+
+            spi-cpol;
+            spi-cpha;
+
+            cpcap_adc: adc {
+                compatible = "motorola,cpcap-adc";
+
+                interrupt-parent = <&cpcap>;
+                interrupts = <8 IRQ_TYPE_NONE>;
+                interrupt-names = "adcdone";
+
+                #io-channel-cells = <1>;
+            };
+
+            cpcap_audio: audio-codec {
+                interrupt-parent = <&cpcap>;
+                interrupts = <9 IRQ_TYPE_NONE>, <10 IRQ_TYPE_NONE>;
+                interrupt-names = "hs", "mb2";
+
+                VAUDIO-supply = <&vdd_audio>;
+
+                #sound-dai-cells = <1>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    /* HiFi */
+                    port@0 {
+                        reg = <0>;
+
+                        cpcap_audio_codec0: endpoint {
+                        };
+                    };
+
+                    /* Voice */
+                    port@1 {
+                        reg = <1>;
+
+                        cpcap_audio_codec1: endpoint {
+                        };
+                    };
+                };
+            };
+
+            cpcap_battery: battery {
+                compatible = "motorola,cpcap-battery";
+
+                interrupt-parent = <&cpcap>;
+                interrupts = <6 IRQ_TYPE_NONE>, <5 IRQ_TYPE_NONE>,
+                             <3 IRQ_TYPE_NONE>, <20 IRQ_TYPE_NONE>,
+                             <54 IRQ_TYPE_NONE>, <57 IRQ_TYPE_NONE>;
+                interrupt-names = "eol", "lowbph", "lowbpl",
+                                  "chrgcurr1", "battdetb", "cccal";
+
+                io-channels = <&cpcap_adc 0>, <&cpcap_adc 1>,
+                              <&cpcap_adc 5>, <&cpcap_adc 6>;
+                io-channel-names = "battdetb", "battp",
+                                   "chg_isense", "batti";
+                power-supplies = <&cpcap_charger>;
+            };
+
+            cpcap_charger: charger {
+                compatible = "motorola,mapphone-cpcap-charger";
+
+                interrupt-parent = <&cpcap>;
+                interrupts = <13 IRQ_TYPE_NONE>, <12 IRQ_TYPE_NONE>,
+                             <29 IRQ_TYPE_NONE>, <28 IRQ_TYPE_NONE>,
+                             <22 IRQ_TYPE_NONE>, <21 IRQ_TYPE_NONE>,
+                             <20 IRQ_TYPE_NONE>, <19 IRQ_TYPE_NONE>,
+                             <54 IRQ_TYPE_NONE>;
+                interrupt-names = "chrg_det", "rvrs_chrg", "chrg_se1b",
+                                  "se0conn", "rvrs_mode", "chrgcurr2",
+                                  "chrgcurr1", "vbusvld", "battdetb";
+
+                mode-gpios = <&gpio3 29 GPIO_ACTIVE_LOW>,
+                             <&gpio3 23 GPIO_ACTIVE_LOW>;
+
+                io-channels = <&cpcap_adc 0>, <&cpcap_adc 1>,
+                              <&cpcap_adc 2>, <&cpcap_adc 5>,
+                              <&cpcap_adc 6>;
+                io-channel-names = "battdetb", "battp",
+                                   "vbus", "chg_isense",
+                                   "batti";
+            };
+
+            key-power {
+                compatible = "motorola,cpcap-pwrbutton";
+
+                interrupt-parent = <&cpcap>;
+                interrupts = <23 IRQ_TYPE_NONE>;
+            };
+
+            led-red {
+                compatible = "motorola,cpcap-led-red";
+                vdd-supply = <&vdd_led>;
+                label = "status-led::red";
+            };
+
+            led-green {
+                compatible = "motorola,cpcap-led-green";
+                vdd-supply = <&vdd_led>;
+                label = "status-led::green";
+            };
+
+            led-blue {
+                compatible = "motorola,cpcap-led-blue";
+                vdd-supply = <&vdd_led>;
+                label = "status-led::blue";
+            };
+
+            cpcap_usb2_phy: phy {
+                compatible = "motorola,cpcap-usb-phy";
+
+                pinctrl-0 = <&usb_gpio_mux_sel1>, <&usb_gpio_mux_sel2>;
+                pinctrl-1 = <&usb_ulpi_pins>;
+                pinctrl-2 = <&usb_utmi_pins>;
+                pinctrl-3 = <&uart3_pins>;
+                pinctrl-names = "default", "ulpi", "utmi", "uart";
+                #phy-cells = <0>;
+
+                interrupts-extended =
+                    <&cpcap 15 IRQ_TYPE_NONE>, <&cpcap 14 IRQ_TYPE_NONE>,
+                    <&cpcap 28 IRQ_TYPE_NONE>, <&cpcap 19 IRQ_TYPE_NONE>,
+                    <&cpcap 18 IRQ_TYPE_NONE>, <&cpcap 17 IRQ_TYPE_NONE>,
+                    <&cpcap 16 IRQ_TYPE_NONE>, <&cpcap 49 IRQ_TYPE_NONE>,
+                    <&cpcap 48 IRQ_TYPE_NONE>;
+                interrupt-names = "id_ground", "id_float", "se0conn",
+                                  "vbusvld", "sessvld", "sessend",
+                                  "se1", "dm", "dp";
+
+                mode-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>,
+                             <&gpio1 0 GPIO_ACTIVE_HIGH>;
+
+                io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
+                io-channel-names = "vbus", "id";
+
+                vusb-supply = <&avdd_usb>;
+            };
+
+            regulator {
+                compatible = "motorola,cpcap-regulator";
+
+                regulators {
+                    vdd_cpu: SW1 {
+                        regulator-name = "vdd_cpu";
+                        regulator-min-microvolt = <750000>;
+                        regulator-max-microvolt = <1125000>;
+                        regulator-enable-ramp-delay = <1500>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                    };
+
+                    vdd_core: SW2 {
+                        regulator-name = "vdd_core";
+                        regulator-min-microvolt = <950000>;
+                        regulator-max-microvolt = <1300000>;
+                        regulator-enable-ramp-delay = <1500>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                    };
+
+                    vdd_1v8_vio: SW3 {
+                        regulator-name = "vdd_1v8_vio";
+                        regulator-min-microvolt = <1800000>;
+                        regulator-max-microvolt = <1800000>;
+                        regulator-enable-ramp-delay = <0>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                    };
+
+                    vdd_aon: SW4 {
+                        regulator-name = "vdd_aon";
+                        regulator-min-microvolt = <950000>;
+                        regulator-max-microvolt = <1300000>;
+                        regulator-enable-ramp-delay = <1500>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                    };
+
+                    vdd_led: SW5 {
+                        regulator-name = "vdd_led";
+                        regulator-min-microvolt = <5050000>;
+                        regulator-max-microvolt = <5050000>;
+                        regulator-enable-ramp-delay = <1500>;
+                        regulator-boot-on;
+                    };
+
+                    vdd_hvio: VHVIO {
+                        regulator-name = "vdd_hvio";
+                        regulator-min-microvolt = <2775000>;
+                        regulator-max-microvolt = <2775000>;
+                        regulator-enable-ramp-delay = <1000>;
+                    };
+
+                    vcore_emmc: VSDIO {
+                        regulator-name = "vcore_emmc";
+                        regulator-min-microvolt = <1500000>;
+                        regulator-max-microvolt = <3000000>;
+                        regulator-enable-ramp-delay = <1000>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                    };
+
+                    avdd_dsi_csi: VCSI {
+                        regulator-name = "avdd_dsi_csi";
+                        regulator-min-microvolt = <1200000>;
+                        regulator-max-microvolt = <1200000>;
+                        regulator-enable-ramp-delay = <1000>;
+                        regulator-boot-on;
+                    };
+
+                    avdd_3v3_periph: VWLAN2 {
+                        regulator-name = "avdd_3v3_periph";
+                        regulator-min-microvolt = <2775000>;
+                        regulator-max-microvolt = <3300000>;
+                        regulator-enable-ramp-delay = <1000>;
+                        regulator-boot-on;
+                    };
+
+                    vddio_usd: VSIMCARD {
+                        regulator-name = "vddio_usd";
+                        regulator-min-microvolt = <1800000>;
+                        regulator-max-microvolt = <2900000>;
+                        regulator-enable-ramp-delay = <1000>;
+                        regulator-boot-on;
+                    };
+
+                    vdd_haptic: VVIB {
+                        regulator-name = "vdd_haptic";
+                        regulator-min-microvolt = <1300000>;
+                        regulator-max-microvolt = <3000000>;
+                        regulator-enable-ramp-delay = <1000>;
+                    };
+
+                    avdd_usb: VUSB {
+                        regulator-name = "avdd_usb";
+                        regulator-min-microvolt = <3300000>;
+                        regulator-max-microvolt = <3300000>;
+                        regulator-enable-ramp-delay = <1000>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                    };
+
+                    vdd_audio: VAUDIO {
+                        regulator-name = "vdd_audio";
+                        regulator-min-microvolt = <2775000>;
+                        regulator-max-microvolt = <2775000>;
+                        regulator-enable-ramp-delay = <1000>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                    };
+                };
+            };
+
+            cpcap_rtc: rtc {
+                compatible = "motorola,cpcap-rtc";
+
+                interrupt-parent = <&cpcap>;
+                interrupts = <39 IRQ_TYPE_NONE>, <26 IRQ_TYPE_NONE>;
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
deleted file mode 100644
index 18c3fc26ca93..000000000000
--- a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
+++ /dev/null
@@ -1,78 +0,0 @@
-Motorola CPCAP PMIC device tree binding
-
-Required properties:
-- compatible		: One or both of "motorola,cpcap" or "ste,6556002"
-- reg			: SPI chip select
-- interrupts		: The interrupt line the device is connected to
-- interrupt-controller	: Marks the device node as an interrupt controller
-- #interrupt-cells	: The number of cells to describe an IRQ, should be 2
-- #address-cells	: Child device offset number of cells, should be 1
-- #size-cells		: Child device size number of cells, should be 0
-- spi-max-frequency	: Typically set to 3000000
-- spi-cs-high		: SPI chip select direction
-
-Optional subnodes:
-
-The sub-functions of CPCAP get their own node with their own compatible values,
-which are described in the following files:
-
-- Documentation/devicetree/bindings/power/supply/cpcap-battery.yaml
-- Documentation/devicetree/bindings/power/supply/cpcap-charger.yaml
-- Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
-- Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
-- Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
-- Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
-- Documentation/devicetree/bindings/leds/leds-cpcap.txt
-- Documentation/devicetree/bindings/iio/adc/motorola,cpcap-adc.yaml
-
-The only exception is the audio codec. Instead of a compatible value its
-node must be named "audio-codec".
-
-Required properties for the audio-codec subnode:
-
-- #sound-dai-cells = <1>;
-- interrupts		: should contain jack detection interrupts, with headset
-			  detect interrupt matching "hs" and microphone bias 2
-			  detect interrupt matching "mb2" in interrupt-names.
-- interrupt-names	: Contains "hs", "mb2"
-
-The audio-codec provides two DAIs. The first one is connected to the
-Stereo HiFi DAC and the second one is connected to the Voice DAC.
-
-Example:
-
-&mcspi1 {
-	cpcap: pmic@0 {
-		compatible = "motorola,cpcap", "ste,6556002";
-		reg = <0>;	/* cs0 */
-		interrupt-parent = <&gpio1>;
-		interrupts = <7 IRQ_TYPE_EDGE_RISING>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		spi-max-frequency = <3000000>;
-		spi-cs-high;
-
-		audio-codec {
-			#sound-dai-cells = <1>;
-			interrupts-extended = <&cpcap 9 0>, <&cpcap 10 0>;
-			interrupt-names = "hs", "mb2";
-
-			/* HiFi */
-			port@0 {
-				endpoint {
-					remote-endpoint = <&cpu_dai1>;
-				};
-			};
-
-			/* Voice */
-			port@1 {
-				endpoint {
-					remote-endpoint = <&cpu_dai2>;
-				};
-			};
-		};
-	};
-};
-
-- 
2.51.0


