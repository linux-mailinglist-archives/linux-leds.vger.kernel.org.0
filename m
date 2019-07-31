Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C26047CD1D
	for <lists+linux-leds@lfdr.de>; Wed, 31 Jul 2019 21:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbfGaTta (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 31 Jul 2019 15:49:30 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55684 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbfGaTta (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 31 Jul 2019 15:49:30 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6VJnQoD054130;
        Wed, 31 Jul 2019 14:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564602566;
        bh=90qhXSlmHXE2mbrpuN9h3XFGjfZAIqDGl2c4Qk/xiJ4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=qyvp3QZBPi2dl7InlHaHt7M4L83Cktnov0SsQ4bPIbdEJJGxDrU6Pgd2enU1ciyBT
         Tm0V+cznRgePDnUZb8RcclnnfHEWSr6FTHU+MHjwsX9EKZktuz4sWBHo4Ms9nlUSr0
         olmPsdgfS2zV7jFoux9Z0+P7v3hkL6pAoCoTmRts=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6VJnQpa129497
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 31 Jul 2019 14:49:26 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 31
 Jul 2019 14:49:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 31 Jul 2019 14:49:25 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6VJnPxj090663;
        Wed, 31 Jul 2019 14:49:25 -0500
Subject: Re: [PATCH v4 9/9] leds: Update the lp55xx to use the multi color
 framework
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190725182818.29556-1-dmurphy@ti.com>
 <20190725182818.29556-10-dmurphy@ti.com>
 <fe3bbfbe-5b15-d87a-f4a1-28167081046b@gmail.com>
 <486308e9-e3e1-5f34-5af7-217527f2f1f9@ti.com>
 <310ce737-df38-766c-b24a-17c26c5f9ab6@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <06c65f10-26d9-42aa-3dfa-19f2b8b1e413@ti.com>
Date:   Wed, 31 Jul 2019 14:49:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <310ce737-df38-766c-b24a-17c26c5f9ab6@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 7/31/19 2:45 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 7/31/19 8:55 PM, Dan Murphy wrote:
>> Jacek
>>
>> Thanks for looking
> You're welcome.
> [...}

> I don't see any parsing for color here but I suppose that I can add that
> now
> I thought about that occurrence in lp5xx_parse_channel_child().

No that is color of the child subnode.  These will be the actual color.

But we can check the color of the child node to the parent node and if 
that is MULTI_ID

then process it as a multi color interface.

Dan


> [...]
>
