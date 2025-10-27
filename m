Return-Path: <linux-leds+bounces-5892-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D11CC0D407
	for <lists+linux-leds@lfdr.de>; Mon, 27 Oct 2025 12:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 548AF4213A8
	for <lists+linux-leds@lfdr.de>; Mon, 27 Oct 2025 11:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0D024EAB1;
	Mon, 27 Oct 2025 11:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrBBAJnL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2A42FE585
	for <linux-leds@vger.kernel.org>; Mon, 27 Oct 2025 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565557; cv=none; b=AyeIQ5RpuQvKR6wnQ2YCdGbOqSSy2QW9UhHhL5qI5z6HYdphei9/cYE+037eS34i8xnWrCXKXq4JWvX2Fx9Ri/826b11TUsrjq1QLHAAf9YetyzUCdwK0aF+mkhSYMkVIRR+TraAddgm7q60aTQ8NB+z70HKVExzjzplhzM/djs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565557; c=relaxed/simple;
	bh=18svdfFnZ2AVuDfJS5eM2PxZOMJATrSM2OphkPYvXR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYeEo9GXP62q+x2hAQ8sxDyMAYZScNdjDgBd/ootcJJNDXXM00rp3gB/FWoN7rjXsajbaXi9AYwUfCYfcfBJ37zrtsCE84K0znfgf79x0D4rRj2jTA9mgMExOrJYXuRowqb52eISfsVtGuQwE70e4uYbeMAHFiCMKIkbi2KeWWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrBBAJnL; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-592fdbeb7b2so4219162e87.0
        for <linux-leds@vger.kernel.org>; Mon, 27 Oct 2025 04:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761565553; x=1762170353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7P51F10ZXwkNj1M4/2nFKdIMMqbtPwfVNv5IuoJNzBA=;
        b=MrBBAJnLsLq4XT1g/yZrlZ48zHPYXcWBkLO/lcKeWhUCShmEhphEM3ij5fYgAQ2x9b
         nSIv252Lo3ZuUwZDSES1N4I+PGHwDaKcYNVGSVZaYuvHLyN8H6/yG8jtaglWer6hPaPs
         MrzMKg1JT7y7O6takUcWt8oPSqqH5CQlaV6undZi0NsmU5jWcq8rxyml7DyRxv+B9njH
         eRc6Lykf+unzZtf/KKvp0ft7gSe9pL6z41KJowbEsfAfHeIltmgzJM71aa2BSGUsNFLT
         rvWVfL378FDF05ak2toO/qfnG38jNV0FmezylpfgMBEo4Yy3fbHGpuUkjwo7xIv6aV9f
         upRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565554; x=1762170354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7P51F10ZXwkNj1M4/2nFKdIMMqbtPwfVNv5IuoJNzBA=;
        b=SLttdiCryNgYN1dX6igqXNmzc/lBxDbS6cyzpSfET2PWqAU3aarGt1Zlkjdy//wswg
         6FAu8uhsIGVn/wf1syw+goDwpOTlscmRHm2lb0P82ab8f++k9M9Rkj7JHOugElu2u3Vi
         JrRqCxxUJK95EpTJB1FOoqMh9TTZ8L8jh7xdNte4H3S61ZUT4ud0hOaJ6zFA67s6XzuV
         tHTW+tDIHcM+DRCoq8qZFBEkkLUr4WjA+YwuMJl7WCwinUyyRsjkqoVkof3kMtemS+OL
         B2bxaXzxqgsh1asIKspyOUj3oDxg4iHyErAztHepPDnj2xkgQXGIiEPQUJUb3cF0F1fr
         Z3gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw3LXQOJvKBkiM3UcUmsQOMrjs915MI+Q6xROHlQ48VlXne+Ai2sxTJXeJ/Imw9/Ja3YMeRTde6TvD@vger.kernel.org
X-Gm-Message-State: AOJu0YzQm2m0Ej2dilvH9JncEIiKdyOG9e9LIZyUpH+y6CBe4pdnqJ4e
	lbNcNoyFIamgQRMJOCLDQwJjM+XO5JwUOVc9OZ1OajnQCUFFVlzvgRiO
