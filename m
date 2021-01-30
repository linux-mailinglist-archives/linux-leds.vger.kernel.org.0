Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE5230983E
	for <lists+linux-leds@lfdr.de>; Sat, 30 Jan 2021 21:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbhA3UdJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 30 Jan 2021 15:33:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbhA3UdH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 30 Jan 2021 15:33:07 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA88C061573;
        Sat, 30 Jan 2021 12:32:27 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id r14so14702727ljc.2;
        Sat, 30 Jan 2021 12:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/bqUk44GItK5KqjekqDFg8KV582oh+HXhJtH2bYsu3M=;
        b=lCiyQoGy+PqNwTYdw4ycQVnTnxEFZTkbmNEXwF7hmS+APgCWrCuvIQiNsPxAXAHux7
         kFkcqZuHh7TfzPOT1aueAw1G1RduISqgM71lv+EziJvx4wGS2g9revFpb1nmg7HpYH+U
         oxDjgBwbX06vBUg5RXphCOfSTYbSO0n1w8VZCfwosPsEvUjZ9Cneflf/xWh65w8RLh52
         2Kql0NRnzm5MYVO7FglXg6enGNcL5A3aAAbpbGk2yPAOCIbio18ri+zqmHq3cOP5aUbL
         gks75ZouAACVQaEFUK1fT/GkKAteMpccUn3FSpnkTY6yThe51sMUY4aui1HjlUzKVCv4
         efHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/bqUk44GItK5KqjekqDFg8KV582oh+HXhJtH2bYsu3M=;
        b=cLsrwqqDU2MpIMQFWVyAWeAztpDcQOyayXD4vCZYNi59235FbT+VAREGLWxtSggjBx
         A4lnGb6/PVshtw2GOfumdE6KpVxbnu5FsomS1P6sabz4JrS00f9ws0gEOSkNL1956ODZ
         MXVhI01dtd1k3WMA8QpYcGNn2nV3MRXYvQq4k+lPcE03rp3v6C0OAdc5h23kQaDqcEXa
         akLAiGUARPbmb2cXMcV2/xfzG7nAdr2FXYanfa3ehhcveO4p2YYfOord2X2nug5a/ZLe
         v3jfvL/n2NP2cqRNAW7poD4TnoRS1Gs+2mfojL4zNynVGCn2oqZ2ZxNSWIYp4Iv3fBkf
         /kVQ==
X-Gm-Message-State: AOAM533911PtLIY23asxZta4y83pS3Fl75SZd+fva3HziZSuG5yEHbho
        5tFyGSo/LUGqeOYI+4MYwkg=
X-Google-Smtp-Source: ABdhPJxg0kbxOR0692qshmGwxyZuLla95DszRhNa9gwvloA9dHNPDN1YvnBBY4fj4CGzdrtPwdvC7g==
X-Received: by 2002:a2e:7c1a:: with SMTP id x26mr5716076ljc.191.1612038744942;
        Sat, 30 Jan 2021 12:32:24 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id q13sm2439689lfk.307.2021.01.30.12.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Jan 2021 12:32:24 -0800 (PST)
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: Add binding for qcom-spmi-flash
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
References: <20210126140240.1517044-1-nfraprado@protonmail.com>
 <20210126140240.1517044-2-nfraprado@protonmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <597508ab-7d53-e1cc-a63f-b66e5dc7016d@gmail.com>
Date:   Sat, 30 Jan 2021 21:32:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126140240.1517044-2-nfraprado@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Nicolas,

On 1/26/21 3:04 PM, Nícolas F. R. A. Prado wrote:
> Add devicetree binding for QCOM SPMI Flash LEDs, which are part of
> PM8941, and are used both as lantern and camera flash.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
> ---
> Changes in v2:
> - Add this commit
> 
>   .../bindings/leds/leds-qcom-spmi-flash.yaml   | 94 +++++++++++++++++++
>   .../dt-bindings/leds/leds-qcom-spmi-flash.h   | 15 +++
>   2 files changed, 109 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml
>   create mode 100644 include/dt-bindings/leds/leds-qcom-spmi-flash.h
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml
> new file mode 100644
> index 000000000000..169716e14f67
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-qcom-spmi-flash.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SPMI Flash LEDs
> +
> +maintainers:
> +  - Nícolas F. R. A. Prado <nfraprado@protonmail.com>
> +
> +description: |
> +  The Qualcomm SPMI Flash LEDs are part of Qualcomm PMICs and are used primarily
> +  as a camera or video flash. They can also be used as a lantern when on torch
> +  mode.
> +  The PMIC is connected to Host processor via SPMI bus.
> +
> +properties:
> +  compatible:
> +    const: qcom,spmi-flash
> +
> +  reg:
> +    maxItems: 1
> +
> +  flash-boost-supply:
> +    description: SMBB regulator for LED flash mode
> +
> +  torch-boost-supply:
> +    description: SMBB regulator for LED torch mode
> +
> +patternProperties:
> +  "^led[0-1]$":
> +    type: object
> +    $ref: common.yaml#
> +
> +    properties:
> +      qcom,clamp-curr:
> +        description: current to clamp at, in uA

