Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B977EFC6B8
	for <lists+linux-leds@lfdr.de>; Thu, 14 Nov 2019 13:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfKNM5c (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 14 Nov 2019 07:57:32 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43724 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfKNM5b (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Nov 2019 07:57:31 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAECvP7i126944;
        Thu, 14 Nov 2019 06:57:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573736245;
        bh=bCj1LDwNUVKQlXqlbNZOR3TzhAvoi+DmugM5a3M9x+w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=RRjFSq/J+GPSPvRKrdSEwBgCRZ+4YkdqV1HzSCISWQ9Buhre7RiK7FXbU4rAGaFzD
         ibvb0jHIYkrksY/f4R/hLmmOIBm8R/txwQz1wwi7UcbWGG8GaQPlLRXY3BA2bmFLOG
         4F4wg6Anb0tppT1c7yTj1ekVAvSlJHeD+R2emYPc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAECvOpq099907
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 14 Nov 2019 06:57:24 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 06:57:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 06:57:24 -0600
Received: from [10.250.33.226] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAECvOYu106064;
        Thu, 14 Nov 2019 06:57:24 -0600
Subject: Re: [PATCH v16 04/19] leds: multicolor: Introduce a multicolor class
 definition
To:     Martin Fuzzey <martin.fuzzey@flowbird.group>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191104123707.31930-1-dmurphy@ti.com>
 <20191104123707.31930-5-dmurphy@ti.com>
 <a7f18f3b-c1fb-3810-8d9b-30ecdada96ff@flowbird.group>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f4c891b6-3ce7-c3d7-447a-7633b96face1@ti.com>
Date:   Thu, 14 Nov 2019 06:56:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a7f18f3b-c1fb-3810-8d9b-30ecdada96ff@flowbird.group>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Martin

On 11/14/19 5:24 AM, Martin Fuzzey wrote:
> Hi Dan,
>
> On 04/11/2019 13:36, Dan Murphy wrote:
>> +int devm_led_classdev_multicolor_register_ext(struct device *parent,
>> +                         struct led_classdev_mc *mcled_cdev,
>> +                          struct led_init_data *init_data)
>> +{
>> +    struct led_classdev_mc **dr;
>> +    int ret;
>> +
>> +    dr = devres_alloc(devm_led_classdev_multicolor_release,
>> +              sizeof(*dr), GFP_KERNEL);
>> +    if (!dr)
>> +        return -ENOMEM;
>> +
>> +    ret = led_classdev_multicolor_register(parent, mcled_cdev);
>
>
> This drops init_data, should be led_classdev_multicolor_register_ex
>
Thanks for the issue I will fix and send v17

Dan


