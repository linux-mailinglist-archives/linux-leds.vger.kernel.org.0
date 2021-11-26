Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 670EA45E9C0
	for <lists+linux-leds@lfdr.de>; Fri, 26 Nov 2021 09:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359673AbhKZJCu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Nov 2021 04:02:50 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:49000 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347368AbhKZJAp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Nov 2021 04:00:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637917053; x=1669453053;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=EYjeCTwdteyE7IMR2jhdzrSkl27yNe3saVoMlhUd2e8=;
  b=hVLC724v546Qy+5ghal9VJUm1Gj38LWEaGRiMBPr8ecZ7NeZxwtyGvB6
   +aqHVY34b5BQBj0vXXNpql+p8HnWS0gpYEo29ZiGx8R8MPTHay6KcWqp+
   KzMHZn8iczegtDmhIRdvSUnXSm4RxEfKHE5sR1hQqf1kDxLhGS6g+mRCQ
   U=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 26 Nov 2021 00:57:33 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 00:57:32 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 26 Nov 2021 00:57:31 -0800
Received: from [10.216.34.137] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 26 Nov
 2021 00:57:27 -0800
Subject: Re: [PATCH V3 1/4] dt-bindings: leds: Add pm8350c pmic support
To:     Trilok Soni <quic_tsoni@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
        "Rob Herring" <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>
CC:     <mka@chromium.org>, <swboyd@chromium.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        satya priya <skakit@codeaurora.org>
References: <1635507893-25490-1-git-send-email-quic_c_skakit@quicinc.com>
 <1635507893-25490-2-git-send-email-quic_c_skakit@quicinc.com>
 <7bbc2d70-9b18-7e2f-1121-49d4342341ca@quicinc.com>
From:   "Satya Priya Kakitapalli (Temp)" <quic_c_skakit@quicinc.com>
Message-ID: <22ecbdc4-0203-bc68-5c17-3b1b81c0a488@quicinc.com>
Date:   Fri, 26 Nov 2021 14:27:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7bbc2d70-9b18-7e2f-1121-49d4342341ca@quicinc.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 10/29/2021 10:53 PM, Trilok Soni wrote:
> On 10/29/2021 4:44 AM, Satya Priya wrote:
>> From: satya priya <skakit@codeaurora.org>
>>
>> Add pm8350c pmic pwm support.
>>
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>
> If you are sending email form quic_c_skakit@quicinc.com then can you 
> please use the same email for SOB as well?
>

Okay, I'll resend the V3 by changing SOB.


>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
>> Changes in V2:
>>   - No changes.
>>
>> Changes in V3:
>>   - No changes.
>>
>>   Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml 
>> b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
>> index 336bd8e..409a4c7 100644
>> --- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
>> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
>> @@ -19,6 +19,7 @@ properties:
>>       enum:
>>         - qcom,pm8150b-lpg
>>         - qcom,pm8150l-lpg
>> +      - qcom,pm8350c-pwm
>>         - qcom,pm8916-pwm
>>         - qcom,pm8941-lpg
>>         - qcom,pm8994-lpg
>>
