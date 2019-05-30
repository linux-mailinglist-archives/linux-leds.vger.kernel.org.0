Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6D273030E
	for <lists+linux-leds@lfdr.de>; Thu, 30 May 2019 21:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbfE3T60 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 30 May 2019 15:58:26 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44996 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfE3T6Z (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 May 2019 15:58:25 -0400
Received: by mail-lj1-f194.google.com with SMTP id e13so7242909ljl.11;
        Thu, 30 May 2019 12:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gbG0dcEiRmqzN9/hOTcBM5kfsYXv777iQ1mRuKOqyJY=;
        b=kMAWSKCnpNfYB3h9MoyGvd53twCSULqKHbeFbQ8idKnaDM0e9tXTS1+sXw35ePUxA6
         MokTUJkJNMT7T5i5dXD5jM/OVKHZJekOjs5v7SqoTAaUpJa27Sor3eCF1kKfbegwt+s9
         RAwHKGVWqfscD8ORjJgDahWvQjhQfOgq7u5zRiFb9t2AbiUozocOna2WWXvyP0W41C8e
         TWAWqRTY1Xl6KdsHOBjEu3aDrPtsnGdaip2gBImm14n6mcYdftUEL6DdIuzvjclAZlMZ
         KDf6Frw55tlCPQ2A+d56NICe1an98G6ABHqawEMQU41HBf/RBbctywqbwbDZPy6EnkoN
         PVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gbG0dcEiRmqzN9/hOTcBM5kfsYXv777iQ1mRuKOqyJY=;
        b=ost5HSJcV5IKuniZb6b0owOazGK34G3ibFM8aKxBMXnT9fPyHXuGiqBDiRzn60bpJ/
         R8HZlaae1Wvy3bSeTefqF1UDAFW6gBAE/uBXeXxJZkX9rero3kaluwWKDImoOyI2SzI6
         flsywCNk7XpijMSeTAM9Eq/mRh2XSFq6iZPM9oCVIZBW9LPdV/P40tiid0EbQEbU2L8Y
         BN17tRTuZdqFY+cyBj5OSlPo+DBVrzSInkxqllEvciX41Ob/liafTyjp9TPRzetypz1y
         oc/WqTZgU59/rQjIsEwyRq9fA5fi6ibs/3W6KeXJgLV3dpX3pHJV/sDONs51L9co2i9X
         O2Yw==
X-Gm-Message-State: APjAAAWuapru+o2luSF11Ufk7weTkPZQJXg3bNy3zdXF5LUNo1P9EhZn
        JubEBaA+urbWB8JblHAIbxOY381P
X-Google-Smtp-Source: APXvYqyygqtVXZFrJdcj0fLwDOT1FSZ9EmkBgevHCDoMn1bcVBB3GWHduqEr3q54mDaReX9rveOaDA==
X-Received: by 2002:a2e:9ed6:: with SMTP id h22mr3362292ljk.29.1559246302728;
        Thu, 30 May 2019 12:58:22 -0700 (PDT)
Received: from [192.168.1.17] (cop108.neoplus.adsl.tpnet.pl. [83.31.195.108])
        by smtp.gmail.com with ESMTPSA id y4sm683970lje.24.2019.05.30.12.58.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 12:58:21 -0700 (PDT)
Subject: Re: [RESEND PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274 LED
 driver
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        broonie@kernel.org, lgirdwood@gmail.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-7-dmurphy@ti.com> <20190523125012.GB20354@amd>
 <0c2bd6af-92c5-2458-dc41-1ea413545347@ti.com>
 <89a80aa8-66ee-d0ec-fa54-c55ca8de06af@gmail.com> <20190529135821.GK4574@dell>
 <afff7c24-bb68-e9dc-295e-4449f9729cc9@gmail.com> <20190530073827.GL4574@dell>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <c75025f5-a984-78fa-2737-d10027e5741c@gmail.com>
Date:   Thu, 30 May 2019 21:58:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190530073827.GL4574@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/30/19 9:38 AM, Lee Jones wrote:
> On Wed, 29 May 2019, Jacek Anaszewski wrote:
> 
>> On 5/29/19 3:58 PM, Lee Jones wrote:
>>> On Fri, 24 May 2019, Jacek Anaszewski wrote:
>>>
>>>> Hi,
>>>>
>>>> On 5/23/19 9:09 PM, Dan Murphy wrote:
>>>>> Pavel
>>>>>
>>>>> Thanks for the review
>>>>>
>>>>> On 5/23/19 7:50 AM, Pavel Machek wrote:
>>>>>> Hi!
>>>>>>
>>>>>>> +++ b/drivers/leds/leds-lm36274.c
>>>>>>
>>>>>>> +static int lm36274_parse_dt(struct lm36274 *lm36274_data)
>>>>>>> +{
>>>>>>> +	struct fwnode_handle *child = NULL;
>>>>>>> +	char label[LED_MAX_NAME_SIZE];
>>>>>>> +	struct device *dev = &lm36274_data->pdev->dev;
>>>>>>> +	const char *name;
>>>>>>> +	int child_cnt;
>>>>>>> +	int ret = -EINVAL;
>>>>>>> +
>>>>>>> +	/* There should only be 1 node */
>>>>>>> +	child_cnt = device_get_child_node_count(dev);
>>>>>>> +	if (child_cnt != 1)
>>>>>>> +		return ret;
>>>>>>
>>>>>> I'd do explicit "return -EINVAL" here.
>>>>>>
>>>>>
>>>>> ACK
>>>>>
>>>>>>> +static int lm36274_probe(struct platform_device *pdev)
>>>>>>> +{
>>>>>>> +	struct ti_lmu *lmu = dev_get_drvdata(pdev->dev.parent);
>>>>>>> +	struct lm36274 *lm36274_data;
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	lm36274_data = devm_kzalloc(&pdev->dev, sizeof(*lm36274_data),
>>>>>>> +				    GFP_KERNEL);
>>>>>>> +	if (!lm36274_data) {
>>>>>>> +		ret = -ENOMEM;
>>>>>>> +		return ret;
>>>>>>> +	}
>>>>>>
>>>>>> And certainly do "return -ENOMEM" explicitly here.
>>>>>>
>>>>>
>>>>> ACK
>>>>>
>>>>>> Acked-by: Pavel Machek <pavel@ucw.cz>
>>>>
>>>> I've done all amendments requested by Pavel and updated branch
>>>> ib-leds-mfd-regulator on linux-leds.git, but in the same time
>>>
>>> What do you mean by updated?  You cannot update an 'ib' (immutable
>>> branch).  Immutable means that it cannot change, by definition.
>>
>> We have already talked about that. Nobody has pulled so the branch
>> could have been safely updated.
> 
> You have no sure way to know that.  And since I have no way to know,
> or faith that you won't update it again, pulling it now/at all would
> seem like a foolish thing to do.

Sorry, but you are simply unjust. You're pretending to portray the
situation as if I have been notoriously causing merge conflicts in
linux-next which did not take place.

Just to recap what this discussion is about:

On 7 Apr 2019:

1. I sent pull request [0].
2. 45 minutes later I updated it after discovering one omission [1].
    It was rather small chance for it to be pulled as quickly as that.
    And even if it happened it wouldn't have been much harmful - we
    wouldn't have lost e.g. weeks of testing in linux-next due to that
    fact.

On 21 May 2019:

3. I sent another pull request [2] to you and REGULATOR maintainers.
    After it turned out that lack of feedback from REGULATOR maintainers
    was caused by failing to send them the exact copies of patches to
    review, I informed you about possible need for updating the branch.
    Afterwards I received a reply from you saying that you hadn't pulled
    the branch anyway. At that point I was sure that neither MFD nor
    REGULATOR tree contains the patches. And only after that I updated
    the branch.

> Until you can provide me with an assurance that you will not keep
> updating/changing the supposedly immutable pull-requests you send out,
> I won't be pulling any more in.

I can just uphold the assurance which is implicitly assumed for anyone
who has never broken acclaimed rules. As justified above.

[0] https://lore.kernel.org/patchwork/patch/1059075/
[1] https://lore.kernel.org/patchwork/patch/1059080/
[2] https://lore.kernel.org/patchwork/patch/1077066/
-- 
Best regards,
Jacek Anaszewski
