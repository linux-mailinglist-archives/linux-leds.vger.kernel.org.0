Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8B61800F5
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2020 16:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgCJPCE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Mar 2020 11:02:04 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56238 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgCJPCE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Mar 2020 11:02:04 -0400
Received: by mail-wm1-f67.google.com with SMTP id 6so1771920wmi.5
        for <linux-leds@vger.kernel.org>; Tue, 10 Mar 2020 08:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IaIYth7Hd1C5u5nYWSUZLucEHaUbRnTCuCm39j2vevM=;
        b=mw1LbFv5tRbM3znPBo3adyte7mMzMaTXUWt9Ln2C2E/7FjL230rSGQHldDknwh0Idj
         93I2c+gjx0gWZyBQd21MMv5dU2DevxSxuSY5T3J5TDBocrTEkE/FFMBwUHaZBnatCHlr
         n8gBLY6pfSE8BF3Fyad/Z9HPL5GwItMb2ADWqeHBNm3gQlE2m4BV/JdFFas3Ncetn3pP
         nKpsX9Z7k/WQnyZ3zruUkD4jDJp/AUICiXyrfrPIqCunh5DD5jvGBgqYjLN4wiODojLl
         2g8VgGKnISJ/Dv1DBAmfEXG0pFsDYovtub0XrFXQ9ROtMkCprNCaW6rbGmseZCgp3/OI
         yv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IaIYth7Hd1C5u5nYWSUZLucEHaUbRnTCuCm39j2vevM=;
        b=WnyH7AYhqCedoijZkuoc/HSogWL6qI0MB9VgB6qiLVwOnqEFCZxobQnvdkTJZqSuY0
         hlanAvdSm3SGBy0B5TTmlZPxJaLfc1B02nrJbmLrESZFEnb2ZVwR5L9fL7cF98Vt9sbt
         5g1pVJKlrA6yoT2G0ZdX9yt4IoJifY4l4CpIgwSPhMGXVPzGpXBVs+4614ud9SgwR8Mc
         YJBZe4fCMX4aJosFUZz5Yv26gJZAEePCJAYYWDBZeKB1F39Lu3Z2xlANtjPzLostWaZi
         sX0cMJyhXu/sGSv9BciXfd452G4jnlA0qu/ISEViwe2Rv1HfFppfgRmhXUUeezsHKYDx
         Je9g==
X-Gm-Message-State: ANhLgQ11+J1747p5vEGrf4fP/qsUormthJX+zHOcxZMKZ9dGmbbEHptP
        UBKZN74RUNrtJqK1AxNIBsHZgA==
X-Google-Smtp-Source: ADFU+vu0RissKh5eU8m5fHIHGtILroJxbSvPbut5GPdZ6ydWrg4rk2h3Yse864mwSu9bvLU4KCLXtQ==
X-Received: by 2002:a7b:c0cf:: with SMTP id s15mr2705664wmh.106.1583852521526;
        Tue, 10 Mar 2020 08:02:01 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id a186sm4454652wmh.33.2020.03.10.08.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 08:02:00 -0700 (PDT)
Date:   Tue, 10 Mar 2020 15:01:59 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V3 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200310150159.vg2k44zn57me6wzk@holly.lan>
References: <1583760362-26978-1-git-send-email-kgunda@codeaurora.org>
 <1583760362-26978-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583760362-26978-2-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Mar 09, 2020 at 06:55:59PM +0530, Kiran Gunda wrote:
