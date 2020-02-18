Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBF5162667
	for <lists+linux-leds@lfdr.de>; Tue, 18 Feb 2020 13:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgBRMr6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 Feb 2020 07:47:58 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35876 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgBRMr6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 18 Feb 2020 07:47:58 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01ICltSI017329;
        Tue, 18 Feb 2020 06:47:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582030075;
        bh=xVEyUW1XdjD1ES7xYnuISdMvDkFO7eHR+YedhiMAABo=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=IxudEPiXN/PX6W1z0gwhqR0tT6NV2oiqd/p8N17e+bYDgcG95nilbG3RYwVxJuAJe
         8SF3+l5tFNzVVGpyblUwrM7K+9smlqZiy6NCEO9fQxe/8WBSuAtq2pBxdkHELcJYXL
         RA3fK40Qm8njUSKNtaw27MS2dBCBtRXBuqlVgPGg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01IClt24016380
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 18 Feb 2020 06:47:55 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 18
 Feb 2020 06:47:55 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 18 Feb 2020 06:47:55 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01ICltr0062821;
        Tue, 18 Feb 2020 06:47:55 -0600
Subject: Re: [PATCH 0/3] leds: add support for apa102c leds
To:     Nicolas Belin <nbelin@baylibre.com>,
        <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
References: <1582018657-5720-1-git-send-email-nbelin@baylibre.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <04642127-0e68-43b1-9b6c-0dbb56dc9bfe@ti.com>
Date:   Tue, 18 Feb 2020 06:43:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582018657-5720-1-git-send-email-nbelin@baylibre.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hellp

On 2/18/20 3:37 AM, Nicolas Belin wrote:
> This patch series adds the driver and its related documentation
> for the APA102C RGB Leds.
>
> Patch 1 adds the APA102C led manufacturer to the vendor-prefixes list.
>
> Patch 2 Documents the APA102C led driver.
>
> Patch 3 contains the actual driver code and modifications in the Kconfig
> and the Makefile.

Is this something that can benefit from the Multicolor framework patches?

https://lore.kernel.org/patchwork/project/lkml/list/?series=427513

Can you RFC the APA102C driver on top of the Multicolor FW to see how it 
blends?

Dan

