Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18FFC28BAD1
	for <lists+linux-leds@lfdr.de>; Mon, 12 Oct 2020 16:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389080AbgJLO2Y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 12 Oct 2020 10:28:24 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41250 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388921AbgJLO2X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 12 Oct 2020 10:28:23 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09CERgx4105705;
        Mon, 12 Oct 2020 09:27:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1602512862;
        bh=ydY3LYTdByLbSeckaSaj2Uvzk4bX7m1PEIvQBrCFsv4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=FpE59osXLymigcTrBOfBNRKR9dTQNbhrUgGyLtCfGcyPxTcmKSyMstYCYK/8exTzy
         T1tvoKjFzs5nn45civhVHWsH5D5QLcT77abLit8XmaSUb5uU/oqNTrZk1kQa8s2r6w
         Opiy9MDWi4AFTzLczLHCo4umjuDo0mKCCIkTJvsM=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09CERgMe031162
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 12 Oct 2020 09:27:42 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 12
 Oct 2020 09:27:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 12 Oct 2020 09:27:41 -0500
Received: from [10.250.33.177] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09CERfLS113442;
        Mon, 12 Oct 2020 09:27:41 -0500
Subject: Re: [PATCH v2] leds: lm3697: Rename struct into more appropriate name
To:     Marek Behun <kabel@blackhole.sk>, Pavel Machek <pavel@ucw.cz>
CC:     Gabriel David <ultracoolguy4@protonmail.com>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <nH0fAuRxkhh0jdtlck5LucnuXiEY2wfpLF8C8spK8hebUUZ75xQOe-PjBtR7F8jEZ84l-o9rVJ3z9xvatOAJMjvbH5qCQIO5MuSOmpWr0ZQ=@protonmail.com>
 <20201010185700.GA8218@amd> <20201010235045.4ba8cf51@blackhole.sk>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3f83953a-57ba-1fdc-f3ae-d3679e05474d@ti.com>
Date:   Mon, 12 Oct 2020 09:27:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201010235045.4ba8cf51@blackhole.sk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 10/10/20 4:50 PM, Marek Behun wrote:
> On Sat, 10 Oct 2020 20:57:00 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
>
>> On Fri 2020-10-09 15:51:35, Gabriel David wrote:
>>> The mentioned struct, lm3697_led, was renamed to lm3697_bank since the
>>> structure is representing the control banks. This name, in my opinion,
>>> is more semantically correct. The pointers referring to it were also
>>> renamed.
>>> Signed-off-by: Gabriel David <ultracoolguy4@protonmail.com>
>>> ---
>>> Yes, this is the same Gabriel David from ultracoolguy@tutanota.org and
>>> ultracoolguy@disroot.org. If you want me to confirm it I'll gladly do
>>> it.
>> No problem with that, and no need to resend. This can proably wait
>> for 5.11...
>>
>> I'd like some comment from Dan... and perhaps I'd want to understand
>> what the difference between LED and bank is.
>>
>> ...there can be more than one LED connected to the given bank, that's
>> what you are pointing out?
>>
>> ...but these LEDs will always work in unison, and they are handled as
>> single LED by Linux, right?
>>
> Pavel,
>
> the controller can connect 3 LED strips (to 3 different pins on the
> chip). There are 2 LED control banks (this is where you can set
> brightness). For each LED strip (each output pin) you can configure to
> which control bank it connects. So you have 3 LED strips and 2 control
> banks, that is 2^3 = 8 different configurations of connecting LED
> control bank to LED strip.
>
>  From the perspective of Linux you see the two control banks as 2 LED
> class devices (because you are setting brightness for control banks,
> not for the LED strips).

The way Marek explains it is correct and the way I wrote the driver 
intially.  There is no direct control of the LEDs only controlling the 2 
banks.

As an example a device can put LED string 1 and 2 on a single bank to 
control the backlight for a display and put LED string 3 on a different 
bank to control the backlight of a keyboard. Like in the Droid and Droid 
4 devices.  2 strings illuminate the display backlight and 1 string 
illuminates the keyboard the display backlight can have a independent 
brightness then the keyboard.

To me the name of the structure does not impose any functional changes 
just semantic changes.  And it just makes it a bit more difficult to 
back port functional fixes as this patch would be made mandatory for 
cherry picking.  But I do not get many requests to back port this driver 
so it maybe be a moot point.

Dan


