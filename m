Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3911C1810EA
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2020 07:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgCKGlC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Mar 2020 02:41:02 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:20658 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728120AbgCKGlC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Mar 2020 02:41:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583908862; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=9Ma3v93cOhH+P2MvDLMRQOh7LMKfyPwnXpDIHPd4gMM=;
 b=Z0epLqADKSkqpSakQ8XPh1W5xHwhffnP1TX3XZ+zNkkMhvb6DBrMWmcNYvy6BBUy16fH4iJs
 mdkUBXGHgGlOCBnDxGtgC1EqAd5SkMJWBdOwzwjLbspOQgJpP4ydVu663BultMpAGA3gjdDB
 xskbCnNtUYqt/ZZUKOaw45Xo0z8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6887fd.7f3e91b80030-smtp-out-n02;
 Wed, 11 Mar 2020 06:41:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 41753C433D2; Wed, 11 Mar 2020 06:41:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D1F7C433CB;
        Wed, 11 Mar 2020 06:41:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 11 Mar 2020 12:11:00 +0530
From:   kgunda@codeaurora.org
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH V3 2/4] backlight: qcom-wled: Add callback functions
In-Reply-To: <20200310152719.5hpzh6osq22y4qbn@holly.lan>
References: <1583760362-26978-1-git-send-email-kgunda@codeaurora.org>
 <1583760362-26978-3-git-send-email-kgunda@codeaurora.org>
 <20200310152719.5hpzh6osq22y4qbn@holly.lan>
Message-ID: <05ab744dfbd83b6704bd394ce3c3dfc9@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2020-03-10 20:57, Daniel Thompson wrote:
> On Mon, Mar 09, 2020 at 06:56:00PM +0530, Kiran Gunda wrote:
>> Add cabc_config, sync_toggle, wled_ovp_fault_status and wled_ovp_delay
>> callback functions to prepare the driver for adding WLED5 support.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> 
> Overall this code would a lot easier to review if
>> ---
>>  drivers/video/backlight/qcom-wled.c | 196 
>> +++++++++++++++++++++++-------------
>>  1 file changed, 126 insertions(+), 70 deletions(-)
>> 
>> diff --git a/drivers/video/backlight/qcom-wled.c 
>> b/drivers/video/backlight/qcom-wled.c
>> index 3d276b3..b73f273 100644
>> --- a/drivers/video/backlight/qcom-wled.c
>> +++ b/drivers/video/backlight/qcom-wled.c
>> @@ -128,6 +128,7 @@ struct wled_config {
>>  	bool cs_out_en;
>>  	bool ext_gen;
>>  	bool cabc;
>> +	bool en_cabc;
> 
> Does this ever get set to true?
> 
Yes. If user wants use the cabc pin to control the brightness and
use the "qcom,cabc" DT property in the device tree.

>>  	bool external_pfet;
>>  	bool auto_detection_enabled;
>>  };
>> @@ -147,14 +148,20 @@ struct wled {
>>  	u32 max_brightness;
>>  	u32 short_count;
>>  	u32 auto_detect_count;
>> +	u32 version;
>>  	bool disabled_by_short;
>>  	bool has_short_detect;
>> +	bool cabc_disabled;
>>  	int short_irq;
>>  	int ovp_irq;
>> 
>>  	struct wled_config cfg;
>>  	struct delayed_work ovp_work;
>>  	int (*wled_set_brightness)(struct wled *wled, u16 brightness);
>> +	int (*cabc_config)(struct wled *wled, bool enable);
>> +	int (*wled_sync_toggle)(struct wled *wled);
>> +	int (*wled_ovp_fault_status)(struct wled *wled, bool *fault_set);
>> +	int (*wled_ovp_delay)(struct wled *wled);
> 
> Let's get some doc comments explaining what these callbacks do (and
> which versions they apply to).
> 
Sure. I will update it in the commit text in next post.

> cabc_config() in particular appears to have a very odd interface for
> wled4.  It looks like it relies on being initially called with enable
> set a particular way and prevents itself from acting again. Therefore 
> if
> the comment you end up writing doesn't sound "right" then please also
> fix the API!
> 
Actually this variable is useful for WLED5, where the default HW state 
is
CABC1 enabled mode. So, if the user doesn't want to use the CABC we are 
configuring
the HW state to "0" based on the DT property and then setting a flag to 
not enable it again.
This is not needed for WLED4. I will remove it for WLED4 in next post.

> Finally, why is everything except cabc_config() prefixed with wled?
> 
It is typo. I will correct it in the next post.
> 
> Daniel.
