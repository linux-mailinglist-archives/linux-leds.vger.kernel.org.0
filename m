Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7A139D1FD
	for <lists+linux-leds@lfdr.de>; Mon, 26 Aug 2019 16:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730491AbfHZOxN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 26 Aug 2019 10:53:13 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:53280 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbfHZOxM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 26 Aug 2019 10:53:12 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7QEr8Pc101513;
        Mon, 26 Aug 2019 09:53:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566831188;
        bh=WdleGLWkRq/1jDkaqmOFjUx+wwGB5q5Txqj9k2wYxiw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=oVwPB2bRqwjC8Omx95WOK5PJJ2JevB88cKFaMXhVn4HKuENHmu3hP2U8r1GRUAcjC
         iyUKNHE8qnTAnW9ygLfQLo6tW7xjRONSKMjKM35F1/mefjcq5t+sRHdAmlgw2ckXI1
         RVsIvc5M5XNmFQ4XuywTCZp2B21iWsY+ZjQeom/M=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7QEr8Zi097286
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 26 Aug 2019 09:53:08 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 26
 Aug 2019 09:53:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 26 Aug 2019 09:53:07 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7QEr6pu022236;
        Mon, 26 Aug 2019 09:53:07 -0500
Subject: Re: [PATCH] leds: ti-lmu-common: Fix coccinelle issue in TI LMU
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190823195523.20950-1-dmurphy@ti.com>
 <4a1872e8-89a5-4bc4-6aa4-bcadbc48697a@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <de1bb95d-d5ca-6f8f-e758-b03479091f99@ti.com>
Date:   Mon, 26 Aug 2019 09:53:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4a1872e8-89a5-4bc4-6aa4-bcadbc48697a@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 8/24/19 10:18 AM, Jacek Anaszewski wrote:
> Hi Dan,
>
> Thank you for the patch.
>
> On 8/23/19 9:55 PM, Dan Murphy wrote:
>> Fix the coccinelle issues found in the TI LMU common code
>>
>> drivers/leds/leds-ti-lmu-common.c:97:20-29: WARNING: Unsigned expression compared with zero: ramp_down < 0
>> drivers/leds/leds-ti-lmu-common.c:97:5-12: WARNING: Unsigned expression compared with zero: ramp_up < 0
> Wouldn't it make more sense to remove those pointless checks?
> Clearly a correct index of an array cannot be negative.
> Looking at the code I would make more int -> unsigned int conversions:
>
> - ramp_table should be unsigned int
> - ti_lmu_common_convert_ramp_to_index should return unsigned int
>
Yeah I was going to just remove the code but when I was writing the 
original code my intent was

to extend the ramp call to allow other TI LMU driver to pass in the 
device specific ramp table.

But since I don't currently have any devices on my plate that require 
that I can just remove the code as well

Dan

[...]

