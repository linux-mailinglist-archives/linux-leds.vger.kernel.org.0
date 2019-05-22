Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C93625B62
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 02:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbfEVAyJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 May 2019 20:54:09 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:51918 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbfEVAyJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 May 2019 20:54:09 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4M0rrNi104919;
        Tue, 21 May 2019 19:53:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558486433;
        bh=64tMQrAiwm3hei2eRN/7GchhSAwDNydo9l0KJu+r9+U=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dF1ZqMn2aoGlrvNL4lHcpk79UeWJYebjo1j/YywbCyhukwMNBLotx+PDPNVeUNxzb
         mwM6HTEJZsHDJ2O8aXSG5G2tdmpfH2l5QcC6QDKbNzQJBDV8oX8BcHxZwL3Jf3duAn
         Ufi2WPfcCaskqh9SCCAiSNLL+j0OQvP3CCjaB9VY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4M0rr6i049645
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 May 2019 19:53:53 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 21
 May 2019 19:53:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 21 May 2019 19:53:53 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4M0rq2m075698;
        Tue, 21 May 2019 19:53:52 -0500
Subject: Re: [PATCH] dt-bindings: backlight: lm3630a: correct schema
 validation
To:     Daniel Thompson <daniel.thompson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Brian Masney <masneyb@onstation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Jonathan Marek <jonathan@marek.ca>
References: <20190520085846.22320-1-masneyb@onstation.org>
 <CAL_JsqLcycH5e=YT-4AQFo-8O0bosjU7oagCRS5CMTfQNBLrcg@mail.gmail.com>
 <20190520133007.gymbonmq635gp73b@holly.lan>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <6bc54c69-0c7b-69e5-6dce-aef631e20247@ti.com>
Date:   Tue, 21 May 2019 19:53:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520133007.gymbonmq635gp73b@holly.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 5/20/19 8:30 AM, Daniel Thompson wrote:
> On Mon, May 20, 2019 at 08:14:03AM -0500, Rob Herring wrote:
>> On Mon, May 20, 2019 at 3:59 AM Brian Masney <masneyb@onstation.org> wrote:
>>>
>>> The '#address-cells' and '#size-cells' properties were not defined in
>>> the lm3630a bindings and would cause the following error when
>>> attempting to validate the examples against the schema:
>>>
>>> Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dt.yaml:
>>> '#address-cells', '#size-cells' do not match any of the regexes:
>>> '^led@[01]$', 'pinctrl-[0-9]+'
>>>
>>> Correct this by adding those two properties.
>>>
>>> While we're here, move the ti,linear-mapping-mode property to the
>>> led@[01] child nodes to correct the following validation error:
>>>
>>> Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dt.yaml:
>>> led@0: 'ti,linear-mapping-mode' does not match any of the regexes:
>>> 'pinctrl-[0-9]+'
>>>
>>> Fixes: 32fcb75c66a0 ("dt-bindings: backlight: Add lm3630a bindings")
>>> Signed-off-by: Brian Masney <masneyb@onstation.org>
>>> Reported-by: Rob Herring <robh+dt@kernel.org>
>>> ---
>>>  .../leds/backlight/lm3630a-backlight.yaml     | 20 +++++++++++++------
>>>  1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> 

Acked-by: Dan Murphy <dmurphy@ti.com>
