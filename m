Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E63E616BD0
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2019 21:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbfEGT6A (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 15:58:00 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:56050 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbfEGT6A (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 May 2019 15:58:00 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x47Jvphw083670;
        Tue, 7 May 2019 14:57:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557259071;
        bh=UcaMTJoxZughbHJFVgrAH8db9y6iFXOf61W0SWLWKx4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=G9VbI9q/AUr2eC4xtFwTBQY/JF9oOKF7g0qhj0DpJjQGvPLRyR/D5TRBp2IAodAK0
         qfsWNpiHdf4noIO5zfqVkzvzavGEtf6flU0VCugUnmv02Jdy1A4SvmpFNi/6mrhYUF
         1LZjlT04sWdZMm60KL4N781exgxc/FstXhUapIVc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x47Jvpec095141
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 May 2019 14:57:51 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 7 May
 2019 14:57:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 7 May 2019 14:57:51 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x47Jvoxl093458;
        Tue, 7 May 2019 14:57:50 -0500
Subject: Re: Multicolor Framework: brightness-model vs curve definition
To:     Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>
CC:     <linux-leds@vger.kernel.org>, <jacek.anaszewski@gmail.com>
References: <20190501225120.1ce3cfc6@nic.cz> <20190504155016.GA7421@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3a258168-27f4-0e13-40b8-cc8113371fe9@ti.com>
Date:   Tue, 7 May 2019 14:57:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190504155016.GA7421@amd>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 5/4/19 10:50 AM, Pavel Machek wrote:
> Hi!
> 
>> I have been thinking about the last Multicolor Framework proposal by
>> Dan.
> 
> We talked on the phone... and I promissed some links.
> 
> I'd really prefer drivers to present output power to the of the
> kernel/userland, and deal with the RGB conversion else where. So if
> driver was asked for (20, 50, 100), red output would go to (20/1000) W,
> green (50/1000) W, ...
> 
> RGB is described here:
> 
> https://en.wikipedia.org/wiki/RGB_color_model (see section
> "nonlinearity")
> 
> https://en.wikipedia.org/wiki/Gamma_correction
> 
> And concrete values are here:
> 
> https://en.wikipedia.org/wiki/SRGB#Specification_of_the_transformation
> 
> While playing with colors, I came up with this:
> 
> https://github.com/pavelmachek/unicsy_demo/blob/master/monitor/notint.py
> 
> See change_color for exact transformation (it could be improvede,
> linear part is not there). It can be also used to display same color
> on monitor and LED. It get somehow reasonable results for me...
> 

Does this use the multi color framework interfaces defined here?

https://lore.kernel.org/patchwork/patch/1060683/

Minus the sync, sync_enable and brightness_model interfaces.  It does not look like that after looking
at the notint script.

Or is this your own multicolor framework implementation?

We could meld these ideas together.

Dan

> Best regards (and good luck),
> 									Pavel
> 
