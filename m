Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48F1CB14E4
	for <lists+linux-leds@lfdr.de>; Thu, 12 Sep 2019 21:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbfILTr3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Sep 2019 15:47:29 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55356 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfILTr3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 12 Sep 2019 15:47:29 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CJlOfX074523;
        Thu, 12 Sep 2019 14:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568317644;
        bh=VZv6M3mg7dY3vZcVeFZf11mw+86t0hc40BSEvN1ocIM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=j62+pDUoVzz742J9qmVwbyPhOu+yrXeBDW0Ewlbohg0rV+/brUQNCABJigxDG6/w0
         0dyI9CO3JCahnKq8eIp+jfq3cUYs1oUegEVuasyw/vsW/KZNWPf+RyAgpuH1csR7Rd
         pfvfVe78Ini/CpmbbpAZiFaXZYtECA0+jppDhZMo=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CJlO05128908
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 14:47:24 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 14:47:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 14:47:23 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CJlO7P087354;
        Thu, 12 Sep 2019 14:47:24 -0500
Subject: Re: [PATCH v2] leds: lm3532: Fix optional led-max-microamp prop error
 handling
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190911182730.22409-1-dmurphy@ti.com>
 <fe7c340b-65b9-f3eb-eb7a-f359f258ccca@gmail.com>
 <412da003-353d-895a-fa45-8e640b814734@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <6f17cfe4-299a-53d3-b6f4-ab5f3fe7b291@ti.com>
Date:   Thu, 12 Sep 2019 14:47:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <412da003-353d-895a-fa45-8e640b814734@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 9/12/19 2:12 PM, Jacek Anaszewski wrote:
> On 9/12/19 8:32 PM, Jacek Anaszewski wrote:> Hi Dan,
>> Thank you for the update.
>>
>> On 9/11/19 8:27 PM, Dan Murphy wrote:
>>> Fix the error handling for the led-max-microamp property.
>>> Need to check if the property is present and then if it is
>>> retrieve the setting and its max boundary
>>>
>>> Reported-by: Pavel Machek <pavel@ucw.cz>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>
>>> v2 - Changed full scale current check to use min function
>>>
>>>   drivers/leds/leds-lm3532.c | 14 +++++++++-----
>>>   1 file changed, 9 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
>>> index 62ace6698d25..a1742dc1f6fa 100644
>>> --- a/drivers/leds/leds-lm3532.c
>>> +++ b/drivers/leds/leds-lm3532.c
>>> @@ -601,11 +601,15 @@ static int lm3532_parse_node(struct lm3532_data *priv)
>>>   			goto child_out;
>>>   		}
>>>   
>>> -		ret = fwnode_property_read_u32(child, "led-max-microamp",
>>> -					       &led->full_scale_current);
>>> -
>>> -		if (led->full_scale_current > LM3532_FS_CURR_MAX)
>>> -			led->full_scale_current = LM3532_FS_CURR_MAX;
>>> +		if (fwnode_property_present(child, "led-max-microamp")) {
>>> +			if (fwnode_property_read_u32(child, "led-max-microamp",
>>> +						     &led->full_scale_current))
>>> +				dev_err(&priv->client->dev,
>>> +					"Failed getting led-max-microamp\n");
>>> +			else
>>> +				min(led->full_scale_current,
>>> +				    LM3532_FS_CURR_MAX);
> I didn't previously notice lack of assignment of min() return value.
>
> I've amended that and while at it improved a bit this construction to
> avoid some indentations and line breaks:
>
> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
> index 62ace6698d25..0507c6575c08 100644
> --- a/drivers/leds/leds-lm3532.c
> +++ b/drivers/leds/leds-lm3532.c
> @@ -601,11 +601,14 @@ static int lm3532_parse_node(struct lm3532_data *priv)
>                  goto child_out;
>          }
>
> -       ret = fwnode_property_read_u32(child, "led-max-microamp",
> -                                      &led->full_scale_current);
> -
> -       if (led->full_scale_current > LM3532_FS_CURR_MAX)
> -               led->full_scale_current = LM3532_FS_CURR_MAX;
> +       if (fwnode_property_present(child, "led-max-microamp") &&
> +           fwnode_property_read_u32(child, "led-max-microamp",
> +                                    &led->full_scale_current))
> +               dev_err(&priv->client->dev,
> +                       "Failed getting led-max-microamp\n");
> +       else
> +               led->full_scale_current = min(led->full_scale_current,
> +                                             LM3532_FS_CURR_MAX);
>
>          if (led->mode == LM3532_BL_MODE_ALS) {
>                  led->mode = LM3532_ALS_CTRL;
>
>
> Please let me know in case of any doubts.

This looks fine.  It always passed for me because I never set the FSC 
above max

Dan

