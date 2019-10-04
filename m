Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28EF0CB7FE
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 12:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbfJDKMm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 06:12:42 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59562 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbfJDKMm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 06:12:42 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94ACQmo109113;
        Fri, 4 Oct 2019 05:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570183946;
        bh=c3zkR74xsAFswSP7dMpMX60k0Qrn8EeINoag7SKD4dU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BT7Isw0UTPLb/7GgIZs0OD4IsoxdnUVrlcUKN+NUsK272elLQvEoPKIyIrnJHc/4X
         kyjHClQnj/RQgIJefBB2l49gBxuClpW1Zz+q08f9ibGWXuhiZmFsbkTfyCe5Ic0vqP
         +VxcuVOJf0Z8aCMxKH0IgjdSP9A8CbnPUozQMSTI=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94ACQCb116498;
        Fri, 4 Oct 2019 05:12:26 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 05:12:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 05:12:25 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94ACMPE100107;
        Fri, 4 Oct 2019 05:12:23 -0500
Subject: Re: Should regulator core support parsing OF based fwnode?
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Mark Brown <broonie@kernel.org>
CC:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        <pavel@ucw.cz>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <lee.jones@linaro.org>, <daniel.thompson@linaro.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, <dmurphy@ti.com>,
        <linux-leds@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
 <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
 <20191003183554.GA37096@sirena.co.uk>
 <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
 <20191003194140.GE6090@sirena.co.uk>
 <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <58f32544-89ba-6a72-2491-82307a71df05@ti.com>
Date:   Fri, 4 Oct 2019 12:12:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 03/10/2019 22:27, Jacek Anaszewski wrote:
> On 10/3/19 9:41 PM, Mark Brown wrote:
>> On Thu, Oct 03, 2019 at 09:21:06PM +0200, Jacek Anaszewski wrote:
>>> On 10/3/19 8:35 PM, Mark Brown wrote:
>>>> On Thu, Oct 03, 2019 at 07:43:17PM +0200, Jacek Anaszewski wrote:
>>>>> On 10/3/19 2:47 PM, Jean-Jacques Hiblot wrote:
>>>>>> On 03/10/2019 12:42, Sebastian Reichel wrote:
>>>>>>> On Thu, Oct 03, 2019 at 10:28:09AM +0200, Jean-Jacques Hiblot wrote:
>>>> This mail has nothing relevant in the subject line and pages of quotes
>>>> before the question for me, it's kind of lucky I noticed it....
>>> Isn't it all about creating proper filters?
>> My point there is that there's nothing obvious in the mail that suggests
>> it should get past filters - just being CCed on a mail isn't super
>> reliable, people often get pulled in due to things like checkpatch or
>> someone copying a CC list from an earlier patch series where there were
>> things were relevant.
> OK, updated the subject.
>
>>>>> I wonder if it wouldn't make sense to add support for fwnode
>>>>> parsing to regulator core. Or maybe it is either somehow supported
>>>>> or not supported on purpose?
>>>> Anything attempting to use the regulator DT bindings in ACPI has very
>>>> serious problems, ACPI has its own power model which isn't compatible
>>>> with that used in DT.
>>> We have a means for checking if fwnode refers to of_node:
>>> is_of_node(const struct fwnode_handle *fwnode)
>>> Couldn't it be employed for OF case?
>> Why would we want to do that?  We'd continue to support only DT systems,
>> just with code that's less obviously DT only and would need to put
>> checks in.  I'm not seeing an upside here.
> For instance few weeks ago we had a patch [0] in the LED core switching
> from using struct device's of_node property to fwnode for conveying
> device property data. And this transition to fwnode property API can be
> observed as a frequent pattern across subsystems.
>
> Recently there is an ongoing effort aiming to add generic support for
> handling regulators in the LED core [1], but it turns out to require
> bringing back initialization of of_node property for
> devm_regulator_get_optional() to work properly.
>
> Support for OF related fwnodes in regulator core could help reducing
> this noise.

We could have this done in dev_of_node():

static inline struct device_node *dev_of_node(struct device *dev)
{
     if (!IS_ENABLED(CONFIG_OF) || !dev)
         return NULL;
     return dev->of_node ? dev->of_node : to_of_node(dev->fwnode);
}

Then it will only be a matter of using dev_of_node() instead of 
accessing directly dev->of_node


>
> [0]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/leds/led-class.c?id=fd81d7e946c6bdb86dbf0bd88fee3e1a545e7979
> [1]
> https://lore.kernel.org/linux-leds/20190923102059.17818-4-jjhiblot@ti.com/
>
