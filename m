Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0B4172979
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2020 21:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729390AbgB0Udp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 27 Feb 2020 15:33:45 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44662 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729351AbgB0Udp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Feb 2020 15:33:45 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RKXcae026680;
        Thu, 27 Feb 2020 14:33:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582835618;
        bh=Uw0ni0Ylg3Nub4phk1HCPGveFhsLelM4MEaVxGRNT9Q=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dOcoIqp+cteeBfPMjDxXAqjWUSS2WeBAKc6hSsuiAE4Jrg8zFQlvlMOUvSoFyXAek
         8F0Ij2yfoEYOmcYFgt4VKuyv7dBwVZa/L5DBY0/CQ1fIrOZxL9+qUOIbUtmjut8Yob
         8NcCQeWTdsspr8kMC5vxOYTe47VD80brxNcQ7hAE=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01RKXcnn032250
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Feb 2020 14:33:38 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 14:33:37 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 14:33:37 -0600
Received: from [128.247.59.107] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RKXbGD050011;
        Thu, 27 Feb 2020 14:33:37 -0600
Subject: Re: [PATCH 1/2 v2] leds: ns2: Absorb platform data
To:     Pavel Machek <pavel@ucw.cz>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        <linux-leds@vger.kernel.org>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Simon Guinot <simon.guinot@sequanux.org>
References: <20200210101354.287045-1-linus.walleij@linaro.org>
 <20200226135006.GF4080@duo.ucw.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <1f1b52dd-d702-efe3-cb62-bbf4ae67a25b@ti.com>
Date:   Thu, 27 Feb 2020 14:28:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226135006.GF4080@duo.ucw.cz>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 2/26/20 7:50 AM, Pavel Machek wrote:
> Hi!
>
>> Nothing in the kernel includes the external header
>> <linux/platform_data/leds-kirkwood-ns2.h> so just push the
>> contents into the ns2 leds driver. If someone wants to use
>> platform data or board files to describe this device they
>> should be able to do so using GPIO machine descriptors but
>> in any case device tree should be the way forward for these
>> systems in all cases I can think of, and the driver already
>> supports that.
>>
>> Cc: Vincent Donnefort <vdonnefort@gmail.com>
>> Tested-by: Simon Guinot <simon.guinot@sequanux.org>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> ChangeLog v1->v2:
>> - Collect Simon's Tested-by tag
> Aha, I applied v1, but collected tested-by tag manually, so we should
> be ok.

You took the wrong version of the patch set.

I had comments on v2 (you seemed to have ignored) and v3 was submitted.

Dan

