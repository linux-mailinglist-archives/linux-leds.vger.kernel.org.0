Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC5DC38A4
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2019 17:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbfJAPMf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Oct 2019 11:12:35 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46944 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbfJAPMe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Oct 2019 11:12:34 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91FCKRC127767;
        Tue, 1 Oct 2019 10:12:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569942740;
        bh=Zwnt9jNQrIm2hKZQ4ZZ5PvIDofDquK4WHFGwMvMgDGQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Tjgzc5la5vZRdPCkdaDwlNcFRxGgIHkdsfsqMcrNRrlstk4OcgMCaRhcbh1PCNGpB
         BIePqWsikNzAlrZW6s7OP1K/F0nI9qDApJpm9prvmX5REcK0wFJq0Oe9IFhRdoiyBu
         HlhU8vipkWgqSTWom2UUQHMog1XVTVc6RNW2B7GQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91FCJa5063001
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 10:12:19 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 10:12:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 10:12:19 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91FCJtb074683;
        Tue, 1 Oct 2019 10:12:19 -0500
Subject: Re: [PATCH V6 3/8] backlight: qcom-wled: Add new properties for
 PMI8998
To:     Kiran Gunda <kgunda@codeaurora.org>, <bjorn.andersson@linaro.org>,
        <jingoohan1@gmail.com>, <lee.jones@linaro.org>,
        <b.zolnierkie@samsung.com>, <dri-devel@lists.freedesktop.org>,
        <daniel.thompson@linaro.org>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>
References: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
 <1569825553-26039-4-git-send-email-kgunda@codeaurora.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3836b382-a4e6-d6db-9667-1851a9cf0112@ti.com>
Date:   Tue, 1 Oct 2019 10:12:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569825553-26039-4-git-send-email-kgunda@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Kiran

On 9/30/19 1:39 AM, Kiran Gunda wrote:
> Update the bindings with the new properties used for
> PMI8998.
>
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>   .../bindings/leds/backlight/qcom-wled.txt          | 76 ++++++++++++++++++----
>   1 file changed, 62 insertions(+), 14 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
> index 14f28f2..9d840d5 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
> @@ -20,8 +20,7 @@ platforms. The PMIC is connected to the host processor via SPMI bus.
>   - default-brightness
>   	Usage:        optional
>   	Value type:   <u32>
> -	Definition:   brightness value on boot, value from: 0-4095
> -		      Default: 2048
> +	Definition:   brightness value on boot, value from: 0-4095.
>   
>   - label
>   	Usage:        required
> @@ -48,20 +47,24 @@ platforms. The PMIC is connected to the host processor via SPMI bus.
>   - qcom,current-limit
>   	Usage:        optional
>   	Value type:   <u32>
> -	Definition:   mA; per-string current limit
> -		      value: For pm8941: from 0 to 25 with 5 mA step
> -			     Default 20 mA.
> -			     For pmi8998: from 0 to 30 with 5 mA step
> -			     Default 25 mA.
> +	Definition:   mA; per-string current limit; value from 0 to 25 with
> +		      1 mA step.
> +		      This property is supported only for pm8941.
> +
> +- qcom,current-limit-microamp
> +	Usage:        optional
> +	Value type:   <u32>
> +	Definition:   uA; per-string current limit; value from 0 to 30000 with
> +		      2500 uA step.
>   
>   - qcom,current-boost-limit
>   	Usage:        optional
>   	Value type:   <u32>
>   	Definition:   mA; boost current limit.
>   		      For pm8941: one of: 105, 385, 525, 805, 980, 1260, 1400,
> -		      1680. Default: 805 mA
> +		      1680.
>   		      For pmi8998: one of: 105, 280, 450, 620, 970, 1150, 1300,
> -		      1500. Default: 970 mA
> +		      1500.
>   
>   - qcom,switching-freq
>   	Usage:        optional
> @@ -69,22 +72,66 @@ platforms. The PMIC is connected to the host processor via SPMI bus.
>   	 Definition:   kHz; switching frequency; one of: 600, 640, 685, 738,
>   		       800, 872, 960, 1066, 1200, 1371, 1600, 1920, 2400, 3200,
>   		       4800, 9600.
> -		       Default: for pm8941: 1600 kHz
> -				for pmi8998: 800 kHz
>   
>   - qcom,ovp
>   	Usage:        optional
>   	Value type:   <u32>
>   	Definition:   V; Over-voltage protection limit; one of:
> -		      27, 29, 32, 35. default: 29V
> +		      27, 29, 32, 35.
>   		      This property is supported only for PM8941.
>   
> +- qcom,ovp-millivolt
> +	Usage:        optional
> +	Value type:   <u32>
> +	Definition:   mV; Over-voltage protection limit;
> +		      For pmi8998: one of 18100, 19600, 29600, 31100
> +		      If this property is not specified for PM8941, it
> +		      falls back to "qcom,ovp" property.
> +
>   - qcom,num-strings
>   	Usage:        optional
>   	Value type:   <u32>
>   	Definition:   #; number of led strings attached;
> -		      value from 1 to 3. default: 2
> -		      This property is supported only for PM8941.
> +		      value: For PM8941 from 1 to 3.
> +			     For PMI8998 from 1 to 4.

We probably don't need this since we define 1 led node per output.  And 
if you need to define

multiple strings per node then you use led-sources.

Then you will use fwnode_property_count_u32(child, "led-sources"); to 
get the number of outputs


> +
> +- interrupts
> +	Usage:        optional
> +	Value type:   <prop encoded array>
> +	Definition:   Interrupts associated with WLED. This should be
> +		      "short" and "ovp" interrupts. Interrupts can be
> +		      specified as per the encoding listed under
> +		      Documentation/devicetree/bindings/spmi/
> +		      qcom,spmi-pmic-arb.txt.
> +
> +- interrupt-names
> +	Usage:        optional
> +	Value type:   <string>
> +	Definition:   Interrupt names associated with the interrupts.
> +		      Must be "short" and "ovp". The short circuit detection
> +		      is not supported for PM8941.
> +
> +- qcom,enabled-strings
> +	Usage:        optional
> +	Value tyoe:   <u32 array>
> +	Definition:   Array of the WLED strings numbered from 0 to 3. Each
> +		      string of leds are operated individually. Specify the
> +		      list of strings used by the device. Any combination of
> +		      led strings can be used.

We usually use the reg property per led node to denote what output is 
associated with which

property node.  And if you want to define multiple outputs per node then 
you need to use

led-sources

See leds-lm3697.txt for an example

Dan


