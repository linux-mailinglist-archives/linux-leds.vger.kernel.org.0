Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF04616F27
	for <lists+linux-leds@lfdr.de>; Wed,  8 May 2019 04:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfEHCkW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 22:40:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:47226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726797AbfEHCkO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 7 May 2019 22:40:14 -0400
Subject: Re: [GIT PULL] LED updates for 5.2-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557283214;
        bh=41KB9ta9PUVwCDIjxwJIAb8ONIPbnVPBH7t9Hd/pw4g=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=0p6QvAvnghpFDZyFPsuSL6m4I8xi+ny/nWBL15xw1cYciBlNwo8JeTyNmyaVja9mP
         N+zGB23hp55yiIa9SniYhRv0lkr/Cqe/cunh/GGRh3WHbL/fw2CAp2MXXCCPZzkZHj
         eJ51ioDEa+eOwZITf/WRX3w5GJquIZLfkUtYJL34=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190507184225.5309-1-jacek.anaszewski@gmail.com>
References: <20190507184225.5309-1-jacek.anaszewski@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190507184225.5309-1-jacek.anaszewski@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
 tags/leds-for-5.2-rc1
X-PR-Tracked-Commit-Id: 0db37915d912e8dc6588f25da76d3ed36718d92f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8b35ad6232c462b02e397e87ce702bcddd4ba543
Message-Id: <155728321455.19924.14122329382278571078.pr-tracker-bot@kernel.org>
Date:   Wed, 08 May 2019 02:40:14 +0000
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        colin.king@canonical.com, daniel@zonque.org, dmurphy@ti.com,
        info@metux.net, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, yuehaibing@huawei.com
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Tue,  7 May 2019 20:42:25 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds-for-5.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8b35ad6232c462b02e397e87ce702bcddd4ba543

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
