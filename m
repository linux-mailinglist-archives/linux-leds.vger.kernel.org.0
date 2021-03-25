Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7825834888D
	for <lists+linux-leds@lfdr.de>; Thu, 25 Mar 2021 06:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhCYF1k (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Mar 2021 01:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbhCYF1d (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Mar 2021 01:27:33 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F989C06174A;
        Wed, 24 Mar 2021 22:27:32 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id b14so689439lfv.8;
        Wed, 24 Mar 2021 22:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZxHGrWsGgW6TprfvvINnFETzyCVg5VNycGG4rTWxoNQ=;
        b=bVHd3TJE0aQYr1W2z0J8gP18eIX/35mjuD+fGxsdk4GaHOvt9ZOm2WAaftPUlxmGSU
         Vx0RLY1ljrKuFdl4rp3Fog88g2sCSR6lhDUn8BOx4GFhpmumW334P69LJ4F4XGqT0iut
         CLaO6TQwTFoKuzb4/r4Qbx8JbJi/VhsfaOO363ZnfwyGZUhXL5p5h5Rc1S3uEwWMxFkS
         /y5d76oDV6rS2xuoLMTYF/aYD1Bz64ll8KLZ6Wp76Ll6TTixRGhM0bXaGPypFaA8hfZ7
         FxCjjk8QO4pw0KRMNY7LSBg6OCSGPK6BZy1S0uaAVdGAWipcae4cMwPE243wGxgpgJ+1
         vzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZxHGrWsGgW6TprfvvINnFETzyCVg5VNycGG4rTWxoNQ=;
        b=SaxpYsN6rv8CahGT4kIGIxzi4TBUmBbQG5EN/YNciEOGJA2feuJldYWaaetlqPfjdZ
         QjCP96XV+4Cn/NLjrWm3McU0C7DXRFJOMqyvkPmESIU5IJk0TIKYFX5porCKr2mPN7/N
         k0+iKmpcPH/vzEP1xQEIgFugNkAcOGRb2SPvlEagyEDOmSs8kpq6nrTf0bDpWtVM8mZh
         Gmc2l+deuDkiXoA6GbDqT105u1+psyKV2rOYig5S1xDjqlqo2vtNaKoZb8RMZxa5sUnv
         mPsyvz3Ys3MivWMsyYJZ22AgBpX68Y7o9NEV6u3tMXDhpwRW4kNGt/QZc5nAOfwXHr3N
         Mucw==
X-Gm-Message-State: AOAM533zP1hzhreph6FNMB8sXZgpuCm2Auj5TG+XfCrwKggy/qxDBKDQ
        zivc9w6BayUh91TkOeznkCI=
X-Google-Smtp-Source: ABdhPJx9lhFLxGYM+AahSvAkF8cOfJkn8tZwFRFJBxg0JEMHz67z2DGN0eaXzeSnMbQPbyvDCNvu3w==
X-Received: by 2002:ac2:48ab:: with SMTP id u11mr3913829lfg.79.1616650051160;
        Wed, 24 Mar 2021 22:27:31 -0700 (PDT)
Received: from [192.168.1.221] (87-92-162-34.rev.dnainternet.fi. [87.92.162.34])
        by smtp.googlemail.com with ESMTPSA id l7sm578168lje.30.2021.03.24.22.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 22:27:30 -0700 (PDT)
Subject: Re: [PATCH 2/2] dt-binding: leds: Document leds-multi-gpio bindings
To:     Hermes Zhang <chenhui.zhang@axis.com>, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenhuiz@axis.com, lkml@axis.com,
        kernel@axis.com
References: <20210324075631.5004-1-chenhui.zhang@axis.com>
 <20210324075631.5004-3-chenhui.zhang@axis.com>
From:   =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Message-ID: <0648fff2-5b38-66da-7eb0-9969e517421f@gmail.com>
Date:   Thu, 25 Mar 2021 07:27:33 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324075631.5004-3-chenhui.zhang@axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

See below.

On 24.3.2021 9.56, Hermes Zhang wrote:
> From: Hermes Zhang <chenhuiz@axis.com>
> 
> Document the device tree bindings of the multiple GPIOs LED driver
> Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml.
> 
> Signed-off-by: Hermes Zhang <chenhuiz@axis.com>
> ---
>   .../bindings/leds/leds-multi-gpio.yaml        | 50 +++++++++++++++++++
>   1 file changed, 50 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
> new file mode 100644
> index 000000000000..6f2b47487b90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-multi-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Multiple GPIOs LED driver
> +
> +maintainers:
> +  - Hermes Zhang <chenhuiz@axis.com>
> +
> +description:
> +  This will support some LED made of multiple GPIOs and the brightness of the
> +  LED could map to different states of the GPIOs.
> +
> +properties:
> +  compatible:
> +    const: multi-gpio-led
> +
> +  led-gpios:
> +    description: Array of one or more GPIOs pins used to control the LED.
> +    minItems: 1
> +    maxItems: 8  # Should be enough

We also have a case with multi color LEDs (which is probably a more 
common than multi intensity LED. So I am wondering how these both could 
co-exist.

From: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/leds/leds-gpio.yaml?h=v5.12-rc4#n58

         led-0 {
             gpios = <&mcu_pio 0 GPIO_ACTIVE_LOW>;
             linux,default-trigger = "disk-activity";
             function = LED_FUNCTION_DISK;
         };

Now 'gpios' (and in LED context) and 'led-gpios' is very close to each 
other and could easily be confused.

Perhaps this could be something like:

intensity-gpios = ...

or even simplified then just to gpios = <...>

> +
> +  led-states:
> +    description: |
> +      The array list the supported states here which will map to brightness
> +      from 0 to maximum. Each item in the array will present all the GPIOs
> +      value by bit.
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
> 

From: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml?h=v5.12-rc4#n196

There is example of multi color LED configuration. In example below I 
used two-color LED with red and green as an example (which what we seem 
to have most in use).

Then if try to combine these into something like:

# Multi color LED with single GPIO line per color
multi-led@2 {
   compatible = "gpio-leds";
   color = <LED_COLOR_ID_MULTICOLOR>;
   led@0 {
     color = <LED_COLOR_ID_GREEN>;
     gpios = <&mcu_pio 0 GPIO_ACTIVE_LOW>;
   };

   led@1 {
     color = <LED_COLOR_ID_RED>;
     gpios = <&mcu_pio 1 GPIO_ACTIVE_LOW>;
   };
};

# And with intensity GPIOs:
multi-led@2 {
   compatible = "gpio-leds";
   color = <LED_COLOR_ID_MULTICOLOR>;

   led@0 {
     color = <LED_COLOR_ID_GREEN>;
     gpios = <&gpio0 23 0x1>,
             <&gpio0 24 0x1>;
     ... see below
   };

   led@1 {
     color = <LED_COLOR_ID_RED>;
     gpios = <&gpio0 25 0x1>,
             <&gpio0 26 0x1>;
     ... see below
   };
};

# And then single GPIO with intensity GPIOs:
led@2 {
   compatible = "gpio-leds";
   gpios = <&gpio0 23 0x1>,
           <&gpio0 24 0x1>;
   gpios-brightness-levels = <0 1 2 3>
};

I changed 'led-states' to 'gpios-brightness-levels' as it describe more 
that this is about brightness and not some other state information.

How would this sound?

Thanks,
Vesa Jääskeläinen
