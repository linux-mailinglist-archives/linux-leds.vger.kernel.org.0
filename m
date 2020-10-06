Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC39C284B8E
	for <lists+linux-leds@lfdr.de>; Tue,  6 Oct 2020 14:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgJFMVz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 08:21:55 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52534 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgJFMVy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 08:21:54 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 096CLMDW003646;
        Tue, 6 Oct 2020 07:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601986882;
        bh=Ajt9ibuYrJxtVllMh28OvHRU7fjyVHlUBUr+BALwdGs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vjTotTy8fD+GFfa5PqIra/Wgd42xLpEb8rqt+cIIuxIvEzDwCcl7dW9AIdXypsbDC
         8KJfms0fnZnQULMjPVVVzkSmLN3+r9Fr9UUKHesfas9gv/wCUZDlQid4GrtP/81iZo
         4fyMyV6L09NRrncvMcW0zk2uMdDQkfy1V99w0gXw=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 096CLMij011343
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 6 Oct 2020 07:21:22 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 6 Oct
 2020 07:21:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 6 Oct 2020 07:21:19 -0500
Received: from [10.250.37.2] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 096CLJFt060768;
        Tue, 6 Oct 2020 07:21:19 -0500
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
To:     <ultracoolguy@tutanota.com>, Marek Behun <kabel@blackhole.sk>
CC:     Pavel <pavel@ucw.cz>, Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
References: <20201005141334.36d9441a@blackhole.sk> <MIt2NiS--3-2@tutanota.com>
 <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com> <MItBqjy--3-2@tutanota.com>
 <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com> <MItOR9Z--3-2@tutanota.com>
 <20201005164808.slrtmsvmw4pvwppm@falbala.internal.home.lespocky.de>
 <MItjEho--3-2@tutanota.com> <20201005173227.GA6431@duo.ucw.cz>
 <20201006093356.6d25b280@blackhole.sk> <MIxm3uX--3-2@tutanota.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <144aa75a-4369-cd81-d7dc-2354a9afd7c5@ti.com>
Date:   Tue, 6 Oct 2020 07:21:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <MIxm3uX--3-2@tutanota.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

All

On 10/6/20 6:59 AM, ultracoolguy@tutanota.com wrote:
> While I do agree with you that having the child nodes be led strings make more sense, would it be possible to have, for example, three strings controlled by the same label?
>
> Oct 6, 2020, 07:33 by kabel@blackhole.sk:
>
>> By the way I just realized that the DT binding in this driver seems
>> incorrect to me.
>>
>> The controller logically supports 3 LED strings, each having
>> configurable control bank.

There are two control banks. You can connect the HVLED outputs to either 
control bank A or B there is no individual control of the LED strings.


>> But the DT binding supports 2 DT nodes, one for each control bank
>> (identified by the `reg` property) and then `led-sources` says which
>> string should be controlled by given bank.
>>
>> But taking in mind that DT should describe how devices are connected to
>> each other, I think the child nodes in the binding should instead
>> describe the 3 supported LED strings...

The outputs in this case are virtual outputs which are the banks (A and B).

Since the device is bank controlled the actual current sinks are not 
defined thus making the the banks the actual outputs.

This is why the 'reg' property defines the control bank either A or B 
and the led-sources indicates the strings associated with the control bank.

Dan

