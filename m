Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBFE41C2C33
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2020 14:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgECMfU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 3 May 2020 08:35:20 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:56040 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbgECMfU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 3 May 2020 08:35:20 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 043CZFf8037315;
        Sun, 3 May 2020 07:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588509315;
        bh=TKKNAOkF2jAtJRcMeSHJHG0+FAnDUE28xaOhXuqo9oE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=HGRHkl0NzJGjyGSifwWFpK1x9dG35KnNK942jhJqXEqLgk/ILw/YRvg3w/rxuUPhE
         HkOEBvnCrBrV8KfbU6mjQFU1IvY9//4nEL1BTyklklMbrqHQxJ4zlkZeoGufusySYj
         2EpEcGE9K6FJXoxG5+w1taxoMzBQKTUJzp+JRhE0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 043CZFhn009063;
        Sun, 3 May 2020 07:35:15 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 3 May
 2020 07:35:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 3 May 2020 07:35:15 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 043CZFlN032465;
        Sun, 3 May 2020 07:35:15 -0500
Subject: Re: [PATCH v23 02/16] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200429202816.26501-1-dmurphy@ti.com>
 <20200429202816.26501-3-dmurphy@ti.com>
 <5533a7b4-12b4-90b8-2731-a9cdfbee5e12@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <05377684-c316-24c2-d577-f52b8eea5656@ti.com>
Date:   Sun, 3 May 2020 07:26:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5533a7b4-12b4-90b8-2731-a9cdfbee5e12@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 5/2/20 4:51 PM, Jacek Anaszewski wrote:
> Dan,
>
> I've converted drivers/leds/leds-an30259a.c to LED mc framework
> and tested it on Samsung Galaxy S3 (exysnos4412-trats2 board).
> Works as expected. And now the framework usability is indeed neater.
>
> One thing to improve: LED mc based drivers' entries in Kconfig should 
> have this dependency:
>
> depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
>
> It is required to enforce building driver as a module if
> LED mc framework is configured as such.
>
Do you think the FLASH class needs this as well?  If so I will send this 
in a separate patch


> With this (and DT bindings nits) addressed, for patches 1-6:
>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>
Ack
> It's been a long journey. Thank you for your determination to drive
> this work to the end.
>
Ack to that.

Dan


