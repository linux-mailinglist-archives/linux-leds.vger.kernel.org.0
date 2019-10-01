Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70104C387B
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2019 17:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389112AbfJAPEc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Oct 2019 11:04:32 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43570 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbfJAPEc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Oct 2019 11:04:32 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91F4IEd018422;
        Tue, 1 Oct 2019 10:04:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569942258;
        bh=LXCupkasMNvhfCAMtaSmWJHpvLL+kS4ze7rHxPE7RWs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hVKLXwGqOEWC0Hj5v31jIjLnX7ONzTRcOEQMzqZvtwJoC4ucoHGns9lktQPlX7qrO
         ZhNMo5KBYpzW+Qe458j8s6jd7GpcofWWTVwTlYFhXKVcyD4o8C/oHaJ7KrBumccTkf
         YaY91aSooTZznLi+gD7qCR5gGivbvNXjr6IGIKH0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91F4IdV065095
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 10:04:18 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 10:04:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 10:04:07 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91F4HJh112978;
        Tue, 1 Oct 2019 10:04:17 -0500
Subject: Re: [PATCH V6 2/8] backlight: qcom-wled: restructure the qcom-wled
 bindings
To:     Kiran Gunda <kgunda@codeaurora.org>, <bjorn.andersson@linaro.org>,
        <jingoohan1@gmail.com>, <lee.jones@linaro.org>,
        <b.zolnierkie@samsung.com>, <dri-devel@lists.freedesktop.org>,
        <daniel.thompson@linaro.org>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>
References: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
 <1569825553-26039-3-git-send-email-kgunda@codeaurora.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <19926a9f-d5d3-02e2-b7d1-ee7cd918f57d@ti.com>
Date:   Tue, 1 Oct 2019 10:04:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569825553-26039-3-git-send-email-kgunda@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Kiran

On 9/30/19 1:39 AM, Kiran Gunda wrote:
> Restructure the qcom-wled bindings for the better readability.
>
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>   .../bindings/leds/backlight/qcom-wled.txt          | 110 ++++++++++++++++-----

Since you are restructuring would it not be better to convert this to 
the yaml format?

It looks yamlish so the file extension should be .yaml.

Dan

>   1 file changed, 85 insertions(+), 25 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
> index fb39e32..14f28f2 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
> @@ -1,30 +1,90 @@
>   Binding for Qualcomm Technologies, Inc. WLED driver
>   
> -Required properties:
> -- compatible: should be "qcom,pm8941-wled"
> -- reg: slave address
> -
> -Optional properties:
> -- default-brightness: brightness value on boot, value from: 0-4095
> -	default: 2048
> -- label: The name of the backlight device
> -- qcom,cs-out: bool; enable current sink output
> -- qcom,cabc: bool; enable content adaptive backlight control
> -- qcom,ext-gen: bool; use externally generated modulator signal to dim
> -- qcom,current-limit: mA; per-string current limit; value from 0 to 25
> -	default: 20mA
> -- qcom,current-boost-limit: mA; boost current limit; one of:
> -	105, 385, 525, 805, 980, 1260, 1400, 1680
> -	default: 805mA
> -- qcom,switching-freq: kHz; switching frequency; one of:
> -	600, 640, 685, 738, 800, 872, 960, 1066, 1200, 1371,
> -	1600, 1920, 2400, 3200, 4800, 9600,
> -	default: 1600kHz
> -- qcom,ovp: V; Over-voltage protection limit; one of:
> -	27, 29, 32, 35
> -	default: 29V
> -- qcom,num-strings: #; number of led strings attached; value from 1 to 3
> -	default: 2
> +WLED (White Light Emitting Diode) driver is used for controlling display
> +backlight that is part of PMIC on Qualcomm Technologies, Inc. reference
> +platforms. The PMIC is connected to the host processor via SPMI bus.
> +
> +- compatible
> +	Usage:        required
> +	Value type:   <string>
> +	Definition:   should be one of:
> +			"qcom,pm8941-wled"
> +			"qcom,pmi8998-wled"
> +			"qcom,pm660l-wled"
> +
> +- reg
> +	Usage:        required
> +	Value type:   <prop encoded array>
> +	Definition:   Base address of the WLED modules.
> +
> +- default-brightness
> +	Usage:        optional
> +	Value type:   <u32>
> +	Definition:   brightness value on boot, value from: 0-4095
> +		      Default: 2048
> +
> +- label
> +	Usage:        required
> +	Value type:   <string>
> +	Definition:   The name of the backlight device
> +
> +- qcom,cs-out
> +	Usage:        optional
> +	Value type:   <bool>
> +	Definition:   enable current sink output.
> +		      This property is supported only for PM8941.
> +
> +- qcom,cabc
> +	Usage:        optional
> +	Value type:   <bool>
> +	Definition:   enable content adaptive backlight control.
> +
> +- qcom,ext-gen
> +	Usage:        optional
> +	Value type:   <bool>
> +	Definition:   use externally generated modulator signal to dim.
> +		      This property is supported only for PM8941.
> +
> +- qcom,current-limit
> +	Usage:        optional
> +	Value type:   <u32>
> +	Definition:   mA; per-string current limit
> +		      value: For pm8941: from 0 to 25 with 5 mA step
> +			     Default 20 mA.
> +			     For pmi8998: from 0 to 30 with 5 mA step
> +			     Default 25 mA.
> +
> +- qcom,current-boost-limit
> +	Usage:        optional
> +	Value type:   <u32>
> +	Definition:   mA; boost current limit.
> +		      For pm8941: one of: 105, 385, 525, 805, 980, 1260, 1400,
> +		      1680. Default: 805 mA
> +		      For pmi8998: one of: 105, 280, 450, 620, 970, 1150, 1300,
> +		      1500. Default: 970 mA
> +
> +- qcom,switching-freq
> +	Usage:        optional
> +	Value type:   <u32>
> +	 Definition:   kHz; switching frequency; one of: 600, 640, 685, 738,
> +		       800, 872, 960, 1066, 1200, 1371, 1600, 1920, 2400, 3200,
> +		       4800, 9600.
> +		       Default: for pm8941: 1600 kHz
> +				for pmi8998: 800 kHz
> +
> +- qcom,ovp
> +	Usage:        optional
> +	Value type:   <u32>
> +	Definition:   V; Over-voltage protection limit; one of:
> +		      27, 29, 32, 35. default: 29V
> +		      This property is supported only for PM8941.
> +
> +- qcom,num-strings
> +	Usage:        optional
> +	Value type:   <u32>
> +	Definition:   #; number of led strings attached;
> +		      value from 1 to 3. default: 2
> +		      This property is supported only for PM8941.
>   
>   Example:
>   
