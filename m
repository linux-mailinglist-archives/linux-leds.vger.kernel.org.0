Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83488E739F
	for <lists+linux-leds@lfdr.de>; Mon, 28 Oct 2019 15:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbfJ1O1r (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Oct 2019 10:27:47 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45476 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfJ1O1p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 28 Oct 2019 10:27:45 -0400
Received: by mail-pf1-f193.google.com with SMTP id c7so5801292pfo.12
        for <linux-leds@vger.kernel.org>; Mon, 28 Oct 2019 07:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/HL9YBiLoRlBS6OrTu7kfygpZZ0iI9hXnsYOuhkeDvM=;
        b=vJESMvErOs9dESbiqmU0md9p1kjuRmALXPFcgEsRfFiCTI/THnTS5OTO64E6yd8W8n
         9u8nuGQ52pSCgrcKqhzLs6JZk+Nco5CxIqay3Du11pjB/b4KME+hRgsXHQt/dXkHYqWv
         gWK88XVonV4ALJN29GZ0/8kHzCHzm+suTQNggKe9wTQxbEUmBzbOJevl3mTRpGNZ9WOv
         fLpTH4377+PK9sIQ/SN3Z1tegkCd0+IEgSC1qgj5/75Ehgr3QfRWW7/6qay1uWKfe08l
         x+eGYT/lntcAVORSSLF8WXdN8Rc8eIhzfFIli/2V5awyaitBgleS+f545+jCoAfcu3Mv
         yQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/HL9YBiLoRlBS6OrTu7kfygpZZ0iI9hXnsYOuhkeDvM=;
        b=bT6Buft9HHV6Mkj1xXtEA6pRXtHJ9STND0T+3X7qBXPpBOiRhSmx7fT4NDV+tTdNKE
         H3PbjJCapeeOvPomTi7Mjr+alFFRztyyQf2SW2gif/Q0/se67u4fRbCu9YdBFqrK++Rv
         evFWSX9sTRFxtCsvWSB6nDvqWw7p4KQ5xmmnS67xANcrU1hlqLGXWESmg1ogKyNVBHdS
         KKKxu4M8O9gIbOdLHNwsks+MrBer+GTcPxJORF8yFoMBjjTbCszSyvBB116rDj71CZd4
         Puyp7yAYKFTM8rxuRLLFtudz+uXDhtKaGjLpyZrp8oV+dUmbAQb3hBAo8WvQuRa2JHoG
         i/GQ==
X-Gm-Message-State: APjAAAXTQEq7VFhT3O482Ivn2Imw6kz9y+p14hgmLqbLhqhMMpK1pm07
        JhRm8bJHRF2i6WO+CPEzGrFE
X-Google-Smtp-Source: APXvYqwsEBto9T1KILDr+wrK69nxqFxUYcChg0hw1+9EsMMJwNJTmt2B0/ruq34SLctsmOn8L5Lypg==
X-Received: by 2002:a17:90a:3be4:: with SMTP id e91mr363764pjc.56.1572272863073;
        Mon, 28 Oct 2019 07:27:43 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6004:d1fe:706d:952a:57bd:23b6])
        by smtp.gmail.com with ESMTPSA id v4sm10705083pff.181.2019.10.28.07.27.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Oct 2019 07:27:41 -0700 (PDT)
Date:   Mon, 28 Oct 2019 19:57:32 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     s.hauer@pengutronix.de, robh+dt@kernel.org, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        darshak.patel@einfochips.com, prajose.john@einfochips.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, pavel@ucw.cz,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: freescale: Add devicetree support for
 Thor96 board
Message-ID: <20191028142732.GA29312@Mani-XPS-13-9360>
References: <20191024144235.3182-1-manivannan.sadhasivam@linaro.org>
 <20191024144235.3182-3-manivannan.sadhasivam@linaro.org>
 <20191028115110.GE16985@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028115110.GE16985@dragon>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Shawn,

