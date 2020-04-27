Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 131D81BA7A0
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 17:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728214AbgD0POF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 11:14:05 -0400
Received: from foss.arm.com ([217.140.110.172]:36874 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728252AbgD0POD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Apr 2020 11:14:03 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA71A31B;
        Mon, 27 Apr 2020 08:14:02 -0700 (PDT)
Received: from [10.57.33.170] (unknown [10.57.33.170])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9BCC3F68F;
        Mon, 27 Apr 2020 08:14:00 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: rk3399-roc-pc: Fix MMC
 numbering for LED triggers
To:     Johan Jonker <jbx6244@gmail.com>, Chen-Yu Tsai <wens@kernel.org>
Cc:     devicetree <devicetree@vger.kernel.org>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Pavel Machek <pavel@ucw.cz>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>, jacek.anaszewski@gmail.com,
        linux-leds@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        dmurphy@ti.com
References: <20200427073132.29997-3-wens@kernel.org>
 <684132b8-4a84-8295-474b-38ccb992bba7@gmail.com>
 <CAGb2v66Piu5_2bdqvWV3eEn2Se_y1MNKWvvYBv_J7DA-8jBhbQ@mail.gmail.com>
 <65d15254-08da-895c-1a0c-ef6ce231b620@gmail.com>
 <CAGb2v65fGYguNoksq5Dyx3HTKeYg+U82TiQSL+NO8AUcQJQj5w@mail.gmail.com>
 <74a984fc-ce57-211b-936c-2d77e2e642bb@gmail.com>
 <a81840d3-813b-51b5-767c-e0d9d270200e@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <94e7671f-2d11-b2f7-e049-b90893c61ab2@arm.com>
Date:   Mon, 27 Apr 2020 16:13:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a81840d3-813b-51b5-767c-e0d9d270200e@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2020-04-27 3:12 pm, Johan Jonker wrote:
> Hi,
> 
>>> So for fixing up the LED node names, we'd probably want the following:
>>>
>>>      diy_led: led-0
>>>      yellow_led: led-1
>>>      work_led: led-2
> 
> Change proposal for led nodes to comply with preexisting dts.
> Does this work?
> 
> diy_led: led_0: led-0
> yellow_led: led_1: led-1
> work_led: led_2: led-2

Yuck, why?

Labels are simply human-readable source annotations for the sake of 
referencing nodes more easily. Meaningful label names - that correlate 
to SoC or board components, schematic names, or physical labels on the 
board/device - make the DT sources easier to read, review, and maintain. 
There are a handful of cases where one node might have multiple labels, 
e.g. if two logical supply nets come from the same regulator on certain 
board variants, but there is zero point in defining redundant labels 
that just meaninglessly echo the DT's own structure.

> blue: led_0: led-0
> 
> A check does not give any warnings.

I should hope not. Labels are there to be consumed by DT compilers (and 
whatever symbolic overlay handlers count as... DT linkers, maybe?) - 
they have no business being within the scope of the bindings that define 
a contract for system software consuming the final DTB.

Robin.

> make -k ARCH=arm dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/leds/leds-gpio.yaml
> 
>>
>> That doesn't look pretty either.
>> Would like to hear the maintainers view on how to handle other cases
>> without 'led' like for example 'blue' for mk808.
>>
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 
