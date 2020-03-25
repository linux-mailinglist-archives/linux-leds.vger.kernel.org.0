Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEC9192CB6
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2020 16:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbgCYPhV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Mar 2020 11:37:21 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37867 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727604AbgCYPhV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Mar 2020 11:37:21 -0400
Received: by mail-wr1-f66.google.com with SMTP id w10so3721493wrm.4
        for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2020 08:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rhpfx4/m5UT7Xzs51ZxQ03MQcWW4S3aHcV6k0fxCgW8=;
        b=J5cfQtP2IIFUEbxhdInPj+h0Pr08nmDXVvEoAiHkRcUhApMPv+9kGmE22t5XJkLIlo
         J3ntJB0cVM00iT4bGkgdPULTN0af8r1F2/kGRjEDLDhCvj71lEDk82Op1oz+UTjbwAe6
         ebkQ9qfIZsgmNDJtLgMlWLsVq1dC8EonjZAIKhhkf3WMkPDnUyjXzwCYqqseOJa0eTY0
         Nm/K2QPOZ0T7SnJn3RtErSbh+SoUGHtZQDR426H2zGajpzuzmKTebQSnp3AFnJ2KySyC
         MRg/T+kx9XuF791FNcTFtVP+eeKs8t8XoocVmLSMlSuiL0XaNvgiia1HOi10aGrXvTEz
         9VoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rhpfx4/m5UT7Xzs51ZxQ03MQcWW4S3aHcV6k0fxCgW8=;
        b=SzbW60QHcCSe+AAm4N1I/WDegRHDUXOF1Zc14WHn7c9pCCxD5AR6iWtshl67SxiBXC
         mC0xdlsUrYIWppojKg6St86lRO/tFuBu3I4DzUeVFGi2Xdf6YY006Q66kaTwZV1OHGZC
         nN75tBoqgUJegBAoeMH8+L+Kxx/zLsyRH1dYqVUBQLa3AeLYHX9iDPB3CCBW18mEbaRp
         Wh2PqcdYvBNDqZqA7tBzB44F3D2kAMBW+bpamPWHlxvOTEZmJIpKS0GUSfRNCygAXnga
         Jr8dB6jkqSDuEhuRRLWN7Bhy7p6fHhp/CrJaSyhmps9EzVFysmWixg0vyRzKsAvQwZrR
         8vFQ==
X-Gm-Message-State: ANhLgQ0yuGkzyG6DwX+tBXpDxFURLQCwi/A0mH/wD4gN7U4VwhsEEuRc
        Ywa2qpoIn1MTnO+zGMC2Ew0v6w==
X-Google-Smtp-Source: ADFU+vtbCx/qzTnNrFqm0cBm6DM0BazSQKDuz/1yNhs2QgSHiwkVDNNDvOCUr4fzyCbs355QcF6C+A==
X-Received: by 2002:adf:a343:: with SMTP id d3mr3855930wrb.50.1585150638866;
        Wed, 25 Mar 2020 08:37:18 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id n2sm36691078wro.25.2020.03.25.08.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 08:37:18 -0700 (PDT)
Date:   Wed, 25 Mar 2020 15:37:16 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V4 3/4] backlight: qcom-wled: Add WLED5 bindings
Message-ID: <20200325153716.tcx3t4bd6p3gr2x6@holly.lan>
References: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
 <1584985618-25689-4-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584985618-25689-4-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Mar 23, 2020 at 11:16:57PM +0530, Kiran Gunda wrote:
> Add WLED5 specific bindings.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.yaml         | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> index 8a388bf..159115f 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -20,6 +20,7 @@ properties:
>         - qcom,pm8941-wled
>         - qcom,pmi8998-wled
>         - qcom,pm660l-wled
> +       - qcom,pm8150l-wled
>  
>    reg:
>      maxItems: 1
> @@ -28,10 +29,23 @@ properties:
>      maxItems: 1
>      description:
>        brightness value on boot, value from 0-4095.
> +      For pm8150l this value vary from 0-4095 or 0-32767
> +      depending on the brightness control mode. If CABC is
> +      enabled 0-4095 range is used.

I rather dislike some of the property descriptions using PMIC version
numbers to distinguish between peripheral versions and others using
WLEDx version numbers.

Could the property description be rephrased to use WLED3/4/5 terminology
instead?


>      allOf:
>        - $ref: /schemas/types.yaml#/definitions/uint32
>          default: 2048
>  
> +  max-brightness:
> +    maxItems: 1
> +    description:
> +      Maximum brightness level. Allowed values are,
> +      for pmi8998 it is  0-4095.
> +      For pm8150l, this can be either 4095 or 32767.
> +      If CABC is enabled, this is capped to 4095.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +

Similar thing here, is PMI8998 simply a synonym for WLED4 or there
something special about the PMIC versioning that requires it to be used?


Daniel.


>    label:
>      maxItems: 1
>      description:
> @@ -124,6 +138,31 @@ properties:
>        value for PM8941 from 1 to 3. Default 2
>        For PMI8998 from 1 to 4.
>  
> +  qcom,modulator-sel:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Selects the modulator used for brightness modulation.
> +      Allowed values are,
> +               0 - Modulator A
> +               1 - Modulator B
> +      If not specified, then modulator A will be used by default.
> +      This property is applicable only to WLED5 peripheral.
> +
> +  qcom,cabc-sel:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Selects the CABC pin signal used for brightness modulation.
> +      Allowed values are,
> +              0 - CABC disabled
> +              1 - CABC 1
> +              2 - CABC 2
> +              3 - External signal (e.g. LPG) is used for dimming
> +      This property is applicable only to WLED5 peripheral.
> +
>    interrupts:
>      maxItems: 2
>      description:
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
