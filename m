Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A371B116DDE
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2019 14:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727299AbfLINZL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Dec 2019 08:25:11 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51938 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbfLINZL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Dec 2019 08:25:11 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9DP4Ak043018;
        Mon, 9 Dec 2019 07:25:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575897904;
        bh=p3a8tPlZJkmOYLEuEyzmo12XXstU5QdxohJApJwEKlY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ionqYPLpnEmJ7xs505HpdIJCH0ryyxg07Qeb9Eq01Hv7V5qFx60vSLj2B/52Cqf+t
         UZ/k0PR9jDF5tdoG/sENPbStp35fR7umPoaS9oekqEBkqc1IOi3q7CNPjIsjjDTONX
         /1CY+tFAqMOYBLbxFWmkPMQCsxQhdB6f843xBfZI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB9DP4kf085127
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Dec 2019 07:25:04 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 07:25:03 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 07:25:03 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9DP2te064237;
        Mon, 9 Dec 2019 07:25:02 -0600
Subject: Re: [PATCH v17 00/19] Multicolor Framework
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191114133023.32185-1-dmurphy@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <6f8072b0-62a5-292f-930c-cd3fb7d40fea@ti.com>
Date:   Mon, 9 Dec 2019 07:22:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191114133023.32185-1-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 11/14/19 7:30 AM, Dan Murphy wrote:
> Hello
>
> Simple fix in the multicolor code where the extended registration call was not
> called in the devm_* function
>
> Thanks Martin F. for finding this issue.
>
> Hopefully this will be pulled in for the 5.5 merge window.
>
> Dan
>
> Dan Murphy (19):
>    dt: bindings: Add multicolor class dt bindings documention
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
>    leds: lp55xx-common: Remove extern from lp55xx-common header

Are these going to be pulled in for 5.6?

I need to post the changes requested by Shawn on the DT but would like 
to do it against the leds-next tree.

Dan
