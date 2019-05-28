Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCC92BC81
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2019 02:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfE1Apm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 May 2019 20:45:42 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34284 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbfE1Apm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 May 2019 20:45:42 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S0jaiX058237;
        Mon, 27 May 2019 19:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559004336;
        bh=1JnGHZvHyL2VOmJQfXsquvMDTMdCkBKneNCnKVBEnjo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=nso+2l6CVVL2pmQd0wDtsjoc63heTFxs8fkPdAhYcKGPkzK3MKjpCn4ODoS9a+tuE
         xfCWJv8AVjI5SPcIVG/bpYZHMFKgbhuY31e2mh6Z2gFo2awLVBGTNHVJn33mi5qGsW
         Gnwa/gWy8Ev0Bmot+JdTfSUBlaAqxFIvQhwZQxFg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S0jaDH110968
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 May 2019 19:45:36 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 19:45:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 19:45:36 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S0jZuM037366;
        Mon, 27 May 2019 19:45:35 -0500
Subject: Re: [PATCH v3 1/9] leds: multicolor: Add sysfs interface definition
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-2-dmurphy@ti.com> <20190527103355.GA5287@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <522728b0-147b-3708-fea1-88a895491e05@ti.com>
Date:   Mon, 27 May 2019 19:45:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527103355.GA5287@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 5/27/19 5:33 AM, Pavel Machek wrote:
> On Thu 2019-05-23 14:08:12, Dan Murphy wrote:
>> Add a documentation of LED Multicolor LED class specific
>> sysfs attributes.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../ABI/testing/sysfs-class-led-multicolor    | 57 +++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> new file mode 100644
>> index 000000000000..2f102ede258b
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> @@ -0,0 +1,57 @@
>> +What:		/sys/class/leds/<led>/colors/sync_enable
>> +Date:		April 2019
> I believe I suggested more reasonable interface. Why not use that?
>

Can you please provide the reference to your interface?

These patchsets have been around for a while (Decemeber 2018) and I 
cannot seem to find the reference to your suggestion.

The suggestion may have been mired in the brightness model discussions.

So I don't want to over look what you suggested as it may be more 
reasonable then what I have implemented.

Dan

