Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8551242266
	for <lists+linux-leds@lfdr.de>; Wed, 12 Aug 2020 00:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgHKWQy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Aug 2020 18:16:54 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39994 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgHKWQx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2020 18:16:53 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07BMGbgC063567;
        Tue, 11 Aug 2020 17:16:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597184197;
        bh=BcWdkWNK3kpKapQgO0Xm+UzannjeCmDE1NXrFwsfTB4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ljaB4/dBwG/aLQBpo6mo2P87hLFTB+ZATdNP2lBZmqAiYqbsRLkBmZ9GZr9LW1zV3
         u8mYH3RcQlEpvmGrZnc4/da3TBOWUVkiRoDE63824bSl7V4kx6P1sVmkaOmdm8cxQd
         4k5QqHRZiE9iFz0jSGenhHpyEMSEWELXyk0ztnRw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07BMGbl1057518;
        Tue, 11 Aug 2020 17:16:37 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 11
 Aug 2020 17:16:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 11 Aug 2020 17:16:37 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07BMGaYB054572;
        Tue, 11 Aug 2020 17:16:36 -0500
Subject: Re: [PATCH v32 2/6] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh@kernel.org>,
        <marek.behun@nic.cz>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200722153146.8767-1-dmurphy@ti.com>
 <20200722153146.8767-3-dmurphy@ti.com>
 <20200811105413.r2m2f7bubuz55rrt@duo.ucw.cz>
 <935119fa-6d1f-8e99-51f9-87966b4d03ad@ti.com> <20200811220109.GA9105@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3ce38a31-a4f0-4cd7-ad09-6bdad27e6756@ti.com>
Date:   Tue, 11 Aug 2020 17:16:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811220109.GA9105@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 8/11/20 5:01 PM, Pavel Machek wrote:
> Hi!
>
>>> Actually... This is quite impressive ammount of code to
>>> zero-initialize few registers. Could the regmap be told to set the
>>> range to zero, or use loops to reduce ammount of code?
>> I am not aware of any regmap calls that will set a range of registers to a
>> certain value.
>>
>> Well it depends on where we want to create the default cache values.
>>
>> Either we run through a for..loop during driver probe and delay device start
>> up or we keep the simple arrays and increase the driver total size.
> for loop will be better.
>
> Plus, REGCACHE_RBTREE is very likely overkill.

Well if I eliminate the reg_cache then I can eliminate the defaults too.

Dan

> Best regards,
>
> 									Pavel
