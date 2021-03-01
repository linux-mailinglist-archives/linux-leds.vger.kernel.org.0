Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC355328502
	for <lists+linux-leds@lfdr.de>; Mon,  1 Mar 2021 17:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232398AbhCAQrX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Mar 2021 11:47:23 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:26793 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235206AbhCAQnT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 1 Mar 2021 11:43:19 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614616973; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WRPpZ9qj4Um6MCvFHhN5ctHaT2j5wddCNIfkDkOakl8=;
 b=jEJqPQi07gXSrFvz0T96CTDlX7YMuQm6FlsSypUvHBVz/09QAckzsM2XscrA5t4qszo5hr/+
 Vs1UrxAghvQ5xvSrtczjmlz6/PxR/KKNyMlFN7RxkWjiijeBohJ8Kr4cXKJ20zvkIqPhFWiu
 +TrVqlfRNlbU7c30Gb2qb41LfqE=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 603d196f832f19b9ef81d4fe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 16:42:23
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EB70FC43464; Mon,  1 Mar 2021 16:42:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E6927C433C6;
        Mon,  1 Mar 2021 16:42:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 01 Mar 2021 22:12:21 +0530
From:   kgunda@codeaurora.org
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH V3 2/2] backlight: qcom-wled: Correct the sync_toggle
 sequence
In-Reply-To: <20210301100239.orbt7km6lgjwvzii@maple.lan>
References: <1614590916-27070-1-git-send-email-kgunda@codeaurora.org>
 <1614590916-27070-3-git-send-email-kgunda@codeaurora.org>
 <20210301100239.orbt7km6lgjwvzii@maple.lan>
Message-ID: <f25a2c8b1bf0eae63a2fe9a31c824f1e@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2021-03-01 15:32, Daniel Thompson wrote:
> On Mon, Mar 01, 2021 at 02:58:36PM +0530, Kiran Gunda wrote:
>> As per the current implementation, after FSC (Full Scale Current)
>> and brightness update the sync bits are transitioned from 
>> set-then-clear.
> 
> This does not makes sense since there are too many verbs. Set and clear
> are both verbs so in this context: "the code will set the bit and then
> the code will clear the bit".
> 
> Either:
> 
> s/transitioned from set-then-clear/set-then-cleared/.
> 
> Or:
> 
> s/transitioned from set-then-clear/using a set-then-clear approach/.
> 
>> But, the FSC and brightness sync takes place during a clear-then-set
>> transition of the sync bits.
> 
> Likewise this no longer makes sense and had also become misleading.
> Two changes of state, clear and then set, do not usually result in a
> single transition.
> 
> Either:
> 
> s/clear-then-set/0 to 1/
> 
> Alternatively, if you want to stick exclusively to the set/clear
> terminology then replace the whole quoted section with:
> 
>   But, the FSC and brightness sync takes place when the sync bits are
>   set (e.g. on a rising edge).
> 
> 
>> So the hardware team recommends a
>> clear-then-set approach in order to guarantee such a transition
>> regardless of the previous register state.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> 
> With one of each of the changes proposed above:
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> 
> Daniel.
> 
Apologies for the mistake. I have corrected and submitted the
V4 series with the "reviewed-by" tag.
> 
>> ---
>>  drivers/video/backlight/qcom-wled.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/video/backlight/qcom-wled.c 
>> b/drivers/video/backlight/qcom-wled.c
>> index aef52b9..19f83ac 100644
>> --- a/drivers/video/backlight/qcom-wled.c
>> +++ b/drivers/video/backlight/qcom-wled.c
>> @@ -337,13 +337,13 @@ static int wled3_sync_toggle(struct wled *wled)
>> 
>>  	rc = regmap_update_bits(wled->regmap,
>>  				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
>> -				mask, mask);
>> +				mask, WLED3_SINK_REG_SYNC_CLEAR);
>>  	if (rc < 0)
>>  		return rc;
>> 
>>  	rc = regmap_update_bits(wled->regmap,
>>  				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
>> -				mask, WLED3_SINK_REG_SYNC_CLEAR);
>> +				mask, mask);
>> 
>>  	return rc;
>>  }
>> @@ -353,17 +353,17 @@ static int wled5_mod_sync_toggle(struct wled 
>> *wled)
>>  	int rc;
>>  	u8 val;
>> 
>> -	val = (wled->cfg.mod_sel == MOD_A) ? WLED5_SINK_REG_SYNC_MOD_A_BIT :
>> -					     WLED5_SINK_REG_SYNC_MOD_B_BIT;
>>  	rc = regmap_update_bits(wled->regmap,
>>  				wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
>> -				WLED5_SINK_REG_SYNC_MASK, val);
>> +				WLED5_SINK_REG_SYNC_MASK, 0);
>>  	if (rc < 0)
>>  		return rc;
>> 
>> +	val = (wled->cfg.mod_sel == MOD_A) ? WLED5_SINK_REG_SYNC_MOD_A_BIT :
>> +					     WLED5_SINK_REG_SYNC_MOD_B_BIT;
>>  	return regmap_update_bits(wled->regmap,
>>  				  wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
>> -				  WLED5_SINK_REG_SYNC_MASK, 0);
>> +				  WLED5_SINK_REG_SYNC_MASK, val);
>>  }
>> 
>>  static int wled_ovp_fault_status(struct wled *wled, bool *fault_set)
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>>  a Linux Foundation Collaborative Project
>> 
