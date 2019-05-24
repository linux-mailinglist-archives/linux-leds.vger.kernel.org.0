Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE4B2A020
	for <lists+linux-leds@lfdr.de>; Fri, 24 May 2019 22:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391667AbfEXUvO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 May 2019 16:51:14 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52280 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389242AbfEXUvO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 May 2019 16:51:14 -0400
Received: by mail-wm1-f67.google.com with SMTP id y3so10641220wmm.2;
        Fri, 24 May 2019 13:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bPw4eeQMLnyhDknfeCO+DcdhVdRhY9BK2qfVRz0v1v8=;
        b=hRMqCokeKZrylB/Y723YgYyZWRNs8gxaTrshNbPX1JO5GZ1vqhF4ViS6Y8Ak5UijQP
         TkOw/sKCfL04u/Opfs9TatZzDZ0utImfpnShKv+9E8JuwaPau+Yokr2G+In3X1GEqAJd
         XJXygN9Y+Xd5KtwDI9lL8hYqMI25WWloiJNpnTQRU2jl5xMcHBdNIUp0uLeWogcs3hrk
         h99i5yyAVGkLT8tZ/mU0L04MdDRTpkcHh2V+w8nDYQEs4D0ZZIRu7vaXWCYx7anMT7w4
         NPMByo0C8k8RQluwXGVLUS/OjiE1iFsppwe0bDSJTz6z8PfmxemZZkpPN9hOORSd8NfI
         xfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bPw4eeQMLnyhDknfeCO+DcdhVdRhY9BK2qfVRz0v1v8=;
        b=bOIbCteQT+CLtz9ZDXKLI2kxxVJbh6XJj8DKyt1MqwXe6+Ic0q5dKRvRGNUundEoiM
         EhqjIDQSjhCmQ94HhtB9abs/2cVFulY/AFcrPETzvKi6CZxFcX5PaZHdaGKyTksTI+dj
         nQorPjdaj7zap+N7TQa4pYVJM4yYBZaM8bR3ENYB/C5k6GTidimm7TFNTv6FxVSCnRvO
         XPUz1aXGs2wkfTm+caGQTtxWXCLIR312gMmxUX2/yriZYkHP9znodKlcRUMX7GmQypg2
         9TO8IUIJyOwxDk35O4qeLkfWkQiOAnwMJ2s25jvHI+rhq7FdcQEBNuks5DFOzM+I+G6I
         mf4A==
X-Gm-Message-State: APjAAAWkZ9dqjup5yEAQSmvvZyn74VMdsA4TOFVRU/lyqFqGjTSlOuwO
        a0RnbbLnsylVuq27KKPeWrVKg1uj
X-Google-Smtp-Source: APXvYqy4UBXRnjUOd8AfyUvLQQNv70IpVyzxQJnY28PMTR9VXcbYtbNpRtNhtNdavRWACJLskd3yPw==
X-Received: by 2002:a7b:cb8b:: with SMTP id m11mr1150403wmi.158.1558731072014;
        Fri, 24 May 2019 13:51:12 -0700 (PDT)
Received: from [192.168.1.17] (bkq212.neoplus.adsl.tpnet.pl. [83.28.184.212])
        by smtp.gmail.com with ESMTPSA id m206sm4631499wmf.21.2019.05.24.13.51.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 13:51:11 -0700 (PDT)
Subject: Re: [RESEND PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274 LED
 driver
To:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>
Cc:     broonie@kernel.org, lgirdwood@gmail.com, lee.jones@linaro.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-7-dmurphy@ti.com> <20190523125012.GB20354@amd>
 <0c2bd6af-92c5-2458-dc41-1ea413545347@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <89a80aa8-66ee-d0ec-fa54-c55ca8de06af@gmail.com>
Date:   Fri, 24 May 2019 22:51:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0c2bd6af-92c5-2458-dc41-1ea413545347@ti.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 5/23/19 9:09 PM, Dan Murphy wrote:
> Pavel
> 
> Thanks for the review
> 
> On 5/23/19 7:50 AM, Pavel Machek wrote:
>> Hi!
>>
>>> +++ b/drivers/leds/leds-lm36274.c
>>
>>> +static int lm36274_parse_dt(struct lm36274 *lm36274_data)
>>> +{
>>> +	struct fwnode_handle *child = NULL;
>>> +	char label[LED_MAX_NAME_SIZE];
>>> +	struct device *dev = &lm36274_data->pdev->dev;
>>> +	const char *name;
>>> +	int child_cnt;
>>> +	int ret = -EINVAL;
>>> +
>>> +	/* There should only be 1 node */
>>> +	child_cnt = device_get_child_node_count(dev);
>>> +	if (child_cnt != 1)
>>> +		return ret;
>>
>> I'd do explicit "return -EINVAL" here.
>>
> 
> ACK
> 
>>> +static int lm36274_probe(struct platform_device *pdev)
>>> +{
>>> +	struct ti_lmu *lmu = dev_get_drvdata(pdev->dev.parent);
>>> +	struct lm36274 *lm36274_data;
>>> +	int ret;
>>> +
>>> +	lm36274_data = devm_kzalloc(&pdev->dev, sizeof(*lm36274_data),
>>> +				    GFP_KERNEL);
>>> +	if (!lm36274_data) {
>>> +		ret = -ENOMEM;
>>> +		return ret;
>>> +	}
>>
>> And certainly do "return -ENOMEM" explicitly here.
>>
> 
> ACK
> 
>> Acked-by: Pavel Machek <pavel@ucw.cz>

I've done all amendments requested by Pavel and updated branch
ib-leds-mfd-regulator on linux-leds.git, but in the same time
dropped the merge from the for-next.

We will proceed further once we clarify the issue of cross-merging
recently raised again by Linus.

-- 
Best regards,
Jacek Anaszewski
