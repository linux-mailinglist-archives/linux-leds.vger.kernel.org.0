Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65E34033D2
	for <lists+linux-leds@lfdr.de>; Wed,  8 Sep 2021 07:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243218AbhIHFbP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Sep 2021 01:31:15 -0400
Received: from gecko.sbs.de ([194.138.37.40]:38347 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229523AbhIHFbO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 8 Sep 2021 01:31:14 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 1885TrUL014177
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 8 Sep 2021 07:29:54 +0200
Received: from [167.87.38.78] ([167.87.38.78])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1885TqKL012102;
        Wed, 8 Sep 2021 07:29:52 +0200
Subject: Re: [PATCH 1/3] leds:triggers:Extend the kernel panic LED trigger
To:     chaochao2021666 <chaochao2021666@163.com>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        464759471@qq.com, chao zeng <chao.zeng@siemens.com>
References: <20210906135320.23134-1-chaochao2021666@163.com>
 <20210907142018.45b2d114@dellmb>
 <12734c2f.116c.17bc3147806.Coremail.chaochao2021666@163.com>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <69207a27-e66f-425b-861f-c2fb1c8ab65d@siemens.com>
Date:   Wed, 8 Sep 2021 07:29:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <12734c2f.116c.17bc3147806.Coremail.chaochao2021666@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 08.09.21 03:45, chaochao2021666 wrote:
> Dear Marek
> 
> 
> For other types of led could be set at the userspace level. But for the
> panic,
> maybe it would trigger at kernel space during the kernel boot up.
> 
> And currently only blink to indicate the error. we need more kinds of
> type to indicate the error.
> 
> we have two leds in the panic trigger group, all in the panic only one
> behavior-- blink.
> we need different panic led behavior, so extend the led behavior. I
> think add more types of 
> LED behavior could be helpful.
> 

To make it even clearer, there are three issues to solve for us:

One is that we have two LEDs mixing a color, red and green, and the
obviously desired panic color it red, not orange.

The other is that the desired state in an error case is non-blinking,
just on (in line with what our U-Boot will do in case the boot fails).

And as we need that behavior prior to userspace, it should be
configurable via DT. But that does not exclude extending the sysfs
interface as well with the new options.

Jan

> BRs
> Chao
> 
> 
> At 2021-09-07 20:20:18, "Marek Behún" <kabel@kernel.org> wrote:
>>On Mon,  6 Sep 2021 21:53:18 +0800
>>chaochao2021666@163.com wrote:
>>
>>> From: chao zeng <chao.zeng@siemens.com>
>>> 
>>> This commit extend panic trigger, add two new panic trigger
>>> "panic_on" and "panic_off" and keep the "panic" compatible with
>>> "panic_blink".
>>> 
>>> All the led on the "panic_on" would light and on
>>> the "panic_off" would turn off
>>
>>We don't wont gazillion triggers, each for every possible setting.
>>
>>Instead extend the existing panic trigger to have another sysfs setting
>>where you can set this behavior.
>>  echo panic >trigger
>>  echo blink >on_panic
>>So the on_panic file can accept "on", "off" or "blink".
>>
>>Alternatively a pattern could be set as in the ledtrig-pattern trigger.
>>
>>Also your patches do not use correct spacing in commit titles:
>>  leds:triggers:Extend the kernel panic LED trigger
>>should instead be
>>  leds: triggers: Extend the kernel panic LED trigger
>>
>>Marek
> 

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
