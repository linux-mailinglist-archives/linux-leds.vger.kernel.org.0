Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAA83CBEAF
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jul 2021 23:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235815AbhGPVqb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Jul 2021 17:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235173AbhGPVqb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Jul 2021 17:46:31 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0913C06175F;
        Fri, 16 Jul 2021 14:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=bEkj3X1w+yUCMlbBrYh2sHY0GGD8wsEyAKCDS+glIK8=; b=bKJM2HBygbaTm4VtXAsRzROIoW
        bGPx90k2b1Hny6MEmDKC7O2E23wvdYBYsrQN4j2onMAgolNNu/IPB6c2de4eJPhD0s4Xar0keclnw
        712+Ex3rSw2wUnWj1pSqyG3NDKVEETFi2zsJ+ySXTxCJL/qErBUWUtyMs9rLJHuqUmuxLAnWmi3li
        v84jyIWCm8lxesL2mzSSkVQ/1da9t+ObC3ffLOdjxsPQGERfGiqy5IKLnd7qrY0aVSfm3Su9a5fI0
        Q3lCSIjC3SD9qRv/tQ+EXbtm81+Khvz/LX04eUXI7LTm2Eh693SE7BHKSOspxNz4FM/o2tOd6LHXM
        o8xIeDsQ==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m4VcM-005PIy-Iu; Fri, 16 Jul 2021 21:43:34 +0000
Subject: Re: [PATCH 1/2] swap led_brightness from enum to typedef
To:     Amy Parker <apark0006@student.cerritos.edu>,
        kernel test robot <lkp@intel.com>
Cc:     pavel@ucw.cz, kbuild-all@lists.01.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <9b5902665dcc4c0fca7546987303e348d8657f59.1626383424.git.apark0006@student.cerritos.edu>
 <202107161046.heIVRW8r-lkp@intel.com>
 <CAPOgqxHndN+3J-C7+38vLedhN2bhAasW9JRxf-rvt7gvVhD1rQ@mail.gmail.com>
 <CAPOgqxHzhLt91N902NmWaVRO2RkmewWj9rJCdCt5qOrAjai+OQ@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e1a4685e-ceab-75f2-ee18-09a0a9c55a87@infradead.org>
Date:   Fri, 16 Jul 2021 14:43:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPOgqxHzhLt91N902NmWaVRO2RkmewWj9rJCdCt5qOrAjai+OQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Amy,

Please see comments below.

On 7/16/21 2:07 PM, Amy Parker wrote:
> On Thu, Jul 15, 2021 at 8:11 PM Amy Parker
> <apark0006@student.cerritos.edu> wrote:
>>
>> Ah - I see there was an issue with header files not being properly updated.
>>
>> Check back for another patch resolving this.
>>
>>
>> On Thu, Jul 15, 2021 at 7:15 PM kernel test robot <lkp@intel.com> wrote:
>>>
>>> Hi Amy,
>>>
>>> Thank you for the patch! Perhaps something to improve:
>>>
>>> [auto build test WARNING on linus/master]
>>> [also build test WARNING on v5.14-rc1 next-20210715]
>>> [cannot apply to pavel-linux-leds/for-next wireless-drivers-next/master wireless-drivers/master]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch]
>>>
>>> url:    https://github.com/0day-ci/linux/commits/Amy-Parker/leds-change-led_brightness-definition-from-enum-to-typedef/20210716-052140
>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dd9c7df94c1b23feacd54112f33ad95d93f64533
>>> config: m68k-buildonly-randconfig-r006-20210715 (attached as .config)
>>> compiler: m68k-linux-gcc (GCC) 10.3.0
>>> reproduce (this is a W=1 build):
>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>         chmod +x ~/bin/make.cross
>>>         # https://github.com/0day-ci/linux/commit/b14a971f1045205d49d9d001f33d33afdd8208f9
>>>         git remote add linux-review https://github.com/0day-ci/linux
>>>         git fetch --no-tags linux-review Amy-Parker/leds-change-led_brightness-definition-from-enum-to-typedef/20210716-052140
>>>         git checkout b14a971f1045205d49d9d001f33d33afdd8208f9
>>>         # save the attached .config to linux build tree
>>>         mkdir build_dir
>>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross O=build_dir ARCH=m68k SHELL=/bin/bash drivers/md/bcache/ drivers/media/v4l2-core/
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>    In file included from drivers/media/v4l2-core/v4l2-flash-led-class.c:15:
>>>>> include/media/v4l2-flash-led-class.h:18:1: warning: useless type name in empty declaration
>>>       18 | led_brightness;
>>>          | ^~~~~~~~~~~~~~
>>>
>>>
>>> vim +18 include/media/v4l2-flash-led-class.h
>>>
>>>     14
>>>     15  struct led_classdev_flash;
>>>     16  struct led_classdev;
>>>     17  struct v4l2_flash;
>>>   > 18  led_brightness;
>>>     19
>>>
>>> ---

> 
> Another patch was sent into the list to correct this error.

Hopefully Pavel (LED subsystem maintainer) will comment soon-ish.

My comments:

a. This patch would be the right thing to do if your large patch had already been
applied (merged) somewhere, but AFAIK it hasn't been. So:

b. IMO you should resend your entire patch set with this fix included.
Send it as "v2" (version 2) and explain the changes in it since your
original patch (which was v1). This v2 explanation should be below the
"---" line in the patch. (See Documentation/process/submitting-patches.rst
for more info -- or ask for more info/help.)

c. For your follow-up patch to include/media/v4l2-flash-led-class.h, which was:

-led_brightness;
+typedef u8 led_brightness;

I would just add this to include/media/v4l2-flash-led-class.h:

#include <linux/leds.h>

That way, in a few years, when the type of led_brightness changes again,
someone won't have to remember to search for other typedefs of it and
update them also. Or maybe they will do that after a bug happens and
someone notices it.

(Note that I am just trying to help. Pavel has more of a final
say-so about this.)


HTH.
-- 
~Randy

