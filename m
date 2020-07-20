Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CD6225E1F
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jul 2020 14:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgGTMH0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Jul 2020 08:07:26 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57820 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728568AbgGTMHZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Jul 2020 08:07:25 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06KC74kU075321;
        Mon, 20 Jul 2020 07:07:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595246824;
        bh=aj1lP0WZkkMDqqRJkTAmBFSAqvwrbFH5xh9UNbjJztU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eT8ph3GfR3hfkfZT/7C7F7eo0fkPxyj2yM9xX7MH8byXRnwwh5U23XN/8Rcwbc1GQ
         eStItNoISCEBVyoayZ3pq9FZ8h+imd5dTaP3iKXmiL68jHKY1nyieY0K4mGmU2Dt5b
         uOrb517DHFe+RNyLitdud984xaIMjz+IoI9DQuL4=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06KC74Zi071107;
        Mon, 20 Jul 2020 07:07:04 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 20
 Jul 2020 07:07:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 20 Jul 2020 07:07:03 -0500
Received: from [10.250.32.229] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06KC73tp015469;
        Mon, 20 Jul 2020 07:07:03 -0500
Subject: Re: [PATCH v31 01/12] leds: multicolor: Introduce a multicolor class
 definition
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh@kernel.org>,
        <marek.behun@nic.cz>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716182007.18389-1-dmurphy@ti.com>
 <20200716182007.18389-2-dmurphy@ti.com> <20200720095409.GA13137@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <95708f01-0db6-ed25-e087-2d95f28fe509@ti.com>
Date:   Mon, 20 Jul 2020 07:07:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720095409.GA13137@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 7/20/20 4:54 AM, Pavel Machek wrote:
> Hi!
>
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>>
>> The multicolor class groups monochrome LEDs and allows controlling two
>> aspects of the final combined color: hue and lightness. The former is
>> controlled via the intensity file and the latter is controlled
>> via brightness file.
>>
>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> Thanks, applied and pushed out.

Thank you. What about the patches for the users?

>> +====================================
>> +MultiColor LED handling under Linux
>> +====================================
> ...
>> +Multicolor Class Control
>> +========================
> AFAICT The first one should be "Multicolor" for consistency.
>
>> +config LEDS_CLASS_MULTICOLOR
>> +	tristate "LED MultiColor Class Support"
> Here too.
>
> Can you send a followup patch to fix it up?

Will send a patch to fix it up but not sure if I should send as part of 
this series or separately?

Because I am not sure if you are going to apply the remaining patches up 
to the DTs

Dan


> Best regards,
> 									Pavel