> Convert the qcom-wled bindings from .txt to .yaml format.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 154 -----------------
>  .../bindings/leds/backlight/qcom-wled.yaml         | 184 +++++++++++++++++++++
>  2 files changed, 184 insertions(+), 154 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
> deleted file mode 100644
> index c06863b..0000000
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
> +++ /dev/null
> @@ -1,154 +0,0 @@
> -Binding for Qualcomm Technologies, Inc. WLED driver
> -
> -WLED (White Light Emitting Diode) driver is used for controlling display
> -backlight that is part of PMIC on Qualcomm Technologies, Inc. reference
> -platforms. The PMIC is connected to the host processor via SPMI bus.
> -
> -- compatible
> -	Usage:        required
> -	Value type:   <string>
> -	Definition:   should be one of:
> -			"qcom,pm8941-wled"
> -			"qcom,pmi8998-wled"
> -			"qcom,pm660l-wled"
> -
> -- reg
> -	Usage:        required
> -	Value type:   <prop encoded array>
> -	Definition:   Base address of the WLED modules.
> -
> -- default-brightness
> -	Usage:        optional
> -	Value type:   <u32>
> -	Definition:   brightness value on boot, value from: 0-4095.
> -		      Default: 2048
> -
> -- label
> -	Usage:        required
> -	Value type:   <string>
> -	Definition:   The name of the backlight device
> -
> -- qcom,cs-out
> -	Usage:        optional
> -	Value type:   <bool>
> -	Definition:   enable current sink output.
> -		      This property is supported only for PM8941.
> -
> -- qcom,cabc
> -	Usage:        optional
> -	Value type:   <bool>
> -	Definition:   enable content adaptive backlight control.
> -
> -- qcom,ext-gen
> -	Usage:        optional
> -	Value type:   <bool>
> -	Definition:   use externally generated modulator signal to dim.
> -		      This property is supported only for PM8941.
> -
> -- qcom,current-limit
> -	Usage:        optional
> -	Value type:   <u32>
> -	Definition:   mA; per-string current limit; value from 0 to 25 with
> -		      1 mA step. Default 20 mA.
> -		      This property is supported only for pm8941.
> -
> -- qcom,current-limit-microamp
> -	Usage:        optional
> -	Value type:   <u32>
> -	Definition:   uA; per-string current limit; value from 0 to 30000 with
> -		      2500 uA step. Default 25 mA.
> -
> -- qcom,current-boost-limit
> -	Usage:        optional
> -	Value type:   <u32>
> -	Definition:   mA; boost current limit.
> -		      For pm8941: one of: 105, 385, 525, 805, 980, 1260, 1400,
> -		      1680. Default: 805 mA.
> -		      For pmi8998: one of: 105, 280, 450, 620, 970, 1150, 1300,
> -		      1500. Default: 970 mA.
> -
> -- qcom,switching-freq
> -	Usage:        optional
> -	Value type:   <u32>
> -	 Definition:   kHz; switching frequency; one of: 600, 640, 685, 738,
> -		       800, 872, 960, 1066, 1200, 1371, 1600, 1920, 2400, 3200,
> -		       4800, 9600.
> -		       Default: for pm8941: 1600 kHz
> -				for pmi8998: 800 kHz
> -
> -- qcom,ovp
> -	Usage:        optional
> -	Value type:   <u32>
> -	Definition:   V; Over-voltage protection limit; one of:
> -		      27, 29, 32, 35. Default: 29V
> -		      This property is supported only for PM8941.
> -
> -- qcom,ovp-millivolt
> -	Usage:        optional
> -	Value type:   <u32>
> -	Definition:   mV; Over-voltage protection limit;
> -		      For pmi8998: one of 18100, 19600, 29600, 31100.
> -		      Default 29600 mV.
> -		      If this property is not specified for PM8941, it
> -		      falls back to "qcom,ovp" property.
> -
> -- qcom,num-strings
> -	Usage:        optional
> -	Value type:   <u32>
> -	Definition:   #; number of led strings attached;
> -		      value: For PM8941 from 1 to 3. Default: 2
> -			     For PMI8998 from 1 to 4.
> -
> -- interrupts
> -	Usage:        optional
> -	Value type:   <prop encoded array>
> -	Definition:   Interrupts associated with WLED. This should be
> -		      "short" and "ovp" interrupts. Interrupts can be
> -		      specified as per the encoding listed under
> -		      Documentation/devicetree/bindings/spmi/
> -		      qcom,spmi-pmic-arb.txt.
> -
> -- interrupt-names
> -	Usage:        optional
> -	Value type:   <string>
> -	Definition:   Interrupt names associated with the interrupts.
> -		      Must be "short" and "ovp". The short circuit detection
> -		      is not supported for PM8941.
> -
> -- qcom,enabled-strings
> -	Usage:        optional
> -	Value tyoe:   <u32 array>
> -	Definition:   Array of the WLED strings numbered from 0 to 3. Each
> -		      string of leds are operated individually. Specify the
> -		      list of strings used by the device. Any combination of
> -		      led strings can be used.
> -
> -- qcom,external-pfet
> -	Usage:        optional
> -	Value type:   <bool>
> -	Definition:   Specify if external PFET control for short circuit
> -		      protection is used. This property is supported only
> -		      for PMI8998.
> -
> -- qcom,auto-string-detection
> -	Usage:        optional
> -	Value type:   <bool>
> -	Definition:   Enables auto-detection of the WLED string configuration.
> -		      This feature is not supported for PM8941.
> -
> -
> -Example:
> -
> -pm8941-wled@d800 {
> -	compatible = "qcom,pm8941-wled";
> -	reg = <0xd800>;
> -	label = "backlight";
> -
> -	qcom,cs-out;
> -	qcom,current-limit = <20>;
> -	qcom,current-boost-limit = <805>;
> -	qcom,switching-freq = <1600>;
> -	qcom,ovp = <29>;
> -	qcom,num-strings = <2>;
> -	qcom,enabled-strings = <0 1>;
> -};
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> new file mode 100644
> index 0000000..d334f81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -0,0 +1,184 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/leds/backlight/qcom-wled.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binding for Qualcomm Technologies, Inc. WLED driver
> +
> +maintainers:
> +  - Lee Jones <lee.jones@linaro.org>
> +
> +description: |
> +  WLED (White Light Emitting Diode) driver is used for controlling display
> +  backlight that is part of PMIC on Qualcomm Technologies, Inc. reference
> +  platforms. The PMIC is connected to the host processor via SPMI bus.
> +
> +properties:
> +  compatible :
> +    enum:
> +       - qcom,pm8941-wled
> +       - qcom,pmi8998-wled
> +       - qcom,pm660l-wled
> +
> +  reg:
> +    maxItems: 1
> +
> +  default-brightness:
> +    maxItems: 1
> +    description:
> +      brightness value on boot, value from 0-4095.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +        default: 2048
> +
> +  label:
> +    maxItems: 1
> +    description:
> +      The name of the backlight device.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/string
> +
> +  qcom,cs-out:
> +    description:
> +      enable current sink output.
> +      This property is supported only for PM8941.
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
> +      This property is supported only for PM8941.
> +    type: boolean
> +
> +  qcom,current-limit:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      mA; per-string current limit; value from 0 to 25 with
> +      1 mA step. This property is supported only for pm8941.
> +    default: 20
> +
> +  qcom,current-limit-microamp:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      uA; per-string current limit; value from 0 to 30000 with
> +      2500 uA step.
> +    default: 25
> +
> +  qcom,current-boost-limit:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      mA; boost current limit.
> +      For pm8941 one of 105, 385, 525, 805, 980, 1260, 1400, 1680.
> +      Default, 805 mA.
> +      For pmi8998 one of 105, 280, 450, 620, 970, 1150, 1300,
> +      1500. Default 970 mA.
> +
> +  qcom,switching-freq:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      kHz; switching frequency; one of 600, 640, 685, 738,
> +      800, 872, 960, 1066, 1200, 1371, 1600, 1920, 2400, 3200,
> +      4800, 9600.
> +      Default for pm8941 1600 kHz
> +               for pmi8998 800 kHz
> +
> +  qcom,ovp:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      V; Over-voltage protection limit; one of 27, 29, 32, 35. Default 29V
> +      This property is supported only for PM8941.
> +
> +  qcom,ovp-millivolt:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      mV; Over-voltage protection limit;
> +      For pmi8998 one of 18100, 19600, 29600, 31100.
> +      Default 29600 mV.
> +      If this property is not specified for PM8941, it
> +      falls back to "qcom,ovp" property.
> +
> +  qcom,num-strings:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      number of led strings attached;
> +      value for PM8941 from 1 to 3. Default 2
> +      For PMI8998 from 1 to 4.
> +
> +  interrupts:
> +    maxItems: 2
> +    description:
> +      Interrupts associated with WLED. This should be
> +      "short" and "ovp" interrupts. Interrupts can be
> +      specified as per the encoding listed under
> +      Documentation/devicetree/bindings/spmi/
> +      qcom,spmi-pmic-arb.txt.
> +
> +  interrupt-names:
> +    description:
> +      Interrupt names associated with the interrupts.
> +      Must be "short" and "ovp". The short circuit detection
> +      is not supported for PM8941.
> +
> +  qcom,enabled-strings:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Array of the WLED strings numbered from 0 to 3. Each
> +      string of leds are operated individually. Specify the
> +      list of strings used by the device. Any combination of
> +      led strings can be used.
> +
> +  qcom,external-pfet:
> +    description:
> +      Specify if external PFET control for short circuit
> +      protection is used. This property is supported only
> +      for PMI8998.
> +    type: boolean
> +
> +  qcom,auto-string-detection:
> +    description:
> +      Enables auto-detection of the WLED string configuration.
> +      This feature is not supported for PM8941.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - label
> +
> +examples:
> +  - |
> +    pm8941-wled@d800 {
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
