Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3450A10EA7C
	for <lists+linux-leds@lfdr.de>; Mon,  2 Dec 2019 14:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfLBNGU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Dec 2019 08:06:20 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53950 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbfLBNGU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 Dec 2019 08:06:20 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB2D60RA057754;
        Mon, 2 Dec 2019 07:06:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575291960;
        bh=CpiyO5wWF9b1B1f1fre8VKdouLPPVPt1I/3u7Ok/pJ4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=yF0YiqL40R56Tmc/51bc08/PmD3rnIX1++1YF+rg6aaBIKyPAESwdsjCZlNcwkAc9
         Fu9vxXZ0MF1Chr09+GCAKsbTlDvS+bCKTmbGy3+4Jp0w0qty2jswMDBUEq6OPRJ9uS
         VYEpjxVSYMSv1QzO2JPC3fBSHXImd3gs9jC4y7v0=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB2D60Xt088720
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 2 Dec 2019 07:06:00 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Dec
 2019 07:06:00 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Dec 2019 07:06:00 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB2D5xtR099233;
        Mon, 2 Dec 2019 07:05:59 -0600
Subject: Re: [PATCH v17 10/19] ARM: dts: imx6dl-yapp4: Add reg property to the
 lp5562 channel node
To:     Shawn Guo <shawnguo@kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
References: <20191114133023.32185-1-dmurphy@ti.com>
 <20191114133023.32185-11-dmurphy@ti.com> <20191202090645.GI9767@dragon>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3f0b6da2-15ca-a0cf-ba82-8bbb6af3bf81@ti.com>
Date:   Mon, 2 Dec 2019 07:03:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191202090645.GI9767@dragon>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Shawn

On 12/2/19 3:06 AM, Shawn Guo wrote:
> On Thu, Nov 14, 2019 at 07:30:14AM -0600, Dan Murphy wrote:
>> Add the reg property to each channel node.  This update is
>> to accomodate the multicolor framework.  In addition to the
>> accomodation this allows the LEDs to be placed on any channel
>> and allow designs to skip channels as opposed to requiring
>> sequential order.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> CC: Shawn Guo <shawnguo@kernel.org>
>> CC: Sascha Hauer <s.hauer@pengutronix.de>
>> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
>> CC: Fabio Estevam <festevam@gmail.com>
>> CC: NXP Linux Team <linux-imx@nxp.com>
>> ---
>>   arch/arm/boot/dts/imx6dl-yapp4-common.dtsi | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
>> index e8d800fec637..efc466ed1fea 100644
>> --- a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
>> +++ b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
>> @@ -257,29 +257,35 @@
>>   		reg = <0x30>;
>>   		clock-mode = /bits/ 8 <1>;
>>   		status = "disabled";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>>   
>> -		chan0 {
>> +		chan@0 {
> Again, why do not we rename it to led@0 as you update the bindings in
> the last patch in the series?

I am trying to limit the amount of change in this patchset.

I know what you are asking is for a small change but that would be 
another patch to the series to the label.  I want to keep functional 
changes like this isolated from clean up changes like you asked for 
bissectability.

 From that point we can make additional changes. I would really like 
this to get into 5.6 as I thought I hit the merge window for 5.5 but it 
did not make it.

Dan

