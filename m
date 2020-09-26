Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD55D279B9D
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 19:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgIZRuL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Sep 2020 13:50:11 -0400
Received: from mail.nic.cz ([217.31.204.67]:42970 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgIZRuL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 26 Sep 2020 13:50:11 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id D48B614081C;
        Sat, 26 Sep 2020 19:50:08 +0200 (CEST)
Date:   Sat, 26 Sep 2020 19:50:08 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr, robert.marko@sartura.hr
Subject: Re: [PATCH v2 7/7] arm64: dts: marvell: Add a device tree for the
 iEi Puzzle-M801 board
Message-ID: <20200926195008.6bd84dd3@nic.cz>
In-Reply-To: <20200926135514.26189-8-luka.kovacic@sartura.hr>
References: <20200926135514.26189-1-luka.kovacic@sartura.hr>
        <20200926135514.26189-8-luka.kovacic@sartura.hr>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 26 Sep 2020 15:55:14 +0200
Luka Kovacic <luka.kovacic@sartura.hr> wrote:

> +	leds {
> +		compatible = "gpio-leds";
> +		status = "okay";
> +		pinctrl-0 = <&cp0_sfpplus_led_pins &cp1_sfpplus_led_pins>;
> +		pinctrl-names = "default";
> +
> +		led0 {
> +			function = LED_FUNCTION_STATUS;
> +			label = "p2_act";
> +			gpios = <&cp1_gpio1 6 GPIO_ACTIVE_LOW>;
> +		};

There should be a dash in LED node name, please pass this dts via
dt_binding_check
  led-0 {
    ...
  };

Also why not add the `color` property to the LED? This is DTS for a
specific device, right?
`label` is obsolete. The LED subsystem creates a name in form
  [device:]color:function
If this LED should blink for activity on port 2 (is this an ethernet
port?), the function should be LED_FUNCTION_LAN and function-enumerator
should be <2> (or function should be LED_FUNCTION_ACTIVITY, depending
on how the LED subsystem goes forward with this, but certainly not
LED_FUNCTION_STATUS), and trigger-sources should be set to point to the
ethernet port.

Luka, are you willing to change this once we solve this API properly
in LED subsystem?



> +		led6 {
> +			function = LED_FUNCTION_STATUS;
> +			linux,default-trigger = "disk-activity";
> +			label = "front-hdd-led";
> +			gpios = <&cp0_gpio2 22 GPIO_ACTIVE_HIGH>;
> +		};

led-6. LED_FUNCTION_DISK. `label` deprecated.

> +		leds {
> +			compatible = "iei,wt61p803-puzzle-leds";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			led@0 {
> +				reg = <0>;
> +				color = <LED_COLOR_ID_BLUE>;
> +				label = "front-power-led";
> +			};

Again, `label` is deprecated. Rather use function =
<LED_FUNCTION_POWER>;

Marek
