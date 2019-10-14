Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C203DD6089
	for <lists+linux-leds@lfdr.de>; Mon, 14 Oct 2019 12:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731305AbfJNKtO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Oct 2019 06:49:14 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52200 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731235AbfJNKtO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Oct 2019 06:49:14 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9EAnA94083798;
        Mon, 14 Oct 2019 05:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571050150;
        bh=CO22/vweVUdYki61a8n0uM9ME48CwXyB/hDV+RVN4oU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=RMjhVzS3ImQaDnsTaTt16b6L6ZSW7UhdttuuVGxn90u2Om5Fkhb90WXomFar68Hha
         oFaX03A70w7ylblGHwmKMRcgXAAcUeuzwnK3oPNU4ai0AfmuAhwoxk2EGXqOZnBn1n
         fzqfwk2Dde2zfqpLClBSoxnudBYWyzCsjsAfsGoI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9EAnA5F129483
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 14 Oct 2019 05:49:10 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 14
 Oct 2019 05:49:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 14 Oct 2019 05:49:04 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9EAn8ft120141;
        Mon, 14 Oct 2019 05:49:08 -0500
Subject: Re: [PATCH v5 3/3] leds: Add control of the voltage/current regulator
 to the LED core
To:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     <daniel.thompson@linaro.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dmurphy@ti.com>,
        <tomi.valkeinen@ti.com>
References: <20190923102059.17818-1-jjhiblot@ti.com>
 <20190923102059.17818-4-jjhiblot@ti.com>
 <3e648fab-638f-4aa0-dda9-8ddba6562751@gmail.com> <20191013120937.GK5653@amd>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <eb8c0df1-0d5b-11d0-9965-3192fa5675f3@ti.com>
Date:   Mon, 14 Oct 2019 12:49:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191013120937.GK5653@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 13/10/2019 14:09, Pavel Machek wrote:
> Hi!
>
>> I must say I'm not a big fan of this change.
>> It adds a bunch of code to the LED core and gives small
>> functionality in a reward. It may also influence maximum
>> software blinking rate, so I'd rather avoid calling
>> regulator_enable/disable when timer trigger is set.
>>
>> It will of course require more code.
>>
>> Since AFAIR Pavel was original proponent of this change then
>> I'd like to see his opinion before we move on to discussing
>> possible improvements to this patch.
> Was I?
>
> Okay, this series looks quite confusing to me. First, 1/3 looks
> "interesting" (would have to analyze it way more).
>
> Second, 3/3... So we have a LED driver _and_ a regulator? So yes, the
> chip driving a LED is usually ... voltage/current regulator. What is
> second regulator doing there? Is that a common setup?

This is quite common with current-sink LED drivers.

The setup looks like this:

+-----------+
|           |
| Regulator |
|           +------------------------+
|           |                        |
+-----------+                      __|__
                                    \   /
          +---------------------+    \ / led
          |                     |     V
          |    Led Driver       |   --+--
          |                     |     |
          |                     |     |
          |                +----------+
          |              \      |
          |               \     |
          |                +    |
          |                |    |
          +---------------------+
                           |
                        +--+--+
                        ///////


Only the regulator usually does not supply only one LED.

JJ


>
> Best regards,
> 								Pavel
> 								
