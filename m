Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55E3B113ECE
	for <lists+linux-leds@lfdr.de>; Thu,  5 Dec 2019 10:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729327AbfLEJzN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Dec 2019 04:55:13 -0500
Received: from mga09.intel.com ([134.134.136.24]:7258 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729180AbfLEJzM (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 5 Dec 2019 04:55:12 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Dec 2019 01:55:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,281,1571727600"; 
   d="scan'208";a="361873652"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.6]) ([10.239.13.6])
  by orsmga004.jf.intel.com with ESMTP; 05 Dec 2019 01:55:10 -0800
Subject: Re: [kbuild-all] Re: [PATCH v15 06/19] leds: lp50xx: Add the LP50XX
 family of the RGB LED driver
To:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191028183629.11779-7-dmurphy@ti.com>
 <201910302027.2hNdR993%lkp@intel.com>
 <29321f74-8200-90cd-40f9-8f5bdb86e34e@ti.com> <20191125150730.GA3816@amd>
 <e05148a1-2588-0b08-2bcf-1ef819c33683@ti.com>
From:   Rong Chen <rong.a.chen@intel.com>
Message-ID: <7df57f17-0804-469b-0e0b-084cafa3a442@intel.com>
Date:   Thu, 5 Dec 2019 17:54:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e05148a1-2588-0b08-2bcf-1ef819c33683@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 12/4/19 8:44 PM, Dan Murphy wrote:
> Pavel
>
> On 11/25/19 9:07 AM, Pavel Machek wrote:
>> On Wed 2019-10-30 11:43:10, Dan Murphy wrote:
>>> Pavel
>>>
>>> On 10/30/19 7:07 AM, kbuild test robot wrote:
>>>> Hi Dan,
>>>>
>>>> I love your patch! Yet something to improve:
>>>>
>>>> [auto build test ERROR on j.anaszewski-leds/for-next]
>>> You might want to get your tree to be the base now.
>> Do you have an idea who I need to contact?
>
> Not sure maybe the mail list for the kbuild lkp@intel.com?
>
>

Thanks for the advice,  we have added the tree to our monitor list:

https://github.com/intel/lkp-tests/blob/master/repo/linux/pavel-linux-leds

Best Regards,
Rong Chen