X-Gm-Gg: ASbGncv3zQgC/Yhp3UV0tLSLEbvz2hbBIy81WxMFebglbCNahX1oYqmT/gmHM9gIC+e
	VkF7VePD6k0V/Ij8AWoZLPRMrVvbv1b+PnS6ZbSRBlXuy/VN+nM9j/lFpNmSAZoNDX8q3DKdIiz
	29SdNdYxvt8oOmSkYl3Dmgds1RgE1+Kb7SpJxIgOaa6FmuTpLvAcZD4LWQfzcUB+WAB023KtWuB
	gdAMZ3e+1VEHHcK/7sz/42lhzyZsXt0vUcl5+oTyk0tTi5TDRvrAHpZ1z0LzQDTOOUsI5bb1jYc
	95mK2SPO9YHAmURmIP4IZnDGD50dKLZHNg2s9kuj89VrNOsIAUHbgE0KyYqGpwW7PPabDwDihwM
	q0g4nynF9SCs1MTEPV9X1R2ArnK5AHnZce37sbFS5+MJRGuQL2PZDEJZanf+SFCKtJeQeUzyGjQ
	cIYyFg9Jg=
X-Google-Smtp-Source: AGHT+IEMB19SdfWbPJthcHmxadT/Ntb6p8r8W41zYTZKza70M5l1DTaWfk41IQKJvw62BfTqx04f6g==
X-Received: by 2002:a05:6512:3e1a:b0:58b:151:bc0f with SMTP id 2adb3069b0e04-592fca89a9dmr4055285e87.54.1761565553348;
        Mon, 27 Oct 2025 04:45:53 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f7444bsm2285523e87.85.2025.10.27.04.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:45:52 -0700 (PDT)
Date: Mon, 27 Oct 2025 13:45:46 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andreas Kemnade <andreas@kemnade.info>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v2 04/15] dt-bindings: mfd: ROHM BD72720
Message-ID: <a5957c4f83724d4f32527fb892fc340af4eeddde.1761564043.git.mazziesaccount@gmail.com>
References: <cover.1761564043.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hIp+AjNzMwe9bvg8"
Content-Disposition: inline
In-Reply-To: <cover.1761564043.git.mazziesaccount@gmail.com>


--hIp+AjNzMwe9bvg8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ROHM BD72720 is a power management IC integrating regulators, GPIOs,
charger, LEDs, RTC and a clock gate.

Add dt-binding doc for ROHM BD72720.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
 RFCv1 =3D> v2:
 - Typofixes
---
 .../bindings/mfd/rohm,bd72720-pmic.yaml       | 269 ++++++++++++++++++
 1 file changed, 269 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic=
