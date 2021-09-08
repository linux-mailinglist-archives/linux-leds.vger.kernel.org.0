Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303E24036AF
	for <lists+linux-leds@lfdr.de>; Wed,  8 Sep 2021 11:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348630AbhIHJQZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Sep 2021 05:16:25 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:11491 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351239AbhIHJQZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 8 Sep 2021 05:16:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631092517; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RDiwY+AZ3ACBodU30o7rTrzXnw0PgLmsZq3HxNZIBBE=;
 b=wT3+envUic3mKCNCSa3d2dXUKPQfE4xzxlf0YvysdtE1f6wzDDP5+kS9cDv7EVkJdgkVj6eb
 qMGCeRdNmL1NtGIyO3p1fb7l59KoGTaEpm4SZDMqFz2C5CUIa5J2Gb9V810wtRLPwKqqvFbx
 CJmGcKBYs/FD7/+sxG7OpF0pFAM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61387f11fc1f4cb6926f86bb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Sep 2021 09:14:57
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1DB8EC43617; Wed,  8 Sep 2021 09:14:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E258C4338F;
        Wed,  8 Sep 2021 09:14:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 08 Sep 2021 14:44:56 +0530
From:   skakit@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        mka@chromium.org, kgunda@codeaurora.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm8350c: Add pwm support
In-Reply-To: <CAE-0n51CCqrbKr9NCkzaK3JxCtJgRKdXTeR4kxnnOK_wNKpP6A@mail.gmail.com>
References: <1630924867-4663-1-git-send-email-skakit@codeaurora.org>
 <1630924867-4663-4-git-send-email-skakit@codeaurora.org>
 <CAE-0n51CCqrbKr9NCkzaK3JxCtJgRKdXTeR4kxnnOK_wNKpP6A@mail.gmail.com>
Message-ID: <b15b7da50186d8ec86857dce0a31f1e3@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2021-09-08 09:04, Stephen Boyd wrote:
> Quoting satya priya (2021-09-06 03:41:07)
>> Add pwm support for PM8350C pmic.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/pm8350c.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi 
>> b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> index e1b75ae..ecdae55 100644
>> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> @@ -29,6 +29,12 @@
>>                         interrupt-controller;
>>                         #interrupt-cells = <2>;
>>                 };
>> +
>> +               pm8350c_pwm4: pwm {
>> +                       compatible = "qcom,pm8350c-pwm";
> 
> Shouldn't there be a reg property?
> 

The bindings do not specify reg property. I think it is because we are 
adding the base address in struct "pm8350c_pwm_data".

>> +                       #pwm-cells = <2>;
>> +                       status = "okay";
>> +               };
>>         };
>>  };
>> 
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 
