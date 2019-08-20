Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08C7996800
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2019 19:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728554AbfHTRsc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Aug 2019 13:48:32 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57618 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728360AbfHTRsc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Aug 2019 13:48:32 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7KHmM2s043185;
        Tue, 20 Aug 2019 12:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566323302;
        bh=YabkehyMSgZxbaDkfQ/h7N4PXM2rwmSTfszEw30aqdk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ozHDxA4IHBIw0Ya/LJ7Qu8UWc3jT3qhVJN23kdMf/wXJYRHMRE/dVns8edYyoDTa/
         LKE2Q0QlV9Z4j8w2FOOxF+d8YKx7OayO61UA5WUyW13soyo5py8pHJYZ59/wx/juU+
         ZZvtt+tYian9wGoZUsLDbUamYSzzxAzmDADlgaRU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7KHmMOS092140
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Aug 2019 12:48:22 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 12:48:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 12:48:22 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7KHmMgo091790;
        Tue, 20 Aug 2019 12:48:22 -0500
Subject: Re: [PATCH v2 4/4] leds: lm3532: Add full scale current configuration
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <tony@atomide.com>, <sre@kernel.org>,
        <nekit1000@gmail.com>, <mpartap@gmx.net>, <merlijn@wizzup.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190813181154.6614-1-dmurphy@ti.com>
 <20190813181154.6614-4-dmurphy@ti.com> <20190819105519.GG21072@amd>
 <1f4efd9f-8234-161a-2c05-c5bae2720207@ti.com> <20190820162934.GA5701@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <ff64b385-5173-0d8a-acd4-edd298da3b74@ti.com>
Date:   Tue, 20 Aug 2019 12:48:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820162934.GA5701@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 8/20/19 11:29 AM, Pavel Machek wrote:
> Hi!
>
>>> No need to move ctrl_brt_pointer... to keep order consistent with docs.
>> OK I will reset the patches and get rid of that change.  I think this got
>> moved when I applied the v1 patch.
>>
>>
>>>> +		fs_current_val = led->full_scale_current - LM3532_FS_CURR_MIN /
>>>> +				 LM3532_FS_CURR_STEP;
>>> The computation is wrong ... needs () AFAICT.
>> Hmm. Doesn't order of operations take precedence?
>>
>> I will add the () unless checkpatch cribs about them
> I may be misunderstanding. What do you expect the computation to be? /
> has higher priority than -, right? Can you test it provides expected
> results?

Fixed.  I think this is what you expected.

fs_current_val = (led->full_scale_current - LM3532_FS_CURR_MIN) /
                             LM3532_FS_CURR_STEP;


> 									Pavel
