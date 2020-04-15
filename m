Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E478C1AAB6F
	for <lists+linux-leds@lfdr.de>; Wed, 15 Apr 2020 17:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388223AbgDOPJL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Apr 2020 11:09:11 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46667 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730523AbgDOPJJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Apr 2020 11:09:09 -0400
Received: by mail-ot1-f68.google.com with SMTP id w12so156473otm.13;
        Wed, 15 Apr 2020 08:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HdC/Q7+fvd6pSZDjuejBxq/m9TWf81AbZW8TK43Po2w=;
        b=pnX9ieNGS0RndPaznJ1l7UvdhhhVhLLYXxUJ1hBawgQjQvcaasET9hREMd0ymzgrYE
         z5wzQmysDg5P3Wls3vzbIujAkDkMPqnOImNiBpZRp99ot1aDDL0AtcrC8EEt4BXeqQwS
         JN+rQ/z2BeNXpfZo6MNYJ34PvtBKQRzwAR31b7Mnef8KoIV1WSUVII9T0LszqPuHdRhs
         ixwi+8rO27Z1nqnJ/9xmxfPaExmCo7qvXnWgO5dA59imkyi6k+pnRUwl+INnyGi3lTN9
         cn/tyA8ctMvHggIFzOKniUCQcXx6UgUORBTODyAxLhlmOTzf7c54HNHYTFul1DKYDbB/
         6bTg==
X-Gm-Message-State: AGi0PuZW1YaOmQl6VyeUpdnVbG31yQ9cojPaUg7x3zIpGViOOIS9fEmK
        e5PxppApQhdPk+KmpfTUCQ==
X-Google-Smtp-Source: APiQypJ53WgVdOzShhlDqFQl48EdVSSIisnmrcFsbp5L/x6xXtHCUnsjBYHk71gAGFPCUdUr6AVHnQ==
X-Received: by 2002:a4a:3f41:: with SMTP id x1mr13267212ooe.69.1586963346738;
        Wed, 15 Apr 2020 08:09:06 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o73sm6310050ota.77.2020.04.15.08.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 08:09:05 -0700 (PDT)
Received: (nullmailer pid 25557 invoked by uid 1000);
        Wed, 15 Apr 2020 15:09:04 -0000
Date:   Wed, 15 Apr 2020 10:09:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V5 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200415150904.GA11174@bogus>
References: <1586274430-28402-1-git-send-email-kgunda@codeaurora.org>
 <1586274430-28402-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586274430-28402-2-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Apr 07, 2020 at 09:17:07PM +0530, Kiran Gunda wrote:
> Convert the qcom-wled bindings from .txt to .yaml format.
> Also replace PM8941 to WLED3 and PMI8998 to WLED4.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 154 ----------------
>  .../bindings/leds/backlight/qcom-wled.yaml         | 201 +++++++++++++++++++++
>  2 files changed, 201 insertions(+), 154 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml


> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> new file mode 100644
> index 0000000..770e780
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -0,0 +1,201 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binding for Qualcomm Technologies, Inc. WLED driver
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +  - Kiran Gunda <kgunda@codeaurora.org>
> +
> +description: |
> +  WLED (White Light Emitting Diode) driver is used for controlling display
> +  backlight that is part of PMIC on Qualcomm Technologies, Inc. reference
> +  platforms. The PMIC is connected to the host processor via SPMI bus.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pm8941-wled
> +      - qcom,pmi8998-wled
> +      - qcom,pm660l-wled
> +
> +  reg:
> +    maxItems: 1
> +
> +  default-brightness:
> +    description:
> +      brightness value on boot.
> +    minimum: 0
> +    maximum: 4095
> +    default: 2048
> +
> +  label: true
> +
> +  qcom,cs-out:
> +    description:
> +      enable current sink output.
> +      This property is supported only for WLED3.
> +    type: boolean
> +
> +  qcom,cabc:
> +    description:
> +      enable content adaptive backlight control.
> +    type: boolean
> +
> +  qcom,ext-gen:
> +    description:
> +      use externally generated modulator signal to dim.
> +      This property is supported only for WLED3.
> +    type: boolean
> +
> +  qcom,current-limit:
> +    description:
> +      mA; per-string current limit.
> +      This property is supported only for WLED3.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 20
> +    minimum: 0
> +    maximum: 25
> +    multipleOf: 1

