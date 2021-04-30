Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E9A3701CE
	for <lists+linux-leds@lfdr.de>; Fri, 30 Apr 2021 22:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbhD3ULS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Apr 2021 16:11:18 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:42581 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231285AbhD3ULR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 30 Apr 2021 16:11:17 -0400
Received: by mail-oi1-f175.google.com with SMTP id v24so3507335oiv.9;
        Fri, 30 Apr 2021 13:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sBOTm/zYrjAtS2kzODhNWsvBe1P54Jz3RV7ipaKd4CQ=;
        b=GoSpE4KGxNo3/zQ9Our6xdgBUmc4pEjFMk6rNP3dJ0YS0TZ1F14VnZsGqpYdKkYoQj
         UNLtEJaVCITPeq62OUlT0oaT2kLKoSeaDqHW9DADhtAHaKp++ci4pYE3bKCt5jVQWT5Z
         yWtEdcgzRFQDDwkE46G3VRq9rZYCbCsmQYBtw46k42CwA+dFYeqK4dz8cMUSbsJrBHb9
         4ph/ks5DEFiXohIYk2ARQLCP6l/ONxF182fDdKJ/NwytjpwwQiDKnWJD6iKVl2KKsspM
         SllBAIbzwDCzgIa3/rCfDSWSmBy6YW6ZPu3C2Tm+K4usqtj7gki8uMzNS+6Q+zKrFeR5
         nrXA==
X-Gm-Message-State: AOAM532m7P9V3hmFkPznwaUoN9x/UzuaDAWs5a8j4ibM/g0pBGvf7xFQ
        3YFg/AjXsdY62oJOBwXj+A==
X-Google-Smtp-Source: ABdhPJwjFyRcuLkFxif9cv0K90ObUO4A2vgAK0FldkXIV9PvKrnE+CVjaWPln831prtj4PmnaVFmSw==
X-Received: by 2002:a54:4110:: with SMTP id l16mr8138948oic.141.1619813428494;
        Fri, 30 Apr 2021 13:10:28 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x36sm904385ott.66.2021.04.30.13.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 13:10:27 -0700 (PDT)
Received: (nullmailer pid 3804284 invoked by uid 1000);
        Fri, 30 Apr 2021 20:10:26 -0000
Date:   Fri, 30 Apr 2021 15:10:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     cy_huang <u0084500@gmail.com>
Cc:     lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, pavel@ucw.cz,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, cy_huang@richtek.com
Subject: Re: [RESEND PATCH v6 2/4] backlight: rt4831: Adds DT binding
 document for Richtek RT4831 backlight
Message-ID: <20210430201026.GA3797206@robh.at.kernel.org>
References: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
 <1619421491-31494-2-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619421491-31494-2-git-send-email-u0084500@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Apr 26, 2021 at 03:18:09PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Adds DT binding document for Richtek RT4831 backlight.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> Resend this v6 patch series to loop devicetree reviewers.
> 
> For next, need to add the below line
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../leds/backlight/richtek,rt4831-backlight.yaml   | 65 ++++++++++++++++++++++
>  include/dt-bindings/leds/rt4831-backlight.h        | 23 ++++++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
>  create mode 100644 include/dt-bindings/leds/rt4831-backlight.h
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
> new file mode 100644
> index 00000000..4da6a66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/richtek,rt4831-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Richtek RT4831 Backlight
> +
> +maintainers:
> +  - ChiYuan Huang <cy_huang@richtek.com>
> +
> +description: |
> +  RT4831 is a mutifunctional device that can provide power to the LCD display
> +  and LCD backlight.
> +
> +  For the LCD backlight, it can provide four channel WLED driving capability.
> +  Each channel driving current is up to 30mA
> +
> +  Datasheet is available at
> +  https://www.richtek.com/assets/product_file/RT4831A/DS4831A-05.pdf
> +

Need to reference common backlight schema:

allOf:
  - $ref: common.yaml#

> +properties:
> +  compatible:
> +    const: richtek,rt4831-backlight
> +
> +  default-brightness:
> +    description: |
> +      The default brightness that applied to the system on start-up.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Drop description and $ref. Covered in common.yaml.

> +    minimum: 0
> +    maximum: 2048
> +
> +  max-brightness:
> +    description: |
> +      The max brightness for the H/W limit
> +    $ref: /schemas/types.yaml#/definitions/uint32

And here.

> +    minimum: 0
> +    maximum: 2048
> +
> +  richtek,pwm-enable:
> +    description: |
> +      Specify the backlight dimming following by PWM duty or by SW control.
> +    type: boolean
> +
> +  richtek,bled-ovp-sel:
> +    description: |
> +      Backlight OVP level selection, currently support 17V/21V/25V/29V.
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    default: 1
> +    minimum: 0
> +    maximum: 3
> +
> +  richtek,channel-use:
> +    description: |
> +      Backlight LED channel to be used.
> +      BIT 0/1/2/3 is used to indicate led channel 1/2/3/4 enable or disable.
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    minimum: 1
> +    maximum: 15
> +
> +required:
> +  - compatible
> +  - richtek,channel-use
> +
> +additionalProperties: false
> diff --git a/include/dt-bindings/leds/rt4831-backlight.h b/include/dt-bindings/leds/rt4831-backlight.h
> new file mode 100644
> index 00000000..125c635
> --- /dev/null
> +++ b/include/dt-bindings/leds/rt4831-backlight.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides constants for rt4831 backlight bindings.
> + *
> + * Copyright (C) 2020, Richtek Technology Corp.
> + * Author: ChiYuan Huang <cy_huang@richtek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RT4831_BACKLIGHT_H
> +#define _DT_BINDINGS_RT4831_BACKLIGHT_H
> +
> +#define RT4831_BLOVPLVL_17V	0
> +#define RT4831_BLOVPLVL_21V	1
> +#define RT4831_BLOVPLVL_25V	2
> +#define RT4831_BLOVPLVL_29V	3
> +
> +#define RT4831_BLED_CH1EN	(1 << 0)
> +#define RT4831_BLED_CH2EN	(1 << 1)
> +#define RT4831_BLED_CH3EN	(1 << 2)
> +#define RT4831_BLED_CH4EN	(1 << 3)
> +#define RT4831_BLED_ALLCHEN	((1 << 4) - 1)
> +
> +#endif /* _DT_BINDINGS_RT4831_BACKLIGHT_H */
> -- 
> 2.7.4
> 
