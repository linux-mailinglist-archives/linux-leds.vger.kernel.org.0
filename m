Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A24AEA1F1
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2019 17:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbfJ3QmZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Oct 2019 12:42:25 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36256 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfJ3QmZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Oct 2019 12:42:25 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UGgGo3022436;
        Wed, 30 Oct 2019 11:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572453736;
        bh=CCnWjmaSyDBwAcmvj4tdp75fEghlw9n17xSgZDvLzNE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=G7iNEDdFUPcnPrnB6iIhtbadYxsLdvJ468QBIY76uglRR0emhbIterApk1mDITTX+
         7YG7kigZ9c0gxebCsDrFWezYd9p+Mcd+72VOduJlH7zenLNKn5gSarWsOWcjWYzGdm
         kfOZbtkrfVrELd7jL8ignpzn0VWBgdfupBeTDqTg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UGgGCp126766
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 11:42:16 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 11:42:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 11:42:15 -0500
Received: from [10.250.35.43] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UGgFwM011148;
        Wed, 30 Oct 2019 11:42:15 -0500
Subject: Re: [PATCH v15 06/19] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     kbuild test robot <lkp@intel.com>
CC:     <kbuild-all@lists.01.org>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191028183629.11779-7-dmurphy@ti.com>
 <201910302027.2hNdR993%lkp@intel.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <bb3473ba-ddfc-2b51-4a75-c23c5bf3bc62@ti.com>
Date:   Wed, 30 Oct 2019 11:41:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <201910302027.2hNdR993%lkp@intel.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 10/30/19 7:07 AM, kbuild test robot wrote:
> Hi Dan,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on j.anaszewski-leds/for-next]
> [also build test ERROR on v5.4-rc5 next-20191029]

I went to both these references and I do not see this patchset on either 
of these.

> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Dan-Murphy/Multicolor-Framework/20191030-144320
It appears here though
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git for-next

Does not appear here

Finally not sure why the MIPS compiler is complaining about this but the 
ARM and x86 is not

Dan

