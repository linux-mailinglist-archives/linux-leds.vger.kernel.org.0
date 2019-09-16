Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8251CB3BDD
	for <lists+linux-leds@lfdr.de>; Mon, 16 Sep 2019 15:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732992AbfIPNyn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Sep 2019 09:54:43 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42782 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbfIPNyn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Sep 2019 09:54:43 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8GDsb4N084722;
        Mon, 16 Sep 2019 08:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568642077;
        bh=l8yeJsF8FmT2WnVdhCOfEujrwIHFMa/BZ4gjgWzLKWk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=S1iVH2MgMmOKe6ECllqnFkshWA551SXE7hsEYqnVjkJyD62SzdGUT8p62g04H5+/d
         uTNgpp7/9L2guOauipwSX6UYECEIP41nQkAHm5aO718nH6AduE1zpMeaIDdEMOARTL
         hKwRYlLSxMiUGw9FvYKQlciIlvvT6/rM0/GM33pI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GDsbhV072484;
        Mon, 16 Sep 2019 08:54:37 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 16
 Sep 2019 08:54:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 16 Sep 2019 08:54:35 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GDsauO095861;
        Mon, 16 Sep 2019 08:54:37 -0500
Subject: Re: [PATCH v5 1/9] leds: multicolor: Add sysfs interface definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <robh+dt@kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190911180115.21035-1-dmurphy@ti.com>
 <20190911180115.21035-2-dmurphy@ti.com>
 <e34f4182-71d1-d51d-fb07-f88f6b88b6a3@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <eb08cd1b-a3eb-18db-0dd2-5c34637df9d5@ti.com>
Date:   Mon, 16 Sep 2019 08:56:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e34f4182-71d1-d51d-fb07-f88f6b88b6a3@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 9/15/19 8:57 AM, Jacek Anaszewski wrote:
> Hi Dan,
>
> On 9/11/19 8:01 PM, Dan Murphy wrote:
>> Add a documentation of LED Multicolor LED class specific
>> sysfs attributes.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../ABI/testing/sysfs-class-led-multicolor    | 73 +++++++++++++++++++
>>   1 file changed, 73 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> new file mode 100644
>> index 000000000000..4ea54c2ad4c8
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> @@ -0,0 +1,73 @@
>> +What:		/sys/class/leds/<led>/brightness
>> +Date:		Sept 2019
>> +KernelVersion:	5.5
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read/write
>> +		The multicolor class will redirect the device drivers call back
>> +		function for brightness control to the multicolor class
>> +		brightness control function.
>> +
>> +		Writing to this file will update all LEDs within the group to a
>> +		calculated percentage of what each color LED in the group is set
>> +		to.  The percentage is calculated via the equation below:
>> +
>> +		led_brightness = requested_value * led_color_intensity/led_color_max_intensity
>> +
>> +		For additional details please refer to
>> +		Documentation/leds/leds-class-multicolor.rst.
>> +
>> +		The value of the color is from 0 to
>> +		/sys/class/leds/<led>/max_brightness.
>> +
>> +What:		/sys/class/leds/<led>/colors/color_mix
>> +Date:		Sept 2019
>> +KernelVersion:	5.5
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read/write
>> +		The values written to this file should contain the intensity
>> +		values of each multicolor LED within the colors directory. The
>> +		index of given color is reported by the color_id file present in
>> +		colors/<color> directory. The index determines the position in
>> +		the sequence of	intensities on which the related intensity
>> +		should be passed to this file.
>> +
>> +		For additional details please refer to
>> +		Documentation/leds/leds-class-multicolor.rst.
> As already mentioned in the reply to Pavel - let's avoid the
> introduction of another sysfs file with multiple values.

OK for clarification remove the color_mix and color_id files and keep 
the intensity files?

Dan

