Return-Path: <linux-leds+bounces-8081-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMb9KBUxA2qN1QEAu9opvQ
	(envelope-from <linux-leds+bounces-8081-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 12 May 2026 15:54:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E03521BDB
	for <lists+linux-leds@lfdr.de>; Tue, 12 May 2026 15:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E79CE30E34E2
	for <lists+linux-leds@lfdr.de>; Tue, 12 May 2026 12:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E101B3C5827;
	Tue, 12 May 2026 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2Pi78Sc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E293C5838;
	Tue, 12 May 2026 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590394; cv=none; b=VPQ8eeAgh0+pRY4ZZ/xNmu6dtqhw/XdDvbDbHeqlYZRFspcDEuvS/uYEnuGflsPBuT6dbze7FDLYuj7VYTfNGXinztZQuO/xRW9iG+gjHu5rhM0iMWwxFee5ss7LjNd9Dckgk7ocqAmxG/sT6dklIhIICOnP7a/KCxS3UY0SFas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590394; c=relaxed/simple;
	bh=/e4HgwgpYawe0YJLVgo1bDexGAG+BPKR3l/U7PUFyV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRcvLilgKfLt0In/1LjbXuiDGtS+gQpz4F1GgUcAfHWiq6obgj2f2+pYtREi+ctG8sWeR91y+dbcIrf88+9vIY6et6nFttF8nhMQG1Jb6vQW/8y0iCB5yPlvcHmtPFON5I523LR7rwkH/zsJEVlm42NVcd0iVTUNoHiT/jASnrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2Pi78Sc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3655C2BCF5;
	Tue, 12 May 2026 12:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778590394;
	bh=/e4HgwgpYawe0YJLVgo1bDexGAG+BPKR3l/U7PUFyV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2Pi78ScOBtb2ubQPcw8SSRGKJ0snlvKBOYZnRg0sEVLEhfeLFncK9UUCF9P80MhW
	 oPQSZWJ23YcXsKNaS3E+yokFdEHB7+fE5NfmGwxJw0keG9YmSYa6jd+ix2/m6Fs9Il
	 vGQ5Znz1tfyAHzuXfN4nvkb/r0iAj+W3fB8M8VWwShKFUoGOplF1Fb4OKOhjF7LZuA
	 FropUCWKnx/Cf/BW0RZ3Wxk/SQaeMz1TJrGGaoNNOO/9Qi2pPy3w98CliemiQVrrRD
	 uN+Ypc5D03CMERZsQV+xrmDsDeinh2w/k7xzh/8A/xcO5auriA/jyRXgYqzSh/4PnT
	 V0O5wqEQLdj5w==
Date: Tue, 12 May 2026 07:53:09 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 3/6] dt-bindings: mfd: motorola-cpcap: convert to DT
 schema
Message-ID: <20260512125309.GA1476682-robh@kernel.org>
References: <20260510110804.33045-1-clamor95@gmail.com>
 <20260510110804.33045-4-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510110804.33045-4-clamor95@gmail.com>
X-Rspamd-Queue-Id: F1E03521BDB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8081-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,devicetree.org:url,0.0.0.1:email]
X-Rspamd-Action: no action

On Sun, May 10, 2026 at 02:08:01PM +0300, Svyatoslav Ryhel wrote:
> Convert devicetree bindings for the Motorola CPCAP MFD from TXT to YAML.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/mfd/motorola,cpcap.yaml          | 414 ++++++++++++++++++
>  .../bindings/mfd/motorola-cpcap.txt           |  78 ----
>  2 files changed, 414 insertions(+), 78 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
> new file mode 100644
> index 000000000000..7f257f3a1a5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
> @@ -0,0 +1,414 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Motorola CPCAP PMIC MFD
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: motorola,cpcap
> +      - const: st,6556002
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

There aren't any child nodes with an address. These 2 can be dropped.

