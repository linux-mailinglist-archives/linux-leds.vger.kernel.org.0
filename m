Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F43ACB954
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 13:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730976AbfJDLk5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 07:40:57 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:49326 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfJDLk5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 07:40:57 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 53CEE61A10; Fri,  4 Oct 2019 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570189256;
        bh=ripHZzJ25rIS8dQQRxX/6LaM0R0g+Keu+K/houPPzd0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=R3024MVWCCQCzJyN7l7EPvE6OimHjRwpfQ1q4AMmwx3hH5cz6hAKcI4HltdkcfgAc
         CcFrVwaR8zBHBuWXMaxcA0paxWbuCAkl/wvl8jfbU7Ey+jheo9/SYXX4rcOdwwA1jf
         KdRxyuK3t93WGAwKZS4qJ3KeNH2bdF/1AWcXYdkY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 3E641614B5;
        Fri,  4 Oct 2019 11:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570189255;
        bh=ripHZzJ25rIS8dQQRxX/6LaM0R0g+Keu+K/houPPzd0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Nzm3x7gi6Cr0TVvrsQvNSRUYb5+6KKewDbjcBIgCiixY8wy2Xu9fSgcD2qR2u9xDr
         F86dOqf+oyr754oV9v4r+JeemzF8pOVIcQyAS6AfciI891D6YdEdGyGMeffzjbYBi/
         OFHbeR3xAIGiuXhigwdb6Ye09pV6lL0lVroympqM=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 04 Oct 2019 17:10:55 +0530
From:   kgunda@codeaurora.org
To:     Dan Murphy <dmurphy@ti.com>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V6 5/8] backlight: qcom-wled: Restructure the driver for
 WLED3
In-Reply-To: <6f50ea19-f320-b4e6-f269-4d1e2189fa77@ti.com>
References: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
 <1569825553-26039-6-git-send-email-kgunda@codeaurora.org>
 <6f50ea19-f320-b4e6-f269-4d1e2189fa77@ti.com>
Message-ID: <7300c740873439b341d05ee40e071c3f@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2019-10-01 20:47, Dan Murphy wrote:
> Kiran
> 
> On 9/30/19 1:39 AM, Kiran Gunda wrote:
>> Restructure the driver to add the support for new WLED
>> peripherals.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
>> ---
>>   drivers/video/backlight/qcom-wled.c | 395 
>> ++++++++++++++++++++++--------------
>>   1 file changed, 245 insertions(+), 150 deletions(-)
>> 
>> diff --git a/drivers/video/backlight/qcom-wled.c 
>> b/drivers/video/backlight/qcom-wled.c
>> index f191242..740f1b6 100644
>> --- a/drivers/video/backlight/qcom-wled.c
>> +++ b/drivers/video/backlight/qcom-wled.c
>> @@ -7,59 +7,71 @@
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <linux/of_device.h>
>> +#include <linux/of_address.h>
>>   #include <linux/regmap.h>
>>     /* From DT binding */
>> +#define WLED_MAX_STRINGS				4
>> +
>>   #define WLED_DEFAULT_BRIGHTNESS				2048
>>   -#define WLED3_SINK_REG_BRIGHT_MAX			0xFFF
>> -#define WLED3_CTRL_REG_VAL_BASE				0x40
>> +#define WLED_SINK_REG_BRIGHT_MAX			0xFFF
> 
> Why did you change some of these again?
> 
> Can you just change it to the final #define in patch 4/8?
> 
> Dan
> 
> <snip>
Ok.. Looks like some thing went wrong with this series. I will re-upload 
it again.
