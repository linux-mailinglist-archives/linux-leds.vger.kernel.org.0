Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1739F305E4B
	for <lists+linux-leds@lfdr.de>; Wed, 27 Jan 2021 15:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbhA0O3h (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 27 Jan 2021 09:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233783AbhA0O3D (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 27 Jan 2021 09:29:03 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDBFC061573
        for <linux-leds@vger.kernel.org>; Wed, 27 Jan 2021 06:28:23 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id p5so2297430oif.7
        for <linux-leds@vger.kernel.org>; Wed, 27 Jan 2021 06:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uZa34iNLZXzZFgCkFyw7+98Rs100rokiObLD8pmRuUY=;
        b=yHqCtsgEWEiNMgr3d8KZv+/5sk6UJ89UeB9BAL3BFj9o4ADvdN6+u8tG5k/Gl6GYZc
         CRTLYHmkqbDMJNBBwu7ATXI3LVZ3IK1o5GUuZQ9dXt+kr1DddbDURJoAlR+ccpYq7+4A
         9ge0Bsdk//cV/+T4qkXpLSfOjbt3IAIrsi3GWAnheW2ESPhOLsekKEYyrL27yP4Ck5bD
         QhvOwdZJwS+PDNLXLl4FG6NXmo50Luqyb8czBlyzMcmrqvaE0UGMbopQaONAfs6e6gqU
         vsJnALNRxfYLw91zQ8zZ8Fw4qBkiuLDwVC84tuO3Xl6VVIjahKvxSMsMbFYtMBLqXe6x
         qBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uZa34iNLZXzZFgCkFyw7+98Rs100rokiObLD8pmRuUY=;
        b=Zdivn8bxcL55Wv/by67iBKFzQVJMYGmZhJwtN/A5DFKDkSbjvr8BaKpGibsszOD4PO
         h6/HL8h6Ux9TwODKn95Z3AFT9y6erDLETL5XAa6e5bySpB9F39oajYId6v3b8TkT/4CS
         Wm2G/Ffc4khAtdu+o53qwjqWlYRFYXYe6o5DQEmgs84k18Kt6eTxAzN1Hiyzf+MAo+7M
         TxJfFFr/CuhQOPQvRQeunwPw6UQu+woA1wx4GYC/lHB/E3cmNa23ARfLBrIRtUJWoDRD
         ayfwwMoT8/l9hWr9bfOzWELNhe40EQmMDxK3I466KrWSNWM1n/EQZOfK7ND6ZcK/0X+E
         3nww==
X-Gm-Message-State: AOAM533BZ63U/IcgqmSIDv/yvRQ82FhSK2WLXaI1uvvt4T6YW3LfOPQg
        Fyqftr8aud07hCd2MTuC9cr8Cg==
X-Google-Smtp-Source: ABdhPJyhQ4wAJpSym7gzJXvKfZnElEhvu5w+a0f37qggO3T/TY6IL6fTsq4O7xKUQ5kuB6KwcLlssA==
X-Received: by 2002:aca:1a17:: with SMTP id a23mr3323036oia.120.1611757702385;
        Wed, 27 Jan 2021 06:28:22 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 68sm380107otr.16.2021.01.27.06.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 06:28:21 -0800 (PST)
Date:   Wed, 27 Jan 2021 08:28:19 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "N?colas F. R. A. Prado" <nfraprado@protonmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: Add binding for qcom-spmi-flash
Message-ID: <YBF4g3Oh8x24jfzX@builder.lan>
References: <20210126140240.1517044-1-nfraprado@protonmail.com>
 <20210126140240.1517044-2-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126140240.1517044-2-nfraprado@protonmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue 26 Jan 08:04 CST 2021, N?colas F. R. A. Prado wrote:

> Add devicetree binding for QCOM SPMI Flash LEDs, which are part of
> PM8941, and are used both as lantern and camera flash.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
> ---
> Changes in v2:
> - Add this commit
> 
>  .../bindings/leds/leds-qcom-spmi-flash.yaml   | 94 +++++++++++++++++++
>  .../dt-bindings/leds/leds-qcom-spmi-flash.h   | 15 +++
>  2 files changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml
>  create mode 100644 include/dt-bindings/leds/leds-qcom-spmi-flash.h
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
> +        $ref: /schemas/types.yaml#definitions/uint32
> +
> +      qcom,headroom:
> +        description: |
> +          headroom to use. Use one of QCOM_SPMI_FLASH_HEADROOM_* defined in
> +          include/dt-bindings/leds/leds-qcom-spmi-flash.h

Please make the unit of this property millivolts, instead of describing
it indirectly using the defines in the header file.

> +        $ref: /schemas/types.yaml#definitions/uint32
> +        minimum: 0
> +        maximum: 3

And you can then list out the valid values here.

> +
> +      qcom,startup-dly:
> +        description: |
> +          delay before flashing. Use one of QCOM_SPMI_FLASH_STARTUP_DLY_*
> +          defined in include/dt-bindings/leds/leds-qcom-spmi-flash.h

As above, please describe this in microseconds.

> +        $ref: /schemas/types.yaml#definitions/uint32
> +        minimum: 0
> +        maximum: 3
> +
> +      qcom,safety-timer:
> +        description: include for safety timer use, otherwise watchdog timer will be used
> +        type: boolean
> +
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

Please no "qcom," in the node name.

Regards,
Bjorn

> +        compatible = "qcom,spmi-flash";
> +        reg = <0xd300 0x100>;
> +        flash-boost-supply = <&pm8941_5vs1>;
> +        torch-boost-supply = <&pm8941_5v>;
> +
> +        led0 {
> +            led-sources = <0>;
> +            function = LED_FUNCTION_FLASH;
> +            color = <LED_COLOR_ID_WHITE>;
> +            led-max-microamp = <200000>;
> +            flash-max-microamp = <1000000>;
> +            flash-max-timeout-us = <1280000>;
> +            default-state = "off";
> +            qcom,clamp-curr = <200000>;
> +            qcom,headroom = <QCOM_SPMI_FLASH_HEADROOM_500MV>;
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
> -- 
> 2.30.0
> 
> 