On Mon, Oct 28, 2019 at 07:51:12PM +0800, Shawn Guo wrote:
> On Thu, Oct 24, 2019 at 08:12:34PM +0530, Manivannan Sadhasivam wrote:
> > Add devicetree support for Thor96 board from Einfochips. This board is
> > one of the 96Boards Consumer Edition platform powered by the NXP
> > i.MX8MQ SoC.
> > 
> > Following are the features supported currently:
> > 
> > 1. uSD
> > 2. WiFi/BT
> > 3. Ethernet
> > 4. EEPROM (M24256)
> > 5. NOR Flash (W25Q256JW)
> > 6. 2xUSB3.0 ports and 1xUSB2.0 port at HS expansion
> > 
> > More information about this board can be found in Arrow website:
> > https://www.arrow.com/en/products/i.imx8-thor96/arrow-development-tools
> > 
> > Link to 96Boards CE Specification: https://linaro.co/ce-specification
> > 
> > Signed-off-by: Darshak Patel <darshak.patel@einfochips.com>
> > [Mani: cleaned up for upstream]
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  .../boot/dts/freescale/imx8mq-thor96.dts      | 581 ++++++++++++++++++
> >  2 files changed, 582 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-thor96.dts
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 93fce8f0c66d..dec1662019be 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -28,6 +28,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mq-hummingboard-pulse.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-librem5-devkit.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-nitrogen.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-pico-pi.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx8mq-thor96.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-rmb3.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-ai_ml.dtb
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-thor96.dts b/arch/arm64/boot/dts/freescale/imx8mq-thor96.dts
> > new file mode 100644
> > index 000000000000..e1adf24c2602
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq-thor96.dts
> > @@ -0,0 +1,581 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2019 Einfochips
> > + * Copyright 2019 Linaro Ltd.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "imx8mq.dtsi"
> > +
> > +/ {
> > +	model = "Einfochips i.MX8MQ Thor96";
> > +	compatible = "einfochips,imx8mq-thor96", "fsl,imx8mq";
> > +
> > +	chosen {
> > +		stdout-path = &uart1;
> > +	};
> > +
> > +	memory@40000000 {
> > +		device_type = "memory";
> > +		reg = <0x00000000 0x40000000 0 0x80000000>;
> > +	};
> > +
> > +	leds {
> > +		compatible = "gpio-leds";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_leds>;
> > +
> > +		user-led1 {
> > +			label = "green:user1";
> > +			gpios = <&gpio4 21 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "heartbeat";
> > +		};
> > +
> > +		user-led2 {
> > +			label = "green:user2";
> > +			gpios = <&gpio4 22 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "none";
> 
> I see linux,default-trigger is defined in Documentation/devicetree/bindings/leds/common.txt
> with given string values. "none" and the following ones are not there.
> I'm not sure how this works.
> 

The devicetree binding is not updated. I think folks just added triggers
to the respective places but didn't bother to update the binding.

For instance, mmc* trigger is registered here:
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/mmc/core/host.c#L476

For `none`, it is like removing the trigger. This is the default mode if the
trigger property is not present:
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/leds/led-triggers.c#L113

You can see the list of LED triggers by `cat`ing this file:
/sys/class/leds/<led>/trigger

Copied Pavel and LED list for reference.

> > +		};
> > +
> > +		user-led3 {
> > +			label = "green:user3";
> > +			gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "mmc1";
> > +			default-state = "off";
> > +		};
> > +
> > +		user-led4 {
> > +			label = "green:user4";
> > +			gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> > +			panic-indicator;
> > +			linux,default-trigger = "none";
> > +		};
> > +
> > +		wlan-active-led {
> > +			label = "yellow:wlan";
> > +			gpios = <&gpio4 1 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "phy0tx";
> > +			default-state = "off";
> > +		};
> > +
> > +		bt-active-led {
> > +			label = "blue:bt";
> > +			gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "hci0-power";
> > +			default-state = "off";
> > +		};
> > +	};
> > +
> > +	reg_usdhc1_vmmc: reg-usdhc1-vmmc {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VDD_3V3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-always-on;
> > +	};
> > +
> > +	reg_usdhc1_vqmmc: reg-usdhc1-vqmmc {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VCC_1V8_EXT";
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		regulator-always-on;
> > +	};
> > +
> > +	reg_usdhc2_vmmc: reg-usdhc2-vmmc {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VSD_3V3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-always-on;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_reg_usdhc2>;
> > +		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +
> > +	reg_usdhc2_vqmmc: reg-usdhc2-vqmmc {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "NVCC_SD2";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-always-on;
> > +	};
> > +
> > +	sdio_pwrseq: sdio-pwrseq {
> > +		compatible = "mmc-pwrseq-simple";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_wifi_reg_on>;
> > +		gpio = <&gpio3 3 GPIO_ACTIVE_HIGH>;
> > +	};
> > +};
> > +
> > +/* LS-SPI0 */
> > +&ecspi2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_ecspi2>;
> > +	status = "okay";
> > +};
> > +
> > +&fec1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_fec1>;
> > +	phy-mode = "rgmii-id";
> > +	phy-reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
> > +	phy-handle = <&ethphy>;
> > +	fsl,magic-packet;
> > +	status = "okay";
> > +
> > +	mdio {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		ethphy: ethernet-phy@3 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <3>;
> > +		};
> > +	};
> > +};
> > +
> > +/* LS-I2C0 */
> > +&i2c1 {
> > +	clock-frequency = <100000>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_i2c1>;
> > +	status = "okay";
> > +
> > +	pmic@8 {
> > +		compatible = "fsl,pfuze100";
> > +		reg = <0x8>;
> > +
> > +		regulators {
> > +			sw1a_reg: sw1ab {
> > +				regulator-min-microvolt = <300000>;
> > +				regulator-max-microvolt = <1875000>;
> > +			};
> > +
> > +			sw1c_reg: sw1c {
> > +				regulator-min-microvolt = <300000>;
> > +				regulator-max-microvolt = <1875000>;
> > +			};
> > +
> > +			sw2_reg: sw2 {
> > +				regulator-min-microvolt = <800000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-always-on;
> > +			};
> > +
> > +			sw3a_reg: sw3ab {
> > +				regulator-min-microvolt = <400000>;
> > +				regulator-max-microvolt = <1975000>;
> > +				regulator-always-on;
> > +			};
> > +
> > +			sw4_reg: sw4 {
> > +				regulator-min-microvolt = <800000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-always-on;
> > +			};
> > +
> > +			swbst_reg: swbst {
> > +				regulator-min-microvolt = <5000000>;
> > +				regulator-max-microvolt = <5150000>;
> > +			};
> > +
> > +			snvs_reg: vsnvs {
> > +				regulator-min-microvolt = <1000000>;
> > +				regulator-max-microvolt = <3000000>;
> > +				regulator-always-on;
> > +			};
> > +
> > +			vref_reg: vrefddr {
> > +				regulator-always-on;
> > +			};
> > +
> > +			vgen1_reg: vgen1 {
> > +				regulator-min-microvolt = <800000>;
> > +				regulator-max-microvolt = <1550000>;
> > +			};
> > +
> > +			vgen2_reg: vgen2 {
> > +				regulator-min-microvolt = <800000>;
> > +				regulator-max-microvolt = <1550000>;
> > +				regulator-always-on;
> > +			};
> > +
> > +			vgen3_reg: vgen3 {
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-always-on;
> > +			};
> > +
> > +			vgen4_reg: vgen4 {
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-always-on;
> > +			};
> > +
> > +			vgen5_reg: vgen5 {
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-always-on;
> > +			};
> > +
> > +			vgen6_reg: vgen6 {
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <3300000>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +/* LS-I2C1 */
> > +&i2c2 {
> > +	clock-frequency = <100000>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_i2c2>;
> > +	status = "okay";
> > +
> > +	eeprom: eeprom@50 {
> > +		compatible = "atmel,24c256";
> > +		reg = <0x50>;
> > +	};
> > +};
> > +
> > +/* HS-I2C2 */
> > +&i2c3 {
> > +	clock-frequency = <100000>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_i2c3>;
> > +	status = "okay";
> > +};
> > +
> > +/* HS-I2C3 */
> > +&i2c4 {
> > +	clock-frequency = <100000>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_i2c4>;
> > +	status = "okay";
> > +};
> > +
> > +&pgc_gpu {
> > +	power-supply = <&sw1a_reg>;
> > +};
> > +
> > +&pgc_vpu {
> > +	power-supply = <&sw1c_reg>;
> > +};
> > +
> > +&qspi0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_qspi0>;
> > +	status = "okay";
> > +
> > +	flash@0 {
> > +		compatible = "jedec,spi-nor";
> > +		spi-max-frequency = <100000000>;
> > +		reg = <0>;
> > +	};
> > +};
> > +
> > +/* Debug UART */
> > +&uart1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_uart1>;
> > +	assigned-clocks = <&clk IMX8MQ_CLK_UART1>;
> > +	assigned-clock-parents = <&clk IMX8MQ_CLK_25M>;
> > +	status = "okay";
> > +};
> > +
> > +/* LS-UART0 */
> > +&uart2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_uart2>;
> > +	assigned-clocks = <&clk IMX8MQ_CLK_UART2>;
> > +	assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_80M>;
> > +	fsl,uart-has-rtscts;
> 
> uart-has-rtscts
>

okay.

Thanks,
Mani
 
> Shawn
> 
> > +	status = "okay";
> > +
> > +	bluetooth {
> > +		compatible = "brcm,bcm43438-bt";
> > +		device-wakeup-gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
> > +		host-wakeup-gpios = <&gpio3 14 GPIO_ACTIVE_HIGH>;
> > +		shutdown-gpios = <&gpio3 5 GPIO_ACTIVE_HIGH>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_bt_gpios>;
> > +	};
> > +};
> > +
> > +/* LS-UART1 */
> > +&uart3 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_uart3>;
> > +	assigned-clocks = <&clk IMX8MQ_CLK_UART3>;
> > +	assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_80M>;
> > +	status = "okay";
> > +};
> > +
> > +&usb3_phy1 {
> > +	status = "okay";
> > +};
> > +
> > +&usb_dwc3_1 {
> > +	dr_mode = "host";
> > +	status = "okay";
> > +};
> > +
> > +/* SDIO */
> > +&usdhc1 {
> > +	#address-cells = <0x1>;
> > +	#size-cells = <0x0>;
> > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 = <&pinctrl_usdhc1>;
> > +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> > +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> > +	vmmc-supply = <&reg_usdhc1_vmmc>;
> > +	vqmmc-supply = <&reg_usdhc1_vqmmc>;
> > +	mmc-pwrseq = <&sdio_pwrseq>;
> > +	bus-width = <4>;
> > +	non-removable;
> > +	no-sd;
> > +	no-emmc;
> > +	status = "okay";
> > +
> > +	brcmf: wifi@1 {
> > +		reg = <1>;
> > +		compatible = "brcm,bcm4329-fmac";
> > +	};
> > +};
> > +
> > +/* uSD */
> > +&usdhc2 {
> > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> > +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> > +	vmmc-supply = <&reg_usdhc2_vmmc>;
> > +	vqmmc-supply = <&reg_usdhc2_vqmmc>;
> > +	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
> > +	bus-width = <4>;
> > +	no-sdio;
> > +	no-emmc;
> > +	disable-wp;
> > +	status = "okay";
> > +};
> > +
> > +&wdog1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_wdog>;
> > +	fsl,ext-reset-output;
> > +	status = "okay";
> > +};
> > +
> > +&iomuxc {
> > +	pinctrl_bt_gpios: btgpiosgrp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_SAI5_RXD1_GPIO3_IO22		0x19
> > +			MX8MQ_IOMUXC_NAND_DQS_GPIO3_IO14		0x19
> > +			MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5			0x19
> > +		>;
> > +	};
> > +
> > +	pinctrl_ecspi2: ecspi2grp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK		0x16
> > +			MX8MQ_IOMUXC_ECSPI2_MOSI_ECSPI2_MOSI		0x16
> > +			MX8MQ_IOMUXC_ECSPI2_MISO_ECSPI2_MISO		0x16
> > +			MX8MQ_IOMUXC_ECSPI2_SS0_ECSPI2_SS0		0x16
> > +		>;
> > +	};
> > +
> > +	pinctrl_fec1: fec1grp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_ENET_MDC_ENET1_MDC			0x4
> > +			MX8MQ_IOMUXC_ENET_MDIO_ENET1_MDIO		0x24
> > +			MX8MQ_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1c
> > +			MX8MQ_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1c
> > +			MX8MQ_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1c
> > +			MX8MQ_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1c
> > +			MX8MQ_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
> > +			MX8MQ_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
> > +			MX8MQ_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
> > +			MX8MQ_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
> > +			MX8MQ_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1c
> > +			MX8MQ_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
> > +			MX8MQ_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
> > +			MX8MQ_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1c
> > +			MX8MQ_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x19
> > +		>;
> > +	};
> > +
> > +	pinctrl_i2c1: i2c1grp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_I2C1_SCL_I2C1_SCL			0x4000007f
> > +			MX8MQ_IOMUXC_I2C1_SDA_I2C1_SDA			0x4000007f
> > +		>;
> > +	};
> > +
> > +	pinctrl_i2c2: i2c2grp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_I2C2_SCL_I2C2_SCL			0x4000007f
> > +			MX8MQ_IOMUXC_I2C2_SDA_I2C2_SDA			0x4000007f
> > +		>;
> > +	};
> > +
> > +	pinctrl_i2c3: i2c3grp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_I2C3_SCL_I2C3_SCL			0x4000007f
> > +			MX8MQ_IOMUXC_I2C3_SDA_I2C3_SDA			0x4000007f
> > +		>;
> > +	};
> > +
> > +	pinctrl_i2c4: i2c4grp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_I2C4_SCL_I2C4_SCL			0x4000007f
> > +			MX8MQ_IOMUXC_I2C4_SDA_I2C4_SDA			0x4000007f
> > +		>;
> > +	};
> > +
> > +	pinctrl_leds: ledsgrp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_SAI2_RXFS_GPIO4_IO21		0x19
> > +			MX8MQ_IOMUXC_SAI2_RXC_GPIO4_IO22		0x19
> > +			MX8MQ_IOMUXC_SAI3_RXFS_GPIO4_IO28		0x19
> > +			MX8MQ_IOMUXC_SAI3_RXC_GPIO4_IO29		0x19
> > +			MX8MQ_IOMUXC_SAI1_RXC_GPIO4_IO1			0x19
> > +			MX8MQ_IOMUXC_SAI1_RXFS_GPIO4_IO0		0x19
> > +		>;
> > +	};
> > +
> > +	pinctrl_qspi0: qspi0grp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_NAND_ALE_QSPI_A_SCLK		0x82
> > +			MX8MQ_IOMUXC_NAND_CE0_B_QSPI_A_SS0_B		0x82
> > +			MX8MQ_IOMUXC_NAND_DATA00_QSPI_A_DATA0		0x82
> > +			MX8MQ_IOMUXC_NAND_DATA01_QSPI_A_DATA1		0x82
> > +			MX8MQ_IOMUXC_NAND_DATA02_QSPI_A_DATA2		0x82
> > +			MX8MQ_IOMUXC_NAND_DATA03_QSPI_A_DATA3		0x82
> > +
> > +		>;
> > +	};
> > +
> > +	pinctrl_reg_usdhc2: regusdhc2grp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_SD2_RESET_B_GPIO2_IO19		0x41
> > +		>;
> > +	};
> > +
> > +	pinctrl_uart1: uart1grp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_UART1_RXD_UART1_DCE_RX		0x49
> > +			MX8MQ_IOMUXC_UART1_TXD_UART1_DCE_TX		0x49
> > +		>;
> > +	};
> > +
> > +	pinctrl_uart2: uart2grp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_UART2_RXD_UART2_DCE_RX		0x49
> > +			MX8MQ_IOMUXC_UART2_TXD_UART2_DCE_TX		0x49
> > +			MX8MQ_IOMUXC_UART4_RXD_UART2_DCE_CTS_B		0x49
> > +			MX8MQ_IOMUXC_UART4_TXD_UART2_DCE_RTS_B		0x49
> > +		>;
> > +	};
> > +
> > +	pinctrl_uart3: uart3grp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_UART3_TXD_UART3_DCE_TX		0x49
> > +			MX8MQ_IOMUXC_UART3_RXD_UART3_DCE_RX		0x49
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc1: usdhc1grp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_SD1_CLK_USDHC1_CLK			0x83
> > +			MX8MQ_IOMUXC_SD1_CMD_USDHC1_CMD			0xc3
> > +			MX8MQ_IOMUXC_SD1_DATA0_USDHC1_DATA0		0xc3
> > +			MX8MQ_IOMUXC_SD1_DATA1_USDHC1_DATA1		0xc3
> > +			MX8MQ_IOMUXC_SD1_DATA2_USDHC1_DATA2		0xc3
> > +			MX8MQ_IOMUXC_SD1_DATA3_USDHC1_DATA3		0xc3
> > +			MX8MQ_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x85
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_SD1_CLK_USDHC1_CLK			0x8d
> > +			MX8MQ_IOMUXC_SD1_CMD_USDHC1_CMD			0xcd
> > +			MX8MQ_IOMUXC_SD1_DATA0_USDHC1_DATA0		0xcd
> > +			MX8MQ_IOMUXC_SD1_DATA1_USDHC1_DATA1		0xcd
> > +			MX8MQ_IOMUXC_SD1_DATA2_USDHC1_DATA2		0xcd
> > +			MX8MQ_IOMUXC_SD1_DATA3_USDHC1_DATA3		0xcd
> > +			MX8MQ_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x85
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_SD1_CLK_USDHC1_CLK			0x9f
> > +			MX8MQ_IOMUXC_SD1_CMD_USDHC1_CMD			0xdf
> > +			MX8MQ_IOMUXC_SD1_DATA0_USDHC1_DATA0		0xdf
> > +			MX8MQ_IOMUXC_SD1_DATA1_USDHC1_DATA1		0xdf
> > +			MX8MQ_IOMUXC_SD1_DATA2_USDHC1_DATA2		0xdf
> > +			MX8MQ_IOMUXC_SD1_DATA3_USDHC1_DATA3		0xdf
> > +			MX8MQ_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x85
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_SD2_CD_B_GPIO2_IO12		0x41
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc2: usdhc2grp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_SD2_CLK_USDHC2_CLK			0x83
> > +			MX8MQ_IOMUXC_SD2_CMD_USDHC2_CMD			0xc3
> > +			MX8MQ_IOMUXC_SD2_DATA0_USDHC2_DATA0		0xc3
> > +			MX8MQ_IOMUXC_SD2_DATA1_USDHC2_DATA1		0xc3
> > +			MX8MQ_IOMUXC_SD2_DATA2_USDHC2_DATA2		0xc3
> > +			MX8MQ_IOMUXC_SD2_DATA3_USDHC2_DATA3		0xc3
> > +			MX8MQ_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xc1
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_SD2_CLK_USDHC2_CLK			0x8c
> > +			MX8MQ_IOMUXC_SD2_CMD_USDHC2_CMD			0xcc
> > +			MX8MQ_IOMUXC_SD2_DATA0_USDHC2_DATA0		0xcc
> > +			MX8MQ_IOMUXC_SD2_DATA1_USDHC2_DATA1		0xcc
> > +			MX8MQ_IOMUXC_SD2_DATA2_USDHC2_DATA2		0xcc
> > +			MX8MQ_IOMUXC_SD2_DATA3_USDHC2_DATA3		0xcc
> > +			MX8MQ_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xc1
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_SD2_CLK_USDHC2_CLK			0x9c
> > +			MX8MQ_IOMUXC_SD2_CMD_USDHC2_CMD			0xdc
> > +			MX8MQ_IOMUXC_SD2_DATA0_USDHC2_DATA0		0xdc
> > +			MX8MQ_IOMUXC_SD2_DATA1_USDHC2_DATA1		0xdc
> > +			MX8MQ_IOMUXC_SD2_DATA2_USDHC2_DATA2		0xdc
> > +			MX8MQ_IOMUXC_SD2_DATA3_USDHC2_DATA3		0xdc
> > +			MX8MQ_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xcc
> > +		>;
> > +	};
> > +
> > +	pinctrl_wdog: wdoggrp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0xc6
> > +		>;
> > +	};
> > +
> > +	pinctrl_wifi_reg_on: wifiregongrp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_NAND_CE2_B_GPIO3_IO3		0x17059
> > +		>;
> > +	};
> > +};
> > -- 
> > 2.17.1
> > 
