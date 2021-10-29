Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6F8440137
	for <lists+linux-leds@lfdr.de>; Fri, 29 Oct 2021 19:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhJ2RZm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 29 Oct 2021 13:25:42 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:49321 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230189AbhJ2RZm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 29 Oct 2021 13:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635528193; x=1667064193;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=lz3mQc308MTt4WVACz+DP5zg7iAOix3NKfFOXD0Qx1M=;
  b=qcxSA4o8jjjE68Tf7Qx+DNinerJt11bD+WJAELsTpJC0OQ7INGfuXLR0
   hc5uXbd+OHm3GW08e8pN3up03Loj8MiJb6QUJJyd5vrBzgfn4omqu2r6D
   fcGTQEr2hL3QrCm57rzT/4Db3GPRzMaInBvLfOg7xlXbOVMgtz7bDwS+0
   8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Oct 2021 10:23:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 10:23:12 -0700
Received: from [10.110.53.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.47.97.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Fri, 29 Oct 2021
 10:23:11 -0700
Subject: Re: [PATCH V3 1/4] dt-bindings: leds: Add pm8350c pmic support
To:     Satya Priya <quic_c_skakit@quicinc.com>,
        Pavel Machek <pavel@ucw.cz>,
        "Rob Herring" <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <mka@chromium.org>, <swboyd@chromium.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        satya priya <skakit@codeaurora.org>
References: <1635507893-25490-1-git-send-email-quic_c_skakit@quicinc.com>
 <1635507893-25490-2-git-send-email-quic_c_skakit@quicinc.com>
From:   Trilok Soni <quic_tsoni@quicinc.com>
Message-ID: <7bbc2d70-9b18-7e2f-1121-49d4342341ca@quicinc.com>
Date:   Fri, 29 Oct 2021 10:23:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1635507893-25490-2-git-send-email-quic_c_skakit@quicinc.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.47.97.222)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/29/2021 4:44 AM, Satya Priya wrote:
> From: satya priya <skakit@codeaurora.org>
> 
> Add pm8350c pmic pwm support.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>

If you are sending email form quic_c_skakit@quicinc.com then can you 
please use the same email for SOB as well?


> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Changes in V2:
>   - No changes.
> 
> Changes in V3:
>   - No changes.
> 
>   Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> index 336bd8e..409a4c7 100644
> --- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> @@ -19,6 +19,7 @@ properties:
>       enum:
>         - qcom,pm8150b-lpg
>         - qcom,pm8150l-lpg
> +      - qcom,pm8350c-pwm
>         - qcom,pm8916-pwm
>         - qcom,pm8941-lpg
>         - qcom,pm8994-lpg
> 
