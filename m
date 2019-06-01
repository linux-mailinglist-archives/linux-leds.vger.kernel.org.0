Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCE2231F86
	for <lists+linux-leds@lfdr.de>; Sat,  1 Jun 2019 15:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfFANzQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 1 Jun 2019 09:55:16 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37673 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfFANzQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 1 Jun 2019 09:55:16 -0400
Received: by mail-lj1-f193.google.com with SMTP id h19so12224355ljj.4;
        Sat, 01 Jun 2019 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ghhyUr9cYMHl71+I1HZPD8o+fHL+oIFcFqyPFE7giTA=;
        b=aXYYiV2iI56O1UVDvEgLZrCOBaySg1pi/pIslcong4+pDbnkIPGBHot5jGqlbQwqcr
         rUbVXvzUxqOqYfcnsSPsrVA/HYCyddXqt7SpXfBqpkz8Sxk1YVbo33Cqj15LMEWOwgor
         J/B4Lfa/hIRdYEFf/k8QhBuiMcB8CUdW48UpFGzPbv3FgmPMqV4C9g+gBfwJWhFvnQiF
         Zuhc6ragpr50tGO5bpp3qbtpnbuYFK6UDkJFEbJmLllePbgW/CGJj8ngndBYstBXveyv
         hj8OiHkkyjovY2X7DTcQrIKptnqF4ntEYhmQxT9ZGXDtkWCk8OUXARmOtcHc1HrtbTT3
         xejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ghhyUr9cYMHl71+I1HZPD8o+fHL+oIFcFqyPFE7giTA=;
        b=hkhlDmXpSUNe6G9490kygmdH5bw9giiVo9IKS6hdbb9xX61ipjvTVW6B1nUE4iPEXN
         M45QksYqgL7gr9U0rQAo7P4fQlnMCYYtgT9ypRlG85hAKAUmPM+Z5RetwmefqLkQ38R4
         LVCxogMA909CZQDzbokFUARznQKsv3pI1qgpAOg1RqjfpL0WT32gQ3yZu+KDUNNgGsg3
         sg+7rfCLVoTqqhrJBrXi2HHblaxBxNG7asZyWqCMlrh7z0i8b+WJcImOBiKl+rB+1LhZ
         daZk5GXML0RnscXFJVwrEL4PUOtJ6n2O2mMQvZewVZX01CuzZZuYeVpZyaTebZV1AoBQ
         j8Jg==
X-Gm-Message-State: APjAAAUZdl5Lrbzg91Igyb6dQLs7fDtOACxK4RTEBU7xbhosALNhmh+3
        fhGlseQKF+Bhx0Dwk7HZ3/oCsrHx
X-Google-Smtp-Source: APXvYqzIC/VvocFMLafY8qEwjTfIucWcqiD8D4PbdbaDtUVBZ7SE/1b7m8NNUFQgygI/xVnnkr0qWw==
X-Received: by 2002:a2e:2b11:: with SMTP id q17mr9061790lje.23.1559397313193;
        Sat, 01 Jun 2019 06:55:13 -0700 (PDT)
Received: from [192.168.1.17] (bks10.neoplus.adsl.tpnet.pl. [83.28.186.10])
        by smtp.gmail.com with ESMTPSA id c17sm1801103lfi.93.2019.06.01.06.55.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jun 2019 06:55:12 -0700 (PDT)
