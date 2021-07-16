Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A573CBE32
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jul 2021 23:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234760AbhGPVKU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Jul 2021 17:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234405AbhGPVKT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Jul 2021 17:10:19 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC849C06175F
        for <linux-leds@vger.kernel.org>; Fri, 16 Jul 2021 14:07:23 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y42so18181252lfa.3
        for <linux-leds@vger.kernel.org>; Fri, 16 Jul 2021 14:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student-cerritos-edu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MJRyYFKAYqm+yn00rwUN5F6a5qxYgmMcqrOvk4nFoJE=;
        b=p5VnCQ1BlOzM71cFTAmWY2uPgdTfj+8qALddAR1y+rcNkZ8CNlZG/sVRkejbfRr23b
         q8uxDEloWrK0TKds3jotZ8up+Xze/CianPF3pPzhyShRZyjWuoBaWuc4CLYBkdkSdPLg
         jcT+RvkBdwSQo1K/5WcTaRlzKnZIDW2mIgwbw9ypHZjkg4180p6FqTikPyXWfxzcNZtt
         15xKWLTDN3yjwTFW2VoaNmfcC4rvqYmWVPCOnn4NrIqqMP9bl5/BYpr0z4KY9r2vlsWx
         iHxATDNMg91ASOtMgPXlAoMt6gLXZvWPfVvxHOEiY62+NQYwCjVMmnQJM0+FDyzHs1tN
         JqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MJRyYFKAYqm+yn00rwUN5F6a5qxYgmMcqrOvk4nFoJE=;
        b=lPuGS8eWvOwb0x7WvriuJHhSKk+wfGI33Npcpb0A2PYkaJBIQVUAN/fx6bNUN0d1tO
         a6cH2N77700TV42f8y+tLMAvKemZo5Sc5712NPbbEhNqC2KS0eYOkv4d+oEKwtFSp39+
         gGZWI9vSgQvT/8757KBxhirSuBkN4SHA7NLxImSyuer1/VvPE7p3DVKQ66tjYDCzMSBv
         Zo1/UvGfnZM//N71T99IacMS/2eJsgZjndzP0jTUbYwOd+dxercf3fZYBUr+QgiJRL02
         vUt6/JK5lkU0rjyv+Q1u2xEV4vJq86jjbJWM3uVzQ78SFR18RnAZlKJhK8Kg3F8o3o4y
         6uNw==
X-Gm-Message-State: AOAM530Ts9SNzO+sJgm7Yens67QglYUIlzEWPbIo6XbZ/Q91bjP9E9Oh
        d3GfQ0RxG5shy7a4JJABFUk6SZZ7FVNHPlp820so8g==
X-Google-Smtp-Source: ABdhPJxuXwqGVBRGv2ZKNeaVa1819dOjyCnM6l3twrix4lWUZnGEAKUhHJZpzmLyjQBSNFND3EbGe/dL3wZM2GhId9Q=
X-Received: by 2002:ac2:44dc:: with SMTP id d28mr9092633lfm.618.1626469642042;
 Fri, 16 Jul 2021 14:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <9b5902665dcc4c0fca7546987303e348d8657f59.1626383424.git.apark0006@student.cerritos.edu>
 <202107161046.heIVRW8r-lkp@intel.com> <CAPOgqxHndN+3J-C7+38vLedhN2bhAasW9JRxf-rvt7gvVhD1rQ@mail.gmail.com>
In-Reply-To: <CAPOgqxHndN+3J-C7+38vLedhN2bhAasW9JRxf-rvt7gvVhD1rQ@mail.gmail.com>
From:   Amy Parker <apark0006@student.cerritos.edu>
Date:   Fri, 16 Jul 2021 14:07:10 -0700
Message-ID: <CAPOgqxHzhLt91N902NmWaVRO2RkmewWj9rJCdCt5qOrAjai+OQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] swap led_brightness from enum to typedef
To:     kernel test robot <lkp@intel.com>
Cc:     pavel@ucw.cz, kbuild-all@lists.01.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jul 15, 2021 at 8:11 PM Amy Parker
<apark0006@student.cerritos.edu> wrote:
>
> Ah - I see there was an issue with header files not being properly updated.
>
> Check back for another patch resolving this.
>
>
> On Thu, Jul 15, 2021 at 7:15 PM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Amy,
> >
> > Thank you for the patch! Perhaps something to improve:
> >
> > [auto build test WARNING on linus/master]
> > [also build test WARNING on v5.14-rc1 next-20210715]
> > [cannot apply to pavel-linux-leds/for-next wireless-drivers-next/master wireless-drivers/master]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/Amy-Parker/leds-change-led_brightness-definition-from-enum-to-typedef/20210716-052140
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dd9c7df94c1b23feacd54112f33ad95d93f64533
> > config: m68k-buildonly-randconfig-r006-20210715 (attached as .config)
> > compiler: m68k-linux-gcc (GCC) 10.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/0day-ci/linux/commit/b14a971f1045205d49d9d001f33d33afdd8208f9
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Amy-Parker/leds-change-led_brightness-definition-from-enum-to-typedef/20210716-052140
> >         git checkout b14a971f1045205d49d9d001f33d33afdd8208f9
> >         # save the attached .config to linux build tree
> >         mkdir build_dir
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross O=build_dir ARCH=m68k SHELL=/bin/bash drivers/md/bcache/ drivers/media/v4l2-core/
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> >    In file included from drivers/media/v4l2-core/v4l2-flash-led-class.c:15:
> > >> include/media/v4l2-flash-led-class.h:18:1: warning: useless type name in empty declaration
> >       18 | led_brightness;
> >          | ^~~~~~~~~~~~~~
> >
> >
> > vim +18 include/media/v4l2-flash-led-class.h
> >
> >     14
> >     15  struct led_classdev_flash;
> >     16  struct led_classdev;
> >     17  struct v4l2_flash;
> >   > 18  led_brightness;
> >     19
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>
>
>
> --
> Amy Iris Parker
> Please refer to me using she/her pronouns.
> CIS Major
> Dual Enrollment with WHS co2025

Another patch was sent into the list to correct this error.
