Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4B2D279BA3
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 19:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgIZR4g (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Sep 2020 13:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZR4g (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 26 Sep 2020 13:56:36 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1EB4C0613CE;
        Sat, 26 Sep 2020 10:56:36 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 072E1140A58;
        Sat, 26 Sep 2020 19:56:35 +0200 (CEST)
Date:   Sat, 26 Sep 2020 19:56:34 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr, robert.marko@sartura.hr
Subject: Re: [PATCH v2 1/7] dt-bindings: Add iEi vendor prefix and iEi
 WT61P803 PUZZLE driver bindings
Message-ID: <20200926195634.24712f44@nic.cz>
In-Reply-To: <20200926135514.26189-2-luka.kovacic@sartura.hr>
References: <20200926135514.26189-1-luka.kovacic@sartura.hr>
        <20200926135514.26189-2-luka.kovacic@sartura.hr>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 26 Sep 2020 15:55:08 +0200
Luka Kovacic <luka.kovacic@sartura.hr> wrote:

> diff --git a/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
> new file mode 100644
> index 000000000000..502d97630ecc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/iei,wt61p803-puzzle-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: iEi WT61P803 PUZZLE MCU LED module from IEI Integration Corp.
> +
> +maintainers:
> +  - Luka Kovacic <luka.kovacic@sartura.hr>
> +
> +description: |
> +  This module is a part of the iEi WT61P803 PUZZLE MFD device. For more details
> +  see Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml.
> +
> +  The LED module is a sub-node of the MCU node in the Device Tree.
> +
> +properties:
> +  compatible:
> +    const: iei,wt61p803-puzzle-leds
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^led@0$":
> +    type: object

Here should be a ref to LED common.yaml:
	$ref: common.yaml#

> +    description: |
> +      Properties for a single LED.
> +
> +    properties:
> +      reg:
> +        description:
> +          Index of the LED. Only one LED is supported at the moment.
> +        minimum: 0
> +        maximum: 0
> +
> +      label: true
> +
> +      linux,default-trigger: true
> +

label is obsolete, linux,default-trigger as well. 

> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> diff --git a/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> new file mode 100644
> index 000000000000..38846c758372
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/iei,wt61p803-puzzle.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: iEi WT61P803 PUZZLE MCU from IEI Integration Corp.
> +
> +maintainers:
> +  - Luka Kovacic <luka.kovacic@sartura.hr>
> +
> +description: |
> +  iEi WT61P803 PUZZLE MCU is embedded in some iEi Puzzle series boards.
> +  It's used for controlling system power states, fans, LEDs and temperature
> +  sensors.
> +
> +  For Device Tree bindings of other sub-modules (HWMON, LEDs) refer to the
> +  binding documents under the respective subsystem directories.
> +
> +properties:
> +  compatible:
> +    const: iei,wt61p803-puzzle
> +
> +  current-speed:
> +    description:
> +      Serial bus speed in bps
> +    maxItems: 1

What does this mean? Is this connected via uart? Why not name it
`baud`? I realize that `current-speed` is used in other device trees
(and `baud` as well), but what "current" is this? I don't suppose this
means electric current :)

Have you passed these via dt_binding_check?

Marek
