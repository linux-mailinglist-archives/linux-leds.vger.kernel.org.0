Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1FA1BAD97
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 21:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgD0TL1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 15:11:27 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46376 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbgD0TL1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 15:11:27 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03RJBOjD126521;
        Mon, 27 Apr 2020 14:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588014684;
        bh=hoI42wYwC9ipxe+Q+jZIST9ciiL5kPWUJGc53/Upbuo=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=HZjkmlpRC8A4JDAqB0J3giK94AP5/gDNeJx9X9VwFe9og870LHnvV9gzDQxqt1AJD
         nuwnNWoRlZS87Lv/1AaPBJTaLYNFKIZ7iBhugDjCwuBrf9eES8JkCGNcSfOM5KcVgK
         nVoQUTE/KUYA/A5BT/nlHKZpTE0zcq/kUUS94SLc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03RJBOI0050584
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Apr 2020 14:11:24 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 27
 Apr 2020 14:11:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 27 Apr 2020 14:11:23 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RJBNGi009651;
        Mon, 27 Apr 2020 14:11:23 -0500
Subject: Re: [PATCH v20 00/17] Multicolor Framework (array edition)
From:   Dan Murphy <dmurphy@ti.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200425204825.GG23926@amd> <cc2425aa-2f9e-98eb-a161-51a910659987@ti.com>
Message-ID: <53d45397-dca4-7426-bcd9-1d253689a8dc@ti.com>
Date:   Mon, 27 Apr 2020 14:05:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cc2425aa-2f9e-98eb-a161-51a910659987@ti.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 4/27/20 12:18 PM, Dan Murphy wrote:
> Pavel
>
> On 4/25/20 3:48 PM, Pavel Machek wrote:
>> Hi!
>>
>>> This is the multi color LED framework. This framework presents 
>>> clustered
>>> colored LEDs into an array and allows the user space to adjust the 
>>> brightness
>>> of the cluster using a single file write.  The individual colored LEDs
>>> intensities are controlled via a single file that is an array of
>>> LEDs
>> Thanks for the series.
>
> Thank you for taking the time to review this series.  I would prefer 
> them to all go in at the same time as the LP50xx and LP55xx devices 
> were tested incrementally and together as a full series.
>
> I need to check back a few series patches 8->10 may have acks from 
> maintainers but may have gotten lost.  If I find the maintainer ack I 
> will post the URL where they ack'd it if not I will ask the maintainer 
> for their review and ACK.
>
> Dan
>
>>
>> I believe 6/, 11/, 15/, 16/ could be applied now. Should I do that?
>>
>> 8..10/ might be ready, too... but I'm not relevant maintainer, so
>> you'll need to push them separately. I added my acks.
>>
8 was acked by the maintainer 9/10/11 were not.

I should be able to post v21 tomorrow.  Just need to finish making 
changes and test them

Dan


>> Best regards,
>>                                     Pavel
