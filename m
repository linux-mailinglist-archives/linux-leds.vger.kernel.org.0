Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5701BAD8B
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 21:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgD0TI7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 15:08:59 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55078 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgD0TI7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 15:08:59 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03RJ8qkm128121;
        Mon, 27 Apr 2020 14:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588014532;
        bh=8uvXnocphWSyhpigo6fZuEay9bLaRZ/pDQB3Fo/ceik=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=mdyI41YKqs8PbL8bzwdwjfe+1lU9QI9EDTlTEUMQGmIg4NlVwAkvoB2R6wjSo9aNi
         4cC6rLyjornJljJiTQgvdcpRv7I3zrQJg/m3tbIvExQwxqtP3v/aC4xvx0Efjfa2/z
         /f7DbDRsbmjW1GAswvqrR3SvYHp60PsXkxpU+zzI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03RJ8qFq117810
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Apr 2020 14:08:52 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 27
 Apr 2020 14:08:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 27 Apr 2020 14:08:52 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RJ8qNe123922;
        Mon, 27 Apr 2020 14:08:52 -0500
Subject: Re: [PATCH v20 04/17] dt: bindings: lp50xx: Introduce the lp50xx
 family of RGB drivers
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-5-dmurphy@ti.com> <20200425202422.GB23926@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <5e15c7f6-d96e-1446-3163-5463139f8ee0@ti.com>
Date:   Mon, 27 Apr 2020 14:02:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200425202422.GB23926@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 4/25/20 3:24 PM, Pavel Machek wrote:
> Hi!
>
>> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024,
>> LP5018, LP5012 and LP5009 RGB LED device driver.  The LP5036/30/24/18/12/9
>> can control RGB LEDs individually or as part of a control bank group.
>> These devices have the ability to adjust the mixing control for the RGB
>> LEDs to obtain different colors independent of the overall brightness of
>> the LED grouping.
>>
>> Datasheet:
>> http://www.ti.com/lit/ds/symlink/lp5012.pdf
>> http://www.ti.com/lit/ds/symlink/lp5024.pdf
>> http://www.ti.com/lit/ds/symlink/lp5036.pdf
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../devicetree/bindings/leds/leds-lp50xx.txt  | 148 ++++++++++++++++++
> Not sure here, but should new bindings be .yml?
> 								

Yeah it should be now.  This patch has been around so long that it was 
done before yaml conversion ;)

Dan

> Pavel
> 								
