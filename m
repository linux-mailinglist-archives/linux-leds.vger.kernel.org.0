Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34C98107DA
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 14:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfEAMTF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 May 2019 08:19:05 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:58058 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbfEAMTF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 May 2019 08:19:05 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x41CInFW030028;
        Wed, 1 May 2019 07:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556713129;
        bh=9aQOi45c/EGVag76udV6doM0PRwWmZo9EP9zOsTY0/k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eLlCOI2gErzAP1SeQMBk3RLC8bHUw3IqTNbW7qY1aCEy6pK/EspZStjcFEV/8hlTj
         9MmJn6ftIpzYuNa6jhRILkZRkVrg5phmQwqRYCZyyWRtcmOMkcUYiX4r58Uv+T37Qr
         XOVNJracOfkqDKbYB/ZNLiQplBY6IzhY389B1/XY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x41CIngO040408
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 1 May 2019 07:18:49 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 1 May
 2019 07:18:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 1 May 2019 07:18:48 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x41CImd7003631;
        Wed, 1 May 2019 07:18:48 -0500
Subject: Re: [PATCH v3 3/3] backlight: lm3630a: add firmware node support
To:     Pavel Machek <pavel@ucw.cz>
CC:     Brian Masney <masneyb@onstation.org>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>,
        <robh+dt@kernel.org>, <jacek.anaszewski@gmail.com>,
        <mark.rutland@arm.com>, <b.zolnierkie@samsung.com>,
        <dri-devel@lists.freedesktop.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-fbdev@vger.kernel.org>, <jonathan@marek.ca>
References: <20190415072905.2861-1-masneyb@onstation.org>
 <20190415072905.2861-4-masneyb@onstation.org>
 <0e5e26ba-cf98-913e-8e76-e988a86dc0d1@ti.com> <20190501082627.GA2971@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <fbf41c1b-21c7-a997-f88c-3d29ccd1b42a@ti.com>
Date:   Wed, 1 May 2019 07:18:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501082627.GA2971@amd>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 5/1/19 3:26 AM, Pavel Machek wrote:
> Hi!
> 
>>> @@ -396,13 +506,20 @@ static int lm3630a_probe(struct i2c_client *client,
>>>  				     GFP_KERNEL);
>>>  		if (pdata == NULL)
>>>  			return -ENOMEM;
>>> +
>>>  		/* default values */
>>> -		pdata->leda_ctrl = LM3630A_LEDA_ENABLE;
>>> -		pdata->ledb_ctrl = LM3630A_LEDB_ENABLE;
>>> +		pdata->leda_ctrl = LM3630A_LEDA_DISABLE;
>>> +		pdata->ledb_ctrl = LM3630A_LEDB_DISABLE;
>>
>> This is not needed since default is disabled and kzalloc will set these to 0
> 
> Let compiler do this kind of optimalizations. Code makes sense as-is.
> 

Yes the code makes sense but it is unnecessary.

Dan

> 									Pavel
> 
