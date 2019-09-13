Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28151B1721
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2019 04:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbfIMCJQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Sep 2019 22:09:16 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50890 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbfIMCJQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 12 Sep 2019 22:09:16 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8D29AF2059679;
        Thu, 12 Sep 2019 21:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568340550;
        bh=3rFQ5YOQyJCcjWRaEXaDv0l6ekVp8tIORqYcBJwvCSw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fhUf3ysL0s9b7ekP7xEBsh8/9FWT7jKAt48LjdWbveQGDguhI297l+A+yY6LOzfV6
         P5mbtVnjbxD0zkjLaV919bKrj10EBc4YogFL4wyLPwvcgqBqpJ7YO3VNpIKbgJAsTg
         2bm3vOviig07JHQ5sVv9TnPvsMRwYcZF7zDY+w0o=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8D29AFd079295
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 21:09:10 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 21:09:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 21:09:08 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8D298TQ051406;
        Thu, 12 Sep 2019 21:09:08 -0500
Subject: Re: [PATCH v5 2/9] documention: leds: Add multicolor class
 documentation
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh+dt@kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190911180115.21035-1-dmurphy@ti.com>
 <20190911180115.21035-3-dmurphy@ti.com> <20190912205551.GA13514@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <61ccb700-88df-03c0-3fb0-7f955d2b6cb2@ti.com>
Date:   Thu, 12 Sep 2019 21:09:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912205551.GA13514@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel

Thanks for looking at this again

On 9/12/19 3:55 PM, Pavel Machek wrote:
> Hi!
>
>> +Directory Layout Example
>> +========================
>> +root:/sys/class/leds/rgb:grouped_leds# ls -lR colors/
>> +colors/:
>> +drwxr-xr-x    2 root     root             0 Jun 28 20:21 blue
>> +drwxr-xr-x    2 root     root             0 Jun 28 20:21 green
>> +drwxr-xr-x    2 root     root             0 Jun 28 20:21 red
>> +-rw-------    1 root     root          4096 Jun 28 20:21 color_mix
>> +
>> +colors/blue:
>> +-rw-------    1 root     root          4096 Jun 28 20:21 intensity
>> +-r--------    1 root     root          4096 Jun 28 20:27 max_intensity
>> +-r--------    1 root     root          4096 Jun 28 20:21 color_id
> I don't really like the directories... A bit too much complexity, and
> it will have a memory footprint, too.

The directories should be fine to have I am not seeing the complexity. 
Is memory footprint really an issue? Maybe in the IoT space but this is 
small and memory footprint should be able to handle this for IoT and 
larger systems.

Having dedicated directories and files clears up issues for user space 
to know about the parameters for each LED especially with the color_mix 
file which I still am not a fan of, but conceded and implemented 
anyway.  It also gives the user space flexibility to call the monochrome 
LEDs specific intensity file.  The user space can either use the color 
intensity file or the color_mix file it is a choice for them to make.

This code was modeled off the LP50xx device which has individual LED 
intensity controls as well as a overall brightness control. Since we 
have no feedback from user space folks I feel we have to give some 
options not very many but some.

>
> I'd expect max_intensity to be same for all the leds in
> rgb:grouped_leds... Could we simply rely on max_brightness file?

I went under the assumption that not all grouped LEDs would have the 
same max_intensity.

I don't have specific use cases but wanted this as an option.

Dan

> [If not, would one "max_intensity" file in rgb:grouped_leds be
> enough?]
>
> Best regards,
> 							Pavel
> 							
