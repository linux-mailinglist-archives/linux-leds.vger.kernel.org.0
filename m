Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B66E82748E1
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 21:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgIVTM5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 15:12:57 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33406 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgIVTMz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 15:12:55 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08MJClHt107258;
        Tue, 22 Sep 2020 14:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600801967;
        bh=y4/JxdSatLeQsQ0g5+/LJy1SK1eOoFkr7iJzasfQCcI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=w7g5bM9ehNsrvh/PBtZobH06E9p+rTEJJtGjN1SsXyzBwL26dtCRk6cn5x0sG8PWM
         YoOTakenx+CL28KdWCWajdrEIyB5DxKF4k6VVnxDq4x9djHgif2tpeVvN3uswk++R5
         5fWA8yCcQoGRfdpzCmXeNeg2OdNSy7Et+/kIfjhU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08MJClw3126503
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Sep 2020 14:12:47 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 22
 Sep 2020 14:12:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 22 Sep 2020 14:12:46 -0500
Received: from [10.250.36.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08MJCk4C060038;
        Tue, 22 Sep 2020 14:12:46 -0500
Subject: Re: [PATCH leds v3 2/9] leds: lm36274: don't iterate through children
 since there is only one
To:     Marek Behun <marek.behun@nic.cz>
CC:     <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
References: <20200919180304.2885-1-marek.behun@nic.cz>
 <20200919180304.2885-3-marek.behun@nic.cz>
 <a2db44c8-9153-3b0e-b3fe-cb96821116ab@ti.com>
 <20200922175856.7efeb161@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <35780840-fd1e-2a51-c338-b568345c254d@ti.com>
Date:   Tue, 22 Sep 2020 14:12:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922175856.7efeb161@nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 9/22/20 10:58 AM, Marek Behun wrote:
> On Tue, 22 Sep 2020 10:42:49 -0500
> Dan Murphy <dmurphy@ti.com> wrote:
>
>> <snip>
>> Question is this device on a piece of hardware you are testing on?
> No, unfortunately. But this driver is rather simple, in comparison to
> the others.
>
> As Linus said:
>    "If it compiles, it is good; if it boots up, it is perfect."
> :D
>
> So if someone tested it, it would be perfect.

Not sure how a comment made in 1998 applies to the state of the kernel 
today.

With this much change to the driver there should have been some level of 
functional testing.

So I pulled out my hardware and gave it a whirl. Gave my TB on the 
LM36274 patches.

Dan

