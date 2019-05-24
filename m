Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9221929B5D
	for <lists+linux-leds@lfdr.de>; Fri, 24 May 2019 17:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390243AbfEXPmt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 May 2019 11:42:49 -0400
Received: from merlin.infradead.org ([205.233.59.134]:51138 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389206AbfEXPms (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 May 2019 11:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6LF1uAQ2oica475Ehbh+NoOEhdE3ZAb3FjLSENrt/0M=; b=1n9ifoFQv+/PqlphLj4Vv6dDg+
        xNMyEWYx+A3Ha1qhWKM+L70RJ+VUo3PyXic61tvYA7CDuTtHwHSYq0QATSQm8nzSxYJSF5dG88hfu
        NyhAQrSDcEjH9g2Kdbrqo28eic5i8xh5iBRjdfeGsxWRZmR41wa17P3ot1TZNTj7WciXGJlJaks0m
        2TzQD+aEPzjZ1OjsQzhWViqZn+3v5I1UkJE3AA+P/4GUXaw446wKIhcn1a/K3rhsAzw20QU7VjRN3
        5x81GgJ2pFBRr2+f62aWiLHngaItcqct0GnBgLf1nIgaRjhoPJU8rsSqJqligy3TOG5jVECTZsEjb
        HYGQBvxw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hUCLF-00017C-Vi; Fri, 24 May 2019 15:42:46 +0000
Subject: Re: linux-next: Tree for May 24 (leds-lm3697)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
References: <20190524140727.19d1e349@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f8300d14-972d-1c03-3266-836b94c1ec9a@infradead.org>
Date:   Fri, 24 May 2019 08:42:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524140727.19d1e349@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/23/19 9:07 PM, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next release on Monday.
> 
> Changes since 20190523:
> 
> The input-current tree gained a build failure so I reverted a commit.
> 
> The drm-fixes tree gained a build failure so I reverted a commit.
> 
> The v4l-dvb tree gained a conflict against Linus' tree.
> 
> Non-merge commits (relative to Linus' tree): 1814
>  1870 files changed, 61172 insertions(+), 32723 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
> 
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log
> files in the Next directory.  Between each merge, the tree was built
> with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
> multi_v7_defconfig for arm and a native build of tools/perf. After
> the final fixups (if any), I do an x86_64 modules_install followed by
> builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
> ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
> and sparc64 defconfig. And finally, a simple boot test of the powerpc
> pseries_le_defconfig kernel in qemu (with and without kvm enabled).
> 
> Below is a summary of the state of the merge.
> 
> I am currently merging 290 trees (counting Linus' and 70 trees of bug
> fix patches pending for the current merge release).
> 
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
> 
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to add
> more builds.
> 
> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> Gortmaker for triage and bug fixes.
> 

seen on i386:

ld: drivers/leds/leds-lm3697.o: in function `lm3697_probe':
leds-lm3697.c:(.text+0x451): undefined reference to `devm_of_led_classdev_register'

CONFIG_LEDS_CLASS=m
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_LM3697=y


It looks to me like this is needed:

	depends on LEDS_CLASS && I2C && OF
?

-- 
~Randy
