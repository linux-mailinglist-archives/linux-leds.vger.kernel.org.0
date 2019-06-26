Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B049156D52
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2019 17:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbfFZPKS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Jun 2019 11:10:18 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38222 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbfFZPKR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Jun 2019 11:10:17 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QFA9b8033991;
        Wed, 26 Jun 2019 10:10:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561561809;
        bh=7KzFLKKOy6sse6dOzr9SLHFoRrhwMJ74FIgRt9HW4LA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=yrrOpOMGJusC7cM0Sm02xR5f7W6WS5Ve8/F6HNqewPM0jQFmd4Ob4F/67Avp7FR7g
         UFnsRKWwtpp+xYeaYG9CiTsDcbLUQJVt4NWxiYdA2WVZIa0ud+7llLBqNLi0jJJ/6F
         RQwg6ytpbUUgVbjebfko2xrHPc0LgUASWi8yEApg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QFA9Rr096790
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Jun 2019 10:10:09 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 26
 Jun 2019 10:10:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 26 Jun 2019 10:10:09 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5QFA8U9053384;
        Wed, 26 Jun 2019 10:10:09 -0500
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
To:     Pavel Machek <pavel@ucw.cz>,
        Daniel Thompson <daniel.thompson@linaro.org>
CC:     Brian Dodge <bdodge09@gmail.com>, <lee.jones@linaro.org>,
        <jingoohan1@gmail.com>, <jacek.anaszewski@gmail.com>,
        <robh+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <pbacon@psemi.com>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
 <20190625085534.xf2ullyju3ewbgik@holly.lan>
 <CAFaGBPnH=75=wJRM4EX9MYR8MSehEa2_hBEOsqo-DZvD6c6f_A@mail.gmail.com>
 <20190626105614.ujmryi7qou2ra7aq@holly.lan>
 <20190626145624.GC22348@xo-6d-61-c0.localdomain>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <fd27a6a5-c4c6-6ddb-7faf-b866a58e0794@ti.com>
Date:   Wed, 26 Jun 2019 10:09:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190626145624.GC22348@xo-6d-61-c0.localdomain>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 6/26/19 9:56 AM, Pavel Machek wrote:
> On Wed 2019-06-26 11:56:14, Daniel Thompson wrote:
>> On Tue, Jun 25, 2019 at 07:44:06AM -0400, Brian Dodge wrote:
>>> I would like to deprecate the old prefix in the future after communicating
>>> with all chip customers, which is why the old prefix is not documented in
>>> the new bindings.
>> Deprecation is fine (by me at least) it's just that I'm not sure that
>> removing the documentation for the deprecated bindings is the right way
>> to do it. What is the prior art here?
> I believe we should keep the docs.

I agree with Pavel on keeping the docs.

Keep the doc but mark the properties as deprecated since they are not 
removed from

the code

Dan


> 								Pavel
