Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE4503CACE
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2019 14:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387574AbfFKMNT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jun 2019 08:13:19 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59968 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387538AbfFKMNT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jun 2019 08:13:19 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5BCDEhL078754;
        Tue, 11 Jun 2019 07:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560255194;
        bh=81uXDxnujEsAwK0R3fdDpTMwgzLhRvrVC+0V+nXPx0w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wYkP07zs9pDxKTLybTw2zTLm0d0LZeUXne3oLobut2uNtIi74kT33NTA0aBhtPwwI
         k8fc0w4AZ+zHfIbDkxPe0vjAIOaK8dsNJPXgCB5eiBxZYwVa8OmcleJcOl1xkS+MsB
         yFKazyCtIbdqjQ8/IXGKb745+/gOk6frhSyQwM9I=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5BCDDk8091275
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 Jun 2019 07:13:13 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 11
 Jun 2019 07:13:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 11 Jun 2019 07:13:13 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5BCDDoW022770;
        Tue, 11 Jun 2019 07:13:13 -0500
Subject: Re: [PATCH v3 1/2] Use usleep_range() for better precision timings
To:     Pavel Machek <pavel@ucw.cz>, Oleh Kravchenko <oleg@kaa.org.ua>
CC:     <linux-leds@vger.kernel.org>
References: <20190610173206.8060-1-oleg@kaa.org.ua>
 <20190611101308.GA7526@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3c0d56e3-c4ee-47a9-98c2-db6cbcdb1857@ti.com>
Date:   Tue, 11 Jun 2019 07:13:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611101308.GA7526@amd>
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
> On Mon 2019-06-10 20:32:05, Oleh Kravchenko wrote:
>> Documentation/timers/timers-howto.txt recommends to use msleep_range()
>> for delays less or equal 20ms. This driver use 10ms delays to talk with
>> hardware, so let's follow the rules.
>> Also because of buggy firmware better to keep timings much as possible.
>>
>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> Acked-by: Pavel Machek <pavel@ucw.cz>
>

Thanks for the updates

Acked-by: Dan Murphy <dmurphy@ti.com>

