Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1611B1162
	for <lists+linux-leds@lfdr.de>; Mon, 20 Apr 2020 18:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbgDTQUG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Apr 2020 12:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728861AbgDTQUE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 20 Apr 2020 12:20:04 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8670AC061A10
        for <linux-leds@vger.kernel.org>; Mon, 20 Apr 2020 09:20:04 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id h2so154665wmb.4
        for <linux-leds@vger.kernel.org>; Mon, 20 Apr 2020 09:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FcnrI1Xxn9roHL22ABKQnHw7igB0r3eb2Ibyo+D5Gg4=;
        b=eZCwHwJxiMW2kK0w8LBTT3gjw8hxb43UE0ZIYeUhXGGC3EOBNQdXrrZyEaDgTEptoE
         mV1KNSMKmKvvq5fZRtlIsxFVJMmI9F48caGM3a2+ch4sdjmChqYnSaU2ncRdiNrc4piz
         GujU5OpBRl3MRD3/s4/LE1Cs6cZwlphd+R06dlO3vQXZiqdD71ZIa89l2u1IUyEI7XiI
         onkoRwPnYq3mcJnbUKG7kZcsVTkK57s0Cs42vYf4l91LN1tfAqIrGNiSw+1tTAWrP0n4
         H7ueU03BLtYkD/8Na4HPsRXMLX1ixtWckPCoafEUQ233Eiyj8bacETzoIwTG6wY/9rXp
         ynZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FcnrI1Xxn9roHL22ABKQnHw7igB0r3eb2Ibyo+D5Gg4=;
        b=ue9W6IOYJHbtwUcsXlG3F3TNF3EeCgA6cXDHtT1aX5rlXwjFxSMGqibdBbQerh5x5/
         7Zbj7bL4koL1dbVOBcTdfclWGQsRxOH5UXcIaBaGXpnhGj8TPX3yYp2ax0bmZFHWMqYx
         JACCkJqUCOJrJKcItooxRYmyTcMl+KPjvAKOwyYtEaTRRPpw0f9IE+yfHai1iR+8VX7U
         Xl0GuqaH05hbj3qci9wi8Y1IxQ4s0D3mHAyfg5WHWzL/dZPFAfdwuKINtiryMnhWpt/A
         PaT636CXJe19rFx/n952qTaQcCM8EUDd4wfMloqHZTWOB83PLCfOTeCdkxyXB7EqM1J7
         LhAQ==
X-Gm-Message-State: AGi0PuYcOfI3AlDURQ+puuJ3aLeg1trRlplyQ5NPn2piMrpZ4um2e9St
        Z7ukauBzjYuB+8aaruesd+QyaQ==
X-Google-Smtp-Source: APiQypIOjWhJPhp1gW4daPR8VO7+/mdSIWT0KSBh3hGPhAZCL+dM5mz/ByFEpRzyuFVtWYhCm99huQ==
X-Received: by 2002:a1c:154:: with SMTP id 81mr139993wmb.48.1587399603257;
        Mon, 20 Apr 2020 09:20:03 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id t63sm95597wmt.37.2020.04.20.09.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 09:20:02 -0700 (PDT)
Date:   Mon, 20 Apr 2020 17:20:00 +0100
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
Subject: Re: [PATCH V5 3/4] backlight: qcom-wled: Add WLED5 bindings
Message-ID: <20200420162000.cmqhk5kphijd2m2d@holly.lan>
References: <1586274430-28402-1-git-send-email-kgunda@codeaurora.org>
 <1586274430-28402-4-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586274430-28402-4-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Apr 07, 2020 at 09:17:09PM +0530, Kiran Gunda wrote:
> Add WLED5 specific bindings.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>

If v6 is just reacting to Rob's feedback then feel free to add the
following when you recirculate:

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  .../bindings/leds/backlight/qcom-wled.yaml         | 60 ++++++++++++++++++++--
>  1 file changed, 57 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> index 770e780..5714631 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -21,6 +21,7 @@ properties:
>        - qcom,pm8941-wled
>        - qcom,pmi8998-wled
>        - qcom,pm660l-wled
> +      - qcom,pm8150l-wled
>  
>    reg:
>      maxItems: 1
> @@ -28,12 +29,13 @@ properties:
>    default-brightness:
>      description:
>        brightness value on boot.
> -    minimum: 0
> -    maximum: 4095
> -    default: 2048
>  
>    label: true
>  
> +  max-brightness:
> +    description:
> +      Maximum brightness level.
> +
>    qcom,cs-out:
>      description:
>        enable current sink output.
> @@ -130,6 +132,31 @@ properties:
>        This feature is not supported for WLED3.
>      type: boolean
>  
> +  qcom,modulator-sel:
> +    description:
> +      Selects the modulator used for brightness modulation.
> +      Allowed values are,
> +           0 - Modulator A
> +           1 - Modulator B
> +      This property is applicable only to WLED5 peripheral.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 0, 1 ]
> +      - default: 0
> +
> +  qcom,cabc-sel:
> +    description:
> +      Selects the CABC pin signal used for brightness modulation.
> +      Allowed values are,
> +           0 - CABC disabled
> +           1 - CABC 1
> +           2 - CABC 2
> +           3 - External signal (e.g. LPG) is used for dimming
> +      This property is applicable only to WLED5 peripheral.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 0, 1, 2, 3 ]
> +
>  allOf:
>    - if:
>        properties:
> @@ -179,6 +206,33 @@ allOf:
>              - const: ovp
>              - const: short
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,pm8150l-wled
> +
> +    then:
> +      properties:
> +        default-brightness:
> +          minimum: 0
> +          maximum: 32767
> +        
> +        max-brightness:
> +          minimum: 0
> +          maximum: 32767
> +
> +    else:
> +      properties:
> +        default-brightness:
> +            minimum: 0
> +            maximum: 4095
> +        
> +        max-brightness:
> +          minimum: 0
> +          maximum: 4095
> +
>  required:
>    - compatible
>    - reg
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
