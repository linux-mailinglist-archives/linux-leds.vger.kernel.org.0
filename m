Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0E33B977
	for <lists+linux-leds@lfdr.de>; Mon, 10 Jun 2019 18:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbfFJQcd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Jun 2019 12:32:33 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:53494 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbfFJQcd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Jun 2019 12:32:33 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AGWLUf047582;
        Mon, 10 Jun 2019 11:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560184341;
        bh=C5b7TIZf9lI0MNyPjijVn5SzWERMj55K+yenF+FDDNU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=qgBH3rTY4hjwUlSvhwraMsOlxDuD1T8w1X5pig+Y1F4I7JPywOQLWWYK/fiaPGImv
         WPVfub2bJccrWh5ZVSHE50FNpy0Spn0Dp0liAlPaBCeLfo9Oe1vupGeuE9ghE2kPoh
         CIl/d7WwLTOAbR5gS6Oj6bdjgI8JR4QDR+55meSE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AGWLG7093119
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 11:32:21 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 11:32:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 11:32:20 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AGWKB9009466;
        Mon, 10 Jun 2019 11:32:20 -0500
Subject: Re: [PATCH v2 2/2] Simplify LED registeration by
 devm_led_classdev_register()
To:     Pavel Machek <pavel@ucw.cz>
CC:     Oleh Kravchenko <oleg@kaa.org.ua>, <linux-leds@vger.kernel.org>
References: <20190608143039.13454-1-oleg@kaa.org.ua>
 <20190608143039.13454-2-oleg@kaa.org.ua>
 <ab1404dc-0a1f-ec23-3e3d-8eec86d24c8b@ti.com> <20190610143626.GA7475@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f07ca091-da8c-9560-b12f-015c268101c7@ti.com>
Date:   Mon, 10 Jun 2019 11:32:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610143626.GA7475@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 6/10/19 9:36 AM, Pavel Machek wrote:
> On Mon 2019-06-10 09:26:14, Dan Murphy wrote:
>> Oleh
>>
>> On 6/8/19 9:30 AM, Oleh Kravchenko wrote:
>>> Then there is no need to set np or store it.
>> Huh?  This does not really explain much about what this patch is
> doing.
>
> ledm_ variant does not need np, so it can be deleted. Sounds like a
> good cleanup to me.

I agree with the patch and the clean up just wanted a better commit log.

Dan

>
> Acked-by: Pavel Machek <pavel@ucw.cz>
>
>
>>> diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
>>> index 91deb40db307..880089ef9a9b 100644
>>> --- a/drivers/leds/leds-cr0014114.c
>>> +++ b/drivers/leds/leds-cr0014114.c
>>> @@ -183,12 +183,10 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
>>>   	size_t			i = 0;
>>>   	struct cr0014114_led	*led;
>>>   	struct fwnode_handle	*child;
>>> -	struct device_node	*np;
>>>   	int			ret;
>>>   	const char		*str;
>>>   	device_for_each_child_node(priv->dev, child) {
>>> -		np = to_of_node(child);
>>>   		led = &priv->leds[i];
>>>   		ret = fwnode_property_read_string(child, "label", &str);
>>> @@ -207,8 +205,7 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
>>>   		led->ldev.max_brightness	  = CR_MAX_BRIGHTNESS;
>>>   		led->ldev.brightness_set_blocking = cr0014114_set_sync;
>>> -		ret = devm_of_led_classdev_register(priv->dev, np,
>>> -						    &led->ldev);
>>> +		ret = devm_led_classdev_register(priv->dev, &led->ldev);
>>>   		if (ret) {
>>>   			dev_err(priv->dev,
>>>   				"failed to register LED device %s, err %d",
>>> @@ -217,8 +214,6 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
>>>   			return ret;
>>>   		}
>>> -		led->ldev.dev->of_node = np;
>>> -
>>>   		i++;
>>>   	}
