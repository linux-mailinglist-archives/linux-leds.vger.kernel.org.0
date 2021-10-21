Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEC3436C88
	for <lists+linux-leds@lfdr.de>; Thu, 21 Oct 2021 23:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbhJUVST (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 21 Oct 2021 17:18:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:53322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230272AbhJUVSS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 21 Oct 2021 17:18:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4353261213;
        Thu, 21 Oct 2021 21:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634850962;
        bh=q/j7spVuzLeVYsGTa3phXin6HdxXoRWHcbbR+XRxjMg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ipTRWOcz392CIxbaNgbGNDyac9duJvHQRi7ajw0PkARbToIjfyrP6fwaxLloUh+1i
         LqIQ1qTApArdN1IUlEa0lixHA3H7vap5HywBrXpxNGa6wdXs9wAIazi4Nuq814ma8B
         LhMCitRvaJw/sAgd8hqQwID4Ol9IgqtwBSLDp89A2SPojvFBeC6B7cYbdHX/aNGZKx
         VPJz0NUAW787pe2Pxcw+jr1EqpVnhDP2huRdfOeSeX/HbUkwpdOXof07cpIrSiR7jP
         CXtUvnjWysYFynIYV1QioFi1ZGKWL8m32zow4JdIzjFVuqDbI4/fZHfzhPt466l6id
         gk7LcJWLcgtwg==
Received: by mail-ed1-f51.google.com with SMTP id g8so5986995edb.12;
        Thu, 21 Oct 2021 14:16:02 -0700 (PDT)
X-Gm-Message-State: AOAM533qM92Z3QxBhJQuekzhi5KQex21MIegAFBuyaciiUCaiqxCPaAt
        z7DGrICspOQU1IY7CBAvqDIPOMdY8EpAZ1+Bxg==
X-Google-Smtp-Source: ABdhPJyp73EpwM/Y8XMnqeuzDDEbLWO6fO99SQ8vZgZBu+BbsPcNypm6z6LSvn1R8odWevsPSeBotNMqqE2N1jB+xK0=
X-Received: by 2002:a17:906:5a47:: with SMTP id my7mr9805285ejc.128.1634850960686;
 Thu, 21 Oct 2021 14:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210913192816.1225025-1-robh@kernel.org> <20210913192816.1225025-7-robh@kernel.org>
In-Reply-To: <20210913192816.1225025-7-robh@kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 21 Oct 2021 16:15:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJiH5ZDpFEC+A+S=EQ5Tp4T_YhFK4A44YEGUY_NW+88qw@mail.gmail.com>
Message-ID: <CAL_JsqJiH5ZDpFEC+A+S=EQ5Tp4T_YhFK4A44YEGUY_NW+88qw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] ARM: dts: arm: Update register-bit-led nodes 'reg'
 and node names
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Sep 13, 2021 at 2:28 PM Rob Herring <robh@kernel.org> wrote:
>
> Add a 'reg' entry for register-bit-led nodes on the Arm Ltd platforms.
> The 'reg' entry is the LED control register address. With this, the node
> name can be updated to use a generic node name, 'led', and a
> unit-address.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm/boot/dts/arm-realview-eb.dtsi        | 27 +++++++++++++------
>  arch/arm/boot/dts/arm-realview-pb1176.dts     | 27 +++++++++++++------
>  arch/arm/boot/dts/arm-realview-pb11mp.dts     | 27 +++++++++++++------
>  arch/arm/boot/dts/arm-realview-pbx.dtsi       | 27 +++++++++++++------
>  arch/arm/boot/dts/integrator.dtsi             | 23 +++++++++++-----
>  arch/arm/boot/dts/mps2.dtsi                   | 10 +++++--
>  arch/arm/boot/dts/versatile-ab-ib2.dts        |  6 ++++-
>  arch/arm/boot/dts/versatile-ab.dts            | 27 +++++++++++++------
>  arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 27 +++++++++++++------
>  9 files changed, 144 insertions(+), 57 deletions(-)

Linus, Can you apply this and patch 7?

