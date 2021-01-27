Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D686305189
	for <lists+linux-leds@lfdr.de>; Wed, 27 Jan 2021 05:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234704AbhA0E5M (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 Jan 2021 23:57:12 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11601 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S316661AbhA0Bja (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 Jan 2021 20:39:30 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DQR6X5XNFz15sSR;
        Wed, 27 Jan 2021 09:37:08 +0800 (CST)
Received: from [127.0.0.1] (10.174.176.220) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Wed, 27 Jan 2021
 09:38:16 +0800
Subject: Re: [PATCH v2] dt-bindings: leds: Document commonly used LED triggers
To:     Rob Herring <robh@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <dmurphy@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20201210082449.30586-1-manivannan.sadhasivam@linaro.org>
 <20201214223621.GA2493849@robh.at.kernel.org>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <30f805f7-81c0-49e5-7ad6-7509ad0b4b4a@huawei.com>
Date:   Wed, 27 Jan 2021 09:38:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201214223621.GA2493849@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.220]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Manivannan:
  Do you have time to prepare v3? Hope it can be applied into v5.12


On 2020/12/15 6:36, Rob Herring wrote:
> On Thu, Dec 10, 2020 at 01:54:49PM +0530, Manivannan Sadhasivam wrote:
>> This commit documents the LED triggers used commonly in the SoCs. Not
>> all triggers are documented as some of them are very application specific.
>> Most of the triggers documented here are currently used in devicetrees
>> of many SoCs.
> 
> The idea with recent LED binding changes is to move away from 
> 'linux,default-trigger' to 'function' and 'trigger-sources' and to have 
> some sort of standardized names.
> 
>>
>> While at it, let's also sort the triggers in ascending order.
> 
> I'm not sure we want that. Probably better to keep related functions 
> together.
> 
>>
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> ---
>>
>> Changes in v2:
>>
>> * Added more triggers, fixed the regex
>> * Sorted triggers in ascending order
>>
>>  .../devicetree/bindings/leds/common.yaml      | 78 ++++++++++++++-----
>>  1 file changed, 60 insertions(+), 18 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
>> index f1211e7045f1..3c2e2208c1da 100644
>> --- a/Documentation/devicetree/bindings/leds/common.yaml
>> +++ b/Documentation/devicetree/bindings/leds/common.yaml

