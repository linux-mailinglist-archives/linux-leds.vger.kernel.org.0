Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7EDF7C30F
	for <lists+linux-leds@lfdr.de>; Wed, 31 Jul 2019 15:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfGaNOY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 31 Jul 2019 09:14:24 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40266 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfGaNOY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 31 Jul 2019 09:14:24 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6VDEIDL016847;
        Wed, 31 Jul 2019 08:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564578858;
        bh=RyuWh+BNkN7tLBcKmDkHzvIenVE1MdLILychpRoaXhE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=sznUJdmGgOd9atjYi5PXCOPKY6zPvifrh1aRdHpQIp8az1g5pQX5IO7XQu497wOgp
         F4on3PNJp8LI/rmy0jkZlGVs9aYgbbZgdjkf9QJZdLPqQMCu1LkisdP8E49Nr5o3yi
         L0D70bQU+39ygjl6BaASkzPvD79yOMBv1p1i7fl0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6VDEIqn049711
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 31 Jul 2019 08:14:18 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 31
 Jul 2019 08:14:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 31 Jul 2019 08:14:18 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6VDEGVj068694;
        Wed, 31 Jul 2019 08:14:17 -0500
Subject: Re: [PATCH v2 0/2] leds: tlc591xx: switch to OF and managed API
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <dmurphy@ti.com>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190708100620.22388-1-jjhiblot@ti.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <07bcbd79-dde9-d583-d7d3-dd3b28726092@ti.com>
Date:   Wed, 31 Jul 2019 16:14:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190708100620.22388-1-jjhiblot@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 08/07/2019 13:06, Jean-Jacques Hiblot wrote:
> This mini-series updates the tlc591xx driver to use the managed API. The
> driver is also modified to pass the DT node to the LED core layer.
> The goal is to be able to the generic led-backlight [0] driver on top of
> it.
> 
> changes in v2:
> - fixed LED indexing. Previous version did not allow for holes: if n LEDs
>    were used, they had to be led(0) to led(n-1)
> 
> Jean-Jacques Hiblot (2):
>    leds: tlc591xx: simplify driver by using the managed led API
>    leds: tlc591xx: Use the OF version of the LED registration function
> 
>   drivers/leds/leds-tlc591xx.c | 79 +++++++++---------------------------
>   1 file changed, 20 insertions(+), 59 deletions(-)
> 

For the series:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
