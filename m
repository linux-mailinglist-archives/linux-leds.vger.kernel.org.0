Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC3221CB91
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 23:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbgGLV1P (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 17:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbgGLV1P (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 17:27:15 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D9AC061794;
        Sun, 12 Jul 2020 14:27:14 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id a1so4649944edt.10;
        Sun, 12 Jul 2020 14:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W76jVfxrTuIoZAkYpgqaF7QYNtH8+hF3xcWuK3L4NXU=;
        b=fObt6Sr7OHrYonZDkr9pOq08Aft0DuzQWFynrZ9nOJmji4YmH8LvXtn93+V+2/bBGB
         UGX8B7+rcAo/1jUdHV4KNK/rXGOGKU+AhsVcJkzzSeB3U9jHpOideWlnHx6kFTrEiN1a
         xhx3suN/JBZIKpwqpWNq7kQpMNiE4MIZuHS4I/3dg8DQhwlUKhLxJ4VdW8yhVbU2aoL8
         AlVFxKrCzfzCLEeAxZXVvRTHlz+Mu838Qf+VEz/2DStkcKN8++pZTTCUuK6rOiBunVE9
         LvhL1wMYKqzZvqQ6zqt5RIDOTTTLgy6M/lE2aVsr0YzOsMj+CcHCjDFfLwy4Z3V0qQc2
         h8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W76jVfxrTuIoZAkYpgqaF7QYNtH8+hF3xcWuK3L4NXU=;
        b=IXf1f2Uz+kV8fz8W4FVdRFcO1VK+/TCpSuKaVKsXdHoX1qzGIdTiTpICKNCRriGo9d
         qLyIFxTMK86SiciZyM4Pg/1uTZlgMhzgOcU3EQNIpkvJaqXxq1TcWhN0taqowsw1uaEc
         5I5YGFdsFYjqTbictkNyMU18oal/eQmQP90dkkR8yzHbhksG4vkJ0FcwcEA/CMCDNj5t
         lMQS3NWmbyvRH7+9Ef5wchHiWk+FvYNtRdLIMU4HZew+FgFTbnv4DHmKEil1G8fcecWo
         hr9mik75XW7if8N0huejiwa60Q6FaVOrpeuMH/h93ZUkhN2p7w6ksEQ22OanE8D6eUlq
         x5VA==
X-Gm-Message-State: AOAM530GlgGXh6qZtcnx3lMIe7hvQAbpOPLvPbu9R6lTyx+aosejoufN
        zjPc4pu9nOBzVom1cSJqWWI8wZz6
X-Google-Smtp-Source: ABdhPJyo0x7bRRExYweVLKjr4RL7y3u1jEiiRm2bgsGVFkHO7XzbdfDv64wQExU06pJoFjWe0+qtPA==
X-Received: by 2002:aa7:dc46:: with SMTP id g6mr82771516edu.194.1594589231593;
        Sun, 12 Jul 2020 14:27:11 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:416b:3fd:d547:2e80? ([2a01:110f:b59:fd00:416b:3fd:d547:2e80])
        by smtp.gmail.com with ESMTPSA id u13sm9857400eds.10.2020.07.12.14.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2020 14:27:11 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: add cznic,turris-omnia-leds
 binding
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20200712210601.5239-1-marek.behun@nic.cz>
 <20200712210601.5239-2-marek.behun@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <4609c389-4be6-0987-5078-725b43153596@gmail.com>
Date:   Sun, 12 Jul 2020 23:27:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200712210601.5239-2-marek.behun@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

Thank you for the patch. One note below.

On 7/12/20 11:06 PM, Marek Behún wrote:
> Add device-tree bindings documentation for Turris Omnia RGB LEDs.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>   .../leds/cznic,turris-omnia-leds.yaml         | 82 +++++++++++++++++++
>   1 file changed, 82 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> new file mode 100644
> index 000000000000..9817ea3ac69b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/cznic,turris-omnia-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CZ.NIC's Turris Omnia LEDs driver
> +
> +maintainers:
> +  - Marek Behún <marek.behun@nic.cz>
> +
> +description:
> +  This module adds support for the RGB LEDs found on the fron panel of the
> +  Turris Omnia router. There are 12 RGB LEDs, they are controlled by device's
> +  microcontroller with which the system communicates via I2C. Each LED is
> +  described as a subnode of this I2C device.
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
> +    type: object
> +    allOf:
> +      - $ref: leds-class-multicolor.yaml#
> +    description:
> +      This node represents one of the RGB LED devices on Turris Omnia.
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 11
> +        description:
> +          This property identifies one of the LEDs on the front panel of the
> +          Turris Omnia router.
> +
> +    required:
> +      - reg
> +
> +examples:
> +  - |
> +
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@2b {
> +            compatible = "cznic,turris-omnia-leds";
> +            reg = <0x2b>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            multi-led@0 {
> +                reg = <0>;
> +                color = <LED_COLOR_ID_MULTI>;
> +                function = LED_FUNCTION_POWER;

Please provide child nodes for each color LED. Let's stick
to the bindings closely and not make any deviations from
the beginning.

> +                linux,default-trigger = "heartbeat";
> +            };
> +
> +            multi-led@a {
> +                reg = <0xa>;
> +                color = <LED_COLOR_ID_MULTI>;
> +                function = LED_FUNCTION_INDICATOR;
> +                function-enumerator = <1>;
> +            };
> +        };
> +    };
> +
> +...
> 

-- 
Best regards,
Jacek Anaszewski
