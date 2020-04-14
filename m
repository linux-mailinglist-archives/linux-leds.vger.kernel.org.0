Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572281A7DF4
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2020 15:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732033AbgDNN2Z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 14 Apr 2020 09:28:25 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59438 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731922AbgDNN1a (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 Apr 2020 09:27:30 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03EDRKXd105325;
        Tue, 14 Apr 2020 08:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1586870840;
        bh=daqHD9IsIhV3ZrKYIE2EmvKR5hzL++q4SVSig2qNISw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jIFm27kMGptiZk4/2fvNK6FUHhsVmmZmVZ7Bi3vBA6yb5tyl42NzISen68IzIiVi2
         STo1Rhr2T7HzjD3j1e6+9fxBaocZZxbg/qhieIwyW5VRajGB1uBaMtMvzKo4SdFXuS
         PLZIjvw+/OtCZvzZ26MmVymd0Iv6YB5YVcLngbEU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03EDRKja001678;
        Tue, 14 Apr 2020 08:27:20 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 14
 Apr 2020 08:27:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 14 Apr 2020 08:27:20 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03EDRJNX107342;
        Tue, 14 Apr 2020 08:27:19 -0500
Subject: Re: [PATCH v19 03/18] leds: Add multicolor ID to the color ID list
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200402204311.14998-1-dmurphy@ti.com>
 <20200402204311.14998-4-dmurphy@ti.com> <20200406201303.GF18036@bug>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <2b46bb6c-2757-bb09-3d94-5ec92c2f0b4e@ti.com>
Date:   Tue, 14 Apr 2020 08:21:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200406201303.GF18036@bug>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 4/6/20 3:13 PM, Pavel Machek wrote:
> On Thu 2020-04-02 15:42:56, Dan Murphy wrote:
>> Add a new color ID that is declared as MULTICOLOR as with the
>> multicolor framework declaring a definitive color is not accurate
>> as the node can contain multiple colors.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> Squash with previous patch, ack for both, they can't be separate.
>
Ack
