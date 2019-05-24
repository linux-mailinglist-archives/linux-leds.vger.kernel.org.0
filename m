Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2049A29FD8
	for <lists+linux-leds@lfdr.de>; Fri, 24 May 2019 22:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404056AbfEXU1X (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 May 2019 16:27:23 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37334 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404009AbfEXU1X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 May 2019 16:27:23 -0400
Received: by mail-lj1-f193.google.com with SMTP id h19so1369482ljj.4;
        Fri, 24 May 2019 13:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X0NNP/ceUaOcZTctpbxE4TiNS5zH4TOE3WlAv64HR/g=;
        b=kpjbLOrPSSy9sifdIbDi4jRhh/Jy+JCPqPjUQq5wPuXi/nG3mMBOlW3hZ5PwempipX
         qgGJYNFj4k8KEhvhnY4ote3orQX6Mo8fbD1KmebAAOl7Nor75f49QomLDCn2I1w/aopf
         ZH0a9B8N5a/P9/wfydjUYz+9Sn8mzET6JZQPC5yqif+/mCdmIpoHESub0btf6YaV9ldP
         eZYPRaJQEUWkNlv5Ar/CFJjuOUu2ShAf3eBlKI4mhaeIZ62SaK/2hjYcXLX2fRf3DO4H
         jx8pMtXye1QpXt1+MyhM0j3Br3Kr3uYf8BkKT2y+l77NvcHp9+KfyUx43IWRLJUnTMtJ
         fxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X0NNP/ceUaOcZTctpbxE4TiNS5zH4TOE3WlAv64HR/g=;
        b=reWbVFszrrtJIBomQAqq5ZgFNMW06xv3Utv3vGhYtNIxRJ/g2s4LgKOZNaSUHOwCbl
         3QU/9T7oJRQO6VVGZPvpJIVfVg+E2WRrbjxFi9hOdZUUFfggt1q9dUhpt6V8z3vSWWeD
         yvg7Fh/HGoJO8fWwPDBhZJTiNZ04ChN44ABwZAqmPIXEB0MMSfuwaa1D1Gt0mU1Ci84m
         PKh6abLs1oKL9DiTsX4cAksf5JZ0N7VYCzUGQx4M/SrdTriMegwLy5GLaCwcqgd0bHkn
         SoWfJO0r2Jr4SEV/JScKcJyf1nthxxq9dOC2NUI6bOLvgEarFRqLaS9qQmtpeY0EEJsX
         gMmQ==
X-Gm-Message-State: APjAAAWnSmRPN7tDU0y3EZp0bMzCgXuEbea/DYiWSMnoGoqOxlNkduMp
        wyS4sT9Bp2YvVf4EVnmWOpFliwZl
X-Google-Smtp-Source: APXvYqzeQDdwTESFjREjwkS3y07HJNLyFT1jSpVbsdMzSWVvVysxmtZS/guhNkBmUZVfS5DHlq1s1A==
X-Received: by 2002:a2e:8909:: with SMTP id d9mr5878371lji.93.1558729639850;
        Fri, 24 May 2019 13:27:19 -0700 (PDT)
Received: from [192.168.1.17] (bkq212.neoplus.adsl.tpnet.pl. [83.28.184.212])
        by smtp.gmail.com with ESMTPSA id g14sm794143lfb.20.2019.05.24.13.27.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 13:27:19 -0700 (PDT)
Subject: Re: linux-next: Tree for May 24 (leds-lm3697)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
References: <20190524140727.19d1e349@canb.auug.org.au>
 <f8300d14-972d-1c03-3266-836b94c1ec9a@infradead.org>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <06097597-2d41-64a0-f4bc-d14ce2c832b5@gmail.com>
Date:   Fri, 24 May 2019 22:27:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f8300d14-972d-1c03-3266-836b94c1ec9a@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Randy,

Thank you for the report.

On 5/24/19 5:42 PM, Randy Dunlap wrote:
> On 5/23/19 9:07 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> News: there will be no linux-next release on Monday.
>>
>> Changes since 20190523:
>>
>> The input-current tree gained a build failure so I reverted a commit.
>>
>> The drm-fixes tree gained a build failure so I reverted a commit.
>>
>> The v4l-dvb tree gained a conflict against Linus' tree.
>>
>> Non-merge commits (relative to Linus' tree): 1814
>>   1870 files changed, 61172 insertions(+), 32723 deletions(-)
>>
>> ----------------------------------------------------------------------------
>>
>> I have created today's linux-next tree at
>> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
>> are tracking the linux-next tree using git, you should not use "git pull"
>> to do so as that will try to merge the new linux-next release with the
>> old one.  You should use "git fetch" and checkout or reset to the new
>> master.
>>
>> You can see which trees have been included by looking in the Next/Trees
>> file in the source.  There are also quilt-import.log and merge.log
>> files in the Next directory.  Between each merge, the tree was built
>> with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
>> multi_v7_defconfig for arm and a native build of tools/perf. After
>> the final fixups (if any), I do an x86_64 modules_install followed by
>> builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
>> ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
>> and sparc64 defconfig. And finally, a simple boot test of the powerpc
>> pseries_le_defconfig kernel in qemu (with and without kvm enabled).
>>
>> Below is a summary of the state of the merge.
>>
>> I am currently merging 290 trees (counting Linus' and 70 trees of bug
>> fix patches pending for the current merge release).
>>
>> Stats about the size of the tree over time can be seen at
>> http://neuling.org/linux-next-size.html .
>>
>> Status of my local build tests will be at
>> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
>> advice about cross compilers/configs that work, we are always open to add
>> more builds.
>>
>> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
>> Gortmaker for triage and bug fixes.
>>
> 
> seen on i386:
> 
> ld: drivers/leds/leds-lm3697.o: in function `lm3697_probe':
> leds-lm3697.c:(.text+0x451): undefined reference to `devm_of_led_classdev_register'
> 
> CONFIG_LEDS_CLASS=m
> CONFIG_LEDS_TI_LMU_COMMON=y
> CONFIG_LEDS_LM3697=y
> 
> 
> It looks to me like this is needed:
> 
> 	depends on LEDS_CLASS && I2C && OF
> ?
> 

Thanks for the hint.

I believe the following amendment would fit best:

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index e2f19f3cc6ca..ab0ac84e4c62 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -785,6 +785,7 @@ config LEDS_NIC78BX

  config LEDS_TI_LMU_COMMON
         tristate "LED driver for TI LMU"
+       depends on LEDS_CLASS
         depends on REGMAP
         help
           Say Y to enable the LED driver for TI LMU devices.
@@ -794,6 +795,7 @@ config LEDS_TI_LMU_COMMON
  config LEDS_LM3697
         tristate "LED driver for LM3697"
         depends on LEDS_TI_LMU_COMMON
+       depends on I2C && OF
         help
           Say Y to enable the LM3697 LED driver for TI LMU devices.
           This supports the LED device LM3697.

But for now I'm dropping the patch set anyway until we agree on how
it should be merged across subsystems.

-- 
Best regards,
Jacek Anaszewski
