Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5000C7B480
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jul 2019 22:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbfG3UrU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Jul 2019 16:47:20 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33236 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfG3UrU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Jul 2019 16:47:20 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6UKlFCF031501;
        Tue, 30 Jul 2019 15:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564519635;
        bh=W0eIrXgUXVJVC0L41Jr1FWqaVp0jy4+CVqlEc8ChDGM=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=rnR2lQYI9jUo5VbXR8XPmiZpzSiTugTY7sF/4wMOtxsWME2t/WjMjmHxMRNcQNWLs
         SgQ+U83Gxrgd2J6uu87qZ4pVxi6O6Qm9VJFFwJVAZS99V1iQccYkz9f0+bJycduMK1
         uJacT+VKeCgkuUtAfW+8pAzT3xayLg3sc1ulfeQQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6UKlFtj067167
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Jul 2019 15:47:15 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Jul 2019 15:47:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Jul 2019 15:47:14 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6UKlEH9097780;
        Tue, 30 Jul 2019 15:47:14 -0500
Subject: Re: LEDs next branch
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>
References: <99b075d0-e230-35bc-06c5-712a69fab91d@ti.com>
 <5be9a3a2-810b-c08a-e631-b7afa005a136@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <aa841c27-d3af-01bf-6a90-afeea83e3775@ti.com>
Date:   Tue, 30 Jul 2019 15:47:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5be9a3a2-810b-c08a-e631-b7afa005a136@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 7/30/19 3:30 PM, Jacek Anaszewski wrote:
> Hi Dan,
>
> On 7/30/19 8:40 PM, Dan Murphy wrote:
>> Jacek
>>
>> Did you see/fix this on the led-next branch?
>>
>> I saw this when booting trying to fix the lm3532
>>
>> [    8.651461] led_class: exports duplicate symbol
>> devm_led_classdev_register_ext (owned by kernel)
>>
>> [    8.730063] led_class: exports duplicate symbol
>> devm_led_classdev_register_ext (owned by kernel)
> I've just tried next-20190730 and haven't noticed anything like that.
> I've checked both with driver compiled-in and loaded as a module.
>
> Tested on qemu versatile board, with tweaked versatile-pb.dts
> to include lm3532 DT node.
>
> There is one issue currently in next but seems to be irrelevant and
> can be fixed with [0].

Thanks for checking I will see if I can track it down.

Dan


> [0] https://lkml.org/lkml/2019/7/22/720
>
