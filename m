Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050C63474D8
	for <lists+linux-leds@lfdr.de>; Wed, 24 Mar 2021 10:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235078AbhCXJlJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Mar 2021 05:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbhCXJkh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Mar 2021 05:40:37 -0400
X-Greylist: delayed 361 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 24 Mar 2021 02:40:36 PDT
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2190C061763;
        Wed, 24 Mar 2021 02:40:36 -0700 (PDT)
Received: from thinkpad (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 1354F1409CA;
        Wed, 24 Mar 2021 10:40:33 +0100 (CET)
Date:   Wed, 24 Mar 2021 10:40:31 +0000
From:   Marek Behun <marek.behun@nic.cz>
To:     Hermes Zhang <chenhui.zhang@axis.com>
Cc:     <pavel@ucw.cz>, <dmurphy@ti.com>, <robh+dt@kernel.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <chenhuiz@axis.com>,
        <lkml@axis.com>, <kernel@axis.com>
Subject: Re: [PATCH 2/2] dt-binding: leds: Document leds-multi-gpio bindings
Message-ID: <20210324104031.10c6216c@thinkpad>
In-Reply-To: <20210324075631.5004-3-chenhui.zhang@axis.com>
References: <20210324075631.5004-1-chenhui.zhang@axis.com>
        <20210324075631.5004-3-chenhui.zhang@axis.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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

On Wed, 24 Mar 2021 15:56:31 +0800
Hermes Zhang <chenhui.zhang@axis.com> wrote:

> From: Hermes Zhang <chenhuiz@axis.com>
> 
> Document the device tree bindings of the multiple GPIOs LED driver
> Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml.

The dt-binding should come before the actual driver. Otherwise there
will be a commit with the driver existing but no documentation for its
bindings.

> +description:
> +  This will support some LED made of multiple GPIOs and the brightness of the
> +  LED could map to different states of the GPIOs.

Don't use future tense. Don't mention drivers in device tree
binding documentation, if it can be helped. The device tree binding
documentation should describe devices and their nodes... (and I see
that I did a similar mistake for the cznic,turris-omnia-leds.yaml
binding, I will have to fix that).

Instead the description should be something like this:
  This binding represents LED devices which are controller with
  multiple GPIO lines in order to achieve more than two brightness
  states.
  

> +
> +properties:
> +  compatible:
> +    const: multi-gpio-led
> +
> +  led-gpios:
> +    description: Array of one or more GPIOs pins used to control the LED.
> +    minItems: 1
> +    maxItems: 8  # Should be enough
> +
> +  led-states:
> +    description: |
> +      The array list the supported states here which will map to brightness
> +      from 0 to maximum. Each item in the array will present all the GPIOs
> +      value by bit.

Again future tense...

> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 1
> +    maxItems: 16 # Should be enough
> +
> +required:
> +  - compatible
> +  - led-gpios
> +  - led-states
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpios-led {
> +      compatible = "multi-gpio-led";
> +
> +      led-gpios = <&gpio0 23 0x1>,
> +                  <&gpio0 24 0x1>;
> +      led-states = /bits/ 8 <0x00 0x01 0x02 0x03>;
> +    };
> +...

