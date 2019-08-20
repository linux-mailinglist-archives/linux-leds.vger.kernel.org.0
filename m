Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2D396592
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2019 17:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbfHTPwh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Aug 2019 11:52:37 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60256 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbfHTPwh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Aug 2019 11:52:37 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7KFqTpU013969;
        Tue, 20 Aug 2019 10:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566316349;
        bh=I+enaYTAAmfc6tIpRT8oeFRBJKI9EtjDpiVK24lVgVM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=bCJmO/XDDgmqG8NwcwMb2/+10hnv8Xy364mUpqL23I0p0+fExqSyZ5vbZNVMo6RKI
         BZ9PbuEzQb9H/EUEuQp581Dad2cXXl6EK7UsOI6iMk20OSS28p423Zc70oFqouz2C4
         KKn21U8xCgQuLW4Th4copcO6aJLqIhgNo7/Iig24=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7KFqT9q077401
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Aug 2019 10:52:29 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 10:52:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 10:52:28 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7KFqRbX124159;
        Tue, 20 Aug 2019 10:52:27 -0500
Subject: Re: [PATCH v2 1/4] leds: lm3532: Fix brightness control for i2c mode
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <tony@atomide.com>, <sre@kernel.org>,
        <nekit1000@gmail.com>, <mpartap@gmx.net>, <merlijn@wizzup.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190813181154.6614-1-dmurphy@ti.com>
 <20190819104804.GD21072@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <522f9394-22cf-f58b-b9fd-b345e9fd61b0@ti.com>
Date:   Tue, 20 Aug 2019 10:52:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819104804.GD21072@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 8/19/19 5:48 AM, Pavel Machek wrote:
> On Tue 2019-08-13 13:11:51, Dan Murphy wrote:
>> Fix the brightness control for I2C mode.  Instead of
>> changing the full scale current register update the ALS target
>> register for the appropriate banks.
>>
>> In addition clean up some code errors and random misspellings found
>> during coding.
>>
>> Tested on Droid4 as well as LM3532 EVM connected to a BeagleBoneBlack
>>
>> Fixes: e37a7f8d77e1 ("leds: lm3532: Introduce the lm3532 LED driver")
>> Reported-by: Pavel Machek <pavel@ucw.cz>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> I may prefer register renames to come separately, but ...

I can separate them into a different patch

Dan


> Acked-by: Pavel Machek <pavel@ucw.cz>
> 								Pavel
