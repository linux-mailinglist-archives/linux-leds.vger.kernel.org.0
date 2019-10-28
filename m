Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A064E73AF
	for <lists+linux-leds@lfdr.de>; Mon, 28 Oct 2019 15:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390103AbfJ1OdG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Oct 2019 10:33:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:36558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390102AbfJ1OdG (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 28 Oct 2019 10:33:06 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BDAC1208C0;
        Mon, 28 Oct 2019 14:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572273185;
        bh=uBafmYZtjPMwKogdIRbd9ewyuSPO8qrIg0LiiywuY0M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2mSCPBEhdDJxFiUBH2CUlBroCVPG2Z4czuTICCq0bxeUgK0eaO9UeJTf8t+YYNfUx
         WFwGbTJnjWLsSBFR+ywalEVUSYw4YYA80IXDwY+0EVbCMnQFVaJfRwXlMjYFHW8J+x
         XJ4hKiceXG4z2w9eyzhZtQxWdZSUP/HUz8vffNro=
Date:   Mon, 28 Oct 2019 22:32:42 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     s.hauer@pengutronix.de, robh+dt@kernel.org, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        darshak.patel@einfochips.com, prajose.john@einfochips.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, pavel@ucw.cz,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: freescale: Add devicetree support for
 Thor96 board
Message-ID: <20191028143240.GO16985@dragon>
References: <20191024144235.3182-1-manivannan.sadhasivam@linaro.org>
 <20191024144235.3182-3-manivannan.sadhasivam@linaro.org>
 <20191028115110.GE16985@dragon>
 <20191028142732.GA29312@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028142732.GA29312@Mani-XPS-13-9360>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Oct 28, 2019 at 07:57:32PM +0530, Manivannan Sadhasivam wrote:
> Hi Shawn,
> 
> On Mon, Oct 28, 2019 at 07:51:12PM +0800, Shawn Guo wrote:
> > On Thu, Oct 24, 2019 at 08:12:34PM +0530, Manivannan Sadhasivam wrote:
> > > Add devicetree support for Thor96 board from Einfochips. This board is
> > > one of the 96Boards Consumer Edition platform powered by the NXP
> > > i.MX8MQ SoC.
> > > 
> > > Following are the features supported currently:
> > > 
> > > 1. uSD
> > > 2. WiFi/BT
> > > 3. Ethernet
> > > 4. EEPROM (M24256)
> > > 5. NOR Flash (W25Q256JW)
> > > 6. 2xUSB3.0 ports and 1xUSB2.0 port at HS expansion
> > > 
> > > More information about this board can be found in Arrow website:
> > > https://www.arrow.com/en/products/i.imx8-thor96/arrow-development-tools
> > > 
> > > Link to 96Boards CE Specification: https://linaro.co/ce-specification
> > > 
> > > Signed-off-by: Darshak Patel <darshak.patel@einfochips.com>
> > > [Mani: cleaned up for upstream]
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> > >  .../boot/dts/freescale/imx8mq-thor96.dts      | 581 ++++++++++++++++++
> > >  2 files changed, 582 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-thor96.dts
> > > 
> > > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > > index 93fce8f0c66d..dec1662019be 100644
> > > --- a/arch/arm64/boot/dts/freescale/Makefile
> > > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > > @@ -28,6 +28,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mq-hummingboard-pulse.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-librem5-devkit.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-nitrogen.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-pico-pi.dtb
> > > +dtb-$(CONFIG_ARCH_MXC) += imx8mq-thor96.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-rmb3.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-ai_ml.dtb
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-thor96.dts b/arch/arm64/boot/dts/freescale/imx8mq-thor96.dts
> > > new file mode 100644
> > > index 000000000000..e1adf24c2602
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mq-thor96.dts
> > > @@ -0,0 +1,581 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright 2019 Einfochips
> > > + * Copyright 2019 Linaro Ltd.
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "imx8mq.dtsi"
> > > +
> > > +/ {
> > > +	model = "Einfochips i.MX8MQ Thor96";
> > > +	compatible = "einfochips,imx8mq-thor96", "fsl,imx8mq";
> > > +
> > > +	chosen {
> > > +		stdout-path = &uart1;
> > > +	};
> > > +
> > > +	memory@40000000 {
> > > +		device_type = "memory";
> > > +		reg = <0x00000000 0x40000000 0 0x80000000>;
> > > +	};
> > > +
> > > +	leds {
> > > +		compatible = "gpio-leds";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&pinctrl_leds>;
> > > +
> > > +		user-led1 {
> > > +			label = "green:user1";
> > > +			gpios = <&gpio4 21 GPIO_ACTIVE_HIGH>;
> > > +			linux,default-trigger = "heartbeat";
> > > +		};
> > > +
> > > +		user-led2 {
> > > +			label = "green:user2";
> > > +			gpios = <&gpio4 22 GPIO_ACTIVE_HIGH>;
> > > +			linux,default-trigger = "none";
> > 
> > I see linux,default-trigger is defined in Documentation/devicetree/bindings/leds/common.txt
> > with given string values. "none" and the following ones are not there.
> > I'm not sure how this works.
> > 
> 
> The devicetree binding is not updated. I think folks just added triggers
> to the respective places but didn't bother to update the binding.

Can you please bring the bindings up to date?  It will help people like
me a lot.

Shawn

> 
> For instance, mmc* trigger is registered here:
> https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/mmc/core/host.c#L476
> 
> For `none`, it is like removing the trigger. This is the default mode if the
> trigger property is not present:
> https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/leds/led-triggers.c#L113
> 
> You can see the list of LED triggers by `cat`ing this file:
> /sys/class/leds/<led>/trigger
> 
> Copied Pavel and LED list for reference.
