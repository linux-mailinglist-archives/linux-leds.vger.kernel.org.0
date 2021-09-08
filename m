Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C51C54036BF
	for <lists+linux-leds@lfdr.de>; Wed,  8 Sep 2021 11:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351357AbhIHJSr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Sep 2021 05:18:47 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:58471 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351352AbhIHJSq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Sep 2021 05:18:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631092659; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=D4m1HZX4XxglmANFvhM+U619loFcf8JXgc2VJMqoQP8=;
 b=b/XsxfZQTL1VEi/9eC28ikc6Ks23BrvZshZQTV+sNXzHEZvL/nk7leSCSZEznvNq1vNOB3wF
 0jBKpMSXsBwcc3w1dvgLZmoL6HICAmTtlFxVTUicwt914y5KpzNFrqTVgyEt/JTgpImwiwPP
 jE6rKvMcyEMSCdH8eEm9fqpi1vg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61387fb2096d475c7c75650f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Sep 2021 09:17:38
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 76D98C43617; Wed,  8 Sep 2021 09:17:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D77DCC4338F;
        Wed,  8 Sep 2021 09:17:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 08 Sep 2021 14:47:37 +0530
From:   skakit@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>, mka@chromium.org,
        kgunda@codeaurora.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] leds: Add pm8350c support to Qualcomm LPG driver
In-Reply-To: <CAE-0n52Jb9nw9rbbQJrKNDQ_O2iCahDr8WLGkWORcNks9ptH-g@mail.gmail.com>
References: <1630924867-4663-1-git-send-email-skakit@codeaurora.org>
 <1630924867-4663-3-git-send-email-skakit@codeaurora.org>
 <CAE-0n52Jb9nw9rbbQJrKNDQ_O2iCahDr8WLGkWORcNks9ptH-g@mail.gmail.com>
Message-ID: <f35822d036988a1a6b6e4dcaa46373e7@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2021-09-08 01:50, Stephen Boyd wrote:
> Quoting satya priya (2021-09-06 03:41:06)
>> Add pm8350c compatible and lpg_data to the driver.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>>  drivers/leds/rgb/leds-qcom-lpg.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>> 
>> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c 
>> b/drivers/leds/rgb/leds-qcom-lpg.c
>> index 327e81a..6ee80d6 100644
>> --- a/drivers/leds/rgb/leds-qcom-lpg.c
>> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
>> @@ -1275,9 +1275,19 @@ static const struct lpg_data pm8150l_lpg_data = 
>> {
>>         },
>>  };
>> 
>> +static const struct lpg_data pm8350c_pwm_data = {
>> +       .pwm_9bit_mask = BIT(2),
>> +
>> +       .num_channels = 1,
>> +       .channels = (struct lpg_channel_data[]) {
> 
> Can this be const struct lpg_channel_data? I think that will move it to
> rodata which is only a good thing.
> 

I agree.
@Bjorn, can we make it const struct?

>> +               { .base = 0xeb00 },
>> +       },
>> +};
>> +
>>  static const struct of_device_id lpg_of_table[] = {
>>         { .compatible = "qcom,pm8150b-lpg", .data = &pm8150b_lpg_data 
>> },
>>         { .compatible = "qcom,pm8150l-lpg", .data = &pm8150l_lpg_data 
>> },
>> +       { .compatible = "qcom,pm8350c-pwm", .data = &pm8350c_pwm_data 
>> },
>>         { .compatible = "qcom,pm8916-pwm", .data = &pm8916_pwm_data },
>>         { .compatible = "qcom,pm8941-lpg", .data = &pm8941_lpg_data },
>>         { .compatible = "qcom,pm8994-lpg", .data = &pm8994_lpg_data },
