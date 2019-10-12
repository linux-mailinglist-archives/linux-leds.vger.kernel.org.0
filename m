Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5CE3D4B7C
	for <lists+linux-leds@lfdr.de>; Sat, 12 Oct 2019 02:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbfJLAtB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Oct 2019 20:49:01 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51972 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbfJLAtA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Oct 2019 20:49:00 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9C0muw3062648;
        Fri, 11 Oct 2019 19:48:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570841336;
        bh=9HYdVL/jxtLlrmhctSjijC3xd4LSPsecoNMKj9yKSrw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Y/JK46clAnFJ4Fjy0GMr6/Is9AphlLqqKhnkFdvDz63MJ0lWCrf2bRzPKkIDaK9n7
         0uWh0tOUAIGiTmpeopsG3CJPkS59/8p9Q96k/AHWL5B4M1yh6Y+ubE5M8+QZWC6jXq
         2G96igWsTZH7QekdJoLfjO4t7UKIoLklEvNMG5fU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9C0mupj080574
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Oct 2019 19:48:56 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 19:48:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 19:48:51 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9C0mtpX036662;
        Fri, 11 Oct 2019 19:48:55 -0500
Subject: Re: [PATCH v12 00/16] Multicolor Framework v12
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191011130657.4713-1-dmurphy@ti.com>
 <47e924dd-ae75-b822-b79e-9156d09b8b1a@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <194bd01e-6354-d3b3-63cd-97c359f99dca@ti.com>
Date:   Fri, 11 Oct 2019 19:48:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <47e924dd-ae75-b822-b79e-9156d09b8b1a@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/11/19 2:40 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 10/11/19 3:06 PM, Dan Murphy wrote:
>> Hello
>>
>> Minor changes per review comments.
>> https://lore.kernel.org/patchwork/project/lkml/list/?series=413385
>>
>> Rebased the series on top of Pavel's next branch.
>>
>> Multicolor changes:
>> Rename led_mc_calc_brightness to led_mc_calc_color_components
>> Updated the binding example for the function from STATUS to CHARGING
> I see STATUS is still there, as well ass "Child".

I fixed them they are just in the wrong patch as you pointed out.

Dan

