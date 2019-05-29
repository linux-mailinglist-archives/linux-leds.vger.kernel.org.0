Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5C242E67C
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2019 22:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfE2Uuh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 May 2019 16:50:37 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42532 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfE2Uuh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 May 2019 16:50:37 -0400
Received: by mail-wr1-f68.google.com with SMTP id l2so2679538wrb.9;
        Wed, 29 May 2019 13:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d4v803W3iRNokPv5sd2XzUsg8MqDL2Npddj+OWo1Htg=;
        b=L9ZB1uwVwzXLp4Qr3qg10/SU2ffngXvjbqfjC+IVG2Dht/FcriW8/6wcgCjebddcrA
         W19dzdLtYcJNep8f/Rem2We8MYwX46pSwynRVmVx1F99XUAR4EdC6hlDQSGZVyWP6BVY
         OVxB+50M19r+D8tBjNY4iOoBPUA2sK8sERdRGz8GrFag5QL6sxPEscbxIptVqYUvv8/a
         cPmAftOrcCZwRRTCJedyGFVJ9W3BlGYQucTsv2PjsV2m9p2WbxBXJ5R+7RrW4RMOHYLA
         z1yFl/NACczHgyCoWA2ktqIvOIv/vS3BYpZQBfZWBpLoF2J0eqcUMUO19CkuD2pklnTY
         lODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d4v803W3iRNokPv5sd2XzUsg8MqDL2Npddj+OWo1Htg=;
        b=Bg5Nq9+/bI3VXFeOzLxNnHED0h76orRiUlNQ/ZX5cmJ+0gFOy3+wBJe+G2kW3kkoz5
         XelYUH1suEYin28K6zaaAsfMXq12J5uAa3V4BptM1D18GN1QT9n8mOmXdcu4a5UO0a3Z
         7PDpiUgxUgcIckEAM/PhJEn/k5vqYc4tm6JTXiUWyeSk9iNdNc4cE1rpDivvkrsUcXiB
         VzFdNbTYXZhpw2MDEn80DjuGrcmYbRmuPYNhBLuWQTWhbLjVzt1rPECfl+r+KbDFjD3z
         O804D+fSSDmxg1Oz4tQ+bVw5gp3QCJ3ZKxbFfIlaI4NFTTTms0vK+5Evx1Vh6WJUOGN0
         fDFQ==
X-Gm-Message-State: APjAAAVYEu81Ejp+Bt+IdRENAXkPkM3BmpYXBqdMfH333Vtv2OLZctLU
        fM/eQNAzsqbzNZyZg2n/iUxb3phK
X-Google-Smtp-Source: APXvYqwOxbjRXyFH5FwZAUo2iGp9PIz8rfTkAJosre1konRK/mwyI/+Fr5Qjz8sMpRm7USutWDhF4Q==
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr12722wrs.291.1559163035249;
        Wed, 29 May 2019 13:50:35 -0700 (PDT)
Received: from [192.168.1.17] (cjl105.neoplus.adsl.tpnet.pl. [83.31.61.105])
        by smtp.gmail.com with ESMTPSA id y1sm436816wma.14.2019.05.29.13.50.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 13:50:34 -0700 (PDT)
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
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <afff7c24-bb68-e9dc-295e-4449f9729cc9@gmail.com>
Date:   Wed, 29 May 2019 22:50:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190529135821.GK4574@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/29/19 3:58 PM, Lee Jones wrote:
> On Fri, 24 May 2019, Jacek Anaszewski wrote:
> 
>> Hi,
>>
>> On 5/23/19 9:09 PM, Dan Murphy wrote:
>>> Pavel
>>>
>>> Thanks for the review
>>>
>>> On 5/23/19 7:50 AM, Pavel Machek wrote:
>>>> Hi!
>>>>
>>>>> +++ b/drivers/leds/leds-lm36274.c
>>>>
>>>>> +static int lm36274_parse_dt(struct lm36274 *lm36274_data)
>>>>> +{
>>>>> +	struct fwnode_handle *child = NULL;
>>>>> +	char label[LED_MAX_NAME_SIZE];
>>>>> +	struct device *dev = &lm36274_data->pdev->dev;
>>>>> +	const char *name;
>>>>> +	int child_cnt;
>>>>> +	int ret = -EINVAL;
>>>>> +
>>>>> +	/* There should only be 1 node */
>>>>> +	child_cnt = device_get_child_node_count(dev);
>>>>> +	if (child_cnt != 1)
>>>>> +		return ret;
>>>>
>>>> I'd do explicit "return -EINVAL" here.
>>>>
>>>
>>> ACK
>>>
>>>>> +static int lm36274_probe(struct platform_device *pdev)
>>>>> +{
>>>>> +	struct ti_lmu *lmu = dev_get_drvdata(pdev->dev.parent);
>>>>> +	struct lm36274 *lm36274_data;
>>>>> +	int ret;
>>>>> +
>>>>> +	lm36274_data = devm_kzalloc(&pdev->dev, sizeof(*lm36274_data),
>>>>> +				    GFP_KERNEL);
>>>>> +	if (!lm36274_data) {
>>>>> +		ret = -ENOMEM;
>>>>> +		return ret;
>>>>> +	}
>>>>
>>>> And certainly do "return -ENOMEM" explicitly here.
>>>>
>>>
>>> ACK
>>>
>>>> Acked-by: Pavel Machek <pavel@ucw.cz>
>>
>> I've done all amendments requested by Pavel and updated branch
>> ib-leds-mfd-regulator on linux-leds.git, but in the same time
> 
> What do you mean by updated?  You cannot update an 'ib' (immutable
> branch).  Immutable means that it cannot change, by definition.

We have already talked about that. Nobody has pulled so the branch
could have been safely updated.

-- 
Best regards,
Jacek Anaszewski
