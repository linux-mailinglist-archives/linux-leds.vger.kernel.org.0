Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBC9EA505
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2019 21:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbfJ3U4c (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Oct 2019 16:56:32 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44278 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfJ3U4c (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Oct 2019 16:56:32 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UKuLXl016614;
        Wed, 30 Oct 2019 15:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572468981;
        bh=uTa+nOWWvFmdv+XqibK6OdPOOuNPy1uXmeMAZ1EYTP8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=h8BpNJDKWuUVYFAZPMvqDUsA5LLhZV9TQRpm5jNnq9cXt7PmY/366WMOXLdpgjMxp
         fwmqefKaWqttxNhQpMd98r1WxZWuF/SFgbUUTsh/AsZUcXm2kUKAHamwgVsiG4E0JN
         g1jPTjN/rpe+v/VhzMxrQNY9dAorW+lIEe/oeCaU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UKuLww128650
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 15:56:21 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 15:56:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 15:56:21 -0500
Received: from [10.250.35.43] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UKuKcI091822;
        Wed, 30 Oct 2019 15:56:20 -0500
Subject: Re: [PATCH v15 06/19] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        kbuild test robot <lkp@intel.com>
CC:     <kbuild-all@lists.01.org>, <pavel@ucw.cz>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191028183629.11779-7-dmurphy@ti.com>
 <201910302027.2hNdR993%lkp@intel.com>
 <bb3473ba-ddfc-2b51-4a75-c23c5bf3bc62@ti.com>
 <075c9330-a9b5-1360-4447-71a4797553a9@gmail.com>
 <f32e2063-3c56-607c-0e74-f75f68e62e16@ti.com>
 <b50fa8f6-1a27-ad22-d4a7-37bc07fc6768@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <6b64d284-0854-4143-6cd8-2b07ac268e5e@ti.com>
Date:   Wed, 30 Oct 2019 15:55:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b50fa8f6-1a27-ad22-d4a7-37bc07fc6768@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/30/19 3:50 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 10/30/19 9:23 PM, Dan Murphy wrote:
>> Jacek
>>
>>
>>>> Does not appear here
>>>>
>>>> Finally not sure why the MIPS compiler is complaining about this but the
>>>> ARM and x86 is not
>>> Compilation breaks also for ARM.
>> Thanks for the information.
>>
>> I am not seeing this issue or even a warning when using the ARM 8.3
>> toolchain even in a clean build.
>>
>> arm-linux-gnueabihf-gcc (GNU Toolchain for the A-profile Architecture
>> 8.3-2019.03 (arm-rel-8.36)) 8.3.0
>>
>> So is a bug in this toolchain?
>  From what I've just googled C specification allows for a compiler
> implementation to accept also other forms of constants expressions
> than standard ones pointed out in the spec.
>
> So this is not necessarily a bug.
>
OK.  Well I will try to repo with the above instructions.  And wait till 
Friday for any other comments.  If I get no other comments I will make 
the couple of changes and then post v16.

Dan

