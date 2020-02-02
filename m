Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 041F014FF16
	for <lists+linux-leds@lfdr.de>; Sun,  2 Feb 2020 21:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbgBBUUR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 2 Feb 2020 15:20:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:57266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726967AbgBBUUQ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 2 Feb 2020 15:20:16 -0500
Subject: Re: [GIT PULL] LEDs changes for v5.6-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580674816;
        bh=GKuUAL4dTjqBl5hx3T3nm07ePFkvXZLt7KTf8eRwp3o=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Bg+Jyo/ZmkU1l3edxBYuQ6E7QBsVl4LhBqtRYsLtxioKAXUlx/e5W+b7hfkmbyZow
         8su2y/zALMf/CbqCUdvhr4bfi7ToI+ZuJB1VLtS8sIhUzydGE1wj8XVlLJsFZwricS
         CeFGB+P3YgJ2zGtoesgld0t3x03W8mIBiIvyj2cU=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200202190943.GA4506@duo.ucw.cz>
References: <20200202190943.GA4506@duo.ucw.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200202190943.GA4506@duo.ucw.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/
 tags/leds-5.6-rc1
X-PR-Tracked-Commit-Id: 260718b3a35d23fe89d27cc7b5e8bd30f4bba1aa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 545ae66582f7627870b719d318954d0252902519
Message-Id: <158067481634.26837.14390277512508430424.pr-tracker-bot@kernel.org>
Date:   Sun, 02 Feb 2020 20:20:16 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Sun, 2 Feb 2020 20:09:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.6-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/545ae66582f7627870b719d318954d0252902519

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
