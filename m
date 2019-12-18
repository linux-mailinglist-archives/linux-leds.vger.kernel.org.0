Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D88A7124A12
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2019 15:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbfLROry (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Dec 2019 09:47:54 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44882 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727186AbfLROry (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Dec 2019 09:47:54 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIElnw9091999;
        Wed, 18 Dec 2019 08:47:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576680469;
        bh=9QQbSS0rFH46BR10NFC7Q609jmka/ilJ1AcUNksp8Fo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JZ97l2tUebr0TbqM/WnjQMc9swjxz6W/Tn97oPc6EhnSznVXHMtgIbLg5uHlpmuY1
         NiMeHguJuWE/AhB+3KImvys8cEkiA6AwOJa9vxdBP3YvIsgHw6aSFZ3u0cwNo6a/em
         Z42TZ5RhDeLiubGLZNdxY2hMlQ/R8P8hbNBj7pcg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBIEln1I019031
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Dec 2019 08:47:49 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 18
 Dec 2019 08:47:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 18 Dec 2019 08:47:48 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIElmKj014309;
        Wed, 18 Dec 2019 08:47:48 -0600
Subject: Re: [PATCH v17 00/19] Multicolor Framework
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191114133023.32185-1-dmurphy@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <efdfcf1f-50b2-314f-3d46-93369229109a@ti.com>
Date:   Wed, 18 Dec 2019 08:45:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
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

Hello

Bump for application to leds-next

Dan

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
>
>   .../ABI/testing/sysfs-class-led-multicolor    |  36 +
>   .../bindings/leds/leds-class-multicolor.txt   |  98 +++
>   .../devicetree/bindings/leds/leds-lp50xx.txt  | 148 ++++
>   .../devicetree/bindings/leds/leds-lp55xx.txt  | 163 +++-
>   Documentation/leds/index.rst                  |   1 +
>   Documentation/leds/leds-class-multicolor.rst  | 100 +++
>   arch/arm/boot/dts/imx6dl-yapp4-common.dtsi    |  14 +-
>   arch/arm/boot/dts/omap3-n900.dts              |  29 +-
>   arch/arm/boot/dts/ste-href.dtsi               |  22 +-
>   drivers/leds/Kconfig                          |  22 +
>   drivers/leds/Makefile                         |   2 +
>   drivers/leds/led-class-multicolor.c           | 272 ++++++
>   drivers/leds/led-core.c                       |   1 +
>   drivers/leds/leds-lp50xx.c                    | 799 ++++++++++++++++++
>   drivers/leds/leds-lp5521.c                    |  43 +-
>   drivers/leds/leds-lp5523.c                    |  62 +-
>   drivers/leds/leds-lp5562.c                    |  22 +-
>   drivers/leds/leds-lp55xx-common.c             | 235 ++++--
>   drivers/leds/leds-lp55xx-common.h             |  36 +-
>   drivers/leds/leds-lp8501.c                    |  23 +-
>   include/dt-bindings/leds/common.h             |   3 +-
>   include/linux/led-class-multicolor.h          | 139 +++
>   include/linux/platform_data/leds-lp55xx.h     |   8 +
>   23 files changed, 2106 insertions(+), 172 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
>   create mode 100644 Documentation/leds/leds-class-multicolor.rst
>   create mode 100644 drivers/leds/led-class-multicolor.c
>   create mode 100644 drivers/leds/leds-lp50xx.c
>   create mode 100644 include/linux/led-class-multicolor.h
>
