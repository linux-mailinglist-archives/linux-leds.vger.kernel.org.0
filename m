Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42D9512F9F2
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jan 2020 16:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgACPqR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Jan 2020 10:46:17 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39092 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727539AbgACPqR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Jan 2020 10:46:17 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 003FkC71029465;
        Fri, 3 Jan 2020 09:46:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578066372;
        bh=lb0AnQ1+V7a+ZHjp9y/3Z41QC1sC2dSQ9y8lR2d1B6M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=yAdIgCBPqESKui77m9z+GH3ow/kIUaCPaH6wJGLTK2yg3JihGDNynNcrmvURtwovL
         yQun2W6SR6aT50n3+31iKbFNw/Nft1pBfgpoiHuDppyPOIWcLDkx/qTd/sxnTxB1+y
         LRdjzV9PO7JTkeXShA9v14u5gDVFD+UWANewLkuI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 003FkCj3071007
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 3 Jan 2020 09:46:12 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 3 Jan
 2020 09:46:12 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 3 Jan 2020 09:46:12 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 003FkBen047834;
        Fri, 3 Jan 2020 09:46:12 -0600
Subject: Re: [PATCH v17 19/19] leds: lp55xx-common: Remove extern from
 lp55xx-common header
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191114133023.32185-1-dmurphy@ti.com>
 <20191114133023.32185-20-dmurphy@ti.com> <20191222183523.GH23369@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f43fde41-de0e-5b77-e22d-abab76e90c59@ti.com>
Date:   Fri, 3 Jan 2020 09:43:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191222183523.GH23369@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

Thanks for the review on all the patches.  Sorry for the late reply I 
was on holiday

On 12/22/19 12:35 PM, Pavel Machek wrote:
> On Thu 2019-11-14 07:30:23, Dan Murphy wrote:
>> extern is implied and is not needed in the common header file.
>> Remove the extern keyword and re-align the code.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> Lets not do this.

OK this is the last patch in the series so I am OK to drop it.

Dan

