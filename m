Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD631BBD12
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2020 14:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgD1MH7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Apr 2020 08:07:59 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59314 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgD1MH7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Apr 2020 08:07:59 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03SC7sED071334;
        Tue, 28 Apr 2020 07:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588075674;
        bh=J604Nen4LCpyCHe23MsZVFIHdXnxQhSRkwuocVy4/78=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=pnAJk7U/aPphnf50wlKIH31/1/sVCQoGPzWiub3z32N7fExrLrx8Nq9U2nILA8OMc
         kKDXArkyRJojQsS1ljmNeK39rWS/H6ci59d71Y+/3/2EuwzugMqjpjB59w2yHf8H80
         iOE28jZ+SbILFAloP/EsVo4GzipNXb5fvH06y/aI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03SC7sPa087544
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 Apr 2020 07:07:54 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Apr 2020 07:07:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Apr 2020 07:07:54 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03SC7sev008231;
        Tue, 28 Apr 2020 07:07:54 -0500
Subject: Re: [PATCH v20 02/17] leds: Add multicolor ID to the color ID list
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-3-dmurphy@ti.com> <20200425195242.GA1143@bug>
 <003891b8-a697-6d55-3862-5773e23a466a@ti.com> <20200428084301.GC20640@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <1166f584-8889-df61-393c-f240b7c3c041@ti.com>
Date:   Tue, 28 Apr 2020 07:02:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428084301.GC20640@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 4/28/20 3:43 AM, Pavel Machek wrote:
> On Mon 2020-04-27 12:12:18, Dan Murphy wrote:
>> Pavel
>>
>> On 4/25/20 2:52 PM, Pavel Machek wrote:
>>> On Thu 2020-04-23 10:55:09, Dan Murphy wrote:
>>>> Add a new color ID that is declared as MULTICOLOR as with the
>>>> multicolor framework declaring a definitive color is not accurate
>>>> as the node can contain multiple colors.
>>>>
>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> Please merge with previous patch, and you can keep reviews.
>> Not sure we should do that.  The previous patches deals directly with the
>> bindings and this is code.
>>
>> I thought the rule was to keep bindings and code separated.
>>
>> It made sense to squash the bindings header patch to the bindings document
>> patch but it does not make sense to squash this patch to the bindings.
>>
>> Please let me know if you want me to proceed with the squash.
> Well, OTOH it seems wrong to have array that is only
> half-initialized... But it is not a big deal.

I will squash it into the previous patch as you asked.  Like you said it 
is not a big deal.

Dan

