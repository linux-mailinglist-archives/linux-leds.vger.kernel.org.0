Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83BF23E97B5
	for <lists+linux-leds@lfdr.de>; Wed, 11 Aug 2021 20:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhHKSga (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Aug 2021 14:36:30 -0400
Received: from mail-pj1-f51.google.com ([209.85.216.51]:52219 "EHLO
        mail-pj1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhHKSg3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Aug 2021 14:36:29 -0400
Received: by mail-pj1-f51.google.com with SMTP id oa17so4942937pjb.1;
        Wed, 11 Aug 2021 11:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=glqU11Z7nUR7hehweN2GYI7VV4V/0DA8qz5QPW5UH5o=;
        b=PlhdRNZ4DJTbjf/jYMPHkMqcZmqKkqqHx+xAZ6fYIvh0DsifGaoio635Pi8Aqm+FmK
         6jYmXRHKwJi4mJ9aF7Wek5UoUuCBVq77SPq/rbA7vxOmCPeKzI7dgT9cnLmHA89NXs8u
         gPMpfqkSn1kfvg3pfzdMlAITRPGMGbeZ+/W44TWgdfOPhUqrzR3kmw7etTQPlcKJuv3C
         b/Aw2TmrbbFhnDEiRyy16lsxUgSpAGI7rG6lWTvIIRduP0DeNys0HZFfFsTFguDwpkam
         SVnXR5lPas3U+WQ4VZ5HK9BCZYNvhSlXsqsKEwVJuH0Rwi9ubUSkvk/bFYRxpz2HkOP4
         1z8Q==
X-Gm-Message-State: AOAM531oSzQxBrliEwS98oCo+TInTT56bundBBD6h/u5Evqk6/nL1gwK
        C57x6dhdOVTEGhr2s7FuSQ==
X-Google-Smtp-Source: ABdhPJy1lIURcbSLGNDx7psgyKmkVt4jzczQsNUqlJIMdUhGsaoUjTuug+XLYYeIPqnx17C6mREhzw==
X-Received: by 2002:a63:111f:: with SMTP id g31mr119420pgl.80.1628706965598;
        Wed, 11 Aug 2021 11:36:05 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
        by smtp.gmail.com with ESMTPSA id a11sm153376pgj.75.2021.08.11.11.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 11:36:04 -0700 (PDT)
Received: (nullmailer pid 59304 invoked by uid 1000);
        Wed, 11 Aug 2021 18:35:59 -0000
Date:   Wed, 11 Aug 2021 12:35:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado 
        <nfraprado@collabora.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, ~lkcamp/patches@lists.sr.ht,
        =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>,
        kernel@collabora.com
Subject: Re: [PATCH v3 1/5] dt-bindings: leds: Add binding for qcom-spmi-flash
Message-ID: <YRQYjwaZCcm6blHT@robh.at.kernel.org>
References: <20210803162641.1525980-1-nfraprado@collabora.com>
 <20210803162641.1525980-2-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210803162641.1525980-2-nfraprado@collabora.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Aug 03, 2021 at 01:26:37PM -0300, Nícolas F. R. A. Prado wrote:
> Add devicetree binding for Qualcomm's SPMI Flash LEDs which are part of
> the PM8941 PMIC. These LEDs are used both as lantern and camera flash on
> phones based on the MSM8974 SoC, like the Nexus 5.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> 
> Changes in v3:
> - Removed clamp-curr, headroom, startup-dly and safety-timer properties since
>   they didn't impact the behavior. They're now hardcoded in the driver (patch 2)
> - Added valid ranges for led-max-microamp, flash-max-microamp and
>   flash-max-timeout-us
> - Removed dt-bindings header file that held some constants (moved to inside the
>   driver in patch 2)
> 
> Added in v2
> 
>  .../bindings/leds/leds-qcom-spmi-flash.yaml   | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml
> new file mode 100644
> index 000000000000..da674d73c033
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-qcom-spmi-flash.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SPMI Flash LEDs
> +
> +maintainers:
> +  - Nícolas F. R. A. Prado <n@nfraprado.net>
> +
> +description: |
> +  The Qualcomm SPMI Flash LEDs are part of Qualcomm PMICs and are used primarily
> +  as a camera or video flash. They can also be used as a lantern when on torch
> +  mode.
> +  The PMIC is connected to Host processor via SPMI bus.
> +
> +properties:
> +  compatible:
> +    const: qcom,spmi-flash-leds
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
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^led@[0-1]$":
> +    type: object
> +    $ref: common.yaml#
> +
> +    properties:
> +      reg:
> +        maxItems: 1

Instead of maxItems, this would be a bit more specific:

enum: [ 0, 1 ]

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +      led-max-microamp:
> +        minimum: 12500
> +        maximum: 200000
> +        multipleOf: 12500
> +
> +      flash-max-microamp:
> +        minimum: 12500
> +        maximum: 1000000
> +        multipleOf: 12500
> +
> +      flash-max-timeout-us:
> +        minimum: 10000
> +        maximum: 1280000
> +        multipleOf: 10000
> +
> +    required:
> +      - reg
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
> +
> +    spmi-flash-leds@d300 {
> +        compatible = "qcom,spmi-flash-leds";
> +        reg = <0xd300 0x100>;
> +        flash-boost-supply = <&pm8941_5vs1>;
> +        torch-boost-supply = <&pm8941_5v>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led@0 {
> +            reg = <0>;
> +            function = LED_FUNCTION_FLASH;
> +            color = <LED_COLOR_ID_WHITE>;
> +            led-max-microamp = <200000>;
> +            flash-max-microamp = <1000000>;
> +            flash-max-timeout-us = <1280000>;
> +        };
> +    };
> +...
> -- 
> 2.32.0
> 
> 
