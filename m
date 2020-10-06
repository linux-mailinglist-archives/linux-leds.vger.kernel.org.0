Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4435284E7F
	for <lists+linux-leds@lfdr.de>; Tue,  6 Oct 2020 16:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgJFO5n (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 10:57:43 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34000 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgJFO5m (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 10:57:42 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 096EvEHl066887;
        Tue, 6 Oct 2020 09:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601996234;
        bh=D+ChOhB+AfJxgSDQ+PmqxBkAIxeL/6UfLxXNmbUHsxw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ZxnQJvnyS7O572pbM9fxPXBgcOolZfLh9kZBwFcJ2hNDV4mGYywW/L4+E2Jz9e35x
         K3S+Yw7Fi6bbOeL7DKO9IKu2pyZ8OmK7i3gTByngylp+XtTsrVUS44WX24GFRU+psM
         9kEI3fMeiCyX2EYOwmsi0KPJAVXPz1QWwm7ZjCXg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 096EvEJJ102393
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 6 Oct 2020 09:57:14 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 6 Oct
 2020 09:57:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 6 Oct 2020 09:57:13 -0500
Received: from [10.250.37.2] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 096EvDoG055947;
        Tue, 6 Oct 2020 09:57:13 -0500
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
To:     Marek Behun <kabel@blackhole.sk>
CC:     <ultracoolguy@tutanota.com>, Pavel <pavel@ucw.cz>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
References: <20201005141334.36d9441a@blackhole.sk> <MIt2NiS--3-2@tutanota.com>
 <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com> <MItBqjy--3-2@tutanota.com>
 <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com> <MItOR9Z--3-2@tutanota.com>
 <20201005164808.slrtmsvmw4pvwppm@falbala.internal.home.lespocky.de>
 <MItjEho--3-2@tutanota.com> <20201005173227.GA6431@duo.ucw.cz>
 <20201006093356.6d25b280@blackhole.sk> <MIxm3uX--3-2@tutanota.com>
 <144aa75a-4369-cd81-d7dc-2354a9afd7c5@ti.com>
 <20201006164101.2c3fa0d7@blackhole.sk>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <85515ccd-3431-4565-eaad-3e1d116bf89f@ti.com>
Date:   Tue, 6 Oct 2020 09:57:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006164101.2c3fa0d7@blackhole.sk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 10/6/20 9:41 AM, Marek Behun wrote:
> Adding Rob to Cc, Rob, could we have your opinion on this? Mine is below.
>
> Dan, I looked at the datasheet, I understand this.
>
> Nonetheless, device tree should describe how devices are connected to
> each other. The chip has 3 pins for 3 LED strings.
>
> If this controller should be able to support 3 LED strings via 3
> outputs, the device tree binding nodes should, in my opinion, describe
> each pin connected string. The nodes should maybe even be called
> 'led-string@N' where N is from [0, 1, 2].
>
> The fact that the device is bank controlled and there are only two
> banks (and it is configurable by which bank each LED string is
> controlled) is more relevant to the driver, not as much to device tree
> binding.
>
> But yes, I do realize that if we had 3 child nodes, and the driver
> created 3 LEDs, then changing brithrness on one of the 3 LEDs would
> change brightness on at least another one, which we do not want.
>
> Maybe this driver could parse these 3 `led-string` nodes, each having
> defined bank via `led-sources`, and then register LED classdevs for
> each bank that is mentioned. This way the device tree would be more
> correct, IMO, and the driver would not have the problem mentioned in
> the paragraph above.

Unfortunately we cannot and should not change the ABI now.

Using the led-sources as the bank indicator does not conform to the 
definition of the description of the led-sources in the yaml.

The preference was to use the led-sources to define the LED out to the bank.

Here is the conversation on how the driver got to where it is.

https://lore.kernel.org/patchwork/patch/972337/

Dan


