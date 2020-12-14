Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06BBA2D9497
	for <lists+linux-leds@lfdr.de>; Mon, 14 Dec 2020 10:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439528AbgLNJKj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Dec 2020 04:10:39 -0500
Received: from mickerik.phytec.de ([195.145.39.210]:50028 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728884AbgLNJKi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Dec 2020 04:10:38 -0500
X-Greylist: delayed 941 seconds by postgrey-1.27 at vger.kernel.org; Mon, 14 Dec 2020 04:10:36 EST
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1607936054; x=1610528054;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0SJwbOYNESTrIzwEdJ0x3eWQ1t/O0a2iTMsxCA+/kuU=;
        b=FHznXfPz4OlOClYEhex87Z9V+Xq1sKE2L0P+3klqovyM7QACQwY9kZS6tldl0K58
        HjjJ1fqkyo88Ltr0cEbcZXMQv32Qki77o/lVwD3eKt7/M8O7HnSzRb1zzaQ1Tpdm
        a6WRYl1n9g0Jo069lP5J2ISFXMhFhvZKvRYfIOP3gHY=;
X-AuditID: c39127d2-96bff70000006435-58-5fd72836d0b9
Received: from Berlix.phytec.de (Berlix.phytec.de [172.16.0.117])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 24.91.25653.63827DF5; Mon, 14 Dec 2020 09:54:14 +0100 (CET)
Received: from llp-tremmet.phytec.de (172.16.0.116) by Berlix.phytec.de
 (172.16.0.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 14 Dec
 2020 09:54:14 +0100
Message-ID: <0404db9ce2e0c96aa70ecc6afc51098e1f5e19bc.camel@phytec.de>
Subject: Re: [PATCH v3 4/4] arm64: dts: freescale: Add support for
 phyBOARD-Pollux-i.MX8MP
From:   Teresa Remmet <t.remmet@phytec.de>
To:     Alexander Dahl <ada@thorsis.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        "Krzysztof Kozlowski" <krzk@kernel.org>,
        <linux-leds@vger.kernel.org>
Date:   Mon, 14 Dec 2020 09:54:14 +0100
In-Reply-To: <6908071.W7BzXqEGyb@ada>
References: <1607694535-417799-1-git-send-email-t.remmet@phytec.de>
         <1607694535-417799-5-git-send-email-t.remmet@phytec.de>
         <6908071.W7BzXqEGyb@ada>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.0.116]
X-ClientProxiedBy: Florix.phytec.de (172.16.0.118) To Berlix.phytec.de
 (172.16.0.117)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsWyRoChVNdM43q8wZb3FhZ9B5ks3i/rYbSY
        f+Qcq8XDq/4W589vYLfY9Pgaq8XWN+sYLVr3HmG3+Lt9E4vFiy3iDlwea+atYfTYOesuu8em
        VZ1sHpuX1Hv0/zXwWDf3PbvH501yAexRXDYpqTmZZalF+nYJXBmvv/9mLmg1rPjz+wRzA+Mm
        lS5GTg4JAROJBy2/mbsYuTiEBJYxSezZ+40JwnnGKPFxwQZWkCpeATeJtS+bmUFsYYEYiSuP
        V4DF2QQ0JJ6uOM0EYosIqEg8e7uEDcRmFrjAJPH4uRmIzSKgKnHz/0Swek4gu+HrSRYQW0hg
        FqPEvllWEPWaEq3bf7NDXKQj8eH+J0aIvYISJ2c+YYGokZdo3jqbGaJXXmLXpZOMEPUKEnN/
        T2SGsMMl/izfzzSBUWgWkrGzkIyahWTUAkbmVYxCuZnJ2alFmdl6BRmVJanJeimpmxiBkXN4
        ovqlHYx9czwOMTJxMB5ilOBgVhLh/V1/OV6INyWxsiq1KD++qDQntfgQozQHi5I47wbekjAh
        gfTEktTs1NSC1CKYLBMHp1QDY+taqaNmU6Pl4/7VOP97W33+Q37J9v8Xbt6//vzR1IXrMqot
        mDdr2E1JMzRWzeYzWP8ysdrfoIZz0sytUTvWp1134KxOUxZ/KNgxeWX+gvLVlytSty5/MO33
        vXxtc5EiNfecL3J9WZckF7E2/dd065Z5cttf4Oez0NZATYlq1snX3v5eM3/hYyWW4oxEQy3m
        ouJEAEc6gbCKAgAA
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Alexander,

Am Freitag, den 11.12.2020, 15:55 +0100 schrieb Alexander Dahl:
> Hello Teresa,
> 
> I'm sorry if I was too brief in my review last time, see below.
> 
> Am Freitag, 11. Dezember 2020, 14:48:55 CET schrieb Teresa Remmet:
> > Add initial support for phyBOARD-Pollux-i.MX8MP.
> > Supported basic features:
> > 	* eMMC
> > 	* i2c EEPROM
> > 	* i2c RTC
> > 	* i2c LED
> > 	* PMIC
> > 	* debug UART
> > 	* SD card
> > 	* 1Gbit Ethernet (fec)
> > 	* watchdog
> > 
> > Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile             |   1 +
> >  .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   | 163
> > ++++++++++++
> >  .../boot/dts/freescale/imx8mp-phycore-som.dtsi     | 296
> > +++++++++++++++++++++ 3 files changed, 460 insertions(+)
> >  create mode 100644
> > arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts create
> > mode
> > 100644 arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > b/arch/arm64/boot/dts/freescale/Makefile index
> > acfb8af45912..a43b496678be
> > 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -37,6 +37,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mn-ddr4-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-hummingboard-pulse.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-librem5-devkit.dtb
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-
> > rdk.dts
> > b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts new
> > file
> > mode 100644
> > index 000000000000..e92868c10526
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> > @@ -0,0 +1,163 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 PHYTEC Messtechnik GmbH
> > + * Author: Teresa Remmet <t.remmet@phytec.de>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/leds/leds-pca9532.h>
> > +#include <dt-bindings/pwm/pwm.h>
> > +#include "imx8mp-phycore-som.dtsi"
> > +
> > +/ {
> > +	model = "PHYTEC phyBOARD-Pollux i.MX8MP";
> > +	compatible = "phytec,imx8mp-phyboard-pollux-rdk",
> > +		     "phytec,imx8mp-phycore-som", "fsl,imx8mp";
> > +
> > +	chosen {
> > +		stdout-path = &uart2;
> > +	};
> > +
> > +	reg_usdhc2_vmmc: regulator-usdhc2 {
> > +		compatible = "regulator-fixed";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> > +		regulator-name = "VSD_3V3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		startup-delay-us = <100>;
> > +		off-on-delay-us = <12000>;
> > +	};
> > +};
> > +
> > +&i2c2 {
> > +	clock-frequency = <400000>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_i2c2>;
> > +	pinctrl-1 = <&pinctrl_i2c2_gpio>;
> > +	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	status = "okay";
> > +
> > +	eeprom@51 {
> > +		compatible = "atmel,24c02";
> > +		reg = <0x51>;
> > +		pagesize = <16>;
> > +		status = "okay";
> > +	};
> > +
> > +	leds@62 {
> > +		compatible = "nxp,pca9533";
> > +		reg = <0x62>;
> > +		status = "okay";
> > +
> > +		led1 {
> > +			type = <PCA9532_TYPE_LED>;
> > +		};
> > +
> > +		led2 {
> > +			type = <PCA9532_TYPE_LED>;
> > +		};
> > +
> > +		led3 {
> > +			type = <PCA9532_TYPE_LED>;
> > +		};
> > +	};
> 
> You just removed the "label" property. Now the label is generated 
> automatically (which is the preferred way), but you did neither add
> the 
> property "color" nor "function", so the label will be constructed
> from the 
> node name only.

I have tried to set the color property. But in sysfs only the node name
showed up. 

Looking at the code the leds-pca9532 calls devm_led_classdev_register()
and does not pass any init_data. So led_classdev_register_ext() always
sets the node name.

I did not want to set a property that does not have an effect. That's
why I just removed the deprecated one.

Teresa 

> 
> Well I just saw the binding for that LED controller is not converted
> to yaml 
> yet … Documentation/devicetree/bindings/leds/leds-pca9532.txt
> 
> Anyways, the modern approach would look like somehow like this:
> 
>                 led-0 {
>                         function = LED_FUNCTION_ALARM;
>                         color = <LED_COLOR_ID_RED>;
>                 };
> 
>                 led-1 {
>                         function = LED_FUNCTION_STATUS;
>                         color = <LED_COLOR_ID_GREEN>;
>                 };
> 
>                 led-2 {
>                         function = LED_FUNCTION_INDICATOR;
>                         color = <LED_COLOR_ID_RED>;
>                         function-enumerator = <1>;
>                 };
> 
>                 led-3 {
>                         function = LED_FUNCTION_INDICATOR;
>                         color = <LED_COLOR_ID_RED>;
>                         function-enumerator = <2>;
>                 };
> 
> Hope that helps, for more see Documentation/devicetree/bindings/leds
> and 
> especially the bindings already converted to yaml. The available
> macros are in 
> include/dt-bindings/leds/common.h 
> 
> Maybe just add the colors for now, if you're not sure what the
> function should 
> be. As far as I could see the driver for that LED controller does not
> yet 
> support multicolor, but I added linux-leds to Cc, maybe someone over
> there 
> knows more?
> 
> Sorry to nag about this, but I think it's better to not introduce new
> dts 
> files with deprecated properties. If that kind of feedback is not
> desired, 
> please let me know.
> 
> Greets
> Alex
> 
> > 