>
> diff --git a/arch/arm/boot/dts/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm-realview-eb.dtsi
> index 04e8a27ba1eb..56441ef08a55 100644
> --- a/arch/arm/boot/dts/arm-realview-eb.dtsi
> +++ b/arch/arm/boot/dts/arm-realview-eb.dtsi
> @@ -198,61 +198,72 @@ fpga {
>                 syscon: syscon@10000000 {
>                         compatible = "arm,realview-eb-syscon", "syscon", "simple-mfd";
>                         reg = <0x10000000 0x1000>;
> +                       ranges = <0x0 0x10000000 0x1000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
>
> -                       led@08.0 {
> +                       led@8,0 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x01>;
>                                 label = "versatile:0";
>                                 linux,default-trigger = "heartbeat";
>                                 default-state = "on";
>                         };
> -                       led@08.1 {
> +                       led@8,1 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x02>;
>                                 label = "versatile:1";
>                                 linux,default-trigger = "mmc0";
>                                 default-state = "off";
>                         };
> -                       led@08.2 {
> +                       led@8,2 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x04>;
>                                 label = "versatile:2";
>                                 linux,default-trigger = "cpu0";
>                                 default-state = "off";
>                         };
> -                       led@08.3 {
> +                       led@8,3 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x08>;
>                                 label = "versatile:3";
>                                 default-state = "off";
>                         };
> -                       led@08.4 {
> +                       led@8,4 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x10>;
>                                 label = "versatile:4";
>                                 default-state = "off";
>                         };
> -                       led@08.5 {
> +                       led@8,5 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x20>;
>                                 label = "versatile:5";
>                                 default-state = "off";
>                         };
> -                       led@08.6 {
> +                       led@8,6 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x40>;
>                                 label = "versatile:6";
>                                 default-state = "off";
>                         };
> -                       led@08.7 {
> +                       led@8,7 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x80>;
>                                 label = "versatile:7";
> diff --git a/arch/arm/boot/dts/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm-realview-pb1176.dts
> index 366687fb1ee3..df71ee27294d 100644
> --- a/arch/arm/boot/dts/arm-realview-pb1176.dts
> +++ b/arch/arm/boot/dts/arm-realview-pb1176.dts
> @@ -216,61 +216,72 @@ soc {
>                 syscon: syscon@10000000 {
>                         compatible = "arm,realview-pb1176-syscon", "syscon", "simple-mfd";
>                         reg = <0x10000000 0x1000>;
> +                       ranges = <0x0 0x10000000 0x1000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
>
> -                       led@08.0 {
> +                       led@8,0 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x01>;
>                                 label = "versatile:0";
>                                 linux,default-trigger = "heartbeat";
>                                 default-state = "on";
>                         };
> -                       led@08.1 {
> +                       led@8,1 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x02>;
>                                 label = "versatile:1";
>                                 linux,default-trigger = "mmc0";
>                                 default-state = "off";
>                         };
> -                       led@08.2 {
> +                       led@8,2 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x04>;
>                                 label = "versatile:2";
>                                 linux,default-trigger = "cpu0";
>                                 default-state = "off";
>                         };
> -                       led@08.3 {
> +                       led@8,3 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x08>;
>                                 label = "versatile:3";
>                                 default-state = "off";
>                         };
> -                       led@08.4 {
> +                       led@8,4 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x10>;
>                                 label = "versatile:4";
>                                 default-state = "off";
>                         };
> -                       led@08.5 {
> +                       led@8,5 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x20>;
>                                 label = "versatile:5";
>                                 default-state = "off";
>                         };
> -                       led@08.6 {
> +                       led@8,6 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x40>;
>                                 label = "versatile:6";
>                                 default-state = "off";
>                         };
> -                       led@08.7 {
> +                       led@8,7 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x80>;
>                                 label = "versatile:7";
> diff --git a/arch/arm/boot/dts/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm-realview-pb11mp.dts
> index 228a51a38f95..54d4cbd10bdf 100644
> --- a/arch/arm/boot/dts/arm-realview-pb11mp.dts
> +++ b/arch/arm/boot/dts/arm-realview-pb11mp.dts
> @@ -303,64 +303,75 @@ soc {
>                 pb11mp_syscon: syscon@10000000 {
>                         compatible = "arm,realview-pb11mp-syscon", "syscon", "simple-mfd";
>                         reg = <0x10000000 0x1000>;
> +                       ranges = <0x0 0x10000000 0x1000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
>
> -                       led@08.0 {
> +                       led@8,0 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x01>;
>                                 label = "versatile:0";
>                                 linux,default-trigger = "heartbeat";
>                                 default-state = "on";
>                         };
> -                       led@08.1 {
> +                       led@8,1 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x02>;
>                                 label = "versatile:1";
>                                 linux,default-trigger = "mmc0";
>                                 default-state = "off";
>                         };
> -                       led@08.2 {
> +                       led@8,2 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x04>;
>                                 label = "versatile:2";
>                                 linux,default-trigger = "cpu0";
>                                 default-state = "off";
>                         };
> -                       led@08.3 {
> +                       led@8,3 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x08>;
>                                 label = "versatile:3";
>                                 linux,default-trigger = "cpu1";
>                                 default-state = "off";
>                         };
> -                       led@08.4 {
> +                       led@8,4 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x10>;
>                                 label = "versatile:4";
>                                 linux,default-trigger = "cpu2";
>                                 default-state = "off";
>                         };
> -                       led@08.5 {
> +                       led@8,5 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x20>;
>                                 label = "versatile:5";
>                                 linux,default-trigger = "cpu3";
>                                 default-state = "off";
>                         };
> -                       led@08.6 {
> +                       led@8,6 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x40>;
>                                 label = "versatile:6";
>                                 default-state = "off";
>                         };
> -                       led@08.7 {
> +                       led@8,7 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x80>;
>                                 label = "versatile:7";
> diff --git a/arch/arm/boot/dts/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm-realview-pbx.dtsi
> index ccf6f756b6ed..9366fecc699b 100644
> --- a/arch/arm/boot/dts/arm-realview-pbx.dtsi
> +++ b/arch/arm/boot/dts/arm-realview-pbx.dtsi
> @@ -220,61 +220,72 @@ soc: soc {
>                 syscon: syscon@10000000 {
>                         compatible = "arm,realview-pbx-syscon", "syscon", "simple-mfd";
>                         reg = <0x10000000 0x1000>;
> +                       ranges = <0x0 0x10000000 0x1000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
>
> -                       led@08.0 {
> +                       led@8,0 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x01>;
>                                 label = "versatile:0";
>                                 linux,default-trigger = "heartbeat";
>                                 default-state = "on";
>                         };
> -                       led@08.1 {
> +                       led@8,1 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x02>;
>                                 label = "versatile:1";
>                                 linux,default-trigger = "mmc0";
>                                 default-state = "off";
>                         };
> -                       led@08.2 {
> +                       led@8,2 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x04>;
>                                 label = "versatile:2";
>                                 linux,default-trigger = "cpu0";
>                                 default-state = "off";
>                         };
> -                       led@08.3 {
> +                       led@8,3 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x08>;
>                                 label = "versatile:3";
>                                 default-state = "off";
>                         };
> -                       led@08.4 {
> +                       led@8,4 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x10>;
>                                 label = "versatile:4";
>                                 default-state = "off";
>                         };
> -                       led@08.5 {
> +                       led@8,5 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x20>;
>                                 label = "versatile:5";
>                                 default-state = "off";
>                         };
> -                       led@08.6 {
> +                       led@8,6 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x40>;
>                                 label = "versatile:6";
>                                 default-state = "off";
>                         };
> -                       led@08.7 {
> +                       led@8,7 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x08 0x04>;
>                                 offset = <0x08>;
>                                 mask = <0x80>;
>                                 label = "versatile:7";
> diff --git a/arch/arm/boot/dts/integrator.dtsi b/arch/arm/boot/dts/integrator.dtsi
> index 602f74d2c758..ad868cfebc94 100644
> --- a/arch/arm/boot/dts/integrator.dtsi
> +++ b/arch/arm/boot/dts/integrator.dtsi
> @@ -15,10 +15,14 @@ memory {
>         core-module@10000000 {
>                 compatible = "arm,core-module-integrator", "syscon", "simple-mfd";
>                 reg = <0x10000000 0x200>;
> +               ranges = <0x0 0x10000000 0x200>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
>
>                 /* Use core module LED to indicate CPU load */
> -               led@c.0 {
> +               led@c,0 {
>                         compatible = "register-bit-led";
> +                       reg = <0x0c 0x04>;
>                         offset = <0x0c>;
>                         mask = <0x01>;
>                         label = "integrator:core_module";
> @@ -104,35 +108,42 @@ kmi@19000000 {
>                         interrupts = <4>;
>                 };
>
> -               syscon {
> +               syscon@1a000000 {
>                         /* Debug registers mapped as syscon */
>                         compatible = "syscon", "simple-mfd";
>                         reg = <0x1a000000 0x10>;
> +                       ranges = <0x0 0x1a000000 0x10>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
>
> -                       led@4.0 {
> +                       led@4,0 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x04 0x04>;
>                                 offset = <0x04>;
>                                 mask = <0x01>;
>                                 label = "integrator:green0";
>                                 linux,default-trigger = "heartbeat";
>                                 default-state = "on";
>                         };
> -                       led@4.1 {
> +                       led@4,1 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x04 0x04>;
>                                 offset = <0x04>;
>                                 mask = <0x02>;
>                                 label = "integrator:yellow";
>                                 default-state = "off";
>                         };
> -                       led@4.2 {
> +                       led@4,2 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x04 0x04>;
>                                 offset = <0x04>;
>                                 mask = <0x04>;
>                                 label = "integrator:red";
>                                 default-state = "off";
>                         };
> -                       led@4.3 {
> +                       led@4,3 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x04 0x04>;
>                                 offset = <0x04>;
>                                 mask = <0x08>;
>                                 label = "integrator:green1";
> diff --git a/arch/arm/boot/dts/mps2.dtsi b/arch/arm/boot/dts/mps2.dtsi
> index 37f5023f529c..b99577d411b1 100644
> --- a/arch/arm/boot/dts/mps2.dtsi
> +++ b/arch/arm/boot/dts/mps2.dtsi
> @@ -216,8 +216,13 @@ fpgaio@8000 {
>                         compatible = "syscon", "simple-mfd";
>                         reg = <0x8000 0x10>;
>
> -                       led0 {
> +                       ranges = <0x0 0x8000 0x10>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       led@0,0 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x00 0x04>;
>                                 offset = <0x0>;
>                                 mask = <0x01>;
>                                 label = "userled:0";
> @@ -225,8 +230,9 @@ led0 {
>                                 default-state = "on";
>                         };
>
> -                       led1 {
> +                       led@0,1 {
>                                 compatible = "register-bit-led";
> +                               reg = <0x00 0x04>;
>                                 offset = <0x0>;
>                                 mask = <0x02>;
>                                 label = "userled:1";
> diff --git a/arch/arm/boot/dts/versatile-ab-ib2.dts b/arch/arm/boot/dts/versatile-ab-ib2.dts
> index c577ff4bb4be..7ebb0dfd0467 100644
> --- a/arch/arm/boot/dts/versatile-ab-ib2.dts
> +++ b/arch/arm/boot/dts/versatile-ab-ib2.dts
> @@ -13,9 +13,13 @@ / {
>         syscon@27000000 {
>                 compatible = "arm,versatile-ib2-syscon", "syscon", "simple-mfd";
>                 reg = <0x27000000 0x4>;
> +               ranges = <0x0 0x27000000 0x4>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
>
> -               led@00.4 {
> +               led@0,4 {
>                         compatible = "register-bit-led";
> +                       reg = <0x00 0x04>;
>                         offset = <0x00>;
>                         mask = <0x10>;
>                         label = "versatile-ib2:0";
> diff --git a/arch/arm/boot/dts/versatile-ab.dts b/arch/arm/boot/dts/versatile-ab.dts
> index 151c0220047d..79f7cc241282 100644
> --- a/arch/arm/boot/dts/versatile-ab.dts
> +++ b/arch/arm/boot/dts/versatile-ab.dts
> @@ -70,61 +70,72 @@ vga_con_in: endpoint {
>         core-module@10000000 {
>                 compatible = "arm,core-module-versatile", "syscon", "simple-mfd";
>                 reg = <0x10000000 0x200>;
> +               ranges = <0x0 0x10000000 0x200>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
>
> -               led@08.0 {
> +               led@8,0 {
>                         compatible = "register-bit-led";
> +                       reg = <0x08 0x04>;
>                         offset = <0x08>;
>                         mask = <0x01>;
>                         label = "versatile:0";
>                         linux,default-trigger = "heartbeat";
>                         default-state = "on";
>                 };
> -               led@08.1 {
> +               led@8,1 {
>                         compatible = "register-bit-led";
> +                       reg = <0x08 0x04>;
>                         offset = <0x08>;
>                         mask = <0x02>;
>                         label = "versatile:1";
>                         linux,default-trigger = "mmc0";
>                         default-state = "off";
>                 };
> -               led@08.2 {
> +               led@8,2 {
>                         compatible = "register-bit-led";
> +                       reg = <0x08 0x04>;
>                         offset = <0x08>;
>                         mask = <0x04>;
>                         label = "versatile:2";
>                         linux,default-trigger = "cpu0";
>                         default-state = "off";
>                 };
> -               led@08.3 {
> +               led@8,3 {
>                         compatible = "register-bit-led";
> +                       reg = <0x08 0x04>;
>                         offset = <0x08>;
>                         mask = <0x08>;
>                         label = "versatile:3";
>                         default-state = "off";
>                 };
> -               led@08.4 {
> +               led@8,4 {
>                         compatible = "register-bit-led";
> +                       reg = <0x08 0x04>;
>                         offset = <0x08>;
>                         mask = <0x10>;
>                         label = "versatile:4";
>                         default-state = "off";
>                 };
> -               led@08.5 {
> +               led@8,5 {
>                         compatible = "register-bit-led";
> +                       reg = <0x08 0x04>;
>                         offset = <0x08>;
>                         mask = <0x20>;
>                         label = "versatile:5";
>                         default-state = "off";
>                 };
> -               led@08.6 {
> +               led@8,6 {
>                         compatible = "register-bit-led";
> +                       reg = <0x08 0x04>;
>                         offset = <0x08>;
>                         mask = <0x40>;
>                         label = "versatile:6";
>                         default-state = "off";
>                 };
> -               led@08.7 {
> +               led@8,7 {
>                         compatible = "register-bit-led";
> +                       reg = <0x08 0x04>;
>                         offset = <0x08>;
>                         mask = <0x80>;
>                         label = "versatile:7";
> diff --git a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
> index 40d95c58b55e..f7afb8faf5de 100644
> --- a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
> @@ -153,64 +153,75 @@ v2m_sysctl: sysctl@20000 {
>                                 apbregs@10000 {
>                                         compatible = "syscon", "simple-mfd";
>                                         reg = <0x010000 0x1000>;
> +                                       ranges = <0x0 0x10000 0x1000>;
> +                                       #address-cells = <1>;
> +                                       #size-cells = <1>;
>
> -                                       led0 {
> +                                       led@8,0 {
>                                                 compatible = "register-bit-led";
> +                                               reg = <0x08 0x04>;
>                                                 offset = <0x08>;
>                                                 mask = <0x01>;
>                                                 label = "vexpress:0";
>                                                 linux,default-trigger = "heartbeat";
>                                                 default-state = "on";
>                                         };
> -                                       led1 {
> +                                       led@8,1 {
>                                                 compatible = "register-bit-led";
> +                                               reg = <0x08 0x04>;
>                                                 offset = <0x08>;
>                                                 mask = <0x02>;
>                                                 label = "vexpress:1";
>                                                 linux,default-trigger = "mmc0";
>                                                 default-state = "off";
>                                         };
> -                                       led2 {
> +                                       led@8,2 {
>                                                 compatible = "register-bit-led";
> +                                               reg = <0x08 0x04>;
>                                                 offset = <0x08>;
>                                                 mask = <0x04>;
>                                                 label = "vexpress:2";
>                                                 linux,default-trigger = "cpu0";
>                                                 default-state = "off";
>                                         };
> -                                       led3 {
> +                                       led@8,3 {
>                                                 compatible = "register-bit-led";
> +                                               reg = <0x08 0x04>;
>                                                 offset = <0x08>;
>                                                 mask = <0x08>;
>                                                 label = "vexpress:3";
>                                                 linux,default-trigger = "cpu1";
>                                                 default-state = "off";
>                                         };
> -                                       led4 {
> +                                       led@8,4 {
>                                                 compatible = "register-bit-led";
> +                                               reg = <0x08 0x04>;
>                                                 offset = <0x08>;
>                                                 mask = <0x10>;
>                                                 label = "vexpress:4";
>                                                 linux,default-trigger = "cpu2";
>                                                 default-state = "off";
>                                         };
> -                                       led5 {
> +                                       led@8,5 {
>                                                 compatible = "register-bit-led";
> +                                               reg = <0x08 0x04>;
>                                                 offset = <0x08>;
>                                                 mask = <0x20>;
>                                                 label = "vexpress:5";
>                                                 linux,default-trigger = "cpu3";
>                                                 default-state = "off";
>                                         };
> -                                       led6 {
> +                                       led@8,6 {
>                                                 compatible = "register-bit-led";
> +                                               reg = <0x08 0x04>;
>                                                 offset = <0x08>;
>                                                 mask = <0x40>;
>                                                 label = "vexpress:6";
>                                                 default-state = "off";
>                                         };
> -                                       led7 {
> +                                       led@8,7 {
>                                                 compatible = "register-bit-led";
> +                                               reg = <0x08 0x04>;
>                                                 offset = <0x08>;
>                                                 mask = <0x80>;
>                                                 label = "vexpress:7";
> --
> 2.30.2
>
