Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 252E331666
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2019 23:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbfEaVHU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 31 May 2019 17:07:20 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44540 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727196AbfEaVHU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 31 May 2019 17:07:20 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4VL7DbR108552;
        Fri, 31 May 2019 16:07:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559336833;
        bh=kUuiyLNO9I7AX8rnyIlR6E0SbWaESymz+6qSpyhOkzQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=zDxr9MwXWjuG8jRobkaS70rVQmNov+QE6CtHnoeW+aaEV60YFj3Z8VgC3hV4sJsed
         SZ7mFXTk7HApsghjv3ogjfIZFJWheZOTvZyhipkrIG8QsKJ63PZbDVUDFh5AEtexq5
         1HeoyqoTGYOzVlqrgRzZETvflktH7Bj8HsLMLnho=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4VL7DoW117869
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 31 May 2019 16:07:13 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 31
 May 2019 16:07:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 31 May 2019 16:07:12 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4VL7Cmf124175;
        Fri, 31 May 2019 16:07:12 -0500
Subject: Re: [RESEND PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274 LED
 driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
CC:     Pavel Machek <pavel@ucw.cz>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-7-dmurphy@ti.com> <20190523125012.GB20354@amd>
 <0c2bd6af-92c5-2458-dc41-1ea413545347@ti.com>
 <89a80aa8-66ee-d0ec-fa54-c55ca8de06af@gmail.com> <20190529135821.GK4574@dell>
 <afff7c24-bb68-e9dc-295e-4449f9729cc9@gmail.com> <20190530073827.GL4574@dell>
 <c75025f5-a984-78fa-2737-d10027e5741c@gmail.com> <20190531062312.GP4574@dell>
 <8b4cfc12-284d-6daf-c82d-4c8e487cc203@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <ec1066ec-c68b-c1ee-dd70-6be7f71924eb@ti.com>
Date:   Fri, 31 May 2019 16:07:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8b4cfc12-284d-6daf-c82d-4c8e487cc203@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 5/31/19 2:44 PM, Jacek Anaszewski wrote:
> On 5/31/19 8:23 AM, Lee Jones wrote:
>> On Thu, 30 May 2019, Jacek Anaszewski wrote:
>>
>>> On 5/30/19 9:38 AM, Lee Jones wrote:
>>>> On Wed, 29 May 2019, Jacek Anaszewski wrote:
>>>>
>>>>> On 5/29/19 3:58 PM, Lee Jones wrote:
>>>>>> On Fri, 24 May 2019, Jacek Anaszewski wrote:
>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 5/23/19 9:09 PM, Dan Murphy wrote:
>>>>>>>> Pavel
>>>>>>>>
>>>>>>>> Thanks for the review
>>>>>>>>
>>>>>>>> On 5/23/19 7:50 AM, Pavel Machek wrote:
>>>>>>>>> Hi!
>>>>>>>>>
>>>>>>>>>> +++ b/drivers/leds/leds-lm36274.c
>>>>>>>>>
>>>>>>>>>> +static int lm36274_parse_dt(struct lm36274 *lm36274_data)
>>>>>>>>>> +{
>>>>>>>>>> +    struct fwnode_handle *child = NULL;
>>>>>>>>>> +    char label[LED_MAX_NAME_SIZE];
>>>>>>>>>> +    struct device *dev = &lm36274_data->pdev->dev;
>>>>>>>>>> +    const char *name;
>>>>>>>>>> +    int child_cnt;
>>>>>>>>>> +    int ret = -EINVAL;
>>>>>>>>>> +
>>>>>>>>>> +    /* There should only be 1 node */
>>>>>>>>>> +    child_cnt = device_get_child_node_count(dev);
>>>>>>>>>> +    if (child_cnt != 1)
>>>>>>>>>> +        return ret;
>>>>>>>>>
>>>>>>>>> I'd do explicit "return -EINVAL" here.
>>>>>>>>>
>>>>>>>>
>>>>>>>> ACK
>>>>>>>>
>>>>>>>>>> +static int lm36274_probe(struct platform_device *pdev)
>>>>>>>>>> +{
>>>>>>>>>> +    struct ti_lmu *lmu = dev_get_drvdata(pdev->dev.parent);
>>>>>>>>>> +    struct lm36274 *lm36274_data;
>>>>>>>>>> +    int ret;
>>>>>>>>>> +
>>>>>>>>>> +    lm36274_data = devm_kzalloc(&pdev->dev, 
>>>>>>>>>> sizeof(*lm36274_data),
>>>>>>>>>> +                    GFP_KERNEL);
>>>>>>>>>> +    if (!lm36274_data) {
>>>>>>>>>> +        ret = -ENOMEM;
>>>>>>>>>> +        return ret;
>>>>>>>>>> +    }
>>>>>>>>>
>>>>>>>>> And certainly do "return -ENOMEM" explicitly here.
>>>>>>>>>
>>>>>>>>
>>>>>>>> ACK
>>>>>>>>
>>>>>>>>> Acked-by: Pavel Machek <pavel@ucw.cz>
>>>>>>>
>>>>>>> I've done all amendments requested by Pavel and updated branch
>>>>>>> ib-leds-mfd-regulator on linux-leds.git, but in the same time
>>>>>>
>>>>>> What do you mean by updated?  You cannot update an 'ib' (immutable
>>>>>> branch).  Immutable means that it cannot change, by definition.
>>>>>
>>>>> We have already talked about that. Nobody has pulled so the branch
>>>>> could have been safely updated.
>>>>
>>>> You have no sure way to know that.  And since I have no way to know,
>>>> or faith that you won't update it again, pulling it now/at all would
>>>> seem like a foolish thing to do.
>>>
>>> Sorry, but you are simply unjust. You're pretending to portray the
>>> situation as if I have been notoriously causing merge conflicts in
>>> linux-next which did not take place.
>>>
>>> Just to recap what this discussion is about:
>>>
>>> On 7 Apr 2019:
>>>
>>> 1. I sent pull request [0].
>>> 2. 45 minutes later I updated it after discovering one omission [1].
>>>     It was rather small chance for it to be pulled as quickly as that.
>>>     And even if it happened it wouldn't have been much harmful - we
>>>     wouldn't have lost e.g. weeks of testing in linux-next due to that
>>>     fact.
>>>
>>> On 21 May 2019:
>>>
>>> 3. I sent another pull request [2] to you and REGULATOR maintainers.
>>>     After it turned out that lack of feedback from REGULATOR 
>>> maintainers
>>>     was caused by failing to send them the exact copies of patches to
>>>     review, I informed you about possible need for updating the branch.
>>>     Afterwards I received a reply from you saying that you hadn't 
>>> pulled
>>>     the branch anyway. At that point I was sure that neither MFD nor
>>>     REGULATOR tree contains the patches. And only after that I updated
>>>     the branch.
>>
>> Here are 2 examples where you have changed immutable branches, which
>> is 100% of the Pull Requests I have received from you.  Using that
>> record as a benchmark, the situation hardly seems unjust.
>>
>>>> Until you can provide me with an assurance that you will not keep
>>>> updating/changing the supposedly immutable pull-requests you send out,
>>>> I won't be pulling any more in.
>>>
>>> I can just uphold the assurance which is implicitly assumed for anyone
>>> who has never broken acclaimed rules. As justified above.
>>
>> You have broken the rules every (100% of the) time.
>
> Yes, I admit, I would lose in court.
>
>>> [0] https://lore.kernel.org/patchwork/patch/1059075/
>>> [1] https://lore.kernel.org/patchwork/patch/1059080/
>>> [2] https://lore.kernel.org/patchwork/patch/1077066/
>>
>> So we have 2 choices moving forward; you can either provide me with
>> assurance that you have learned from this experience and will never
>> change an *immutable* branch again, or I can continue to handle them,
>> which has been the preference for some years.
>>
>> If you choose the former and adaptions need to be made in the future,
>> the correct thing to do is create a *new*, different pull-request
>> which has its own *new*, different tag, but uses the original tag as a
>> base.
>
> I choose the former. That being said:
>
> Hereby I solemnly declare never ever change an immutable branch again.
>
So how do I proceed with the requested change by Mark B on the LM36274 
driver.

Do I add a patch on top?

Or do I submit a patch to the regulator tree once the PR is pulled?

Dan

