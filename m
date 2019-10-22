Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC2FDFE1D
	for <lists+linux-leds@lfdr.de>; Tue, 22 Oct 2019 09:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730945AbfJVHU3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Oct 2019 03:20:29 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39994 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728346AbfJVHU3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Oct 2019 03:20:29 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 62804607DE; Tue, 22 Oct 2019 07:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571728827;
        bh=EVwj46UeE2wGGDTOX5OHTVhOFwofSd5fYovKQxbRLQg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dWFWIuvfhkYhzhxaCFrwEsjwAD6OHiNShNaNIzxk8XoTN1KGvmppbfSYjkQoOGTkT
         kaBx5EoMwX0C8/4ivSYMZfuArOjpTYa6/N25SyUi9j7zJYi/iLnxtxTWWHB5KP7Gyp
         L1ERtz9LOVC3CFeW+MJ2FxquzrnpUbV013oRX/UE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 1BFE9602D8;
        Tue, 22 Oct 2019 07:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571728826;
        bh=EVwj46UeE2wGGDTOX5OHTVhOFwofSd5fYovKQxbRLQg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=L182tLUn5lO3IAJmkyDsbs67sIsNniqSSrUcM/4htc7AHSW6qY8UzUT2JztXMGK0f
         eYdL11L+La2yCVX3QAQ5tVN+DH34lPoZGTunK3dzImJAB6zIq1mxy+NAiZGiooY7Vo
         yKwNxmgTYuTPfNtvox+bMnBltKkQCsVS23TY9sOs=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 22 Oct 2019 12:50:16 +0530
From:   kgunda@codeaurora.org
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V8 6/6] backlight: qcom-wled: Add auto string detection
 logic
In-Reply-To: <20191021103150.ta7qalltldofouh4@holly.lan>
References: <1571402009-8706-1-git-send-email-kgunda@codeaurora.org>
 <1571402009-8706-7-git-send-email-kgunda@codeaurora.org>
 <20191021103150.ta7qalltldofouh4@holly.lan>
Message-ID: <0d41f3eb83bbae9eaab0723a84bfcb1b@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2019-10-21 16:01, Daniel Thompson wrote:
> On Fri, Oct 18, 2019 at 06:03:29PM +0530, Kiran Gunda wrote:
>> The auto string detection algorithm checks if the current WLED
>> sink configuration is valid. It tries enabling every sink and
>> checks if the OVP fault is observed. Based on this information
>> it detects and enables the valid sink configuration.
>> Auto calibration will be triggered when the OVP fault interrupts
>> are seen frequently thereby it tries to fix the sink configuration.
>> 
>> The auto-detection also kicks in when the connected LED string
>> of the display-backlight malfunctions (because of damage) and
>> requires the damaged string to be turned off to prevent the
>> complete panel and/or board from being damaged.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> ---
>>  drivers/video/backlight/qcom-wled.c | 398 
>> +++++++++++++++++++++++++++++++++++-
>>  1 file changed, 392 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/video/backlight/qcom-wled.c 
>> b/drivers/video/backlight/qcom-wled.c
>> index 658b1e0..b2e6754 100644
>> --- a/drivers/video/backlight/qcom-wled.c
>> +++ b/drivers/video/backlight/qcom-wled.c
>> @@ -193,7 +216,23 @@ static int wled_module_enable(struct wled *wled, 
>> int val)
>>  				WLED3_CTRL_REG_MOD_EN,
>>  				WLED3_CTRL_REG_MOD_EN_MASK,
>>  				val << WLED3_CTRL_REG_MOD_EN_SHIFT);
>> -	return rc;
>> +	if (rc < 0)
>> +		return rc;
>> +
>> +	if (wled->ovp_irq > 0) {
>> +		if (val) {
>> +			/*
>> +			 * Wait for at least 10ms before enabling OVP interrupt
>> +			 * after module enable so that soft start is completed.
>> +			 */
> 
> Comments should not say what is does (we can read that). It should be
> saying what is weird about the hardware the results in us enabling the
> interrupt in an unusual way.
> 
> More like:
> 
> "The hardware generates a storm of spurious OVP interrupts during soft
> start operations so defer enabling the IRQ for 10ms to ensure that
> the soft start is complete."
> 
> Note that I am only guessing that is an spurious interrupt storm that
> caused you to defer the interrupt enable... I don't want to have to
> guess which is why I am asking for a good quality comment!
> 
> 
> Daniel.
Yes. Your guess is correct. The hardware document explains the same.
The WLED boost voltage can hit OVP limit in normal operating conditions 
such as
during the soft start timing.
Hence, waiting for the soft start to complete before enabling the OVP 
interrupt
to avoid the spurious interrupts.

I will update the comment as you suggested in the next series.
