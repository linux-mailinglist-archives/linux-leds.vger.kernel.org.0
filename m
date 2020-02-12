Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D166315A9D1
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2020 14:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727732AbgBLNOH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Feb 2020 08:14:07 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58242 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727662AbgBLNOH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Feb 2020 08:14:07 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01CDE3Cw046651;
        Wed, 12 Feb 2020 07:14:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581513243;
        bh=pWvehROhyzqlYPUoIwnFewaNSzBZhFyj02g/FxkBm0c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=r3mB5w5Trj+c93oPVqyxOjgh3j1DKJGiWugmtwCE32CxAIqos+/M5xfuKMbsSfVsz
         b+1ezAWzJIC3CAR90xsmCaS6eGk9yn9bPCCBvhh3OsTj1G0CV2aCZWDrhuMjBkdYrn
         /eMq2t+G7u9v1VYYFo8G9BOMaKJ5peRZ2PPyQGYo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01CDE2oj004100
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Feb 2020 07:14:03 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 12
 Feb 2020 07:14:02 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 12 Feb 2020 07:14:02 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01CDE2mV068653;
        Wed, 12 Feb 2020 07:14:02 -0600
Subject: Re: [RESEND PATCH v17 00/17] Multi Color LED Framework
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200127150032.31350-1-dmurphy@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com>
Date:   Wed, 12 Feb 2020 07:09:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127150032.31350-1-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 1/27/20 9:00 AM, Dan Murphy wrote:
> Hello
>
> This is a re-send of the v17 multi color LED framework.  I removed the last
> patch from the series.  In addition I rebased this series on Pavel's for-next
> LED branch and added all ACKs from the list.
>
> Dan
>
> Dan Murphy (17):
>    dt-bindings: leds: Add multicolor ID to the color ID list
>    leds: Add multicolor ID to the color ID list
>    leds: multicolor: Introduce a multicolor class definition
>    dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
>    leds: lp50xx: Add the LP50XX family of the RGB LED driver
>    dt: bindings: lp55xx: Be consistent in the document with LED acronym
>    dt: bindings: lp55xx: Update binding for Multicolor Framework
>    ARM: dts: n900: Add reg property to the LP5523 channel node
>    ARM: dts: imx6dl-yapp4: Add reg property to the lp5562 channel node
>    ARM: dts: ste-href: Add reg property to the LP5521 channel nodes
>    leds: lp55xx: Convert LED class registration to devm_*
>    leds: lp55xx: Add multicolor framework support to lp55xx
>    leds: lp5523: Update the lp5523 code to add multicolor brightness
>      function
>    leds: lp5521: Add multicolor framework multicolor brightness support
>    leds: lp55xx: Fix checkpatch file permissions issues
>    leds: lp5523: Fix checkpatch issues in the code
>    dt: bindings: Update lp55xx binding to recommended LED naming

I have no open comments on this patchset except for a DT change 
requested by Shawn Gao but this change should wait till after this 
patchset is merged.

Is there something holding this up?

Dan


