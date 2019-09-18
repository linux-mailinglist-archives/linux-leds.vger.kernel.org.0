Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69C8EB598D
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 04:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbfIRCPU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Sep 2019 22:15:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:60400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727923AbfIRCPU (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 17 Sep 2019 22:15:20 -0400
Subject: Re: [GIT PULL] LED updates for 5.4-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568772920;
        bh=DR0loGiqK2wljNx0oNuGljAGhXvz3TqGOc/3YTZwPpc=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=hNntSZpx+n03sWbyaLHPWbdShwwGZXHSuQm5c1yR57mUQSfC0z542b+GCy2pCQo9f
         t/OIQU3kHGo5v+374Zsymog68tTk5JJ3DRz+M5T6U6y/nPIuWqxZdAkLJ7jzSVu1Ek
         uL90yuHAtXagw0szni1m35GaxC6lWcC6PBnT5+OQ=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190916222133.9119-1-jacek.anaszewski@gmail.com>
References: <20190916222133.9119-1-jacek.anaszewski@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190916222133.9119-1-jacek.anaszewski@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
 tags/leds-for-5.4-rc1
X-PR-Tracked-Commit-Id: 6d4faf3b6b6eb3c8a750b2e6659a5b1ff3dd9e75
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4feaab05dc1eda3dbb57b097377766002e7a7cb9
Message-Id: <156877291998.2898.7202928342345810092.pr-tracker-bot@kernel.org>
Date:   Wed, 18 Sep 2019 02:15:19 +0000
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, ada@thorsis.com,
        andriy.shevchenko@linux.intel.com, bgolaszewski@baylibre.com,
        christophe.jaillet@wanadoo.fr, dmurphy@ti.com,
        gustavo@embeddedor.com, info@metux.net, jacek.anaszewski@gmail.com,
        joe@perches.com, kw@linux.com, linus.walleij@linaro.org,
        nishkadg.linux@gmail.com, nstoughton@logitech.com, oleg@kaa.org.ua,
        suzuki.poulose@arm.com, tony@atomide.com, wenwen@cs.uga.edu,
        wsa+renesas@sang-engineering.com, yamada.masahiro@socionext.com
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Tue, 17 Sep 2019 00:21:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds-for-5.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4feaab05dc1eda3dbb57b097377766002e7a7cb9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