You're already using led-max-microamp and flash-max-microamp,
so I'm not sure how this is related to those.

> +        $ref: /schemas/types.yaml#definitions/uint32
> +
> +      qcom,headroom:
> +        description: |
> +          headroom to use. Use one of QCOM_SPMI_FLASH_HEADROOM_* defined in
> +          include/dt-bindings/leds/leds-qcom-spmi-flash.h

More information would be welcome here on how it impacts device
operation.

> +        $ref: /schemas/types.yaml#definitions/uint32
> +        minimum: 0
> +        maximum: 3
> +
> +      qcom,startup-dly:
> +        description: |
> +          delay before flashing. Use one of QCOM_SPMI_FLASH_STARTUP_DLY_*
> +          defined in include/dt-bindings/leds/leds-qcom-spmi-flash.h

I don't see much gain in having this exposed.
We don't have related constructs in the API to handle that, so I propose
to always set it to 0 and not expose this setting at all.

> +        $ref: /schemas/types.yaml#definitions/uint32
> +        minimum: 0
> +        maximum: 3
> +
> +      qcom,safety-timer:
> +        description: include for safety timer use, otherwise watchdog timer will be used
> +        type: boolean

What's the difference between watchdog timer and safety timer?
Either way, I propose to choose the option best fitting for handling
flash timeout setting and hide this inside the driver.

> +required:
> +  - compatible
> +  - reg
> +  - flash-boost-supply
> +  - torch-boost-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +    #include <dt-bindings/leds/leds-qcom-spmi-flash.h>
> +
> +    qcom,leds@d300 {
> +        compatible = "qcom,spmi-flash";
> +        reg = <0xd300 0x100>;
> +        flash-boost-supply = <&pm8941_5vs1>;
> +        torch-boost-supply = <&pm8941_5v>;
> +
> +        led0 {
> +            led-sources = <0>;

Please use reg property for this purpose instead.

> +            function = LED_FUNCTION_FLASH;
> +            color = <LED_COLOR_ID_WHITE>;
> +            led-max-microamp = <200000>;
> +            flash-max-microamp = <1000000>;
> +            flash-max-timeout-us = <1280000>;

You should mention this properties above and provide constraints
(min, max, step).

> +            default-state = "off";

There's no point in having this in the example.

> +            qcom,clamp-curr = <200000>; > +            qcom,headroom = <QCOM_SPMI_FLASH_HEADROOM_500MV>;
> +            qcom,startup-dly = <QCOM_SPMI_FLASH_STARTUP_DLY_128US>;
> +            qcom,safety-timer;
> +        };
> +    };
> +...
> diff --git a/include/dt-bindings/leds/leds-qcom-spmi-flash.h b/include/dt-bindings/leds/leds-qcom-spmi-flash.h
> new file mode 100644
> index 000000000000..8bd54a8e831d
> --- /dev/null
> +++ b/include/dt-bindings/leds/leds-qcom-spmi-flash.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _DT_BINDINGS_LEDS_QCOM_SPMI_FLASH_H
> +#define _DT_BINDINGS_LEDS_QCOM_SPMI_FLASH_H
> +
> +#define QCOM_SPMI_FLASH_HEADROOM_250MV	0
> +#define QCOM_SPMI_FLASH_HEADROOM_300MV	1
> +#define QCOM_SPMI_FLASH_HEADROOM_400MV	2
> +#define QCOM_SPMI_FLASH_HEADROOM_500MV	3
> +
> +#define QCOM_SPMI_FLASH_STARTUP_DLY_10US	0
> +#define QCOM_SPMI_FLASH_STARTUP_DLY_32US	1
> +#define QCOM_SPMI_FLASH_STARTUP_DLY_64US	2
> +#define QCOM_SPMI_FLASH_STARTUP_DLY_128US	3
> +
> +#endif
> 

-- 
Best regards,
Jacek Anaszewski
