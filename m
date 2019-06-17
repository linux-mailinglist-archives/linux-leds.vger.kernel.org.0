Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D83A4846D
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2019 15:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbfFQNr4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Jun 2019 09:47:56 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42566 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727594AbfFQNr4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Jun 2019 09:47:56 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5HDllBo011598;
        Mon, 17 Jun 2019 08:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560779267;
        bh=t1KAotzGb16F2+YW609QwX/IexDUFZIor3j/XUDLU9I=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=VGDMPQ8T1wa25BRTfbCxoFN1bT3M8KVCDBobeTCnxdm6jOtXHYvWWrGNPaZYbAjnM
         T/SytxkHNOfp1LIKO4nvrxU6oqoP5XGQju4DIWxfEgjaKM4oPBDruG38fki7tQfwdg
         yE9UDoE3X/cnS5STAM2GrWfgecgTbbGAtrAVakHw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5HDllQj110909
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 17 Jun 2019 08:47:47 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 17
 Jun 2019 08:47:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 17 Jun 2019 08:47:46 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5HDlkFV106459;
        Mon, 17 Jun 2019 08:47:46 -0500
Subject: Re: [PATCH v3 0/9] Multicolor Framework update
To:     Pavel Machek <pavel@ucw.cz>, Alexander Dahl <ada@thorsis.com>
CC:     <linux-leds@vger.kernel.org>, <jacek.anaszewski@gmail.com>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190523190820.29375-1-dmurphy@ti.com> <55737098.K72IVJ5cDM@ada>
 <20190616154934.GC24837@xo-6d-61-c0.localdomain>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <2a540277-01e3-abb6-f19f-6d52671ae4ce@ti.com>
Date:   Mon, 17 Jun 2019 08:47:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190616154934.GC24837@xo-6d-61-c0.localdomain>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 6/16/19 10:49 AM, Pavel Machek wrote:
> Hi!
>
>> Am Donnerstag, 23. Mai 2019, 14:08:11 CEST schrieb Dan Murphy:
>>>    leds: multicolor: Add sysfs interface definition
>>>    dt: bindings: Add multicolor class dt bindings documention
>>>    documention: leds: Add multicolor class documentation
>>>    dt-bindings: leds: Add multicolor ID to the color ID  list
>>>    leds: Add multicolor ID to the color ID list
>>>    leds: multicolor: Introduce a multicolor class definition
>>>    dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
>>>    leds: lp50xx: Add the LP50XX family of the RGB LED driver
>>>    leds: Update the lp55xx to use the multi color framework
>> While not having much experience with the implementation of the LED subsystem,
>> I've had a short look at those. Curious question: would it be possible to take
>> three gpio-leds and group those together to one multicolor-led? I know at
>> least one board, where things are wired up like this, see e.g.
>> at91-sama5d27_som1_ek.dts
> Probably could be done, but is not really a good match. Multicolor was meant for
> LEDs with many brightness levels.

Well that is one aspect of the MC FW.  The other aspect was to collate 
cluster RGB modules into a single

LED node as that RGB cluster would inherently display a functional color 
(ie RGB battery LED, multi-color

notification LEDs, Multicolor LED keyboards...)

Dan


> 									Pavel
