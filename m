Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2558A2D78BF
	for <lists+linux-leds@lfdr.de>; Fri, 11 Dec 2020 16:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406088AbgLKPFN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Dec 2020 10:05:13 -0500
Received: from mail.thorsis.com ([92.198.35.195]:46343 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437636AbgLKPEk (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 11 Dec 2020 10:04:40 -0500
X-Greylist: delayed 484 seconds by postgrey-1.27 at vger.kernel.org; Fri, 11 Dec 2020 10:04:39 EST
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 86956E56;
        Fri, 11 Dec 2020 15:55:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5d_HMPwfcWae; Fri, 11 Dec 2020 15:55:43 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id DF1CD2A42; Fri, 11 Dec 2020 15:55:41 +0100 (CET)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     Teresa Remmet <t.remmet@phytec.de>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: freescale: Add support for phyBOARD-Pollux-i.MX8MP
Date:   Fri, 11 Dec 2020 15:55:33 +0100
Message-ID: <6908071.W7BzXqEGyb@ada>
Organization: Thorsis Technologies GmbH
In-Reply-To: <1607694535-417799-5-git-send-email-t.remmet@phytec.de>
References: <1607694535-417799-1-git-send-email-t.remmet@phytec.de> <1607694535-417799-5-git-send-email-t.remmet@phytec.de>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Teresa,

I'm sorry if I was too brief in my review last time, see below.

Am Freitag, 11. Dezember 2020, 14:48:55 CET schrieb Teresa Remmet:
> Add initial support for phyBOARD-Pollux-i.MX8MP.
> Supported basic features:
> 	* eMMC
> 	* i2c EEPROM
> 	* i2c RTC
> 	* i2c LED
> 	* PMIC
> 	* debug UART
> 	* SD card
> 	* 1Gbit Ethernet (fec)
> 	* watchdog
>=20
> Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   | 163 ++++++++++++
>  .../boot/dts/freescale/imx8mp-phycore-som.dtsi     | 296
> +++++++++++++++++++++ 3 files changed, 460 insertions(+)
>  create mode 100644
> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts create mode
> 100644 arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/freescale/Makefile
> b/arch/arm64/boot/dts/freescale/Makefile index acfb8af45912..a43b496678be
> 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -37,6 +37,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mn-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mn-ddr4-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mn-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-phyboard-pollux-rdk.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mq-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mq-hummingboard-pulse.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mq-librem5-devkit.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts new file
> mode 100644
> index 000000000000..e92868c10526
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> @@ -0,0 +1,163 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 PHYTEC Messtechnik GmbH
> + * Author: Teresa Remmet <t.remmet@phytec.de>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/leds-pca9532.h>
> +#include <dt-bindings/pwm/pwm.h>
> +#include "imx8mp-phycore-som.dtsi"
> +
> +/ {
> +	model =3D "PHYTEC phyBOARD-Pollux i.MX8MP";
> +	compatible =3D "phytec,imx8mp-phyboard-pollux-rdk",
> +		     "phytec,imx8mp-phycore-som", "fsl,imx8mp";
> +
> +	chosen {
> +		stdout-path =3D &uart2;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name =3D "VSD_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&gpio2 19 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us =3D <100>;
> +		off-on-delay-us =3D <12000>;
> +	};
> +};
> +
> +&i2c2 {
> +	clock-frequency =3D <400000>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c2>;
> +	pinctrl-1 =3D <&pinctrl_i2c2_gpio>;
> +	sda-gpios =3D <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	scl-gpios =3D <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status =3D "okay";
> +
> +	eeprom@51 {
> +		compatible =3D "atmel,24c02";
> +		reg =3D <0x51>;
> +		pagesize =3D <16>;
> +		status =3D "okay";
> +	};
> +
> +	leds@62 {
> +		compatible =3D "nxp,pca9533";
> +		reg =3D <0x62>;
> +		status =3D "okay";
> +
> +		led1 {
> +			type =3D <PCA9532_TYPE_LED>;
> +		};
> +
> +		led2 {
> +			type =3D <PCA9532_TYPE_LED>;
> +		};
> +
> +		led3 {
> +			type =3D <PCA9532_TYPE_LED>;
> +		};
> +	};

You just removed the "label" property. Now the label is generated=20
automatically (which is the preferred way), but you did neither add the=20
property "color" nor "function", so the label will be constructed from the=
=20
node name only.

Well I just saw the binding for that LED controller is not converted to yam=
l=20
yet =E2=80=A6 Documentation/devicetree/bindings/leds/leds-pca9532.txt

Anyways, the modern approach would look like somehow like this:

                led-0 {
                        function =3D LED_FUNCTION_ALARM;
                        color =3D <LED_COLOR_ID_RED>;
                };

                led-1 {
                        function =3D LED_FUNCTION_STATUS;
                        color =3D <LED_COLOR_ID_GREEN>;
                };

                led-2 {
                        function =3D LED_FUNCTION_INDICATOR;
                        color =3D <LED_COLOR_ID_RED>;
                        function-enumerator =3D <1>;
                };

                led-3 {
                        function =3D LED_FUNCTION_INDICATOR;
                        color =3D <LED_COLOR_ID_RED>;
                        function-enumerator =3D <2>;
                };

Hope that helps, for more see Documentation/devicetree/bindings/leds and=20
especially the bindings already converted to yaml. The available macros are=
 in=20
include/dt-bindings/leds/common.h=20

Maybe just add the colors for now, if you're not sure what the function sho=
uld=20
be. As far as I could see the driver for that LED controller does not yet=20
support multicolor, but I added linux-leds to Cc, maybe someone over there=
=20
knows more?

Sorry to nag about this, but I think it's better to not introduce new dts=20
files with deprecated properties. If that kind of feedback is not desired,=
=20
please let me know.

Greets
Alex

> +};
> +
> +&snvs_pwrkey {
> +	status =3D "okay";
> +};
> +
> +/* debug console */
> +&uart2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_uart2>;
> +	status =3D "okay";
> +};
> +
> +/* SD-Card */
> +&usdhc2 {
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_pins>;
> +	pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_pins>;
> +	pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_pins>;
> +	cd-gpios =3D <&gpio2 12 GPIO_ACTIVE_LOW>;
> +	vmmc-supply =3D <&reg_usdhc2_vmmc>;
> +	bus-width =3D <4>;
> +	status =3D "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c3
> +			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA		0x400001c3
> +		>;
> +	};
> +
> +	pinctrl_i2c2_gpio: i2c2gpiogrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16	0x1e3
> +			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17	0x1e3
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x41
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x49
> +			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x49
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_pins: usdhc2-gpiogrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc1
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc1
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc1
> +		>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi new file mode
> 100644
> index 000000000000..8618df68b1e5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
> @@ -0,0 +1,296 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 PHYTEC Messtechnik GmbH
> + * Author: Teresa Remmet <t.remmet@phytec.de>
> + */
> +
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include "imx8mp.dtsi"
> +
> +/ {
> +	model =3D "PHYTEC phyCORE-i.MX8MP";
> +	compatible =3D "phytec,imx8mp-phycore-som", "fsl,imx8mp";
> +
> +	aliases {
> +		rtc0 =3D &rv3028;
> +		rtc1 =3D &snvs_rtc;
> +	};
> +
> +	memory@40000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x40000000 0 0x80000000>;
> +	};
> +};
> +
> +&A53_0 {
> +	cpu-supply =3D <&buck2>;
> +};
> +
> +&A53_1 {
> +	cpu-supply =3D <&buck2>;
> +};
> +
> +&A53_2 {
> +	cpu-supply =3D <&buck2>;
> +};
> +
> +&A53_3 {
> +	cpu-supply =3D <&buck2>;
> +};
> +
> +/* ethernet 1 */
> +&fec {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_fec>;
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ethphy1>;
> +	fsl,magic-packet;
> +	status =3D "okay";
> +
> +	mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		ethphy1: ethernet-phy@0 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <0>;
> +			interrupt-parent =3D <&gpio1>;
> +			interrupts =3D <15 IRQ_TYPE_EDGE_FALLING>;
> +			ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_00_NS>;
> +			ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_00_NS>;
> +			ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +			ti,clk-output-sel =3D <DP83867_CLK_O_SEL_OFF>;
> +			enet-phy-lane-no-swap;
> +		};
> +	};
> +};
> +
> +&i2c1 {
> +	clock-frequency =3D <400000>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c1>;
> +	pinctrl-1 =3D <&pinctrl_i2c1_gpio>;
> +	sda-gpios =3D <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	scl-gpios =3D <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status =3D "okay";
> +
> +	pmic: pmic@25 {
> +		reg =3D <0x25>;
> +		compatible =3D "nxp,pca9450c";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_pmic>;
> +		interrupt-parent =3D <&gpio4>;
> +		interrupts =3D <18 IRQ_TYPE_LEVEL_LOW>;
> +
> +		regulators {
> +			buck1: BUCK1 {
> +				regulator-compatible =3D "BUCK1";
> +				regulator-min-microvolt =3D <600000>;
> +				regulator-max-microvolt =3D <2187500>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay =3D <3125>;
> +			};
> +
> +			buck2: BUCK2 {
> +				regulator-compatible =3D "BUCK2";
> +				regulator-min-microvolt =3D <600000>;
> +				regulator-max-microvolt =3D <2187500>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay =3D <3125>;
> +			};
> +
> +			buck4: BUCK4 {
> +				regulator-compatible =3D "BUCK4";
> +				regulator-min-microvolt =3D <600000>;
> +				regulator-max-microvolt =3D <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck5: BUCK5 {
> +				regulator-compatible =3D "BUCK5";
> +				regulator-min-microvolt =3D <600000>;
> +				regulator-max-microvolt =3D <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck6: BUCK6 {
> +				regulator-compatible =3D "BUCK6";
> +				regulator-min-microvolt =3D <600000>;
> +				regulator-max-microvolt =3D <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo1: LDO1 {
> +				regulator-compatible =3D "LDO1";
> +				regulator-min-microvolt =3D <1600000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo2: LDO2 {
> +				regulator-compatible =3D "LDO2";
> +				regulator-min-microvolt =3D <800000>;
> +				regulator-max-microvolt =3D <1150000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo3: LDO3 {
> +				regulator-compatible =3D "LDO3";
> +				regulator-min-microvolt =3D <800000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo4: LDO4 {
> +				regulator-compatible =3D "LDO4";
> +				regulator-min-microvolt =3D <800000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo5: LDO5 {
> +				regulator-compatible =3D "LDO5";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <3300000>;
> +			};
> +		};
> +	};
> +
> +	eeprom@51 {
> +		compatible =3D "atmel,24c32";
> +		reg =3D <0x51>;
> +		pagesize =3D <32>;
> +		status =3D "okay";
> +	};
> +
> +	rv3028: rtc@52 {
> +		compatible =3D "microcrystal,rv3028";
> +		reg =3D <0x52>;
> +		trickle-resistor-ohms =3D <1000>;
> +		enable-level-switching-mode;
> +		status =3D "okay";
> +	};
> +};
> +
> +/* eMMC */
> +&usdhc3 {
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc3>;
> +	pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> +	bus-width =3D <8>;
> +	non-removable;
> +	status =3D "okay";
> +};
> +
> +&wdog1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_wdog>;
> +	fsl,ext-reset-output;
> +	status =3D "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_fec: fecgrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_SAI1_RXD2__ENET1_MDC		0x3
> +			MX8MP_IOMUXC_SAI1_RXD3__ENET1_MDIO		0x3
> +			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0		0x91
> +			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1		0x91
> +			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2		0x91
> +			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3		0x91
> +			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC		0x91
> +			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL	0x91
> +			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0		0x1f
> +			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1		0x1f
> +			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2		0x1f
> +			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3		0x1f
> +			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL	0x1f
> +			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC		0x1f
> +			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15		0x11
> +		>;
> +	};
> +
> +	pinctrl_i2c1: i2c1grp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL		0x400001c3
> +			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001c3
> +		>;
> +	};
> +
> +	pinctrl_i2c1_gpio: i2c1gpiogrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14	0x1e3
> +			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15	0x1e3
> +		>;
> +	};
> +
> +	pinctrl_pmic: pmicirqgrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18	0x141
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d0
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x190
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d4
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d4
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d4
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d4
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d4
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d4
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d4
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d4
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x194
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d6
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d6
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d6
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d6
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d6
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d6
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d6
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
> +		>;
> +	};
> +
> +	pinctrl_wdog: wdoggrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B	0xc6
> +		>;
> +	};
> +};


=2D-=20
Alexander Dahl           Thorsis Technologies GmbH   T +49 391 544 563 1000
Industrieautomation      Oststr. 18                  F +49 391 544 563 9099
T +49 391 544 563 3036   39114 Magdeburg             https://www.thorsis.co=
m/

Sitz der Gesellschaft: Magdeburg
Amtsgericht Stendal HRB 110339
Gesch=C3=A4ftsf=C3=BChrer: Dipl.-Ing. Thorsten Szczepanski