No point in defining a multiple of 1.

> +
> +  qcom,current-limit-microamp:
> +    description:
> +      uA; per-string current limit.
> +    default: 25
> +    minimum: 0
> +    maximum: 30000
> +    multipleOf: 25
> +
> +  qcom,current-boost-limit:
> +    description:
> +      mA; boost current limit.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  qcom,switching-freq:
> +    description:
> +      kHz; switching frequency.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 600, 640, 685, 738, 800, 872, 960, 1066, 1200, 1371, 1600, 1920, 2400, 3200, 4800, 9600 ]
> +
> +  qcom,ovp:
> +    description:
> +      V; Over-voltage protection limit.
> +      This property is supported only for WLED3.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 27, 29, 32, 35 ]
> +      - default: 29
> +
> +  qcom,ovp-millivolt:
> +    description:
> +      Over-voltage protection limit. This property is for WLED4 only.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 18100, 19600, 29600, 31100 ]
> +      - default: 29600
> +
> +  qcom,num-strings:
> +    description:
> +      number of led strings attached.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  qcom,enabled-strings:
> +    description:
> +      Array of the WLED strings numbered from 0 to 3. Each
> +      string of leds are operated individually. Specify the
> +      list of strings used by the device. Any combination of
> +      led strings can be used.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
> +
> +  qcom,external-pfet:
> +    description:
> +      Specify if external PFET control for short circuit
> +      protection is used. This property is supported only
> +      for WLED4.
> +    type: boolean
> +        
> +  qcom,auto-string-detection:
> +    description:
> +      Enables auto-detection of the WLED string configuration.
> +      This feature is not supported for WLED3.
> +    type: boolean
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,pm8941-wled
> +
> +    then:
> +      properties:
> +        qcom,current-boost-limit:
> +           enum: [ 105, 385, 525, 805, 980, 1260, 1400, 1680 ]
> +           default: 805
> +
> +        qcom,switching-freq:
> +           default: 1600
> +
> +        qcom,num-strings:
> +           enum: [ 1, 2, 3 ]
> +  
> +        interrupts:
> +          items:
> +            - description: over voltage protection interrupt.
> +
> +        interrupt-names:
> +          items:
> +            - const: ovp
> +
> +    else:
> +      properties:
> +        qcom,current-boost-limit:
> +           enum: [ 105, 280, 450, 620, 970, 1150, 1300, 1500 ]
> +           default: 970
> +
> +        qcom,switching-freq:
> +           default: 800
> +
> +        qcom,num-strings:
> +           enum: [ 1, 2, 3, 4 ]
> +
> +        interrupts:
> +          items:
> +            - description: over voltage protection interrupt.
> +            - description: short circuit interrupt.
> +
> +        interrupt-names:
> +          items:
> +            - const: ovp
> +            - const: short

Move these 2 props to the main section adding a 'minItems: 1'. Then just 
define 'minItems: 2' here and 'maxItems: 1' in the 'then' clause.

> +
> +required:
> +  - compatible
> +  - reg
> +  - label

Add:

additionalProperties: false

> +
> +examples:
> +  - |
> +    backlight@d800 {
> +        compatible = "qcom,pm8941-wled";
> +        reg = <0xd800 0x100>;
> +        label = "backlight";
> +
> +        qcom,cs-out;
> +        qcom,current-limit = <20>;
> +        qcom,current-boost-limit = <805>;
> +        qcom,switching-freq = <1600>;
> +        qcom,ovp = <29>;
> +        qcom,num-strings = <2>;
> +        qcom,enabled-strings = <0 1>;
> +     };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
> 
