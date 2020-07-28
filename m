Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0725023111F
	for <lists+linux-leds@lfdr.de>; Tue, 28 Jul 2020 19:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732092AbgG1RuD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Jul 2020 13:50:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:54062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732090AbgG1RuC (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 28 Jul 2020 13:50:02 -0400
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C6D5320672;
        Tue, 28 Jul 2020 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595958601;
        bh=byYf4n24gG30dDjG0DGS0JChGwLpUbdOj8i0b4TqC/Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uJ0hjuFxbnwJXoWGsFvDs6oXz4ouq3vcrTJJNRyFeTmQgBw1eBdYUVm2mdzN4fUEi
         uFKZ0/+nv5EvZWpQmuY/TeIT7TjtnjG7VqH46OJ0m9sa6Ads/hHXR8sNluRCOjZN7T
         sHBN2GTm90yzKSIOZWZYerRKXN7Jdtm9IFTYbV/4=
Received: by mail-ot1-f47.google.com with SMTP id a26so6708812otf.1;
        Tue, 28 Jul 2020 10:50:01 -0700 (PDT)
X-Gm-Message-State: AOAM533jWCFtUWejqTXGHC7zxl/gRDIpyChgGX1mk3zKRjWQvRukp2o5
        XF2s6ZIa03mttGC6MnpidOnDz1F3HyrWV34oww==
X-Google-Smtp-Source: ABdhPJwnob32C1OTcPvHYivi0P0PQWPlxJg4WIlfcnnn1HSONcxx//qW0Q77idqYpQ40uu95Ubs/HGmML6exbzi/voo=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr6508259ote.107.1595958601154;
 Tue, 28 Jul 2020 10:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200723125320.3572-1-marek.behun@nic.cz> <20200723125320.3572-2-marek.behun@nic.cz>
In-Reply-To: <20200723125320.3572-2-marek.behun@nic.cz>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 28 Jul 2020 11:49:49 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLszuOeEeRf-uXtdi_QMw=ydMnD_E6_F34Tk30YGZO=LQ@mail.gmail.com>
Message-ID: <CAL_JsqLszuOeEeRf-uXtdi_QMw=ydMnD_E6_F34Tk30YGZO=LQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: leds: add cznic,turris-omnia-leds binding
To:     =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jul 23, 2020 at 6:53 AM Marek Beh=C3=BAn <marek.behun@nic.cz> wrote=
:
>
> Add device-tree bindings documentation for Turris Omnia RGB LEDs.
>
> Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../leds/cznic,turris-omnia-leds.yaml         | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris-o=
mnia-leds.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-le=
ds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.ya=
ml
> new file mode 100644
> index 000000000000..24ad1446445e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/cznic,turris-omnia-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CZ.NIC's Turris Omnia LEDs driver
> +
> +maintainers:
> +  - Marek Beh=C3=BAn <marek.behun@nic.cz>
> +
> +description:
> +  This module adds support for the RGB LEDs found on the front panel of =
the
> +  Turris Omnia router. There are 12 RGB LEDs that are controlled by a
> +  microcontroller that communicates via the I2C bus. Each LED is describ=
ed
> +  as a subnode of this I2C device.
> +
> +properties:
> +  compatible:
> +    const: cznic,turris-omnia-leds
> +
> +  reg:
> +    description: I2C slave address of the microcontroller.
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^multi-led[0-9a-f]$":

Doesn't match the example:

Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.example.dt.y=
aml:
led-controller@2b: 'multi-led@0', 'multi-led@a' do not match any of
the regexes: '^multi-led[0-9a-f]$', 'pinctrl-[0-9]+'

> +    type: object
> +    allOf:
> +      - $ref: leds-class-multicolor.yaml#
> +    description:
> +      This node represents one of the RGB LED devices on Turris Omnia.
> +      No subnodes need to be added for subchannels since this controller=
 only
> +      supports RGB LEDs.
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 11
> +        description:
> +          This property identifies one of the LEDs on the front panel of=
 the
> +          Turris Omnia router.
> +
> +    required:
> +      - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c0 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        led-controller@2b {
> +            compatible =3D "cznic,turris-omnia-leds";
> +            reg =3D <0x2b>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            multi-led@0 {
> +                /*
> +                 * No subnodes are needed, this controller only supports=
 RGB
> +                 * LEDs.
> +                 */
> +                reg =3D <0>;
> +                color =3D <LED_COLOR_ID_MULTI>;
> +                function =3D LED_FUNCTION_POWER;
> +                linux,default-trigger =3D "heartbeat";
> +            };
> +
> +            multi-led@a {
> +                reg =3D <0xa>;
> +                color =3D <LED_COLOR_ID_MULTI>;
> +                function =3D LED_FUNCTION_INDICATOR;
> +                function-enumerator =3D <1>;
> +            };
> +        };
> +    };
> +
> +...
> --
> 2.26.2
>
