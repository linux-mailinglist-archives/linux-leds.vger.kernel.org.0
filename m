Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFE93CACD
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2019 14:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387563AbfFKMNK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jun 2019 08:13:10 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56394 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387538AbfFKMNK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jun 2019 08:13:10 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5BCD3Zo130503;
        Tue, 11 Jun 2019 07:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560255183;
        bh=HePOYhqYS2HbRqkNEI3dPuUaAn43h5YTLxXONHCUDAs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Xz7JydBG/rogA6dMJHOyCST+7PBDOINWZ0X6FAc0WOZ+SQ4GOvIAkY8d6cIPtiDiE
         zjCC0WXaA92QQmW69lgYh00Tpa6aReBHJzzLUsWmk/ylbbfm0vuVz1cs03b46/R/Up
         Xiy7p6J5b2R/svO2x3jKDF5d30rYFcUmDrchWppk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5BCD3Hc090984
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 Jun 2019 07:13:03 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 11
 Jun 2019 07:13:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 11 Jun 2019 07:13:02 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5BCD1R4022343;
        Tue, 11 Jun 2019 07:13:01 -0500
Subject: Re: [PATCH v3 2/2] Simplify LED registeration by
 devm_led_classdev_register()
To:     Pavel Machek <pavel@ucw.cz>, Oleh Kravchenko <oleg@kaa.org.ua>
CC:     <linux-leds@vger.kernel.org>
References: <20190610173206.8060-1-oleg@kaa.org.ua>
 <20190610173206.8060-2-oleg@kaa.org.ua> <20190611101322.GB7526@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <213d4b87-22fa-8d7d-14f3-39622afab279@ti.com>
Date:   Tue, 11 Jun 2019 07:13:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611101322.GB7526@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh

On 6/11/19 5:13 AM, Pavel Machek wrote:
> On Mon 2019-06-10 20:32:06, Oleh Kravchenko wrote:
>> Because of devm_led_classdev_register() doesn't require device node pointer.
>> This patch reduce little bit code size and complexity.
>>
>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> Acked-by: Pavel Machek <pavel@ucw.cz>
>
Thanks for the updates

Acked-by: Dan Murphy <dmurphy@ti.com>