Subject: Re: [RESEND PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274 LED
 driver
To:     Dan Murphy <dmurphy@ti.com>, Lee Jones <lee.jones@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, broonie@kernel.org,
        lgirdwood@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-7-dmurphy@ti.com> <20190523125012.GB20354@amd>
 <0c2bd6af-92c5-2458-dc41-1ea413545347@ti.com>
 <89a80aa8-66ee-d0ec-fa54-c55ca8de06af@gmail.com> <20190529135821.GK4574@dell>
 <afff7c24-bb68-e9dc-295e-4449f9729cc9@gmail.com> <20190530073827.GL4574@dell>
 <c75025f5-a984-78fa-2737-d10027e5741c@gmail.com> <20190531062312.GP4574@dell>
 <8b4cfc12-284d-6daf-c82d-4c8e487cc203@gmail.com>
 <ec1066ec-c68b-c1ee-dd70-6be7f71924eb@ti.com>
 <c21fa7c4-3b3c-f35d-348c-311469496d9d@gmail.com>
 <37baf1d4-388f-e87d-df42-9d2713f4b799@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <417ffc8a-e88c-0ad0-7802-da570c6c4f3f@gmail.com>
Date:   Sat, 1 Jun 2019 15:55:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <37baf1d4-388f-e87d-df42-9d2713f4b799@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 6/1/19 12:41 AM, Dan Murphy wrote:
> Jacek
> 
> On 5/31/19 4:57 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 5/31/19 11:07 PM, Dan Murphy wrote:
>>> Hello
>>>
>>> On 5/31/19 2:44 PM, Jacek Anaszewski wrote:
>>>> On 5/31/19 8:23 AM, Lee Jones wrote:
>>>>> On Thu, 30 May 2019, Jacek Anaszewski wrote:
>>>>>
>>>>>> On 5/30/19 9:38 AM, Lee Jones wrote:
>>>>>>> On Wed, 29 May 2019, Jacek Anaszewski wrote:
>>>>>>>
>>>>>>>> On 5/29/19 3:58 PM, Lee Jones wrote:
>>>>>>>>> On Fri, 24 May 2019, Jacek Anaszewski wrote:
>>>>>>>>>
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> On 5/23/19 9:09 PM, Dan Murphy wrote:
>>>>>>>>>>> Pavel
>>>>>>>>>>>
>>>>>>>>>>> Thanks for the review
>>>>>>>>>>>
>>>>>>>>>>> On 5/23/19 7:50 AM, Pavel Machek wrote:
>>>>>>>>>>>> Hi!
>>>>>>>>>>>>
>>>>>>>>>>>>> +++ b/drivers/leds/leds-lm36274.c
>>>>>>>>>>>>
>>>>>>>>>>>>> +static int lm36274_parse_dt(struct lm36274 *lm36274_data)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    struct fwnode_handle *child = NULL;
>>>>>>>>>>>>> +    char label[LED_MAX_NAME_SIZE];
>>>>>>>>>>>>> +    struct device *dev = &lm36274_data->pdev->dev;
>>>>>>>>>>>>> +    const char *name;
>>>>>>>>>>>>> +    int child_cnt;
>>>>>>>>>>>>> +    int ret = -EINVAL;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    /* There should only be 1 node */
>>>>>>>>>>>>> +    child_cnt = device_get_child_node_count(dev);
>>>>>>>>>>>>> +    if (child_cnt != 1)
>>>>>>>>>>>>> +        return ret;
>>>>>>>>>>>>
>>>>>>>>>>>> I'd do explicit "return -EINVAL" here.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> ACK
>>>>>>>>>>>
>>>>>>>>>>>>> +static int lm36274_probe(struct platform_device *pdev)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    struct ti_lmu *lmu = dev_get_drvdata(pdev->dev.parent);
>>>>>>>>>>>>> +    struct lm36274 *lm36274_data;
>>>>>>>>>>>>> +    int ret;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    lm36274_data = devm_kzalloc(&pdev->dev, 
>>>>>>>>>>>>> sizeof(*lm36274_data),
>>>>>>>>>>>>> +                    GFP_KERNEL);
>>>>>>>>>>>>> +    if (!lm36274_data) {
>>>>>>>>>>>>> +        ret = -ENOMEM;
>>>>>>>>>>>>> +        return ret;
>>>>>>>>>>>>> +    }
>>>>>>>>>>>>
>>>>>>>>>>>> And certainly do "return -ENOMEM" explicitly here.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> ACK
>>>>>>>>>>>
>>>>>>>>>>>> Acked-by: Pavel Machek <pavel@ucw.cz>
>>>>>>>>>>
>>>>>>>>>> I've done all amendments requested by Pavel and updated branch
>>>>>>>>>> ib-leds-mfd-regulator on linux-leds.git, but in the same time
>>>>>>>>>
>>>>>>>>> What do you mean by updated?  You cannot update an 'ib' (immutable
>>>>>>>>> branch).  Immutable means that it cannot change, by definition.
>>>>>>>>
>>>>>>>> We have already talked about that. Nobody has pulled so the branch
>>>>>>>> could have been safely updated.
>>>>>>>
>>>>>>> You have no sure way to know that.  And since I have no way to know,
>>>>>>> or faith that you won't update it again, pulling it now/at all would
>>>>>>> seem like a foolish thing to do.
>>>>>>
>>>>>> Sorry, but you are simply unjust. You're pretending to portray the
>>>>>> situation as if I have been notoriously causing merge conflicts in
>>>>>> linux-next which did not take place.
>>>>>>
>>>>>> Just to recap what this discussion is about:
>>>>>>
>>>>>> On 7 Apr 2019:
>>>>>>
>>>>>> 1. I sent pull request [0].
>>>>>> 2. 45 minutes later I updated it after discovering one omission [1].
>>>>>>     It was rather small chance for it to be pulled as quickly as 
>>>>>> that.
>>>>>>     And even if it happened it wouldn't have been much harmful - we
>>>>>>     wouldn't have lost e.g. weeks of testing in linux-next due to 
>>>>>> that
>>>>>>     fact.
>>>>>>
>>>>>> On 21 May 2019:
>>>>>>
>>>>>> 3. I sent another pull request [2] to you and REGULATOR maintainers.
>>>>>>     After it turned out that lack of feedback from REGULATOR 
>>>>>> maintainers
>>>>>>     was caused by failing to send them the exact copies of patches to
>>>>>>     review, I informed you about possible need for updating the 
>>>>>> branch.
>>>>>>     Afterwards I received a reply from you saying that you hadn't 
>>>>>> pulled
>>>>>>     the branch anyway. At that point I was sure that neither MFD nor
>>>>>>     REGULATOR tree contains the patches. And only after that I 
>>>>>> updated
>>>>>>     the branch.
>>>>>
>>>>> Here are 2 examples where you have changed immutable branches, which
>>>>> is 100% of the Pull Requests I have received from you. Using that
>>>>> record as a benchmark, the situation hardly seems unjust.
>>>>>
>>>>>>> Until you can provide me with an assurance that you will not keep
>>>>>>> updating/changing the supposedly immutable pull-requests you send 
>>>>>>> out,
>>>>>>> I won't be pulling any more in.
>>>>>>
>>>>>> I can just uphold the assurance which is implicitly assumed for 
>>>>>> anyone
>>>>>> who has never broken acclaimed rules. As justified above.
>>>>>
>>>>> You have broken the rules every (100% of the) time.
>>>>
>>>> Yes, I admit, I would lose in court.
>>>>
>>>>>> [0] https://lore.kernel.org/patchwork/patch/1059075/
>>>>>> [1] https://lore.kernel.org/patchwork/patch/1059080/
>>>>>> [2] https://lore.kernel.org/patchwork/patch/1077066/
>>>>>
>>>>> So we have 2 choices moving forward; you can either provide me with
>>>>> assurance that you have learned from this experience and will never
>>>>> change an *immutable* branch again, or I can continue to handle them,
>>>>> which has been the preference for some years.
>>>>>
>>>>> If you choose the former and adaptions need to be made in the future,
>>>>> the correct thing to do is create a *new*, different pull-request
>>>>> which has its own *new*, different tag, but uses the original tag as a
>>>>> base.
>>>>
>>>> I choose the former. That being said:
>>>>
>>>> Hereby I solemnly declare never ever change an immutable branch again.
>>>>
>>> So how do I proceed with the requested change by Mark B on the 
>>> LM36274 driver.
>>>
>>> Do I add a patch on top?
>>>
>>> Or do I submit a patch to the regulator tree once the PR is pulled?
>>
>> Won't the change be a dependency for [PATCH v4 1/6] ?
>>
> Yes thats why I am asking as we would need to change the branch.

I will need to send another pull request anyway - I haven't created
new one after updating the branch so far, so for now we are free
to change it.

-- 
Best regards,
Jacek Anaszewski
