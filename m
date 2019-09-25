Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3821DBE461
	for <lists+linux-leds@lfdr.de>; Wed, 25 Sep 2019 20:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440306AbfIYSLY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Sep 2019 14:11:24 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36010 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439904AbfIYSLY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Sep 2019 14:11:24 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PIBDG3036091;
        Wed, 25 Sep 2019 13:11:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569435073;
        bh=o5gMivqpIt24v1Op8aovKxCLWyUcB7JWgOBtGNyOh38=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=uDV2zsD2POkGA2jFGXwRbyi/Yit1q+bRaxA5qYa4tVFH3mrWlmWxdQgC3/uuFDp1D
         0fQmhUt9MX57dzK75OjrLYOfY8wyBGcvfgNV3ET8gzGm7cKqRX9F3xza7GlGDs1ISq
         aefgHXDdMPb8bf7OBJq7bDML1CwfOXoesUhn1mDI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8PIBDfQ050023
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Sep 2019 13:11:13 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 25
 Sep 2019 13:11:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 25 Sep 2019 13:11:05 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PIBCf8040771;
        Wed, 25 Sep 2019 13:11:12 -0500
Subject: Re: [PATCH v9 11/15] ARM: dts: imx6dl-yapp4: Add reg property to the
 lp5562 channel node
To:     Fabio Estevam <festevam@gmail.com>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>
References: <20190925174616.3714-1-dmurphy@ti.com>
 <20190925174616.3714-12-dmurphy@ti.com>
 <CAOMZO5CeDKohK5np29X1fvzqBiCw6S3QmbpJ7jjn+avObKNqFw@mail.gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <6e1ce904-035b-41cd-6dfe-1e63ed8dd1aa@ti.com>
Date:   Wed, 25 Sep 2019 13:16:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5CeDKohK5np29X1fvzqBiCw6S3QmbpJ7jjn+avObKNqFw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fabio

On 9/25/19 1:00 PM, Fabio Estevam wrote:
> Hi Dan,
>
> On Wed, Sep 25, 2019 at 2:41 PM Dan Murphy <dmurphy@ti.com> wrote:
>
>>                  chan0 {
> This should be chan@0
>
>>                          chan-name = "R";
>>                          led-cur = /bits/ 8 <0x20>;
>>                          max-cur = /bits/ 8 <0x60>;
>> +                       reg = <0>;
> Passing reg without its corresponding @ entry gives a dtc warning when
> building with W=1.


Ack