> +
> +  spi-max-frequency:
> +    maximum: 9600000
> +
> +  spi-cs-high: true
> +  spi-cpol: true
> +  spi-cpha: true
> +
> +  adc:
> +    $ref: /schemas/iio/adc/motorola,cpcap-adc.yaml#
> +
> +  audio-codec:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      interrupts:
> +        items:
> +          - description: headset detect interrupt
> +          - description: microphone bias 2 detect interrupt
> +
> +      interrupt-names:
> +        items:
> +          - const: hs
> +          - const: mb2
> +
> +      "#sound-dai-cells":
> +        const: 1
> +
> +      VAUDIO-supply:
> +        description:
> +          Codec power supply, usually VAUDIO regulator of CPCAP.
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: port connected to the Stereo HiFi DAC
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: port connected to the Voice DAC
> +
> +        required:
> +          - port@0
> +          - port@1
> +
> +    required:
> +      - interrupts
> +      - interrupt-names
> +      - "#sound-dai-cells"
> +
> +  battery:
> +    $ref: /schemas/power/supply/cpcap-battery.yaml#
> +
> +  charger:
> +    $ref: /schemas/power/supply/cpcap-charger.yaml#
> +
> +  key-power:
> +    $ref: /schemas/input/motorola,cpcap-pwrbutton.yaml#
> +
> +  phy:
> +    $ref: /schemas/phy/motorola,cpcap-usb-phy.yaml#
> +
> +  regulator:
> +    $ref: /schemas/regulator/motorola,cpcap-regulator.yaml#
> +
> +  rtc:
> +    $ref: /schemas/rtc/motorola,cpcap-rtc.yaml#
> +
> +patternProperties:
> +  "^led(-[a-z]+)?$":
> +    $ref: /schemas/leds/motorola,cpcap-leds.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - spi-max-frequency
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/input/linux-event-codes.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        cpcap: pmic@0 {
> +            compatible = "motorola,cpcap", "st,6556002";
> +            reg = <0>; /* cs0 */
> +
> +            interrupt-parent = <&gpio1>;
> +            interrupts = <7 IRQ_TYPE_EDGE_RISING>;
> +
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            spi-max-frequency = <3000000>;
> +            spi-cs-high;
> +
> +            spi-cpol;
> +            spi-cpha;
> +
> +            cpcap_adc: adc {
> +                compatible = "motorola,cpcap-adc";
> +
> +                interrupt-parent = <&cpcap>;
> +                interrupts = <8 IRQ_TYPE_NONE>;
> +                interrupt-names = "adcdone";
> +
> +                #io-channel-cells = <1>;
> +            };
> +
> +            cpcap_audio: audio-codec {
> +                interrupt-parent = <&cpcap>;
> +                interrupts = <9 IRQ_TYPE_NONE>, <10 IRQ_TYPE_NONE>;
> +                interrupt-names = "hs", "mb2";
> +
> +                VAUDIO-supply = <&vdd_audio>;
> +
> +                #sound-dai-cells = <1>;
> +
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    /* HiFi */
> +                    port@0 {
> +                        reg = <0>;
> +
> +                        cpcap_audio_codec0: endpoint {
> +                        };
> +                    };
> +
> +                    /* Voice */
> +                    port@1 {
> +                        reg = <1>;
> +
> +                        cpcap_audio_codec1: endpoint {
> +                        };
> +                    };
> +                };
> +            };
> +
> +            cpcap_battery: battery {
> +                compatible = "motorola,cpcap-battery";
> +
> +                interrupt-parent = <&cpcap>;
> +                interrupts = <6 IRQ_TYPE_NONE>, <5 IRQ_TYPE_NONE>,
> +                             <3 IRQ_TYPE_NONE>, <20 IRQ_TYPE_NONE>,
> +                             <54 IRQ_TYPE_NONE>, <57 IRQ_TYPE_NONE>;
> +                interrupt-names = "eol", "lowbph", "lowbpl",
> +                                  "chrgcurr1", "battdetb", "cccal";
> +
> +                io-channels = <&cpcap_adc 0>, <&cpcap_adc 1>,
> +                              <&cpcap_adc 5>, <&cpcap_adc 6>;
> +                io-channel-names = "battdetb", "battp",
> +                                   "chg_isense", "batti";
> +                power-supplies = <&cpcap_charger>;
> +            };
> +
> +            cpcap_charger: charger {
> +                compatible = "motorola,mapphone-cpcap-charger";
> +
> +                interrupt-parent = <&cpcap>;
> +                interrupts = <13 IRQ_TYPE_NONE>, <12 IRQ_TYPE_NONE>,
> +                             <29 IRQ_TYPE_NONE>, <28 IRQ_TYPE_NONE>,
> +                             <22 IRQ_TYPE_NONE>, <21 IRQ_TYPE_NONE>,
> +                             <20 IRQ_TYPE_NONE>, <19 IRQ_TYPE_NONE>,
> +                             <54 IRQ_TYPE_NONE>;
> +                interrupt-names = "chrg_det", "rvrs_chrg", "chrg_se1b",
> +                                  "se0conn", "rvrs_mode", "chrgcurr2",
> +                                  "chrgcurr1", "vbusvld", "battdetb";
> +
> +                mode-gpios = <&gpio3 29 GPIO_ACTIVE_LOW>,
> +                             <&gpio3 23 GPIO_ACTIVE_LOW>;
> +
> +                io-channels = <&cpcap_adc 0>, <&cpcap_adc 1>,
> +                              <&cpcap_adc 2>, <&cpcap_adc 5>,
> +                              <&cpcap_adc 6>;
> +                io-channel-names = "battdetb", "battp",
> +                                   "vbus", "chg_isense",
> +                                   "batti";
> +            };
> +
> +            key-power {
> +                compatible = "motorola,cpcap-pwrbutton";
> +
> +                interrupt-parent = <&cpcap>;
> +                interrupts = <23 IRQ_TYPE_NONE>;
> +            };
> +
> +            led-red {
> +                compatible = "motorola,cpcap-led-red";
> +                vdd-supply = <&vdd_led>;
> +                label = "status-led::red";
> +            };
> +
> +            led-green {
> +                compatible = "motorola,cpcap-led-green";
> +                vdd-supply = <&vdd_led>;
> +                label = "status-led::green";
> +            };
> +
> +            led-blue {
> +                compatible = "motorola,cpcap-led-blue";
> +                vdd-supply = <&vdd_led>;
> +                label = "status-led::blue";
> +            };
> +
> +            cpcap_usb2_phy: phy {
> +                compatible = "motorola,cpcap-usb-phy";
> +
> +                pinctrl-0 = <&usb_gpio_mux_sel1>, <&usb_gpio_mux_sel2>;
> +                pinctrl-1 = <&usb_ulpi_pins>;
> +                pinctrl-2 = <&usb_utmi_pins>;
> +                pinctrl-3 = <&uart3_pins>;
> +                pinctrl-names = "default", "ulpi", "utmi", "uart";
> +                #phy-cells = <0>;
> +
> +                interrupts-extended =
> +                    <&cpcap 15 IRQ_TYPE_NONE>, <&cpcap 14 IRQ_TYPE_NONE>,
> +                    <&cpcap 28 IRQ_TYPE_NONE>, <&cpcap 19 IRQ_TYPE_NONE>,
> +                    <&cpcap 18 IRQ_TYPE_NONE>, <&cpcap 17 IRQ_TYPE_NONE>,
> +                    <&cpcap 16 IRQ_TYPE_NONE>, <&cpcap 49 IRQ_TYPE_NONE>,
> +                    <&cpcap 48 IRQ_TYPE_NONE>;
> +                interrupt-names = "id_ground", "id_float", "se0conn",
> +                                  "vbusvld", "sessvld", "sessend",
> +                                  "se1", "dm", "dp";
> +
> +                mode-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>,
> +                             <&gpio1 0 GPIO_ACTIVE_HIGH>;
> +
> +                io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
> +                io-channel-names = "vbus", "id";
> +
> +                vusb-supply = <&avdd_usb>;
> +            };
> +
> +            regulator {
> +                compatible = "motorola,cpcap-regulator";
> +
> +                regulators {
> +                    vdd_cpu: SW1 {
> +                        regulator-name = "vdd_cpu";
> +                        regulator-min-microvolt = <750000>;
> +                        regulator-max-microvolt = <1125000>;
> +                        regulator-enable-ramp-delay = <1500>;
> +                        regulator-always-on;
> +                        regulator-boot-on;
> +                    };
> +
> +                    vdd_core: SW2 {
> +                        regulator-name = "vdd_core";
> +                        regulator-min-microvolt = <950000>;
> +                        regulator-max-microvolt = <1300000>;
> +                        regulator-enable-ramp-delay = <1500>;
> +                        regulator-always-on;
> +                        regulator-boot-on;
> +                    };
> +
> +                    vdd_1v8_vio: SW3 {
> +                        regulator-name = "vdd_1v8_vio";
> +                        regulator-min-microvolt = <1800000>;
> +                        regulator-max-microvolt = <1800000>;
> +                        regulator-enable-ramp-delay = <0>;
> +                        regulator-always-on;
> +                        regulator-boot-on;
> +                    };
> +
> +                    vdd_aon: SW4 {
> +                        regulator-name = "vdd_aon";
> +                        regulator-min-microvolt = <950000>;
> +                        regulator-max-microvolt = <1300000>;
> +                        regulator-enable-ramp-delay = <1500>;
> +                        regulator-always-on;
> +                        regulator-boot-on;
> +                    };
> +
> +                    vdd_led: SW5 {
> +                        regulator-name = "vdd_led";
> +                        regulator-min-microvolt = <5050000>;
> +                        regulator-max-microvolt = <5050000>;
> +                        regulator-enable-ramp-delay = <1500>;
> +                        regulator-boot-on;
> +                    };
> +
> +                    vdd_hvio: VHVIO {
> +                        regulator-name = "vdd_hvio";
> +                        regulator-min-microvolt = <2775000>;
> +                        regulator-max-microvolt = <2775000>;
> +                        regulator-enable-ramp-delay = <1000>;
> +                    };
> +
> +                    vcore_emmc: VSDIO {
> +                        regulator-name = "vcore_emmc";
> +                        regulator-min-microvolt = <1500000>;
> +                        regulator-max-microvolt = <3000000>;
> +                        regulator-enable-ramp-delay = <1000>;
> +                        regulator-always-on;
> +                        regulator-boot-on;
> +                    };
> +
> +                    avdd_dsi_csi: VCSI {
> +                        regulator-name = "avdd_dsi_csi";
> +                        regulator-min-microvolt = <1200000>;
> +                        regulator-max-microvolt = <1200000>;
> +                        regulator-enable-ramp-delay = <1000>;
> +                        regulator-boot-on;
> +                    };
> +
> +                    avdd_3v3_periph: VWLAN2 {
> +                        regulator-name = "avdd_3v3_periph";
> +                        regulator-min-microvolt = <2775000>;
> +                        regulator-max-microvolt = <3300000>;
> +                        regulator-enable-ramp-delay = <1000>;
> +                        regulator-boot-on;
> +                    };
> +
> +                    vddio_usd: VSIMCARD {
> +                        regulator-name = "vddio_usd";
> +                        regulator-min-microvolt = <1800000>;
> +                        regulator-max-microvolt = <2900000>;
> +                        regulator-enable-ramp-delay = <1000>;
> +                        regulator-boot-on;
> +                    };
> +
> +                    vdd_haptic: VVIB {
> +                        regulator-name = "vdd_haptic";
> +                        regulator-min-microvolt = <1300000>;
> +                        regulator-max-microvolt = <3000000>;
> +                        regulator-enable-ramp-delay = <1000>;
> +                    };
> +
> +                    avdd_usb: VUSB {
> +                        regulator-name = "avdd_usb";
> +                        regulator-min-microvolt = <3300000>;
> +                        regulator-max-microvolt = <3300000>;
> +                        regulator-enable-ramp-delay = <1000>;
> +                        regulator-always-on;
> +                        regulator-boot-on;
> +                    };
> +
> +                    vdd_audio: VAUDIO {
> +                        regulator-name = "vdd_audio";
> +                        regulator-min-microvolt = <2775000>;
> +                        regulator-max-microvolt = <2775000>;
> +                        regulator-enable-ramp-delay = <1000>;
> +                        regulator-always-on;
> +                        regulator-boot-on;
> +                    };
> +                };
> +            };
> +
> +            cpcap_rtc: rtc {
> +                compatible = "motorola,cpcap-rtc";
> +
> +                interrupt-parent = <&cpcap>;
> +                interrupts = <39 IRQ_TYPE_NONE>, <26 IRQ_TYPE_NONE>;
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
> deleted file mode 100644
> index 18c3fc26ca93..000000000000
> --- a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -Motorola CPCAP PMIC device tree binding
> -
> -Required properties:
> -- compatible		: One or both of "motorola,cpcap" or "ste,6556002"
> -- reg			: SPI chip select
> -- interrupts		: The interrupt line the device is connected to
> -- interrupt-controller	: Marks the device node as an interrupt controller
> -- #interrupt-cells	: The number of cells to describe an IRQ, should be 2
> -- #address-cells	: Child device offset number of cells, should be 1
> -- #size-cells		: Child device size number of cells, should be 0
> -- spi-max-frequency	: Typically set to 3000000
> -- spi-cs-high		: SPI chip select direction
> -
> -Optional subnodes:
> -
> -The sub-functions of CPCAP get their own node with their own compatible values,
> -which are described in the following files:
> -
> -- Documentation/devicetree/bindings/power/supply/cpcap-battery.yaml
> -- Documentation/devicetree/bindings/power/supply/cpcap-charger.yaml
> -- Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
> -- Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
> -- Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
> -- Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
> -- Documentation/devicetree/bindings/leds/leds-cpcap.txt
> -- Documentation/devicetree/bindings/iio/adc/motorola,cpcap-adc.yaml
> -
> -The only exception is the audio codec. Instead of a compatible value its
> -node must be named "audio-codec".
> -
> -Required properties for the audio-codec subnode:
> -
> -- #sound-dai-cells = <1>;
> -- interrupts		: should contain jack detection interrupts, with headset
> -			  detect interrupt matching "hs" and microphone bias 2
> -			  detect interrupt matching "mb2" in interrupt-names.
> -- interrupt-names	: Contains "hs", "mb2"
> -
> -The audio-codec provides two DAIs. The first one is connected to the
> -Stereo HiFi DAC and the second one is connected to the Voice DAC.
> -
> -Example:
> -
> -&mcspi1 {
> -	cpcap: pmic@0 {
> -		compatible = "motorola,cpcap", "ste,6556002";
> -		reg = <0>;	/* cs0 */
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <7 IRQ_TYPE_EDGE_RISING>;
> -		interrupt-controller;
> -		#interrupt-cells = <2>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		spi-max-frequency = <3000000>;
> -		spi-cs-high;
> -
> -		audio-codec {
> -			#sound-dai-cells = <1>;
> -			interrupts-extended = <&cpcap 9 0>, <&cpcap 10 0>;
> -			interrupt-names = "hs", "mb2";
> -
> -			/* HiFi */
> -			port@0 {
> -				endpoint {
> -					remote-endpoint = <&cpu_dai1>;
> -				};
> -			};
> -
> -			/* Voice */
> -			port@1 {
> -				endpoint {
> -					remote-endpoint = <&cpu_dai2>;
> -				};
> -			};
> -		};
> -	};
> -};
> -
> -- 
> 2.51.0
> 

