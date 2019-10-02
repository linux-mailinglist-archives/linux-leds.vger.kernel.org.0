Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A02FC8D6B
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 17:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729087AbfJBPws (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 11:52:48 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56962 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728735AbfJBPwr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 11:52:47 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92FqiDY000525;
        Wed, 2 Oct 2019 10:52:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570031564;
        bh=jUwzOTACrW4PgJU67Xj0iedFoATHNagNtWCjRbCTGg0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=kJROyQbdRzOnGD8xqRmwuWaE8GP2RkagkiXIDSSmL4jACJBGB1QY6IPN9JjRd647L
         3rOJqwGdJATRp8WSlIbgjcWmyrlXajXZZIX/2m35QqVyitzbW7MvDa3ODfH4jSv2Nj
         FONyyKi9utgfh2J9SDB5RmpcPFwEH8BELIDOQ3Nk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92Fqi3I024303
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 10:52:44 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 10:52:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 10:52:44 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92Fqhmi099976;
        Wed, 2 Oct 2019 10:52:44 -0500
Subject: Re: [PATCH v10 00/16] Multicolor Framework
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191001145620.11123-1-dmurphy@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3092db49-04de-4a3d-1562-e4728f000e53@ti.com>
Date:   Wed, 2 Oct 2019 10:53:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001145620.11123-1-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 10/1/19 9:56 AM, Dan Murphy wrote:
> Hello
>
> I have updated the code per v9 review comments
> https://lore.kernel.org/patchwork/project/lkml/list/?series=411824

I have a v11 version ready to go would like to include any v10 comments

So v11 changes include

- Adding inline MC framework functions for devices that do not have a 
direct dependency on the MC framework (ie LP55xx)

- Update and fixed the devm_* MC framework functions (fixed the struct 
in match and added the devm_*_ext functions)

- Removed the hard dependency on the MC framework in the Kconfig for the 
LP55xx_common code.

Dan


> Some notable changes:
>
> MC framework 4/16
>   - Added a color structure for device drivers to use to associate color IDs with
>   brightness values
>   - Name of structure may need some work but this is for proof of concept.
>   - Added back in the devm_* APIs
>   - Inlined function led_classdev_multicolor_register
>
> LP55xx
>   - Fixed binding doc to add "@" to nodes [8/16]
>   - Fixed associated DT file to add the "@" to each node [9,10,11/16]
>   - Separate the LP5523 code changes from the LP55xx common code change
>   - Added channel to color ID mapping for LP55xx [12/16]
>
> LP5523
>   - Separated out this code from LP55xx
>
> LP5521
>   - New patch adding multicolor framework support for this device
>
> Dan
>
> Dan Murphy (16):
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
>    leds: lp55xx: Add multicolor framework support to lp55xx
>    leds: lp5523: Update the lp5523 code to add intensity function
>    leds: lp5521: Add multicolor framework intensity support
>    leds: lp55xx: Fix checkpatch file permissions issues
>    leds: lp5523: Fix checkpatch issues in the code
>
>   .../ABI/testing/sysfs-class-led-multicolor    |  35 +
>   .../bindings/leds/leds-class-multicolor.txt   |  98 +++
>   .../devicetree/bindings/leds/leds-lp50xx.txt  | 148 ++++
>   .../devicetree/bindings/leds/leds-lp55xx.txt  | 155 +++-
>   Documentation/leds/index.rst                  |   1 +
>   Documentation/leds/leds-class-multicolor.rst  |  96 +++
>   arch/arm/boot/dts/imx6dl-yapp4-common.dtsi    |  14 +-
>   arch/arm/boot/dts/omap3-n900.dts              |  29 +-
>   arch/arm/boot/dts/ste-href.dtsi               |  22 +-
>   drivers/leds/Kconfig                          |  22 +
>   drivers/leds/Makefile                         |   2 +
>   drivers/leds/led-class-multicolor.c           | 268 ++++++
>   drivers/leds/led-core.c                       |   1 +
>   drivers/leds/leds-lp50xx.c                    | 784 ++++++++++++++++++
>   drivers/leds/leds-lp5521.c                    |  14 +
>   drivers/leds/leds-lp5523.c                    |  33 +-
>   drivers/leds/leds-lp55xx-common.c             | 191 ++++-
>   drivers/leds/leds-lp55xx-common.h             |  11 +
>   include/dt-bindings/leds/common.h             |   3 +-
>   include/linux/led-class-multicolor.h          |  88 ++
>   include/linux/platform_data/leds-lp55xx.h     |   6 +
>   21 files changed, 1928 insertions(+), 93 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
>   create mode 100644 Documentation/leds/leds-class-multicolor.rst
>   create mode 100644 drivers/leds/led-class-multicolor.c
>   create mode 100644 drivers/leds/leds-lp50xx.c
>   create mode 100644 include/linux/led-class-multicolor.h
>
