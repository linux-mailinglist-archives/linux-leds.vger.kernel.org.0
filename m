Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA6828A2C
	for <lists+linux-leds@lfdr.de>; Thu, 23 May 2019 21:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387712AbfEWTKK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 May 2019 15:10:10 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40172 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387704AbfEWTKK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 May 2019 15:10:10 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4NJA6Nk028160;
        Thu, 23 May 2019 14:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558638606;
        bh=bJbg1A/txouFJSm6HDuK7A27QEfGpODsy5IJMrZQuaU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jTerZ5K9nLu0AxG9WFvwpQY4AaaG0eDboGnkSqJJf2u+ZiNrG+rCg5u8xMvyFw7o7
         it6zQ3fBe50bN1Ew667cTEde6JHbsreD69XqWg8ZZrrCqhpOE3gA6HNfJtIbAPNU68
         Wfw++lFhaqYj8gO6GE9N5CYJMpWjVfYgE5J3Aibs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4NJA60F005401
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 May 2019 14:10:06 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 23
 May 2019 14:10:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 23 May 2019 14:10:05 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4NJA55D024840;
        Thu, 23 May 2019 14:10:05 -0500
Subject: Re: [RESEND PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274 LED
 driver
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <lee.jones@linaro.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-7-dmurphy@ti.com> <20190523125012.GB20354@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <0c2bd6af-92c5-2458-dc41-1ea413545347@ti.com>
Date:   Thu, 23 May 2019 14:09:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523125012.GB20354@amd>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

Thanks for the review

On 5/23/19 7:50 AM, Pavel Machek wrote:
> Hi!
> 
>> +++ b/drivers/leds/leds-lm36274.c
> 
>> +static int lm36274_parse_dt(struct lm36274 *lm36274_data)
>> +{
>> +	struct fwnode_handle *child = NULL;
>> +	char label[LED_MAX_NAME_SIZE];
>> +	struct device *dev = &lm36274_data->pdev->dev;
>> +	const char *name;
>> +	int child_cnt;
>> +	int ret = -EINVAL;
>> +
>> +	/* There should only be 1 node */
>> +	child_cnt = device_get_child_node_count(dev);
>> +	if (child_cnt != 1)
>> +		return ret;
> 
> I'd do explicit "return -EINVAL" here.
> 

ACK

>> +static int lm36274_probe(struct platform_device *pdev)
>> +{
>> +	struct ti_lmu *lmu = dev_get_drvdata(pdev->dev.parent);
>> +	struct lm36274 *lm36274_data;
>> +	int ret;
>> +
>> +	lm36274_data = devm_kzalloc(&pdev->dev, sizeof(*lm36274_data),
>> +				    GFP_KERNEL);
>> +	if (!lm36274_data) {
>> +		ret = -ENOMEM;
>> +		return ret;
>> +	}
> 
> And certainly do "return -ENOMEM" explicitly here.
> 

ACK

> Acked-by: Pavel Machek <pavel@ucw.cz>
> 									Pavel
> 