=2Eyaml

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml b=
/Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml
new file mode 100644
index 000000000000..b0d4bc01d199
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml
@@ -0,0 +1,269 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/rohm,bd72720-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD72720 Power Management Integrated Circuit
+
+maintainers:
+  - Matti Vaittinen <mazziesaccount@gmail.com>
+
+description: |
+  BD72720 is a single-chip power management IC for battery-powered portable
+  devices. The BD72720 integrates 10 bucks and 11 LDOs, and a 3000 mA
+  switching charger. The IC also includes a Coulomb counter, a real-time
+  clock (RTC), GPIOs and a 32.768 kHz clock gate.
+
+# In addition to the properties found from the charger node, the ROHM BD72=
720
+# uses properties from a static battery node. Please see the:
+# Documentation/devicetree/bindings/power/supply/rohm,vdr-battery.yaml
+#
+# Following properties are used
+# when present:
+#
+# charge-full-design-microamp-hours: Battry capacity in mAh
+# voltage-max-design-microvolt:      Maximum voltage
+# voltage-min-design-microvolt:      Minimum voltage system is still opera=
ting.
+# degrade-cycle-microamp-hours:      Capacity lost due to aging at each fu=
ll
+#                                    charge cycle.
+# ocv-capacity-celsius:              Array of OCV table temperatures. 1/ta=
ble.
+# ocv-capacity-table-<N>:            Table of OCV voltage/SOC pairs. Corre=
sponds
+#                                    N.th temperature in ocv-capacity-cels=
ius
+#
+# ROHM specific properties:
+# rohm,voltage-vdr-thresh-microvolt: Threshold for starting the VDR correc=
tion
+# rohm,volt-drop-soc:                Table of capacity values matching the
+#                                    values in VDR tables.
+# rohm,volt-drop-high-temp-microvolt: VDR table for high temperature
+# rohm,volt-drop-normal-temp-microvolt: VDR table for normal temperature
+# rohm,volt-drop-low-temp-microvolt:  VDR table for low temperature
+# rohm,volt-drop-very-low-temp-microvolt: VDR table for very low temperatu=
re
+#
+# VDR tables are (usually) determined for a specific battery by ROHM.
+# The battery node would then be referred from the charger node:
+#
+# monitored-battery =3D <&battery>;
+
+properties:
+  compatible:
+    const: rohm,bd72720
+
+  reg:
+    description:
+      I2C slave address.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      The first cell is the pin number and the second cell is used to spec=
ify
+      flags. See ../gpio/gpio.txt for more information.
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    const: bd71828-32k-out
+
+  rohm,clkout-open-drain:
+    description: clk32kout mode. Set to 1 for "open-drain" or 0 for "cmos".
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 1
+
+  rohm,charger-sense-resistor-milli-ohms:
+    minimum: 10
+    maximum: 50
+    description: |
+      BD72720 has a SAR ADC for measuring charging currents. External sense
+      resistor (RSENSE in data sheet) should be used. If some other but
+      30 mOhm resistor is used the resistance value should be given here in
+      milli Ohms.
+
+  regulators:
+    $ref: ../regulator/rohm,bd77270-regulator.yaml
+    description:
+      List of child nodes that specify the regulators.
+
+  leds:
+    $ref: ../leds/rohm,bd71828-leds.yaml
+
+  rohm,pin-dvs0:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      BD72720 has 4 different OTP options to determine the use of dvs0-pin.
+      OTP0 - regulator RUN state control.
+      OTP1 - GPI.
+      OTP2 - GPO.
+      OTP3 - Power sequencer output.
+      This property specifies the use of the pin.
+    enum:
+      - dvs-input
+      - gpi
+      - gpo
+
+  rohm,pin-dvs1:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      see rohm,pin-dvs0
+    enum:
+      - dvs-input
+      - gpi
+      - gpo
+
+  rohm,pin-exten0:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: BD72720 has an OTP option to use exten0-pin for different
+      purposes. Set this property accordingly.
+    const: gpo
+
+  rohm,pin-exten1:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: BD72720 has an OTP option to use exten1-pin for different
+      purposes. Set this property accordingly.
+    const: gpo
+
+  rohm,pin-fault_b:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: BD72720 has an OTP option to use fault_b-pin for different
+      purposes. Set this property accordingly.
+    const: gpo
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - "#clock-cells"
+  - regulators
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        pmic: pmic@4b {
+            compatible =3D "rohm,bd71828";
+            reg =3D <0x4b>;
+
+            interrupt-parent =3D <&gpio1>;
+            interrupts =3D <29 IRQ_TYPE_LEVEL_LOW>;
+
+            clocks =3D <&osc 0>;
+            #clock-cells =3D <0>;
+            clock-output-names =3D "bd71828-32k-out";
+
+            gpio-controller;
+            #gpio-cells =3D <2>;
+            gpio-reserved-ranges =3D <0 1>, <2 1>;
+
+            rohm,charger-sense-resistor-ohms =3D <10000000>;
+
+            regulators {
+                buck1: BUCK1 {
+                    regulator-name =3D "buck1";
+                    regulator-min-microvolt =3D <500000>;
+                    regulator-max-microvolt =3D <2000000>;
+                    regulator-ramp-delay =3D <2500>;
+                };
+                buck2: BUCK2 {
+                    regulator-name =3D "buck2";
+                    regulator-min-microvolt =3D <500000>;
+                    regulator-max-microvolt =3D <2000000>;
+                    regulator-ramp-delay =3D <2500>;
+                };
+                buck3: BUCK3 {
+                    regulator-name =3D "buck3";
+                    regulator-min-microvolt =3D <1200000>;
+                    regulator-max-microvolt =3D <2000000>;
+                };
+                buck4: BUCK4 {
+                    regulator-name =3D "buck4";
+                    regulator-min-microvolt =3D <1000000>;
+                    regulator-max-microvolt =3D <1800000>;
+                };
+                buck5: BUCK5 {
+                    regulator-name =3D "buck5";
+                    regulator-min-microvolt =3D <2500000>;
+                    regulator-max-microvolt =3D <3300000>;
+                };
+                buck6: BUCK6 {
+                    regulator-name =3D "buck6";
+                    regulator-min-microvolt =3D <500000>;
+                    regulator-max-microvolt =3D <2000000>;
+                    regulator-ramp-delay =3D <2500>;
+                };
+                buck7: BUCK7 {
+                    regulator-name =3D "buck7";
+                    regulator-min-microvolt =3D <500000>;
+                    regulator-max-microvolt =3D <2000000>;
+                    regulator-ramp-delay =3D <2500>;
+                };
+                ldo1: LDO1 {
+                    regulator-name =3D "ldo1";
+                    regulator-min-microvolt =3D <800000>;
+                    regulator-max-microvolt =3D <3300000>;
+                };
+                ldo2: LDO2 {
+                    regulator-name =3D "ldo2";
+                    regulator-min-microvolt =3D <800000>;
+                    regulator-max-microvolt =3D <3300000>;
+                };
+                ldo3: LDO3 {
+                    regulator-name =3D "ldo3";
+                    regulator-min-microvolt =3D <800000>;
+                    regulator-max-microvolt =3D <3300000>;
+                };
+                ldo4: LDO4 {
+                    regulator-name =3D "ldo4";
+                    regulator-min-microvolt =3D <800000>;
+                    regulator-max-microvolt =3D <3300000>;
+                };
+                ldo5: LDO5 {
+                    regulator-name =3D "ldo5";
+                    regulator-min-microvolt =3D <800000>;
+                    regulator-max-microvolt =3D <3300000>;
+                };
+                ldo6: LDO6 {
+                    regulator-name =3D "ldo6";
+                    regulator-min-microvolt =3D <1800000>;
+                    regulator-max-microvolt =3D <1800000>;
+                };
+                ldo7_reg: LDO7 {
+                    regulator-name =3D "ldo7";
+                    regulator-min-microvolt =3D <800000>;
+                    regulator-max-microvolt =3D <3300000>;
+                };
+            };
+
+            leds {
+                compatible =3D "rohm,bd71828-leds";
+
+                led-1 {
+                    rohm,led-compatible =3D "bd71828-grnled";
+                    function =3D LED_FUNCTION_INDICATOR;
+                    color =3D <LED_COLOR_ID_GREEN>;
+                };
+                led-2 {
+                    rohm,led-compatible =3D "bd71828-ambled";
+                    function =3D LED_FUNCTION_CHARGING;
+                    color =3D <LED_COLOR_ID_AMBER>;
+                };
+            };
+        };
+    };
--=20
2.51.0


--hIp+AjNzMwe9bvg8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmj/W2oACgkQeFA3/03a
ocU4Nwf+NZOvCrSF4EFmx/nHbcnTFfqwJ1Jb8JXrtp5JWuFJPue1mNQ0ESVweJFW
552k5nBinbVhlHWLuq56+bM8ieLe3G9ObLqGWX78xMS3lSELm6V6UvoyKul7YQKt
mEm0YoEl5WZKB83E04m9BI1zdHOC3XB71rcKlaCVuRbYrKiLDM91LgX+9xRTq2z7
0wkrTT6ReMarMQIFag/iPeRLL20a+ihrb4CianUGSosz9RMiVo/wGB6PiPaKny25
B0qT+Yo5ZYhhDA2wts+EXCNt5o8SD2vbHrPtjXjH1+1SRxe9E0N1kxj6b6GcdnIA
SoUwQcO7V0pBdq9sXCakati8B5O0Kg==
=+VcJ
-----END PGP SIGNATURE-----

--hIp+AjNzMwe9bvg8--

