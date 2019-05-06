Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A65715114
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 18:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbfEFQVS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 12:21:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:37680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726340AbfEFQVS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 6 May 2019 12:21:18 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E54E920C01;
        Mon,  6 May 2019 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557159677;
        bh=kq5AkPQwl322QoivNyyIsEuWP9/jIHgG7nWThZVIn64=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BsNK4J80YWGVfEpCdWgT9r4zuzgrgD6eHtkDh+171wYR9SH8nCuAbDRkN4HNzggkm
         u3rwZ2grbwUhIrZC5ZPbXRkyB1US5t4ronRVy7HVykbS7VP9cyT3hn2Q2TpSix0uqm
         DHHvB2NGzzJ9rZmpBcFA091AyuDGo54daEPIy/E0=
Received: by mail-qk1-f175.google.com with SMTP id d4so1941539qkc.9;
        Mon, 06 May 2019 09:21:16 -0700 (PDT)
X-Gm-Message-State: APjAAAWNaKruOr4hN+oBuVT9r+5lf+SzLT0gyd77wfzJIyPOaaCiokaa
        aEGP1F44hlg6aytlGhXwuH8odWEWV2V74JuYfg==
X-Google-Smtp-Source: APXvYqxc+nA/FLTjF+smYFlXzvpGtt63+10VQb3rNQyUcbMN8nwGBydW3IMhTSLhKwKD9/bwDluFgB5ZtYdXGlcPod4=
X-Received: by 2002:a37:ad14:: with SMTP id f20mr20829993qkm.147.1557159676144;
 Mon, 06 May 2019 09:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190505200022.32209-1-oss@c-mauderer.de>
In-Reply-To: <20190505200022.32209-1-oss@c-mauderer.de>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 6 May 2019 11:21:05 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
Message-ID: <CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add binding for spi-byte LED.
To:     oss@c-mauderer.de
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, May 5, 2019 at 3:00 PM <oss@c-mauderer.de> wrote:
>
> From: Christian Mauderer <oss@c-mauderer.de>
>
> This patch adds the binding documentation for a simple SPI based LED
> controller which use only one byte for setting the brightness.
>
> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
> ---
>
> Changes compared to v2:
> - None
>
> Changes compared to v1:
> - rename ubnt-spi to leds-spi-byte
> - rename "ubnt-spi,off_bright" and "ubnt-spi,max_bright" to
>   "leds-spi-byte,off-value" and "leds-spi-byte,max-value" and mark them required
> - rename led-controller node to "led-controller"
> - extend description
> - remove SPI controller
> - use "white:status" for the example label
>
>
>  .../bindings/leds/leds-spi-byte.txt           | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-spi-byte.txt b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
> new file mode 100644
> index 000000000000..1dd6ab03a56d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
> @@ -0,0 +1,47 @@
> +* Single Byte SPI LED Device Driver.
> +
> +The driver can be used for controllers with a very simple SPI protocol: Only one
> +byte will be sent. The value of the byte can be any value between the off-value
> +and max-value defined in the properties.
> +
> +One example where the driver can be used is the controller in Ubiquiti airCube
> +ISP devices. That LED controller is based on a 8 bit microcontroller (SONiX
> +8F26E611LA) that has been programmed to control the single LED of the device.

What about power control of the uC?

> +The controller supports four modes depending on the highest two bits in a byte:
> +One setting for brightness, the other three provide different blink patterns.

This part seems in no way generic.

How does one support the blink patterns?

> +With the leds-spi-byte driver a basic support for the brightness mode of that
> +controller can be easily achieved by setting the minimum and maximum to the
> +brightness modes minimum and maximum byte value.
> +
> +Required properties:
> +- compatible:          Should be "leds-spi-byte".

Generally, we don't do "generic" bindings like this. The exceptions
are either we have confidence they really can be generic or they where
created before we knew better. A sample size of 1 doesn't convince me
the former is true.

This comment *only* applies to the binding, not the driver. Specific
bindings can easily be bound to generic drivers.

> +
> +Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
> +apply. In particular, "reg" and "spi-max-frequency" properties must be given.

What's the SPI mode configuration?

> +
> +The driver currently only supports one LED. The properties of the LED are
> +configured in a sub-node in the device node.
> +
> +LED sub-node properties:
> +- label:
> +       see Documentation/devicetree/bindings/leds/common.txt
> +- leds-spi-byte,off-value:
> +       The SPI byte value that should be sent to switch the LED off. Has to be
> +       smaller than max-value. Range: 0 to 254.
> +- leds-spi-byte,max-value:
> +       The SPI byte value that should be sent to set the LED to the maximum
> +       brightness. Has to be bigger than off-value. Range: 1 to 255.

Can't we already express this with brightness-levels and
num-interpolated-steps properties? Some reason those ended up in
pwm-backlight.txt, but really could apply to any LED with level
controls.

Rob
