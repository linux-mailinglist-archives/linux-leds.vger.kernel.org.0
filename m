Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36C5C1BAB1A
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 19:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgD0RYd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 13:24:33 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35780 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgD0RY2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 13:24:28 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03RHOPni100638;
        Mon, 27 Apr 2020 12:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588008265;
        bh=9UEkuR/F2nJaZ9wLLT/hIPP/2KeRKFLLW96e8JrFuKM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LvYzhnzDjvga2+5vXnZmr9ou4Q5SchJQuQMqfywvt3XDupiB+VG8rfwjXVu8muz5L
         RqxgONEB8x4r3jUtM3VIZY+2oFlQDcqynaPvM69LYwYu9ZpsWiFkIxUYpazCCrDQ4P
         gOqkGBGlwQz5LgO/ODVHQL4LMovfZfQW8I0kfbpQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03RHOPV1097264
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Apr 2020 12:24:25 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 27
 Apr 2020 12:24:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 27 Apr 2020 12:24:25 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RHOOAl069509;
        Mon, 27 Apr 2020 12:24:24 -0500
Subject: Re: [PATCH v20 00/17] Multicolor Framework (array edition)
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200425204825.GG23926@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <cc2425aa-2f9e-98eb-a161-51a910659987@ti.com>
Date:   Mon, 27 Apr 2020 12:18:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200425204825.GG23926@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 4/25/20 3:48 PM, Pavel Machek wrote:
> Hi!
>
>> This is the multi color LED framework.   This framework presents clustered
>> colored LEDs into an array and allows the user space to adjust the brightness
>> of the cluster using a single file write.  The individual colored LEDs
>> intensities are controlled via a single file that is an array of
>> LEDs
> Thanks for the series.

Thank you for taking the time to review this series.  I would prefer 
them to all go in at the same time as the LP50xx and LP55xx devices were 
tested incrementally and together as a full series.

I need to check back a few series patches 8->10 may have acks from 
maintainers but may have gotten lost.  If I find the maintainer ack I 
will post the URL where they ack'd it if not I will ask the maintainer 
for their review and ACK.

Dan

>
> I believe 6/, 11/, 15/, 16/ could be applied now. Should I do that?
>
> 8..10/ might be ready, too... but I'm not relevant maintainer, so
> you'll need to push them separately. I added my acks.
>
> Best regards,
> 									Pavel
