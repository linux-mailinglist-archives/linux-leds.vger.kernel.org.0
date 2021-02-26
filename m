Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6582B325D90
	for <lists+linux-leds@lfdr.de>; Fri, 26 Feb 2021 07:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhBZGc3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Feb 2021 01:32:29 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:13028 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229545AbhBZGc2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Feb 2021 01:32:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614321126; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hdl2zflkyzgnrN66H07L0bWdahCjua7YjvzKEgluVvI=;
 b=OXnsZBaItR+W5N0a3NskU9Le9q/zXQ1vNTP6CPpXtQbS+TOhTnONRIylEaNnbBCG4VNwo5Jv
 9Wdsy80BdoWgeaeXfXOK7U0HbubPiosuELNHAVWCGC0oRvVDuk3Vs/z5od0LjUqoitUUdzhK
 mJknKdwxOOyJDteEra3gdkw2E8Q=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 603895c16bec4e44c6a4030c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 06:31:29
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D0CA3C433CA; Fri, 26 Feb 2021 06:31:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B790FC433ED;
        Fri, 26 Feb 2021 06:31:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Feb 2021 12:01:28 +0530
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
Subject: Re: [PATCH V1 1/2] backlight: qcom-wled: Fix FSC update issue for
 WLED5
In-Reply-To: <20210224111505.37t5aq25iszg23iv@maple.lan>
References: <1614138648-2963-1-git-send-email-kgunda@codeaurora.org>
 <1614138648-2963-2-git-send-email-kgunda@codeaurora.org>
 <20210224111505.37t5aq25iszg23iv@maple.lan>
Message-ID: <6ab55df25e193718c143964dda085d8c@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2021-02-24 16:45, Daniel Thompson wrote:
> On Wed, Feb 24, 2021 at 09:20:47AM +0530, Kiran Gunda wrote:
>> Currently, for WLED5, after FSC register update MOD_SYNC_BIT
>> is toggled instead of SYNC_BIT. MOD_SYNC_BIT has to be toggled
>> after the brightness update and SYNC_BIT has to be toggled after
>> FSC update for WLED5. Fix it.
> 
> Code looks fine but the description is a difficult to read (which makes
> mining the history difficult).
> 
> Basically the descriptions here are very hard to read without the
> context in PATCH 0/2. Since PATCH 0/2 won't enter the version history
> that means these descriptions need to integrate some of the text from
> what is currently PATCH 0/2.
> 
> I would expect this to be more like. It is basically joining together
> text from PATCH 0 and PATCH 1 (I also switched to plural form for SYNC
> bits... the code in the driver has mask generation based on the number
> of strings, is that right?):
Sorry for the trouble. Yes, you are correct. The mask generation is
based on the number of strings defined in the device tree and only those
strings are enabled. However, there is no issue if the SYNC bits of all
the strings are cleared/set. The SYNC takes place only for enabled 
strings.

> ~~~
> Currently, for WLED5, the FSC (Full scale current) setting is not
> updated properly due to driver toggling the wrong register after an FSC
> update.
> 
> On WLED5 we should only toggle the MOD_SYNC bit after a brightness
> update. For an FSC update we need to toggle the SYNC bits instead.
> 
> Fix it by adopting the common wled3_sync_toggle() for WLED5 and
> introducing new code to the brightness update path to
> compensate.
> ~~~
> I will update the Documentation/patch description clearly
as suggested.
> 
> Daniel.
> 
> 
> 
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> ---
>>  drivers/video/backlight/qcom-wled.c | 25 +++++++++++++++++++------
>>  1 file changed, 19 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/video/backlight/qcom-wled.c 
>> b/drivers/video/backlight/qcom-wled.c
>> index 3bc7800..aef52b9 100644
>> --- a/drivers/video/backlight/qcom-wled.c
>> +++ b/drivers/video/backlight/qcom-wled.c
>> @@ -348,7 +348,7 @@ static int wled3_sync_toggle(struct wled *wled)
>>  	return rc;
>>  }
>> 
>> -static int wled5_sync_toggle(struct wled *wled)
>> +static int wled5_mod_sync_toggle(struct wled *wled)
>>  {
>>  	int rc;
>>  	u8 val;
>> @@ -445,10 +445,23 @@ static int wled_update_status(struct 
>> backlight_device *bl)
>>  			goto unlock_mutex;
>>  		}
>> 
>> -		rc = wled->wled_sync_toggle(wled);
>> -		if (rc < 0) {
>> -			dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
>> -			goto unlock_mutex;
>> +		if (wled->version < 5) {
>> +			rc = wled->wled_sync_toggle(wled);
>> +			if (rc < 0) {
>> +				dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
>> +				goto unlock_mutex;
>> +			}
>> +		} else {
>> +			/*
>> +			 * For WLED5 toggling the MOD_SYNC_BIT updates the
>> +			 * brightness
>> +			 */
>> +			rc = wled5_mod_sync_toggle(wled);
>> +			if (rc < 0) {
>> +				dev_err(wled->dev, "wled mod sync failed rc:%d\n",
>> +					rc);
>> +				goto unlock_mutex;
>> +			}
>>  		}
>>  	}
>> 
>> @@ -1459,7 +1472,7 @@ static int wled_configure(struct wled *wled)
>>  		size = ARRAY_SIZE(wled5_opts);
>>  		*cfg = wled5_config_defaults;
>>  		wled->wled_set_brightness = wled5_set_brightness;
>> -		wled->wled_sync_toggle = wled5_sync_toggle;
>> +		wled->wled_sync_toggle = wled3_sync_toggle;
>>  		wled->wled_cabc_config = wled5_cabc_config;
>>  		wled->wled_ovp_delay = wled5_ovp_delay;
>>  		wled->wled_auto_detection_required =
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>>  a Linux Foundation Collaborative Project
>> 
