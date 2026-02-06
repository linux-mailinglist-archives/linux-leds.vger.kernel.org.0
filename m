Return-Path: <linux-leds+bounces-6869-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KJ5EK4lhmlSKAQAu9opvQ
	(envelope-from <linux-leds+bounces-6869-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:32:30 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB93C10112F
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FC7E305F4B0
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 17:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039BC426D0C;
	Fri,  6 Feb 2026 17:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMEhNTG5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA254266B1
	for <linux-leds@vger.kernel.org>; Fri,  6 Feb 2026 17:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398962; cv=none; b=TmK44UofGGpxYjQdbgOkbfClxjR+rfW0qdnCDfihReGA/aMuirpLrpC2ly61kGEWjaLciYLqRj2ktrbKpqzWBWvj2g5It9VEYQI5cuH11bNC7RyIKFgP95bVX76CcIlktMreH3/myJw2JQ/HivcHMhgetlpE96DpbP1vTWXs21M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398962; c=relaxed/simple;
	bh=loQTqMY3dTyo9qmM5eCojadXjfUUin76NLkqxH8AWhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=easeCWMS50GTqm/r8dhuHnaRKGbklJM1FYDpHmetXyXZ2ppiIWM9UOvJ/4ruHrzU9ywUFzx6uwlpjqZOuu0ZtdXzyXIG80oeUqhZQNJ+pqyrLVUMML40MOgMQh9x2hdDWW26oynFqY0J6GKiXIu76dDYWCkPPLefW7pc2jB8YVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMEhNTG5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4358fb60802so1631844f8f.1
        for <linux-leds@vger.kernel.org>; Fri, 06 Feb 2026 09:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770398961; x=1771003761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STLD7k92jx6Vtf+4CNNSQEeh7f1Puk4ItgmC3JkEUS8=;
        b=WMEhNTG5Q2pTC/GMviLxGDtolZNVoaEw9kFiVzvMMgaz6sdkNWJy+S/uqMtufypLda
         HkYrWAVSB3Gm8yLwlZC4OYkl7F5ZjmLfH9KkN0/4SLqy+Hh8u1y7wO+aNOo+WiGDHGf/
         5kM8hkEdi3J3i3RDXvVo06zTDE/31v+HEJgVHGCWxTj8icedciuHFe9IQ/nWxT2pNzlB
         ckR4PDlVPoO7HNM3//Lw9liBJ1cXXXjgnmZRsvIiCjmtfwmtQXW7aklRRaZKuZhrvNLB
         8+g5d9G+Nk87W8U85J5uWWPttV3nFuHZ14xSWf2FVMyOC5r7qzlSGwkiIGkj3siI0lGy
         SgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770398961; x=1771003761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=STLD7k92jx6Vtf+4CNNSQEeh7f1Puk4ItgmC3JkEUS8=;
        b=QhCDwh76EiJ3/9dmBEsn6Kc9segFO/t5IwI9Oyk6a6E54R7Clgx2SmTg+J7zvSRUYC
         X5phuUONk7xPIha81o6LuPs1seLyOAbr/EesbsCJDmL5YCBQ9VLMQXWU/xspv13hTfrq
         v0MypLjdgenMFoqDUQqHPcSsLWSkcGnx0Pp5OkDRS1Cnu44QmFfAz5IbZKvg2v2/lsjt
         oR4HX6rOh3x5iJtLx7hpJ20t7k8f3suCIz12DPgAYiNaoz9t4iQmp/X/tbnfn9Ws2dcQ
         RRlEH4/fwuTTDb/N3iJxtQsYThzPW42yl1qqaXEUDAZdXd2WZg2f8djI5/sUA0rhSlog
         0MXA==
X-Forwarded-Encrypted: i=1; AJvYcCUQN6S1nvytQy7SfowxxdeUPb98yoe9VJmav2bjetcPTOcl2i/6enqaUtCbzQ9oRKBCKi2bFCcqvhGx@vger.kernel.org
X-Gm-Message-State: AOJu0YxHXStZWC0NOrYWwuzuWwYbYgC5xVgGzAIXFIQtoi+2Dpxj84DD
	RKqX3BfWtmVdT+thcdF4vEIvs5ljOQRGV7jHOtWkPXW7R1wGTPVuIWYq
X-Gm-Gg: AZuq6aIDRaACLFr070y2noTQfPkY0TAuXBCq4kdN5NfGHeXpoUhgKn+c2TpmNLndoyr
	XFc0Wc1P+lb2CXlyFP5fxCpa5GZl0lmFCu8lBcBf+DSJJTzxIS3gKQ4QTgHnOE35qtgqcV5cey9
	qNvESP7z5Kz5zFdl64ffOsPsaVOBY8lUbp2H+SctXfpR9w/0nuectWvgDrz11z9du2idLqYVc9T
	FVGitdM2a9T8SAncxcfCDcjhRRsLeOYNAusJuEBc1heF+RnR5yM1NOMhtzOCbqnzrCjomPEcYkg
	9qDL2c5dVK9dY7W72gwqEmMMcufADf5ra9CsGYBkPgNnPiUut+kdkVnc5FuA2552ygHqk/U6o7K
	FevKEJAfZ65Getae2AnGQrvRvjrv4u4Z5RADJ9Sg174Zdwkdvo5U/D83H3ux43j6eCuGqufYXrD
	sQ
X-Received: by 2002:a05:6000:1787:b0:432:b953:b02b with SMTP id ffacd0b85a97d-436209bfd5amr13282745f8f.16.1770398960619;
        Fri, 06 Feb 2026 09:29:20 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629734268sm6846033f8f.24.2026.02.06.09.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:29:20 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 08/11] dt-bindings: mfd: motorola-cpcap: convert to DT schema
Date: Fri,  6 Feb 2026 19:28:42 +0200
Message-ID: <20260206172845.145407-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206172845.145407-1-clamor95@gmail.com>
References: <20260206172845.145407-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com];
	TAGGED_FROM(0.00)[bounces-6869-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.994];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: CB93C10112F
X-Rspamd-Action: no action

Convert devicetree bindings for the Motorola CPCAP MFD from TXT to YAML.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/mfd/motorola,cpcap.yaml          | 411 ++++++++++++++++++
 .../bindings/mfd/motorola-cpcap.txt           |  78 ----
 2 files changed, 411 insertions(+), 78 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt

diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
new file mode 100644
index 000000000000..7e350721d9f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
@@ -0,0 +1,411 @@
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
+    enum:
+      - motorola,cpcap
+      - st,6556002
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
+    $ref: /schemas/iio/adc/motorola,cpcap-adc.yaml
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
+    $ref: /schemas/power/supply/cpcap-battery.yaml
+
+  charger:
+    $ref: /schemas/power/supply/cpcap-charger.yaml
+
+  key-power:
+    $ref: /schemas/input/motorola,cpcap-pwrbutton.yaml
+
+  phy:
+    $ref: /schemas/phy/motorola,cpcap-usb-phy.yaml
+
+  regulator:
+    $ref: /schemas/regulator/motorola,cpcap-regulator.yaml
+
+  rtc:
+    $ref: /schemas/rtc/motorola,cpcap-rtc.yaml
+
+patternProperties:
+  "^led(-[a-z]+)?$":
+    $ref: /schemas/leds/motorola,cpcap-leds.yaml
+
+required:
+  - compatible
+  - reg
+  - interrupts
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
+            compatible = "motorola,cpcap";
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


