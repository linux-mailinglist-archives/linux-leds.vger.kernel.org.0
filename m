Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3E80123322
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 18:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbfLQREZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 12:04:25 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49488 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbfLQREZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Dec 2019 12:04:25 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHH4G98059831;
        Tue, 17 Dec 2019 11:04:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576602256;
        bh=c5aNDJdm202QVz/ei0pWBemlPhzJ5FDI2ojZ/hTof/o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ldwTZP2cZVtzeLKa5fQRMrGwhb6feqtwReIfenzbmy3hJD6PwxgDbf31IH1a4daAm
         MPmbDOcKX/gwjUb9z4sivTnO/cRw+dujLC658BTWxRMaaADnTVDiAD1ISgcHEBlWH+
         3syxJb63H6OrRvq5fCJTWNlXewsYk9jJJCa7G7qo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHH4F5f018559;
        Tue, 17 Dec 2019 11:04:15 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 11:04:15 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 11:04:15 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHH4F6D060212;
        Tue, 17 Dec 2019 11:04:15 -0600
Subject: Re: [PATCH 2/2] leds: lm3692x: Allow to set ovp and brigthness mode
To:     =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <cover.1576499103.git.agx@sigxcpu.org>
 <9c87a17aefbf758d58f199f7046114ee7505a1fa.1576499103.git.agx@sigxcpu.org>
 <3d66b07d-b4c5-43e6-4378-d63cc84b8d43@ti.com>
 <20191217154059.GA3929@bogon.m.sigxcpu.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <1c233937-5d99-bd9d-b8ac-290fca8305d5@ti.com>
Date:   Tue, 17 Dec 2019 11:01:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217154059.GA3929@bogon.m.sigxcpu.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Guido

On 12/17/19 9:40 AM, Guido Günther wrote:
> Hi Dan,
> On Tue, Dec 17, 2019 at 06:53:45AM -0600, Dan Murphy wrote:
>> Guido
>>
>> On 12/16/19 6:28 AM, Guido Günther wrote:
>>> Overvoltage protection and brightness mode are currently hardcoded
>>> as disabled in the driver. Make these configurable via DT.
>> Can we split these up to two separate patch series?
> Sure, should the binding doc updates be split as well?

Yes.

<snip>
>> extra debug statement
> They're not extra but meant to ease debugging the driver long therm but
> i can drop these if that's not wanted. The rest makes a lot of sense.
> Thanks a lot for having a look so promptly!

Yes please remove those we don't need extra noise in the log.

If someone wants to debug this then they can add the statements themselves

Dan

