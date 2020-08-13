Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC60A244058
	for <lists+linux-leds@lfdr.de>; Thu, 13 Aug 2020 23:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgHMVGm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Aug 2020 17:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgHMVGm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Aug 2020 17:06:42 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06FDC061757;
        Thu, 13 Aug 2020 14:06:41 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id di22so5234365edb.12;
        Thu, 13 Aug 2020 14:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+gLOU84cNZ1Rsv9wlF/Os7yUvEemIY9BKWifplza2eo=;
        b=jNS4k3f8ykYnmD9ITW7ZunOE98hIMfSzbPtNgq+BZKcF20oIA2vvdnzXo0Dqe8LKMv
         zZY+cvju5QczSdb1vhNLAXoN7Buqr2r+CyTmkjUzgacqIDlROMU9moTuByRJbIfeZS9v
         F2P5CUveZY+bL9kEZllnBEbKbeRGqoWCj96lkBrgdVn/iIC+LHfmpk1DzhjaB2aFHigQ
         F1TaI8nYyfptWXpGoqvvmZkoIDF6AyLCfsXtHO7bv/RhnTwwXLPeJ6m85TpjuVuhh2GN
         i2+MwV9u4e2Jm3aOD/SMn97JlKzOx4VkE07vPE/UNyG9kFmdmOxfZ2DlWbcygLvDdFMF
         dnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+gLOU84cNZ1Rsv9wlF/Os7yUvEemIY9BKWifplza2eo=;
        b=aB99V1P6KWA5glJjLfV7zstjELDepwlvj56Th3ZfPvLH9tErGJxkTKgOFOXGF3hsYg
         U98WlhKed2FplXSy62dZ4fQT+30jJZXth1hZMpbjyMaLSWImXpyIf+QXhi5z/mtQ2XmH
         Fbc6CD/HVsvLSJLJSweSXGWQg7AUPNPblEKtIxoWJruvTFFTgwVwzXOBK+BVdZn8RU0U
         3Y3xIdddSYP/foEDdoE4cdISKpTqfTNzao8XJgkiJYsi63KSdaLF1CVPdqIzetXTTrEq
         IyxWoR8V0KUWqv0h0Rtdw0/8eHu4eJaJq4+TOIOBCOPdwjBUwlAE5BwJybcAn9nM0BsX
         jlew==
X-Gm-Message-State: AOAM531ca9PFj4v3TwJg3pveyHpoWp7sohVXxOLnBIsM1FHpFgdiBsLy
        AkqOluJE8czA8c+5EdzKejTT1Nec
X-Google-Smtp-Source: ABdhPJzttsJSWh60Ibgg2g1tvpFePaIBzCCg/vnZY/xvcyo9FfeT8ZSFEck51B7BPzqUJcwCWYjODg==
X-Received: by 2002:a05:6402:12d0:: with SMTP id k16mr6693516edx.199.1597352800389;
        Thu, 13 Aug 2020 14:06:40 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:542e:b60d:359c:ac79? ([2a01:110f:b59:fd00:542e:b60d:359c:ac79])
        by smtp.gmail.com with ESMTPSA id a19sm5123757ejg.116.2020.08.13.14.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 14:06:39 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add DT binding for Richtek RT8515
To:     Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org
References: <20200812090711.2644688-1-linus.walleij@linaro.org>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <e8d27b57-ac17-29e4-0e43-b72d7447d43a@gmail.com>
Date:   Thu, 13 Aug 2020 23:06:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812090711.2644688-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Linus,

On 8/12/20 11:07 AM, Linus Walleij wrote:
> Add a YAML devicetree binding for the Richtek RT8515
> dual channel flash/torch LED driver.
> 
> Cc: newbytee@protonmail.com
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   .../bindings/leds/richtek,rt8515.yaml         | 54 +++++++++++++++++++
>   1 file changed, 54 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> new file mode 100644
> index 000000000000..579ef8a2e40a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/richtek,rt8515.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Richtek RT8515 1.5A dual channel LED driver
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  The Richtek RT8515 is a dual channel (two mode) LED driver that
> +  supports driving a white LED in flash or torch mode.
> +
> +properties:
> +  compatible:
> +    const: richtek,rt8515
> +
> +  enf-gpios:
> +    maxItems: 1
> +    description: A connection to the 'ENF' (enable flash) pin.
> +
> +  ent-gpios:
> +    maxItems: 1
> +    description: A connection to the 'ENT' (enable torch) pin.
> +
> +  led:
> +    type: object
> +    $ref: common.yaml#
> +
> +required:
> +  - compatible
> +  - ent-gpios
> +  - enf-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    led-controller {
> +        compatible = "richtek,rt8515";
> +        enf-gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
> +        ent-gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
> +
> +        led {
> +            function = LED_FUNCTION_FLASH;
> +            color = <LED_COLOR_ID_WHITE>;
> +            flash-max-timeout-us = <250000>;

Constraints for this property are needed above.

> +        };
> +    };
> 

-- 
Best regards,
Jacek Anaszewski
